Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA4E42DE
	for <lists.iommu@lfdr.de>; Fri, 25 Oct 2019 07:29:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81DB8E56;
	Fri, 25 Oct 2019 05:29:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41A32C4E
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 05:29:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C909787B
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 05:29:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 22:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,227,1569308400"; d="scan'208";a="223807397"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 24 Oct 2019 22:29:11 -0700
Subject: Re: [PATCH v7 05/11] iommu/vt-d: Move domain helper to header
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-6-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <415090ca-183c-024a-320d-873625d37ba9@linux.intel.com>
Date: Fri, 25 Oct 2019 13:26:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571946904-86776-6-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jonathan Cameron <jic23@kernel.org>
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

HI,

On 10/25/19 3:54 AM, Jacob Pan wrote:
> Move domain helper to header to be used by SVA code.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

This patch looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 6 ------
>   include/linux/intel-iommu.h | 6 ++++++
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 2ea09b988a23..acd1ac787d8b 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -428,12 +428,6 @@ static void init_translation_status(struct intel_iommu *iommu)
>   		iommu->flags |= VTD_FLAG_TRANS_PRE_ENABLED;
>   }
>   
> -/* Convert generic 'struct iommu_domain to private struct dmar_domain */
> -static struct dmar_domain *to_dmar_domain(struct iommu_domain *dom)
> -{
> -	return container_of(dom, struct dmar_domain, domain);
> -}
> -
>   static int __init intel_iommu_setup(char *str)
>   {
>   	if (!str)
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index c624733cb2e6..3dba6ad3e9ad 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -594,6 +594,12 @@ static inline void __iommu_flush_cache(
>   		clflush_cache_range(addr, size);
>   }
>   
> +/* Convert generic struct iommu_domain to private struct dmar_domain */
> +static inline struct dmar_domain *to_dmar_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct dmar_domain, domain);
> +}
> +
>   /*
>    * 0: readable
>    * 1: writable
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
