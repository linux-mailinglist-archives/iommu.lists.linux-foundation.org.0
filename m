Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E11AFAC68D
	for <lists.iommu@lfdr.de>; Sat,  7 Sep 2019 14:11:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 73DF5DC2;
	Sat,  7 Sep 2019 12:11:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 244F8DB5
	for <iommu@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 12:11:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 902D57DB
	for <iommu@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 12:11:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Sep 2019 05:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,477,1559545200"; d="scan'208";a="199719279"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2019 05:11:48 -0700
Subject: Re: [PATCH] iommu/vt-d: Make function signatures static
To: Adam Zerella <adam.zerella@gmail.com>
References: <20190907064933.15277-1-adam.zerella@gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <ba8d4792-3b62-98a8-31d8-74a08be2f983@linux.intel.com>
Date: Sat, 7 Sep 2019 20:10:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907064933.15277-1-adam.zerella@gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, dwmw2@infradead.org
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

On 9/7/19 2:49 PM, Adam Zerella wrote:
> warning: symbol 'intel_iommu_gfx_mapped' was not declared. Should it be static?
> warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
> 
> Squash a couple of Sparse warnings by making these symbols static.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>   drivers/iommu/intel-iommu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 12d094d08c0a..28134891fa9c 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -365,7 +365,7 @@ static int iommu_identity_mapping;
>   #define IDENTMAP_GFX		2
>   #define IDENTMAP_AZALIA		4
>   
> -int intel_iommu_gfx_mapped;
> +static int intel_iommu_gfx_mapped;
>   EXPORT_SYMBOL_GPL(intel_iommu_gfx_mapped);

It's hard to understand this. This symbol is exported and used in the
graphic driver. How could it be static?

>   
>   #define DUMMY_DEVICE_DOMAIN_INFO ((struct device_domain_info *)(-1))
> @@ -397,7 +397,7 @@ int for_each_device_domain(int (*fn)(struct device_domain_info *info,
>   	return 0;
>   }
>   
> -const struct iommu_ops intel_iommu_ops;
> +static const struct iommu_ops intel_iommu_ops;

Ditto. This is used in dmar.c.

Best regards,
Baolu

>   
>   static bool translation_pre_enabled(struct intel_iommu *iommu)
>   {
> @@ -5613,7 +5613,7 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
>   	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
>   }
>   
> -const struct iommu_ops intel_iommu_ops = {
> +static const struct iommu_ops intel_iommu_ops = {
>   	.capable		= intel_iommu_capable,
>   	.domain_alloc		= intel_iommu_domain_alloc,
>   	.domain_free		= intel_iommu_domain_free,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
