Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D252D35640C
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 08:35:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5446D60BD8;
	Wed,  7 Apr 2021 06:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlC_qR0m3nN1; Wed,  7 Apr 2021 06:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B1C60BD4;
	Wed,  7 Apr 2021 06:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 079B9C0012;
	Wed,  7 Apr 2021 06:35:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC1D9C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 06:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92FDB60BD4
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 06:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRVm9B2E6_pI for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 06:35:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C05D060BC7
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 06:35:49 +0000 (UTC)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FFZNP6mZ2zRZHy;
 Wed,  7 Apr 2021 14:33:41 +0800 (CST)
Received: from dggpemm100007.china.huawei.com (7.185.36.116) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 7 Apr 2021 14:35:41 +0800
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 14:35:41 +0800
Received: from dggpeml500016.china.huawei.com ([7.185.36.70]) by
 dggpeml500016.china.huawei.com ([7.185.36.70]) with mapi id 15.01.2106.013;
 Wed, 7 Apr 2021 14:35:41 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] iommu/vt-d: Force to flush iotlb before creating superpage
Thread-Topic: [PATCH] iommu/vt-d: Force to flush iotlb before creating
 superpage
Thread-Index: AQHXJsdJgAXY3vlVHUqi4t5f0DX/hKqgIfAAgAh+GPA=
Date: Wed, 7 Apr 2021 06:35:41 +0000
Message-ID: <611cb5849c9a497b8289004dddb71150@huawei.com>
References: <20210401071834.1639-1-longpeng2@huawei.com>
 <9c368419-6e45-6b27-0f34-26b581589fa7@linux.intel.com>
In-Reply-To: <9c368419-6e45-6b27-0f34-26b581589fa7@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.151.207]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Kevin Tian <kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>
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

Hi Baolu,

> -----Original Message-----
> From: Lu Baolu [mailto:baolu.lu@linux.intel.com]
> Sent: Friday, April 2, 2021 12:44 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>; iommu@lists.linux-foundation.org;
> linux-kernel@vger.kernel.org
> Cc: baolu.lu@linux.intel.com; David Woodhouse <dwmw2@infradead.org>; Nadav
> Amit <nadav.amit@gmail.com>; Alex Williamson <alex.williamson@redhat.com>;
> Kevin Tian <kevin.tian@intel.com>; Gonglei (Arei) <arei.gonglei@huawei.com>;
> stable@vger.kernel.org
> Subject: Re: [PATCH] iommu/vt-d: Force to flush iotlb before creating superpage
> 
> Hi Longpeng,
> 
> On 4/1/21 3:18 PM, Longpeng(Mike) wrote:
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index ee09323..cbcb434 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -2342,9 +2342,20 @@ static inline int hardware_largepage_caps(struct
> dmar_domain *domain,
> >   				 * removed to make room for superpage(s).
> >   				 * We're adding new large pages, so make sure
> >   				 * we don't remove their parent tables.
> > +				 *
> > +				 * We also need to flush the iotlb before creating
> > +				 * superpage to ensure it does not perserves any
> > +				 * obsolete info.
> >   				 */
> > -				dma_pte_free_pagetable(domain, iov_pfn, end_pfn,
> > -						       largepage_lvl + 1);
> > +				if (dma_pte_present(pte)) {
> 
> The dma_pte_free_pagetable() clears a batch of PTEs. So checking current PTE is
> insufficient. How about removing this check and always performing cache
> invalidation?
> 

Um...the PTE here may be present( e.g. 4K mapping --> superpage mapping ) or NOT-present ( e.g. create a totally new superpage mapping ), but we only need to call free_pagetable and flush_iotlb in the former case, right ?

> > +					int i;
> > +
> > +					dma_pte_free_pagetable(domain, iov_pfn, end_pfn,
> > +							       largepage_lvl + 1);
> > +					for_each_domain_iommu(i, domain)
> > +						iommu_flush_iotlb_psi(g_iommus[i], domain,
> > +								      iov_pfn, nr_pages, 0, 0);
> > +
> 
> Best regards,
> baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
