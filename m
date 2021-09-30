Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6741D0F4
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 03:30:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE514252B;
	Thu, 30 Sep 2021 01:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk51jB4fDAek; Thu, 30 Sep 2021 01:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A2D8A4253D;
	Thu, 30 Sep 2021 01:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EE6DC0022;
	Thu, 30 Sep 2021 01:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D75C000D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C977940763
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcAeMdDo1wcg for <iommu@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 01:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B3C740176
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20A6261555;
 Thu, 30 Sep 2021 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632965445;
 bh=W4G6Gi3WfUEF+ocW3iGHbdJrEsYEKtCwelydWmNSTXY=;
 h=From:To:Cc:Subject:Date:From;
 b=FeOEGvYRt9YBnwi5kb3qw8llRdbAqgOX6GOAwmn4C6e28NCDqfS8q5TUg2/bAbIFc
 OvNHwA/EpqIBHDiAdYuUqhshspz+SGchmTQodNjn+9BI89Een4JTe6+CdWq+uqjd/O
 ELQcKqDQ73VGn9LFULcWdRiwt1PWG2nakPImJSXJYsOz/L+b4+hIrubDMVuWwbi+Xc
 TB3T9h0huptHiBzUo1Q+MKwh+vm2H+UcPWWNQCxdr9aZf2jRpaAhrHY4bcdq6MNF97
 rs0kxTFZvJAdBbiXn8EoQ/8LL2+y2OzRLQtZSrharXYebFR3x1yiN+9kMR+KY+m59L
 caIl6hfQKQ89A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: retry dropping HAVE_ARCH_PFN_VALID
Date: Thu, 30 Sep 2021 04:30:37 +0300
Message-Id: <20210930013039.11260-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Alex Bee <knaerzche@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
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

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

This is a new attempt to drop HAVE_ARCH_PFN_VALID on arm64 and start using
the generic implementation of pfn_valid().

The first patch removes the check for pfn_valid() in dma_map_resource()
which is required to avoid false positives when there is memory map for
MMIO.

Anshuman Khandual (1):
  arm64/mm: drop HAVE_ARCH_PFN_VALID

Mike Rapoport (1):
  dma-mapping: remove bogus test for pfn_valid from dma_map_resource

 arch/arm64/Kconfig            |  1 -
 arch/arm64/include/asm/page.h |  1 -
 arch/arm64/mm/init.c          | 37 -----------------------------------
 kernel/dma/mapping.c          |  4 ----
 4 files changed, 43 deletions(-)


base-commit: 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
