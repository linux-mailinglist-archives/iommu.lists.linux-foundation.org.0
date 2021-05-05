Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF13736CC
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 11:11:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552C7607ED;
	Wed,  5 May 2021 09:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhEhjaSuHrJw; Wed,  5 May 2021 09:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D95F6062C;
	Wed,  5 May 2021 09:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE80C0001;
	Wed,  5 May 2021 09:10:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF4DC0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 09:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CA2405EB
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 09:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymEP6KAkax0Y for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 09:10:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43F84405E0
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620205854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0SQnCbBnNBGtZsOp6MO/Q/qxE8V3SBQW2J1qFEwtZU=;
 b=IVZWMQ2sLTFH8maZ/DesjqIIGo1J91YbOsIPsh5dZ9lFfrUCpPBmAUO5RMdHGkqDqQWkKk
 GHu+sVIdewlbR56LhNnamjl+Fb/VL0a8Svts+pC5YmoGYxPZm1H3Mt1F4MSVrXcNSUTyNz
 iWIdRQ/kSPaa57NlpBSRyY3ManpSSiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-MlKJvMw1OS2yDEXnT8O6kw-1; Wed, 05 May 2021 05:10:50 -0400
X-MC-Unique: MlKJvMw1OS2yDEXnT8O6kw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C59C107ACCA;
 Wed,  5 May 2021 09:10:47 +0000 (UTC)
Received: from [10.36.113.191] (ovpn-113-191.ams2.redhat.com [10.36.113.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA7A60CC6;
 Wed,  5 May 2021 09:10:31 +0000 (UTC)
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and allocation
 APIs
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210416094547.1774e1a3@redhat.com>
 <BN6PR11MB406854F56D18E1187A2C98ACC3479@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210421162307.GM1370958@nvidia.com> <20210421105451.56d3670a@redhat.com>
 <20210421175203.GN1370958@nvidia.com> <20210421133312.15307c44@redhat.com>
 <20210421230301.GP1370958@nvidia.com>
 <MWHPR11MB1886188698A6E20338196F788C469@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210422121020.GT1370958@nvidia.com>
 <6e36797c-799e-074d-f66f-5686a4b37f38@redhat.com>
 <20210429200431.GA1370958@nvidia.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <17ab53a6-c2d7-c085-6469-ae487b138526@redhat.com>
Date: Wed, 5 May 2021 11:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210429200431.GA1370958@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi Jason,

On 4/29/21 10:04 PM, Jason Gunthorpe wrote:
> On Thu, Apr 29, 2021 at 03:26:55PM +0200, Auger Eric wrote:
>> From the pseudo code,
>>
>>   gpa_ioasid_id = ioctl(ioasid_fd, CREATE_IOASID, ..)
>>   ioctl(ioasid_fd, SET_IOASID_PAGE_TABLES, ..)
>>
>> I fail to understand whether the SET_IOASID_PAGE_TABLES would apply to
>> the whole IOASIDs within /dev/ioasid or to a specific one.
> 
> Sorry, nearly every IOCTL would be scoped to a specific IOASID as one
> of the arguments.

OK thank you for the clarification.
> 
>> Also in subsequent emails when you talk about IOASID, is it the
>> ioasid_id, just to double check the terminology.
> 
> I am refering to IOASID as 'handle of the page table object inside the
> /dev/ioasid fd'. If that is equal to some HW value or not I think
> remains as decision point.
OK
> 
> Basically the fd has an xarray of 'struct [something] *' and the
> IOASID is index to that FD's private xarray. This is necessary to
> create proper security as even if we have global PASID numbers or
> something they still need to be isolated to only the FD that has
> been authorized access.
> 
>>>   nested_ioasid = ioctl(ioasid_fd, CREATE_NESTED_IOASID,  gpa_ioasid_id);
>>>   ioctl(ioasid_fd, SET_NESTED_IOASID_PAGE_TABLES, nested_ioasid, ..)
>> is the nested_ioasid the allocated PASID id or is it a complete
>> different object id.
> 
> It is the IOASID handle above.
ok as per the following emails and below comment IOASID and PASID are
different.The first would be a logic ID wgile the second the HW ID.

Thanks

Eric
> 
>>>
>>>    // IOMMU will match on the device RID, no PASID:
>>>   ioctl(vfio_device, ATTACH_IOASID, nested_ioasid);
>>>
>>>    // IOMMU will match on the device RID and PASID:
>>>   ioctl(vfio_device, ATTACH_IOASID_PASID, pasid, nested_ioasid);
>> here I see you pass a different pasid, so I guess they are different, in
>> which case you would need to have an allocator function for this pasid,
>> right?
> 
> Yes, the underlying HW ID (PASID or substream id or whatver) is
> something slightly different
> 
> Jason
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
