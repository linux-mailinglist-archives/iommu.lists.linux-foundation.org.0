Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6820EBCF
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 05:06:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B33B787B82;
	Tue, 30 Jun 2020 03:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDb6kkqWtqYX; Tue, 30 Jun 2020 03:06:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 150EA87A33;
	Tue, 30 Jun 2020 03:06:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9360C016E;
	Tue, 30 Jun 2020 03:06:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1E97C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 03:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D69D487A33
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 03:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1cjpwbgKocc for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 03:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B51C8793D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 03:06:51 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D42CA454729246FBD81E;
 Tue, 30 Jun 2020 11:06:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.33) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 11:06:43 +0800
Subject: Re: [PATCH v2 01/12] ACPI/IORT: Make iort_match_node_callback walk
 the ACPI namespace for NC
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-2-lorenzo.pieralisi@arm.com>
 <718cae1f-2f33-f6d9-f278-157300b73116@huawei.com>
 <20200629090551.GA28873@e121166-lin.cambridge.arm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <765078e7-b3ec-af5d-0405-7834ba0f120a@huawei.com>
Date: Tue, 30 Jun 2020 11:06:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200629090551.GA28873@e121166-lin.cambridge.arm.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.33]
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, linux-pci@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Robin Murphy <robin.murphy@arm.com>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2020/6/29 17:05, Lorenzo Pieralisi wrote:
> On Mon, Jun 29, 2020 at 12:24:43PM +0800, Hanjun Guo wrote:
>> Hi Lorenzo,
>>
>> On 2020/6/19 16:20, Lorenzo Pieralisi wrote:
>>> When the iort_match_node_callback is invoked for a named component
>>> the match should be executed upon a device with an ACPI companion.
>>>
>>> For devices with no ACPI companion set-up the ACPI device tree must be
>>> walked in order to find the first parent node with a companion set and
>>> check the parent node against the named component entry to check whether
>>> there is a match and therefore an IORT node describing the in/out ID
>>> translation for the device has been found.
>>>
>>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Hanjun Guo <guohanjun@huawei.com>
>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>>> ---
>>>    drivers/acpi/arm64/iort.c | 20 ++++++++++++++++++--
>>>    1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
>>> index 28a6b387e80e..5eee81758184 100644
>>> --- a/drivers/acpi/arm64/iort.c
>>> +++ b/drivers/acpi/arm64/iort.c
>>> @@ -264,15 +264,31 @@ static acpi_status iort_match_node_callback(struct acpi_iort_node *node,
>>>    	if (node->type == ACPI_IORT_NODE_NAMED_COMPONENT) {
>>>    		struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>>> -		struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
>>> +		struct acpi_device *adev;
>>>    		struct acpi_iort_named_component *ncomp;
>>> +		struct device *nc_dev = dev;
>>> +
>>> +		/*
>>> +		 * Walk the device tree to find a device with an
>>> +		 * ACPI companion; there is no point in scanning
>>> +		 * IORT for a device matching a named component if
>>> +		 * the device does not have an ACPI companion to
>>> +		 * start with.
>>> +		 */
>>> +		do {
>>> +			adev = ACPI_COMPANION(nc_dev);
>>> +			if (adev)
>>> +				break;
>>> +
>>> +			nc_dev = nc_dev->parent;
>>> +		} while (nc_dev);
>>
>> I'm lost here, we need the ACPI_COMPANION (the same as
>> to_acpi_device_node()) of the device, but why do we need to go
>> up to find the parent node?
> 
> For devices that aren't described in the DSDT - IORT translations
> are determined by their ACPI parent device. Do you see/Have you
> found any issue with this approach ?

The spec says "Describes the IO relationships between devices
represented in the ACPI namespace.", and in section 3.1.1.3 Named
component node, it says:

"Named component nodes are used to describe devices that are also
included in the Differentiated System Description Table (DSDT). See
[ACPI]."

So from my understanding, the IORT spec for now, can only do ID
translations for devices in the DSDT.

> 
>> For a platform device, if I use its parent's full path name for
>> its named component entry, then it will match, but this will violate
>> the IORT spec.
> 
> Can you elaborate on this please I don't get the point you
> are making.

For example, device A is not described in DSDT so can't represent
as a NC node in IORT. Device B can be described in DSDT and it
is the parent of device A, so device B can be represented in IORT
with memory access properties and node flags with Substream width
and Stall supported info.

When we trying to translate device A's ID, we reuse all the memory
access properties and node flags from its parent (device B), but
will it the same?

So the IORT spec don't support this, at least it's pretty vague
I think.

Thanks
Hanjun

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
