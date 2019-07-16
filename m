Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E496A5E2
	for <lists.iommu@lfdr.de>; Tue, 16 Jul 2019 11:52:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F9C4E3D;
	Tue, 16 Jul 2019 09:52:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7AD93E18
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 09:52:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 553B025A
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 09:52:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9201D3081244;
	Tue, 16 Jul 2019 09:52:33 +0000 (UTC)
Received: from [10.36.116.32] (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB0F611DE;
	Tue, 16 Jul 2019 09:52:28 +0000 (UTC)
Subject: Re: [PATCH v4 17/22] iommu/vt-d: Avoid duplicated code for PASID setup
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-18-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <798650b7-4187-4a44-152a-b0d99be55c6c@redhat.com>
Date: Tue, 16 Jul 2019 11:52:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1560087862-57608-18-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 16 Jul 2019 09:52:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Jacob,

On 6/9/19 3:44 PM, Jacob Pan wrote:
> After each setup for PASID entry, related translation caches must be flushed.
> We can combine duplicated code into one function which is less error prone.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/intel-pasid.c | 48 +++++++++++++++++----------------------------
>  1 file changed, 18 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
> index 1e25539..1ff2ecc 100644
> --- a/drivers/iommu/intel-pasid.c
> +++ b/drivers/iommu/intel-pasid.c
> @@ -522,6 +522,21 @@ void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
>  		devtlb_invalidation_with_pasid(iommu, dev, pasid);
>  }
>  
> +static inline void pasid_flush_caches(struct intel_iommu *iommu,
> +				struct pasid_entry *pte,
> +				int pasid, u16 did)
> +{
> +	if (!ecap_coherent(iommu->ecap))
> +		clflush_cache_range(pte, sizeof(*pte));
> +
> +	if (cap_caching_mode(iommu->cap)) {
> +		pasid_cache_invalidation_with_pasid(iommu, did, pasid);
> +		iotlb_invalidation_with_pasid(iommu, did, pasid);
> +	} else
> +		iommu_flush_write_buffer(iommu);
Besides the style issue reported by Jonathan and the fact this function
may not deserve the inline (chapt 15 of
https://www.kernel.org/doc/html/v5.1/process/coding-style.html),

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> +
> +}
> +
>  /*
>   * Set up the scalable mode pasid table entry for first only
>   * translation type.
> @@ -567,16 +582,7 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
>  	/* Setup Present and PASID Granular Transfer Type: */
>  	pasid_set_translation_type(pte, 1);
>  	pasid_set_present(pte);
> -
> -	if (!ecap_coherent(iommu->ecap))
> -		clflush_cache_range(pte, sizeof(*pte));
> -
> -	if (cap_caching_mode(iommu->cap)) {
> -		pasid_cache_invalidation_with_pasid(iommu, did, pasid);
> -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> -	} else {
> -		iommu_flush_write_buffer(iommu);
> -	}
> +	pasid_flush_caches(iommu, pte, pasid, did);
>  
>  	return 0;
>  }
> @@ -640,16 +646,7 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
>  	 */
>  	pasid_set_sre(pte);
>  	pasid_set_present(pte);
> -
> -	if (!ecap_coherent(iommu->ecap))
> -		clflush_cache_range(pte, sizeof(*pte));
> -
> -	if (cap_caching_mode(iommu->cap)) {
> -		pasid_cache_invalidation_with_pasid(iommu, did, pasid);
> -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> -	} else {
> -		iommu_flush_write_buffer(iommu);
> -	}
> +	pasid_flush_caches(iommu, pte, pasid, did);
>  
>  	return 0;
>  }
> @@ -683,16 +680,7 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
>  	 */
>  	pasid_set_sre(pte);
>  	pasid_set_present(pte);
> -
> -	if (!ecap_coherent(iommu->ecap))
> -		clflush_cache_range(pte, sizeof(*pte));
> -
> -	if (cap_caching_mode(iommu->cap)) {
> -		pasid_cache_invalidation_with_pasid(iommu, did, pasid);
> -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> -	} else {
> -		iommu_flush_write_buffer(iommu);
> -	}
> +	pasid_flush_caches(iommu, pte, pasid, did);
>  
>  	return 0;
>  }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
