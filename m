Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CAF2117F
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 03:00:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A3206B0B;
	Fri, 17 May 2019 01:00:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE79CAD0
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from prod-mx.aristanetworks.com (mx.aristanetworks.com
	[162.210.129.12])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A3E325E4
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:00:24 +0000 (UTC)
Received: from prod-mx.aristanetworks.com (localhost [127.0.0.1])
	by prod-mx.aristanetworks.com (Postfix) with ESMTP id DD66B41CAC0;
	Thu, 16 May 2019 17:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1558054427;
	bh=0YAEwRV8pxaKDZriNp5u14v56Dsy6P+WWcBl+ItO2zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yAzMLwXztwgoG54qdkpjOlajk7uFBwFv2KEytXFrkmlS7SD5EHt+FP7QcUEinc6l3
	vqVjwE9+4RzVVITPiEK1hwsg2tL1jEvRn3LHepmF8S+TwsSfI5pi8EGV22Yx2mUZOU
	5bZE+JhNROjg68WSlWv1RLBQ3WNzRBnb9jHoW63bAnOm3OfcduzAlsjdMBL7+PaayW
	g1LemAio75Ug6p9bgCoJM4PO7gItqfusdpnqDrsgKY4IfLlDdlOs2vtgo35OmM7pwe
	qqu0k9tcDvF6CMX0gybCwgoa9rO9UDRjLFpPVnLequ77jynRoZ5r6dLpt70g/KhtwZ
	BGVRhTxmaPbug==
Received: from chmeee (unknown [10.95.92.211])
	by prod-mx.aristanetworks.com (Postfix) with ESMTP id D141D41CABA;
	Thu, 16 May 2019 17:53:47 -0700 (PDT)
Received: from kevmitch by chmeee with local (Exim 4.92)
	(envelope-from <kevmitch@chmeee>)
	id 1hRR7o-0001le-HJ; Thu, 16 May 2019 17:53:28 -0700
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/3] iommu/amd: make iommu_disable safer
Date: Thu, 16 May 2019 17:52:40 -0700
Message-Id: <20190517005242.20257-2-kevmitch@arista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517005242.20257-1-kevmitch@arista.com>
References: <20190517005242.20257-1-kevmitch@arista.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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
From: Kevin Mitchell via iommu <iommu@lists.linux-foundation.org>
Reply-To: Kevin Mitchell <kevmitch@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Make it safe to call iommu_disable during early init error conditions
before mmio_base is set, but after the struct amd_iommu has been added
to the amd_iommu_list. For example, this happens if firmware fails to
fill in mmio_phys in the ACPI table leading to a NULL pointer
dereference in iommu_feature_disable.

Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
---
 drivers/iommu/amd_iommu_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index f773792d77fd..3798d7303c99 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -424,6 +424,9 @@ static void iommu_enable(struct amd_iommu *iommu)
 
 static void iommu_disable(struct amd_iommu *iommu)
 {
+	if (!iommu->mmio_base)
+		return;
+
 	/* Disable command buffer */
 	iommu_feature_disable(iommu, CONTROL_CMDBUF_EN);
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
