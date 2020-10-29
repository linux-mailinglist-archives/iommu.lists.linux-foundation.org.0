Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 745DD29E86A
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 11:08:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31B1786B31;
	Thu, 29 Oct 2020 10:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toDUTffn7sLb; Thu, 29 Oct 2020 10:08:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C96686B46;
	Thu, 29 Oct 2020 10:08:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E893C0051;
	Thu, 29 Oct 2020 10:08:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 060CBC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 10:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6E4F203D2
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 10:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GloUTYEMeQm5 for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 10:08:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id C729F203BA
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 10:08:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EC7B139F;
 Thu, 29 Oct 2020 03:08:04 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95AE73F66E;
 Thu, 29 Oct 2020 03:08:02 -0700 (PDT)
Subject: Re: [PATCH] iommu/rockchip: check return value of
 of_find_device_by_node() in rk_iommu_of_xlate()
To: Yu Kuai <yukuai3@huawei.com>, joro@8bytes.org, heiko@sntech.de,
 jeffy.chen@rock-chips.com
References: <20201029092202.900218-1-yukuai3@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <98dec09e-08a1-6550-fa4e-85a8104b90e1@arm.com>
Date: Thu, 29 Oct 2020 10:08:01 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029092202.900218-1-yukuai3@huawei.com>
Content-Language: en-GB
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yi.zhang@huawei.com
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

On 2020-10-29 09:22, Yu Kuai wrote:
> If of_find_device_by_node() failed in rk_iommu_of_xlate(), null pointer
> dereference will be triggered. Thus return error code if
> of_find_device_by_node() failed.

How can that happen? (Given that ".suppress_bind_attrs = true")

Robin.

> Fixes: 5fd577c3eac3("iommu/rockchip: Use OF_IOMMU to attach devices automatically")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/iommu/rockchip-iommu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index e5d86b7177de..090d149ef8e9 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1099,6 +1099,9 @@ static int rk_iommu_of_xlate(struct device *dev,
>   
>   	iommu_dev = of_find_device_by_node(args->np);
>   
> +	if (!iommu_dev)
> +		return -ENODEV;
> +
>   	data->iommu = platform_get_drvdata(iommu_dev);
>   	dev_iommu_priv_set(dev, data);
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
