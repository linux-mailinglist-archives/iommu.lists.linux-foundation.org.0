Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE92AE5D9
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 02:30:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EBDCA86BFF;
	Wed, 11 Nov 2020 01:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUEPRESUAlbJ; Wed, 11 Nov 2020 01:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26B1C86BEA;
	Wed, 11 Nov 2020 01:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C87EC016F;
	Wed, 11 Nov 2020 01:30:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9278C016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 01:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A7FB186BAB
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 01:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JAH0QSUbMg5 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 01:30:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A92D85540
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 01:29:12 +0000 (UTC)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CW6ZW6CSbzVmnF;
 Wed, 11 Nov 2020 09:28:51 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 11 Nov 2020 09:29:08 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Wed, 11 Nov 2020 09:29:08 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: John Garry <john.garry@huawei.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "hch@lst.de" <hch@lst.de>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Subject: RE: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Topic: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Index: AQHWsO+tiT3rvc8AvUKektYgWKvLn6nBDT6Q//+EgQCAAZyYMA==
Date: Wed, 11 Nov 2020 01:29:08 +0000
Message-ID: <88e91063b7f041bda7d147438f1c4621@hisilicon.com>
References: <20201102080646.2180-1-song.bao.hua@hisilicon.com>
 <20201102080646.2180-2-song.bao.hua@hisilicon.com>
 <eb317e5050b944c3aec97c5fb64a74cb@hisilicon.com>
 <0658ee16-d539-61c5-1d39-77d50f559803@huawei.com>
In-Reply-To: <0658ee16-d539-61c5-1d39-77d50f559803@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.81]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Will
 Deacon <will@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Shuah Khan <shuah@kernel.org>
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
> Sent: Tuesday, November 10, 2020 9:39 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>;
> iommu@lists.linux-foundation.org; hch@lst.de; robin.murphy@arm.com;
> m.szyprowski@samsung.com
> Cc: linux-kselftest@vger.kernel.org; Will Deacon <will@kernel.org>; Joerg
> Roedel <joro@8bytes.org>; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>; Shuah Khan <shuah@kernel.org>
> Subject: Re: [PATCH v3 1/2] dma-mapping: add benchmark support for
> streaming DMA APIs
> 
> On 10/11/2020 08:10, Song Bao Hua (Barry Song) wrote:
> > Hello Robin, Christoph,
> > Any further comment? John suggested that "depends on DEBUG_FS" should
> be added in Kconfig.
> > I am collecting more comments to send v4 together with fixing this minor
> issue :-)
> >
> > Thanks
> > Barry
> >
> >> -----Original Message-----
> >> From: Song Bao Hua (Barry Song)
> >> Sent: Monday, November 2, 2020 9:07 PM
> >> To: iommu@lists.linux-foundation.org; hch@lst.de;
> robin.murphy@arm.com;
> >> m.szyprowski@samsung.com
> >> Cc: Linuxarm <linuxarm@huawei.com>; linux-kselftest@vger.kernel.org;
> xuwei
> >> (O) <xuwei5@huawei.com>; Song Bao Hua (Barry Song)
> >> <song.bao.hua@hisilicon.com>; Joerg Roedel <joro@8bytes.org>; Will
> Deacon
> >> <will@kernel.org>; Shuah Khan <shuah@kernel.org>
> >> Subject: [PATCH v3 1/2] dma-mapping: add benchmark support for
> streaming
> >> DMA APIs
> >>
> >> Nowadays, there are increasing requirements to benchmark the
> performance
> >> of dma_map and dma_unmap particually while the device is attached to an
> >> IOMMU.
> >>
> >> This patch enables the support. Users can run specified number of threads
> to
> >> do dma_map_page and dma_unmap_page on a specific NUMA node with
> the
> >> specified duration. Then dma_map_benchmark will calculate the average
> >> latency for map and unmap.
> >>
> >> A difficulity for this benchmark is that dma_map/unmap APIs must run on a
> >> particular device. Each device might have different backend of IOMMU or
> >> non-IOMMU.
> >>
> >> So we use the driver_override to bind dma_map_benchmark to a particual
> >> device by:
> >> For platform devices:
> >> echo dma_map_benchmark >
> /sys/bus/platform/devices/xxx/driver_override
> >> echo xxx > /sys/bus/platform/drivers/xxx/unbind
> >> echo xxx > /sys/bus/platform/drivers/dma_map_benchmark/bind
> >>
> 
> Hi Barry,
> 
> >> For PCI devices:
> >> echo dma_map_benchmark >
> >> /sys/bus/pci/devices/0000:00:01.0/driver_override
> >> echo 0000:00:01.0 > /sys/bus/pci/drivers/xxx/unbind echo 0000:00:01.0 >
> >> /sys/bus/pci/drivers/dma_map_benchmark/bind
> 
> Do we need to check if the device to which we attach actually has DMA
> mapping capability?

Hello John,

I'd like to think checking this here would be overdesign. We just give users the
freedom to bind any device they care about to the benchmark driver. Usually
that means a real hardware either behind an IOMMU or through a direct
mapping.

if for any reason users put a wrong "device", that is the choice of users. Anyhow,
the below code will still handle it properly and users will get a report in which
everything is zero.

+static int map_benchmark_thread(void *data)
+{
...
+		dma_addr = dma_map_single(map->dev, buf, PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (unlikely(dma_mapping_error(map->dev, dma_addr))) {
+			pr_err("dma_map_single failed on %s\n", dev_name(map->dev));
+			ret = -ENOMEM;
+			goto out;
+		}
...
+}

> 
> >>
> >> Cc: Joerg Roedel <joro@8bytes.org>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: Shuah Khan <shuah@kernel.org>
> >> Cc: Christoph Hellwig <hch@lst.de>
> >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Cc: Robin Murphy <robin.murphy@arm.com>
> >> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> >> ---
> 
> Thanks,
> John

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
