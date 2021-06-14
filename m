Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376B3A6B34
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 18:03:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AC4834DE;
	Mon, 14 Jun 2021 16:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6ooniDWTtAF; Mon, 14 Jun 2021 16:03:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 066A483B2D;
	Mon, 14 Jun 2021 16:03:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE1E2C0024;
	Mon, 14 Jun 2021 16:03:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 020DAC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C5D4034B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n14XqUStJ_JR for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:03:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67862402E3
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:03:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 932A21FB;
 Mon, 14 Jun 2021 09:03:38 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D39653F70D;
 Mon, 14 Jun 2021 09:03:36 -0700 (PDT)
Subject: Re: [PATCH v12 2/5] iommu: Enhance IOMMU default DMA mode build
 options
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, baolu.lu@linux.intel.com
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-3-git-send-email-john.garry@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2fe7d268-bc9f-9808-29a5-610527a0fd32@arm.com>
Date: Mon, 14 Jun 2021 17:03:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623414043-40745-3-git-send-email-john.garry@huawei.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-06-11 13:20, John Garry wrote:
> From: Zhen Lei <thunder.leizhen@huawei.com>
> 
> First, add build options IOMMU_DEFAULT_{LAZY|STRICT}, so that we have the
> opportunity to set {lazy|strict} mode as default at build time. Then put
> the two config options in an choice, as they are mutually exclusive.
> 
> [jpg: Make choice between strict and lazy only (and not passthrough)]
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/iommu/Kconfig | 38 ++++++++++++++++++++++++++++++++++++++
>   drivers/iommu/iommu.c |  3 ++-
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 1f111b399bca..2a71347611d4 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -90,6 +90,44 @@ config IOMMU_DEFAULT_PASSTHROUGH
>   
>   	  If unsure, say N here.
>   
> +choice
> +	prompt "IOMMU default DMA mode"
> +	depends on IOMMU_DMA
> +
> +	default IOMMU_DEFAULT_STRICT
> +	help
> +	  This option allows an IOMMU DMA mode to be chosen at build time, to
> +	  override the default DMA mode of each ARCH, removing the need to
> +	  pass in kernel parameters through command line. It is still possible
> +	  to provide ARCH-specific or common boot options to override this
> +	  option.
> +
> +	  If unsure, keep the default.
> +
> +config IOMMU_DEFAULT_STRICT
> +	bool "strict"
> +	help
> +	  For every IOMMU DMA unmap operation, the flush operation of IOTLB and
> +	  the free operation of IOVA are guaranteed to be done in the unmap
> +	  function.
> +
> +config IOMMU_DEFAULT_LAZY
> +	bool "lazy"
> +	help
> +	  Support lazy mode, where for every IOMMU DMA unmap operation, the
> +	  flush operation of IOTLB and the free operation of IOVA are deferred.
> +	  They are only guaranteed to be done before the related IOVA will be
> +	  reused.
> +
> +	  The isolation provided in this mode is not as secure as STRICT mode,
> +	  such that a vulnerable time window may be created between the DMA
> +	  unmap and the mapping finally being torn down in the IOMMU, where the
> +	  device can still access the system memory. However this mode may
> +	  provide better performance in high throughput scenarios, and is still
> +	  considerably more secure than passthrough mode or no IOMMU.
> +
> +endchoice
> +
>   config OF_IOMMU
>   	def_bool y
>   	depends on OF && IOMMU_API
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index cf58949cc2f3..ccbd5d4c1a50 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -29,7 +29,8 @@ static struct kset *iommu_group_kset;
>   static DEFINE_IDA(iommu_group_ida);
>   
>   static unsigned int iommu_def_domain_type __read_mostly;
> -static bool iommu_dma_strict __read_mostly = true;
> +static bool iommu_dma_strict __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);

Nit: I reckon this is a fine place to wield the 100-character 
relaxation, but it's not my call in the end.

With the wording tweaks already mentioned,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

>   static u32 iommu_cmd_line __read_mostly;
>   
>   struct iommu_group {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
