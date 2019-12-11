Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00411A043
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 01:55:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4CA586C3E;
	Wed, 11 Dec 2019 00:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0dOritAgQeY; Wed, 11 Dec 2019 00:55:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2618986C2B;
	Wed, 11 Dec 2019 00:55:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 079CEC0881;
	Wed, 11 Dec 2019 00:55:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AACB5C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 00:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A638786C3E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 00:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZ97fgfmGFfJ for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 00:55:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D07AE86C2B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 00:55:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 16:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="225336040"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 10 Dec 2019 16:55:05 -0800
Subject: Re: [PATCH] iommu: set group default domain before creating direct
 mappings
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
References: <20191210185606.11329-1-jsnitsel@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <49bca506-1f6a-ab2d-fac0-302073737af7@linux.intel.com>
Date: Wed, 11 Dec 2019 08:54:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210185606.11329-1-jsnitsel@redhat.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 stable@vger.kernel.org
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

Hi,

On 12/11/19 2:56 AM, Jerry Snitselaar wrote:
> iommu_group_create_direct_mappings uses group->default_domain, but
> right after it is called, request_default_domain_for_dev calls
> iommu_domain_free for the default domain, and sets the group default
> domain to a different domain. Move the
> iommu_group_create_direct_mappings call to after the group default
> domain is set, so the direct mappings get associated with that domain.
> 
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>

This fix looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> Cc: iommu@lists.linux-foundation.org
> Cc: stable@vger.kernel.org
> Fixes: 7423e01741dd ("iommu: Add API to request DMA domain for device")
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>   drivers/iommu/iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index db7bfd4f2d20..fa908179b80b 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2282,13 +2282,13 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
>   		goto out;
>   	}
>   
> -	iommu_group_create_direct_mappings(group, dev);
> -
>   	/* Make the domain the default for this group */
>   	if (group->default_domain)
>   		iommu_domain_free(group->default_domain);
>   	group->default_domain = domain;
>   
> +	iommu_group_create_direct_mappings(group, dev);
> +
>   	dev_info(dev, "Using iommu %s mapping\n",
>   		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
