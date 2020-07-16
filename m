Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B21222D1B
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 22:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3610787F67;
	Thu, 16 Jul 2020 20:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ryaJdpwFV5Q; Thu, 16 Jul 2020 20:38:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BFED87F53;
	Thu, 16 Jul 2020 20:38:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D5BBC0733;
	Thu, 16 Jul 2020 20:38:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65347C0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4783D203A6
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4Twpc+bo-mB for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 20:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id D0B55203A5
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 20:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594931916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CjDuk4zdnGXZCpAX8XmulZKhmJ4OnT0I1eZkf+SUbg=;
 b=Ri0oEvoEc3uSuuMTFU1b8I4HpNGYuCQdz3okkS18AiSAf42ndr6qot84DVqo9OIxIX9PuV
 4NuWLL93r2Yl/nmJ/lqszQnjVnKmRwSQtqe8Z0aRiSEhwFlWo8ObNY8zq+eV6eYDv7X/66
 mrX0Gi/Rp5gZxxWPGNIabFm3/GwlTCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-wzxDx8tPOE-ErPFAnGdpTg-1; Thu, 16 Jul 2020 16:38:34 -0400
X-MC-Unique: wzxDx8tPOE-ErPFAnGdpTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1E218A1DFD;
 Thu, 16 Jul 2020 20:38:31 +0000 (UTC)
Received: from [10.36.115.54] (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2616775540;
 Thu, 16 Jul 2020 20:38:19 +0000 (UTC)
Subject: Re: [PATCH v5 03/15] iommu/smmu: Report empty domain nesting info
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Liu, Yi L" <yi.l.liu@intel.com>
References: <1594552870-55687-1-git-send-email-yi.l.liu@intel.com>
 <1594552870-55687-4-git-send-email-yi.l.liu@intel.com>
 <20200713131454.GA2739@willie-the-truck>
 <CY4PR11MB1432226D0A52D099249E95A0C3610@CY4PR11MB1432.namprd11.prod.outlook.com>
 <20200716153959.GA447208@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f3779a69-0295-d668-5f2f-746b6ff2bdce@redhat.com>
Date: Thu, 16 Jul 2020 22:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200716153959.GA447208@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "Wu, Hao" <hao.wu@intel.com>,
 Will Deacon <will@kernel.org>, "Tian, Jun J" <jun.j.tian@intel.com>
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

On 7/16/20 5:39 PM, Jean-Philippe Brucker wrote:
> On Tue, Jul 14, 2020 at 10:12:49AM +0000, Liu, Yi L wrote:
>>> Have you verified that this doesn't break the existing usage of
>>> DOMAIN_ATTR_NESTING in drivers/vfio/vfio_iommu_type1.c?
>>
>> I didn't have ARM machine on my hand. But I contacted with Jean
>> Philippe, he confirmed no compiling issue. I didn't see any code
>> getting DOMAIN_ATTR_NESTING attr in current drivers/vfio/vfio_iommu_type1.c.
>> What I'm adding is to call iommu_domai_get_attr(, DOMAIN_ATTR_NESTIN)
>> and won't fail if the iommu_domai_get_attr() returns 0. This patch
>> returns an empty nesting info for DOMAIN_ATTR_NESTIN and return
>> value is 0 if no error. So I guess it won't fail nesting for ARM.
> 
> I confirm that this series doesn't break the current support for
> VFIO_IOMMU_TYPE1_NESTING with an SMMUv3. That said...
> 
> If the SMMU does not support stage-2 then there is a change in behavior
> (untested): after the domain is silently switched to stage-1 by the SMMU
> driver, VFIO will now query nesting info and obtain -ENODEV. Instead of
> succeding as before, the VFIO ioctl will now fail. I believe that's a fix
> rather than a regression, it should have been like this since the
> beginning. No known userspace has been using VFIO_IOMMU_TYPE1_NESTING so
> far, so I don't think it should be a concern.
But as Yi mentioned ealier, in the current vfio code there is no
DOMAIN_ATTR_NESTING query yet. In my SMMUV3 nested stage series, I added
such a query in vfio-pci.c to detect if I need to expose a fault region
but I already test both the returned value and the output arg. So to me
there is no issue with that change.
> 
> And if userspace queries the nesting properties using the new ABI
> introduced in this patchset, it will obtain an empty struct. I think
> that's acceptable, but it may be better to avoid adding the nesting cap if
> @format is 0?
agreed

Thanks

Eric
> 
> Thanks,
> Jean
> 
>>
>> @Eric, how about your opinion? your dual-stage vSMMU support may
>> also share the vfio_iommu_type1.c code.
>>
>> Regards,
>> Yi Liu
>>
>>> Will
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
