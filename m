Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E5D42900E
	for <lists.iommu@lfdr.de>; Mon, 11 Oct 2021 16:04:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA6CC4028B;
	Mon, 11 Oct 2021 14:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81aXquLu_H1R; Mon, 11 Oct 2021 14:04:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9655340218;
	Mon, 11 Oct 2021 14:04:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6710CC0022;
	Mon, 11 Oct 2021 14:04:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 426ECC000D
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 14:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180AE6071E
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 14:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lR6aGrsw2iLV for <iommu@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 14:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62D756068D
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 14:04:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A6A4101E;
 Mon, 11 Oct 2021 07:04:09 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB0BD3F694;
 Mon, 11 Oct 2021 07:04:07 -0700 (PDT)
Subject: Re: [PATCH v7 2/9] ACPI/IORT: Add support for RMR node parsing
To: Jon Nettleton <jon@solid-run.com>
References: <20210805080724.480-1-shameerali.kolothum.thodi@huawei.com>
 <20210805080724.480-3-shameerali.kolothum.thodi@huawei.com>
 <e24df2a9-1332-0eb3-b52a-230662fe46ba@arm.com>
 <CABdtJHvY5XnQN7wgQ9D8Zcu-NgHRmaUMFPgaPGZwM+AhmVpULw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3225875e-ebd9-6378-e92c-ed3894d8aedc@arm.com>
Date: Mon, 11 Oct 2021 15:04:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CABdtJHvY5XnQN7wgQ9D8Zcu-NgHRmaUMFPgaPGZwM+AhmVpULw@mail.gmail.com>
Content-Language: en-GB
Cc: Linuxarm <linuxarm@huawei.com>, Steven Price <steven.price@arm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>, Hanjun Guo <guohanjun@huawei.com>,
 yangyicong <yangyicong@huawei.com>, Sami Mujawar <Sami.Mujawar@arm.com>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2021-10-09 08:06, Jon Nettleton wrote:
[...]
>>> +             if (rmr->flags & IOMMU_RMR_REMAP_PERMITTED) {
>>> +                     type = IOMMU_RESV_DIRECT_RELAXABLE;
>>> +                     /*
>>> +                      * Set IOMMU_CACHE as IOMMU_RESV_DIRECT_RELAXABLE is
>>> +                      * normally used for allocated system memory that is
>>> +                      * then used for device specific reserved regions.
>>> +                      */
>>> +                     prot |= IOMMU_CACHE;
>>> +             } else {
>>> +                     type = IOMMU_RESV_DIRECT;
>>> +                     /*
>>> +                      * Set IOMMU_MMIO as IOMMU_RESV_DIRECT is normally used
>>> +                      * for device memory like MSI doorbell.
>>> +                      */
>>> +                     prot |= IOMMU_MMIO;
>>> +             }
>>
>> I'm not sure we ever got a definitive answer to this - does DPAA2
>> actually go wrong if we use IOMMU_MMIO here? I'd still much prefer to
>> make the fewest possible assumptions, since at this point it's basically
>> just a stop-gap until we can fix the spec. It's become clear that we
>> can't reliably rely on guessing attributes, so I'm not too fussed about
>> theoretical cases that currently don't work (due to complete lack of RMR
>> support) continuing to not work for the moment, as long as we can make
>> the real-world cases we actually have work at all. Anything which only
>> affects performance I'd rather leave until firmware can tell us what to do.
> 
> Well it isn't DPAA2, it is FSL_MC_BUS that fails with IOMMU_MMIO
> mappings.  DPAA2 is just one connected device.

Apologies if I'm being overly loose with terminology there - my point of 
reference for this hardware is documentation for the old LS2080A, where 
the "DPAA2 Reference Manual" gives a strong impression that the MC is a 
component belonging to the overall DPAA2 architecture. Either way it 
technically stands to reason that the other DPAA2 components would only 
be usable if the MC itself works (unless I've been holding a major 
misconception about that for years as well).

In the context of this discussion, please consider any reference I may 
make to bits of NXP's hardware to be shorthand for "the thing for which 
NXP have a vested interest in IORT RMRs".

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
