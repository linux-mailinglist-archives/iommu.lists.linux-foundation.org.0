Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4B269BA3
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 03:53:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D40C185DA5;
	Tue, 15 Sep 2020 01:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYxWb0VO8t4B; Tue, 15 Sep 2020 01:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3011D85D9B;
	Tue, 15 Sep 2020 01:53:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DC2CC0051;
	Tue, 15 Sep 2020 01:53:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D6CBC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 01:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CD0E85DA5
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 01:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWHzUkpoorgk for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 01:53:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5D9FB85D9B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 01:53:22 +0000 (UTC)
IronPort-SDR: 0MdfEcoCk2rT2caPvKJI1GzoOe49PTzG5Z0nrvfjqshq5kaU8VGYk5WbzWAxhhTEDrXQD+9Czo
 xkWXbMtDsafg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="158471727"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="158471727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 18:53:21 -0700
IronPort-SDR: Xe0R/W9hHMIDWOmhCaQaggHuGJaKABRv0g/U3QAz43IDpHV8Dap6nBazZBZzy2R8+IlK5B+uk3
 B9igPB/DEzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="409037267"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2020 18:53:17 -0700
Subject: Re: [PATCH v3 0/6] Convert the intel iommu driver to the dma-iommu api
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <20200912032200.11489-1-baolu.lu@linux.intel.com>
 <51a1baec-48d1-c0ac-181b-1fba92aa428d@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <001f4446-7c43-9832-42d8-55dc4a13c2ae@linux.intel.com>
Date: Tue, 15 Sep 2020 09:47:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <51a1baec-48d1-c0ac-181b-1fba92aa428d@linux.intel.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, Intel-gfx@lists.freedesktop.org,
 Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org
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

Hi Tvrtko,

On 9/14/20 4:04 PM, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 12/09/2020 04:21, Lu Baolu wrote:
>> Tom Murphy has almost done all the work. His latest patch series was
>> posted here.
>>
>> https://lore.kernel.org/linux-iommu/20200903201839.7327-1-murphyt7@tcd.ie/
>>
>> Thanks a lot!
>>
>> This series is a follow-up with below changes:
>>
>> 1. Add a quirk for the i915 driver issue described in Tom's cover
>> letter.
> 
> Last week I have copied you on an i915 series which appears to remove the need for this quirk. so if we get those i915 patches reviewed and merged, do you still want to pursue this quirk?

It's up to the graphic guys. I don't know the details in i915 driver.
I don't think my tests could cover all cases.

> 
>> 2. Fix several bugs in patch "iommu: Allow the dma-iommu api to use
>> bounce buffers" to make the bounce buffer work for untrusted devices.
>> 3. Several cleanups in iommu/vt-d driver after the conversion.
> 
> With the previous version of the series I hit a problem on Ivybridge where apparently the dma engine width is not respected. At least that is my layman interpretation of the errors. From the older thread:
> 
> <3> [209.526605] DMAR: intel_iommu_map: iommu width (39) is not sufficient for the mapped address (ffff008000)
> 
> Relevant iommu boot related messages are:
> 
> <6>[    0.184234] DMAR: Host address width 36
> <6>[    0.184245] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
> <6>[    0.184288] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap c0000020e60262 ecap f0101a
> <6>[    0.184308] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
> <6>[    0.184337] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap c9008020660262 ecap f0105a
> <6>[    0.184357] DMAR: RMRR base: 0x000000d8d28000 end: 0x000000d8d46fff
> <6>[    0.184377] DMAR: RMRR base: 0x000000db000000 end: 0x000000df1fffff
> <6>[    0.184398] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
> <6>[    0.184414] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
> <6>[    0.184428] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
> <6>[    0.185173] DMAR-IR: Enabled IRQ remapping in x2apic mode
> 
> <6>[    0.878934] DMAR: No ATSR found
> <6>[    0.878966] DMAR: dmar0: Using Queued invalidation
> <6>[    0.879007] DMAR: dmar1: Using Queued invalidation
> 
> <6>[    0.915032] DMAR: Intel(R) Virtualization Technology for Directed I/O
> <6>[    0.915060] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> <6>[    0.915084] software IO TLB: mapped [mem 0xc80d4000-0xcc0d4000] (64MB)
> 
> (Full boot log at https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7054/fi-ivb-3770/boot0.txt, failures at https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7054/fi-ivb-3770/igt@i915_selftest@live@blt.html.)
> 
> Does this look familiar or at least plausible to you? Is this something your new series has fixed?

This happens during attaching a domain to device. It has nothing to do
with this patch series. I will look into this issue, but not in this
email thread context.

Best regards,
baolu

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Please review and test.
>>
>> Best regards,
>> baolu
>>
>> Lu Baolu (2):
>>     iommu: Add quirk for Intel graphic devices in map_sg
>>     iommu/vt-d: Cleanup after converting to dma-iommu ops
>>
>> Tom Murphy (4):
>>     iommu: Handle freelists when using deferred flushing in iommu drivers
>>     iommu: Add iommu_dma_free_cpu_cached_iovas()
>>     iommu: Allow the dma-iommu api to use bounce buffers
>>     iommu/vt-d: Convert intel iommu driver to the iommu ops
>>
>>    .../admin-guide/kernel-parameters.txt         |   5 -
>>    drivers/iommu/dma-iommu.c                     | 229 ++++-
>>    drivers/iommu/intel/Kconfig                   |   1 +
>>    drivers/iommu/intel/iommu.c                   | 885 +++---------------
>>    include/linux/dma-iommu.h                     |   8 +
>>    include/linux/iommu.h                         |   1 +
>>    6 files changed, 323 insertions(+), 806 deletions(-)
>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
