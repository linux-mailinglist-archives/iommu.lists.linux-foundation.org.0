Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C6230C38
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 16:15:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0F9F2275A;
	Tue, 28 Jul 2020 14:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrJv+v+4HCP7; Tue, 28 Jul 2020 14:15:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9381922713;
	Tue, 28 Jul 2020 14:15:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83270C004D;
	Tue, 28 Jul 2020 14:15:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24927C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11D4985608
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0MX2v_2VT7I for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:15:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 02FDB855CE
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:15:19 +0000 (UTC)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC04206F5;
 Tue, 28 Jul 2020 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595945719;
 bh=lUPY2x+FC7QKHEsbHiDvmWaDq+mpMmmwkd+OggYom1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgGc4X7YUZ1ckDx2DS7TV0wJ9kprJKWkAHEon+OMgHl2R1sb+tkMTAcVnCBfWfbCy
 0OtC+wiVDREvJNkkA1XcIE7jDME0kzNs1q63GPOaIsM59WTD15P6atSjYRp+nh+npo
 fGSf3gFWEKzBxONEs1GYYDPsR5qUaUEQHRNOUSzo=
Date: Tue, 28 Jul 2020 17:15:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728141504.GC3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728110254.GA14854@MiWiFi-R3L-srv>
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
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

On Tue, Jul 28, 2020 at 07:02:54PM +0800, Baoquan He wrote:
> On 07/28/20 at 08:11am, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > regions to set node ID in memblock.reserved and than traverses
> > memblock.reserved to update reserved_nodemask to include node IDs that were
> > set in the first loop.
> > 
> > Remove redundant traversal over memblock.reserved and update
> > reserved_nodemask while iterating over numa_meminfo.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 8ee952038c80..4078abd33938 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
> >  	 * and use those ranges to set the nid in memblock.reserved.
> >  	 * This will split up the memblock regions along node
> >  	 * boundaries and will set the node IDs as well.
> > +	 *
> > +	 * The nid will also be set in reserved_nodemask which is later
> > +	 * used to clear MEMBLOCK_HOTPLUG flag.
> > +	 *
> > +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > +	 *   numa_meminfo might not include all memblock.reserved
> > +	 *   memory ranges, because quirks such as trim_snb_memory()
> > +	 *   reserve specific pages for Sandy Bridge graphics.
> > +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
> >  	 */
> >  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> >  		struct numa_memblk *mb = numa_meminfo.blk + i;
> >  		int ret;
> >  
> >  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> > +		node_set(mb->nid, reserved_nodemask);
> 
> Really? This will set all node id into reserved_nodemask. But in the
> current code, it's setting nid into memblock reserved region which
> interleaves with numa_memoinfo, then get those nid and set it in
> reserved_nodemask. This is so different, with my understanding. Please
> correct me if I am wrong.

You are right, I've missed the intersections of numa_meminfo with
memblock.reserved.

x86 interaction with membock is so, hmm, interesting...
 
> Thanks
> Baoquan
> 
> >  		WARN_ON_ONCE(ret);
> >  	}
> >  
> > -	/*
> > -	 * Now go over all reserved memblock regions, to construct a
> > -	 * node mask of all kernel reserved memory areas.
> > -	 *
> > -	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > -	 *   numa_meminfo might not include all memblock.reserved
> > -	 *   memory ranges, because quirks such as trim_snb_memory()
> > -	 *   reserve specific pages for Sandy Bridge graphics. ]
> > -	 */
> > -	for_each_memblock(reserved, mb_region) {
> > -		int nid = memblock_get_region_node(mb_region);
> > -
> > -		if (nid != MAX_NUMNODES)
> > -			node_set(nid, reserved_nodemask);
> > -	}
> > -
> >  	/*
> >  	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
> >  	 * belonging to the reserved node mask.
> > -- 
> > 2.26.2
> > 
> > 
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
