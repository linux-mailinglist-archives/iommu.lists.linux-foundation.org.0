Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48D2FD6E2
	for <lists.iommu@lfdr.de>; Wed, 20 Jan 2021 18:30:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AACCB86456;
	Wed, 20 Jan 2021 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pT8zY8Vzj2z; Wed, 20 Jan 2021 17:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BCE1786061;
	Wed, 20 Jan 2021 17:30:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BCD8C1DA7;
	Wed, 20 Jan 2021 17:30:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6E45C013A
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 17:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 917C787136
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 17:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uR+AfOQnmPA3 for <iommu@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 17:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id E119A8712B
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 17:30:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA6C31B;
 Wed, 20 Jan 2021 09:30:15 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5433F68F;
 Wed, 20 Jan 2021 09:30:08 -0800 (PST)
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh@kernel.org>, Claire Chang <tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
Date: Wed, 20 Jan 2021 17:30:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120165348.GA220770@robh.at.kernel.org>
Content-Language: en-GB
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org, grant.likely@arm.com,
 paulus@samba.org, will@kernel.org, mingo@kernel.org, sstabellini@kernel.org,
 saravanak@google.com, mpe@ellerman.id.au, rafael.j.wysocki@intel.com,
 hch@lst.de, bgolaszewski@baylibre.com, xen-devel@lists.xenproject.org,
 treding@nvidia.com, devicetree@vger.kernel.org, konrad.wilk@oracle.com,
 dan.j.williams@intel.com, drinkcat@chromium.org, boris.ostrovsky@oracle.com,
 andriy.shevchenko@linux.intel.com, jgross@suse.com, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, frowand.list@gmail.com,
 iommu@lists.linux-foundation.org, xypron.glpk@gmx.de,
 linuxppc-dev@lists.ozlabs.org
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

On 2021-01-20 16:53, Rob Herring wrote:
> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
>> Introduce the new compatible string, restricted-dma-pool, for restricted
>> DMA. One can specify the address and length of the restricted DMA memory
>> region by restricted-dma-pool in the device tree.
> 
> If this goes into DT, I think we should be able to use dma-ranges for
> this purpose instead. Normally, 'dma-ranges' is for physical bus
> restrictions, but there's no reason it can't be used for policy or to
> express restrictions the firmware has enabled.

There would still need to be some way to tell SWIOTLB to pick up the 
corresponding chunk of memory and to prevent the kernel from using it 
for anything else, though.

>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>> ---
>>   .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> index e8d3096d922c..44975e2a1fd2 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>             used as a shared pool of DMA buffers for a set of devices. It can
>>             be used by an operating system to instantiate the necessary pool
>>             management subsystem if necessary.
>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>> +          used as a pool of restricted DMA buffers for a set of devices. The
>> +          memory region would be the only region accessible to those devices.
>> +          When using this, the no-map and reusable properties must not be set,
>> +          so the operating system can create a virtual mapping that will be used
>> +          for synchronization. The main purpose for restricted DMA is to
>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>> +          which could result in the DMA accessing the system memory at
>> +          unexpected times and/or unexpected addresses, possibly leading to data
>> +          leakage or corruption. The feature on its own provides a basic level
>> +          of protection against the DMA overwriting buffer contents at
>> +          unexpected times. However, to protect against general data leakage and
>> +          system memory corruption, the system needs to provide way to restrict
>> +          the DMA to a predefined memory region.
>>           - vendor specific string in the form <vendor>,[<device>-]<usage>
>>   no-map (optional) - empty property
>>       - Indicates the operating system must not create a virtual mapping
>> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   			compatible = "acme,multimedia-memory";
>>   			reg = <0x77000000 0x4000000>;
>>   		};
>> +
>> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
>> +			compatible = "restricted-dma-pool";
>> +			reg = <0x50000000 0x400000>;
>> +		};
>>   	};
>>   
>>   	/* ... */
>> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   		memory-region = <&multimedia_reserved>;
>>   		/* ... */
>>   	};
>> +
>> +	pcie_device: pcie_device@0,0 {
>> +		memory-region = <&restricted_dma_mem_reserved>;
> 
> PCI hosts often have inbound window configurations that limit the
> address range and translate PCI to bus addresses. Those windows happen
> to be configured by dma-ranges. In any case, wouldn't you want to put
> the configuration in the PCI host node? Is there a usecase of
> restricting one PCIe device and not another?

The general design seems to accommodate devices having their own pools 
such that they can't even snoop on each others' transient DMA data. If 
the interconnect had a way of wiring up, say, PCI RIDs to AMBA NSAIDs, 
then in principle you could certainly apply that to PCI endpoints too 
(presumably you'd also disallow them from peer-to-peer transactions at 
the PCI level too).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
