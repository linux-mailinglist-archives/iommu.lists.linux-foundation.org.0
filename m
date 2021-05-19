Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A21388AA6
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 11:30:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A60F683C7F;
	Wed, 19 May 2021 09:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agAL1uK9S0b4; Wed, 19 May 2021 09:30:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0ACE84258;
	Wed, 19 May 2021 09:30:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83EA5C0001;
	Wed, 19 May 2021 09:30:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 770A5C0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 09:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7206384225
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 09:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2b-uvYAmW27 for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 09:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA9E83C63
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 09:30:24 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FlSDn5vZMzQpk8;
 Wed, 19 May 2021 17:26:49 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (7.185.36.93) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 17:30:18 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 17:30:17 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2176.012; Wed, 19 May 2021 10:30:15 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve
 RMR info
Thread-Topic: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve
 RMR info
Thread-Index: AQHXR/5vIFqlrwXwY0CsHMfFqGdLc6ro5LaAgACKY2A=
Date: Wed, 19 May 2021 09:30:14 +0000
Message-ID: <503068eb5f184639a75d7d1ef929b4c6@huawei.com>
References: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
 <20210513134550.2117-3-shameerali.kolothum.thodi@huawei.com>
 <YKN/ocoHvOdbH43j@8bytes.org>
In-Reply-To: <YKN/ocoHvOdbH43j@8bytes.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.88.84]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jon@solid-run.com" <jon@solid-run.com>, Linuxarm <linuxarm@huawei.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 yangyicong <yangyicong@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
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
> From: Joerg Roedel [mailto:joro@8bytes.org]
> Sent: 18 May 2021 09:50
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
> lorenzo.pieralisi@arm.com; robin.murphy@arm.com; wanghuiqiang
> <wanghuiqiang@huawei.com>; Guohanjun (Hanjun Guo)
> <guohanjun@huawei.com>; steven.price@arm.com; Sami.Mujawar@arm.com;
> jon@solid-run.com; eric.auger@redhat.com; yangyicong
> <yangyicong@huawei.com>
> Subject: Re: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve
> RMR info
> 
> On Thu, May 13, 2021 at 02:45:44PM +0100, Shameer Kolothum wrote:
> > +/**
> > + * struct iommu_rmr - Reserved Memory Region details per IOMMU
> > + * @list: Linked list pointers to hold RMR region info
> > + * @base_address: base address of Reserved Memory Region
> > + * @length: length of memory region
> > + * @sid: associated stream id
> > + * @flags: flags that apply to the RMR node
> > + */
> > +struct iommu_rmr {
> > +	struct list_head	list;
> > +	phys_addr_t		base_address;
> > +	u64			length;
> > +	u32			sid;
> > +	u32			flags;
> > +};
> > +
> > +/* RMR Remap permitted */
> > +#define IOMMU_RMR_REMAP_PERMITTED	(1 << 0)
> > +
> 
> This struct has lots of overlap with 'struct iommu_resv_region'. Any
> reason the existing struct can't be used here?
> 

Hmm..main reason is "sid". RMRs are associated with stream ids and
that is used to install bypass STEs/SMRs in SMMU drivers and also to check
whether a dev has any RMR regions associated with it.

I think we could add sid/dev_id to 'struct iommu_resv_region', and modify
iommu_alloc_resv_region() accordingly. That can get rid of the above struct
and iommu_dma_alloc_rmr() fn. Not sure this will complicate things as 
the dev_id is only valid for RMR reservation region cases. 

Please let me know your thoughts.

Thanks,
Shameer



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
