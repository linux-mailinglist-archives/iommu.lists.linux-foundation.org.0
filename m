Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DCB2F1F45
	for <lists.iommu@lfdr.de>; Mon, 11 Jan 2021 20:27:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05FFD863FD;
	Mon, 11 Jan 2021 19:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yqa-+pKEYY9g; Mon, 11 Jan 2021 19:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 674C6863B7;
	Mon, 11 Jan 2021 19:27:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE28C013A;
	Mon, 11 Jan 2021 19:27:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69B88C013A
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 19:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 64FD2863FD
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 19:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYk4lhNwkEY7 for <iommu@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 19:27:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B319863B7
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 19:27:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081BF101E;
 Mon, 11 Jan 2021 11:27:51 -0800 (PST)
Received: from [10.57.56.43] (unknown [10.57.56.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77C23F719;
 Mon, 11 Jan 2021 11:27:49 -0800 (PST)
Subject: Re: [PATCH] iommu/arm-smmu-v3: Handle duplicated Stream IDs from
 other masters
To: Will Deacon <will@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>
References: <CGME20210107092826epcas5p100f2c57a63715baa2b3fa7219ab58c7b@epcas5p1.samsung.com>
 <20210107093340.15279-1-ajaykumar.rs@samsung.com>
 <20210107130319.GA2986@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5e047da1-6619-c716-927c-ae07a90f1597@arm.com>
Date: Mon, 11 Jan 2021 19:27:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107130319.GA2986@willie-the-truck>
Content-Language: en-GB
Cc: mark.rutland@arm.com, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2021-01-07 13:03, Will Deacon wrote:
> On Thu, Jan 07, 2021 at 03:03:40PM +0530, Ajay Kumar wrote:
>> When PCI function drivers(ex:pci-endpoint-test) are probed for already
>> initialized PCIe-RC(Root Complex), and PCIe-RC is already bound to SMMU,
>> then we encounter a situation where the function driver tries to attach
>> itself to the smmu with the same stream-id as PCIe-RC and re-initialize
>> an already initialized STE. This causes ste_live BUG_ON() in the driver.

Note that this is actually expected behaviour, since Stream ID aliasing 
has remained officially not supported until a sufficiently compelling 
reason to do so appears. I always thought the most likely scenario would 
be a legacy PCI bridge with multiple devices behind it, but even that 
seems increasingly improbable for a modern SMMUv3-based system to ever see.

> I don't understand why the endpoint is using the same stream ID as the root
> complex in this case. Why is that? Is the grouping logic not working
> properly?

It's not so much that it isn't working properly, it's more that it needs 
to be implemented at all ;)

>> There is an already existing check in the driver to manage duplicated ids
>> if duplicated ids are added in same master device, but there can be
>> scenarios like above where we need to extend the check for other masters
>> using the same stream-id.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 33 +++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
> 
> It doesn't feel like the driver is the right place to fix this, as the same
> issue could surely occur for other IOMMUs too, right? In which case, I think
> we should avoid getting into the situation where different groups have
> overlapping stream IDs.

Yes, this patch does not represent the correct thing to do either way. 
The main reason that Stream ID aliasing hasn't been supported so far is 
that the required Stream ID to group lookup is rather awkward, and 
adding all of that complexity just for the sake of a rather unlikely 
possibility seemed dubious. However, PRI support has always had a more 
pressing need to implement almost the same thing (Stream ID to device), 
so once that lands we can finally get round to adding the rest of proper 
group support relatively easily.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
