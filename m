Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C755B3CD4C5
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 14:31:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FF6402A6;
	Mon, 19 Jul 2021 12:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UllA-AdNNMJw; Mon, 19 Jul 2021 12:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4195E4029E;
	Mon, 19 Jul 2021 12:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B6DCC000E;
	Mon, 19 Jul 2021 12:31:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04195C001F
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB456838F2
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erYQSjZZl9HR for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 12:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D2A3838E6
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E1406113B;
 Mon, 19 Jul 2021 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626697914;
 bh=Fvlwqxv6dtBkcuTBN0WukWjl7VtfhFwYgJ4yPUmzFCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f7wgN6ozs+p72UTrZkw6fhSq0QhpUUI4leSgu0mSjM8QMdiSylyU8awgzAWqm8kmp
 ga0vRqnkiA8AsBPwTt/8mOnK3LlJ3MNJG5INTapxgUb0awST0q/+iVXPTnuOSFvWTs
 MzkhTZZv1a4PyUX0hUEfRqin2fT0um8r4dUODY47Kcm7DdOfD2ub4xGn3dqNrt94wM
 KkeGOGa78YmV1BBPVBctQY2VGpZI15y/xHYSKJ7158D+Zmhw5FeUn29AXeG4/sJtqK
 /HLmGeoFgRMPVOD3a9aEUvxuMqcLsswyBSaOlTQuicPEg6ja7kCl/HvooIe+MXnads
 kkMYe6vFiBP2w==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 4/5] swiotlb: Emit diagnostic in swiotlb_exit()
Date: Mon, 19 Jul 2021 13:30:53 +0100
Message-Id: <20210719123054.6844-5-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719123054.6844-1-will@kernel.org>
References: <20210719123054.6844-1-will@kernel.org>
MIME-Version: 1.0
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Claire Chang <tientzu@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
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

A recent debugging session would have been made a little bit easier if
we had noticed sooner that swiotlb_exit() was being called during boot.

Add a simple diagnostic message to swiotlb_exit() to complement the one
from swiotlb_print_info() during initialisation.

Cc: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20210705190352.GA19461@willie-the-truck
Suggested-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7948f274f9bb..b3c793ed9e64 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -334,6 +334,7 @@ void __init swiotlb_exit(void)
 	if (!mem->nslabs)
 		return;
 
+	pr_info("tearing down default memory pool\n");
 	size = array_size(sizeof(*mem->slots), mem->nslabs);
 	if (mem->late_alloc)
 		free_pages((unsigned long)mem->slots, get_order(size));
-- 
2.32.0.402.g57bb445576-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
