Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82D3CFACB
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 15:38:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E98E7401DB;
	Tue, 20 Jul 2021 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNcN89t2DWwU; Tue, 20 Jul 2021 13:38:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DC6B9402BA;
	Tue, 20 Jul 2021 13:38:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9713C000E;
	Tue, 20 Jul 2021 13:38:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9B85C000E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD38C82FF9
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXfds6mXATkZ for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 13:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08E4B82FCE
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A983610C7;
 Tue, 20 Jul 2021 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626788314;
 bh=X1OfJw0RM1DPXO0z6hDn73lwdA7qoOG1pYnQLWh5Ur8=;
 h=From:To:Cc:Subject:Date:From;
 b=KKnaiyeZfIQrjBKwWAn3ylTLFVOvyEjYO9lhgTX0JLI+8ScqxgsjTeNmRS/Bemr9Z
 ++NJ3g81fbxoVXXajwOBbWJ6AcdPtm5elBg5MQOEYm1k8Wtj/pxgR03fiiFF8BN48+
 8naEoeaWMqZFjTqyUyr6Nyizk1CHAaCm5TLSyO0HONHjCbgCnAvczL3EB3+612jg42
 5+VGKEnOMPXilon0hNHIXFYgGowJvKLeLRh19n1vb+ZKZJYZOKbu6Shi/VFOyerqkS
 K0z9IDubo1zjoFfLrLboxTtluJ2klsja8K/Cj2mFHySACWSWfm5+bjoqzrlLdHjIik
 AqV5u/LyZRWMg==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 0/4] Fix restricted DMA vs swiotlb_exit()
Date: Tue, 20 Jul 2021 14:38:22 +0100
Message-Id: <20210720133826.9075-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
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

Hi again, folks,

This is version two of the patch series I posted yesterday:

  https://lore.kernel.org/r/20210719123054.6844-1-will@kernel.org

The only changes since v1 are:

  * Squash patches 2 and 3, amending the commit message accordingly
  * Add Reviewed-by and Tested-by tags from Christoph and Claire (thanks!)

I'd usually leave it a bit longer between postings, but since this fixes
issues with patches in -next I thought I'd spin a new version immediately.

Cheers,

Will

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>

--->8

Will Deacon (4):
  of: Return success from of_dma_set_restricted_buffer() when
    !OF_ADDRESS
  swiotlb: Convert io_default_tlb_mem to static allocation
  swiotlb: Emit diagnostic in swiotlb_exit()
  swiotlb: Free tbl memory in swiotlb_exit()

 drivers/base/core.c       |  2 +-
 drivers/of/of_private.h   |  3 +-
 drivers/xen/swiotlb-xen.c |  4 +-
 include/linux/swiotlb.h   |  4 +-
 kernel/dma/swiotlb.c      | 82 +++++++++++++++++++++++----------------
 5 files changed, 56 insertions(+), 39 deletions(-)

-- 
2.32.0.402.g57bb445576-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
