Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0041EF0D
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 16:01:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF104400D0;
	Fri,  1 Oct 2021 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgjAZ7LKkIpc; Fri,  1 Oct 2021 14:01:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C3A2B4015F;
	Fri,  1 Oct 2021 14:01:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86477C0022;
	Fri,  1 Oct 2021 14:01:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F125AC000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA48640333
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-la6LXK3EjO for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 14:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A46B4032F
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:01:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0EBD61A03;
 Fri,  1 Oct 2021 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633096903;
 bh=BsLzucRJ7iKQ3GfXIzsq7Cvk+aim72OP90PDiMEECj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j5GdhvssI4RdbYJP3J1S9LJ0NqL4nQUK7KN50vCwzskamQeWQMudtzvO7P0BFxuuV
 K0Xyofnxi0Ih3eOzHDGWHcAwgmUYYqqqZyqwWwKmXY1imuBSvdqCwVUXML4PcJW9Ys
 Tw1z0OgxoaEGRT2gWxPmnipsLa+vNwyBjonCXsCr4a3qbyrH6dKLB/ZHHSNzBAcYTX
 tkcsVj6kqfbNSXaiDKQ18nz9QUqKZDLArkXPbpJcacFejUZE5cZ2mM4NGDhGDNcHB3
 QyLBlk/1XEqB4Coh2Cvl6FooRW0+upYa4OFgj+VeLVgsiEZ0S42SIMIjMWkTNZsuMK
 igtmUN0yh/6Uw==
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: retry dropping HAVE_ARCH_PFN_VALID
Date: Fri,  1 Oct 2021 15:01:32 +0100
Message-Id: <163309648548.1106750.5985957686338166630.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930013039.11260-1-rppt@kernel.org>
References: <20210930013039.11260-1-rppt@kernel.org>
MIME-Version: 1.0
Cc: Alex Bee <knaerzche@gmail.com>, Will Deacon <will@kernel.org>,
 David Hildenbrand <david@redhat.com>, catalin.marinas@arm.com,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@android.com, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, 30 Sep 2021 04:30:37 +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> This is a new attempt to drop HAVE_ARCH_PFN_VALID on arm64 and start using
> the generic implementation of pfn_valid().
> 
> [...]

Applied to arm64 (for-next/pfn-valid), thanks!

[1/2] dma-mapping: remove bogus test for pfn_valid from dma_map_resource
      https://git.kernel.org/arm64/c/a9c38c5d267c
[2/2] arm64/mm: drop HAVE_ARCH_PFN_VALID
      https://git.kernel.org/arm64/c/3de360c3fdb3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
