Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A1228610
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 18:43:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8769C86932;
	Tue, 21 Jul 2020 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooCtip9oz4Yy; Tue, 21 Jul 2020 16:43:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DED9C86931;
	Tue, 21 Jul 2020 16:43:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3A5CC016F;
	Tue, 21 Jul 2020 16:43:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 355A5C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 16:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2AF0A87670
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 16:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IdcGx96XvwO for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 16:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3FAB28759E
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 16:43:52 +0000 (UTC)
IronPort-SDR: 1sl+7YrSCZyQQTCuONP+Uq3DnxWgASkZlBr3GjdHcFDFZs3PNqP0AdFah3mOkHePKIE4o3VW1Q
 fRgwKg9usSqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="138264164"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="138264164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 09:43:51 -0700
IronPort-SDR: tvBGo5/vj8Hw4z/+tOnsFPU8J7wngj4GEC2ybIAzdR9szlNPVhkmsfb3wVcQ6xAQxi4PMAmdHX
 GxBYxLVdSIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="318390375"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2020 09:43:51 -0700
Date: Tue, 21 Jul 2020 09:50:36 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 4/7] iommu/vt-d: Handle non-page aligned address
Message-ID: <20200721095036.1977e3bf@jacob-builder>
In-Reply-To: <1594080774-33413-5-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1594080774-33413-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594080774-33413-5-git-send-email-jacob.jun.pan@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

Hi Baolu,

Not sure what state is this patch in, there is a bug in this patch
(see below), shall I send out an updated version of this one only? or
another incremental patch.

Thanks,

Jacob

On Mon,  6 Jul 2020 17:12:51 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> From: Liu Yi L <yi.l.liu@intel.com>
> 
> Address information for device TLB invalidation comes from userspace
> when device is directly assigned to a guest with vIOMMU support.
> VT-d requires page aligned address. This patch checks and enforce
> address to be page aligned, otherwise reserved bits can be set in the
> invalidation descriptor. Unrecoverable fault will be reported due to
> non-zero value in the reserved bits.
> 
> Fixes: 61a06a16e36d8 ("iommu/vt-d: Support flushing more translation
> cache types")
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> 
> ---
>  drivers/iommu/intel/dmar.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index d9f973fa1190..b2c53bada905 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1455,9 +1455,25 @@ void qi_flush_dev_iotlb_pasid(struct
> intel_iommu *iommu, u16 sid, u16 pfsid,
>  	 * Max Invs Pending (MIP) is set to 0 for now until we have
> DIT in
>  	 * ECAP.
>  	 */
> -	desc.qw1 |= addr & ~mask;
> -	if (size_order)
> +	if (addr & GENMASK_ULL(size_order + VTD_PAGE_SHIFT, 0))
> +		pr_warn_ratelimited("Invalidate non-aligned address
> %llx, order %d\n", addr, size_order); +
> +	/* Take page address */
> +	desc.qw1 = QI_DEV_EIOTLB_ADDR(addr);
> +
> +	if (size_order) {
> +		/*
> +		 * Existing 0s in address below size_order may be
> the least
> +		 * significant bit, we must set them to 1s to avoid
> having
> +		 * smaller size than desired.
> +		 */
> +		desc.qw1 |= GENMASK_ULL(size_order + VTD_PAGE_SHIFT,
> +					VTD_PAGE_SHIFT);
Yi reported the issue, it should be:
desc.qw1 |= GENMASK_ULL(size_order + VTD_PAGE_SHIFT - 1,
					VTD_PAGE_SHIFT);

> +		/* Clear size_order bit to indicate size */
> +		desc.qw1 &= ~mask;
> +		/* Set the S bit to indicate flushing more than 1
> page */ desc.qw1 |= QI_DEV_EIOTLB_SIZE;
> +	}
>  
>  	qi_submit_sync(iommu, &desc, 1, 0);
>  }

[Jacob Pan]

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
