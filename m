Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51A2F6686
	for <lists.iommu@lfdr.de>; Thu, 14 Jan 2021 17:58:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A2942869B9;
	Thu, 14 Jan 2021 16:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AUfW92xDZT7; Thu, 14 Jan 2021 16:58:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E63E886985;
	Thu, 14 Jan 2021 16:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C81F7C013A;
	Thu, 14 Jan 2021 16:58:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33492C013A
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 16:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1A0E486BD9
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 16:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSLwbikKHyCZ for <iommu@lists.linux-foundation.org>;
 Thu, 14 Jan 2021 16:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 06EAC86BC7
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUsobyLQttNjQOv/bXY7/VpogIuR8SlRFnvnIc1/ovQ=;
 b=b8ZkIMZhbMh4ocPVa7zTnEpkQUUY/t5yqITdSXt6B8Ykf/Kl2gWMlHyzQWCQbl6A0lKrnr
 y9v7RSyU6/XHYgKX4A3qPYSMGJeUuMY+bltOWghOxWNQuQKeSxdZ0+dG/cyF8XVCwSQjnA
 Y+gXPgYz2/pTWogTea3JR8DyPEAFjtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-kDmtCxkbOTycjfoyiKu1nw-1; Thu, 14 Jan 2021 11:58:38 -0500
X-MC-Unique: kDmtCxkbOTycjfoyiKu1nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3FA69CC03;
 Thu, 14 Jan 2021 16:58:35 +0000 (UTC)
Received: from [10.36.114.165] (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4845D5D9E2;
 Thu, 14 Jan 2021 16:58:29 +0000 (UTC)
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
 <0bf50dd6-ef3c-7aba-cbc1-1c2e17088470@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d68b6269-ee99-9ed7-de30-867e4519d104@redhat.com>
Date: Thu, 14 Jan 2021 17:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0bf50dd6-ef3c-7aba-cbc1-1c2e17088470@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Xieyingtai <xieyingtai@huawei.com>, wangxingang <wangxingang5@huawei.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 qubingbing <qubingbing@hisilicon.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On 12/4/20 11:23 AM, Auger Eric wrote:
> Hi Shameer, Jean-Philippe,
> 
> On 12/4/20 11:20 AM, Shameerali Kolothum Thodi wrote:
>> Hi Jean,
>>
>>> -----Original Message-----
>>> From: Jean-Philippe Brucker [mailto:jean-philippe@linaro.org]
>>> Sent: 04 December 2020 09:54
>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>>> Cc: Auger Eric <eric.auger@redhat.com>; wangxingang
>>> <wangxingang5@huawei.com>; Xieyingtai <xieyingtai@huawei.com>;
>>> kvm@vger.kernel.org; maz@kernel.org; joro@8bytes.org; will@kernel.org;
>>> iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
>>> vivek.gautam@arm.com; alex.williamson@redhat.com;
>>> zhangfei.gao@linaro.org; robin.murphy@arm.com;
>>> kvmarm@lists.cs.columbia.edu; eric.auger.pro@gmail.com; Zengtao (B)
>>> <prime.zeng@hisilicon.com>; qubingbing <qubingbing@hisilicon.com>
>>> Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
>>> unmanaged ASIDs
>>>
>>> Hi Shameer,
>>>
>>> On Thu, Dec 03, 2020 at 06:42:57PM +0000, Shameerali Kolothum Thodi wrote:
>>>> Hi Jean/zhangfei,
>>>> Is it possible to have a branch with minimum required SVA/UACCE related
>>> patches
>>>> that are already public and can be a "stable" candidate for future respin of
>>> Eric's series?
>>>> Please share your thoughts.
>>>
>>> By "stable" you mean a fixed branch with the latest SVA/UACCE patches
>>> based on mainline? 
>>
>> Yes. 
>>
>>  The uacce-devel branches from
>>> https://github.com/Linaro/linux-kernel-uadk do provide this at the moment
>>> (they track the latest sva/zip-devel branch
>>> https://jpbrucker.net/git/linux/ which is roughly based on mainline.)
As I plan to respin shortly, please could you confirm the best branch to
rebase on still is that one (uacce-devel from the linux-kernel-uadk git
repo). Is it up to date? Commits seem to be quite old there.

Thanks

Eric
>>
>> Thanks. 
>>
>> Hi Eric,
>>
>> Could you please take a look at the above branches and see whether it make sense
>> to rebase on top of either of those?
>>
>> From vSVA point of view, it will be less rebase hassle if we can do that.
> 
> Sure. I will rebase on top of this ;-)
> 
> Thanks
> 
> Eric
>>
>> Thanks,
>> Shameer
>>
>>> Thanks,
>>> Jean
>>
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
