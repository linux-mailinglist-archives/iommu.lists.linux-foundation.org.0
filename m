Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6919548C
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 10:55:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8887894DC;
	Fri, 27 Mar 2020 09:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oM2vHPZlLWL6; Fri, 27 Mar 2020 09:55:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3258894B7;
	Fri, 27 Mar 2020 09:55:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC79DC1D85;
	Fri, 27 Mar 2020 09:55:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47EC7C0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 36A8A894DC
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgSaGTukKT6G for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 09:55:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B3EC894B7
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:55:48 +0000 (UTC)
IronPort-SDR: BNOlndYKq5hi8IKmAlB1GTr7lSOITzEGHnNLuw/Bm+48qRGljcokZk3myRDkbfu7pUzuMZVkBQ
 TIQSRnXpD0Cg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 02:55:47 -0700
IronPort-SDR: bT3ryrd0tT1jr94GKKr+iX/NuqdMwo9CVGcWdKbynZAEHht25qR7IknmMqEZ2YwZv63D8Eitcm
 YwCNAnvYBWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="421047659"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 02:55:47 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 02:55:46 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 02:55:46 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 17:55:44 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, 
 Alex Williamson <alex.williamson@redhat.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.com>
Subject: RE: [PATCH 07/10] iommu/ioasid: Use mutex instead of spinlock
Thread-Topic: [PATCH 07/10] iommu/ioasid: Use mutex instead of spinlock
Thread-Index: AQHWAs3Lc4yP/KZICUWluZLwsVHvnqhcNb4w
Date: Fri, 27 Mar 2020 09:55:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED597@SHSMSX104.ccr.corp.intel.com>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-8-git-send-email-jacob.jun.pan@linux.intel.com>
In-Reply-To: <1585158931-1825-8-git-send-email-jacob.jun.pan@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Jonathan Cameron <jic23@kernel.org>
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

> From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Sent: Thursday, March 26, 2020 1:55 AM
> 
> Each IOASID or set could have multiple users with its own HW context
> to maintain. Often times access to the HW context requires thread context.
> For example, consumers of IOASIDs can register notification blocks to
> sync up its states. Having an atomic notifier is not feasible for these
> update operations.
> 
> This patch converts allocator lock from spinlock to mutex in preparation
> for IOASID notifier.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/ioasid.c | 45 +++++++++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> index f89a595f6978..8612fe6477dc 100644
> --- a/drivers/iommu/ioasid.c
> +++ b/drivers/iommu/ioasid.c
> @@ -98,7 +98,7 @@ struct ioasid_allocator_data {
>  	struct rcu_head rcu;
>  };
> 
> -static DEFINE_SPINLOCK(ioasid_allocator_lock);
> +static DEFINE_MUTEX(ioasid_allocator_lock);
>  static LIST_HEAD(allocators_list);
> 
>  static ioasid_t default_alloc(ioasid_t min, ioasid_t max, void *opaque);
> @@ -121,7 +121,7 @@ static ioasid_t default_alloc(ioasid_t min, ioasid_t
> max, void *opaque)
>  {
>  	ioasid_t id;
> 
> -	if (xa_alloc(&default_allocator.xa, &id, opaque, XA_LIMIT(min, max),
> GFP_ATOMIC)) {
> +	if (xa_alloc(&default_allocator.xa, &id, opaque, XA_LIMIT(min, max),
> GFP_KERNEL)) {
>  		pr_err("Failed to alloc ioasid from %d to %d\n", min, max);
>  		return INVALID_IOASID;
>  	}
> @@ -142,7 +142,7 @@ static struct ioasid_allocator_data
> *ioasid_alloc_allocator(struct ioasid_alloca
>  {
>  	struct ioasid_allocator_data *ia_data;
> 
> -	ia_data = kzalloc(sizeof(*ia_data), GFP_ATOMIC);
> +	ia_data = kzalloc(sizeof(*ia_data), GFP_KERNEL);
>  	if (!ia_data)
>  		return NULL;
> 
> @@ -184,7 +184,7 @@ int ioasid_register_allocator(struct
> ioasid_allocator_ops *ops)
>  	struct ioasid_allocator_data *pallocator;
>  	int ret = 0;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
> 
>  	ia_data = ioasid_alloc_allocator(ops);
>  	if (!ia_data) {
> @@ -228,12 +228,12 @@ int ioasid_register_allocator(struct
> ioasid_allocator_ops *ops)
>  	}
>  	list_add_tail(&ia_data->list, &allocators_list);
> 
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  	return 0;
>  out_free:
>  	kfree(ia_data);
>  out_unlock:
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(ioasid_register_allocator);
> @@ -251,7 +251,7 @@ void ioasid_unregister_allocator(struct
> ioasid_allocator_ops *ops)
>  	struct ioasid_allocator_data *pallocator;
>  	struct ioasid_allocator_ops *sops;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	if (list_empty(&allocators_list)) {
>  		pr_warn("No custom IOASID allocators active!\n");
>  		goto exit_unlock;
> @@ -296,7 +296,7 @@ void ioasid_unregister_allocator(struct
> ioasid_allocator_ops *ops)
>  	}
> 
>  exit_unlock:
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  }
>  EXPORT_SYMBOL_GPL(ioasid_unregister_allocator);
> 
> @@ -313,13 +313,13 @@ int ioasid_attach_data(ioasid_t ioasid, void *data)
>  	struct ioasid_data *ioasid_data;
>  	int ret = 0;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	ioasid_data = xa_load(&active_allocator->xa, ioasid);
>  	if (ioasid_data)
>  		rcu_assign_pointer(ioasid_data->private, data);
>  	else
>  		ret = -ENOENT;
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
> 
>  	/*
>  	 * Wait for readers to stop accessing the old private data, so the
> @@ -374,7 +374,7 @@ ioasid_t ioasid_alloc(int sid, ioasid_t min, ioasid_t
> max, void *private)
>  	 * Custom allocator needs allocator data to perform platform specific
>  	 * operations.
>  	 */
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	adata = active_allocator->flags & IOASID_ALLOCATOR_CUSTOM ?
> active_allocator->ops->pdata : data;
>  	id = active_allocator->ops->alloc(min, max, adata);
>  	if (id == INVALID_IOASID) {
> @@ -383,7 +383,7 @@ ioasid_t ioasid_alloc(int sid, ioasid_t min, ioasid_t
> max, void *private)
>  	}
> 
>  	if ((active_allocator->flags & IOASID_ALLOCATOR_CUSTOM) &&
> -	     xa_alloc(&active_allocator->xa, &id, data, XA_LIMIT(id, id),
> GFP_ATOMIC)) {
> +	     xa_alloc(&active_allocator->xa, &id, data, XA_LIMIT(id, id),
> GFP_KERNEL)) {
>  		/* Custom allocator needs framework to store and track
> allocation results */
>  		pr_err("Failed to alloc ioasid from %d\n", id);
>  		active_allocator->ops->free(id, active_allocator->ops->pdata);
> @@ -394,10 +394,11 @@ ioasid_t ioasid_alloc(int sid, ioasid_t min, ioasid_t
> max, void *private)
>  	/* Store IOASID in the per set data */
>  	xa_store(&sdata->xa, id, data, GFP_KERNEL);
>  	sdata->nr_ioasids++;
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
> +
>  	return id;
>  exit_free:
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  	kfree(data);
>  	return INVALID_IOASID;
>  }
> @@ -440,9 +441,9 @@ static void ioasid_free_locked(ioasid_t ioasid)
>   */
>  void ioasid_free(ioasid_t ioasid)
>  {
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	ioasid_free_locked(ioasid);
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  }
>  EXPORT_SYMBOL_GPL(ioasid_free);
> 
> @@ -473,7 +474,7 @@ int ioasid_alloc_set(struct ioasid_set *token, ioasid_t
> quota, int *sid)
>  	if (!sdata)
>  		return -ENOMEM;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
> 
>  	ret = xa_alloc(&ioasid_sets, &id, sdata,
>  		       XA_LIMIT(0, ioasid_capacity_avail - quota),
> @@ -497,7 +498,7 @@ int ioasid_alloc_set(struct ioasid_set *token, ioasid_t
> quota, int *sid)
>  	*sid = id;
> 
>  error:
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
> 
>  	return ret;
>  }
> @@ -518,7 +519,7 @@ void ioasid_free_set(int sid, bool destroy_set)
>  	struct ioasid_data *entry;
>  	unsigned long index;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	sdata = xa_load(&ioasid_sets, sid);
>  	if (!sdata) {
>  		pr_err("No IOASID set found to free %d\n", sid);
> @@ -549,7 +550,7 @@ void ioasid_free_set(int sid, bool destroy_set)
>  	}
> 
>  done_unlock:
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
>  }
>  EXPORT_SYMBOL_GPL(ioasid_free_set);
> 
> @@ -613,11 +614,11 @@ int ioasid_find_sid(ioasid_t ioasid)
>  	struct ioasid_data *ioasid_data;
>  	int ret = 0;
> 
> -	spin_lock(&ioasid_allocator_lock);
> +	mutex_lock(&ioasid_allocator_lock);
>  	ioasid_data = xa_load(&active_allocator->xa, ioasid);
>  	ret = (ioasid_data) ? ioasid_data->sdata->sid : -ENOENT;
> 
> -	spin_unlock(&ioasid_allocator_lock);
> +	mutex_unlock(&ioasid_allocator_lock);
> 
>  	return ret;
>  }
> --
> 2.7.4

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
