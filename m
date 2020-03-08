Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7D17D0E0
	for <lists.iommu@lfdr.de>; Sun,  8 Mar 2020 03:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8BD087DDD;
	Sun,  8 Mar 2020 02:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQhk-kO2vHAg; Sun,  8 Mar 2020 02:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B55A887C16;
	Sun,  8 Mar 2020 02:15:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F40C013E;
	Sun,  8 Mar 2020 02:15:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5110C013E
 for <iommu@lists.linux-foundation.org>; Sun,  8 Mar 2020 02:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CCC4087D3B
 for <iommu@lists.linux-foundation.org>; Sun,  8 Mar 2020 02:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mky3g-9cTDvL for <iommu@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 02:15:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A59F87C16
 for <iommu@lists.linux-foundation.org>; Sun,  8 Mar 2020 02:15:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2020 18:15:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,528,1574150400"; d="scan'208";a="414404843"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.93])
 ([10.254.211.93])
 by orsmga005.jf.intel.com with ESMTP; 07 Mar 2020 18:15:49 -0800
Subject: Re: [PATCH 3/6] iommu/vt-d: Don't force 32bit devices to uses DMA
 domain
To: Christoph Hellwig <hch@lst.de>
References: <20200307062014.3288-1-baolu.lu@linux.intel.com>
 <20200307062014.3288-4-baolu.lu@linux.intel.com>
 <20200307142144.GB26190@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b86e2bce-9907-05d0-b937-4b120797ba06@linux.intel.com>
Date: Sun, 8 Mar 2020 10:15:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307142144.GB26190@lst.de>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Hi Christoph,

On 2020/3/7 22:21, Christoph Hellwig wrote:
> On Sat, Mar 07, 2020 at 02:20:11PM +0800, Lu Baolu wrote:
>> Currently, if a 32bit device initially uses an identity domain,
>> Intel IOMMU driver will convert it forcibly to a DMA one if its
>> address capability is not enough for the whole system memory.
>> The motivation was to overcome the overhead caused by possible
>> bounced buffer.
>>
>> Unfortunately, this improvement has led to many problems. For
>> example, some 32bit devices are required to use an identity
>> domain, forcing them to use DMA domain will cause the device
>> not to work anymore. On the other hand, the VMD sub-devices
>> share a domain but each sub-device might have different address
>> capability. Forcing a VMD sub-device to use DMA domain blindly
>> will impact the operation of other sub-devices without any
>> notification. Further more, PCI aliased devices (PCI bridge
>> and all devices beneath it, VMD devices and various devices
>> quirked with pci_add_dma_alias()) must use the same domain.
>> Forcing one device to switch to DMA domain during runtime
>> will cause in-fligh DMAs for other devices to abort or target
>> to other memory which might cause undefind system behavior.
> 
> I still don't like the idea to enforce either a strict dynamic
> IOMMU mapping or an identify mapping mode.
> 
> Can we add a new AUTO domain which will allow using the identity
> mapping when available?  That somewhat matches the existing x86
> default, and also what powerpc does.

Sai is proposing a series to change the default domain through sysfs
during runtime.

https://lore.kernel.org/linux-iommu/FFF73D592F13FD46B8700F0A279B802F4FBF7E4B@ORSMSX114.amr.corp.intel.com/T/#mb919da5567da7692ee7058a00a137145adf950a1

It has evolved into v2. Not sure whether it's what you want.

> I have a series to lift
> that bypass mode into the core dma-mapping code that I need
> to repost, which I think would be suitable for intel-iommu as well.
> 

Looking forward to your repost.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
