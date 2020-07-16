Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B49221E9E
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 10:41:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B3364214EB;
	Thu, 16 Jul 2020 08:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nr8DV1GneFN; Thu, 16 Jul 2020 08:41:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E1FE2052E;
	Thu, 16 Jul 2020 08:41:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64E5DC0733;
	Thu, 16 Jul 2020 08:41:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40B82C0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 26376200E5
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V+yu3jI2b72M for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 2798D2052E
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594888857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JoxqAmTFw434/QVJaUcaRG4zXwjowYpW92aIp44qUc=;
 b=itth0U3XqylnOlsFoxH4olvInbkO5+tBOl1EpPuiNx7a7s31w6h/VFvL6WaoDTyW8wN53V
 /r8AUVOEO+QjEA8nndoMOCZpdzTFxazGw41JTk26uIPxE0IETrJea1IH4DmzWRtaubh8XQ
 lyFW6kUDhmULmOHnVwsRQeQakXBqWnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-Z6Si8xQgPLCeaoFso_z7uQ-1; Thu, 16 Jul 2020 04:40:54 -0400
X-MC-Unique: Z6Si8xQgPLCeaoFso_z7uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED61107ACCA;
 Thu, 16 Jul 2020 08:40:52 +0000 (UTC)
Received: from [10.36.115.54] (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 362D274F64;
 Thu, 16 Jul 2020 08:40:49 +0000 (UTC)
Subject: Re: [PATCH v4 6/7] iommu/vt-d: Warn on out-of-range invalidation
 address
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <1594080774-33413-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594080774-33413-7-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8a0a2896-74f9-94a9-f401-c46d9d157023@redhat.com>
Date: Thu, 16 Jul 2020 10:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1594080774-33413-7-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Hi Jacob,

On 7/7/20 2:12 AM, Jacob Pan wrote:
> For guest requested IOTLB invalidation, address and mask are provided as
> part of the invalidation data. VT-d HW silently ignores any address bits
> below the mask. SW shall also allow such case but give warning if
> address does not align with the mask. This patch relax the fault
> handling from error to warning and proceed with invalidation request
> with the given mask.
> 
> Fixes: 6ee1b77ba3ac0 ("iommu/vt-d: Add svm/sva invalidate function")
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
following your replies on my v3 comments,

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  drivers/iommu/intel/iommu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 3bf03c6cd15f..c3a9a85a3c3f 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5439,13 +5439,12 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  
>  		switch (BIT(cache_type)) {
>  		case IOMMU_CACHE_INV_TYPE_IOTLB:
> +			/* HW will ignore LSB bits based on address mask */
>  			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
>  			    size &&
>  			    (inv_info->addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> -				pr_err_ratelimited("Address out of range, 0x%llx, size order %llu\n",
> -						   inv_info->addr_info.addr, size);
> -				ret = -ERANGE;
> -				goto out_unlock;
> +				pr_err_ratelimited("User address not aligned, 0x%llx, size order %llu\n",
> +					  inv_info->addr_info.addr, size);
>  			}
>  
>  			/*
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
