Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A31A316E
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 11:01:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB01086ACF;
	Thu,  9 Apr 2020 09:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRcMLIZy3gte; Thu,  9 Apr 2020 09:01:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3547884AA7;
	Thu,  9 Apr 2020 09:01:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16CBEC0177;
	Thu,  9 Apr 2020 09:01:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27B32C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D19186BA4
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1Q+vgyssjCf for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 09:01:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B76F86B18
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586422901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msTkXhnouvwVtlF7/78TkiH9nVYNya7vCxTaw1gbKMk=;
 b=Zbtq2E+TUC/P1PltSqsr7owVqWxrb0qHhf1GWXOFi/owc9dD48yMUrR2tF7hdoC3AshfUa
 /GxJQzItDhveLzgAQX3oEh5lUCS8+HbJ1KdYObk5DZV5PI0t5S65RpzRCUjdPRPLjvwGPx
 o6FZfQkVqk0PnlqaJhmPu0/KgaHXvYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-4d7R36GENiiwKgaxvAcgYQ-1; Thu, 09 Apr 2020 05:01:37 -0400
X-MC-Unique: 4d7R36GENiiwKgaxvAcgYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88F18107ACCA;
 Thu,  9 Apr 2020 09:01:35 +0000 (UTC)
Received: from [10.36.115.53] (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8122AA63D6;
 Thu,  9 Apr 2020 09:01:26 +0000 (UTC)
Subject: Re: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-6-git-send-email-yi.l.liu@intel.com>
 <cb68e9ab-77b0-7e97-a661-4836962041d9@redhat.com>
 <A2975661238FB949B60364EF0F2C25743A21DB4E@SHSMSX104.ccr.corp.intel.com>
 <b47891b1-ece6-c263-9c07-07c09c7d3752@redhat.com>
 <20200403082305.GA1269501@myrica>
 <A2975661238FB949B60364EF0F2C25743A2249DF@SHSMSX104.ccr.corp.intel.com>
 <acf8c809-8d29-92d6-2445-3a94fc8b82fd@redhat.com>
 <20200409081442.GD2435@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f9ed6639-35f2-af32-2d2c-78929d52b763@redhat.com>
Date: Thu, 9 Apr 2020 11:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200409081442.GD2435@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Tian,
 Jun J" <jun.j.tian@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jean,

On 4/9/20 10:14 AM, Jean-Philippe Brucker wrote:
> On Wed, Apr 08, 2020 at 12:27:58PM +0200, Auger Eric wrote:
>> Hi Yi,
>>
>> On 4/7/20 11:43 AM, Liu, Yi L wrote:
>>> Hi Jean,
>>>
>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>> Sent: Friday, April 3, 2020 4:23 PM
>>>> To: Auger Eric <eric.auger@redhat.com>
>>>> userspace
>>>>
>>>> On Wed, Apr 01, 2020 at 03:01:12PM +0200, Auger Eric wrote:
>>>>>>>>  	header = vfio_info_cap_add(caps, sizeof(*nesting_cap),
>>>>>>>>  				   VFIO_IOMMU_TYPE1_INFO_CAP_NESTING, 1);
>>>> @@ -2254,6 +2309,7
>>>>>>>> @@ static int vfio_iommu_info_add_nesting_cap(struct
>>>>>>> vfio_iommu *iommu,
>>>>>>>>  		/* nesting iommu type supports PASID requests (alloc/free) */
>>>>>>>>  		nesting_cap->nesting_capabilities |= VFIO_IOMMU_PASID_REQS;
>>>>>>> What is the meaning for ARM?
>>>>>>
>>>>>> I think it's just a software capability exposed to userspace, on
>>>>>> userspace side, it has a choice to use it or not. :-) The reason
>>>>>> define it and report it in cap nesting is that I'd like to make the
>>>>>> pasid alloc/free be available just for IOMMU with type
>>>>>> VFIO_IOMMU_TYPE1_NESTING. Please feel free tell me if it is not good
>>>>>> for ARM. We can find a proper way to report the availability.
>>>>>
>>>>> Well it is more a question for jean-Philippe. Do we have a system wide
>>>>> PASID allocation on ARM?
>>>>
>>>> We don't, the PASID spaces are per-VM on Arm, so this function should consult the
>>>> IOMMU driver before setting flags. As you said on patch 3, nested doesn't
>>>> necessarily imply PASID support. The SMMUv2 does not support PASID but does
>>>> support nesting stages 1 and 2 for the IOVA space.
>>>> SMMUv3 support of PASID depends on HW capabilities. So I think this needs to be
>>>> finer grained:
>>>>
>>>> Does the container support:
>>>> * VFIO_IOMMU_PASID_REQUEST?
>>>>   -> Yes for VT-d 3
>>>>   -> No for Arm SMMU
>>>> * VFIO_IOMMU_{,UN}BIND_GUEST_PGTBL?
>>>>   -> Yes for VT-d 3
>>>>   -> Sometimes for SMMUv2
>>>>   -> No for SMMUv3 (if we go with BIND_PASID_TABLE, which is simpler due to
>>>>      PASID tables being in GPA space.)
>>>> * VFIO_IOMMU_BIND_PASID_TABLE?
>>>>   -> No for VT-d
>>>>   -> Sometimes for SMMUv3
>>>>
>>>> Any bind support implies VFIO_IOMMU_CACHE_INVALIDATE support.
>>>
>>> good summary. do you expect to see any 
>>>
>>>>
>>>>>>>> +	nesting_cap->stage1_formats = formats;
>>>>>>> as spotted by Kevin, since a single format is supported, rename
>>>>>>
>>>>>> ok, I was believing it may be possible on ARM or so. :-) will rename
>>>>>> it.
>>>>
>>>> Yes I don't think an u32 is going to cut it for Arm :( We need to describe all sorts of
>>>> capabilities for page and PASID tables (granules, GPA size, ASID/PASID size, HW
>>>> access/dirty, etc etc.) Just saying "Arm stage-1 format" wouldn't mean much. I
>>>> guess we could have a secondary vendor capability for these?
>>>
>>> Actually, I'm wondering if we can define some formats to stands for a set of
>>> capabilities. e.g. VTD_STAGE1_FORMAT_V1 which may indicates the 1st level
>>> page table related caps (aw, a/d, SRE, EA and etc.). And vIOMMU can parse
>>> the capabilities.
>>
>> But eventually do we really need all those capability getters? I mean
>> can't we simply rely on the actual call to VFIO_IOMMU_BIND_GUEST_PGTBL()
>> to detect any mismatch? Definitively the error handling may be heavier
>> on userspace but can't we manage.
> 
> I think we need to present these capabilities at boot time, long before
> the guest triggers a bind(). For example if the host SMMU doesn't support
> 16-bit ASID, we need to communicate that to the guest using vSMMU ID
> registers or PROBE properties. Otherwise a bind() will succeed, but if the
> guest uses 16-bit ASIDs in its CD, DMA will result in C_BAD_CD events
> which we'll inject into the guest, for no apparent reason from their
> perspective.
OK I understand this case as in this situation we may be able to change
the way to iommu is exposed to the guest.
> 
> In addition some VMMs may have fallbacks if shared page tables are not
> available. They could fall back to a MAP/UNMAP interface, or simply not
> present a vIOMMU to the guest.
fair enough, there is a need for such capability checker in the mid
term. But this patch introduces the capability to check whether system
wide PASID alloc is supported and this may not be requested at that
stage for the whole vSVM integration?

Thanks

Eric
> 
> Thanks,
> Jean
> 
>> My fear is we end up with an overly
>> complex series. This capability getter may be interesting if we can
>> switch to a fallback implementation but here I guess we don't have any
>> fallback. With smmuv3 nested stage we don't have any fallback solution
>> either. For the versions, it is different because the userspace shall be
>> able to adapt (or not) to the max version supported by the kernel.
>>
>> Thanks
>>
>> Eric
>>>
>>> Regards,
>>> Yi Liu
>>>
>>
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
