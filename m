Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B95687B6
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 14:03:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A864028F;
	Wed,  6 Jul 2022 12:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A864028F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jD1jksU5v15M; Wed,  6 Jul 2022 12:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 586EE41844;
	Wed,  6 Jul 2022 12:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586EE41844
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DCD9C0077;
	Wed,  6 Jul 2022 12:03:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71A13C002D;
 Wed,  6 Jul 2022 12:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B00C40B3D;
 Wed,  6 Jul 2022 12:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B00C40B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qzx923sxIlBk; Wed,  6 Jul 2022 12:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EBD140B3C
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EBD140B3C;
 Wed,  6 Jul 2022 12:03:49 +0000 (UTC)
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LdJ673vf3z6H7lp;
 Wed,  6 Jul 2022 20:01:03 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 6 Jul 2022 14:03:45 +0200
Received: from [10.126.171.66] (10.126.171.66) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Jul 2022 13:03:44 +0100
Message-ID: <5ab934ff-0b16-0b55-e0f1-36366cd33e84@huawei.com>
Date: Wed, 6 Jul 2022 13:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RESEND v5 1/5] iommu: Refactor iommu_group_store_type()
To: Will Deacon <will@kernel.org>
References: <1649071634-188535-1-git-send-email-john.garry@huawei.com>
 <1649071634-188535-2-git-send-email-john.garry@huawei.com>
 <20220706120059.GE2403@willie-the-truck>
In-Reply-To: <20220706120059.GE2403@willie-the-truck>
X-Originating-IP: [10.126.171.66]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, mst@redhat.com, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, jasowang@redhat.com
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

On 06/07/2022 13:00, Will Deacon wrote:
> On Mon, Apr 04, 2022 at 07:27:10PM +0800, John Garry wrote:
>> Function iommu_group_store_type() supports changing the default domain
>> of an IOMMU group.
>>
>> Many conditions need to be satisfied and steps taken for this action to be
>> successful.
>>
>> Satisfying these conditions and steps will be required for setting other
>> IOMMU group attributes, so factor into a common part and a part specific
>> to update the IOMMU group attribute.
>>
>> No functional change intended.
>>
>> Some code comments are tidied up also.
>>
>> Signed-off-by: John Garry<john.garry@huawei.com>
>> ---
>>   drivers/iommu/iommu.c | 96 ++++++++++++++++++++++++++++---------------
>>   1 file changed, 62 insertions(+), 34 deletions(-)
> Acked-by: Will Deacon<will@kernel.org>
> 

Thanks, but currently I have no plans to progress this series, in favour 
of this 
https://lore.kernel.org/linux-iommu/1656590892-42307-1-git-send-email-john.garry@huawei.com/T/#me0e806913050c95f6e6ba2c7f7d96d51ce191204

cheers

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
