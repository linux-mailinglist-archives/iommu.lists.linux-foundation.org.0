Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB543189
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 23:55:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E87092997;
	Wed, 12 Jun 2019 21:55:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6408627C8
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 21:52:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.aristanetworks.com (smtp.aristanetworks.com [52.0.43.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D9FC9E6
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 21:52:32 +0000 (UTC)
Received: from smtp.aristanetworks.com (localhost [127.0.0.1])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 4416C30DD5A8;
	Wed, 12 Jun 2019 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1560376352;
	bh=0YAEwRV8pxaKDZriNp5u14v56Dsy6P+WWcBl+ItO2zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o0tcrE69nlTRCy8oBfpiQeJnWgJI43UMXL1JcrYTR2TXwxuLOjTUIkPuuv7MXRqf3
	YDdo4KeSF7MlOXZXb7AcDS73JCOrcTPDsNRD4rK+wv47rTdNi/Dc4KogK0ScKquYPV
	Ayw16OMjHVDyyC60fkrTALrVED6wYi0cwq1M46w3MRBQiHsWK1VL5/PNAqeW/k71J+
	4XnRx4EtiNG+hmSo4aT7WSqrihEBBWcbcaJ+WnRm/tK4ynARFh/fm+IltVeyrfW6d2
	B0MazUx5XKO6Am0eX+nacKTrwXnAepR4LkQz0xllOJX0zJAdCpdDjGtbXR9W0xEe3g
	5b148ONyu7h9A==
Received: from chmeee (unknown [10.80.4.152])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 2AD1730DD5A5;
	Wed, 12 Jun 2019 14:52:32 -0700 (PDT)
Received: from kevmitch by chmeee with local (Exim 4.92)
	(envelope-from <kevmitch@chmeee>)
	id 1hbBAV-0003KF-JQ; Wed, 12 Jun 2019 14:52:31 -0700
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/3] iommu/amd: make iommu_disable safer
Date: Wed, 12 Jun 2019 14:52:03 -0700
Message-Id: <20190612215203.12711-2-kevmitch@arista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612215203.12711-1-kevmitch@arista.com>
References: <20190612215203.12711-1-kevmitch@arista.com>
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
