Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EC1BB4D
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 18:51:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6DA6EF0B;
	Mon, 13 May 2019 16:51:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3477E7F
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:51:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4DFB382C
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:51:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 774B2308402A;
	Mon, 13 May 2019 16:50:59 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07CC960856;
	Mon, 13 May 2019 16:50:53 +0000 (UTC)
Subject: Re: [PATCH v3 02/16] iommu: Introduce cache_invalidate API
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<d32d3d19-11c9-4af9-880b-bb8ebefd4f7f@redhat.com>
	<44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7807afe9-efab-9f48-4ca0-2332a7a54950@redhat.com>
Date: Mon, 13 May 2019 18:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 13 May 2019 16:50:59 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Hi Jean-Philippe,

On 5/13/19 1:20 PM, Jean-Philippe Brucker wrote:
> Hi Eric,
> 
> On 13/05/2019 10:14, Auger Eric wrote:
>> I noticed my qemu integration was currently incorrectly using PASID
>> invalidation for ASID based invalidation (SMMUV3 Stage1 CMD_TLBI_NH_ASID
>> invalidation command). So I think we also need ARCHID invalidation.
>> Sorry for the late notice.
>>>  
>>> +/* defines the granularity of the invalidation */
>>> +enum iommu_inv_granularity {
>>> +	IOMMU_INV_GRANU_DOMAIN,	/* domain-selective invalidation */
>>         IOMMU_INV_GRANU_ARCHID, /* archid-selective invalidation */
>>> +	IOMMU_INV_GRANU_PASID,	/* pasid-selective invalidation */
> 
> In terms of granularity, these values have the same meaning: invalidate
> the whole address space of a context. Then you can communicate two
> things using the same struct:
> * If ATS is enables an Arm host needs to invalidate all ATC entries
> using PASID.
> * If BTM isn't used by the guest, the host needs to invalidate all TLB
> entries using ARCHID.
> 
> Rather than introducing a new granule here, could we just add an archid
> field to the struct associated with IOMMU_INV_GRANU_PASID? Something like...
> 
>>> +	IOMMU_INV_GRANU_ADDR,	/* page-selective invalidation */
>>> +	IOMMU_INVAL_GRANU_NR,   /* number of invalidation granularities */
>>> +};
>>> +
>>> +/**
>>> + * Address Selective Invalidation Structure
>>> + *
>>> + * @flags indicates the granularity of the address-selective invalidation
>>> + * - if PASID bit is set, @pasid field is populated and the invalidation
>>> + *   relates to cache entries tagged with this PASID and matching the
>>> + *   address range.
>>> + * - if ARCHID bit is set, @archid is populated and the invalidation relates
>>> + *   to cache entries tagged with this architecture specific id and matching
>>> + *   the address range.
>>> + * - Both PASID and ARCHID can be set as they may tag different caches.
>>> + * - if neither PASID or ARCHID is set, global addr invalidation applies
>>> + * - LEAF flag indicates whether only the leaf PTE caching needs to be
>>> + *   invalidated and other paging structure caches can be preserved.
>>> + * @pasid: process address space id
>>> + * @archid: architecture-specific id
>>> + * @addr: first stage/level input address
>>> + * @granule_size: page/block size of the mapping in bytes
>>> + * @nb_granules: number of contiguous granules to be invalidated
>>> + */
>>> +struct iommu_inv_addr_info {
>>> +#define IOMMU_INV_ADDR_FLAGS_PASID	(1 << 0)
>>> +#define IOMMU_INV_ADDR_FLAGS_ARCHID	(1 << 1)
>>> +#define IOMMU_INV_ADDR_FLAGS_LEAF	(1 << 2)
>>> +	__u32	flags;
>>> +	__u32	archid;
>>> +	__u64	pasid;
>>> +	__u64	addr;
>>> +	__u64	granule_size;
>>> +	__u64	nb_granules;
>>> +};
> 
> struct iommu_inv_pasid_info {
> #define IOMMU_INV_PASID_FLAGS_PASID	(1 << 0)
> #define IOMMU_INV_PASID_FLAGS_ARCHID	(1 << 1)
> 	__u32	flags;
> 	__u32	archid;
> 	__u64	pasid;
> };
I agree it does the job now. However it looks a bit strange to do a
PASID based invalidation in my case - SMMUv3 nested stage - where I
don't have any PASID involved.

Couldn't we call it context based invalidation then? A context can be
tagged by a PASID or/and an ARCHID.

Domain invalidation would invalidate all the contexts belonging to that
domain.

Thanks

Eric
> 
>>> +
>>> +/**
>>> + * First level/stage invalidation information
>>> + * @cache: bitfield that allows to select which caches to invalidate
>>> + * @granularity: defines the lowest granularity used for the invalidation:
>>> + *     domain > pasid > addr
>>> + *
>>> + * Not all the combinations of cache/granularity make sense:
>>> + *
>>> + *         type |   DEV_IOTLB   |     IOTLB     |      PASID    |
>>> + * granularity	|		|		|      cache	|
>>> + * -------------+---------------+---------------+---------------+
>>> + * DOMAIN	|	N/A	|       Y	|	Y	|
>>  * ARCHID       |       N/A     |       Y       |       N/A     |
>>
>>> + * PASID	|	Y	|       Y	|	Y	|
>>> + * ADDR		|       Y	|       Y	|	N/A	|
>>> + *
>>> + * Invalidations by %IOMMU_INV_GRANU_ADDR use field @addr_info.
>>  * Invalidations by %IOMMU_INV_GRANU_ARCHID use field @archid.
>>> + * Invalidations by %IOMMU_INV_GRANU_PASID use field @pasid.
>>> + * Invalidations by %IOMMU_INV_GRANU_DOMAIN don't take any argument.
>>> + *
>>> + * If multiple cache types are invalidated simultaneously, they all
>>> + * must support the used granularity.
>>> + */
>>> +struct iommu_cache_invalidate_info {
>>> +#define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
>>> +	__u32	version;
>>> +/* IOMMU paging structure cache */
>>> +#define IOMMU_CACHE_INV_TYPE_IOTLB	(1 << 0) /* IOMMU IOTLB */
>>> +#define IOMMU_CACHE_INV_TYPE_DEV_IOTLB	(1 << 1) /* Device IOTLB */
>>> +#define IOMMU_CACHE_INV_TYPE_PASID	(1 << 2) /* PASID cache */
>>> +#define IOMMU_CACHE_TYPE_NR		(3)
>>> +	__u8	cache;
>>> +	__u8	granularity;
>>> +	__u8	padding[2];
>>> +	union {
>>> +		__u64	pasid;
>>                 __u32   archid;
> 
> struct iommu_inv_pasid_info pasid_info;
> 
> Thanks,
> Jean
> 
>>
>> Thanks
>>
>> Eric
>>> +		struct iommu_inv_addr_info addr_info;
>>> +	};
>>> +};
>>> +
>>> +
>>>  #endif /* _UAPI_IOMMU_H */
>>>
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
