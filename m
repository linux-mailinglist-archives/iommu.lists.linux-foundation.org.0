Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBD1BB172
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 00:19:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D1138589C;
	Mon, 27 Apr 2020 22:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wqWXtlLOk1D; Mon, 27 Apr 2020 22:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22911858B6;
	Mon, 27 Apr 2020 22:19:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09DCFC08A6;
	Mon, 27 Apr 2020 22:19:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9045C003B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D20598589C
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh5TZUfkq8hU for <iommu@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 22:19:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AF31854DF
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:19:22 +0000 (UTC)
IronPort-SDR: gCELW3y6sf1AYPyTBrim452C2aL6m2dmYkkhpGFwz6UvuHVeVcP7s0EITpNlTroTZ3ys7lqW/J
 6gmbECYmkSzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 15:19:21 -0700
IronPort-SDR: BFmJTyB98rA6mgCORWnTzUTjoDeK1ZBZg5m2FQFa7vx5ekRq+U/gnzi9yqFs2Ublnezg9760tu
 56TLnBdbWElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="275629371"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga002.jf.intel.com with ESMTP; 27 Apr 2020 15:19:21 -0700
Date: Mon, 27 Apr 2020 15:18:25 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 5/7] x86/mmu: Allocate/free PASID
Message-ID: <20200427221825.GF242333@romley-ivt3.sc.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-6-git-send-email-fenghua.yu@intel.com>
 <87pnbus3du.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pnbus3du.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Sun, Apr 26, 2020 at 04:55:25PM +0200, Thomas Gleixner wrote:
> Fenghua Yu <fenghua.yu@intel.com> writes:
> > +++ b/arch/x86/include/asm/mmu.h @@ -50,6 +50,10 @@ typedef struct {
> >  	u16 pkey_allocation_map; s16 execute_only_pkey;
> >  #endif
> > + +#ifdef CONFIG_INTEL_IOMMU_SVM +	int pasid;
> 
> int? It's a value which gets programmed into the MSR along with the valid 
> bit (bit 31) set.

The pasid is defined as "int" in struct intel_svm and in 
intel_svm_bind_mm() and intel_svm_unbind_mm(). So the pasid defined in this 
patch follows the same type defined in those places.

But as you pointed out below, ioasid_t is defined as "unsigned int".

> 
> >  extern void switch_mm(struct mm_struct *prev, struct mm_struct *next, 
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c 
> > index d7f2a5358900..da718a49e91e 100644 --- a/drivers/iommu/intel-svm.c 
> > +++ b/drivers/iommu/intel-svm.c @@ -226,6 +226,45 @@ static 
> > LIST_HEAD(global_svm_list);
> >  	list_for_each_entry((sdev), &(svm)->devs, list)	\
> >  		if ((d) != (sdev)->dev) {} else
> >  
> > +/* + * If this mm already has a PASID we can use it. Otherwise 
> > allocate a new one. + * Let the caller know if we did an allocation via 
> > 'new_pasid'. + */ +static int alloc_pasid(struct intel_svm *svm, struct 
> > mm_struct *mm, + int pasid_max, bool *new_pasid, int flags)
> 
> Again, data types please. flags are generally unsigned and not plain int. 
> Also pasid_max is certainly not plain int either.

The caller defines pasid_max and flags as "int". This function just follows
the caller's definitions.

But I will change their definitions to "unsigned int" here.

> 
> > + *new_pasid = false; + + return mm->context.pasid; + } + + /* + * 
> > Allocate a new pasid. Do not use PASID 0, reserved for RID to + * 
> > PASID. + */ + pasid = ioasid_alloc(NULL, PASID_MIN, pasid_max - 1, 
> > svm);
> 
> ioasid_alloc() uses ioasid_t which is
> 
> typedef unsigned int ioasid_t;
> 
> Can we please have consistent types and behaviour all over the place?

Should I just define "pasid", "pasid_max", "flags" as "unsigned int" for
the new functions/code?

Or should I also change their types to "unsigned int" in the original
svm code (struct intel_svm, ...bind_mm(), etc)? I'm afraid that will be
a lot of changes and should be in a separate preparation patch.

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
