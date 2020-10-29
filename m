Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB4D29ECBA
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 14:19:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 74F572014A;
	Thu, 29 Oct 2020 13:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoTbiUyTOp1F; Thu, 29 Oct 2020 13:19:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 644112284F;
	Thu, 29 Oct 2020 13:19:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04DF7C0051;
	Thu, 29 Oct 2020 13:19:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69537C0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5517386443
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBf6iJrHAhjj for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 13:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 66BB386404
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:19:17 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CMQyD4Gzyz70Kr;
 Thu, 29 Oct 2020 21:19:16 +0800 (CST)
Received: from [10.174.179.62] (10.174.179.62) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 21:19:05 +0800
Subject: Re: [PATCH] iommu/rockchip: check return value of
 of_find_device_by_node() in rk_iommu_of_xlate()
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <heiko@sntech.de>, 
 <jeffy.chen@rock-chips.com>
References: <20201029092202.900218-1-yukuai3@huawei.com>
 <98dec09e-08a1-6550-fa4e-85a8104b90e1@arm.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <35ff5111-1270-fc88-788c-4fb9e38faa85@huawei.com>
Date: Thu, 29 Oct 2020 21:19:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <98dec09e-08a1-6550-fa4e-85a8104b90e1@arm.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
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


On 2020/10/29 18:08, Robin Murphy wrote:
> On 2020-10-29 09:22, Yu Kuai wrote:
>> If of_find_device_by_node() failed in rk_iommu_of_xlate(), null pointer
>> dereference will be triggered. Thus return error code if
>> of_find_device_by_node() failed.
> 
> How can that happen? (Given that ".suppress_bind_attrs = true")
> 
> Robin.

I'm not sure if that could happen...

My thought is that it's better to do such checking to aviod any possible
problem.

Thanks!
Yu Kuai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
