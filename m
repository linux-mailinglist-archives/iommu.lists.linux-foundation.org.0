Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2620C72B
	for <lists.iommu@lfdr.de>; Sun, 28 Jun 2020 10:59:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3517B860BF;
	Sun, 28 Jun 2020 08:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vhk8QNIazhG; Sun, 28 Jun 2020 08:59:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23A83860BE;
	Sun, 28 Jun 2020 08:59:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 065A8C08A6;
	Sun, 28 Jun 2020 08:59:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4538BC016E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 08:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 22875860BE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 08:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyaKwCIgoOEh for <iommu@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 08:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D6F686072
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 08:59:10 +0000 (UTC)
IronPort-SDR: wSj55IEWpMGKS2cntV4MS5ZHLTcqzsxC9SQALuHOsNOPFAALfY9tVHZ0LBWeHDkVegOTvamqgB
 EZ2FQXdcLFkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="147355245"
X-IronPort-AV: E=Sophos;i="5.75,291,1589266800"; 
 d="gz'50?scan'50,208,50";a="147355245"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2020 01:59:09 -0700
IronPort-SDR: tO37AGHL/RQORghm2gMUZePhm6SpX5hkyMqdmTvFnUIbf6PyGL91rOiGLfKP6EbtTBvxELUAKt
 4xlf6HK6zoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,291,1589266800"; 
 d="gz'50?scan'50,208,50";a="311792713"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by orsmga008.jf.intel.com with ESMTP; 28 Jun 2020 01:59:06 -0700
Date: Sun, 28 Jun 2020 16:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <song.bao.hua@hisilicon.com>, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org,
 ganapatrao.kulkarni@cavium.com, catalin.marinas@arm.com
Subject: Re: [PATCH v2 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Message-ID: <20200628085840.GY5535@shao2-debian>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="m0OTIrBz/ErRqy1N"
Content-Disposition: inline
In-Reply-To: <20200625074330.13668-2-song.bao.hua@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, kbuild-all@lists.01.org,
 linuxarm@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--m0OTIrBz/ErRqy1N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Barry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.8-rc2 next-20200625]
[cannot apply to arm64/for-next/core hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Barry-Song/make-dma_alloc_coherent-NUMA-aware-by-per-NUMA-CMA/20200625-154656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 8be3a53e18e0e1a98f288f6c7f5e9da3adbe9c49
config: x86_64-randconfig-s022-20200624 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 ARCH=x86_64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/dma/contiguous.c:283:50: sparse: sparse: invalid access below 'dma_contiguous_pernuma_area' (-8 8)

# https://github.com/0day-ci/linux/commit/d6930169a3364418b985c2d19c31ecf1c4c3d4a9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout d6930169a3364418b985c2d19c31ecf1c4c3d4a9
vim +/dma_contiguous_pernuma_area +283 kernel/dma/contiguous.c

de9e14eebf33a6 drivers/base/dma-contiguous.c Marek Szyprowski  2014-10-13  253  
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  254  /**
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  255   * dma_alloc_contiguous() - allocate contiguous pages
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  256   * @dev:   Pointer to device for which the allocation is performed.
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  257   * @size:  Requested allocation size.
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  258   * @gfp:   Allocation flags.
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  259   *
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  260   * This function allocates contiguous memory buffer for specified device. It
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  261   * tries to use device specific contiguous memory area if available, or it
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  262   * tries to use per-numa cma, if the allocation fails, it will fallback to
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  263   * try default global one.
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  264   *
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  265   * Note that it bypass one-page size of allocations from the per-numa and
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  266   * global area as the addresses within one page are always contiguous, so
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  267   * there is no need to waste CMA pages for that kind; it also helps reduce
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  268   * fragmentations.
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  269   */
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  270  struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  271  {
90ae409f9eb3bc kernel/dma/contiguous.c       Christoph Hellwig 2019-08-20  272  	size_t count = size >> PAGE_SHIFT;
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  273  	struct page *page = NULL;
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  274  	struct cma *cma = NULL;
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  275  	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  276  	bool alloc_from_pernuma = false;
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  277  
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  278  	if (dev && dev->cma_area)
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  279  		cma = dev->cma_area;
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  280  	else if ((nid != NUMA_NO_NODE) && dma_contiguous_pernuma_area[nid]
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  281  		&& !(gfp & (GFP_DMA | GFP_DMA32))
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  282  		&& (count > 1)) {
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25 @283  		cma = dma_contiguous_pernuma_area[nid];
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  284  		alloc_from_pernuma = true;
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  285  	} else if (count > 1)
bd2e75633c8012 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  286  		cma = dma_contiguous_default_area;
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  287  
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  288  	/* CMA can be used only in the context which permits sleeping */
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  289  	if (cma && gfpflags_allow_blocking(gfp)) {
90ae409f9eb3bc kernel/dma/contiguous.c       Christoph Hellwig 2019-08-20  290  		size_t align = get_order(size);
c6622a425acd1d kernel/dma/contiguous.c       Nicolin Chen      2019-07-26  291  		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
c6622a425acd1d kernel/dma/contiguous.c       Nicolin Chen      2019-07-26  292  
c6622a425acd1d kernel/dma/contiguous.c       Nicolin Chen      2019-07-26  293  		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  294  
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  295  		/* fall back to default cma if failed in per-numa cma */
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  296  		if (!page && alloc_from_pernuma)
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  297  			page = cma_alloc(dma_contiguous_default_area, count,
d6930169a33644 kernel/dma/contiguous.c       Barry Song        2020-06-25  298  				cma_align, gfp & __GFP_NOWARN);
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  299  	}
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  300  
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  301  	return page;
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  302  }
b1d2dc009dece4 kernel/dma/contiguous.c       Nicolin Chen      2019-05-23  303  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--m0OTIrBz/ErRqy1N
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--m0OTIrBz/ErRqy1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

--m0OTIrBz/ErRqy1N
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--m0OTIrBz/ErRqy1N--
