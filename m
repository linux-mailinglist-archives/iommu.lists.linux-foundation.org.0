Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF833EEB7
	for <lists.iommu@lfdr.de>; Wed, 17 Mar 2021 11:50:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A57983E91;
	Wed, 17 Mar 2021 10:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxtff78qfWhq; Wed, 17 Mar 2021 10:50:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C3B8377F;
	Wed, 17 Mar 2021 10:50:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62DE9C0001;
	Wed, 17 Mar 2021 10:50:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 696C4C0001
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49A4C83FB3
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 10:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJNLYWoSSTFC for <iommu@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 10:50:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8642A83E91
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 10:50:19 +0000 (UTC)
IronPort-SDR: K/O5j7qPa9M7+J36emC5+Pqp65E+ybT4Rj0+EGTnexJHRmkyogHCK071aoH7Pte7m01IpLnojR
 4wGiRycqB4yA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="250796955"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="250796955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 03:50:18 -0700
IronPort-SDR: lJxrk1Ea9liNowOIg/IECe5NzhRnlPf/GU0qkUHRTPgkZ86cvdIn+uvfscfjOVDHmBBAmxJfDq
 eQR5XqUOBWZw==
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="412599152"
Received: from yisun1-ubuntu.bj.intel.com (HELO yi.y.sun) ([10.238.156.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Mar 2021 03:50:13 -0700
Date: Wed, 17 Mar 2021 18:44:29 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2 06/11] iommu/arm-smmu-v3: Scan leaf TTD to sync
 hardware dirty log
Message-ID: <20210317104429.GT28580@yi.y.sun>
References: <20210310090614.26668-1-zhukeqian1@huawei.com>
 <20210310090614.26668-7-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310090614.26668-7-zhukeqian1@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-kernel@vger.kernel.org,
 lushenming@huawei.com, iommu@lists.linux-foundation.org,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 wanghaibin.wang@huawei.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On 21-03-10 17:06:09, Keqian Zhu wrote:
> From: jiangkunkun <jiangkunkun@huawei.com>
> 
> During dirty log tracking, user will try to retrieve dirty log from
> iommu if it supports hardware dirty log.
> 
> This adds a new interface named sync_dirty_log in iommu layer and
> arm smmuv3 implements it, which scans leaf TTD and treats it's dirty
> if it's writable (As we just enable HTTU for stage1, so check whether
> AP[2] is not set).
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
> 
> changelog:
> 
> v2:
>  - Add new sanity check in arm_smmu_sync_dirty_log(). (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
>  - Document the purpose of flush_iotlb in arm_smmu_sync_dirty_log(). (Robin)
>  
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 30 +++++++
>  drivers/iommu/io-pgtable-arm.c              | 90 +++++++++++++++++++++
>  drivers/iommu/iommu.c                       | 38 +++++++++
>  include/linux/io-pgtable.h                  |  4 +
>  include/linux/iommu.h                       | 18 +++++
>  5 files changed, 180 insertions(+)
> 
Please split iommu common interface out. Thanks!

[...]

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2a10294b62a3..44dfb78f9050 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2850,6 +2850,44 @@ int iommu_stop_dirty_log(struct iommu_domain *domain, unsigned long iova,
>  }
>  EXPORT_SYMBOL_GPL(iommu_stop_dirty_log);
>  
> +int iommu_sync_dirty_log(struct iommu_domain *domain, unsigned long iova,
> +			 size_t size, unsigned long *bitmap,
> +			 unsigned long base_iova, unsigned long bitmap_pgshift)

One open question: shall we add PASID as one parameter to make iommu
know which address space to visit?

For live migration, the pasid should not be necessary. But considering
future extension, it may be required.

BRs,
Yi Sun
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
