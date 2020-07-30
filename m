Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9FF2331D2
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 14:15:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8284B20764;
	Thu, 30 Jul 2020 12:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmccKNtGC9Xe; Thu, 30 Jul 2020 12:15:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4235920763;
	Thu, 30 Jul 2020 12:15:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27E48C004D;
	Thu, 30 Jul 2020 12:15:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 274B8C004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 12:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0C8DC86CEF
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 12:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6MfWAn_INqP for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 12:15:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D43A186AA5
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 12:15:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTrL6Fgfz9sRN;
 Thu, 30 Jul 2020 22:15:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596111321;
 bh=YNSVJAmG6iTLprr4AXeykiRRbuPWau8/ePuc4CoRMGM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dDG2HeGveH8jvsO0a3nV+Tp8BcGIZDu65BOPDvIIBo9wVTyiHzeoVy9VEea0rigvp
 Y31hCYMQ/HUQJyt9f4Ns+ZWd4J0yauoOrKc1q24QkaP65G5RtKXvj8BnxizCtGPCIs
 4Qc5Gy9BbRkYcfHS9FaL2IesmCw9kHwdS0i+jJ5INj6RLnsR8z4hMy+N03Q+rveLd0
 2v5hfX/mFHnRdxjBR0pUmOS4LXqz54J4KK7TRfoGZVmsUzhhMnBhUvMn3FR8lvfRl/
 Ax9t5/4az9jOznaLXvwqANu/Zl8pK6CgRrdLYmMHTgYkBan25IQFsKLy25EXJBUiYn
 TCPH/khAUMFFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
In-Reply-To: <20200728051153.1590-7-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
Date: Thu, 30 Jul 2020 22:15:13 +1000
Message-ID: <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
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

Mike Rapoport <rppt@kernel.org> writes:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> fadump_reserve_crash_area() reserves memory from a specified base address
> till the end of the RAM.
>
> Replace iteration through the memblock.memory with a single call to
> memblock_reserve() with appropriate  that will take care of proper memory
                                     ^
                                     parameters?
> reservation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

I think this looks OK to me, but I don't have a setup to test it easily.
I've added Hari to Cc who might be able to.

But I'll give you an ack in the hope that it works :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 78ab9a6ee6ac..2446a61e3c25 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
>  /* Preserve everything above the base address */
>  static void __init fadump_reserve_crash_area(u64 base)
>  {
> -	struct memblock_region *reg;
> -	u64 mstart, msize;
> -
> -	for_each_memblock(memory, reg) {
> -		mstart = reg->base;
> -		msize  = reg->size;
> -
> -		if ((mstart + msize) < base)
> -			continue;
> -
> -		if (mstart < base) {
> -			msize -= (base - mstart);
> -			mstart = base;
> -		}
> -
> -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
> -			(msize >> 20), mstart);
> -		memblock_reserve(mstart, msize);
> -	}
> +	memblock_reserve(base, memblock_end_of_DRAM() - base);
>  }
>  
>  unsigned long __init arch_reserved_kernel_pages(void)
> -- 
> 2.26.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
