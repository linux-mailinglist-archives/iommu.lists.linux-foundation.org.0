Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E5B7CF1
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 16:35:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1DF25CA8;
	Thu, 19 Sep 2019 14:35:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB58AC5C
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 14:35:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BCF0E875
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 14:35:29 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D07CF8849E71097B62BE;
	Thu, 19 Sep 2019 22:35:25 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.179) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 19 Sep 2019 22:35:16 +0800
From: John Garry <john.garry@huawei.com>
Subject: Re: arm64 iommu groups issue
To: Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>, "Will
	Deacon" <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, "Guohanjun (Hanjun Guo)"
	<guohanjun@huawei.com>
References: <9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com>
	<4768c541-ebf4-61d5-0c5e-77dee83f8f94@arm.com>
Message-ID: <a18b7f26-9713-a5c7-507e-ed70e40bc007@huawei.com>
Date: Thu, 19 Sep 2019 15:35:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <4768c541-ebf4-61d5-0c5e-77dee83f8f94@arm.com>
X-Originating-IP: [10.202.227.179]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Linuxarm <linuxarm@huawei.com>, iommu <iommu@lists.linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 19/09/2019 14:25, Robin Murphy wrote:
>> When the port eventually probes it gets a new, separate group.
>>
>> This all seems to be as the built-in module init ordering is as
>> follows: pcieport drv, smmu drv, mlx5 drv
>>
>> I notice that if I build the mlx5 drv as a ko and insert after boot,
>> all functions + pcieport are in the same group:
>>
>> [   11.530046] hisi_sas_v2_hw HISI0162:01: Adding to iommu group 0
>> [   17.301093] hns_dsaf HISI00B2:00: Adding to iommu group 1
>> [   18.743600] ehci-platform PNP0D20:00: Adding to iommu group 2
>> [   20.212284] pcieport 0002:f8:00.0: Adding to iommu group 3
>> [   20.356303] pcieport 0004:88:00.0: Adding to iommu group 4
>> [   20.493337] pcieport 0005:78:00.0: Adding to iommu group 5
>> [   20.702999] pcieport 000a:10:00.0: Adding to iommu group 6
>> [   20.859183] pcieport 000c:20:00.0: Adding to iommu group 7
>> [   20.996140] pcieport 000d:30:00.0: Adding to iommu group 8
>> [   21.152637] serial 0002:f9:00.0: Adding to iommu group 3
>> [   21.346991] serial 0002:f9:00.1: Adding to iommu group 3
>> [  100.754306] mlx5_core 000a:11:00.0: Adding to iommu group 6
>> [  101.420156] mlx5_core 000a:11:00.1: Adding to iommu group 6
>> [  292.481714] mlx5_core 000a:11:00.2: Adding to iommu group 6
>> [  293.281061] mlx5_core 000a:11:00.3: Adding to iommu group 6
>>
>> This does seem like a problem for arm64 platforms which don't support
>> ACS, yet enable an SMMU. Maybe also a problem even if they do support
>> ACS.
>>
>> Opinion?
>

Hi Robin,

> Yeah, this is less than ideal.

For sure. Our production D05 boards don't ship with the SMMU enabled in 
BIOS, but it would be slightly concerning in this regard if they did.

 > One way to bodge it might be to make
> pci_device_group() also walk downwards to see if any non-ACS-isolated
> children already have a group, rather than assuming that groups get
> allocated in hierarchical order, but that's far from ideal.

Agree.

My own workaround was to hack the mentioned iort code to defer the PF 
probe if the parent port had also yet to probe.

>
> The underlying issue is that, for historical reasons, OF/IORT-based
> IOMMU drivers have ended up with group allocation being tied to endpoint
> driver probing via the dma_configure() mechanism (long story short,
> driver probe is the only thing which can be delayed in order to wait for
> a specific IOMMU instance to be ready).However, in the meantime, the
> IOMMU API internals have evolved sufficiently that I think there's a way
> to really put things right - I have the spark of an idea which I'll try
> to sketch out ASAP...
>

OK, great.

Thanks,
John

> Robin.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
