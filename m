Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F341961D1
	for <lists.iommu@lfdr.de>; Sat, 28 Mar 2020 00:25:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71FA887987;
	Fri, 27 Mar 2020 23:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfNtAyKvsVZw; Fri, 27 Mar 2020 23:25:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05C148796B;
	Fri, 27 Mar 2020 23:25:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDCA7C1D8A;
	Fri, 27 Mar 2020 23:25:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 887FAC0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 23:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6FB1820401
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 23:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tpd+23KG68DR for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 23:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 59263203EC
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 23:25:13 +0000 (UTC)
IronPort-SDR: /fec4wWocs5USb2N4Jmf0agSI3cZghbgLaKPXgCIJj7/p6anMU/DnydMno8JswXFmWH8A2SdOG
 LSlOHQzcZ5vw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 16:25:12 -0700
IronPort-SDR: q5U/8cOHnQLIs+eR3NNw74xmIUCV5cB6hNSTBtRZzvQWm6/JqNeOkA885f2wXsikKW9vvrws6f
 39DoKFsTdsSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="394528485"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 16:25:12 -0700
Date: Fri, 27 Mar 2020 16:30:57 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 09/10] iommu/ioasid: Support ioasid_set quota adjustment
Message-ID: <20200327163057.75a0e154@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED605@SHSMSX104.ccr.corp.intel.com>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-10-git-send-email-jacob.jun.pan@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED605@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Fri, 27 Mar 2020 10:09:04 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Sent: Thursday, March 26, 2020 1:56 AM
> > 
> > IOASID set is allocated with an initial quota, at runtime there may
> > be needs to balance IOASID resources among different VMs/sets.
> >   
> 
> I may overlook previous patches but I didn't see any place setting the
> initial quota...
> 
Initial quota is in place when the ioasid_set is allocated.

> > This patch adds a new API to adjust per set quota.  
> 
> since this is purely an internal kernel API, implies that the
> publisher (e.g. VFIO) is responsible for exposing its own uAPI to set
> the quota?
> 
yes, VFIO will do the adjustment. I think Alex suggested module
parameters.

> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/ioasid.c | 44
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/ioasid.h |  6 ++++++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> > index 27dce2cb5af2..5ac28862a1db 100644
> > --- a/drivers/iommu/ioasid.c
> > +++ b/drivers/iommu/ioasid.c
> > @@ -578,6 +578,50 @@ void ioasid_free_set(int sid, bool destroy_set)
> >  }
> >  EXPORT_SYMBOL_GPL(ioasid_free_set);
> > 
> > +/**
> > + * ioasid_adjust_set - Adjust the quota of an IOASID set
> > + * @quota:	Quota allowed in this set
> > + * @sid:	IOASID set ID to be assigned
> > + *
> > + * Return 0 on success. If the new quota is smaller than the
> > number of
> > + * IOASIDs already allocated, -EINVAL will be returned. No change
> > will be
> > + * made to the existing quota.
> > + */
> > +int ioasid_adjust_set(int sid, int quota)
> > +{
> > +	struct ioasid_set_data *sdata;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&ioasid_allocator_lock);
> > +	sdata = xa_load(&ioasid_sets, sid);
> > +	if (!sdata || sdata->nr_ioasids > quota) {
> > +		pr_err("Failed to adjust IOASID set %d quota %d\n",
> > +			sid, quota);
> > +		ret = -EINVAL;
> > +		goto done_unlock;
> > +	}
> > +
> > +	if (quota >= ioasid_capacity_avail) {
> > +		ret = -ENOSPC;
> > +		goto done_unlock;
> > +	}
> > +
> > +	/* Return the delta back to system pool */
> > +	ioasid_capacity_avail += sdata->size - quota;
> > +
> > +	/*
> > +	 * May have a policy to prevent giving all available
> > IOASIDs
> > +	 * to one set. But we don't enforce here, it should be in
> > the
> > +	 * upper layers.
> > +	 */
> > +	sdata->size = quota;
> > +
> > +done_unlock:
> > +	mutex_unlock(&ioasid_allocator_lock);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(ioasid_adjust_set);
> > 
> >  /**
> >   * ioasid_find - Find IOASID data
> > diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> > index 32d032913828..6e7de6fb91bf 100644
> > --- a/include/linux/ioasid.h
> > +++ b/include/linux/ioasid.h
> > @@ -73,6 +73,7 @@ int ioasid_alloc_set(struct ioasid_set *token,
> > ioasid_t quota, int *sid);
> >  void ioasid_free_set(int sid, bool destroy_set);
> >  int ioasid_find_sid(ioasid_t ioasid);
> >  int ioasid_notify(ioasid_t id, enum ioasid_notify_val cmd);
> > +int ioasid_adjust_set(int sid, int quota);
> > 
> >  #else /* !CONFIG_IOASID */
> >  static inline ioasid_t ioasid_alloc(int sid, ioasid_t min,
> > @@ -136,5 +137,10 @@ static inline int ioasid_alloc_system_set(int
> > quota) return -ENOTSUPP;
> >  }
> > 
> > +static inline int ioasid_adjust_set(int sid, int quota)
> > +{
> > +	return -ENOTSUPP;
> > +}
> > +
> >  #endif /* CONFIG_IOASID */
> >  #endif /* __LINUX_IOASID_H */
> > --
> > 2.7.4  
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
