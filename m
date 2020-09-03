Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F46125BDF5
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 10:56:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 362CF86F12;
	Thu,  3 Sep 2020 08:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psPporfDsKNU; Thu,  3 Sep 2020 08:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9909E86BA1;
	Thu,  3 Sep 2020 08:56:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AD86C0051;
	Thu,  3 Sep 2020 08:56:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BFF6C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72CAC20470
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4XA5qb2dxp6 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 08:56:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F704203DE
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599123389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ex8sJsf3MwM3gMU7gFxAPmbLmVJ5LgmUnE9JDMtOUlE=;
 b=dacaHzkHGppy4GtD+vgNsXho39ZxeKaHG2rmzNZjPD46WfzHzpH96HxUTr0LtxvQ+BGrWA
 8OphUBxMRaizcnS4R2iFFYzKltFVoG221WJ5ZRS+rRPaWfeVh3234mu9FgN+jINZkJiHzZ
 Ib6zwvBT/5VOiWt1zZxSpLyc7n9I9Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-JU0LndOANy2n5FO2ndAe1A-1; Thu, 03 Sep 2020 04:56:26 -0400
X-MC-Unique: JU0LndOANy2n5FO2ndAe1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DA81801AAB;
 Thu,  3 Sep 2020 08:56:24 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 481995D9CC;
 Thu,  3 Sep 2020 08:56:17 +0000 (UTC)
Subject: Re: [PATCH v8 7/7] iommu/vt-d: Check UAPI data processed by IOMMU core
To: Jacob Pan <jacob.pan.linux@gmail.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1598898300-65475-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1598898300-65475-8-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <041fbe2e-3105-8356-6469-be77f73a0d01@redhat.com>
Date: Thu, 3 Sep 2020 10:56:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1598898300-65475-8-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Christoph Hellwig <hch@infradead.org>, David Woodhouse <dwmw2@infradead.org>
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
On 8/31/20 8:25 PM, Jacob Pan wrote:
> IOMMU generic layer already does sanity checks on UAPI data for version
> match and argsz range based on generic information.
> 
> This patch adjusts the following data checking responsibilities:
> - removes the redundant version check from VT-d driver
> - removes the check for vendor specific data size
> - adds check for the use of reserved/undefined flags
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  drivers/iommu/intel/iommu.c |  3 +--
>  drivers/iommu/intel/svm.c   | 11 +++++++++--
>  include/uapi/linux/iommu.h  |  1 +
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 43f16f0cebde..a3a0b5c8921d 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5399,8 +5399,7 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  	int ret = 0;
>  	u64 size = 0;
>  
> -	if (!inv_info || !dmar_domain ||
> -	    inv_info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> +	if (!inv_info || !dmar_domain)
>  		return -EINVAL;
>  
>  	if (!dev || !dev_is_pci(dev))
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index 99353d6468fa..0cb9a15f1112 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -284,8 +284,15 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
>  	if (WARN_ON(!iommu) || !data)
>  		return -EINVAL;
>  
> -	if (data->version != IOMMU_GPASID_BIND_VERSION_1 ||
> -	    data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
> +	if (data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
> +		return -EINVAL;
> +
> +	/* IOMMU core ensures argsz is more than the start of the union */
> +	if (data->argsz < offsetofend(struct iommu_gpasid_bind_data, vendor.vtd))
> +		return -EINVAL;
> +
> +	/* Make sure no undefined flags are used in vendor data */
> +	if (data->vendor.vtd.flags & ~(IOMMU_SVA_VTD_GPASID_LAST - 1))
>  		return -EINVAL;
>  
>  	if (!dev_is_pci(dev))
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index c64bca5af419..1ebc23df4fbc 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -288,6 +288,7 @@ struct iommu_gpasid_bind_data_vtd {
>  #define IOMMU_SVA_VTD_GPASID_PWT	(1 << 3) /* page-level write through */
>  #define IOMMU_SVA_VTD_GPASID_EMTE	(1 << 4) /* extended mem type enable */
>  #define IOMMU_SVA_VTD_GPASID_CD		(1 << 5) /* PASID-level cache disable */
> +#define IOMMU_SVA_VTD_GPASID_LAST	(1 << 6)
>  	__u64 flags;
>  	__u32 pat;
>  	__u32 emt;
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
