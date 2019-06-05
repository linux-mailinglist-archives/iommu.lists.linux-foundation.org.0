Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CDA35B3A
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 13:24:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4A5DC75;
	Wed,  5 Jun 2019 11:24:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CA0932F
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 404384C3
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:24:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3087374;
	Wed,  5 Jun 2019 04:24:34 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C9273F5AF;
	Wed,  5 Jun 2019 04:24:33 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] iommu: Introduce device fault data
To: "Tian, Kevin" <kevin.tian@intel.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
	<20190603145749.46347-3-jean-philippe.brucker@arm.com>
	<20190603150842.11070cfd@jacob-builder>
	<AADFC41AFE54684AB9EE6CBC0274A5D19CA6A9EE@SHSMSX104.ccr.corp.intel.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <50dc3cc5-6019-ad42-6aba-d84fab4020f9@arm.com>
Date: Wed, 5 Jun 2019 12:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19CA6A9EE@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 05/06/2019 09:51, Tian, Kevin wrote:
>> From: Jacob Pan
>> Sent: Tuesday, June 4, 2019 6:09 AM
>>
>> On Mon,  3 Jun 2019 15:57:47 +0100
>> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
>>
>>> +/**
>>> + * struct iommu_fault_page_request - Page Request data
>>> + * @flags: encodes whether the corresponding fields are valid and
>>> whether this
>>> + *         is the last page in group (IOMMU_FAULT_PAGE_REQUEST_*
>>> values)
>>> + * @pasid: Process Address Space ID
>>> + * @grpid: Page Request Group Index
>>> + * @perm: requested page permissions (IOMMU_FAULT_PERM_* values)
>>> + * @addr: page address
>>> + * @private_data: device-specific private information
>>> + */
>>> +struct iommu_fault_page_request {
>>> +#define IOMMU_FAULT_PAGE_REQUEST_PASID_VALID	(1 << 0)
>>> +#define IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE	(1 << 1)
>>> +#define IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA	(1 << 2)
>>> +	__u32	flags;
>>> +	__u32	pasid;
>>> +	__u32	grpid;
>>> +	__u32	perm;
>>> +	__u64	addr;
>>> +	__u64	private_data[2];
>>> +};
>>> +
>>
>> Just a thought, for non-identity G-H PASID management. We could pass on
>> guest PASID in PRQ to save a lookup in QEMU. In this case, QEMU
>> allocate a GPASID for vIOMMU then a host PASID for pIOMMU. QEMU has a
>> G->H lookup. When PRQ comes in to the pIOMMU with HPASID, IOMMU
>> driver
>> can retrieve GPASID from the bind data then report to the guest via
>> VFIO. In this case QEMU does not need to do a H->G PASID lookup.
>>
>> Should we add a gpasid field here? or we can add a flag and field
>> later, up to you.
>>
> 
> Can private_data serve this purpose?

Isn't private_data already used for VT-d's Private Data field?

> It's better not introducing
> gpasid awareness within host IOMMU driver. It is just a user-level
> data associated with a PASID when binding happens. Kernel doesn't
> care the actual meaning, simply record it and then return back to user 
> space later upon device fault. Qemu interprets the meaning as gpasid
> in its own context. otherwise usages may use it for other purpose.

Regarding a gpasid field I don't mind either way, but extending the
iommu_fault structure later won't be completely straightforward so we
could add some padding now.

Userspace negotiate the iommu_fault struct format with VFIO, before
allocating a circular buffer of N fault structures
(https://lore.kernel.org/lkml/20190526161004.25232-26-eric.auger@redhat.com/).
So adding new fields requires introducing a new ABI version and a struct
iommu_fault_v2. That may be OK for disruptive changes, but just adding a
new field indicated by a flag shouldn't have to be that complicated.

How about setting the iommu_fault structure to 128 bytes?

struct iommu_fault {
	__u32   type;
	__u32   padding;
	union {
		struct iommu_fault_unrecoverable event;
		struct iommu_fault_page_request prm;
		__u8 padding2[120];
	};
};

Given that @prm is currently 40 bytes and @event 32 bytes, the padding
allows either of them to grow 10 new 64-bit fields (or 20 new 32-bit
fields, which is still representable with new flags) before we have to
upgrade the ABI version.

A 4kB and a 64kB queue can hold respectively:

* 85 and 1365 records when iommu_fault is 48 bytes (current format).
* 64 and 1024 records when iommu_fault is 64 bytes (but allows to grow
only 2 new 64-bit fields).
* 32 and 512 records when iommu_fault is 128 bytes.

In comparison,
* the SMMU even queue can hold 128 and 2048 events respectively at those
sizes (and is allowed to grow up to 524k entries)
* the SMMU PRI queue can hold 256 and 4096 PR.

But the SMMU queues have to be physically contiguous, whereas our fault
queues are in userspace memory which is less expensive. So 128-byte
records might be reasonable. What do you think?


The iommu_fault_response (patch 4/4) is a bit easier to extend because
it's userspace->kernel and userspace can just declare the size it's
using. I did add a version field in case we run out of flags or want to
change the whole thing, but I think I was being overly cautious and it
might just be a waste of space.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
