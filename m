Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D61726CC
	for <lists.iommu@lfdr.de>; Thu, 27 Feb 2020 19:17:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A8591230BD;
	Thu, 27 Feb 2020 18:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJAXaGLmHxsP; Thu, 27 Feb 2020 18:17:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 597AF22EC1;
	Thu, 27 Feb 2020 18:17:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C767C1D8E;
	Thu, 27 Feb 2020 18:17:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41C50C0177
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 18:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3A9708793D
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 18:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2gZA0cd9mJ4 for <iommu@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:17:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ED8AA8790E
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 18:17:30 +0000 (UTC)
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 8117685ABD52B5BBCA42;
 Thu, 27 Feb 2020 18:17:28 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 27 Feb 2020 18:17:27 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 27 Feb
 2020 18:17:27 +0000
Date: Thu, 27 Feb 2020 18:17:26 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 23/26] iommu/arm-smmu-v3: Add stall support for
 platform devices
Message-ID: <20200227181726.00007c9a@Huawei.com>
In-Reply-To: <20200224182401.353359-24-jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-24-jean-philippe@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.57]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kevin.tian@intel.com,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, will@kernel.org, christian.koenig@amd.com,
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

On Mon, 24 Feb 2020 19:23:58 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> 
> The SMMU provides a Stall model for handling page faults in platform
> devices. It is similar to PCI PRI, but doesn't require devices to have
> their own translation cache. Instead, faulting transactions are parked and
> the OS is given a chance to fix the page tables and retry the transaction.
> 
> Enable stall for devices that support it (opt-in by firmware). When an
> event corresponds to a translation error, call the IOMMU fault handler. If
> the fault is recoverable, it will call us back to terminate or continue
> the stall.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
One question inline.

Thanks,

> ---
>  drivers/iommu/arm-smmu-v3.c | 271 ++++++++++++++++++++++++++++++++++--
>  drivers/iommu/of_iommu.c    |   5 +-
>  include/linux/iommu.h       |   2 +
>  3 files changed, 269 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 6a5987cce03f..da5dda5ba26a 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -374,6 +374,13 @@


> +/*
> + * arm_smmu_flush_evtq - wait until all events currently in the queue have been
> + *                       consumed.
> + *
> + * Wait until the evtq thread finished a batch, or until the queue is empty.
> + * Note that we don't handle overflows on q->batch. If it occurs, just wait for
> + * the queue to be empty.
> + */
> +static int arm_smmu_flush_evtq(void *cookie, struct device *dev, int pasid)
> +{
> +	int ret;
> +	u64 batch;
> +	struct arm_smmu_device *smmu = cookie;
> +	struct arm_smmu_queue *q = &smmu->evtq.q;
> +
> +	spin_lock(&q->wq.lock);
> +	if (queue_sync_prod_in(q) == -EOVERFLOW)
> +		dev_err(smmu->dev, "evtq overflow detected -- requests lost\n");
> +
> +	batch = q->batch;

So this is trying to be sure we have advanced the queue 2 spots?

Is there a potential race here?  q->batch could have updated before we take
a local copy.

> +	ret = wait_event_interruptible_locked(q->wq, queue_empty(&q->llq) ||
> +					      q->batch >= batch + 2);
> +	spin_unlock(&q->wq.lock);
> +
> +	return ret;
> +}
> +
...

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
