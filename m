Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DA2CEC1A
	for <lists.iommu@lfdr.de>; Fri,  4 Dec 2020 11:24:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0E5F20764;
	Fri,  4 Dec 2020 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ye3sFYYIeHam; Fri,  4 Dec 2020 10:24:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A49A920551;
	Fri,  4 Dec 2020 10:24:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 837ADC013B;
	Fri,  4 Dec 2020 10:24:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 463B5C013B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Dec 2020 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 33DBD87C4C
 for <iommu@lists.linux-foundation.org>; Fri,  4 Dec 2020 10:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajQxouEDtW6y for <iommu@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 10:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7017387C4B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Dec 2020 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607077457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2T15ek84GRYZBFIB7crwXKiwkKfTgxR0/uZEpJtiF7w=;
 b=Ydbx++idU/Z3ChVoXoEGyUgkbbUrU0cwbHSjSj7sAXch2B3R65RkucbTfv9AWoFgaZjA25
 6mbBqQ8Df7VcnhH/nh9rDS2q0FyKSr8uzZwZAHUi3u57pCjEyPnoBp4RBEbaOQuArBLyoC
 v6Zoi0f7AVYZQeGkTj0VIjPd/h57bm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-EHJ7jY99MrmUOFed-1HElg-1; Fri, 04 Dec 2020 05:24:13 -0500
X-MC-Unique: EHJ7jY99MrmUOFed-1HElg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4C8180A087;
 Fri,  4 Dec 2020 10:24:11 +0000 (UTC)
Received: from [10.36.112.89] (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59A2C620D7;
 Fri,  4 Dec 2020 10:23:59 +0000 (UTC)
Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20201118112151.25412-8-eric.auger@redhat.com>
 <1606829590-25924-1-git-send-email-wangxingang5@huawei.com>
 <2e69adf5-8207-64f7-fa8e-9f2bd3a3c4e3@redhat.com>
 <e10ad90dc5144c0d9df98a9a078091af@huawei.com>
 <20201204095338.GA1912466@myrica>
 <2de03a797517452cbfeab022e12612b7@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0bf50dd6-ef3c-7aba-cbc1-1c2e17088470@redhat.com>
Date: Fri, 4 Dec 2020 11:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2de03a797517452cbfeab022e12612b7@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Xieyingtai <xieyingtai@huawei.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 wangxingang <wangxingang5@huawei.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 qubingbing <qubingbing@hisilicon.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

Hi Shameer, Jean-Philippe,

On 12/4/20 11:20 AM, Shameerali Kolothum Thodi wrote:
> Hi Jean,
> 
>> -----Original Message-----
>> From: Jean-Philippe Brucker [mailto:jean-philippe@linaro.org]
>> Sent: 04 December 2020 09:54
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: Auger Eric <eric.auger@redhat.com>; wangxingang
>> <wangxingang5@huawei.com>; Xieyingtai <xieyingtai@huawei.com>;
>> kvm@vger.kernel.org; maz@kernel.org; joro@8bytes.org; will@kernel.org;
>> iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
>> vivek.gautam@arm.com; alex.williamson@redhat.com;
>> zhangfei.gao@linaro.org; robin.murphy@arm.com;
>> kvmarm@lists.cs.columbia.edu; eric.auger.pro@gmail.com; Zengtao (B)
>> <prime.zeng@hisilicon.com>; qubingbing <qubingbing@hisilicon.com>
>> Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
>> unmanaged ASIDs
>>
>> Hi Shameer,
>>
>> On Thu, Dec 03, 2020 at 06:42:57PM +0000, Shameerali Kolothum Thodi wrote:
>>> Hi Jean/zhangfei,
>>> Is it possible to have a branch with minimum required SVA/UACCE related
>> patches
>>> that are already public and can be a "stable" candidate for future respin of
>> Eric's series?
>>> Please share your thoughts.
>>
>> By "stable" you mean a fixed branch with the latest SVA/UACCE patches
>> based on mainline? 
> 
> Yes. 
> 
>  The uacce-devel branches from
>> https://github.com/Linaro/linux-kernel-uadk do provide this at the moment
>> (they track the latest sva/zip-devel branch
>> https://jpbrucker.net/git/linux/ which is roughly based on mainline.)
> 
> Thanks. 
> 
> Hi Eric,
> 
> Could you please take a look at the above branches and see whether it make sense
> to rebase on top of either of those?
> 
> From vSVA point of view, it will be less rebase hassle if we can do that.

Sure. I will rebase on top of this ;-)

Thanks

Eric
> 
> Thanks,
> Shameer
> 
>> Thanks,
>> Jean
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
