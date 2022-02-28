Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F94C6A7E
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 12:30:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB8160B10;
	Mon, 28 Feb 2022 11:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fegy9YHhEjbB; Mon, 28 Feb 2022 11:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 034D5607A1;
	Mon, 28 Feb 2022 11:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8AFC007B;
	Mon, 28 Feb 2022 11:30:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DAC8C001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CBF940979
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pr-I_KCgCdJ for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 11:30:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A614090A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:30:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1E95C68AFE; Mon, 28 Feb 2022 12:30:43 +0100 (CET)
Date: Mon, 28 Feb 2022 12:30:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [PATCH 08/11] swiotlb: make the swiotlb_init interface more useful
Message-ID: <20220228113042.GA10570@lst.de>
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-9-hch@lst.de>
 <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Mon, Feb 28, 2022 at 02:53:39AM +0000, Michael Kelley (LINUX) wrote:
> From: Christoph Hellwig <hch@lst.de> Sent: Sunday, February 27, 2022 6:31 AM
> > 
> > Pass a bool to pass if swiotlb needs to be enabled based on the
> > addressing needs and replace the verbose argument with a set of
> > flags, including one to force enable bounce buffering.
> > 
> > Note that this patch removes the possibility to force xen-swiotlb
> > use using swiotlb=force on the command line on x86 (arm and arm64
> > never supported that), but this interface will be restored shortly.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/arm/mm/init.c                     |  6 +----
> >  arch/arm64/mm/init.c                   |  6 +----
> >  arch/ia64/mm/init.c                    |  4 +--
> >  arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
> >  arch/mips/loongson64/dma.c             |  2 +-
> >  arch/mips/sibyte/common/dma.c          |  2 +-
> >  arch/powerpc/include/asm/swiotlb.h     |  1 +
> >  arch/powerpc/mm/mem.c                  |  3 ++-
> >  arch/powerpc/platforms/pseries/setup.c |  3 ---
> >  arch/riscv/mm/init.c                   |  8 +-----
> >  arch/s390/mm/init.c                    |  3 +--
> >  arch/x86/kernel/cpu/mshyperv.c         |  8 ------
> >  arch/x86/kernel/pci-dma.c              | 15 ++++++-----
> >  arch/x86/mm/mem_encrypt_amd.c          |  3 ---
> >  drivers/xen/swiotlb-xen.c              |  4 +--
> >  include/linux/swiotlb.h                | 15 ++++++-----
> >  include/trace/events/swiotlb.h         | 29 ++++++++-------------
> >  kernel/dma/swiotlb.c                   | 35 ++++++++++++++------------
> >  18 files changed, 56 insertions(+), 93 deletions(-)
> 
> [snip]
> 
> > 
> > diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> > index 5a99f993e6392..568274917f1cd 100644
> > --- a/arch/x86/kernel/cpu/mshyperv.c
> > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > @@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
> >  			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
> >  #endif
> >  		}
> > -
> > -#ifdef CONFIG_SWIOTLB
> > -		/*
> > -		 * Enable swiotlb force mode in Isolation VM to
> > -		 * use swiotlb bounce buffer for dma transaction.
> > -		 */
> > -		swiotlb_force = SWIOTLB_FORCE;
> > -#endif
> 
> With this code removed, it's not clear to me what forces the use of the
> swiotlb in a Hyper-V isolated VM.  The code in pci_swiotlb_detect_4g() doesn't
> catch this case because cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)
> returns "false" in a Hyper-V guest.  In the Hyper-V guest, it's only
> cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) that returns "true".  I'm
> looking more closely at the meaning of the CC_ATTR_* values, and it may
> be that Hyper-V should also return "true" for CC_ATTR_MEM_ENCRYPT,
> but I don't think CC_ATTR_HOST_MEM_ENCRYPT should return "true".

Ok, I assumed that CC_ATTR_HOST_MEM_ENCRYPT returned true in this case.
I guess we just need to check for CC_ATTR_GUEST_MEM_ENCRYPT as well
there?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
