Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D5362124
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 15:38:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853C24060E;
	Fri, 16 Apr 2021 13:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i42uEMg1o8bn; Fri, 16 Apr 2021 13:38:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8354185E;
	Fri, 16 Apr 2021 13:38:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14DABC0011;
	Fri, 16 Apr 2021 13:38:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FA0DC000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 13:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B44B4012F
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 13:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6XSP23gdyjU for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 13:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A322D400C2
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618580305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORKl8cG3pXQFZT6dMTWhjbu3j7T6kEqKkWZLykCofkk=;
 b=jOKyVHfYnzyH0SBAiOMIXt+uuFwBDeuRDnRItNJBmv3CW+5i6G2guHfDrtGaEUR1HD0RWd
 HBFiv7cvsrWugjZjLI9z3EIDri5l0/hEvyfRTFTkNv7SBR1GJmPz0RZ7zxyuYmrpW64+qm
 XCIICJo5hSGzZIix/65xzL9yy/icIFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-rdYtHHQlPP-nLVltZYYZvA-1; Fri, 16 Apr 2021 09:38:21 -0400
X-MC-Unique: rdYtHHQlPP-nLVltZYYZvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FFCA107ACCA;
 Fri, 16 Apr 2021 13:38:18 +0000 (UTC)
Received: from [10.36.113.21] (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3276A19D9F;
 Fri, 16 Apr 2021 13:38:04 +0000 (UTC)
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and allocation
 APIs
To: Jason Gunthorpe <jgg@nvidia.com>
References: <BN6PR11MB40688F5AA2323AB8CC8E65E7C37C9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210331124038.GE1463678@nvidia.com>
 <BN6PR11MB406854CAE9D7CE86BEAB3E23C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <BN6PR11MB40687428F0D0F3B5F13EA3E0C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <YGW27KFt9eQB9X2z@myrica>
 <BN6PR11MB4068171CD1D4B823515F7EFBC37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401134236.GF1463678@nvidia.com>
 <BN6PR11MB4068C4DE7AF43D44DE70F4C1C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401160337.GJ1463678@nvidia.com>
 <4bea6eb9-08ad-4b6b-1e0f-c97ece58a078@redhat.com>
 <20210415230732.GG1370958@nvidia.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b1492fd3-8ce2-1632-3b14-73d8d4356fd7@redhat.com>
Date: Fri, 16 Apr 2021 15:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210415230732.GG1370958@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>, "Jiang,
 Dave" <dave.jiang@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On 4/16/21 1:07 AM, Jason Gunthorpe wrote:
> On Thu, Apr 15, 2021 at 03:11:19PM +0200, Auger Eric wrote:
>> Hi Jason,
>>
>> On 4/1/21 6:03 PM, Jason Gunthorpe wrote:
>>> On Thu, Apr 01, 2021 at 02:08:17PM +0000, Liu, Yi L wrote:
>>>
>>>> DMA page faults are delivered to root-complex via page request message and
>>>> it is per-device according to PCIe spec. Page request handling flow is:
>>>>
>>>> 1) iommu driver receives a page request from device
>>>> 2) iommu driver parses the page request message. Get the RID,PASID, faulted
>>>>    page and requested permissions etc.
>>>> 3) iommu driver triggers fault handler registered by device driver with
>>>>    iommu_report_device_fault()
>>>
>>> This seems confused.
>>>
>>> The PASID should define how to handle the page fault, not the driver.
>>
>> In my series I don't use PASID at all. I am just enabling nested stage
>> and the guest uses a single context. I don't allocate any user PASID at
>> any point.
>>
>> When there is a fault at physical level (a stage 1 fault that concerns
>> the guest), this latter needs to be reported and injected into the
>> guest. The vfio pci driver registers a fault handler to the iommu layer
>> and in that fault handler it fills a circ bugger and triggers an eventfd
>> that is listened to by the VFIO-PCI QEMU device. this latter retrives
>> the faault from the mmapped circ buffer, it knowns which vIOMMU it is
>> attached to, and passes the fault to the vIOMMU.
>> Then the vIOMMU triggers and IRQ in the guest.
>>
>> We are reusing the existing concepts from VFIO, region, IRQ to do that.
>>
>> For that use case, would you also use /dev/ioasid?
> 
> /dev/ioasid could do all the things you described vfio-pci as doing,
> it can even do them the same way you just described.
> 
> Stated another way, do you plan to duplicate all of this code someday
> for vfio-cxl? What about for vfio-platform? ARM SMMU can be hooked to
> platform devices, right?
vfio regions and IRQ related APIs are common user interfaces exposed by
all vfio drivers, including platform. Then the actual circular buffer
implementation details can be put in a common lib.

as for the thin vfio iommu wrappers, the ones you don't like, they are
implemented in type1 code.

Maybe the need for /dev/ioasid is more crying for PASID management but
for the nested use case, that's not obvious to me and in your different
replies, it was not crystal clear where the use case belongs to.

The redesign requirement came pretty late in the development process.
The iommu user API is upstream for a while, the VFIO interfaces have
been submitted a long time ago and under review for a bunch of time.
Redesigning everything with a different API, undefined at this point, is
a major setback for our work and will have a large impact on the
introduction of features companies are looking forward, hence our
frustration.

Thanks

Eric


> 
> I feel what you guys are struggling with is some choice in the iommu
> kernel APIs that cause the events to be delivered to the pci_device
> owner, not the PASID owner.
> 
> That feels solvable.
> 
> Jason
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
