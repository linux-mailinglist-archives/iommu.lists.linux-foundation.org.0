Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F75338F1
	for <lists.iommu@lfdr.de>; Wed, 25 May 2022 10:59:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E78A841A0;
	Wed, 25 May 2022 08:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pC530S9c_nAr; Wed, 25 May 2022 08:59:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1E0841A7;
	Wed, 25 May 2022 08:59:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFA85C007E;
	Wed, 25 May 2022 08:59:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99595C002D
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 08:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7971F60BE2
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 08:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U89xjTu324E for <iommu@lists.linux-foundation.org>;
 Wed, 25 May 2022 08:59:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9AA760A8C
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 08:59:45 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L7Q496S71zDqSw;
 Wed, 25 May 2022 16:59:37 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 16:59:41 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 16:59:40 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2375.024; Wed, 25 May 2022 09:59:39 +0100
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>
Subject: RE: [PATCH v12 0/9] ACPI/IORT: Support for IORT RMR node
Thread-Topic: [PATCH v12 0/9] ACPI/IORT: Support for IORT RMR node
Thread-Index: AQHYXwu3gTgIMyz0zUiu6Dja1BmGsa0PbqaAgAhOLiD///4qAIAE064AgAYtdiCADLBS4A==
Date: Wed, 25 May 2022 08:59:39 +0000
Message-ID: <0c12f81f62f8415f8061cb844f779904@huawei.com>
References: <20220503163330.509-1-shameerali.kolothum.thodi@huawei.com>
 <2234ad60-c49f-8c72-616c-dfa5300354ef@huawei.com>
 <8e4f012717e34195a53cb73f8ce28627@huawei.com>
 <5c8ae673-f8e3-0ed3-e62d-d445913b012c@arm.com>
 <20220513094940.GA23371@lpieralisi> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.178]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jon@solid-run.com" <jon@solid-run.com>, Linuxarm <linuxarm@huawei.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 "will@kernel.org" <will@kernel.org>,
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
From: Shameerali Kolothum Thodi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



> -----Original Message-----
> From: Shameerali Kolothum Thodi
> Sent: 17 May 2022 08:18
> To: 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>; Robin Murphy
> <robin.murphy@arm.com>; rafael@kernel.org; joro@8bytes.org
> Cc: Guohanjun (Hanjun Guo) <guohanjun@huawei.com>;
> linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
> will@kernel.org; wanghuiqiang <wanghuiqiang@huawei.com>;
> steven.price@arm.com; Sami.Mujawar@arm.com; jon@solid-run.com;
> eric.auger@redhat.com; laurentiu.tudor@nxp.com; hch@infradead.org
> Subject: RE: [PATCH v12 0/9] ACPI/IORT: Support for IORT RMR node
> 
> 
> > -----Original Message-----
> > From: Lorenzo Pieralisi [mailto:lorenzo.pieralisi@arm.com]
> > Sent: 13 May 2022 10:50
> > To: Robin Murphy <robin.murphy@arm.com>; Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; rafael@kernel.org;
> > joro@8bytes.org
> > Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > Guohanjun (Hanjun Guo) <guohanjun@huawei.com>;
> > linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
> > iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
> > will@kernel.org; wanghuiqiang <wanghuiqiang@huawei.com>;
> > steven.price@arm.com; Sami.Mujawar@arm.com; jon@solid-run.com;
> > eric.auger@redhat.com; laurentiu.tudor@nxp.com; hch@infradead.org
> > Subject: Re: [PATCH v12 0/9] ACPI/IORT: Support for IORT RMR node
> >
> > [with Christoph's correct email address]
> >
> > On Tue, May 10, 2022 at 09:07:00AM +0100, Robin Murphy wrote:
> > > On 2022-05-10 08:23, Shameerali Kolothum Thodi wrote:
> > > > Hi Joerg/Robin,
> > > >
> > > > I think this series is now ready to be merged. Could you please let
> > > > me know if there is anything missing.
> > >
> > > Fine by me - these patches have had enough review and testing now that
> > > even if anything else did come up, I think it would be better done as
> > > follow-up work on the merged code.
> >
> > Given the ACPICA dependency I believe it is best for this series
> > to go via the ACPI tree, right ?
> >
> > I assume there are all the required ACKs for that to happen.
> 
> The SMMUv3/SMMU related changes (patches 6 - 9) still doesn't have
> explicit ACK from maintainers other than the go ahead above from Robin.
> 
> Just thought of highlighting it as not sure that will be an issue or not.
> 

All,

Just a gentle ping on this series again. Any chance this can make into 5.19?

Please consider.

Thanks,
Shameer

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
