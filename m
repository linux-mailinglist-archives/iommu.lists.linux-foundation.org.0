Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A69542AD0E1
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 09:10:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E8888707E;
	Tue, 10 Nov 2020 08:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9XZ9BjvBS4O; Tue, 10 Nov 2020 08:10:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C6A618707A;
	Tue, 10 Nov 2020 08:10:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABE2CC016F;
	Tue, 10 Nov 2020 08:10:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1E7CC016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C8C0685E40
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 08:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TGZm5Uft2Do for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 08:10:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 60DB884B23
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 08:10:45 +0000 (UTC)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CVgXH6tQjz52vB;
 Tue, 10 Nov 2020 16:10:23 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 10 Nov 2020 16:10:34 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Tue, 10 Nov 2020 16:10:34 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "hch@lst.de" <hch@lst.de>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Subject: RE: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Topic: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
 DMA APIs
Thread-Index: AQHWsO+tiT3rvc8AvUKektYgWKvLn6nBDT6Q
Date: Tue, 10 Nov 2020 08:10:34 +0000
Message-ID: <eb317e5050b944c3aec97c5fb64a74cb@hisilicon.com>
References: <20201102080646.2180-1-song.bao.hua@hisilicon.com>
 <20201102080646.2180-2-song.bao.hua@hisilicon.com>
In-Reply-To: <20201102080646.2180-2-song.bao.hua@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.206]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Linuxarm <linuxarm@huawei.com>,
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

Hello Robin, Christoph,
Any further comment? John suggested that "depends on DEBUG_FS" should be added in Kconfig.
I am collecting more comments to send v4 together with fixing this minor issue :-)

Thanks
Barry

> -----Original Message-----
> From: Song Bao Hua (Barry Song)
> Sent: Monday, November 2, 2020 9:07 PM
> To: iommu@lists.linux-foundation.org; hch@lst.de; robin.murphy@arm.com;
> m.szyprowski@samsung.com
> Cc: Linuxarm <linuxarm@huawei.com>; linux-kselftest@vger.kernel.org; xuwei
> (O) <xuwei5@huawei.com>; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; Joerg Roedel <joro@8bytes.org>; Will Deacon
> <will@kernel.org>; Shuah Khan <shuah@kernel.org>
> Subject: [PATCH v3 1/2] dma-mapping: add benchmark support for streaming
> DMA APIs
> 
> Nowadays, there are increasing requirements to benchmark the performance
> of dma_map and dma_unmap particually while the device is attached to an
> IOMMU.
> 
> This patch enables the support. Users can run specified number of threads to
> do dma_map_page and dma_unmap_page on a specific NUMA node with the
> specified duration. Then dma_map_benchmark will calculate the average
> latency for map and unmap.
> 
> A difficulity for this benchmark is that dma_map/unmap APIs must run on a
> particular device. Each device might have different backend of IOMMU or
> non-IOMMU.
> 
> So we use the driver_override to bind dma_map_benchmark to a particual
> device by:
> For platform devices:
> echo dma_map_benchmark > /sys/bus/platform/devices/xxx/driver_override
> echo xxx > /sys/bus/platform/drivers/xxx/unbind
> echo xxx > /sys/bus/platform/drivers/dma_map_benchmark/bind
> 
> For PCI devices:
> echo dma_map_benchmark >
> /sys/bus/pci/devices/0000:00:01.0/driver_override
> echo 0000:00:01.0 > /sys/bus/pci/drivers/xxx/unbind echo 0000:00:01.0 >
> /sys/bus/pci/drivers/dma_map_benchmark/bind
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
> -v3:
>   * fix build issues reported by 0day kernel test robot
> -v2:
>   * add PCI support; v1 supported platform devices only
>   * replace ssleep by msleep_interruptible() to permit users to exit
>     benchmark before it is completed
>   * many changes according to Robin's suggestions, thanks! Robin
>     - add standard deviation output to reflect the worst case
>     - check users' parameters strictly like the number of threads
>     - make cache dirty before dma_map
>     - fix unpaired dma_map_page and dma_unmap_single;
>     - remove redundant "long long" before ktime_to_ns();
>     - use devm_add_action()
> 
>  kernel/dma/Kconfig         |   8 +
>  kernel/dma/Makefile        |   1 +
>  kernel/dma/map_benchmark.c | 296
> +++++++++++++++++++++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 kernel/dma/map_benchmark.c
> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig index
> c99de4a21458..949c53da5991 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -225,3 +225,11 @@ config DMA_API_DEBUG_SG
>  	  is technically out-of-spec.
> 
>  	  If unsure, say N.
> +
> +config DMA_MAP_BENCHMARK
> +	bool "Enable benchmarking of streaming DMA mapping"
> +	help
> +	  Provides /sys/kernel/debug/dma_map_benchmark that helps with
> testing
> +	  performance of dma_(un)map_page.
> +
> +	  See tools/testing/selftests/dma/dma_map_benchmark.c
> diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile index
> dc755ab68aab..7aa6b26b1348 100644
> --- a/kernel/dma/Makefile
> +++ b/kernel/dma/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
>  obj-$(CONFIG_SWIOTLB)			+= swiotlb.o
>  obj-$(CONFIG_DMA_COHERENT_POOL)		+= pool.o
>  obj-$(CONFIG_DMA_REMAP)			+= remap.o
> +obj-$(CONFIG_DMA_MAP_BENCHMARK)		+= map_benchmark.o
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> new file mode 100644 index 000000000000..dc4e5ff48a2d
> --- /dev/null
> +++ b/kernel/dma/map_benchmark.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Hisilicon Limited.
> + */
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/timekeeping.h>
> +
> +#define DMA_MAP_BENCHMARK	_IOWR('d', 1, struct map_benchmark)
> +#define DMA_MAP_MAX_THREADS	1024
> +#define DMA_MAP_MAX_SECONDS	300
> +
> +struct map_benchmark {
> +	__u64 avg_map_100ns; /* average map latency in 100ns */
> +	__u64 map_stddev; /* standard deviation of map latency */
> +	__u64 avg_unmap_100ns; /* as above */
> +	__u64 unmap_stddev;
> +	__u32 threads; /* how many threads will do map/unmap in parallel */
> +	__u32 seconds; /* how long the test will last */
> +	int node; /* which numa node this benchmark will run on */
> +	__u64 expansion[10];	/* For future use */
> +};
> +
> +struct map_benchmark_data {
> +	struct map_benchmark bparam;
> +	struct device *dev;
> +	struct dentry  *debugfs;
> +	atomic64_t sum_map_100ns;
> +	atomic64_t sum_unmap_100ns;
> +	atomic64_t sum_square_map;
> +	atomic64_t sum_square_unmap;
> +	atomic64_t loops;
> +};
> +
> +static int map_benchmark_thread(void *data) {
> +	void *buf;
> +	dma_addr_t dma_addr;
> +	struct map_benchmark_data *map = data;
> +	int ret = 0;
> +
> +	buf = (void *)__get_free_page(GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	while (!kthread_should_stop())  {
> +		__u64 map_100ns, unmap_100ns, map_square, unmap_square;
> +		ktime_t map_stime, map_etime, unmap_stime, unmap_etime;
> +
> +		/*
> +		 * for a non-coherent device, if we don't stain them in the cache,
> +		 * this will give an underestimate of the real-world overhead of
> +		 * BIDIRECTIONAL or TO_DEVICE mappings
> +		 * 66 means evertything goes well! 66 is lucky.
> +		 */
> +		memset(buf, 0x66, PAGE_SIZE);
> +
> +		map_stime = ktime_get();
> +		dma_addr = dma_map_single(map->dev, buf, PAGE_SIZE,
> DMA_BIDIRECTIONAL);
> +		if (unlikely(dma_mapping_error(map->dev, dma_addr))) {
> +			pr_err("dma_map_single failed on %s\n",
> dev_name(map->dev));
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		map_etime = ktime_get();
> +
> +		unmap_stime = ktime_get();
> +		dma_unmap_single(map->dev, dma_addr, PAGE_SIZE,
> DMA_BIDIRECTIONAL);
> +		unmap_etime = ktime_get();
> +
> +		/* calculate sum and sum of squares */
> +		map_100ns = div64_ul(ktime_to_ns(ktime_sub(map_etime,
> map_stime)),  100);
> +		unmap_100ns = div64_ul(ktime_to_ns(ktime_sub(unmap_etime,
> unmap_stime)), 100);
> +		map_square = map_100ns * map_100ns;
> +		unmap_square = unmap_100ns * unmap_100ns;
> +
> +		atomic64_add(map_100ns, &map->sum_map_100ns);
> +		atomic64_add(unmap_100ns, &map->sum_unmap_100ns);
> +		atomic64_add(map_square, &map->sum_square_map);
> +		atomic64_add(unmap_square, &map->sum_square_unmap);
> +		atomic64_inc(&map->loops);
> +	}
> +
> +out:
> +	free_page((unsigned long)buf);
> +	return ret;
> +}
> +
> +static int do_map_benchmark(struct map_benchmark_data *map) {
> +	struct task_struct **tsk;
> +	int threads = map->bparam.threads;
> +	int node = map->bparam.node;
> +	const cpumask_t *cpu_mask = cpumask_of_node(node);
> +	__u64 loops;
> +	int ret = 0;
> +	int i;
> +
> +	tsk = kmalloc_array(threads, sizeof(tsk), GFP_KERNEL);
> +	if (!tsk)
> +		return -ENOMEM;
> +
> +	get_device(map->dev);
> +
> +	for (i = 0; i < threads; i++) {
> +		tsk[i] = kthread_create_on_node(map_benchmark_thread, map,
> +				map->bparam.node, "dma-map-benchmark/%d", i);
> +		if (IS_ERR(tsk[i])) {
> +			pr_err("create dma_map thread failed\n");
> +			ret = PTR_ERR(tsk[i]);
> +			goto out;
> +		}
> +
> +		if (node != NUMA_NO_NODE && node_online(node))
> +			kthread_bind_mask(tsk[i], cpu_mask);
> +	}
> +
> +	/* clear the old value in the previous benchmark */
> +	atomic64_set(&map->sum_map_100ns, 0);
> +	atomic64_set(&map->sum_unmap_100ns, 0);
> +	atomic64_set(&map->sum_square_map, 0);
> +	atomic64_set(&map->sum_square_unmap, 0);
> +	atomic64_set(&map->loops, 0);
> +
> +	for (i = 0; i < threads; i++)
> +		wake_up_process(tsk[i]);
> +
> +	msleep_interruptible(map->bparam.seconds * 1000);
> +
> +	/* wait for the completion of benchmark threads */
> +	for (i = 0; i < threads; i++) {
> +		ret = kthread_stop(tsk[i]);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	loops = atomic64_read(&map->loops);
> +	if (likely(loops > 0)) {
> +		__u64 map_variance, unmap_variance;
> +
> +		/* average latency */
> +		map->bparam.avg_map_100ns =
> div64_u64(atomic64_read(&map->sum_map_100ns), loops);
> +		map->bparam.avg_unmap_100ns =
> +div64_u64(atomic64_read(&map->sum_unmap_100ns), loops);
> +
> +		/* standard deviation of latency */
> +		map_variance =
> div64_u64(atomic64_read(&map->sum_square_map),  loops) -
> +			map->bparam.avg_map_100ns *
> map->bparam.avg_map_100ns;
> +		unmap_variance =
> div64_u64(atomic64_read(&map->sum_square_unmap), loops) -
> +			map->bparam.avg_unmap_100ns *
> map->bparam.avg_unmap_100ns;
> +		map->bparam.map_stddev = int_sqrt64(map_variance);
> +		map->bparam.unmap_stddev = int_sqrt64(unmap_variance);
> +	}
> +
> +out:
> +	put_device(map->dev);
> +	kfree(tsk);
> +	return ret;
> +}
> +
> +static long map_benchmark_ioctl(struct file *filep, unsigned int cmd,
> +		unsigned long arg)
> +{
> +	struct map_benchmark_data *map = filep->private_data;
> +	int ret;
> +
> +	if (copy_from_user(&map->bparam, (void __user *)arg,
> sizeof(map->bparam)))
> +		return -EFAULT;
> +
> +	switch (cmd) {
> +	case DMA_MAP_BENCHMARK:
> +		if (map->bparam.threads == 0 || map->bparam.threads >
> DMA_MAP_MAX_THREADS) {
> +			pr_err("invalid thread number\n");
> +			return -EINVAL;
> +		}
> +		if (map->bparam.seconds == 0 || map->bparam.seconds >
> DMA_MAP_MAX_SECONDS) {
> +			pr_err("invalid duration seconds\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = do_map_benchmark(map);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user((void __user *)arg, &map->bparam,
> sizeof(map->bparam)))
> +		return -EFAULT;
> +
> +	return ret;
> +}
> +
> +static const struct file_operations map_benchmark_fops = {
> +	.open = simple_open,
> +	.unlocked_ioctl = map_benchmark_ioctl, };
> +
> +static void map_benchmark_remove_debugfs(void *data) {
> +	struct map_benchmark_data *map = (struct map_benchmark_data *)data;
> +
> +	debugfs_remove(map->debugfs);
> +}
> +
> +static int __map_benchmark_probe(struct device *dev) {
> +	struct dentry *entry;
> +	struct map_benchmark_data *map;
> +	int ret;
> +
> +	map = devm_kzalloc(dev, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
> +	map->dev = dev;
> +
> +	ret = devm_add_action(dev, map_benchmark_remove_debugfs, map);
> +	if (ret) {
> +		pr_err("Can't add debugfs remove action\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * we only permit a device bound with this driver, 2nd probe
> +	 * will fail
> +	 */
> +	entry = debugfs_create_file("dma_map_benchmark", 0600, NULL, map,
> +			&map_benchmark_fops);
> +	if (IS_ERR(entry))
> +		return PTR_ERR(entry);
> +	map->debugfs = entry;
> +
> +	return 0;
> +}
> +
> +static int map_benchmark_platform_probe(struct platform_device *pdev) {
> +	return __map_benchmark_probe(&pdev->dev);
> +}
> +
> +static struct platform_driver map_benchmark_platform_driver = {
> +	.driver		= {
> +		.name	= "dma_map_benchmark",
> +	},
> +	.probe = map_benchmark_platform_probe, };
> +
> +static int map_benchmark_pci_probe(struct pci_dev *pdev, const struct
> +pci_device_id *id) {
> +	return __map_benchmark_probe(&pdev->dev);
> +}
> +
> +static struct pci_driver map_benchmark_pci_driver = {
> +	.name	= "dma_map_benchmark",
> +	.probe	= map_benchmark_pci_probe,
> +};
> +
> +static int __init map_benchmark_init(void) {
> +	int ret;
> +
> +	ret = pci_register_driver(&map_benchmark_pci_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&map_benchmark_platform_driver);
> +	if (ret) {
> +		pci_unregister_driver(&map_benchmark_pci_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit map_benchmark_cleanup(void) {
> +	platform_driver_unregister(&map_benchmark_platform_driver);
> +	pci_unregister_driver(&map_benchmark_pci_driver);
> +}
> +
> +module_init(map_benchmark_init);
> +module_exit(map_benchmark_cleanup);
> +
> +MODULE_AUTHOR("Barry Song <song.bao.hua@hisilicon.com>");
> +MODULE_DESCRIPTION("dma_map benchmark driver");
> MODULE_LICENSE("GPL");
> --
> 2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
