Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DA24D137
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 11:13:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3072286934;
	Fri, 21 Aug 2020 09:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gnzh0XL9akS; Fri, 21 Aug 2020 09:13:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 46F9F86A5B;
	Fri, 21 Aug 2020 09:13:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D8FCC0051;
	Fri, 21 Aug 2020 09:13:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A924DC0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 09:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8E98688605
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 09:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIyh6odeGN8c for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 09:13:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6859788556
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 09:13:50 +0000 (UTC)
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 6C6587293AF0C80336D5;
 Fri, 21 Aug 2020 17:13:40 +0800 (CST)
Received: from dggema723-chm.china.huawei.com (10.3.20.87) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 21 Aug 2020 17:13:40 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggema723-chm.china.huawei.com (10.3.20.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 21 Aug 2020 17:13:39 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Fri, 21 Aug 2020 17:13:39 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Will Deacon <will@kernel.org>
Subject: RE: [PATCH v6 1/2] dma-contiguous: provide the ability to reserve
 per-numa CMA
Thread-Topic: [PATCH v6 1/2] dma-contiguous: provide the ability to reserve
 per-numa CMA
Thread-Index: AQHWd2LcxiMeqDASCk2fUz72+ALjbKlBunaAgACH7kA=
Date: Fri, 21 Aug 2020 09:13:39 +0000
Message-ID: <4ab78767553f48a584217063f6f24eb9@hisilicon.com>
References: <20200821022615.28596-1-song.bao.hua@hisilicon.com>
 <20200821022615.28596-2-song.bao.hua@hisilicon.com>
 <20200821084717.GA20255@willie-the-truck>
In-Reply-To: <20200821084717.GA20255@willie-the-truck>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.192]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Mike Rapoport <rppt@linux.ibm.com>, Steve Capper <steve.capper@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 Andrew Morton <akpm@linux-foundation.org>, huangdaode <huangdaode@huawei.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



> -----Original Message-----
> From: Will Deacon [mailto:will@kernel.org]
> Sent: Friday, August 21, 2020 8:47 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: hch@lst.de; m.szyprowski@samsung.com; robin.murphy@arm.com;
> ganapatrao.kulkarni@cavium.com; catalin.marinas@arm.com;
> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> huangdaode <huangdaode@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de>; Steve Capper <steve.capper@arm.com>; Andrew
> Morton <akpm@linux-foundation.org>; Mike Rapoport <rppt@linux.ibm.com>
> Subject: Re: [PATCH v6 1/2] dma-contiguous: provide the ability to reserve
> per-numa CMA
> 
> On Fri, Aug 21, 2020 at 02:26:14PM +1200, Barry Song wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt
> b/Documentation/admin-guide/kernel-parameters.txt
> > index bdc1f33fd3d1..3f33b89aeab5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -599,6 +599,15 @@
> >  			altogether. For more information, see
> >  			include/linux/dma-contiguous.h
> >
> > +	pernuma_cma=nn[MG]
> > +			[ARM64,KNL]
> > +			Sets the size of kernel per-numa memory area for
> > +			contiguous memory allocations. A value of 0 disables
> > +			per-numa CMA altogether. DMA users on node nid will
> > +			first try to allocate buffer from the pernuma area
> > +			which is located in node nid, if the allocation fails,
> > +			they will fallback to the global default memory area.
> 
> What is the default behaviour if this option is not specified? Seems like
> that should be mentioned here.
> 
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index 847a9d1fa634..db7a37ed35eb 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -118,6 +118,16 @@ config DMA_CMA
> >  	  If unsure, say "n".
> >
> >  if  DMA_CMA
> > +
> > +config DMA_PERNUMA_CMA
> > +	bool "Enable separate DMA Contiguous Memory Area for each NUMA
> Node"
> 
> I don't understand the need for this config option. If you have DMA_DMA and
> you have NUMA, why wouldn't you want this enabled?

Christoph preferred this in previous patchset in order to be able to remove all of the code
in the text if users don't use pernuma CMA.

> 
> > +	help
> > +	  Enable this option to get pernuma CMA areas so that devices like
> > +	  ARM64 SMMU can get local memory by DMA coherent APIs.
> > +
> > +	  You can set the size of pernuma CMA by specifying
> "pernuma_cma=size"
> > +	  on the kernel's command line.
> > +
> >  comment "Default contiguous memory area size:"
> >
> >  config CMA_SIZE_MBYTES
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index cff7e60968b9..89b95f10e56d 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -69,6 +69,19 @@ static int __init early_cma(char *p)
> >  }
> >  early_param("cma", early_cma);
> >
> > +#ifdef CONFIG_DMA_PERNUMA_CMA
> > +
> > +static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
> > +static phys_addr_t pernuma_size_bytes __initdata;
> > +
> > +static int __init early_pernuma_cma(char *p)
> > +{
> > +	pernuma_size_bytes = memparse(p, &p);
> > +	return 0;
> > +}
> > +early_param("pernuma_cma", early_pernuma_cma);
> > +#endif
> > +
> >  #ifdef CONFIG_CMA_SIZE_PERCENTAGE
> >
> >  static phys_addr_t __init __maybe_unused
> cma_early_percent_memory(void)
> > @@ -96,6 +109,34 @@ static inline __maybe_unused phys_addr_t
> cma_early_percent_memory(void)
> >
> >  #endif
> >
> > +#ifdef CONFIG_DMA_PERNUMA_CMA
> > +void __init dma_pernuma_cma_reserve(void)
> > +{
> > +	int nid;
> > +
> > +	if (!pernuma_size_bytes)
> > +		return;
> 
> If this is useful (I assume it is), then I think we should have a non-zero
> default value, a bit like normal CMA does via CMA_SIZE_MBYTES.

The patchet used to have a CONFIG_PERNUMA_CMA_SIZE in kernel/dma/Kconfig, but Christoph was not comfortable
with it:
https://lore.kernel.org/linux-iommu/20200728115231.GA793@lst.de/

Would you mind to hardcode the value in CONFIG_CMDLINE in arch/arm64/Kconfig as Christoph mentioned:
config CMDLINE
	default "pernuma_cma=16M"

If you also don't like the change in arch/arm64/Kconfig CMDLINE, I guess I have to depend on users' setting in
cmdline just like hugetlb_cma.

> 
> > +	for_each_node_state(nid, N_ONLINE) {
> 
> for_each_online_node() {
> 
> > +		int ret;
> > +		char name[20];
> 
> 20?
> 
> Ah, wait, this is copy-pasta from hugetlb_cma_reserve(). Can you factor out
> the common parts at all?

Actually I have a "#define CMA_MAX_NAME 64" in this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=18e98e56f440

the 20 in hugetlb_cma_reserve() was also made by me. If you are not comfortable, I can
move to CMA_MAX_NAME. do you think it does really matter here? 20 seems to be long
enough for this scenario.

Thanks
Barry
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
