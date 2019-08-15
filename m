Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4E8E454
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 07:03:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BE4D8C11;
	Thu, 15 Aug 2019 05:03:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAFD7255
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 05:03:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7E2EE8AC
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 05:03:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2019 22:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="171012988"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga008.jf.intel.com with ESMTP; 14 Aug 2019 22:02:59 -0700
Subject: Re: [PATCH 06/10] iommu: Remember when default domain type was set on
	kernel command line
To: Joerg Roedel <joro@8bytes.org>
References: <20190814133841.7095-1-joro@8bytes.org>
	<20190814133841.7095-7-joro@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <754a526e-a6d4-8a3f-0b35-9dd3def5d24b@linux.intel.com>
Date: Thu, 15 Aug 2019 13:01:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814133841.7095-7-joro@8bytes.org>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: fenghua.yu@intel.com, tony.luck@intel.com, linux-ia64@vger.kernel.org,
	corbet@lwn.net, Joerg Roedel <jroedel@suse.de>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
	Thomas.Lendacky@amd.com, hpa@zytor.com, tglx@linutronix.de
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

Hi,

On 8/14/19 9:38 PM, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Introduce an extensible concept to remember when certain
> configuration settings for the IOMMU code have been set on
> the kernel command line.
> 
> This will be used later to prevent overwriting these
> settings with other defaults.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/iommu.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index f187e85a074b..e1feb4061b8b 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -32,6 +32,7 @@ static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_IDENTITY;
>   static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_DMA;
>   #endif
>   static bool iommu_dma_strict __read_mostly = true;
> +static u32 iommu_cmd_line __read_mostly;
>   
>   struct iommu_group {
>   	struct kobject kobj;
> @@ -68,6 +69,18 @@ static const char * const iommu_group_resv_type_string[] = {
>   	[IOMMU_RESV_SW_MSI]			= "msi",
>   };
>   
> +#define IOMMU_CMD_LINE_DMA_API		(1 << 0)

Prefer BIT() micro?

> +
> +static void iommu_set_cmd_line_dma_api(void)
> +{
> +	iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
> +}
> +
> +static bool __maybe_unused iommu_cmd_line_dma_api(void)
> +{
> +	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
> +}
> +
>   #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
>   struct iommu_group_attribute iommu_group_attr_##_name =		\
>   	__ATTR(_name, _mode, _show, _store)
> @@ -165,6 +178,8 @@ static int __init iommu_set_def_domain_type(char *str)
>   	if (ret)
>   		return ret;
>   
> +	iommu_set_cmd_line_dma_api();

IOMMU command line is also set in other places, for example,
iommu_setup() (arch/x86/kernel/pci-dma.c). Need to call this there as
well?

Best regards,
Lu Baolu

> +
>   	iommu_def_domain_type = pt ? IOMMU_DOMAIN_IDENTITY : IOMMU_DOMAIN_DMA;
>   	return 0;
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
