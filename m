Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4C4A4CB9
	for <lists.iommu@lfdr.de>; Mon, 31 Jan 2022 18:06:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A05883490;
	Mon, 31 Jan 2022 17:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AloWMgY7zwXV; Mon, 31 Jan 2022 17:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7B24483DF8;
	Mon, 31 Jan 2022 17:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57857C000B;
	Mon, 31 Jan 2022 17:06:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8555C000B
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 913A560BDA
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 17:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMnkSZXYs0xG for <iommu@lists.linux-foundation.org>;
 Mon, 31 Jan 2022 17:06:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F2D360AA5
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 17:06:43 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JnZBT0rMfz67Pf9;
 Tue,  1 Feb 2022 01:02:57 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Mon, 31 Jan 2022 18:06:39 +0100
Received: from [10.47.91.239] (10.47.91.239) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 31 Jan
 2022 17:06:39 +0000
Subject: Re: [PATCH] iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
To: Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>
References: <20220131161749.4021-1-joro@8bytes.org>
Message-ID: <48a674ae-f5cd-fc06-4505-6d863e6dad69@huawei.com>
Date: Mon, 31 Jan 2022 17:06:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20220131161749.4021-1-joro@8bytes.org>
Content-Language: en-US
X-Originating-IP: [10.47.91.239]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 31/01/2022 16:17, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The polling loop for the register change in iommu_ga_log_enable() needs
> to have a udelay() in it.  Otherwise the CPU might be faster than the
> IOMMU hardware and wrongly trigger the WARN_ON() further down the code
> stream.
> 
> Fixes: 8bda0cfbdc1a ("iommu/amd: Detect and initialize guest vAPIC log")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/amd/init.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index dc338acf3338..d2e09d53851f 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -834,6 +834,7 @@ static int iommu_ga_log_enable(struct amd_iommu *iommu)
>   		status = readl(iommu->mmio_base + MMIO_STATUS_OFFSET);
>   		if (status & (MMIO_STATUS_GALOG_RUN_MASK))
>   			break;
> +		udelay(1);

Maybe readl_relaxed_poll_timeout_atomic() could be used instead

Thanks,
John

>   	}
>   
>   	if (WARN_ON(i >= LOOP_TIMEOUT))
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
