Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 83376EDFCA
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 13:16:14 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79937F29;
	Mon,  4 Nov 2019 12:16:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46312EBA
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 12:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FF0C710
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 12:16:08 +0000 (UTC)
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 49350A5C4F3C939F79D7;
	Mon,  4 Nov 2019 12:16:06 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
	lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 4 Nov 2019 12:16:05 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
	(10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5;
	Mon, 4 Nov 2019 12:16:05 +0000
Subject: Re: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
To: Saravana Kannan <saravanak@google.com>
References: <20191030145112.19738-1-will@kernel.org>
	<6e457227-ca06-2998-4ffa-a58ab171ce32@arm.com>
	<20191030155444.GC19096@willie-the-truck>
	<CAGETcx9ogWQC1ZtnS_4xC3ShqBpuRSKudWEEWC22UZUEhdEU4A@mail.gmail.com>
	<20191031193758.GA2607492@lophozonia>
	<CAGETcx-MuMVvj0O-MFdfmLADEq=cQY_=x+irvhgwHhG4VeeSdg@mail.gmail.com>
	<6994ae35-2b89-2feb-2bcb-cffc5a01963c@huawei.com>
	<CAGETcx-9M8vvHA2Lykcv0hHWoC2OAw5kfBrjcNJN2CYCwR4eWQ@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <47418554-e7a7-f9f3-8852-60cecef3d5c7@huawei.com>
Date: Mon, 4 Nov 2019 12:16:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAGETcx-9M8vvHA2Lykcv0hHWoC2OAw5kfBrjcNJN2CYCwR4eWQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
	lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, Will
	Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>
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

On 01/11/2019 21:13, Saravana Kannan wrote:
> On Fri, Nov 1, 2019 at 3:28 AM John Garry <john.garry@huawei.com> wrote:
>>
>> On 31/10/2019 23:34, Saravana Kannan via iommu wrote:
>>> I looked into the iommu-map property and it shouldn't be too hard to
>>> add support for it. Looks like we can simply hold off on probing the
>>> root bridge device till all the iommus in its iommu-map are probed and
>>> we should be fine.
>>>
>>>> I'm also unsure about distro vendors agreeing to a mandatory kernel
>>>> parameter (of_devlink). Do you plan to eventually enable it by default?
>>>>
>>>>> static const struct supplier_bindings of_supplier_bindings[] = {
>>>>>           { .parse_prop = parse_clocks, },
>>>>>           { .parse_prop = parse_interconnects, },
>>>>>           { .parse_prop = parse_regulators, },
>>>>> +        { .parse_prop = parse_iommus, },
>>>>>           {},
>>>>> };
>>>>>
>>>>> I plan to upstream this pretty soon, but I have other patches in
>>>>> flight that touch the same file and I'm waiting for those to get
>>>>> accepted. I also want to clean up the code a bit to reduce some
>>>>> repetition before I add support for more bindings.
>>>> I'm also wondering about ACPI support.
>>> I'd love to add ACPI support too, but I have zero knowledge of ACPI.
>>> I'd be happy to help anyone who wants to add ACPI support that allows
>>> ACPI to add device links.
>>
>> If possible to add, that may be useful for remedying this:
>>
>> https://lore.kernel.org/linux-iommu/9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com/
> 
> I'm happy that this change might fix that problem, but isn't the
> problem reported in that thread more to do with child devices getting
> added before the parent probes successfully? That doesn't make sense
> to me. 

So the pcieport device and then the child device are added in the PCI 
scan, but only some time later do the device drivers probe for these 
devices; so it's not that the that pcieport driver creates the child device.

The problem then occurs in that the ordering the of device driver probe 
is such that we have this: pcieport probe + defer (as no IOMMU group 
registered), SMMU probe (registers the IOMMU group), child device probe, 
pcieport really probe.

Can't the piceport driver not add its child devices before it
> probes successfully? Or more specifically, who adds the child devices
> of the pcieport before the pcieport itself probes?

The devices are actually added in order pcieport, child device, but not 
really probed in that same order, as above.

I'll add you to that thread if you want to discuss further.

Thanks,
John

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
