Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F60367962
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 07:44:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3635860652;
	Thu, 22 Apr 2021 05:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOV2cqMcbI5l; Thu, 22 Apr 2021 05:44:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570D7605F9;
	Thu, 22 Apr 2021 05:44:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25964C001B;
	Thu, 22 Apr 2021 05:44:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5B7C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 05:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E187083D8D
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 05:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlrrin1Sx7YD for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 05:44:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 406F283D45
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 05:44:04 +0000 (UTC)
IronPort-SDR: 7GBihwkU9p98h+B5r57bWRrGt1u3jy5xSta57FSc16BNngY2caPe/9ghatDp4NcYEwKhRfxiMb
 8SxjhRNzU8nQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="281159934"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="281159934"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 22:44:03 -0700
IronPort-SDR: OiZdGW1Av586D5MrQvzGUrwiUhBfctjZwZ/+Pyckqj1gLR1228+nK0/UXRuR0T+h8rBfd6fxWF
 Px7Xo04WsKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="524527974"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2021 22:44:01 -0700
Subject: Re: [PATCH] iommu/vt-d: Fix sysfs leak in alloc_domain()
To: Rolf Eike Beer <eb@emlix.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <1716403.SmlLz2RZUD@devpool47>
 <17411490.HIIP88n32C@mobilepool36.emlix.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b13c4073-5976-b4e0-4dc7-4e07e68cbb5f@linux.intel.com>
Date: Thu, 22 Apr 2021 13:34:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <17411490.HIIP88n32C@mobilepool36.emlix.com>
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

On 4/22/21 1:39 PM, Rolf Eike Beer wrote:
> iommu_device_sysfs_add() is called before, so is has to be cleaned on subsequent
> errors.
> 
> Fixes: 39ab9555c2411 ("iommu: Add sysfs bindings for struct iommu_device")
> Cc: stable@vger.kernel.org # 4.11.x
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

P.S. Next time when you submit a new version, please use a version tag.

Best regards,
baolu

> ---
>   drivers/iommu/intel/dmar.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index d5c51b5c20af..c2bfccb19e24 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1144,7 +1144,7 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
>   
>   		err = iommu_device_register(&iommu->iommu);
>   		if (err)
> -			goto err_unmap;
> +			goto err_sysfs;
>   	}
>   
>   	drhd->iommu = iommu;
> @@ -1152,6 +1152,8 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
>   
>   	return 0;
>   
> +err_sysfs:
> +	iommu_device_sysfs_remove(&iommu->iommu);
>   err_unmap:
>   	unmap_iommu(iommu);
>   error_free_seq_id:
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
