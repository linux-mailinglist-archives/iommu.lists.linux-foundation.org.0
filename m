Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B361F060E
	for <lists.iommu@lfdr.de>; Sat,  6 Jun 2020 12:15:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A9C388649;
	Sat,  6 Jun 2020 10:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3Wh2Rs7WxmV; Sat,  6 Jun 2020 10:15:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47F2A8863E;
	Sat,  6 Jun 2020 10:15:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C11FC016E;
	Sat,  6 Jun 2020 10:15:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76426C016E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 10:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D098860D5
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 10:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxOEl6_4iOHG for <iommu@lists.linux-foundation.org>;
 Sat,  6 Jun 2020 10:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A755E860D2
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 10:15:16 +0000 (UTC)
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id EEEDD7E626AAB48BA848;
 Sat,  6 Jun 2020 18:15:12 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.10]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Sat, 6 Jun 2020 18:15:06 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Philip Li <philip.li@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [kbuild-all] Re: [PATCH 1/3] dma-direct: provide the ability to
 reserve per-numa CMA
Thread-Topic: [kbuild-all] Re: [PATCH 1/3] dma-direct: provide the ability
 to reserve per-numa CMA
Thread-Index: AQHWOVDkjt//8Ixq2UKuAS4YcS/rw6jH0AqAgAG65oD//6sagIABO3aAgADxzcA=
Date: Sat, 6 Jun 2020 10:15:06 +0000
Message-ID: <B926444035E5E2439431908E3842AFD24E1541@DGGEMI525-MBS.china.huawei.com>
References: <20200603024231.61748-2-song.bao.hua@hisilicon.com>
 <20200604113631.GP30374@kadam>
 <B926444035E5E2439431908E3842AFD24E0011@DGGEMI525-MBS.china.huawei.com>
 <20200605085751.GQ30374@kadam> <20200606034655.GH2459@intel.com>
In-Reply-To: <20200606034655.GH2459@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.154]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Dan Carpenter <error27@gmail.com>, "lkp@intel.com" <lkp@intel.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "kbuild@lists.01.org" <kbuild@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



> -----Original Message-----
> From: Philip Li [mailto:philip.li@intel.com]
> Sent: Saturday, June 6, 2020 3:47 PM
> To: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>;
> kbuild@lists.01.org; hch@lst.de; m.szyprowski@samsung.com;
> robin.murphy@arm.com; catalin.marinas@arm.com; lkp@intel.com; Dan
> Carpenter <error27@gmail.com>; kbuild-all@lists.01.org;
> iommu@lists.linux-foundation.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Linuxarm <linuxarm@huawei.com>; Jonathan
> Cameron <jonathan.cameron@huawei.com>; John Garry
> <john.garry@huawei.com>
> Subject: Re: [kbuild-all] Re: [PATCH 1/3] dma-direct: provide the ability to
> reserve per-numa CMA
> 
> On Fri, Jun 05, 2020 at 11:57:51AM +0300, Dan Carpenter wrote:
> > On Fri, Jun 05, 2020 at 06:04:31AM +0000, Song Bao Hua (Barry Song)
> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > > > Sent: Thursday, June 4, 2020 11:37 PM
> > > > To: kbuild@lists.01.org; Song Bao Hua (Barry Song)
> > > > <song.bao.hua@hisilicon.com>; hch@lst.de;
> > > > m.szyprowski@samsung.com; robin.murphy@arm.com;
> > > > catalin.marinas@arm.com
> > > > Cc: lkp@intel.com; Dan Carpenter <error27@gmail.com>;
> > > > kbuild-all@lists.01.org; iommu@lists.linux-foundation.org;
> > > > linux-arm-kernel@lists.infradead.org;
> > > > linux-kernel@vger.kernel.org; Linuxarm <linuxarm@huawei.com>;
> > > > Jonathan Cameron <jonathan.cameron@huawei.com>; John Garry
> > > > <john.garry@huawei.com>
> > > > Subject: Re: [PATCH 1/3] dma-direct: provide the ability to
> > > > reserve per-numa CMA
> > > >
> > > > Hi Barry,
> > > >
> > > > url:
> > > > https://github.com/0day-ci/linux/commits/Barry-Song/support-per-nu
> > > > ma-CM
> > > > A-for-ARM-server/20200603-104821
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> > > > for-next/core
> > > > config: x86_64-randconfig-m001-20200603 (attached as .config)
> > > > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Dan, thanks! Good catch!
> > > as this patch has not been in mainline yet, is it correct to add these
> "reported-by" in patch v2?
> Hi Barry, we provides the suggestion here, but you may decide to add or not as
> appropriate for your situation. For the patch still under development, it is not
> that necessary to add i think.

Hi Philip, Dan,
Thanks for clarification.
> 
> >
> > These are just an automated email from the zero day bot.  I look over
> > the Smatch warnings and then forward them on.
> >
> > regards,
> > dan carpenter

Best regards
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
