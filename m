Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE72669A
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 17:06:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF44BDC6;
	Wed, 22 May 2019 15:06:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5A1A5DB3
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3FBF96C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:06:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD1E780D;
	Wed, 22 May 2019 08:06:19 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E8C3F718;
	Wed, 22 May 2019 08:06:17 -0700 (PDT)
Subject: Re: [PATCH v3 09/16] iommu: Introduce guest PASID bind function
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
	<20190516091429.6d06f7e1@jacob-builder>
	<20190520122241.0db13f14@jacob-builder>
	<7bf71437-d75b-c4f7-d705-fcd71fc75060@arm.com>
	<20190521155029.0ab0a462@jacob-builder>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <37d1eee7-92c1-7e07-b73d-7af82fdb1652@arm.com>
Date: Wed, 22 May 2019 16:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521155029.0ab0a462@jacob-builder>
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

On 21/05/2019 23:50, Jacob Pan wrote:
>>> /**
>>>  * struct gpasid_bind_data - Information about device and guest
>>> PASID binding
>>>  * @version:	Version of this data structure
>>>  * @format:	PASID table entry format
>>>  * @flags:	Additional information on guest bind request
>>>  * @gpgd:	Guest page directory base of the guest mm to bind
>>>  * @hpasid:	Process address space ID used for the guest mm
>>> in host IOMMU
>>>  * @gpasid:	Process address space ID used for the guest mm
>>> in guest IOMMU  
>>
>> Trying to understand the full flow:
>> * @gpasid is the one allocated by the guest using a virtual command.
>> The guest writes @gpgd into the virtual PASID table at index @gpasid,
>> then sends an invalidate command to QEMU.
> yes
>> * QEMU issues a gpasid_bind ioctl (on the mdev or its container?).
>> VFIO forwards. The IOMMU driver installs @gpgd into the PASID table
>> using @hpasid, which is associated with the auxiliary domain.
>>
>> But why do we need the @hpasid field here? Does userspace know about
>> it at all, and does VFIO need to pass it to the IOMMU driver?
>>
> We need to support two guest-host PASID mappings through this API. Idea
> comes from Kevin & Yi.
> 1. identity mapping between host and guest PASID
> 2. guest owns its own pasid space
> 
> For option 1, which will plan to support first in this series. There is
> no need for gpasid field since gpasid=hpasid. Guest allocates PASID
> using virtual command interface which gets a host PASID. Then PASID
> cache invalidation in the guest will result in bind_gpasid(), @gpasid is
> not valid in the bind data (indicated by the IOMMU_SVA_GPASID_VAL flag).
> 
> For option 2, guest still uses virtual command to allocate guest pasid,
> but this time QEMU does the allocation for gpasid, at the same time
> QEMU will allocate a host pasid then maintain a G->H PASID lookup.
> When guest invalidate its PASID cache with GPASID, QEMU will find the
> match host PASID then pass both gpasid and hpasid down to the host IOMMU
> driver.
> Host IOMMU driver will store the gpgd at the hpasid entry but keep
> track of the gpasid->hpasid mapping. Host will never program gpasid in
> the IOMMU HW. Host IOMMU driver provides G->H PASID translation for PF
> device drivers that emulates mdev config space, i.e. virtual device
> composition module
> (https://events.linuxfoundation.org/wp-content/uploads/2017/12/Hardware-Assisted-Mediated-Pass-Through-with-VFIO-Kevin-Tian-Intel.pdf).
> 
> These two options is a per VM choice. Hopefully the two diagrams below
> can help to explain. I will put them in the next patch headers.

Thanks for the explanation, makes sense to me now. So the host kernel
needs to know G->H because the guest may write GPASID into the config
space emulated by the host device driver, and device driver then
retrieves the HPASID via an iommu_ops callback? But the device driver
keeps track of aux domains so isn't HPASID retrievable with
aux_get_pasid() already?

> 
> Option 1. Identity G-H PASID mapping diagram.
> 
>     .-------------.  .---------------------------.
>     |   vIOMMU    |  | Guest process mm, FL only |
>     |             |  '---------------------------'
>     .----------------/
>     | PASID Entry |--- PASID cache flush -
>     '-------------'\                      |
>     |             | \                     |
>     |             |  \                    |
>     '-------------'   \________________   |
>                         GPASID = HPASID   |
> Guest                  ^      ^           |
> ------| Shadow |-------| VCMD |-----------|------------
>       v        v       |      |           |
> QEMU                   v      v           |
> ------------------------------------------|------------
> Host             HPASID = ioasid_alloc()  |
>                     |                     v
>                     |       sva_bind_gpasid(HPASID)
>                     |
>     .-------------. |  .----------------------.
>     |   pIOMMU    | |  | Bind FL for GVA-GPA  |
>     |             | | /'----------------------'
>     .----------------'  |
>     | PASID Entry |     V (Nested xlate)
>     '----------------..---------------------.
>     |             |   |Set SL to GPA-HPA    |
>     |             |   '---------------------'
>     '-------------'
> 
> 
> 
> Option 2. Non-identity G-H PASID mapping diagram.
> 
>     .-------------.  .---------------------------.
>     |   vIOMMU    |  | Guest process mm, FL only |
>     |             |  '---------------------------'
>     .----------------/
>     | PASID Entry |--- PASID cache flush -
>     '-------------'\                      | .-------------.
>     |             | \                     | |Guest driver |
>     |             |  \                    | |writes GPASID|
>     '-------------'   \________________   | '-------------'
>                         GPASID            |             |
> Guest                  ^      ^           |             |
> ------| Shadow |-------| VCMD |-----------|------------ |
>       v        v       |      |           |             |
> QEMU                   v      v           |             |
> 	    GPASID = qemu_gpasid_alloc()  |             |
>             keep G->H PASID lookup        |             |
>                    ^                      v             |
> 		   |                 lookup G->H PASID  |
> -------------------|----------------------|------------ |
> Host             HPASID = ioasid_alloc()  |             |
>                     |                     v             |
>                     |     sva_bind_gpasid(HPASID,GPASID)|
>                     |     keep H-G PASID lookup         |
>                     |                          \  -------------------.
>     .-------------. |  .----------------------. \|    VDCM           |
>     |   pIOMMU    | |  | Bind FL for GVA-GPA  |  | H = lookup(GPASID)|
>     |             | | /'----------------------'  | write H to dev    |
>     .----------------'  |                         '------------------'
>     | PASID Entry |     V (Nested xlate)
>     '----------------..---------------------.
>     |             |   |Set SL to GPA-HPA    |
>     |             |   '---------------------'
>     '-------------'
> There is also implications in G-H pasid lookup for PRQ, that would be
> in the later series.
> 
>>>  * @addr_width:	Guest address width. Paging mode can also be
>>> derived.  
>>
>> What does the last sentence mean? @addr_width should probably be in
>> @vtd if it provides implicit information.
>>
> Derive 4 or 5 level paging mode from the address width. It can be in
> @vtd but i thought this can be generic.

Yes I think it's generic enough. It may be worth stating that this is
the *virtual* address width, and removing or clarifying what the paging
mode is (the sentence could be confusing on Arm, as we have different
page granules which cannot be derived from the address width)

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
