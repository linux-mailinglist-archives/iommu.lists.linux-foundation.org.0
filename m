Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3919E993
	for <lists.iommu@lfdr.de>; Sun,  5 Apr 2020 08:37:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1118B86ECC;
	Sun,  5 Apr 2020 06:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYAi11Hf4Tex; Sun,  5 Apr 2020 06:37:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 502CF875EE;
	Sun,  5 Apr 2020 06:37:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3450FC0177;
	Sun,  5 Apr 2020 06:37:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41994C0177
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 06:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 393A985F81
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 06:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ve2ARrm3ooSo for <iommu@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 06:37:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3E75D85F5E
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586068658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLJp8gNoJW3dJ3wHholYHDaHHlYLtE5HahLyoRw+fos=;
 b=K42TXPkz9Fscm6uTAAsFUZtRG6t/EEmljUUB6PDMEG+qiQbfk0ARNIvkP3U/5hmxS2s2Oc
 un0qXXqYoGNqzSfDgbYbW+szNr2PFvSri7AdjKxZbzVlJChsLTYVLtraclFZJOnAdhb6n4
 0prhXuN2TCq+s/0vDl3Hf7MEMHU1chU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-qk1hOz4oNuOokJeo_SK-nw-1; Sun, 05 Apr 2020 02:37:34 -0400
X-MC-Unique: qk1hOz4oNuOokJeo_SK-nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E22800D50;
 Sun,  5 Apr 2020 06:37:32 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA5A5DA66;
 Sun,  5 Apr 2020 06:37:26 +0000 (UTC)
Subject: Re: [PATCH v11 03/10] iommu/vt-d: Use a helper function to skip agaw
 for SL
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-4-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <54625f36-909e-405d-fe8d-e80f4314646a@redhat.com>
Date: Sun, 5 Apr 2020 08:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1585939334-21396-4-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>
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

Hi Jacob,

On 4/3/20 8:42 PM, Jacob Pan wrote:
> An Intel iommu domain uses 5-level page table by default. If the
> iommu that the domain tries to attach supports less page levels,
> the top level page tables should be skipped. Add a helper to do
> this so that it could be used in other places.
> 
> ---
> v11 Added Baolu's commit message and squashed 4 & 5 from v10.
> ---
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/iommu/intel-pasid.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
> index 22b30f10b396..66c364719ad1 100644
> --- a/drivers/iommu/intel-pasid.c
> +++ b/drivers/iommu/intel-pasid.c
> @@ -500,6 +500,26 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
>  }
>  
>  /*
> + * Skip top levels of page tables for iommu which has less agaw
> + * than default. Unnecessary for PT mode.
> + */
> +static inline int iommu_skip_agaw(struct dmar_domain *domain,
> +				  struct intel_iommu *iommu,
> +				  struct dma_pte **pgd)
> +{
> +	int agaw;
> +
> +	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
> +		*pgd = phys_to_virt(dma_pte_addr(*pgd));
> +		if (!dma_pte_present(*pgd)) {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return agaw;
> +}
> +
> +/*
>   * Set up the scalable mode pasid entry for second only translation type.
>   */
>  int intel_pasid_setup_second_level(struct intel_iommu *iommu,
> @@ -522,17 +542,11 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Skip top levels of page tables for iommu which has less agaw
> -	 * than default. Unnecessary for PT mode.
> -	 */
>  	pgd = domain->pgd;
> -	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
> -		pgd = phys_to_virt(dma_pte_addr(pgd));
> -		if (!dma_pte_present(pgd)) {
> -			dev_err(dev, "Invalid domain page table\n");
> -			return -EINVAL;
> -		}
> +	agaw = iommu_skip_agaw(domain, iommu, &pgd);
> +	if (agaw < 0) {
> +		dev_err(dev, "Invalid domain page table\n");
> +		return -EINVAL;
>  	}
>  
>  	pgd_val = virt_to_phys(pgd);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
