Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406A425233
	for <lists.iommu@lfdr.de>; Thu,  7 Oct 2021 13:43:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E96F403C0;
	Thu,  7 Oct 2021 11:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBEaSyG4MPLX; Thu,  7 Oct 2021 11:43:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 394C7403B8;
	Thu,  7 Oct 2021 11:43:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CEC0C001E;
	Thu,  7 Oct 2021 11:43:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 155F3C000D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 11:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF6A409DA
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 11:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0uFf7CkyehS for <iommu@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 11:43:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 863504097D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 11:43:24 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HQ8YT0PGdzWlbJ;
 Thu,  7 Oct 2021 19:41:49 +0800 (CST)
Received: from dggpemm100005.china.huawei.com (7.185.36.231) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 19:43:18 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100005.china.huawei.com (7.185.36.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 19:43:18 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.008;
 Thu, 7 Oct 2021 19:43:18 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "will@kernel.org" <will@kernel.org>, "joro@8bytes.org"
 <joro@8bytes.org>
Subject: RE: [PATCH v2 1/2] iommu/vt-d: convert the return type of
 first_pte_in_page to bool
Thread-Topic: [PATCH v2 1/2] iommu/vt-d: convert the return type of
 first_pte_in_page to bool
Thread-Index: AQHXufzwnJ0IkXVZ70aRussks8pnnKvGjCOAgADf3UA=
Date: Thu, 7 Oct 2021 11:43:18 +0000
Message-ID: <046cdaae8b204c3da442ec44fcc6c25d@huawei.com>
References: <20211005152308.1061-1-longpeng2@huawei.com>
 <20211005152308.1061-2-longpeng2@huawei.com>
 <62016e41-5d9d-2d42-e16f-59809f9f1f75@linux.intel.com>
In-Reply-To: <62016e41-5d9d-2d42-e16f-59809f9f1f75@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
> From: Lu Baolu [mailto:baolu.lu@linux.intel.com]
> Sent: Thursday, October 7, 2021 2:18 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>; dwmw2@infradead.org; will@kernel.org;
> joro@8bytes.org
> Cc: baolu.lu@linux.intel.com; iommu@lists.linux-foundation.org;
> linux-kernel@vger.kernel.org; Gonglei (Arei) <arei.gonglei@huawei.com>
> Subject: Re: [PATCH v2 1/2] iommu/vt-d: convert the return type of
> first_pte_in_page to bool
> 
> On 2021/10/5 23:23, Longpeng(Mike) wrote:
> > first_pte_in_page() returns boolean value, so let's convert its
> > return type to bool.
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >   include/linux/intel-iommu.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> > index 05a65eb..a590b00 100644
> > --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -708,7 +708,7 @@ static inline bool dma_pte_superpage(struct dma_pte *pte)
> >   	return (pte->val & DMA_PTE_LARGE_PAGE);
> >   }
> >
> > -static inline int first_pte_in_page(struct dma_pte *pte)
> > +static inline bool first_pte_in_page(struct dma_pte *pte)
> >   {
> >   	return !((unsigned long)pte & ~VTD_PAGE_MASK);
> >   }
> >
> 
> Probably,
> 
> 	return IS_ALIGNED((unsigned long)pte, VTD_PAGE_SIZE);
> 
> looks neater?
> 

Looks better! I'll include this optimization in v3.

> Best regards,
> baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
