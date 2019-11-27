Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCD10AE6F
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 12:04:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6236887FA4;
	Wed, 27 Nov 2019 11:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDfn8oiON5iX; Wed, 27 Nov 2019 11:04:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F00478815C;
	Wed, 27 Nov 2019 11:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA485C1DE1;
	Wed, 27 Nov 2019 11:04:33 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05192C0881
 for <iommu@lists.linuxfoundation.org>; Wed, 27 Nov 2019 11:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B0B284463
 for <iommu@lists.linuxfoundation.org>; Wed, 27 Nov 2019 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBro9KtbBDm7 for <iommu@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 11:04:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0D5B584400
 for <iommu@lists.linuxfoundation.org>; Wed, 27 Nov 2019 11:04:29 +0000 (UTC)
Received: from LHREML711-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 3E497451C88F8A6FF950;
 Wed, 27 Nov 2019 11:04:27 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML711-CAH.china.huawei.com (10.201.108.34) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 11:04:26 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 27 Nov
 2019 11:04:26 +0000
Subject: Re: [PATCH v3 09/14] iommu/arm-smmu: Prevent forced unbinding of Arm
 SMMU drivers
To: Saravana Kannan <saravanak@google.com>
References: <20191121114918.2293-1-will@kernel.org>
 <20191121114918.2293-10-will@kernel.org>
 <5c91d467-5e59-482b-8f4f-e0cfa3db9028@huawei.com>
 <CAGETcx8Hkta6scFdiG=eQypsQ--jrR1YisaOQATCbMiu+aG8sg@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <af1dc92a-ca98-fb22-835f-5ceb85e86b1b@huawei.com>
Date: Wed, 27 Nov 2019 11:04:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAGETcx8Hkta6scFdiG=eQypsQ--jrR1YisaOQATCbMiu+aG8sg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linuxfoundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On 26/11/2019 20:27, Saravana Kannan wrote:
> On Tue, Nov 26, 2019 at 1:13 AM John Garry <john.garry@huawei.com> wrote:
>>
>> On 21/11/2019 11:49, Will Deacon wrote:
>>> Forcefully unbinding the Arm SMMU drivers is a pretty dangerous operation,
>>> since it will likely lead to catastrophic failure for any DMA devices
>>> mastering through the SMMU being unbound. When the driver then attempts
>>> to "handle" the fatal faults, it's very easy to trip over dead data
>>> structures, leading to use-after-free.
>>>
>>> On John's machine, he reports that the machine was "unusable" due to
>>> loss of the storage controller following a forced unbind of the SMMUv3
>>> driver:
>>>
>>>     | # cd ./bus/platform/drivers/arm-smmu-v3
>>>     | # echo arm-smmu-v3.0.auto > unbind
>>>     | hisi_sas_v2_hw HISI0162:01: CQE_AXI_W_ERR (0x800) found!
>>>     | platform arm-smmu-v3.0.auto: CMD_SYNC timeout at 0x00000146
>>>     | [hwprod 0x00000146, hwcons 0x00000000]
>>>
>>> Prevent this forced unbinding of the drivers by setting "suppress_bind_attrs"
>>> to true.
>>
>> This seems a reasonable approach for now.
>>
>> BTW, I'll give this series a spin this week, which again looks to be
>> your iommu/module branch, excluding the new IORT patch.
> 

Hi Saravana,

> Is this on a platform where of_devlink creates device links between
> the iommu device and its suppliers?I'm guessing no? Because device
> links should for unbinding of all the consumers before unbinding the
> supplier.

I'm only really interested in ACPI, TBH.

> 
> Looks like it'll still allow the supplier to unbind if the consumers
> don't allow unbinding. Is that the case here?

So just unbinding the driver from a device does not delete the device 
nor exit the device from it's IOMMU group - so we keep the reference to 
the SMMU ko. As such, I don't know how to realistically test unloading 
the SMMU ko when we have platform devices involved. Maybe someone can 
enlighten me...

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
