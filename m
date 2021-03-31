Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181335098F
	for <lists.iommu@lfdr.de>; Wed, 31 Mar 2021 23:35:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE09D405BF;
	Wed, 31 Mar 2021 21:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6z_jLGi_DLy; Wed, 31 Mar 2021 21:35:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA621405AC;
	Wed, 31 Mar 2021 21:35:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B209C0012;
	Wed, 31 Mar 2021 21:35:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFE3BC000A
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 21:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A090B60B86
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 21:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9Pqx9R3bVOf for <iommu@lists.linux-foundation.org>;
 Wed, 31 Mar 2021 21:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8753E60B82
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 21:35:00 +0000 (UTC)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F9fg66FHCz5kbM;
 Thu,  1 Apr 2021 05:32:50 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 1 Apr 2021 05:34:56 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggpeml500008.china.huawei.com (7.185.36.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 1 Apr 2021 05:34:55 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Thu, 1 Apr 2021 05:34:55 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: "fanghao (A)" <fanghao11@huawei.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>
Subject: RE: [PATCH] dma-mapping: benchmark: use the correct HiSilicon
 copyright
Thread-Topic: [PATCH] dma-mapping: benchmark: use the correct HiSilicon
 copyright
Thread-Index: AQHXJS8F+iJ+5bI0VEyNwDk2aU6XPKqenpRw
Date: Wed, 31 Mar 2021 21:34:55 +0000
Message-ID: <becc61ba065644c29da60e031ce88553@hisilicon.com>
References: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
In-Reply-To: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.26]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
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
> From: fanghao (A)
> Sent: Tuesday, March 30, 2021 7:34 PM
> To: hch@lst.de; m.szyprowski@samsung.com; robin.murphy@arm.com; Song Bao Hua
> (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: iommu@lists.linux-foundation.org; linuxarm@openeuler.org;
> linux-kselftest@vger.kernel.org; fanghao (A) <fanghao11@huawei.com>
> Subject: [PATCH] dma-mapping: benchmark: use the correct HiSilicon copyright
> 
> s/Hisilicon/HiSilicon/g.
> It should use capital S, according to
> https://www.hisilicon.com/en/terms-of-use.
> 

My bad. Thanks.

Acked-by: Barry Song <song.bao.hua@hisilicon.com>

> Signed-off-by: Hao Fang <fanghao11@huawei.com>
> ---
>  kernel/dma/map_benchmark.c                      | 2 +-
>  tools/testing/selftests/dma/dma_map_benchmark.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index e0e64f8..00d6549 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2020 Hisilicon Limited.
> + * Copyright (C) 2020 HiSilicon Limited.
>   */
> 
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> diff --git a/tools/testing/selftests/dma/dma_map_benchmark.c
> b/tools/testing/selftests/dma/dma_map_benchmark.c
> index fb23ce9..b492bed 100644
> --- a/tools/testing/selftests/dma/dma_map_benchmark.c
> +++ b/tools/testing/selftests/dma/dma_map_benchmark.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2020 Hisilicon Limited.
> + * Copyright (C) 2020 HiSilicon Limited.
>   */
> 
>  #include <fcntl.h>
> --
> 2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
