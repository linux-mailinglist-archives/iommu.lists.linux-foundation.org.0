Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83F3A0986
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 03:41:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FCBD402BC;
	Wed,  9 Jun 2021 01:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JB7Z3L-Q1KId; Wed,  9 Jun 2021 01:41:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 029C6402BF;
	Wed,  9 Jun 2021 01:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C871AC0024;
	Wed,  9 Jun 2021 01:41:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98A50C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 01:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796EC83A68
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 01:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7Dtg3Uofvva for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 01:41:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BC51839DD
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 01:41:13 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G08qL4kCZz6vm6;
 Wed,  9 Jun 2021 09:37:18 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 09:41:09 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 09:41:09 +0800
Subject: Re: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
To: Will Deacon <will@kernel.org>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
 <20210510035425.3212-2-thunder.leizhen@huawei.com>
 <20210608093845.GC8935@willie-the-truck>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <6c5d2840-c329-1e23-00ac-b063dd0d2b74@huawei.com>
Date: Wed, 9 Jun 2021 09:41:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210608093845.GC8935@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Robin Murphy <robin.murphy@arm.com>, iommu <iommu@lists.linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
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



On 2021/6/8 17:38, Will Deacon wrote:
> On Mon, May 10, 2021 at 11:54:25AM +0800, Zhen Lei wrote:
>> All spelling mistakes are in the comments, no functional change.
> 
> [...]
> 
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
>>   * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
>>   * bit32 of the CPU physical address always is needed to set, and for Region
>>   * 'E', the CPU physical address keep as is.
>> - * Additionally, The iommu consumers always use the CPU phyiscal address.
>> + * Additionally, The iommu consumers always use the CPU physical address.
> 
> If we're fixing typos, then I think the 'T' in "The iommu" should be
> lowercase here.

OK, I will change it.

In addition, the current linux-next has several new spelling errors.

> 
> Anyway, all the other fixes look correct to me. I'll leave it up to Joerg as
> to whether he wants to apply this or not, given the impact on git blame and
> the potential for conflicts.

Currently, there are no conflicts in linux-next.

> 
> Will
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
