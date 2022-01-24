Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C300498503
	for <lists.iommu@lfdr.de>; Mon, 24 Jan 2022 17:40:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC8E7405EF;
	Mon, 24 Jan 2022 16:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpYzsbjsUwsB; Mon, 24 Jan 2022 16:40:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BE7B34048D;
	Mon, 24 Jan 2022 16:40:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 017ACC007D;
	Mon, 24 Jan 2022 16:40:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE09C002F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3A99400F1
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3JrLF9T4KhI for <iommu@lists.linux-foundation.org>;
 Mon, 24 Jan 2022 16:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AA474090E
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 864DAD6E;
 Mon, 24 Jan 2022 08:40:26 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 984B63F793;
 Mon, 24 Jan 2022 08:40:25 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	konrad@kernel.org
Subject: [PATCH 3/3] swiotlb: Simplify array allocation
Date: Mon, 24 Jan 2022 16:40:19 +0000
Message-Id: <432f572de793ec5085a048a51fdd977cba6a5f51.1643028164.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1643028164.git.robin.murphy@arm.com>
References: <cover.1643028164.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: tientzu@chromium.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, guozhengkui@vivo.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Prefer kcalloc() to kzalloc(array_size()) for allocating an array.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 kernel/dma/swiotlb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f56d6504903c..44c49c3616fe 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -820,8 +820,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 		if (!mem)
 			return -ENOMEM;
 
-		mem->slots = kzalloc(array_size(sizeof(*mem->slots), nslabs),
-				     GFP_KERNEL);
+		mem->slots = kcalloc(nslabs, sizeof(*mem->slots), GFP_KERNEL);
 		if (!mem->slots) {
 			kfree(mem);
 			return -ENOMEM;
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
