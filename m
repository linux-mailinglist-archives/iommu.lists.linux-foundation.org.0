Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCC3D2B29
	for <lists.iommu@lfdr.de>; Thu, 22 Jul 2021 19:31:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EDE401DA;
	Thu, 22 Jul 2021 17:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCJ21TYCa-yt; Thu, 22 Jul 2021 17:31:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6AA0D405B2;
	Thu, 22 Jul 2021 17:31:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A5CBC000E;
	Thu, 22 Jul 2021 17:31:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB38CC000E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B506064B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbXMpBpWqp04 for <iommu@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 17:31:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C56B608D9
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:31:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B231106F;
 Thu, 22 Jul 2021 10:31:01 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18053F694;
 Thu, 22 Jul 2021 10:30:59 -0700 (PDT)
Subject: Re: [PATCH 17/23] iommu/vt-d: Prepare for multiple DMA domain types
To: kernel test robot <lkp@intel.com>, joro@8bytes.org, will@kernel.org
References: <11efdfa4ee223d12769d17459fcf789c626d7b82.1626888445.git.robin.murphy@arm.com>
 <202107230049.1VfUKZOX-lkp@intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <df1377fc-ac09-6f76-f224-1d58e94473c5@arm.com>
Date: Thu, 22 Jul 2021 18:30:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202107230049.1VfUKZOX-lkp@intel.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-07-22 17:44, kernel test robot wrote:
> Hi Robin,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on iommu/next]
> [also build test ERROR on rockchip/for-next linus/master v5.14-rc2 next-20210722]
> [cannot apply to sunxi/sunxi/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Robin-Murphy/iommu-Refactor-DMA-domain-strictness/20210722-022514
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/c05e0e1856b394eff1167c00f7bbd6ac7cc9dea6
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Robin-Murphy/iommu-Refactor-DMA-domain-strictness/20210722-022514
>          git checkout c05e0e1856b394eff1167c00f7bbd6ac7cc9dea6
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/ia64/include/asm/bug.h:17,
>                      from include/linux/bug.h:5,
>                      from include/linux/thread_info.h:13,
>                      from include/asm-generic/preempt.h:5,
>                      from ./arch/ia64/include/generated/asm/preempt.h:1,
>                      from include/linux/preempt.h:78,
>                      from include/linux/spinlock.h:51,
>                      from include/linux/wait.h:9,
>                      from include/linux/wait_bit.h:8,
>                      from include/linux/fs.h:6,
>                      from include/linux/debugfs.h:15,
>                      from drivers/iommu/intel/iommu.c:18:
>     drivers/iommu/intel/iommu.c: In function 'domain_get_iommu':
>>> drivers/iommu/intel/iommu.c:604:38: error: '__IOMMU_DOMAIN_DMA' undeclared (first use in this function); did you mean 'IOMMU_DOMAIN_DMA'?
>       604 |  if (WARN_ON(!(domain->domain.type & __IOMMU_DOMAIN_DMA)))
>           |                                      ^~~~~~~~~~~~~~~~~~
>     include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>       121 |  int __ret_warn_on = !!(condition);    \
>           |                         ^~~~~~~~~
>     drivers/iommu/intel/iommu.c:604:38: note: each undeclared identifier is reported only once for each function it appears in
>       604 |  if (WARN_ON(!(domain->domain.type & __IOMMU_DOMAIN_DMA)))
>           |                                      ^~~~~~~~~~~~~~~~~~
>     include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>       121 |  int __ret_warn_on = !!(condition);    \
>           |                         ^~~~~~~~~
> 
> 
> vim +604 drivers/iommu/intel/iommu.c
> 
>     597	
>     598	/* This functionin only returns single iommu in a domain */
>     599	struct intel_iommu *domain_get_iommu(struct dmar_domain *domain)
>     600	{
>     601		int iommu_id;
>     602	
>     603		/* si_domain and vm domain should not get here. */
>   > 604		if (WARN_ON(!(domain->domain.type & __IOMMU_DOMAIN_DMA)))

Bleh, of course that should be __IOMMU_DOMAIN_DMA_API like the other two 
instances. I'll fix this locally ready for v2.

Thanks,
Robin.

>     605			return NULL;
>     606	
>     607		for_each_domain_iommu(iommu_id, domain)
>     608			break;
>     609	
>     610		if (iommu_id < 0 || iommu_id >= g_num_of_iommus)
>     611			return NULL;
>     612	
>     613		return g_iommus[iommu_id];
>     614	}
>     615	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
