Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E132B5BE2
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 10:40:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25B5B85B73;
	Tue, 17 Nov 2020 09:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0aw60q5bG2q; Tue, 17 Nov 2020 09:40:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 770FE85ABE;
	Tue, 17 Nov 2020 09:40:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68C74C07FF;
	Tue, 17 Nov 2020 09:40:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CDCBC07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 09:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1FB620432
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 09:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYyzB84tfBo7 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 09:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 09A85203A9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 09:40:28 +0000 (UTC)
IronPort-SDR: KiuNxAjnL10U0g1wtPMQpL+Vp/T/lHSyMvi9503kF7Ir6qjmVOuXrAFalF3MALds0CVVu99X9J
 nDABe+bFZgmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="150163101"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="150163101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 01:40:28 -0800
IronPort-SDR: 9AsrYM+adnWGB4Kk6D6oTAxWpSRW8QvUGbbtkQOgp7+RD7Psnm1sC0mJDUnJN6yC6ZbOXqUnyW
 guA7es+NYjaQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="367806571"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.201])
 ([10.254.210.201])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 01:40:27 -0800
Subject: Re: [PATCH] iommu: fix return error code in iommu_probe_device()
To: Yang Yingliang <yangyingliang@huawei.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201117025238.3425422-1-yangyingliang@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <835ab066-b6b8-a211-4941-c01781031de8@linux.intel.com>
Date: Tue, 17 Nov 2020 17:40:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201117025238.3425422-1-yangyingliang@huawei.com>
Content-Language: en-US
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

Hi Yingliang,

On 2020/11/17 10:52, Yang Yingliang wrote:
> If iommu_group_get() failed, it need return error code
> in iommu_probe_device().
> 
> Fixes: cf193888bfbd ("iommu: Move new probe_device path...")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/iommu/iommu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b53446bb8c6b..6f4a32df90f6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -253,8 +253,10 @@ int iommu_probe_device(struct device *dev)
>   		goto err_out;
>   
>   	group = iommu_group_get(dev);
> -	if (!group)
> +	if (!group) {
> +		ret = -ENODEV;

Can you please explain why you use -ENODEV here?

Best regards,
baolu

>   		goto err_release;
> +	}
>   
>   	/*
>   	 * Try to allocate a default domain - needs support from the
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
