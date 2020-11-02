Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B522A2725
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 10:37:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2011868FE;
	Mon,  2 Nov 2020 09:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7f62DC7NBikz; Mon,  2 Nov 2020 09:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDA0B8695F;
	Mon,  2 Nov 2020 09:37:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C85E7C0051;
	Mon,  2 Nov 2020 09:37:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C358C0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 09:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 74D7887290
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 09:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wZmH5t4felR for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 09:37:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 74F3087160
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 09:37:38 +0000 (UTC)
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CPnrY6cpCzXhrW;
 Mon,  2 Nov 2020 17:37:33 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme706-chm.china.huawei.com (10.1.199.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 2 Nov 2020 17:37:33 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Mon, 2 Nov 2020 17:37:33 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: John Garry <john.garry@huawei.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "hch@lst.de" <hch@lst.de>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Subject: RE: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Topic: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Index: AQHWsO+tiT3rvc8AvUKektYgWKvLn6m0CmcAgACIo/A=
Date: Mon, 2 Nov 2020 09:37:33 +0000
Message-ID: <dc5be517e0ac4eaca50a5f8e3dc28170@hisilicon.com>
References: <20201102080646.2180-1-song.bao.hua@hisilicon.com>
 <20201102080646.2180-2-song.bao.hua@hisilicon.com>
 <184797b8-512e-e3da-fae7-25c7d662648b@huawei.com>
In-Reply-To: <184797b8-512e-e3da-fae7-25c7d662648b@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.65]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Will Deacon <will@kernel.org>
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
> From: John Garry
> Sent: Monday, November 2, 2020 10:19 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>;
> iommu@lists.linux-foundation.org; hch@lst.de; robin.murphy@arm.com;
> m.szyprowski@samsung.com
> Cc: linux-kselftest@vger.kernel.org; Shuah Khan <shuah@kernel.org>; Joerg
> Roedel <joro@8bytes.org>; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>; Will Deacon <will@kernel.org>
> Subject: Re: [PATCH v3 1/2] dma-mapping: add benchmark support for
> streaming DMA APIs
> 
> On 02/11/2020 08:06, Barry Song wrote:
> > Nowadays, there are increasing requirements to benchmark the performance
> > of dma_map and dma_unmap particually while the device is attached to an
> > IOMMU.
> >
> > This patch enables the support. Users can run specified number of threads
> > to do dma_map_page and dma_unmap_page on a specific NUMA node with
> the
> > specified duration. Then dma_map_benchmark will calculate the average
> > latency for map and unmap.
> >
> > A difficulity for this benchmark is that dma_map/unmap APIs must run on
> > a particular device. Each device might have different backend of IOMMU or
> > non-IOMMU.
> >
> > So we use the driver_override to bind dma_map_benchmark to a particual
> > device by:
> > For platform devices:
> > echo dma_map_benchmark > /sys/bus/platform/devices/xxx/driver_override
> > echo xxx > /sys/bus/platform/drivers/xxx/unbind
> > echo xxx > /sys/bus/platform/drivers/dma_map_benchmark/bind
> >
> > For PCI devices:
> > echo dma_map_benchmark >
> /sys/bus/pci/devices/0000:00:01.0/driver_override
> > echo 0000:00:01.0 > /sys/bus/pci/drivers/xxx/unbind
> > echo 0000:00:01.0 > /sys/bus/pci/drivers/dma_map_benchmark/bind
> >
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> > ---
> > -v3:
> >    * fix build issues reported by 0day kernel test robot
> > -v2:
> >    * add PCI support; v1 supported platform devices only
> >    * replace ssleep by msleep_interruptible() to permit users to exit
> >      benchmark before it is completed
> >    * many changes according to Robin's suggestions, thanks! Robin
> >      - add standard deviation output to reflect the worst case
> >      - check users' parameters strictly like the number of threads
> >      - make cache dirty before dma_map
> >      - fix unpaired dma_map_page and dma_unmap_single;
> >      - remove redundant "long long" before ktime_to_ns();
> >      - use devm_add_action()
> >
> >   kernel/dma/Kconfig         |   8 +
> >   kernel/dma/Makefile        |   1 +
> >   kernel/dma/map_benchmark.c | 296
> +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 305 insertions(+)
> >   create mode 100644 kernel/dma/map_benchmark.c
> >
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index c99de4a21458..949c53da5991 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -225,3 +225,11 @@ config DMA_API_DEBUG_SG
> >   	  is technically out-of-spec.
> >
> >   	  If unsure, say N.
> > +
> > +config DMA_MAP_BENCHMARK
> > +	bool "Enable benchmarking of streaming DMA mapping"
> > +	help
> > +	  Provides /sys/kernel/debug/dma_map_benchmark that helps with
> testing
> > +	  performance of dma_(un)map_page.
> 
> Since this is a driver, any reason for which it cannot be loadable? If
> so, it seems any functionality would depend on DEBUG FS, I figure that's
> just how we work for debugfs.

We depend on kthread_bind_mask which isn't an export_symbol.
Maybe worth to send a patch to export it?

> 
> Thanks,
> John
> 
> > +
> > +	  See tools/testing/selftests/dma/dma_map_benchmark.c
> > diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
> > index dc755ab68aab..7aa6b26b1348 100644
> > --- a/kernel/dma/Makefile
> > +++ b/kernel/dma/Makefile

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
