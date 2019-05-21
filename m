Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014F254EE
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 18:10:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 040DCC3F;
	Tue, 21 May 2019 16:10:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5BD7EBDC
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A3D9DE3
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:10:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CB90374;
	Tue, 21 May 2019 09:10:05 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BABFF3F718;
	Tue, 21 May 2019 09:10:03 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 09/16] iommu: Introduce guest PASID bind function
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
	<20190516091429.6d06f7e1@jacob-builder>
	<20190520122241.0db13f14@jacob-builder>
Message-ID: <7bf71437-d75b-c4f7-d705-fcd71fc75060@arm.com>
Date: Tue, 21 May 2019 17:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520122241.0db13f14@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
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

On 20/05/2019 20:22, Jacob Pan wrote:
> On Thu, 16 May 2019 09:14:29 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
>> On Thu, 16 May 2019 15:14:40 +0100
>> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
>>
>>> Hi Jacob,
>>>
>>> On 03/05/2019 23:32, Jacob Pan wrote:  
>>>> +/**
>>>> + * struct gpasid_bind_data - Information about device and guest
>>>> PASID binding
>>>> + * @gcr3:	Guest CR3 value from guest mm
>>>> + * @pasid:	Process address space ID used for the guest mm
>>>> + * @addr_width:	Guest address width. Paging mode can also
>>>> be derived.
>>>> + */
>>>> +struct gpasid_bind_data {
>>>> +	__u64 gcr3;
>>>> +	__u32 pasid;
>>>> +	__u32 addr_width;
>>>> +	__u32 flags;
>>>> +#define	IOMMU_SVA_GPASID_SRE	BIT(0) /* supervisor
>>>> request */
>>>> +	__u8 padding[4];
>>>> +};    
>>>
>>> Could you wrap this structure into a generic one like we now do for
>>> bind_pasid_table? It would make the API easier to extend, because if
>>> we ever add individual PASID bind on Arm (something I'd like to do
>>> for virtio-iommu, eventually) it will have different parameters, as
>>> our PASID table entry has a lot of fields describing the page table
>>> format.
>>>
>>> Maybe something like the following would do?
>>>
>>> struct gpasid_bind_data {
>>> #define IOMMU_GPASID_BIND_VERSION_1 1
>>> 	__u32 version;
>>> #define IOMMU_GPASID_BIND_FORMAT_INTEL_VTD	1
>>> 	__u32 format;
>>> 	union {
>>> 		// the current gpasid_bind_data:
>>> 		struct gpasid_bind_intel_vtd vtd;
>>> 	};
>>> };
>>>   
> 
> Could you review the struct below? I am trying to extract the
> common fileds as much as possible. Didn't do exactly as you suggested
> to keep vendor specific data in separate struct under the same union.

Thanks, it looks good and I think we can reuse it for SMMUv2 and v3.
Some comments below.

> 
> Also, can you review the v3 ioasid allocator common code patches? I am
> hoping we can get the common code in v5.3 so that we can focus on the
> vendor specific part. The common code should include bind_guest_pasid
> and ioasid allocator.
> https://lkml.org/lkml/2019/5/3/787
> https://lkml.org/lkml/2019/5/3/780
> 
> Thanks,
> 
> Jacob
> 
> 
> /**
>  * struct gpasid_bind_data_vtd - Intel VT-d specific data on device and guest
>  * SVA binding.
>  *
>  * @flags:	VT-d PASID table entry attributes
>  * @pat:	Page attribute table data to compute effective memory type
>  * @emt:	Extended memory type
>  *
>  * Only guest vIOMMU selectable and effective options are passed down to
>  * the host IOMMU.
>  */
> struct gpasid_bind_data_vtd {
> #define	IOMMU_SVA_VTD_GPASID_SRE	BIT(0) /* supervisor request */
> #define	IOMMU_SVA_VTD_GPASID_EAFE	BIT(1) /* extended access enable */
> #define	IOMMU_SVA_VTD_GPASID_PCD	BIT(2) /* page-level cache disable */
> #define	IOMMU_SVA_VTD_GPASID_PWT	BIT(3) /* page-level write through */
> #define	IOMMU_SVA_VTD_GPASID_EMTE	BIT(4) /* extended memory type enable */
> #define	IOMMU_SVA_VTD_GPASID_CD		BIT(5) /* PASID-level cache disable */

It doesn't seem like the BIT() macro is exported to userspace, so we
can't use it here

> 	__u64 flags;
> 	__u32 pat;
> 	__u32 emt;
> };
> 
> /**
>  * struct gpasid_bind_data - Information about device and guest PASID binding
>  * @version:	Version of this data structure
>  * @format:	PASID table entry format
>  * @flags:	Additional information on guest bind request
>  * @gpgd:	Guest page directory base of the guest mm to bind
>  * @hpasid:	Process address space ID used for the guest mm in host IOMMU
>  * @gpasid:	Process address space ID used for the guest mm in guest IOMMU

Trying to understand the full flow:
* @gpasid is the one allocated by the guest using a virtual command. The
guest writes @gpgd into the virtual PASID table at index @gpasid, then
sends an invalidate command to QEMU.
* QEMU issues a gpasid_bind ioctl (on the mdev or its container?). VFIO
forwards. The IOMMU driver installs @gpgd into the PASID table using
@hpasid, which is associated with the auxiliary domain.

But why do we need the @hpasid field here? Does userspace know about it
at all, and does VFIO need to pass it to the IOMMU driver?

>  * @addr_width:	Guest address width. Paging mode can also be derived.

What does the last sentence mean? @addr_width should probably be in @vtd
if it provides implicit information.

>  * @vtd:	Intel VT-d specific data
>  */
> struct gpasid_bind_data {
> #define IOMMU_GPASID_BIND_VERSION_1	1
> 	__u32 version;
> #define IOMMU_PASID_FORMAT_INTEL_VTD	1
> 	__u32 format;
> #define	IOMMU_SVA_GPASID_VAL	BIT(1) /* guest PASID valid */

(There are tabs between define and name here, as well as in the VT-d
specific data)

> 	__u64 flags;
> 	__u64 gpgd;
> 	__u64 hpasid;
> 	__u64 gpasid;
> 	__u32 addr_width;

I think the union has to be aligned on 64-bit, otherwise a compiler
might insert padding (https://lkml.org/lkml/2019/1/11/1207)

Thanks,
Jean

> 	/* Vendor specific data */
> 	union {
> 		struct gpasid_bind_data_vtd vtd;
> 	};
> };
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
