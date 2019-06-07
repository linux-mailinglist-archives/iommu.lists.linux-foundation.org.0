Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D438A9A
	for <lists.iommu@lfdr.de>; Fri,  7 Jun 2019 14:48:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D632121D;
	Fri,  7 Jun 2019 12:48:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EF51311FD
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 12:47:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 94BAB623
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 12:47:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 226E53EF;
	Fri,  7 Jun 2019 05:47:49 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E0D640151;
	Fri,  7 Jun 2019 05:47:47 -0700 (PDT)
Subject: Re: [PATCH v8 25/29] vfio-pci: Add a new VFIO_REGION_TYPE_NESTED
	region type
To: Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20190526161004.25232-1-eric.auger@redhat.com>
	<20190526161004.25232-26-eric.auger@redhat.com>
	<20190603163159.31e7ae23@x1.home>
	<9c1ea2db-5ba0-3cf5-3b38-2c4a125460e6@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <6a640710-bb9d-8923-cfef-e57786ed699f@arm.com>
Date: Fri, 7 Jun 2019 13:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9c1ea2db-5ba0-3cf5-3b38-2c4a125460e6@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"ashok.raj@intel.com" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Marc Zyngier <Marc.Zyngier@arm.com>, Will Deacon <Will.Deacon@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Vincent Stehle <Vincent.Stehle@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On 07/06/2019 09:28, Auger Eric wrote:
>>> +static const struct vfio_pci_fault_abi fault_abi_versions[] = {
>>> +	[0] = {
>>> +		.entry_size = sizeof(struct iommu_fault),
>>> +	},
>>> +};
>>> +
>>> +#define NR_FAULT_ABIS ARRAY_SIZE(fault_abi_versions)
>>
>> This looks like it's leading to some dangerous complicated code to
>> support multiple user selected ABIs.  How many ABIs do we plan to
>> support?  The region capability also exposes a type, sub-type, and
>> version.  How much of this could be exposed that way?  ie. if we need
>> to support multiple versions, expose multiple regions.
> 
> This is something that was discussed earlier and suggested by
> Jean-Philippe that we may need to support several versions of the ABI
> (typicallu when adding PRI support).
> Exposing multiple region is an interesting idea and I will explore that
> direction.

At the moment the ABI support errors and PRI. We're considering setting
the fault report structure to 64 or 128 bytes (see "[PATCH v2 2/4]
iommu: Introduce device fault data"). 64-byte allows for 2 additional
fields before we have to introduce a new ABI version, while 128 byte
should last us a while.

But that's for adding new fields to existing fault types. It's probably
a good idea to have different region types in VFIO for different fault
types, since userspace isn't necessarily prepared to deal with them. For
example right now userspace doesn't have a method to complete
recoverable faults, so we can't add them to the queue.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
