Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25CEFDB
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 07:16:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AE0F0E38;
	Tue, 30 Apr 2019 05:16:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B712FE33
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 05:16:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1C711711
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 05:16:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41F1630715CA;
	Tue, 30 Apr 2019 05:16:16 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEB5E1001284;
	Tue, 30 Apr 2019 05:15:50 +0000 (UTC)
Subject: Re: [PATCH v2 17/19] iommu: Add max num of cache and granu types
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1556062279-64135-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556062279-64135-18-git-send-email-jacob.jun.pan@linux.intel.com>
	<a9f2c804-24a8-03fb-96ac-0c4661870dd5@redhat.com>
	<20190429091723.5970e967@jacob-builder>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fe189810-aa25-2a67-0608-fbeef5b07d92@redhat.com>
Date: Tue, 30 Apr 2019 07:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190429091723.5970e967@jacob-builder>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 05:16:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
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

Hi Jacob,

On 4/29/19 6:17 PM, Jacob Pan wrote:
> On Fri, 26 Apr 2019 18:22:46 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Jacob,
>>
>> On 4/24/19 1:31 AM, Jacob Pan wrote:
>>> To convert to/from cache types and granularities between generic and
>>> VT-d specific counterparts, a 2D arrary is used. Introduce the
>>> limits  
>> array
>>> to help define the converstion array size.  
>> conversion
>>>
> will fix, thanks
>>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>>> ---
>>>  include/uapi/linux/iommu.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
>>> index 5c95905..2d8fac8 100644
>>> --- a/include/uapi/linux/iommu.h
>>> +++ b/include/uapi/linux/iommu.h
>>> @@ -197,6 +197,7 @@ struct iommu_inv_addr_info {
>>>  	__u64	granule_size;
>>>  	__u64	nb_granules;
>>>  };
>>> +#define NR_IOMMU_CACHE_INVAL_GRANU	(3)
>>>  
>>>  /**
>>>   * First level/stage invalidation information
>>> @@ -235,6 +236,7 @@ struct iommu_cache_invalidate_info {
>>>  		struct iommu_inv_addr_info addr_info;
>>>  	};
>>>  };
>>> +#define NR_IOMMU_CACHE_TYPE		(3)
>>>  /**
>>>   * struct gpasid_bind_data - Information about device and guest
>>> PASID binding
>>>   * @gcr3:	Guest CR3 value from guest mm
>>>   
>> Is it really something that needs to be exposed in the uapi?
>>
> I put it in uapi since the related definitions for granularity and
> cache type are in the same file.
> Maybe putting them close together like this? I was thinking you can just
> fold it into your next series as one patch for introducing cache
> invalidation.
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 2d8fac8..4ff6929 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -164,6 +164,7 @@ enum iommu_inv_granularity {
>         IOMMU_INV_GRANU_DOMAIN, /* domain-selective invalidation */
>         IOMMU_INV_GRANU_PASID,  /* pasid-selective invalidation */
>         IOMMU_INV_GRANU_ADDR,   /* page-selective invalidation */
> +       NR_IOMMU_INVAL_GRANU,   /* number of invalidation granularities
> */ };
>  
>  /**
> @@ -228,6 +229,7 @@ struct iommu_cache_invalidate_info {
>  #define IOMMU_CACHE_INV_TYPE_IOTLB     (1 << 0) /* IOMMU IOTLB */
>  #define IOMMU_CACHE_INV_TYPE_DEV_IOTLB (1 << 1) /* Device IOTLB */
>  #define IOMMU_CACHE_INV_TYPE_PASID     (1 << 2) /* PASID cache */
> +#define NR_IOMMU_CACHE_TYPE            (3)

OK I will add this.

Thanks

Eric
>         __u8    cache;
>         __u8    granularity;
> 
>> Thanks
>>
>> Eric
> 
> [Jacob Pan]
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
