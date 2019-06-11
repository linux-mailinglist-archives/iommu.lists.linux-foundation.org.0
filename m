Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE883CB14
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 14:23:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EAC6FE9E;
	Tue, 11 Jun 2019 12:23:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C915E2A
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 12:23:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 398A1775
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 12:23:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 05:23:18 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2019 05:23:18 -0700
Date: Tue, 11 Jun 2019 05:26:26 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Message-ID: <20190611052626.20bed59a@jacob-builder>
In-Reply-To: <20190610184714.6786-2-jean-philippe.brucker@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-2-jean-philippe.brucker@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, 10 Jun 2019 19:47:07 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> Some devices might support multiple DMA address spaces, in particular
> those that have the PCI PASID feature. PASID (Process Address Space
> ID) allows to share process address spaces with devices (SVA),
> partition a device into VM-assignable entities (VFIO mdev) or simply
> provide multiple DMA address space to kernel drivers. Add a global
> PASID allocator usable by different drivers at the same time. Name it
> I/O ASID to avoid confusion with ASIDs allocated by arch code, which
> are usually a separate ID space.
> 
> The IOASID space is global. Each device can have its own PASID space,
> but by convention the IOMMU ended up having a global PASID space, so
> that with SVA, each mm_struct is associated to a single PASID.
> 
> The allocator is primarily used by IOMMU subsystem but in rare
> occasions drivers would like to allocate PASIDs for devices that
> aren't managed by an IOMMU, using the same ID space as IOMMU.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
> The most recent discussion on this patch was at:
> https://lkml.kernel.org/lkml/1556922737-76313-4-git-send-email-jacob.jun.pan@linux.intel.com/
> I fixed it up a bit following comments in that series, and removed the
> definitions for the custom allocator for now.
> 
> There also is a new version that includes the custom allocator into
> this patch, but is currently missing the RCU fixes, at:
> https://lore.kernel.org/lkml/1560087862-57608-13-git-send-email-jacob.jun.pan@linux.intel.com/
> ---
>  drivers/iommu/Kconfig  |   4 ++
>  drivers/iommu/Makefile |   1 +
>  drivers/iommu/ioasid.c | 150
> +++++++++++++++++++++++++++++++++++++++++ include/linux/ioasid.h |
> 49 ++++++++++++++ 4 files changed, 204 insertions(+)
>  create mode 100644 drivers/iommu/ioasid.c
>  create mode 100644 include/linux/ioasid.h
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 83664db5221d..9b45f70549a7 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -3,6 +3,10 @@
>  config IOMMU_IOVA
>  	tristate
>  
> +# The IOASID library may also be used by non-IOMMU_API users
> +config IOASID
> +	tristate
> +
>  # IOMMU_API always gets selected by whoever wants it.
>  config IOMMU_API
>  	bool
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 8c71a15e986b..0efac6f1ec73 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> +obj-$(CONFIG_IOASID) += ioasid.o
>  obj-$(CONFIG_IOMMU_IOVA) += iova.o
>  obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
>  obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
> diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> new file mode 100644
> index 000000000000..bbb771214fa9
> --- /dev/null
> +++ b/drivers/iommu/ioasid.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * I/O Address Space ID allocator. There is one global IOASID space,
> split into
> + * subsets. Users create a subset with DECLARE_IOASID_SET, then
> allocate and
> + * free IOASIDs with ioasid_alloc and ioasid_free.
> + */
> +#include <linux/ioasid.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/xarray.h>
> +
> +struct ioasid_data {
> +	ioasid_t id;
> +	struct ioasid_set *set;
> +	void *private;
> +	struct rcu_head rcu;
> +};
> +
> +static DEFINE_XARRAY_ALLOC(ioasid_xa);
> +
> +/**
> + * ioasid_set_data - Set private data for an allocated ioasid
> + * @ioasid: the ID to set data
> + * @data:   the private data
> + *
> + * For IOASID that is already allocated, private data can be set
> + * via this API. Future lookup can be done via ioasid_find.
> + */
> +int ioasid_set_data(ioasid_t ioasid, void *data)
> +{
> +	struct ioasid_data *ioasid_data;
> +	int ret = 0;
> +
> +	xa_lock(&ioasid_xa);
Just wondering if this is necessary, since xa_load is under
rcu_read_lock and we are not changing anything internal to xa. For
custom allocator I still need to have the mutex against allocator
removal.
> +	ioasid_data = xa_load(&ioasid_xa, ioasid);
> +	if (ioasid_data)
> +		rcu_assign_pointer(ioasid_data->private, data);
it is good to publish and have barrier here. But I just wonder even for
weakly ordered machine, this pointer update is quite far away from its
data update.
> +	else
> +		ret = -ENOENT;
> +	xa_unlock(&ioasid_xa);
> +
> +	/*
> +	 * Wait for readers to stop accessing the old private data,
> so the
> +	 * caller can free it.
> +	 */
> +	if (!ret)
> +		synchronize_rcu();
> +
I will add that to my next version to check ret value.

Thanks,

Jacob
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_set_data);
> +
> +/**
> + * ioasid_alloc - Allocate an IOASID
> + * @set: the IOASID set
> + * @min: the minimum ID (inclusive)
> + * @max: the maximum ID (inclusive)
> + * @private: data private to the caller
> + *
> + * Allocate an ID between @min and @max. The @private pointer is
> stored
> + * internally and can be retrieved with ioasid_find().
> + *
> + * Return: the allocated ID on success, or %INVALID_IOASID on
> failure.
> + */
> +ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t
> max,
> +		      void *private)
> +{
> +	u32 id = INVALID_IOASID;
> +	struct ioasid_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return INVALID_IOASID;
> +
> +	data->set = set;
> +	data->private = private;
> +
> +	if (xa_alloc(&ioasid_xa, &id, data, XA_LIMIT(min, max),
> GFP_KERNEL)) {
> +		pr_err("Failed to alloc ioasid from %d to %d\n",
> min, max);
> +		goto exit_free;
> +	}
> +	data->id = id;
> +
> +exit_free:
> +	if (id == INVALID_IOASID) {
> +		kfree(data);
> +		return INVALID_IOASID;
> +	}
> +	return id;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_alloc);
> +
> +/**
> + * ioasid_free - Free an IOASID
> + * @ioasid: the ID to remove
> + */
> +void ioasid_free(ioasid_t ioasid)
> +{
> +	struct ioasid_data *ioasid_data;
> +
> +	ioasid_data = xa_erase(&ioasid_xa, ioasid);
> +
> +	kfree_rcu(ioasid_data, rcu);
> +}
> +EXPORT_SYMBOL_GPL(ioasid_free);
> +
> +/**
> + * ioasid_find - Find IOASID data
> + * @set: the IOASID set
> + * @ioasid: the IOASID to find
> + * @getter: function to call on the found object
> + *
> + * The optional getter function allows to take a reference to the
> found object
> + * under the rcu lock. The function can also check if the object is
> still valid:
> + * if @getter returns false, then the object is invalid and NULL is
> returned.
> + *
> + * If the IOASID has been allocated for this set, return the private
> pointer
> + * passed to ioasid_alloc. Private data can be NULL if not set.
> Return an error
> + * if the IOASID is not found or does not belong to the set.
> + */
> +void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
> +		  bool (*getter)(void *))
> +{
> +	void *priv = NULL;
> +	struct ioasid_data *ioasid_data;
> +
> +	rcu_read_lock();
> +	ioasid_data = xa_load(&ioasid_xa, ioasid);
> +	if (!ioasid_data) {
> +		priv = ERR_PTR(-ENOENT);
> +		goto unlock;
> +	}
> +	if (set && ioasid_data->set != set) {
> +		/* data found but does not belong to the set */
> +		priv = ERR_PTR(-EACCES);
> +		goto unlock;
> +	}
> +	/* Now IOASID and its set is verified, we can return the
> private data */
> +	priv = rcu_dereference(ioasid_data->private);
> +	if (getter && !getter(priv))
> +		priv = NULL;
> +unlock:
> +	rcu_read_unlock();
> +
> +	return priv;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_find);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> new file mode 100644
> index 000000000000..940212422b8f
> --- /dev/null
> +++ b/include/linux/ioasid.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_IOASID_H
> +#define __LINUX_IOASID_H
> +
> +#include <linux/types.h>
> +
> +#define INVALID_IOASID ((ioasid_t)-1)
> +typedef unsigned int ioasid_t;
> +
> +struct ioasid_set {
> +	int dummy;
> +};
> +
> +#define DECLARE_IOASID_SET(name) struct ioasid_set name = { 0 }
> +
> +#if IS_ENABLED(CONFIG_IOASID)
> +ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t
> max,
> +		      void *private);
> +void ioasid_free(ioasid_t ioasid);
> +
> +void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
> +		  bool (*getter)(void *));
> +
> +int ioasid_set_data(ioasid_t ioasid, void *data);
> +
> +#else /* !CONFIG_IOASID */
> +static inline ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t
> min,
> +				    ioasid_t max, void *private)
> +{
> +	return INVALID_IOASID;
> +}
> +
> +static inline void ioasid_free(ioasid_t ioasid)
> +{
> +}
> +
> +static inline void *ioasid_find(struct ioasid_set *set, ioasid_t
> ioasid,
> +				bool (*getter)(void *))
> +{
> +	return NULL;
> +}
> +
> +static inline int ioasid_set_data(ioasid_t ioasid, void *data)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif /* CONFIG_IOASID */
> +#endif /* __LINUX_IOASID_H */

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
