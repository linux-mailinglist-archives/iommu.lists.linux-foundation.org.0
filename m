Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B512F66D8
	for <lists.iommu@lfdr.de>; Thu, 14 Jan 2021 18:09:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 976898739E;
	Thu, 14 Jan 2021 17:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSvPJxYrbEfj; Thu, 14 Jan 2021 17:09:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC22A873A4;
	Thu, 14 Jan 2021 17:09:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98C63C013A;
	Thu, 14 Jan 2021 17:09:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 680B4C013A
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 569B7855D8
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wa6vi5Hx2IHh for <iommu@lists.linux-foundation.org>;
 Thu, 14 Jan 2021 17:09:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D8D48462F
 for <iommu@lists.linux-foundation.org>; Thu, 14 Jan 2021 17:09:12 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DGrNq2mQkzR3Vn;
 Fri, 15 Jan 2021 01:08:11 +0800 (CST)
Received: from dggemi751-chm.china.huawei.com (10.1.198.137) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 15 Jan 2021 01:09:07 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggemi751-chm.china.huawei.com (10.1.198.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 15 Jan 2021 01:09:06 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.002; Thu, 14 Jan 2021 17:09:04 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>
Subject: RE: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
Thread-Topic: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
Thread-Index: AQHWvZ36CODK3kmCyk2T9hmchYhCqqniWTe/gANqCPCAAQgyAIAABi8QgAACSYCAQN3PgIAAAmvA
Date: Thu, 14 Jan 2021 17:09:04 +0000
Message-ID: <0bfab7bc762d4356bed81255749f94c3@huawei.com>
References: <20201118112151.25412-8-eric.auger@redhat.com>
 <1606829590-25924-1-git-send-email-wangxingang5@huawei.com>
 <2e69adf5-8207-64f7-fa8e-9f2bd3a3c4e3@redhat.com>
 <e10ad90dc5144c0d9df98a9a078091af@huawei.com>
 <20201204095338.GA1912466@myrica>
 <2de03a797517452cbfeab022e12612b7@huawei.com>
 <0bf50dd6-ef3c-7aba-cbc1-1c2e17088470@redhat.com>
 <d68b6269-ee99-9ed7-de30-867e4519d104@redhat.com>
In-Reply-To: <d68b6269-ee99-9ed7-de30-867e4519d104@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.83.240]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: 14 January 2021 16:58
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Xieyingtai <xieyingtai@huawei.com>; alex.williamson@redhat.com;
> wangxingang <wangxingang5@huawei.com>; kvm@vger.kernel.org;
> maz@kernel.org; linux-kernel@vger.kernel.org; vivek.gautam@arm.com;
> iommu@lists.linux-foundation.org; qubingbing <qubingbing@hisilicon.com>;
> Zengtao (B) <prime.zeng@hisilicon.com>; zhangfei.gao@linaro.org;
> eric.auger.pro@gmail.com; will@kernel.org; kvmarm@lists.cs.columbia.edu;
> robin.murphy@arm.com
> Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
> unmanaged ASIDs
> 
> Hi Shameer, Jean-Philippe,
> 
> On 12/4/20 11:23 AM, Auger Eric wrote:
> > Hi Shameer, Jean-Philippe,
> >
> > On 12/4/20 11:20 AM, Shameerali Kolothum Thodi wrote:
> >> Hi Jean,
> >>
> >>> -----Original Message-----
> >>> From: Jean-Philippe Brucker [mailto:jean-philippe@linaro.org]
> >>> Sent: 04 December 2020 09:54
> >>> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> >>> Cc: Auger Eric <eric.auger@redhat.com>; wangxingang
> >>> <wangxingang5@huawei.com>; Xieyingtai <xieyingtai@huawei.com>;
> >>> kvm@vger.kernel.org; maz@kernel.org; joro@8bytes.org;
> will@kernel.org;
> >>> iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
> >>> vivek.gautam@arm.com; alex.williamson@redhat.com;
> >>> zhangfei.gao@linaro.org; robin.murphy@arm.com;
> >>> kvmarm@lists.cs.columbia.edu; eric.auger.pro@gmail.com; Zengtao (B)
> >>> <prime.zeng@hisilicon.com>; qubingbing <qubingbing@hisilicon.com>
> >>> Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation
> with
> >>> unmanaged ASIDs
> >>>
> >>> Hi Shameer,
> >>>
> >>> On Thu, Dec 03, 2020 at 06:42:57PM +0000, Shameerali Kolothum Thodi
> wrote:
> >>>> Hi Jean/zhangfei,
> >>>> Is it possible to have a branch with minimum required SVA/UACCE related
> >>> patches
> >>>> that are already public and can be a "stable" candidate for future respin
> of
> >>> Eric's series?
> >>>> Please share your thoughts.
> >>>
> >>> By "stable" you mean a fixed branch with the latest SVA/UACCE patches
> >>> based on mainline?
> >>
> >> Yes.
> >>
> >>  The uacce-devel branches from
> >>> https://github.com/Linaro/linux-kernel-uadk do provide this at the moment
> >>> (they track the latest sva/zip-devel branch
> >>> https://jpbrucker.net/git/linux/ which is roughly based on mainline.)
> As I plan to respin shortly, please could you confirm the best branch to
> rebase on still is that one (uacce-devel from the linux-kernel-uadk git
> repo). Is it up to date? Commits seem to be quite old there.

I think it is the uacce-devel-5.11 branch, but will wait for Jean or Zhangfei
to confirm.

Thanks,
Shameer

> Thanks
> 
> Eric
> >>
> >> Thanks.
> >>
> >> Hi Eric,
> >>
> >> Could you please take a look at the above branches and see whether it make
> sense
> >> to rebase on top of either of those?
> >>
> >> From vSVA point of view, it will be less rebase hassle if we can do that.
> >
> > Sure. I will rebase on top of this ;-)
> >
> > Thanks
> >
> > Eric
> >>
> >> Thanks,
> >> Shameer
> >>
> >>> Thanks,
> >>> Jean
> >>
> >
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> >

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
