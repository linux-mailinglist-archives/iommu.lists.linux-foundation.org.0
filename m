Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE54257549
	for <lists.iommu@lfdr.de>; Mon, 31 Aug 2020 10:25:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D0C752076E;
	Mon, 31 Aug 2020 08:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z9DgtopULrM; Mon, 31 Aug 2020 08:25:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D403F20791;
	Mon, 31 Aug 2020 08:25:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7827C0051;
	Mon, 31 Aug 2020 08:25:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 270A4C0051
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 21CFA20780
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jk28TYHmGueq for <iommu@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:25:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by silver.osuosl.org (Postfix) with ESMTPS id 4E9192076E
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:25:03 +0000 (UTC)
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id ADA9A5D06E1A34BB50C0;
 Mon, 31 Aug 2020 16:24:57 +0800 (CST)
Received: from dggema723-chm.china.huawei.com (10.3.20.87) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 31 Aug 2020 16:23:54 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggema723-chm.china.huawei.com (10.3.20.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 31 Aug 2020 16:23:54 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Mon, 31 Aug 2020 16:23:55 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v6 0/2] make dma_alloc_coherent NUMA-aware by per-NUMA CMA
Thread-Topic: [PATCH v6 0/2] make dma_alloc_coherent NUMA-aware by per-NUMA CMA
Thread-Index: AQHWd2Lc8c1DGcwANEy/0S0zVDdod6lBkR4AgBBdgfA=
Date: Mon, 31 Aug 2020 08:23:55 +0000
Message-ID: <05dad074e0624367a3fc0dfd0b96a352@hisilicon.com>
References: <20200821022615.28596-1-song.bao.hua@hisilicon.com>
 <20200821061918.GA28559@lst.de>
In-Reply-To: <20200821061918.GA28559@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.153]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 huangdaode <huangdaode@huawei.com>, "will@kernel.org" <will@kernel.org>,
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
> From: linux-kernel-owner@vger.kernel.org
> [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Christoph Hellwig
> Sent: Friday, August 21, 2020 6:19 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: hch@lst.de; m.szyprowski@samsung.com; robin.murphy@arm.com;
> will@kernel.org; ganapatrao.kulkarni@cavium.com;
> catalin.marinas@arm.com; iommu@lists.linux-foundation.org; Linuxarm
> <linuxarm@huawei.com>; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; huangdaode <huangdaode@huawei.com>
> Subject: Re: [PATCH v6 0/2] make dma_alloc_coherent NUMA-aware by
> per-NUMA CMA
> 
> FYI, as of the last one I'm fine now, bit I really need an ACK from
> the arm64 maintainers.

Hi Christoph,

For the changes in arch/arm64, Will gave his ack here:
https://lore.kernel.org/linux-iommu/20200821090116.GB20255@willie-the-truck/

and the patchset has been refined to v8
https://lore.kernel.org/linux-iommu/20200823230309.28980-1-song.bao.hua@hisilicon.com/
with one additional patch to remove magic number:
[PATCH v8 3/3] mm: cma: use CMA_MAX_NAME to define the length of cma name array
https://lore.kernel.org/linux-iommu/20200823230309.28980-4-song.bao.hua@hisilicon.com/

Hopefully, you didn't miss it:-)
Does the new one need an Ack from Linux-mm maintainer?

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
