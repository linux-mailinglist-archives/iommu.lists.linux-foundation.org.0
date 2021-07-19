Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB333CD4C1
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 14:31:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEA04031C;
	Mon, 19 Jul 2021 12:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CF0I7Siz_VK1; Mon, 19 Jul 2021 12:31:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6A68C4032E;
	Mon, 19 Jul 2021 12:31:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34037C001F;
	Mon, 19 Jul 2021 12:31:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5EC8C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D0B40326
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIPnV4FNwuAe for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 12:31:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB7FE4031C
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CEBE6113E;
 Mon, 19 Jul 2021 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626697906;
 bh=fheK/HYwVWc3ZOM2xABTkv7fnCAc75GRLPfud8UIPVQ=;
 h=From:To:Cc:Subject:Date:From;
 b=o5PHI94XBhXiBZwXAEpM5tiBAZxG0yn/0lyJ+lHBaOrGQMzFVaWYfMsv8a0MCeX5K
 TJC+mgoilx+nJIag8FKZ/jHflf0pf4jwyBUEvFzSOOaxdclleY5E5Pts40JZ1wUPtC
 SVEXWDE7N03DMIPHkPf6pk6k1cw/Xt099Iyq5YQMXStCQyYHK35GxiCWso3HVRsFfi
 usVXi51WmNGr+We1pmezkF3EUOV9zDrvmbSv4n0JRsqvRtTmCNKH+H3CLAfspb/3+M
 VhxQCLjb5Jqvi6AdzeGLKKLVct+483CuPq40Vi5qHOwURX2wvV96YmcXLysKVzBHTz
 yAVXrfiyJwtBg==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/5] Fix restricted DMA vs swiotlb_exit()
Date: Mon, 19 Jul 2021 13:30:49 +0100
Message-Id: <20210719123054.6844-1-will@kernel.org>
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

Hi all,

This series fixes the issues which have been reported against the
Restricted DMA series in -next:

  * Fix the build for Sparc as reported by Guenter [1].

  * Rework the lifetime of 'io_tlb_default_mem' so that devices
    can retain valid references to it even after swiotlb_exit(). This,
    in turn, fixes the x86/AMD IOMMU regressions reported by Nathan [2].

I also then added a diagnostic to swiotlb_exit(), as suggested by Konrad
[3] and the final patch frees the underlying buffer memory during the
tear down, but I must confess that I don't know why this wasn't being
done already.

A massive thank you to Nathan for helping to debug this and also for
testing these patches to confirm that they address the issue on his
machine.

Patches are based against swiotlb devel/for-linus-5.15.

Cheers,

Will

[1] https://lore.kernel.org/r/20210702030807.GA2685166@roeck-us.net
[2] https://lore.kernel.org/r/YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain
[3] https://lore.kernel.org/r/YORsr0h7u5l9DZwh@char.us.oracle.com

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>

--->8

Will Deacon (5):
  of: Return success from of_dma_set_restricted_buffer() when
    !OF_ADDRESS
  swiotlb: Point io_default_tlb_mem at static allocation
  swiotlb: Remove io_tlb_default_mem indirection
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
