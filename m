Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 17182AF0A9
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 19:49:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F55ADB9;
	Tue, 10 Sep 2019 17:49:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 70600CAF
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 42ADF8B0
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
	t=1568137783; x=1599673783;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=spd7R0coipqRS2/jPayP80CdFsO0oofRfjp94TF6K30=;
	b=hVlJLpjFBR8+UxjQoPPhSywKpos3Mw5RjhstdyCy30mX+NAxs+qtA6gM
	jXezeVnX59yMy+SfFGLr24bw9TMTQT8KenrEupqJCA9lNpQtKn3MfQ28a
	H4IeRhXRl9dBvg4uqsVzt+kcQTLYROCTvOClfNkzQvub70xi8mHIDU+Cu w=;
X-IronPort-AV: E=Sophos;i="5.64,490,1559520000"; d="scan'208";a="414553655"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
	email-inbound-relay-2a-119b4f96.us-west-2.amazon.com)
	([10.124.125.6])
	by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
	10 Sep 2019 17:49:41 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
	(pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
	by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with
	ESMTPS id D3A461A094A; Tue, 10 Sep 2019 17:49:40 +0000 (UTC)
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with
	ESMTP id x8AHncaT023816; Tue, 10 Sep 2019 19:49:38 +0200
Received: (from sironi@localhost)
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
	x8AHncFe023814; Tue, 10 Sep 2019 19:49:38 +0200
To: sironi@amazon.de, joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] iommu/amd: Wait for completion of IOTLB flush in
	attach_device
Date: Tue, 10 Sep 2019 19:49:21 +0200
Message-Id: <1568137765-20278-2-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568137765-20278-1-git-send-email-sironi@amazon.de>
References: <1568137765-20278-1-git-send-email-sironi@amazon.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
From: Filippo Sironi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Filippo Sironi <sironi@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Signed-off-by: Filippo Sironi <sironi@amazon.de>
---
 drivers/iommu/amd_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 61de81965c44..f026a8c2b218 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2169,6 +2169,8 @@ static int attach_device(struct device *dev,
 	 */
 	domain_flush_tlb_pde(domain);
 
+	domain_flush_complete(domain);
+
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
