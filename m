Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623F4C2BC7
	for <lists.iommu@lfdr.de>; Thu, 24 Feb 2022 13:33:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E32761043;
	Thu, 24 Feb 2022 12:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIYRMeHZa8rd; Thu, 24 Feb 2022 12:33:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 352566102E;
	Thu, 24 Feb 2022 12:33:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFCEFC0036;
	Thu, 24 Feb 2022 12:33:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB8D5C0011
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 12:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 937B54018F
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 12:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSNH3VzxdfpY for <iommu@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 12:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 680E6401D2
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 12:33:06 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K4C304K1Pz67dyM;
 Thu, 24 Feb 2022 20:32:12 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Thu, 24 Feb 2022 13:33:02 +0100
Received: from [10.47.86.126] (10.47.86.126) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 24 Feb
 2022 12:33:00 +0000
Message-ID: <aabd5f0a-1a54-e4da-734c-f940c45d66b4@huawei.com>
Date: Thu, 24 Feb 2022 12:32:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/8] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
To: Yicong Yang <yangyicong@huawei.com>, Yicong Yang
 <yangyicong@hisilicon.com>, <gregkh@linuxfoundation.org>,
 <helgaas@kernel.org>, <alexander.shishkin@linux.intel.com>,
 <lorenzo.pieralisi@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
 <mathieu.poirier@linaro.org>, <suzuki.poulose@arm.com>,
 <mike.leach@linaro.org>, <leo.yan@linaro.org>, <jonathan.cameron@huawei.com>, 
 <daniel.thompson@linaro.org>, <joro@8bytes.org>,
 <shameerali.kolothum.thodi@huawei.com>, <robin.murphy@arm.com>,
 <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <coresight@lists.linaro.org>, <linux-pci@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <iommu@lists.linux-foundation.org>
References: <20220221084307.33712-1-yangyicong@hisilicon.com>
 <20220221084307.33712-3-yangyicong@hisilicon.com>
 <c7d8cff4-b84e-1b73-1d54-2e221b90dac1@huawei.com>
 <e78f6e5e-a0c3-4976-4f46-e3369635ee3d@huawei.com>
In-Reply-To: <e78f6e5e-a0c3-4976-4f46-e3369635ee3d@huawei.com>
X-Originating-IP: [10.47.86.126]
X-ClientProxiedBy: lhreml752-chm.china.huawei.com (10.201.108.202) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: zhangshaokun@hisilicon.com, liuqi115@huawei.com, linuxarm@huawei.com,
 prime.zeng@huawei.com
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

On 24/02/2022 03:53, Yicong Yang wrote:
> On 2022/2/22 19:06, John Garry wrote:
>> On 21/02/2022 08:43, Yicong Yang wrote:
>>> HiSilicon PCIe tune and trace device(PTT) is a PCIe Root Complex
>>> integrated Endpoint(RCiEP) device, providing the capability
>>> to dynamically monitor and tune the PCIe traffic, and trace
>>> the TLP headers.
>>>
>>> Add the driver for the device to enable the trace function.
>>> This patch adds basic function of trace, including the device's
>>> probe and initialization, functions for trace buffer allocation
>>> and trace enable/disable, register an interrupt handler to
>>> simply response to the DMA events. The user interface of trace
>>> will be added in the following patch.
>>>
>>
>> Fill commit message lines upto 75 characters
> 
> Hi John,
> 
> Thanks for the comments.
> 
> The commit message is within 75 characters. I checked again and checkpatch
> didn't warning for this.

I mean to fill the lines up as much as possible, upto 75 char max, if 
not already done so. I am not sure if you are doing this already, but it 
looks like you were not.

Checkpatch
will
no
warn
about
a
commit
message
like
this
:)


Thanks,
john
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
