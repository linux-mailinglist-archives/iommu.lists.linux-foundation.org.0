Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E008A4DA206
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 19:07:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 504B3842AB;
	Tue, 15 Mar 2022 18:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yh1UB_xQaNBv; Tue, 15 Mar 2022 18:07:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 72C90842FF;
	Tue, 15 Mar 2022 18:07:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CB22C000B;
	Tue, 15 Mar 2022 18:07:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A83FC000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 18:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F3540217
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 18:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNgRdVlxP5AQ for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 18:07:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE6F400D1
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 18:07:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3A41474;
 Tue, 15 Mar 2022 11:07:54 -0700 (PDT)
Received: from [10.57.42.204] (unknown [10.57.42.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B68B3F73D;
 Tue, 15 Mar 2022 11:07:52 -0700 (PDT)
Message-ID: <21d33a75-8c0e-7734-b3d1-dbe33cfe0ab0@arm.com>
Date: Tue, 15 Mar 2022 18:07:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] thunderbolt: Use pre-boot DMA protection on AMD
 systems
Content-Language: en-GB
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Christoph Hellwig <hch@infradead.org>
References: <20220315162455.5190-1-mario.limonciello@amd.com>
 <20220315162455.5190-2-mario.limonciello@amd.com>
 <YjDDUUeZ/dvUZoDN@infradead.org>
 <BL1PR12MB5157D7B7734122684D47923AE2109@BL1PR12MB5157.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <BL1PR12MB5157D7B7734122684D47923AE2109@BL1PR12MB5157.namprd12.prod.outlook.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Will Deacon <will@kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

On 2022-03-15 16:54, Limonciello, Mario via iommu wrote:
> [Public]
> 
> 
>> On Tue, Mar 15, 2022 at 11:24:55AM -0500, Mario Limonciello wrote:
>>> -	 * handled natively using IOMMU. It is enabled when IOMMU is
>>> -	 * enabled and ACPI DMAR table has DMAR_PLATFORM_OPT_IN set.
>>> +	 * handled natively using IOMMU. It is enabled when the IOMMU is
>>> +	 * enabled and either:
>>> +	 * ACPI DMAR table has DMAR_PLATFORM_OPT_IN set
>>> +	 * or
>>> +	 * ACPI IVRS table has DMA_REMAP bitset
>>>   	 */
>>>   	return sprintf(buf, "%d\n",
>>> -		       iommu_present(&pci_bus_type) &&
>> dmar_platform_optin());
>>> +		       iommu_present(&pci_bus_type) &&
>>> +		       (dmar_platform_optin() || amd_ivrs_remap_support()));
>>
>> Yikes.  No, the thunderbot code does not have any business poking into
>> either dmar_platform_optin or amd_ivrs_remap_support.  This needs
>> a proper abstration from the IOMMU code.
> 
> To make sure I follow your ask - it's to make a new generic iommu function
> That would check dmar/ivrs, and switch out thunderbolt domain.c to use the
> symbol?
> 
> I'm happy to rework that if that is what you want.
> Do you have a preferred proposed function name for that?

But why? Either IOMMU translation is enabled or it isn't, and if it is, 
what's to gain from guessing at *why* it might have been? And even if 
the IOMMU's firmware table did tell the IOMMU driver to enable the 
IOMMU, why should that be Thunderbolt's business?

Furthermore, looking at patch #1 I can only conclude that this is 
entirely meaningless anyway. AFAICS it's literally reporting whether the 
firmware flag was set or not. Not whether it's actually been honoured 
and the IOMMU is enforcing any kind of DMA protection at all. Even on 
Intel where the flag does at least have some effect on the IOMMU driver, 
that can still be overridden.

I already have a patch refactoring this to get rid of iommu_present(), 
but at the time I wasn't looking to closely at what it's trying to *do* 
with the information. If it's supposed to accurately reflect whether the 
Thunderbolt device is subject to IOMMU translation and not bypassed, I 
can fix that too (and unexport dmar_platform_optin() in the process...)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
