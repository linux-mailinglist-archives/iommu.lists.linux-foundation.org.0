Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB881A3253
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 12:14:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D276787A33;
	Thu,  9 Apr 2020 10:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoaCvC0uPrfK; Thu,  9 Apr 2020 10:14:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C56487A15;
	Thu,  9 Apr 2020 10:14:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BB90C1D89;
	Thu,  9 Apr 2020 10:14:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2D46C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 10:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC41E204B1
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 10:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgYDRaMvtn53 for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 10:14:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E787203BD
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586427282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CTnIFk7SlnjgfgjAutkIHAGc8WK5Yz+a7QSuHJlIns=;
 b=b8uzVnoOXS9VVDlnnOZr3lOZIOk/xjg4YT5oKywMOEkXwtC2nyMJJRA/EeDfvw6RoTO+Ch
 YAK72BPvdcmGVIlAibjWKdsJqVl567eWfV8ObUltLB7GySFbhG3k/eZRZHgeDvIuskj6HC
 IXSwdq18v2url2vj4PcsWCnNyjl5FhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-08xiuF_KNYOglmQhzs9DPA-1; Thu, 09 Apr 2020 06:14:40 -0400
X-MC-Unique: 08xiuF_KNYOglmQhzs9DPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A787B149C0;
 Thu,  9 Apr 2020 10:14:38 +0000 (UTC)
Received: from [10.36.115.53] (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 231CAD766F;
 Thu,  9 Apr 2020 10:14:32 +0000 (UTC)
Subject: Re: [PATCH v11 08/10] iommu/vt-d: Cache virtual command capability
 register
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-9-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <43e7452c-dea8-934c-105e-05798cb1d225@redhat.com>
Date: Thu, 9 Apr 2020 12:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1585939334-21396-9-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> Virtual command registers are used in the guest only, to prevent
> vmexit cost, we cache the capability and store it during initialization.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
nit: following Joerg's comment on 02/10, may be worth squashing it into
the patch that uses it (10/10)

Thanks

Eric
> 
> ---
> v7 Reviewed by Eric & Baolu
> ---
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/dmar.c        | 1 +
>  include/linux/intel-iommu.h | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> index 4d6b7b5b37ee..3b36491c8bbb 100644
> --- a/drivers/iommu/dmar.c
> +++ b/drivers/iommu/dmar.c
> @@ -963,6 +963,7 @@ static int map_iommu(struct intel_iommu *iommu, u64 phys_addr)
>  		warn_invalid_dmar(phys_addr, " returns all ones");
>  		goto unmap;
>  	}
> +	iommu->vccap = dmar_readq(iommu->reg + DMAR_VCCAP_REG);
>  
>  	/* the registers might be more than one page */
>  	map_size = max_t(int, ecap_max_iotlb_offset(iommu->ecap),
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index f775bb825343..e02a96848586 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -194,6 +194,9 @@
>  #define ecap_max_handle_mask(e) ((e >> 20) & 0xf)
>  #define ecap_sc_support(e)	((e >> 7) & 0x1) /* Snooping Control */
>  
> +/* Virtual command interface capability */
> +#define vccap_pasid(v)		((v & DMA_VCS_PAS)) /* PASID allocation */
> +
>  /* IOTLB_REG */
>  #define DMA_TLB_FLUSH_GRANU_OFFSET  60
>  #define DMA_TLB_GLOBAL_FLUSH (((u64)1) << 60)
> @@ -287,6 +290,7 @@
>  
>  /* PRS_REG */
>  #define DMA_PRS_PPR	((u32)1)
> +#define DMA_VCS_PAS	((u64)1)
>  
>  #define IOMMU_WAIT_OP(iommu, offset, op, cond, sts)			\
>  do {									\
> @@ -562,6 +566,7 @@ struct intel_iommu {
>  	u64		reg_size; /* size of hw register set */
>  	u64		cap;
>  	u64		ecap;
> +	u64		vccap;
>  	u32		gcmd; /* Holds TE, EAFL. Don't need SRTP, SFL, WBF */
>  	raw_spinlock_t	register_lock; /* protect register handling */
>  	int		seq_id;	/* sequence id of the iommu */
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
