Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C50929ACB5
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 14:04:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFE0B20414;
	Tue, 27 Oct 2020 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0D3FSaZCSaPn; Tue, 27 Oct 2020 13:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C1E31204E4;
	Tue, 27 Oct 2020 13:04:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B12A6C0051;
	Tue, 27 Oct 2020 13:04:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C780DC0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B009A867D1
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOA3FsMY2LNl for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 13:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8D933860ED
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603803858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXXpUz3VnsL2Xy70mrZp5D4eUU9pHEsl4U/A+ZeUZVA=;
 b=esJ7PWQyeyfFmeTdZkzSB3sOlX8b8ME/b1704roI+wc5ZFPsdh79Uivt0lWEVew3Qeo5pn
 3fIW1C2ImGT7ZnF+SUN/tEhKtYkQuHDYhfPKyQrnvW7VZnBZGfmJZsFN7FvyNEUzkZnJc6
 ybreO9btDTiJvQdES+qVB3qC2ANOwew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-6ACk6zq5PEK2TZ_Z7S-pwA-1; Tue, 27 Oct 2020 09:04:15 -0400
X-MC-Unique: 6ACk6zq5PEK2TZ_Z7S-pwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D744FEC505;
 Tue, 27 Oct 2020 13:04:12 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3446F5B4A4;
 Tue, 27 Oct 2020 13:04:06 +0000 (UTC)
Subject: Re: [PATCH v10 01/11] vfio: VFIO_IOMMU_SET_PASID_TABLE
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
References: <20200320161911.27494-1-eric.auger@redhat.com>
 <20200320161911.27494-2-eric.auger@redhat.com>
 <2fba23af-9cd7-147d-6202-01c13fff92e5@huawei.com>
 <d3a302bb-34e8-762f-a11f-717b3bc83a2b@redhat.com>
 <cb5835e79b474e30af6702dbee0d46df@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cde28d6d-c6cf-ef23-b293-f9959aba0a18@redhat.com>
Date: Tue, 27 Oct 2020 14:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cb5835e79b474e30af6702dbee0d46df@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Hi Shameer,

On 10/27/20 1:20 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: iommu [mailto:iommu-bounces@lists.linux-foundation.org] On Behalf Of
>> Auger Eric
>> Sent: 23 September 2020 12:47
>> To: yuzenghui <yuzenghui@huawei.com>; eric.auger.pro@gmail.com;
>> iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
>> kvm@vger.kernel.org; kvmarm@lists.cs.columbia.edu; joro@8bytes.org;
>> alex.williamson@redhat.com; jacob.jun.pan@linux.intel.com;
>> yi.l.liu@intel.com; robin.murphy@arm.com
>> Subject: Re: [PATCH v10 01/11] vfio: VFIO_IOMMU_SET_PASID_TABLE
> 
> ...
> 
>>> Besides, before going through the whole series [1][2], I'd like to
>>> know if this is the latest version of your Nested-Stage-Setup work in
>>> case I had missed something.
>>>
>>> [1]
>>> https://lore.kernel.org/r/20200320161911.27494-1-eric.auger@redhat.com
>>> [2]
>>> https://lore.kernel.org/r/20200414150607.28488-1-eric.auger@redhat.com
>>
>> yes those 2 series are the last ones. Thank you for reviewing.
>>
>> FYI, I intend to respin within a week or 2 on top of Jacob's  [PATCH v10 0/7]
>> IOMMU user API enhancement. 
> 
> Thanks for that. Also is there any plan to respin the related Qemu series as well?
> I know dual stage interface proposals are still under discussion, but it would be
> nice to have a testable solution based on new interfaces for ARM64 as well.
> Happy to help with any tests or verifications.

Yes the QEMU series will be respinned as well. That's on the top of my
todo list right now.

Thanks

Eric
> 
> Please let me know.
> 
> Thanks,
> Shameer
>   
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
