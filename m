Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F374359261
	for <lists.iommu@lfdr.de>; Fri,  9 Apr 2021 05:02:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F1E4013B;
	Fri,  9 Apr 2021 03:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQP9bRL-Bnoo; Fri,  9 Apr 2021 03:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EA8D40162;
	Fri,  9 Apr 2021 03:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26C28C000A;
	Fri,  9 Apr 2021 03:02:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95ACAC000A
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 03:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0814013E
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 03:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5Nsyvv0KWxb for <iommu@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 03:02:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 101F74013B
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 03:02:21 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGjXJ6HKGznZ5n;
 Fri,  9 Apr 2021 10:59:28 +0800 (CST)
Received: from [10.67.77.175] (10.67.77.175) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 9 Apr 2021 11:02:11 +0800
Subject: Re: [PATCH] iommu/amd: Remove duplicate check of devid
To: <iommu@lists.linux-foundation.org>
References: <1617931879-33139-1-git-send-email-zhangshaokun@hisilicon.com>
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <b3be63e1-ab81-8d56-581e-897d6640acee@hisilicon.com>
Date: Fri, 9 Apr 2021 11:02:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617931879-33139-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Language: en-US
X-Originating-IP: [10.67.77.175]
X-CFilter-Loop: Reflected
Cc: Will Deacon <will@kernel.org>
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

Apologies for my mistake:

devid = get_device_id(dev) is need, only the check is unnecessary.

Thanks,
Shaokun

On 2021/4/9 9:31, Shaokun Zhang wrote:
> 'devid' has been checked in function check_device, no need to double
> check and clean up this.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/iommu/amd/iommu.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index b4fa94a97446..4130df7c30c6 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1676,10 +1676,6 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
>  	if (!check_device(dev))
>  		return ERR_PTR(-ENODEV);
>  
> -	devid = get_device_id(dev);
> -	if (devid < 0)
> -		return ERR_PTR(devid);
> -
>  	iommu = amd_iommu_rlookup_table[devid];
>  
>  	if (dev_iommu_priv_get(dev))
> @@ -1967,10 +1963,6 @@ static void amd_iommu_detach_device(struct iommu_domain *dom,
>  	if (!check_device(dev))
>  		return;
>  
> -	devid = get_device_id(dev);
> -	if (devid < 0)
> -		return;
> -
>  	if (dev_data->domain != NULL)
>  		detach_device(dev);
>  
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
