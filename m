Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B174F0E80
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 07:06:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A48408F0;
	Mon,  4 Apr 2022 05:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehEdex8_m2GP; Mon,  4 Apr 2022 05:06:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D4E8404C7;
	Mon,  4 Apr 2022 05:06:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73B0FC0082;
	Mon,  4 Apr 2022 05:06:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE856C0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C52F460B98
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h03sjKsgvSYv for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 05:06:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB4760A91
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KJNpqDmInpKNb0Ba6QeWsT+B+VJPRpifPEMByOx0SBg=; b=2xQrfIxcemUjQVz4pRH4tfgiVa
 3XIS0/qYlgyD0IPcbkT+CtyJYQ+N/Mqk258vsL/HrJ9HMlcUeHKFXtKovNh7o7atoMd2f3vKTCcUg
 KHfpkpJdTNcrL38s2CroJ+aqT+9ezFQ2X8ReztMbBgCVgY1ouP8LtD6Hu/GXM0SuMrRr2i9sJFvGZ
 LEIXHmcRo+SqA+FqqjEZAXIcrE7HAkzJRJHErCMVKXPmI5rhQWdqKTyD4gEpiXPodWFJo6gN0/P5g
 EWuZp+Nfd0G7hWSN8tzUu5T5ISbTSQNqmWELzJb7TpltEMHqH4dECM38unbtlxp6dxC9bACDoNciX
 ZXG1SgVA==;
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEug-00D8mu-0p; Mon, 04 Apr 2022 05:06:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: cleanup swiotlb initialization v8
Date: Mon,  4 Apr 2022 07:05:44 +0200
Message-Id: <20220404050559.132378-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
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

Hi all,

this series tries to clean up the swiotlb initialization, including
that of swiotlb-xen.  To get there is also removes the x86 iommu table
infrastructure that massively obsfucates the initialization path.

Git tree:

    git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

Changes since v7:
 - rebased to Linux 5.18-rc1
 - better document the lower bound swiotlb size for xen-swiotlb
 - improve the nslabs calculation for the retry case in
   swiotlb_init_remap and swiotlb_init_late

Changes since v6:
 - use IO_TLB_MIN_SLABS instead of open coding the constant
 - call the remap callback later in swiotlb_init_late
 - set SWIOTLB_ANY for xen/x86

Changes since v5:
 - split a patch into three
 - fix setting x86_swiotlb_enable for Xen
 - fix a comment about forced bounce buffering for guest memory
   encryption
 - remove the xen_initial_domain check from
   xen_create_contiguous_region

Changes since v3:
 - fix a compilation issue on some powerpc configfs
 - fix and cleanup how forced bounce buffering is enabled for
   guest memory encryption

Changes since v2:
 - make ppc_swiotlb_flags actually work again
 - also force enable swiotlb for guest encrypted memory to cater
   to hyperv which doesn't set the host encrypted memory flag

Changes since v1:
 - skip IOMMU initialization on Xen PV kernels
 - various small whitespace / typo fixes

Diffstat:
 arch/ia64/include/asm/iommu_table.h      |    7 -
 arch/x86/include/asm/iommu_table.h       |  102 -------------------
 arch/x86/include/asm/swiotlb.h           |   30 -----
 arch/x86/kernel/pci-iommu_table.c        |   77 --------------
 arch/x86/kernel/pci-swiotlb.c            |   77 --------------
 arch/x86/xen/pci-swiotlb-xen.c           |   96 ------------------
 b/arch/arm/mm/init.c                     |    6 -
 b/arch/arm/xen/mm.c                      |   26 ++--
 b/arch/arm64/mm/init.c                   |    6 -
 b/arch/ia64/mm/init.c                    |    4 
 b/arch/mips/cavium-octeon/dma-octeon.c   |   15 --
 b/arch/mips/loongson64/dma.c             |    2 
 b/arch/mips/pci/pci-octeon.c             |    2 
 b/arch/mips/sibyte/common/dma.c          |    2 
 b/arch/powerpc/include/asm/svm.h         |    4 
 b/arch/powerpc/include/asm/swiotlb.h     |    1 
 b/arch/powerpc/kernel/dma-swiotlb.c      |    1 
 b/arch/powerpc/mm/mem.c                  |    6 -
 b/arch/powerpc/platforms/pseries/setup.c |    3 
 b/arch/powerpc/platforms/pseries/svm.c   |   26 ----
 b/arch/riscv/mm/init.c                   |    8 -
 b/arch/s390/mm/init.c                    |    3 
 b/arch/x86/include/asm/dma-mapping.h     |   12 --
 b/arch/x86/include/asm/gart.h            |    5 
 b/arch/x86/include/asm/iommu.h           |    8 +
 b/arch/x86/include/asm/xen/page.h        |    5 
 b/arch/x86/include/asm/xen/swiotlb-xen.h |    2 
 b/arch/x86/kernel/Makefile               |    2 
 b/arch/x86/kernel/amd_gart_64.c          |    5 
 b/arch/x86/kernel/aperture_64.c          |   14 --
 b/arch/x86/kernel/cpu/mshyperv.c         |    8 -
 b/arch/x86/kernel/pci-dma.c              |  114 +++++++++++++++++----
 b/arch/x86/kernel/tboot.c                |    1 
 b/arch/x86/kernel/vmlinux.lds.S          |   12 --
 b/arch/x86/mm/mem_encrypt_amd.c          |    3 
 b/arch/x86/pci/sta2x11-fixup.c           |    2 
 b/arch/x86/xen/Makefile                  |    2 
 b/drivers/iommu/amd/init.c               |    6 -
 b/drivers/iommu/amd/iommu.c              |    5 
 b/drivers/iommu/intel/dmar.c             |    6 -
 b/drivers/xen/swiotlb-xen.c              |  132 -------------------------
 b/include/linux/dmar.h                   |    6 -
 b/include/linux/swiotlb.h                |   22 ++--
 b/include/trace/events/swiotlb.h         |   29 +----
 b/include/xen/arm/page.h                 |    1 
 b/include/xen/swiotlb-xen.h              |    8 +
 b/kernel/dma/direct.h                    |    2 
 b/kernel/dma/swiotlb.c                   |  163 ++++++++++++++-----------------
 48 files changed, 252 insertions(+), 827 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
