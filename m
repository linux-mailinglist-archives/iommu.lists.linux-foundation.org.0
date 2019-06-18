Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E94A357
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 16:05:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A0FDB7A;
	Tue, 18 Jun 2019 14:05:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 72AEAAD7
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id DAFEE822
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:05:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A69A2B;
	Tue, 18 Jun 2019 07:05:07 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AA0E3F718;
	Tue, 18 Jun 2019 07:05:05 -0700 (PDT)
Subject: Re: [PATCH v8 26/29] vfio-pci: Register an iommu fault handler
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190526161004.25232-1-eric.auger@redhat.com>
	<20190526161004.25232-27-eric.auger@redhat.com>
	<20190603163139.70fe8839@x1.home>
	<10dd60d9-4af0-c0eb-08c9-a0db7ee1925e@redhat.com>
	<20190605154553.0d00ad8d@jacob-builder>
	<2753d192-1c46-d78e-c425-0c828e48cde2@arm.com>
	<20190606132903.064f7ac4@jacob-builder>
	<dc051424-67d7-02ff-9b8e-0d7a8a4e59eb@arm.com>
	<20190607104301.6b1bbd74@jacob-builder>
	<e02b024f-6ebc-e8fa-c30c-5bf3f4b164d6@arm.com>
	<20190610143134.7bff96e9@jacob-builder>
	<905f130b-02dc-6971-8d5b-ce87d9bc96a4@arm.com>
	<20190612115358.0d90b322@jacob-builder>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <77405d39-81a4-d9a8-5d35-27602199867a@arm.com>
Date: Tue, 18 Jun 2019 15:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612115358.0d90b322@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	Vincent Stehle <Vincent.Stehle@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"ashok.raj@intel.com" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Marc Zyngier <Marc.Zyngier@arm.com>, Will Deacon <Will.Deacon@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On 12/06/2019 19:53, Jacob Pan wrote:
>>> You are right, the worst case of the spurious PS is to terminate the
>>> group prematurely. Need to know the scope of the HW damage in case
>>> of mdev where group IDs can be shared among mdevs belong to the
>>> same PF.  
>>
>> But from the IOMMU fault API point of view, the full page request is
>> identified by both PRGI and PASID. Given that each mdev has its own
>> set of PASIDs, it should be easy to isolate page responses per mdev.
>>
> On Intel platform, devices sending page request with private data must
> receive page response with matching private data. If we solely depend
> on PRGI and PASID, we may send stale private data to the device in
> those incorrect page response. Since private data may represent PF
> device wide contexts, the consequence of sending page response with
> wrong private data may affect other mdev/PASID.
> 
> One solution we are thinking to do is to inject the sequence #(e.g.
> ktime raw mono clock) as vIOMMU private data into to the guest. Guest
> would return this fake private data in page response, then host will
> send page response back to the device that matches PRG1 and PASID and
> private_data.
> 
> This solution does not expose HW context related private data to the
> guest but need to extend page response in iommu uapi.
> 
> /**
>  * struct iommu_page_response - Generic page response information
>  * @version: API version of this structure
>  * @flags: encodes whether the corresponding fields are valid
>  *         (IOMMU_FAULT_PAGE_RESPONSE_* values)
>  * @pasid: Process Address Space ID
>  * @grpid: Page Request Group Index
>  * @code: response code from &enum iommu_page_response_code
>  * @private_data: private data for the matching page request
>  */
> struct iommu_page_response {
> #define IOMMU_PAGE_RESP_VERSION_1	1
> 	__u32	version;
> #define IOMMU_PAGE_RESP_PASID_VALID	(1 << 0)
> #define IOMMU_PAGE_RESP_PRIVATE_DATA	(1 << 1)
> 	__u32	flags;
> 	__u32	pasid;
> 	__u32	grpid;
> 	__u32	code;
> 	__u32	padding;
> 	__u64	private_data[2];
> };
> 
> There is also the change needed for separating storage for the real and
> fake private data.
> 
> Sorry for the last minute change, did not realize the HW implications.
> 
> I see this as a future extension due to limited testing, 

I'm wondering how we deal with:
(1) old userspace that won't fill the new private_data field in
page_response. A new kernel still has to support it.
(2) old kernel that won't recognize the new PRIVATE_DATA flag. Currently
iommu_page_response() rejects page responses with unknown flags.

I guess we'll need a two-way negotiation, where userspace queries
whether the kernel supports the flag (2), and the kernel learns whether
it should expect the private data to come back (1).

> perhaps for
> now, can you add paddings similar to page request? Make it 64B as well.

I don't think padding is necessary, because iommu_page_response is sent
by userspace to the kernel, unlike iommu_fault which is allocated by
userspace and filled by the kernel.

Page response looks a lot more like existing VFIO mechanisms, so I
suppose we'll wrap the iommu_page_response structure and include an
argsz parameter at the top:

	struct vfio_iommu_page_response {
		u32 argsz;
		struct iommu_page_response pr;
	};

	struct vfio_iommu_page_response vpr = {
		.argsz = sizeof(vpr),
		.pr = ...
		...
	};

	ioctl(devfd, VFIO_IOMMU_PAGE_RESPONSE, &vpr);

In that case supporting private data can be done by simply appending a
field at the end (plus the negotiation above).

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
