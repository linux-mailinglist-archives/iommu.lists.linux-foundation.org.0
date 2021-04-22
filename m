Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1E36779E
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 04:56:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A07C4069D;
	Thu, 22 Apr 2021 02:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIV7MAesK8EC; Thu, 22 Apr 2021 02:56:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508344068B;
	Thu, 22 Apr 2021 02:56:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20D3AC000B;
	Thu, 22 Apr 2021 02:56:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F48C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 02:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FFEA4039E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 02:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crht64k0MHe0 for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 02:56:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BED9B40002
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 02:56:11 +0000 (UTC)
IronPort-SDR: U6sWEcvuOoqLKvOyEf3lMBJaBZ/Yv93C+EM9cpQwqB1htBROVGIrrGrl9IOl9WkvJXXXMXlzoE
 iBXBtMBb0+Vg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195372415"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="195372415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 19:56:09 -0700
IronPort-SDR: KJiZnzHyJabZvX/+Np71+BAyI3aZRBCq19+5TKA2sv6jnYpEs14H/e6Ck8lmabicUpuinf73Yg
 DNPSWbjZrcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="455600224"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 19:56:08 -0700
Subject: Re: [PATCH] Intel IOMMU: fix sysfs leak in hotplug init path
To: Rolf Eike Beer <eb@emlix.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <1716403.SmlLz2RZUD@devpool47>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f14bd336-bc77-bba9-05f3-3f57f34c59e3@linux.intel.com>
Date: Thu, 22 Apr 2021 10:46:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1716403.SmlLz2RZUD@devpool47>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
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

Hi Rolf,

On 4/21/21 11:12 PM, Rolf Eike Beer wrote:
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>

Thanks for the patch!

Can you please adjust the subject to "iommu/vt-d: Fix sysfs leak in
alloc_domain()"? It's not only for hotplug path.

Please also add commit message.

Add below Fixes tag as well:

Fixes: 39ab9555c2411 ("iommu: Add sysfs bindings for struct iommu_device")

> ---
>   drivers/iommu/intel/dmar.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> I have not actually tested this but I guess it should match the code in
> free_iommu() just below.
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index d5c51b5c20af..fb37a9b79b3a 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1144,7 +1144,7 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
>   
>   		err = iommu_device_register(&iommu->iommu);
>   		if (err)
> -			goto err_unmap;
> +			goto err_unregister;
>   	}
>   
>   	drhd->iommu = iommu;
> @@ -1152,6 +1152,8 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
>   
>   	return 0;
>   
> +err_unregister:
> +	iommu_device_sysfs_remove(&iommu->iommu);
>   err_unmap:
>   	unmap_iommu(iommu);
>   error_free_seq_id:
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
