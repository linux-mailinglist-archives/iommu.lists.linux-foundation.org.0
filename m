Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA5349874
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:42:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F7360B29;
	Thu, 25 Mar 2021 17:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCvPULixcOre; Thu, 25 Mar 2021 17:42:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3000B60B25;
	Thu, 25 Mar 2021 17:42:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02FEFC000A;
	Thu, 25 Mar 2021 17:42:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609CAC000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4660340EA5
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7L6OTOdPugry for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:42:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C145405A2
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:42:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20CB5143D;
 Thu, 25 Mar 2021 10:42:17 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CED793F718;
 Thu, 25 Mar 2021 10:42:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Alloc building as module
To: Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
References: <20210323055801.16885-1-yong.wu@mediatek.com>
 <20210325171614.GA15433@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6fb1f2b1-3b85-ee91-a447-8aca8f4057d6@arm.com>
Date: Thu, 25 Mar 2021 17:42:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325171614.GA15433@willie-the-truck>
Content-Language: en-GB
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@chromium.com>, linux-arm-kernel@lists.infradead.org
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

^^Nit: presumably you meant "Allow" in the subject.

On 2021-03-25 17:16, Will Deacon wrote:
> On Tue, Mar 23, 2021 at 01:58:00PM +0800, Yong Wu wrote:
>> This patch only adds support for building the IOMMU-v1 driver as module.
>> Correspondingly switch the config to tristate.
>>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>> rebase on v5.12-rc2.
>> ---
>>   drivers/iommu/Kconfig        | 2 +-
>>   drivers/iommu/mtk_iommu_v1.c | 9 ++++-----
>>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> Both of these patches look fine to me, but you probably need to check
> the setting of MODULE_OWNER after:
> 
> https://lore.kernel.org/r/f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com

Right, furthermore I would rather expect these patches on their own to 
hit the problem that my patch tries to avoid - where since mtk_iommu_ops 
is const, the current version of iommu_device_set_ops() is liable to 
blow up trying to write to rodata.

In fact I do wonder a little why that wasn't happening already - maybe 
the compiler is clever enough to tell that the assignment is redundant 
when THIS_MODULE == 0, and elides it :/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
