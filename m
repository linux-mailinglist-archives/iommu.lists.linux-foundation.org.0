Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011D2954AE
	for <lists.iommu@lfdr.de>; Thu, 22 Oct 2020 00:13:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFA3A204C8;
	Wed, 21 Oct 2020 22:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN4N+deacLTf; Wed, 21 Oct 2020 22:13:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3ECCB20526;
	Wed, 21 Oct 2020 19:17:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35AB7C0051;
	Wed, 21 Oct 2020 19:17:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E243C0051
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3358320526
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndKbU7EuyeSc for <iommu@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 19:17:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id A93702E654
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 14:58:21 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p13so2888825edi.7
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=974kBlJ63qD5EYogdaxTOFg/LSMsXr6xzzQDrgDmhVo=;
 b=TdPu+ofWfrp0hwZWxhUq2KJS2zjbi8MrOCRcvRVvru7pOPrruypz9/Jga2crVESF3W
 Sgd6gNwn7b7g9HAdaUgq69DALhZenDShkEzj4sDr70Ktq2eS4TH9j3nCiZ+Ibr20uv48
 2HdetkUPnrVr5uz+ySBJQPe84nLfS3V5hAPiynmVgfOx/+drK4mGICmVHXYFm89vTnmV
 bRqtXTZEi2o4y8N/WmwOj1JlaunStuLcIkFSdWKD+ZTiThH7GDgkq+hlLcz6bgp+gVb5
 JbOCGDSRnGNAFRWdG7pgjKtDmuvnG3YvittRYtVL7MSYHQsNN/WjH7tiKbJ23OMmJSV2
 0qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=974kBlJ63qD5EYogdaxTOFg/LSMsXr6xzzQDrgDmhVo=;
 b=qXay2NfmUa7p02+xxV6NofEOyrPU4fif8nVp23LqHLHrO9FGhhN4EYf6ytws9Ikc0D
 VFhS9PKVsqXtlI+o0QjLrer4Zp+1K2677wj5qwUQNXkwy9ooE7tc28gqRDu/87MuOfjy
 MncF2fSkSQ40upc6qh2P0/+vvULp2yS2IGml2slWyUHYqWKlLaq0EPDI1dhzvr3iom+M
 WoLX8EUTJBwpeDGeC4WiHOtrR+Yi2HZUfWUjRJycyxt3sXeGE0K1rW3c/K9tJD552T/0
 iR/nTOnvcrgUEWJoRozmYmBCa4xcyAkMN0c1hXW6hz/vfYveZDWy6skqPx5puORN1cpJ
 lSiw==
X-Gm-Message-State: AOAM530bl+mFNEPibUp1oyigizurzSez+Vpl5o97opx6bTy/nCcoIHQM
 w/NzQCSWWvWAXR2TXTQow3f/mQ==
X-Google-Smtp-Source: ABdhPJyd8qNnKzXbBi18/h0hVzpH2outHPyVpO68TJvh4T7AJopg7XFZjjhKPN7GZcGnnukbpphClw==
X-Received: by 2002:a05:6402:3191:: with SMTP id
 di17mr3387453edb.376.1603292299867; 
 Wed, 21 Oct 2020 07:58:19 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n25sm2377864ejd.114.2020.10.21.07.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 07:58:19 -0700 (PDT)
Date: Wed, 21 Oct 2020 16:58:00 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.pan.linux@gmail.com>
Subject: Re: [PATCH v3 08/14] iommu/ioasid: Add reference couting functions
Message-ID: <20201021145800.GF1653231@myrica>
References: <1601329121-36979-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1601329121-36979-9-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601329121-36979-9-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Yi Sun <yi.y.sun@intel.com>
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

On Mon, Sep 28, 2020 at 02:38:35PM -0700, Jacob Pan wrote:
> There can be multiple users of an IOASID, each user could have hardware
> contexts associated with the IOASID. In order to align lifecycles,
> reference counting is introduced in this patch. It is expected that when
> an IOASID is being freed, each user will drop a reference only after its
> context is cleared.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/ioasid.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/ioasid.h |  24 ++++++++++
>  2 files changed, 141 insertions(+)
> 
> diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> index 9628e78b2ab4..828cc44b1b1c 100644
> --- a/drivers/iommu/ioasid.c
> +++ b/drivers/iommu/ioasid.c
> @@ -16,8 +16,26 @@ static ioasid_t ioasid_capacity = PCI_PASID_MAX;
>  static ioasid_t ioasid_capacity_avail = PCI_PASID_MAX;
>  static DEFINE_XARRAY_ALLOC(ioasid_sets);
>  
> +enum ioasid_state {
> +	IOASID_STATE_INACTIVE,
> +	IOASID_STATE_ACTIVE,
> +	IOASID_STATE_FREE_PENDING,
> +};
> +
> +/**
> + * struct ioasid_data - Meta data about ioasid
> + *
> + * @id:		Unique ID
> + * @users:	Number of active users
> + * @state:	Track state of the IOASID
> + * @set:	ioasid_set of the IOASID belongs to
> + * @private:	Private data associated with the IOASID
> + * @rcu:	For free after RCU grace period
> + */
>  struct ioasid_data {
>  	ioasid_t id;
> +	refcount_t users;
> +	enum ioasid_state state;
>  	struct ioasid_set *set;
>  	void *private;
>  	struct rcu_head rcu;
> @@ -511,6 +529,8 @@ ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
>  		goto exit_free;
>  	}
>  	data->id = id;
> +	data->state = IOASID_STATE_ACTIVE;
> +	refcount_set(&data->users, 1);
>  
>  	/* Store IOASID in the per set data */
>  	if (xa_err(xa_store(&set->xa, id, data, GFP_ATOMIC))) {
> @@ -560,6 +580,14 @@ static void ioasid_free_locked(struct ioasid_set *set, ioasid_t ioasid)
>  	if (WARN_ON(!xa_load(&ioasid_sets, data->set->id)))
>  		return;
>  
> +	/* Free is already in progress */
> +	if (data->state == IOASID_STATE_FREE_PENDING)
> +		return;

But the previous call to ioasid_free_locked() dropped a reference, then
returned because more refs where held. Shouldn't this call also
dec_and_test() the reference and call ioasid_do_free_locked() if
necessary?

> +
> +	data->state = IOASID_STATE_FREE_PENDING;
> +	if (!refcount_dec_and_test(&data->users))
> +		return;
> +
>  	ioasid_do_free_locked(data);
>  }
>  
> @@ -717,6 +745,95 @@ void ioasid_set_for_each_ioasid(struct ioasid_set *set,
>  }
>  EXPORT_SYMBOL_GPL(ioasid_set_for_each_ioasid);
>  
> +int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	struct ioasid_data *data;
> +
> +	data = xa_load(&active_allocator->xa, ioasid);
> +	if (!data) {
> +		pr_err("Trying to get unknown IOASID %u\n", ioasid);
> +		return -EINVAL;
> +	}
> +	if (data->state == IOASID_STATE_FREE_PENDING) {
> +		pr_err("Trying to get IOASID being freed%u\n", ioasid);

Strange placement of the %u

> +		return -EBUSY;
> +	}
> +
> +	/* Check set ownership if the set is non-null */
> +	if (set && data->set != set) {
> +		pr_err("Trying to get IOASID %u outside the set\n", ioasid);
> +		/* data found but does not belong to the set */
> +		return -EACCES;
> +	}
> +	refcount_inc(&data->users);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_get_locked);

If this is a public facing let's add a lockdep_assert_held() to make sure
they do hold the right lock. Same for ioasid_put_locked().

Thanks,
Jean

> +
> +/**
> + * ioasid_get - Obtain a reference to an ioasid
> + * @set:	the ioasid_set to check permission against if not NULL
> + * @ioasid:	the ID to remove
> + *
> + *
> + * Return: 0 on success, error if failed.
> + */
> +int ioasid_get(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	int ret;
> +
> +	spin_lock(&ioasid_allocator_lock);
> +	ret = ioasid_get_locked(set, ioasid);
> +	spin_unlock(&ioasid_allocator_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_get);
> +
> +bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	struct ioasid_data *data;
> +
> +	data = xa_load(&active_allocator->xa, ioasid);
> +	if (!data) {
> +		pr_err("Trying to put unknown IOASID %u\n", ioasid);
> +		return false;
> +	}
> +	if (set && data->set != set) {
> +		pr_err("Trying to drop IOASID %u outside the set\n", ioasid);
> +		return false;
> +	}
> +	if (!refcount_dec_and_test(&data->users))
> +		return false;
> +
> +	ioasid_do_free_locked(data);
> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_put_locked);
> +
> +/**
> + * ioasid_put - Release a reference to an ioasid
> + * @set:	the ioasid_set to check permission against if not NULL
> + * @ioasid:	the ID to remove
> + *
> + * Put a reference to the IOASID, free it when the number of references drops to
> + * zero.
> + *
> + * Return: %true if the IOASID was freed, %false otherwise.
> + */
> +bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	bool ret;
> +
> +	spin_lock(&ioasid_allocator_lock);
> +	ret = ioasid_put_locked(set, ioasid);
> +	spin_unlock(&ioasid_allocator_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_put);
> +
>  /**
>   * ioasid_find - Find IOASID data
>   * @set: the IOASID set
> diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> index aab58bc26714..16d421357173 100644
> --- a/include/linux/ioasid.h
> +++ b/include/linux/ioasid.h
> @@ -73,6 +73,10 @@ void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
>  		  bool (*getter)(void *));
>  int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
>  void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
> +int ioasid_get(struct ioasid_set *set, ioasid_t ioasid);
> +int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid);
> +bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid);
> +bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid);
>  int ioasid_attach_data(ioasid_t ioasid, void *data);
>  void ioasid_detach_data(ioasid_t ioasid);
>  void ioasid_set_for_each_ioasid(struct ioasid_set *sdata,
> @@ -112,6 +116,26 @@ static inline void ioasid_set_put(struct ioasid_set *set)
>  {
>  }
>  
> +static inline int ioasid_get(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	return false;
> +}
> +
> +static inline bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid)
> +{
> +	return false;
> +}
> +
>  static inline void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid, bool (*getter)(void *))
>  {
>  	return NULL;
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
