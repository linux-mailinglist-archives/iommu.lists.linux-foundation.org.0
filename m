Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA22399C35
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 10:01:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E9F608C4;
	Thu,  3 Jun 2021 08:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQYYAjzyq0Sc; Thu,  3 Jun 2021 08:00:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C9E60818;
	Thu,  3 Jun 2021 08:00:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3312C0024;
	Thu,  3 Jun 2021 08:00:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E74AFC0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C77B8405BD
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKuRrRuoEHxy for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 08:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D47B40582
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:00:55 +0000 (UTC)
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FwdLK2htKz6J9Tk;
 Thu,  3 Jun 2021 15:48:25 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 10:00:52 +0200
Received: from [10.47.80.115] (10.47.80.115) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 3 Jun 2021
 09:00:51 +0100
Subject: Re: [PATCH v3 0/7] iommu: Allow IOVA rcache range be configured
To: Lu Baolu <baolu.lu@linux.intel.com>, <joro@8bytes.org>, <will@kernel.org>, 
 <robin.murphy@arm.com>
References: <1622557781-211697-1-git-send-email-john.garry@huawei.com>
 <834ad35a-7310-1738-7d17-7c061ca73e4c@linux.intel.com>
 <1cbf8cc2-8cee-0579-2514-56f664baa9cd@huawei.com>
 <5e6ff4d6-cd67-d4ab-814c-e10a258191b1@linux.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <74dd66d6-315c-3273-afaa-e6164b4ea33f@huawei.com>
Date: Thu, 3 Jun 2021 09:00:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <5e6ff4d6-cd67-d4ab-814c-e10a258191b1@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.47.80.115]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org
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

On 03/06/2021 01:39, Lu Baolu wrote:
>> I did actually try increasing the range for a 'live' domain in the v1 
>> series, but it turned out too messy. First problem is reallocating the 
>> memory to hold the rcaches. Second problem is that we need to deal 
>> with the issue that all IOVAs in the rcache need to be a pow-of-2, 
>> which is difficult to enforce for IOVAs which weren't being cached 
>> before, but now would be.
>>
>> So now I changed to work similar to how we change the default domain 
>> type, i.e. don't operate on a 'live' domain.
> 
> If these hard restrictions on users are just to walk around the messy
> code in kernel, I would rather solve those messy code to achieve a
> better user experience. :-)

Hi Baolu,

It's not that the code is messy. I'm just saying that it's difficult to 
change the rcache range of a live domain. So we take an approach similar 
to changing the domain default type - it is more straightforward to 
configure the rcache range that way.

Anyway, it would be great if you or anyone could look at the code so 
that some progress can be made here.

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
