Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208125641
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 19:00:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 76C7ACA8;
	Tue, 21 May 2019 17:00:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0EE51C8F
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 17:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BF25875
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 17:00:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2019 10:00:03 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga006.jf.intel.com with ESMTP; 21 May 2019 10:00:03 -0700
Date: Tue, 21 May 2019 10:03:00 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 03/16] iommu: Add I/O ASID allocator
Message-ID: <20190521100300.4f224e68@jacob-builder>
In-Reply-To: <bb31fbcb-2708-93e6-f11e-3018556fbc21@redhat.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-4-git-send-email-jacob.jun.pan@linux.intel.com>
	<bb31fbcb-2708-93e6-f11e-3018556fbc21@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
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

On Tue, 21 May 2019 10:21:55 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 5/4/19 12:32 AM, Jacob Pan wrote:
> > From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > 
> > Some devices might support multiple DMA address spaces, in
> > particular those that have the PCI PASID feature. PASID (Process
> > Address Space ID) allows to share process address spaces with
> > devices (SVA), partition a device into VM-assignable entities (VFIO
> > mdev) or simply provide multiple DMA address space to kernel
> > drivers. Add a global PASID allocator usable by different drivers
> > at the same time. Name it I/O ASID to avoid confusion with ASIDs
> > allocated by arch code, which are usually a separate ID space.
> > 
> > The IOASID space is global. Each device can have its own PASID
> > space, but by convention the IOMMU ended up having a global PASID
> > space, so that with SVA, each mm_struct is associated to a single
> > PASID.
> > 
> > The allocator is primarily used by IOMMU subsystem but in rare
> > occasions drivers would like to allocate PASIDs for devices that
> > aren't managed by an IOMMU, using the same ID space as IOMMU.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Link: https://lkml.org/lkml/2019/4/26/462
> > ---
> >  drivers/iommu/Kconfig  |   6 +++
> >  drivers/iommu/Makefile |   1 +
> >  drivers/iommu/ioasid.c | 140
> > +++++++++++++++++++++++++++++++++++++++++++++++++
> > include/linux/ioasid.h |  67 +++++++++++++++++++++++ 4 files
> > changed, 214 insertions(+) create mode 100644 drivers/iommu/ioasid.c
> >  create mode 100644 include/linux/ioasid.h
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 6f07f3b..75e7f97 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -2,6 +2,12 @@
> >  config IOMMU_IOVA
> >  	tristate
> >  
> > +config IOASID
> > +	bool  
> don't we want a tristate here too?
> 
> Also refering to the past discussions we could add "# The IOASID
> library may also be used by non-IOMMU_API users"
I agree. For device driver modules to use ioasid w/o iommu, this does
not have to be built-in.
Jean, would you agree?

> > +	help
> > +	  Enable the I/O Address Space ID allocator. A single ID
> > space shared
> > +	  between different users.
> > +
> >  # IOMMU_API always gets selected by whoever wants it.
> >  config IOMMU_API
> >  	bool
> > diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> > index 8c71a15..0efac6f 100644
> > --- a/drivers/iommu/Makefile
> > +++ b/drivers/iommu/Makefile
> > @@ -7,6 +7,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> > +obj-$(CONFIG_IOASID) += ioasid.o
> >  obj-$(CONFIG_IOMMU_IOVA) += iova.o
> >  obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
> >  obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
> > diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> > new file mode 100644
> > index 0000000..99f5e0a
> > --- /dev/null
> > +++ b/drivers/iommu/ioasid.c
> > @@ -0,0 +1,140 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * I/O Address Space ID allocator. There is one global IOASID
> > space, split into
> > + * subsets. Users create a subset with DECLARE_IOASID_SET, then
> > allocate and
> > + * free IOASIDs with ioasid_alloc and ioasid_free.
> > + */
> > +#include <linux/xarray.h>
> > +#include <linux/ioasid.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +struct ioasid_data {
> > +	ioasid_t id;
> > +	struct ioasid_set *set;
> > +	void *private;
> > +	struct rcu_head rcu;
> > +};
> > +
> > +static DEFINE_XARRAY_ALLOC(ioasid_xa);
> > +
> > +/**
> > + * ioasid_set_data - Set private data for an allocated ioasid
> > + * @ioasid: the ID to set data
> > + * @data:   the private data
> > + *
> > + * For IOASID that is already allocated, private data can be set
> > + * via this API. Future lookup can be done via ioasid_find.
> > + */
> > +int ioasid_set_data(ioasid_t ioasid, void *data)
> > +{
> > +	struct ioasid_data *ioasid_data;
> > +	int ret = 0;
> > +
> > +	ioasid_data = xa_load(&ioasid_xa, ioasid);
> > +	if (ioasid_data)
> > +		ioasid_data->private = data;
> > +	else
> > +		ret = -ENOENT;
> > +
> > +	/* getter may use the private data */
> > +	synchronize_rcu();
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(ioasid_set_data);
> > +
> > +/**
> > + * ioasid_alloc - Allocate an IOASID
> > + * @set: the IOASID set
> > + * @min: the minimum ID (inclusive)
> > + * @max: the maximum ID (inclusive)
> > + * @private: data private to the caller
> > + *
> > + * Allocate an ID between @min and @max (or %0 and %INT_MAX).  
> I think we agreed to drop (or %0 and %INT_MAX)
>  Return the
sorry I don't recall but works for me.

> > + * allocated ID on success, or INVALID_IOASID on failure. The
> > @private pointer
> > + * is stored internally and can be retrieved with ioasid_find().
> > + */
> > +ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
> > ioasid_t max,
> > +		      void *private)
> > +{
> > +	int id = INVALID_IOASID;  
> isn't it an unsigned?
Right

> > +	struct ioasid_data *data;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return INVALID_IOASID;
> > +
> > +	data->set = set;
> > +	data->private = private;
> > +
> > +	if (xa_alloc(&ioasid_xa, &id, data, XA_LIMIT(min, max),
> > GFP_KERNEL)) {
> > +		pr_err("Failed to alloc ioasid from %d to %d\n",
> > min, max);
> > +		goto exit_free;
> > +	}
> > +	data->id = id;
> > +
> > +exit_free:
> > +	if (id < 0 || id == INVALID_IOASID) {  
> < 0?
Agreed.
> > +		kfree(data);
> > +		return INVALID_IOASID;
> > +	}
> > +	return id;
> > +}
> > +EXPORT_SYMBOL_GPL(ioasid_alloc);
> > +
> > +/**
> > + * ioasid_free - Free an IOASID
> > + * @ioasid: the ID to remove
> > + */
> > +void ioasid_free(ioasid_t ioasid)
> > +{
> > +	struct ioasid_data *ioasid_data;
> > +
> > +	ioasid_data = xa_erase(&ioasid_xa, ioasid);
> > +
> > +	kfree_rcu(ioasid_data, rcu);
> > +}
> > +EXPORT_SYMBOL_GPL(ioasid_free);
> > +
> > +/**
> > + * ioasid_find - Find IOASID data
> > + * @set: the IOASID set
> > + * @ioasid: the IOASID to find
> > + * @getter: function to call on the found object
> > + *
> > + * The optional getter function allows to take a reference to the
> > found object
> > + * under the rcu lock. The function can also check if the object
> > is still valid:
> > + * if @getter returns false, then the object is invalid and NULL
> > is returned.
> > + *
> > + * If the IOASID has been allocated for this set, return the
> > private pointer
> > + * passed to ioasid_alloc. Private data can be NULL if not set.
> > Return an error
> > + * if the IOASID is not found or not belong to the set.  
> do not belong
Will fix, "does not belong"

> > + */
> > +void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
> > +		  bool (*getter)(void *))
> > +{
> > +	void *priv = NULL;
> > +	struct ioasid_data *ioasid_data;
> > +
> > +	rcu_read_lock();
> > +	ioasid_data = xa_load(&ioasid_xa, ioasid);
> > +	if (!ioasid_data) {
> > +		priv = ERR_PTR(-ENOENT);
> > +		goto unlock;
> > +	}
> > +	if (set && ioasid_data->set != set) {
> > +		/* data found but does not belong to the set */
> > +		priv = ERR_PTR(-EACCES);
> > +		goto unlock;
> > +	}
> > +	/* Now IOASID and its set is verified, we can return the
> > private data */
> > +	priv = ioasid_data->private;
> > +	if (getter && !getter(priv))
> > +		priv = NULL;
> > +unlock:
> > +	rcu_read_unlock();
> > +
> > +	return priv;
> > +}
> > +EXPORT_SYMBOL_GPL(ioasid_find);
> > diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> > new file mode 100644
> > index 0000000..41de5e4
> > --- /dev/null
> > +++ b/include/linux/ioasid.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __LINUX_IOASID_H
> > +#define __LINUX_IOASID_H
> > +
> > +#define INVALID_IOASID ((ioasid_t)-1)
> > +typedef unsigned int ioasid_t;
> > +typedef int (*ioasid_iter_t)(ioasid_t ioasid, void *private, void
> > *data); +typedef ioasid_t (*ioasid_alloc_fn_t)(ioasid_t min,
> > ioasid_t max, void *data); +typedef void
> > (*ioasid_free_fn_t)(ioasid_t ioasid, void *data); +
> > +struct ioasid_set {
> > +	int dummy;
> > +};
> > +
> > +struct ioasid_allocator {
> > +	ioasid_alloc_fn_t alloc;
> > +	ioasid_free_fn_t free;
> > +	void *pdata;
> > +	struct list_head list;
> > +};
> > +
> > +#define DECLARE_IOASID_SET(name) struct ioasid_set name = { 0 }
> > +
> > +#ifdef CONFIG_IOASID
> > +ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
> > ioasid_t max,
> > +		      void *private);
> > +void ioasid_free(ioasid_t ioasid);
> > +
> > +void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
> > +		  bool (*getter)(void *));
> > +int ioasid_register_allocator(struct ioasid_allocator *allocator);
> > +void ioasid_unregister_allocator(struct ioasid_allocator
> > *allocator); +
> > +int ioasid_set_data(ioasid_t ioasid, void *data);
> > +
> > +#else /* !CONFIG_IOASID */
> > +static inline ioasid_t ioasid_alloc(struct ioasid_set *set,
> > ioasid_t min,
> > +				    ioasid_t max, void *private)
> > +{
> > +	return INVALID_IOASID;
> > +}
> > +
> > +static inline void ioasid_free(ioasid_t ioasid)
> > +{
> > +}
> > +
> > +static inline void *ioasid_find(struct ioasid_set *set, ioasid_t
> > ioasid,
> > +				bool (*getter)(void *))
> > +{
> > +	return NULL;
> > +}
> > +static inline int ioasid_register_allocator(struct
> > ioasid_allocator *allocator) +{
> > +	return -ENODEV;
> > +}
> > +
> > +static inline void ioasid_unregister_allocator(struct
> > ioasid_allocator *allocator) +{
> > +}
> > +
> > +static inline int ioasid_set_data(ioasid_t ioasid, void *data)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +#endif /* CONFIG_IOASID */
> > +#endif /* __LINUX_IOASID_H */
> >   
> Thanks
> 
> Eric
Thank you for the review
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
