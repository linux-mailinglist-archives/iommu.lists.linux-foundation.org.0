Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E824F7C
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 14:59:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00D96C3F;
	Tue, 21 May 2019 12:59:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1E33B50
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9B53627B
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:59:35 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 91EAB237052C217B51B8;
	Tue, 21 May 2019 20:59:32 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 20:59:23 +0800
Subject: Re: [PATCH v7 1/1] iommu: enhance IOMMU dma mode build options
To: Zhen Lei <thunder.leizhen@huawei.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>, Robin Murphy <robin.murphy@arm.com>, "Will
	Deacon" <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan
	Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>,
	Sebastian Ott
	<sebott@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	"Martin Schwidefsky" <schwidefsky@de.ibm.com>, Heiko Carstens
	<heiko.carstens@de.ibm.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
	Ellerman" <mpe@ellerman.id.au>, Tony Luck <tony.luck@intel.com>, Fenghua Yu
	<fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
	<hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, iommu
	<iommu@lists.linux-foundation.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
	linux-ia64 <linux-ia64@vger.kernel.org>
References: <20190520135947.14960-1-thunder.leizhen@huawei.com>
	<20190520135947.14960-2-thunder.leizhen@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <1a12ce97-2e21-0b28-b852-31f21626c378@huawei.com>
Date: Tue, 21 May 2019 13:59:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190520135947.14960-2-thunder.leizhen@huawei.com>
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linuxarm <linuxarm@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 20/05/2019 14:59, Zhen Lei wrote:
> First, add build option IOMMU_DEFAULT_{LAZY|STRICT}, so that we have the
> opportunity to set {lazy|strict} mode as default at build time. Then put
> the three config options in an choice, make people can only choose one of
> the three at a time.
>
> The default IOMMU dma modes on each ARCHs have no change.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Apart from more minor comments, FWIW:

Reviewed-by: John Garry <john.garry@huawei.com>

> ---
>  arch/ia64/kernel/pci-dma.c                |  2 +-
>  arch/powerpc/platforms/powernv/pci-ioda.c |  3 ++-
>  arch/s390/pci/pci_dma.c                   |  2 +-
>  arch/x86/kernel/pci-dma.c                 |  7 ++---
>  drivers/iommu/Kconfig                     | 44 ++++++++++++++++++++++++++-----
>  drivers/iommu/amd_iommu_init.c            |  3 ++-
>  drivers/iommu/intel-iommu.c               |  2 +-
>  drivers/iommu/iommu.c                     |  3 ++-
>  8 files changed, 48 insertions(+), 18 deletions(-)
>
> diff --git a/arch/ia64/kernel/pci-dma.c b/arch/ia64/kernel/pci-dma.c
> index fe988c49f01ce6a..655511dbf3c3b34 100644
> --- a/arch/ia64/kernel/pci-dma.c
> +++ b/arch/ia64/kernel/pci-dma.c
> @@ -22,7 +22,7 @@
>  int force_iommu __read_mostly;
>  #endif
>
> -int iommu_pass_through;
> +int iommu_pass_through = IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);

As commented privately, I could never see this set for ia64, and it 
seems to exist just to keep the linker happy. Anyway, I am not sure if 
ever suitable to be set.

>
>  static int __init pci_iommu_init(void)
>  {
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 3ead4c237ed0ec9..383e082a9bb985c 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -85,7 +85,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>  	va_end(args);
>  }
>
> -static bool pnv_iommu_bypass_disabled __read_mostly;
> +static bool pnv_iommu_bypass_disabled __read_mostly =
> +			!IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
>  static bool pci_reset_phbs __read_mostly;
>
>  static int __init iommu_setup(char *str)
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index 9e52d1527f71495..784ad1e0acecfb1 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -17,7 +17,7 @@
>
>  static struct kmem_cache *dma_region_table_cache;
>  static struct kmem_cache *dma_page_table_cache;
> -static int s390_iommu_strict;
> +static int s390_iommu_strict = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>
>  static int zpci_refresh_global(struct zpci_dev *zdev)
>  {
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index d460998ae828514..fb2bab42a0a3173 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -43,11 +43,8 @@
>   * It is also possible to disable by default in kernel config, and enable with
>   * iommu=nopt at boot time.
>   */
> -#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
> -int iommu_pass_through __read_mostly = 1;
> -#else
> -int iommu_pass_through __read_mostly;
> -#endif
> +int iommu_pass_through __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
>
>  extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 6f07f3b21816c64..8a1f1793cde76b4 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -74,17 +74,47 @@ config IOMMU_DEBUGFS
>  	  debug/iommu directory, and then populate a subdirectory with
>  	  entries as required.
>
> -config IOMMU_DEFAULT_PASSTHROUGH
> -	bool "IOMMU passthrough by default"
> +choice
> +	prompt "IOMMU default DMA mode"
>  	depends on IOMMU_API
> -        help
> -	  Enable passthrough by default, removing the need to pass in
> -	  iommu.passthrough=on or iommu=pt through command line. If this
> -	  is enabled, you can still disable with iommu.passthrough=off
> -	  or iommu=nopt depending on the architecture.
> +	default IOMMU_DEFAULT_PASSTHROUGH if (PPC_POWERNV && PCI)
> +	default IOMMU_DEFAULT_LAZY if (AMD_IOMMU || INTEL_IOMMU || S390_IOMMU)
> +	default IOMMU_DEFAULT_STRICT
> +	help
> +	  This option allows IOMMU DMA mode to be chose at build time, to

I'd say /s/allows IOMMU/allows an IOMMU/, /s/chose/chosen/

> +	  override the default DMA mode of each ARCHs, removing the need to

ARCHs should be singular

> +	  pass in kernel parameters through command line. You can still use
> +	  ARCHs specific boot options to override this option again.
> +
> +config IOMMU_DEFAULT_PASSTHROUGH
> +	bool "passthrough"
> +	help
> +	  In this mode, the DMA access through IOMMU without any addresses
> +	  translation. That means, the wrong or illegal DMA access can not
> +	  be caught, no error information will be reported.
>
>  	  If unsure, say N here.
>
> +config IOMMU_DEFAULT_LAZY
> +	bool "lazy"
> +	help
> +	  Support lazy mode, where for every IOMMU DMA unmap operation, the
> +	  flush operation of IOTLB and the free operation of IOVA are deferred.
> +	  They are only guaranteed to be done before the related IOVA will be
> +	  reused.
> +
> +config IOMMU_DEFAULT_STRICT
> +	bool "strict"
> +	help
> +	  For every IOMMU DMA unmap operation, the flush operation of IOTLB and
> +	  the free operation of IOVA are guaranteed to be done in the unmap
> +	  function.
> +
> +	  This mode is safer than the two above, but it maybe slower in some
> +	  high performace scenarios.
> +
> +endchoice
> +
>  config OF_IOMMU
>         def_bool y
>         depends on OF && IOMMU_API
> diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
> index ff40ba758cf365e..16c02b08adb4cb2 100644
> --- a/drivers/iommu/amd_iommu_init.c
> +++ b/drivers/iommu/amd_iommu_init.c
> @@ -166,7 +166,8 @@ struct ivmd_header {
>  					   to handle */
>  LIST_HEAD(amd_iommu_unity_map);		/* a list of required unity mappings
>  					   we find in ACPI */
> -bool amd_iommu_unmap_flush;		/* if true, flush on every unmap */
> +bool amd_iommu_unmap_flush = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
> +					/* if true, flush on every unmap */
>
>  LIST_HEAD(amd_iommu_list);		/* list of all AMD IOMMUs in the
>  					   system */
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 28cb713d728ceef..0c3cc716210f35a 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -362,7 +362,7 @@ static int domain_detach_iommu(struct dmar_domain *domain,
>
>  static int dmar_map_gfx = 1;
>  static int dmar_forcedac;
> -static int intel_iommu_strict;
> +static int intel_iommu_strict = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>  static int intel_iommu_superpage = 1;
>  static int intel_iommu_sm;
>  static int iommu_identity_mapping;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 109de67d5d727c2..0ec5952ac60e2a3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -43,7 +43,8 @@
>  #else
>  static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_DMA;
>  #endif
> -static bool iommu_dma_strict __read_mostly = true;
> +static bool iommu_dma_strict __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>
>  struct iommu_group {
>  	struct kobject kobj;
> --
> 1.8.3
>
>
>
> .
>


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
