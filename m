Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B43362C99
	for <lists.iommu@lfdr.de>; Sat, 17 Apr 2021 03:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F9784C5C;
	Sat, 17 Apr 2021 01:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebLbjCNOpoJI; Sat, 17 Apr 2021 01:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E9984BF3;
	Sat, 17 Apr 2021 01:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02C1BC000A;
	Sat, 17 Apr 2021 01:11:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 144B4C000A
 for <iommu@lists.linux-foundation.org>; Sat, 17 Apr 2021 01:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDCD360669
 for <iommu@lists.linux-foundation.org>; Sat, 17 Apr 2021 01:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiTeHYlc-QuI for <iommu@lists.linux-foundation.org>;
 Sat, 17 Apr 2021 01:11:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C24916064B
 for <iommu@lists.linux-foundation.org>; Sat, 17 Apr 2021 01:11:07 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FMZhq67RWz7vFC;
 Sat, 17 Apr 2021 09:08:43 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 17 Apr 2021 09:10:55 +0800
Subject: Re: [PATCH 5/8] iommu: fix a couple of spelling mistakes
To: John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 "David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
 <20210326062412.1262-6-thunder.leizhen@huawei.com>
 <e04d117a-4832-7f95-7adf-dbece21aad8c@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <b3bd3aed-f02f-2056-1d98-ef164974b0ea@huawei.com>
Date: Sat, 17 Apr 2021 09:10:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e04d117a-4832-7f95-7adf-dbece21aad8c@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
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



On 2021/4/16 23:55, John Garry wrote:
> On 26/03/2021 06:24, Zhen Lei wrote:
>> There are several spelling mistakes, as follows:
>> funcions ==> functions
>> distiguish ==> distinguish
>> detroyed ==> destroyed
>>
>> Signed-off-by: Zhen Lei<thunder.leizhen@huawei.com>
> 
> I think that there should be a /s/appropriatley/appropriately/ in iommu.c

OK, I will fix it in v2.

> 
> Thanks,
> john
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
