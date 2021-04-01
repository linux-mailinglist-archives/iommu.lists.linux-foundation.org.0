Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F23516D8
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 18:48:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923E260BE1;
	Thu,  1 Apr 2021 16:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2_EXxteEeKK; Thu,  1 Apr 2021 16:48:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB3460BDB;
	Thu,  1 Apr 2021 16:48:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85425C0012;
	Thu,  1 Apr 2021 16:48:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C490FC000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0AE54017C
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUHz5D_nxRez for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 16:48:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B16A40122
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EB056120D;
 Thu,  1 Apr 2021 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617295712;
 bh=OFqYUOwYn9oEx+PLsMwm+WXRPl6/QMh7r3jP3kWDjeg=;
 h=From:To:Cc:Subject:Date:From;
 b=sjGe147voYOBiPC4sk7lY4ivUJbnksurRIjTBS7L+Sy7dGICFTP6t2LkDu7gF9bHM
 M8nQ3SR/2xtPMWayGqaLqKE6RDpAPMgqPYG6hFeICSGQrp1SToxXCWQ6oNH3A2SD5q
 quODb64oPPfIVw599o9hwL1TCtMMVjxyLYCD91HQsq/LI48YS5jNmef/wTerloNrG3
 pnEovL2rWq+SgI7eS7XNsei5ZJE6Ll6tzmDBp51PVFy7YwS+KqqYUMxVSykZl3kfFd
 jlWbdGNMOR6chnyMD9EmthP6snAfxGrm3mHQT2N+GrOTin/JS8LQz3Pqi4dUDDGzZy
 9GP4PKGwBo4oA==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH 0/6] iommu_pgsize() improvements to help towards
 ->[un]map_pages()
Date: Thu,  1 Apr 2021 17:47:32 +0100
Message-Id: <20210401164738.9513-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Pratik Patel <pratikp@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi Isaac,

I had a go at removing the loop you have in pgsize_bitmap() over at:

https://lore.kernel.org/r/20210331030042.13348-4-isaacm@codeaurora.org

and I ended up with this. It's _very_ lightly tested, but I thought it
might be useful to you, especially if you're going to be adding support
for '->map_pages' as well.

Cheers,

Will

Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>

--->8

Isaac J. Manjarres (2):
  iommu/io-pgtable: Introduce unmap_pages() as a page table op
  iommu: Add an unmap_pages() op for IOMMU drivers

Will Deacon (4):
  iommu: Use bitmap to calculate page size in iommu_pgsize()
  iommu: Split 'addr_merge' argument to iommu_pgsize() into separate
    parts
  iommu: Hook up '->unmap_pages' driver callback
  iommu: Accomodate larger pages in iommu_pgsize() 'count' calculation

 drivers/iommu/iommu.c      | 87 +++++++++++++++++++++++++++-----------
 include/linux/io-pgtable.h |  4 ++
 include/linux/iommu.h      |  4 ++
 3 files changed, 70 insertions(+), 25 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
