Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77B2C478B
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 19:26:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53A888762A;
	Wed, 25 Nov 2020 18:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSl6jOrpWtts; Wed, 25 Nov 2020 18:26:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A254F87637;
	Wed, 25 Nov 2020 18:26:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF9DC0052;
	Wed, 25 Nov 2020 18:26:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E525C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3BAAC8762A
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wL7q72PSZF1b for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:26:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3AC6A8761D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:26:22 +0000 (UTC)
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ch8TL3bT5z13Km3;
 Thu, 26 Nov 2020 02:25:42 +0800 (CST)
Received: from dggemi712-chm.china.huawei.com (10.3.20.111) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 26 Nov 2020 02:26:18 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi712-chm.china.huawei.com (10.3.20.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 26 Nov 2020 02:26:18 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Thu, 26 Nov 2020 02:26:18 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Colin King <colin.king@canonical.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
Thread-Topic: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
Thread-Index: AQHWwzSKuP+v8ZWLE0uVaZXx9A8u4anZKOwQ
Date: Wed, 25 Nov 2020 18:26:18 +0000
Message-ID: <a6c5e5ed9a66485da301c1e91b56ccc7@hisilicon.com>
References: <20201125140523.1880669-1-colin.king@canonical.com>
In-Reply-To: <20201125140523.1880669-1-colin.king@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.201]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
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
> From: Colin King [mailto:colin.king@canonical.com]
> Sent: Thursday, November 26, 2020 3:05 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; Christoph
> Hellwig <hch@lst.de>; Marek Szyprowski <m.szyprowski@samsung.com>;
> Robin Murphy <robin.murphy@arm.com>; iommu@lists.linux-foundation.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(tsk) is not correct, it should
> be sizeof(*tsk). Fix it.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: bfd2defed94d ("dma-mapping: add benchmark support for streaming
> DMA APIs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/dma/map_benchmark.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index e1e37603d01b..b1496e744c68 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -121,7 +121,7 @@ static int do_map_benchmark(struct
> map_benchmark_data *map)
>  	int ret = 0;
>  	int i;
> 
> -	tsk = kmalloc_array(threads, sizeof(tsk), GFP_KERNEL);
> +	tsk = kmalloc_array(threads, sizeof(*tsk), GFP_KERNEL);

The size is same. But the change is correct.
Acked-by: Barry Song <song.bao.hua@hisilicon.com>

>  	if (!tsk)
>  		return -ENOMEM;
> 
Thanks
Barry


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
