Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 94323346F85
	for <lists.iommu@lfdr.de>; Wed, 24 Mar 2021 03:30:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201B4400D3;
	Wed, 24 Mar 2021 02:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSBItOmf3Et4; Wed, 24 Mar 2021 02:30:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id D20F640414;
	Wed, 24 Mar 2021 02:30:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4AA0C0012;
	Wed, 24 Mar 2021 02:30:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB225C000A
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A6E40612
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ychZF2U-5Uup for <iommu@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 02:30:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC3A440611
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:30:20 +0000 (UTC)
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F4sbr3XZzzRTSr;
 Wed, 24 Mar 2021 10:28:24 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 24 Mar 2021 10:30:14 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 24 Mar 2021 10:30:13 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: "tiantao (H)" <tiantao6@hisilicon.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "peterz@infradead.org" <peterz@infradead.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>, "ast@kernel.org" <ast@kernel.org>, 
 "tglx@linutronix.de" <tglx@linutronix.de>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "hch@lst.de" <hch@lst.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Subject: RE: [PATCH] dma-mapping: make map_benchmark compile into module
Thread-Topic: [PATCH] dma-mapping: make map_benchmark compile into module
Thread-Index: AQHXIFPOFGbiIAxEO0+6jc+KbhZliqqSZ4OA
Date: Wed, 24 Mar 2021 02:30:13 +0000
Message-ID: <970499782ce34f8985beb2145504c941@hisilicon.com>
References: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.12]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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
> From: tiantao (H)
> Sent: Wednesday, March 24, 2021 3:18 PM
> To: akpm@linux-foundation.org; peterz@infradead.org; paulmck@kernel.org;
> ast@kernel.org; tglx@linutronix.de; rostedt@goodmis.org; hch@lst.de;
> m.szyprowski@samsung.com; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>
> Cc: iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org; tiantao
> (H) <tiantao6@hisilicon.com>
> Subject: [PATCH] dma-mapping: make map_benchmark compile into module
> 
> under some scenarios, it is necessary to compile map_benchmark
> into module to test iommu, so this patch changed Kconfig and
> export_symbol to implement map_benchmark compiled into module.
> 
> On the other hand, map_benchmark is a driver, which is supposed
> to be able to run as a module.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---

Acked-by: Barry Song <song.bao.hua@hisilicon.com>

Look sensible to me. I like the idea that map_benchmark is
a driver. It seems unreasonable to always require built-in.


>  kernel/dma/Kconfig | 2 +-
>  kernel/kthread.c   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 77b4055..0468293 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -223,7 +223,7 @@ config DMA_API_DEBUG_SG
>  	  If unsure, say N.
> 
>  config DMA_MAP_BENCHMARK
> -	bool "Enable benchmarking of streaming DMA mapping"
> +	tristate "Enable benchmarking of streaming DMA mapping"
>  	depends on DEBUG_FS
>  	help
>  	  Provides /sys/kernel/debug/dma_map_benchmark that helps with testing
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 1578973..fa4736f 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -455,6 +455,7 @@ void kthread_bind_mask(struct task_struct *p, const struct
> cpumask *mask)
>  {
>  	__kthread_bind_mask(p, mask, TASK_UNINTERRUPTIBLE);
>  }
> +EXPORT_SYMBOL(kthread_bind_mask);
> 
>  /**
>   * kthread_bind - bind a just-created kthread to a cpu.
> --
> 2.7.4

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
