Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9AB230F
	for <lists.iommu@lfdr.de>; Fri, 13 Sep 2019 17:11:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ED00BAF0;
	Fri, 13 Sep 2019 15:11:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D20BE1000
	for <iommu@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 14:42:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 54BCA7D2
	for <iommu@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
	t=1568385763; x=1599921763;
	h=from:to:cc:subject:date:message-id;
	bh=AgYDJwrP16nr3wEFUDuAQZW38lbNI5musPgj081K1U4=;
	b=boJMckatLvw167QccuH6m2/R9xCVD/TxwQ6+X2j1zK7LKJzWrrnqh9wq
	NdTG8zGfbSS8l1LI638bY2aU3DHf8JT3cBBWkS3FZ8yQPRD8xP6DTY18Q
	Dq51biHRJqlzWYS211WifGrOfLC/NUcOZbTCjfNeDbVOz2nPumSc7fGK1 g=;
X-IronPort-AV: E=Sophos;i="5.64,501,1559520000"; d="scan'208";a="415115255"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
	email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com)
	([10.124.125.6])
	by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
	13 Sep 2019 14:42:41 +0000
Received: from u793be3441f0353.ant.amazon.com
	(pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
	by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with
	ESMTPS id 8DBBEA1F0D; Fri, 13 Sep 2019 14:42:40 +0000 (UTC)
Received: from u793be3441f0353.ant.amazon.com (localhost [127.0.0.1])
	by u793be3441f0353.ant.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTPS
	id x8DEgcwo021463
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2019 16:42:38 +0200
Received: (from adulea@localhost)
	by u793be3441f0353.ant.amazon.com (8.15.2/8.15.2/Submit) id
	x8DEgcN2021462; Fri, 13 Sep 2019 16:42:38 +0200
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/4] iommu/amd: re-mapping fixes
Date: Fri, 13 Sep 2019 16:42:27 +0200
Message-Id: <20190913144231.21382-1-adulea@amazon.de>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Fri, 13 Sep 2019 15:11:34 +0000
Cc: iommu@lists.linux-foundation.org,
	=?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>,
	Andrei Dulea <adulea@amazon.de>
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
From: Andrei Dulea via iommu <iommu@lists.linux-foundation.org>
Reply-To: Andrei Dulea <adulea@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patch series tries to address a few issues encountered when
replacing existing mappings:
.> pages leak in free_pagetable()
.> allow downgrading default page-sizes in alloc_pte()
.> tear-down all the replicated PTEs of a large mapping when downgrading
to smaller mappings

Andrei Dulea (4):
  iommu/amd: Fix pages leak in free_pagetable()
  iommu/amd: Fix downgrading default page-sizes in alloc_pte()
  iommu/amd: Introduce first_pte_l7() helper
  iommu/amd: Unmap all L7 PTEs when downgrading page-sizes

 drivers/iommu/amd_iommu.c | 73 +++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 15 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
