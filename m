Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17837CB22
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 18:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D010860DD2;
	Wed, 12 May 2021 16:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xaj8dfkhfPI9; Wed, 12 May 2021 16:56:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8DA260E22;
	Wed, 12 May 2021 16:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86A27C0024;
	Wed, 12 May 2021 16:56:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62277C0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 16:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4227E60DDB
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 16:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0K_pfWc5iSVe for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 16:56:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F62060E22
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 16:56:06 +0000 (UTC)
IronPort-SDR: r2uofVsVBBQX6oPBsAukjkyAyklQeprOco6sisEqkExfdFyORvRo9OmvBS+JyaJWqAtTOVb/Wl
 8TEjAnZX5rTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="196660938"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="196660938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 09:56:05 -0700
IronPort-SDR: IeV1lHQFk5f6Ts24SI0GTrT1YtPg2oIgUi1emWWX4gumZsh+/1vA95q/TOZoUabcqibaNEGqcL
 lwfTTRMDnhnw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="392818030"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 09:56:04 -0700
Date: Wed, 12 May 2021 09:56:02 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Tweak the description of a DMA fault
Message-ID: <20210512165602.GA102348@otc-nc-03>
References: <20210512065012.3441160-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512065012.3441160-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kevin.tian@intel.com, Ashok Raj <ashok.raj@intel.com>,
 sanjay.k.kumar@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Will Deacon <will@kernel.org>
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

On Wed, May 12, 2021 at 02:50:12PM +0800, Lu Baolu wrote:
> The Intel IOMMU driver reports the DMA fault reason in a decimal number
> while the VT-d specification uses a hexadecimal one. It's inconvenient
> that users need to covert them everytime before consulting the spec.
> Let's use hexadecimal number for a DMA fault reason.
> 
> The fault message uses 0xffffffff as PASID for DMA requests w/o PASID.
> This is confusing. Tweak this by adding "w/o PASID" explicitly.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Maybe simpler to call it NO_PASID, and just PASID 0xxxxx instead?

with the minor suggestions below

Reviewed-by: Ashok Raj <ashok.raj@intel.com>

> ---
>  drivers/iommu/intel/dmar.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 1757ac1e1623..11e37d2c2af2 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1911,15 +1911,21 @@ static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
>  	reason = dmar_get_fault_reason(fault_reason, &fault_type);
>  
>  	if (fault_type == INTR_REMAP)
> -		pr_err("[INTR-REMAP] Request device [%02x:%02x.%d] fault index %llx [fault reason %02d] %s\n",
> -			source_id >> 8, PCI_SLOT(source_id & 0xFF),
> -			PCI_FUNC(source_id & 0xFF), addr >> 48,
> -			fault_reason, reason);
> -	else
> -		pr_err("[%s] Request device [%02x:%02x.%d] PASID %x fault addr %llx [fault reason %02d] %s\n",
> +		pr_err("[INTR-REMAP] Request device [%02x:%02x.%d] fault index %llx [fault reason %02xh] %s\n",
> +		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
> +		       PCI_FUNC(source_id & 0xFF), addr >> 48,
> +		       fault_reason, reason);
> +	else if (pasid == INVALID_IOASID)
> +		pr_err("[%s w/o PASID] Request device [%02x:%02x.%d] fault addr %llx [fault reason %02xh] %s\n",
>  		       type ? "DMA Read" : "DMA Write",
>  		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
> -		       PCI_FUNC(source_id & 0xFF), pasid, addr,
> +		       PCI_FUNC(source_id & 0xFF), addr,
> +		       fault_reason, reason);
> +	else
> +		pr_err("[%s w/ PASID %x] Request device [%02x:%02x.%d] fault addr %llx [fault reason %02xh] %s\n",

Can you always lead hex values with 0x?

> +		       type ? "DMA Read" : "DMA Write", pasid,
> +		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
> +		       PCI_FUNC(source_id & 0xFF), addr,
>  		       fault_reason, reason);
>  	return 0;
>  }
> @@ -1987,7 +1993,7 @@ irqreturn_t dmar_fault(int irq, void *dev_id)
>  		if (!ratelimited)
>  			/* Using pasid -1 if pasid is not present */
>  			dmar_fault_do_one(iommu, type, fault_reason,
> -					  pasid_present ? pasid : -1,
> +					  pasid_present ? pasid : INVALID_IOASID,
>  					  source_id, guest_addr);
>  
>  		fault_index++;
> -- 
> 2.25.1
> 

-- 
Cheers,
Ashok

[Forgiveness is the attribute of the STRONG - Gandhi]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
