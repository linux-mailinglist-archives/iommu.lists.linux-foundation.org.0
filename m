Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD536EB4A
	for <lists.iommu@lfdr.de>; Thu, 29 Apr 2021 15:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B196F6E8;
	Thu, 29 Apr 2021 13:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHXkega7Jxgj; Thu, 29 Apr 2021 13:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A408F6F6DD;
	Thu, 29 Apr 2021 13:27:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F53EC0019;
	Thu, 29 Apr 2021 13:27:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6267BC0001
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 13:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48C2440683
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 13:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ujrCm36x1jc for <iommu@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 13:27:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BC7E4014B
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619702829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1S2l6ltOAUMOqA4QGNdJwZj23ip0m20+cgBzNWZI1I=;
 b=dOvA5TTnecb7GfDcRVtpuv2rdjLcolnB6qmjQsCPWvdWKemMV8VL5GE8oV07tRVJVdLXlH
 XzjtmIP3GdSzc/Z5OXOLu4X6XU8iITVxhTiB2a7Y1hPV18otbnQJqW5g2Qisg1OxqC1gLJ
 +wOXNmNX1AcMn9p90a9t9vlEO62HfIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-MGyXYiKvNAel8CyKJi4YvQ-1; Thu, 29 Apr 2021 09:27:06 -0400
X-MC-Unique: MGyXYiKvNAel8CyKJi4YvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4065B6D256;
 Thu, 29 Apr 2021 13:27:02 +0000 (UTC)
Received: from [10.36.113.191] (ovpn-113-191.ams2.redhat.com [10.36.113.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F7FD5C1A3;
 Thu, 29 Apr 2021 13:26:56 +0000 (UTC)
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and allocation
 APIs
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20210415230732.GG1370958@nvidia.com>
 <20210416061258.325e762e@jacob-builder> <20210416094547.1774e1a3@redhat.com>
 <BN6PR11MB406854F56D18E1187A2C98ACC3479@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210421162307.GM1370958@nvidia.com> <20210421105451.56d3670a@redhat.com>
 <20210421175203.GN1370958@nvidia.com> <20210421133312.15307c44@redhat.com>
 <20210421230301.GP1370958@nvidia.com>
 <MWHPR11MB1886188698A6E20338196F788C469@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210422121020.GT1370958@nvidia.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6e36797c-799e-074d-f66f-5686a4b37f38@redhat.com>
Date: Thu, 29 Apr 2021 15:26:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210422121020.GT1370958@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Li Zefan <lizefan@huawei.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
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

Hi,

On 4/22/21 2:10 PM, Jason Gunthorpe wrote:
> On Thu, Apr 22, 2021 at 08:34:32AM +0000, Tian, Kevin wrote:
> 
>> The shim layer could be considered as a new iommu backend in VFIO,
>> which connects VFIO iommu ops to the internal helpers in
>> drivers/ioasid.
> 
> It may be the best we can do because of SPAPR, but the ideal outcome
> should be to remove the entire pluggable IOMMU stuff from vfio
> entirely and have it only use /dev/ioasid
> 
> We should never add another pluggable IOMMU type to vfio - everything
> should be done through drives/iommu now that it is much more capable.
> 
>> Another tricky thing is that a container may be linked to multiple iommu
>> domains in VFIO, as devices in the container may locate behind different
>> IOMMUs with inconsistent capability (commit 1ef3e2bc). 
> 
> Frankly this sounds over complicated. I would think /dev/ioasid should
> select the IOMMU when the first device is joined, and all future joins
> must be compatible with the original IOMMU - ie there is only one set
> of IOMMU capabilities in a /dev/ioasid.
> 
> This means qemue might have multiple /dev/ioasid's if the system has
> multiple incompatible IOMMUs (is this actually a thing?) The platform
> should design its IOMMU domains to minimize the number of
> /dev/ioasid's required.
> 
> Is there a reason we need to share IOASID'd between completely
> divergance IOMMU implementations? I don't expect the HW should be able
> to physically share page tables??
> 
> That decision point alone might be the thing that just says we can't
> ever have /dev/vfio/vfio == /dev/ioasid
> 
>> Just to confirm. Above flow is for current map/unmap flavor as what
>> VFIO/vDPA do today. Later when nested translation is supported,
>> there is no need to detach gpa_ioasid_fd. Instead, a new cmd will
>> be introduced to nest rid_ioasid_fd on top of gpa_ioasid_fd:
> 
> Sure.. The tricky bit will be to define both of the common nested
> operating modes.
>

From the pseudo code,

  gpa_ioasid_id = ioctl(ioasid_fd, CREATE_IOASID, ..)
  ioctl(ioasid_fd, SET_IOASID_PAGE_TABLES, ..)

I fail to understand whether the SET_IOASID_PAGE_TABLES would apply to
the whole IOASIDs within /dev/ioasid or to a specific one.

Also in subsequent emails when you talk about IOASID, is it the
ioasid_id, just to double check the terminology.


>   nested_ioasid = ioctl(ioasid_fd, CREATE_NESTED_IOASID,  gpa_ioasid_id);
>   ioctl(ioasid_fd, SET_NESTED_IOASID_PAGE_TABLES, nested_ioasid, ..)
is the nested_ioasid the allocated PASID id or is it a complete
different object id.
> 
>    // IOMMU will match on the device RID, no PASID:
>   ioctl(vfio_device, ATTACH_IOASID, nested_ioasid);
> 
>    // IOMMU will match on the device RID and PASID:
>   ioctl(vfio_device, ATTACH_IOASID_PASID, pasid, nested_ioasid);
here I see you pass a different pasid, so I guess they are different, in
which case you would need to have an allocator function for this pasid,
right?

Thanks

Eric
> 
> Notice that ATTACH (or bind, whatever) is always done on the
> vfio_device FD. ATTACH tells the IOMMU HW to link the PCI BDF&PASID to
> a specific page table defined by an IOASID.
> 
> I expect we have many flavours of IOASID tables, eg we have normal,
> and 'nested with table controlled by hypervisor'. ARM has 'nested with
> table controlled by guest' right? So like this?
> 
>   nested_ioasid = ioctl(ioasid_fd, CREATE_DELGATED_IOASID,
>                    gpa_ioasid_id, <some kind of viommu_id>)
>   // PASID now goes to <viommu_id>
>   ioctl(vfio_device, ATTACH_IOASID_PASID, pasid, nested_ioasid);

> 
> Where <viommu_id> is some internal to the guest handle of the viommu
> page table scoped within gpa_ioasid_id? Like maybe it is GPA of the
> base of the page table?
> 
> The guest can't select its own PASIDs without telling the hypervisor,
> right?
> 
>> I also feel hiding group from uAPI is a good thing and is interested in
>> the rationale behind for explicitly managing group in vfio (which is
>> essentially the same boundary as provided by iommu group), e.g. for 
>> better user experience when group security is broken? 
> 
> Indeed, I can see how things might have just evolved into this, but if
> it has a purpose it seems pretty hidden.
> we need it or not seems pretty hidden.
> 
> Jason
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
