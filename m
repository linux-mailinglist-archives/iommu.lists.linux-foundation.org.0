Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34020BEAF9
	for <lists.iommu@lfdr.de>; Thu, 26 Sep 2019 05:49:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F34ADC6F;
	Thu, 26 Sep 2019 03:49:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE918B0B
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 03:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D83468D
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 03:49:19 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
	[209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 181EC796E0
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 03:49:19 +0000 (UTC)
Received: by mail-pf1-f198.google.com with SMTP id z13so785566pfr.15
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 20:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ShKNQbErac64XK8TSPHgRCKqoTFkkgB8tmVFA50VI9E=;
	b=Umo7cMKaRmRKdtpslSF/6IcVeVXeapEzs0OhBO0rdavQXWdSYA6R0amSO9kafrc2qd
	OlcHmpX6omJGfMyW15AIRH+LlFf1EyAGWXDMIR07lTSXdrmWTSlLtGIq6uhADIj7OT42
	EbiacEDKj5UpG+Ppim8en+JhjCX3nG2aRltTwcM+Q+I/BXS7OeCxsCvdos/ehPB1ErD+
	+JBjHHLOBmTRrPgSWnaN0TSge3YA10M4zkZPOGmzQf+xs1aJ4Lcf/VWvlePRZ2QwTssT
	rWs9eyL//QLzv3ZsEVWpCibVahLaE/ADwGVyYcN7VQC56BBWg7WCWl5oubvKGfT4iVmA
	RI6A==
X-Gm-Message-State: APjAAAUCVpjPnVpyrlYGridSk3PbcRlIKYqr2XW279/ktogpsgCcnqik
	xYpWscvQnWWKH/DqYFt3q/E0vzSxdWZ0/XdWJOMD1bkqgZcQXOmyjWRRaszaJNf5Au3AkpU10Bz
	19xDbnRR9UoCV0nL6M/317iF1KST9WA==
X-Received: by 2002:a63:df02:: with SMTP id u2mr1326652pgg.62.1569469758379;
	Wed, 25 Sep 2019 20:49:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs4/hDxEwwNdVu+EpMWqbEMaG9qmJxTI8+9ub9yU1tkFZwOu/oob4U27J3j3Xho1yCL2C8Xw==
X-Received: by 2002:a63:df02:: with SMTP id u2mr1326630pgg.62.1569469758054;
	Wed, 25 Sep 2019 20:49:18 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
	by smtp.gmail.com with ESMTPSA id f74sm576418pfa.34.2019.09.25.20.49.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 20:49:17 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:49:05 +0800
From: Peter Xu <peterx@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH 2/4] iommu/vt-d: Add first level page table interfaces
Message-ID: <20190926034905.GW28074@xz-x1>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122454.9888-3-baolu.lu@linux.intel.com>
	<20190925052157.GL28074@xz-x1>
	<c9792e0b-bf42-1dbb-f060-0b1a43125f47@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9792e0b-bf42-1dbb-f060-0b1a43125f47@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
	ashok.raj@intel.com, kvm@vger.kernel.org,
	sanjay.k.kumar@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, yi.y.sun@intel.com
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

On Thu, Sep 26, 2019 at 10:35:24AM +0800, Lu Baolu wrote:

[...]

> > > @@ -0,0 +1,342 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/**
> > > + * intel-pgtable.c - Intel IOMMU page table manipulation library
> > 
> > Could this be a bit misleading?  Normally I'll use "IOMMU page table"
> > to refer to the 2nd level page table only, and I'm always
> > understanding it as "the new IOMMU will understand MMU page table as
> > the 1st level".  At least mention "IOMMU 1st level page table"?
> > 
> 
> This file is a place holder for all code that manipulating iommu page
> tables (both first level and second level). Instead of putting
> everything in intel_iommu.c, let's make the code more structured so that
> it's easier for reading and maintaining. This is the motivation of this
> file.

I see.

> 
> > > + *
> > > + * Copyright (C) 2019 Intel Corporation
> > > + *
> > > + * Author: Lu Baolu <baolu.lu@linux.intel.com>
> > > + */
> > > +
> > > +#define pr_fmt(fmt)     "DMAR: " fmt
> > > +#include <linux/vmalloc.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/sched.h>
> > > +#include <linux/io.h>
> > > +#include <linux/export.h>
> > > +#include <linux/intel-iommu.h>
> > > +#include <asm/cacheflush.h>
> > > +#include <asm/pgtable.h>
> > > +#include <asm/pgalloc.h>
> > > +#include <trace/events/intel_iommu.h>
> > > +
> > > +#ifdef CONFIG_X86
> > > +/*
> > > + * mmmap: Map a range of IO virtual address to physical addresses.
> > 
> > "... to physical addresses using MMU page table"?
> > 
> > Might be clearer?
> 
> Yes.
> 
> > 
> > > + */
> > > +#define pgtable_populate(domain, nm)					\
> > > +do {									\
> > > +	void *__new = alloc_pgtable_page(domain->nid);			\
> > > +	if (!__new)							\
> > > +		return -ENOMEM;						\
> > > +	smp_wmb();							\
> > 
> > Could I ask what's this wmb used for?
> 
> Sure. This is answered by a comment in __pte_alloc() in mm/memory.c. Let
> me post it here.
> 
>         /*
>          * Ensure all pte setup (eg. pte page lock and page clearing) are
>          * visible before the pte is made visible to other CPUs by being
>          * put into page tables.
>          *
>          * The other side of the story is the pointer chasing in the page
>          * table walking code (when walking the page table without locking;
>          * ie. most of the time). Fortunately, these data accesses consist
>          * of a chain of data-dependent loads, meaning most CPUs (alpha
>          * being the notable exception) will already guarantee loads are
>          * seen in-order. See the alpha page table accessors for the
>          * smp_read_barrier_depends() barriers in page table walking code.
>          */
>         smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */

Ok.  I don't understand the rationale much behind but the comment
seems to make sense...  Could you help to comment above, like "please
reference to comment in __pte_alloc" above the line?

> 
> > 
> > > +	spin_lock(&(domain)->page_table_lock);				\
> > 
> > Is this intended to lock here instead of taking the lock during the
> > whole page table walk?  Is it safe?
> > 
> > Taking the example where nm==PTE: when we reach here how do we
> > guarantee that the PMD page that has this PTE is still valid?
> 
> We will always keep the non-leaf pages in the table,

I see.  Though, could I ask why?  It seems to me that the existing 2nd
level page table does not keep these when unmap, and it's not even use
locking at all by leveraging cmpxchg()?

> hence we only need
> a spin lock to serialize multiple tries of populating a entry for pde.
> As for pte, we can assume there is only single thread which can access
> it at a time because different mappings will have different iova's.

Ah yes sorry nm will never be pte here... so do you mean the upper
layer, e.g., the iova allocator will make sure the ranges to be mapped
will never collapse with each other so setting PTEs do not need lock?

> 
> > 
> > > +	if (nm ## _present(*nm)) {					\
> > > +		free_pgtable_page(__new);				\
> > > +	} else {							\
> > > +		set_##nm(nm, __##nm(__pa(__new) | _PAGE_TABLE));	\
> > 
> > It seems to me that PV could trap calls to set_pte().  Then these
> > could also be trapped by e.g. Xen?  Are these traps needed?  Is there
> > side effect?  I'm totally not familiar with this, but just ask aloud...
> 
> Good catch. But I don't think a vIOMMU could get a chance to run in a PV
> environment. I might miss something?

I don't know... Is there reason to not allow a Xen guest to use 1st
level mapping?

While on the other side... If the PV interface will never be used,
then could native_set_##nm() be used directly?

[...]

> > > +static struct page *
> > > +mmunmap_pte_range(struct dmar_domain *domain, pmd_t *pmd,
> > > +		  unsigned long addr, unsigned long end,
> > > +		  struct page *freelist, bool reclaim)
> > > +{
> > > +	int i;
> > > +	unsigned long start;
> > > +	pte_t *pte, *first_pte;
> > > +
> > > +	start = addr;
> > > +	pte = pte_offset_kernel(pmd, addr);
> > > +	first_pte = pte;
> > > +	do {
> > > +		set_pte(pte, __pte(0));
> > > +	} while (pte++, addr += PAGE_SIZE, addr != end);
> > > +
> > > +	domain_flush_cache(domain, first_pte, (void *)pte - (void *)first_pte);
> > > +
> > > +	/* Add page to free list if all entries are empty. */
> > > +	if (reclaim) {
> > 
> > Shouldn't we know whether to reclaim if with (addr, end) specified as
> > long as they cover the whole range of this PMD?
> 
> Current policy is that we don't reclaim any pages until the whole page
> table will be torn down.

Ah OK.  But I saw that you're passing in relaim==!start_addr.
Shouldn't that errornously trigger if one wants to unmap the 1st page
as well even if not the whole address space?

> The gain is that we don't have to use a
> spinlock when map/unmap a pmd entry anymore.

So this question should also related to above on the locking - have
you thought about using the same way (IIUC) as the 2nd level page
table to use cmpxchg()?  AFAIU that does not need any lock?

For me it's perfectly fine to use a lock at least for initial version,
I just want to know the considerations behind in case I missed
anything important.

Thanks,

-- 
Peter Xu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
