Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1A36222D
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 16:26:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C476C847AB;
	Fri, 16 Apr 2021 14:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1A0uSyq45xm; Fri, 16 Apr 2021 14:26:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10FB847A7;
	Fri, 16 Apr 2021 14:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3E43C000A;
	Fri, 16 Apr 2021 14:26:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11FCDC000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 14:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC79B847AB
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 14:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWyJY3l2HGaV for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 14:26:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3636883C44
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618583199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1Hv2NbQ/MlDR82Y8nOIlqSLTEiVX08oupchgjJ9jRA=;
 b=O1rjioiI59LvC+S4nBSeMhvzoA5ceS7spb7jFCdkjrRNpFC6fI2SWlI3K6TOtlvalhf1eK
 N8JyO3WbCICOTkpav9TbWyRS8TN7sLxljNHIGja8vud0uQjveKKbJMfRJFUsKy+0WG39bV
 fUYD+aLmoTlKKHb4d/5H4oRLVS0daMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Zj04weCaOsqjgL2F0OCe8Q-1; Fri, 16 Apr 2021 10:26:35 -0400
X-MC-Unique: Zj04weCaOsqjgL2F0OCe8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4FE0BBEE4;
 Fri, 16 Apr 2021 14:26:32 +0000 (UTC)
Received: from [10.36.113.21] (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 321F25D9C0;
 Fri, 16 Apr 2021 14:26:21 +0000 (UTC)
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and allocation
 APIs
To: Jason Gunthorpe <jgg@nvidia.com>
References: <BN6PR11MB406854CAE9D7CE86BEAB3E23C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <BN6PR11MB40687428F0D0F3B5F13EA3E0C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <YGW27KFt9eQB9X2z@myrica>
 <BN6PR11MB4068171CD1D4B823515F7EFBC37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401134236.GF1463678@nvidia.com>
 <BN6PR11MB4068C4DE7AF43D44DE70F4C1C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401160337.GJ1463678@nvidia.com>
 <4bea6eb9-08ad-4b6b-1e0f-c97ece58a078@redhat.com>
 <20210415230732.GG1370958@nvidia.com>
 <b1492fd3-8ce2-1632-3b14-73d8d4356fd7@redhat.com>
 <20210416140524.GI1370958@nvidia.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f71c1e37-6466-e931-be1d-b9b36d785596@redhat.com>
Date: Fri, 16 Apr 2021 16:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210416140524.GI1370958@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Hi,
On 4/16/21 4:05 PM, Jason Gunthorpe wrote:
> On Fri, Apr 16, 2021 at 03:38:02PM +0200, Auger Eric wrote:
> 
>> The redesign requirement came pretty late in the development process.
>> The iommu user API is upstream for a while, the VFIO interfaces have
>> been submitted a long time ago and under review for a bunch of time.
>> Redesigning everything with a different API, undefined at this point, is
>> a major setback for our work and will have a large impact on the
>> introduction of features companies are looking forward, hence our
>> frustration.
> 
> I will answer both you and Jacob at once.
> 
> This is uAPI, once it is set it can never be changed.
> 
> The kernel process and philosophy is to invest heavily in uAPI
> development and review to converge on the best uAPI possible.
> 
> Many past submissions have take a long time to get this right, there
> are several high profile uAPI examples.
> 
> Do you think this case is so special, or the concerns so minor, that it
> should get to bypass all of the normal process?

That's not my intent to bypass any process. I am just trying to
understand what needs to be re-designed and for what use case.
> 
> Ask yourself, is anyone advocating for the current direction on
> technical merits alone?
> 
> Certainly the patches I last saw where completely disgusting from a
> uAPI design perspective.
> 
> It was against the development process to organize this work the way
> it was done. Merging a wack of dead code to the kernel to support a
> uAPI vision that was never clearly articulated was a big mistake.
> 
> Start from the beginning. Invest heavily in defining a high quality
> uAPI. Clearly describe the uAPI to all stake holders.
This was largely done during several confs including plumber, KVM forum,
for several years. Also API docs were shared on the ML. I don't remember
any voice was raised at those moments.

 Break up the
> implementation into patch series without dead code. Make the
> patches. Remove the dead code this group has already added.
> 
> None of this should be a surprise. The VDPA discussion and related
> "what is a mdev" over a year ago made it pretty clear VFIO is not the
> exclusive user of "IOMMU in userspace" and that places limits on what
> kind of uAPIs expansion it should experience going forward.
Maybe clear for you but most probably not for many other stakeholders.

Anyway I do not intend to further argue and I will be happy to learn
from you and work with you, Jacob, Liu and all other stakeholders to
define a better integration.

Thanks

Eric
> 
> Jason
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
