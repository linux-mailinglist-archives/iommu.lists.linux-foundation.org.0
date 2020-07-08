Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD27218ADA
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:11:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6FB487C6A;
	Wed,  8 Jul 2020 15:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27LmgAkJijsv; Wed,  8 Jul 2020 15:11:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2535F87C2C;
	Wed,  8 Jul 2020 15:11:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BBD2C016F;
	Wed,  8 Jul 2020 15:11:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE69BC016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9CD022326C
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3jhD18kn4Mt for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 385D82318D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:11:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6F801FB;
 Wed,  8 Jul 2020 08:11:39 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D6E43F237;
 Wed,  8 Jul 2020 08:11:39 -0700 (PDT)
Subject: Re: [PATCH] dma-pool: use single atomic pool for both DMA zones
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
References: <20200707122804.21262-1-nsaenzjulienne@suse.de>
 <e6504dc5-4169-edf9-d08e-17a378a1ef7a@arm.com>
 <21a7276e98ae245404d82537ac1ee597a92f9150.camel@suse.de>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <6b75da91-c24d-4d54-e6ac-ff580141fda9@arm.com>
Date: Wed, 8 Jul 2020 10:11:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <21a7276e98ae245404d82537ac1ee597a92f9150.camel@suse.de>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Hi,

On 7/8/20 5:35 AM, Nicolas Saenz Julienne wrote:
> Hi Jim,
> 
> On Tue, 2020-07-07 at 17:08 -0500, Jeremy Linton wrote:
>> Hi,
>>
>> I spun this up on my 8G model using the PFTF firmware from:
>>
>> https://github.com/pftf/RPi4/releases
>>
>> Which allows me to switch between ACPI/DT on the machine. In DT mode it
>> works fine now,
> 
> Nice, would that count as a Tested-by from you?

If it worked... :)

> 
>> but with ACPI I continue to have failures unless I
>> disable CMA via cma=0 on the kernel command line.
> 
> Yes, I see why, in atomic_pool_expand() memory is allocated from CMA without
> checking its correctness. That calls for a separate fix. I'll try to think of
> something.
> 
>> It think that is because
>>
>> using DT:
>>
>> [    0.000000] Reserved memory: created CMA memory pool at
>> 0x0000000037400000, size 64 MiB
>>
>>
>> using ACPI:
>> [    0.000000] cma: Reserved 64 MiB at 0x00000000f8000000
>>
>> Which is AFAIK because the default arm64 CMA allocation is just below
>> the arm64_dma32_phys_limit.
> 
> As I'm sure you know, we fix the CMA address trough DT, isn't that possible
> trough ACPI?

Well there isn't a linux specific cma location property in ACPI. There 
are various ways to infer the information, like looking for the lowest 
_DMA() range and using that to lower the arm64_dma32_phys_limit. OTOH, 
as it stands I don't think that information is available early enough to 
setup the cma pool.

But as you mention the atomic pool code is allocating from CMA under the 
assumption that its going to be below the GFP_DMA range, which might not 
be generally true (due to lack of DT cma properties too?).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
