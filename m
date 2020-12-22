Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12C2DAE7F
	for <lists.iommu@lfdr.de>; Tue, 15 Dec 2020 15:05:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 744F787371;
	Tue, 15 Dec 2020 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kzKZukvsfr6; Tue, 15 Dec 2020 14:05:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D2CE872FC;
	Tue, 15 Dec 2020 14:05:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28BEAC1DA2;
	Tue, 15 Dec 2020 14:05:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BFC8C013B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 14:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0E6E62076E
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 14:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnjIcp14nUKr for <iommu@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:05:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 72D7720554
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 14:05:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797B130E;
 Tue, 15 Dec 2020 06:05:08 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF31D3F66B;
 Tue, 15 Dec 2020 06:05:07 -0800 (PST)
Subject: Re: [PATCH] drivers/iommu: fix null-ptr-deref bug of
 rk_iommu_from_dev's ret-val
To: tangzhenhao <tzh18@mails.tsinghua.edu.cn>, iommu@lists.linux-foundation.org
References: <20201215041541.47373-1-tzh18@mails.tsinghua.edu.cn>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c75b3bd9-089b-8b10-f932-a0b425761d89@arm.com>
Date: Tue, 15 Dec 2020 14:05:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215041541.47373-1-tzh18@mails.tsinghua.edu.cn>
Content-Language: en-GB
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

On 2020-12-15 04:15, tangzhenhao wrote:
> From: Sugar <tzh18@mails.tsinghua.edu.cn>
> 
> we should check the ret-val of function rk_iommu_from_dev to avoid null-ptr-deref.
> 
> Signed-off-by: Sugar <tzh18@mails.tsinghua.edu.cn>
> ---
>   drivers/iommu/rockchip-iommu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index e5d86b7177de..311d9eec06f4 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1064,6 +1064,9 @@ static struct iommu_device *rk_iommu_probe_device(struct device *dev)
>   		return ERR_PTR(-ENODEV);
>   
>   	iommu = rk_iommu_from_dev(dev);
> +	if (!iommu) {
> +		return ERR_PTR(-ENODEV);
> +	}

Under what circumstances can data be valid but data->iommu be NULL? Note 
that if data (i.e. iommu->priv) itself was NULL we couldn't have reached 
this point.

>   	data->link = device_link_add(dev, iommu->dev,
>   				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> @@ -1083,6 +1086,9 @@ static struct iommu_group *rk_iommu_device_group(struct device *dev)
>   	struct rk_iommu *iommu;
>   
>   	iommu = rk_iommu_from_dev(dev);
> +	if (!iommu) {
> +		return ERR_PTR(-ENODEV);
> +	}

How can this possibly be NULL if rk_iommu_probe_device() succeeded such 
that iommu_group_get_for_dev() could be called in the first place?

>   
>   	return iommu_group_ref_get(iommu->group);
>   }
> 

If you've actually hit a bug in practice, please include a bit more 
detail in the commit message so that everyone can understand the 
circumstances of the crash better. If on the other hand you're only 
trying to find theoretical bugs by code inspection, please try to 
understand the code *in context*. Adding checks for conditions that can 
only happen due to random memory corruption is not worthwhile.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
