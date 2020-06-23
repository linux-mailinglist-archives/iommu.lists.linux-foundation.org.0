Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF0204DDB
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 11:22:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4E2486DCC;
	Tue, 23 Jun 2020 09:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjLzptlCzkvv; Tue, 23 Jun 2020 09:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B375686D42;
	Tue, 23 Jun 2020 09:22:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95AACC016F;
	Tue, 23 Jun 2020 09:22:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C774DC016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 09:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6A6189285
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 09:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UdW-bF8m5Hi for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 09:22:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F1788923C
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 09:22:44 +0000 (UTC)
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 06EDE80076BFC7DAFC81;
 Tue, 23 Jun 2020 10:22:42 +0100 (IST)
Received: from [127.0.0.1] (10.47.2.88) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 23 Jun
 2020 10:22:40 +0100
Subject: Re: [PATCH 4/4] iommu/arm-smmu-v3: Remove cmpxchg() in
 arm_smmu_cmdq_issue_cmdlist()
To: kernel test robot <lkp@intel.com>, "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, <rikard.falkeborn@gmail.com>
References: <1592846920-45338-5-git-send-email-john.garry@huawei.com>
 <202006230905.3HpPgtSC%lkp@intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <5ba2e240-b324-d316-c00c-38c03ee49baa@huawei.com>
Date: Tue, 23 Jun 2020 10:21:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <202006230905.3HpPgtSC%lkp@intel.com>
Content-Language: en-US
X-Originating-IP: [10.47.2.88]
X-ClientProxiedBy: lhreml730-chm.china.huawei.com (10.201.108.81) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: "trivial@kernel.org" <trivial@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 23/06/2020 02:07, kernel test robot wrote:

+ Rikard, as the GENMASK compile-time sanity checks were added recently

> Hi John,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on iommu/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/John-Garry/iommu-arm-smmu-v3-Improve-cmdq-lock-efficiency/20200623-013438
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
> config: arm64-randconfig-c024-20200622 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from include/linux/bits.h:23,
> from include/linux/ioport.h:15,
> from include/linux/acpi.h:12,
> from drivers/iommu/arm-smmu-v3.c:12:
> drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_cmdq_issue_cmdlist':
> include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> 26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))

I'd say that GENMASK_INPUT_CHECK() should be able to handle a l=0 and 
h=unsigned value, so I doubt this warn.

Using GENMASK((int)cmdq->q.llq.max_n_shift, 0) resolves it, but it looks 
like GENMASK_INPUT_CHECK() could be improved.

> |                            ^
> include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
> 16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
> |                                                              ^
> include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
> 39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> |   ^~~~~~~~~~~~~~~~~~~
>>> drivers/iommu/arm-smmu-v3.c:1404:18: note: in expansion of macro 'GENMASK'
> 1404 |  u32 prod_mask = GENMASK(cmdq->q.llq.max_n_shift, 0);
> |                  ^~~~~~~
> include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> 26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> |                                        ^
> include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
> 16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
> |                                                              ^
> include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
> 39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> |   ^~~~~~~~~~~~~~~~~~~
>>> drivers/iommu/arm-smmu-v3.c:1404:18: note: in expansion of macro 'GENMASK'
> 1404 |  u32 prod_mask = GENMASK(cmdq->q.llq.max_n_shift, 0);
> |                  ^~~~~~~
> 
> vim +/GENMASK +1404 drivers/iommu/arm-smmu-v3.c


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
