Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D91F90BD
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 09:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BC3D20404;
	Mon, 15 Jun 2020 07:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3miEbmr06Ay; Mon, 15 Jun 2020 07:57:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1DFB921F6F;
	Mon, 15 Jun 2020 07:57:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10901C016E;
	Mon, 15 Jun 2020 07:57:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C579C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A2B286F69
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8qYe3LoIWmw for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4A0E4870F4
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IulpOX2ZXgYia0hOJz1PbMFRWrf1LR01eti82WL5/mk=; b=oczihRk4Bm3qcABlCzOnJf+2OJ
 0XEBNhA69dQZfOVFjforrMajTMyU6oALzgTuDvb2GeMeG2T1r+tILte4kFI4uUu5taSMg3ym3qIXB
 /+SpsF9m/yFWIopT3APyh4HKoysD8lYUyRyOuZnjn6W8bh4lVl3p2NODhfXAJewux95NkSmBkzxEO
 RTgAZ+9Lvii0nNQJWkcQs7m3PJAYCZAAspLWgGZASo7fVIJQ8JP5TfSUCjCBOg204HN+5bc9ES9Xj
 +db4VuKfq1mznnM24NsJLQ4Z4kVaIXAZWi3u8V9+2eWuWqt6f5a7Pm9z7n/TEczt4pSpBO1v1vZes
 dhhuLDvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjz8-0005nK-Rt; Mon, 15 Jun 2020 07:56:51 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2D9D6301A32;
 Mon, 15 Jun 2020 09:56:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1903521059BE1; Mon, 15 Jun 2020 09:56:49 +0200 (CEST)
Date: Mon, 15 Jun 2020 09:56:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615075649.GK2497@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Jun 12, 2020 at 05:41:33PM -0700, Fenghua Yu wrote:
> +/*
> + * Apply some heuristics to see if the #GP fault was caused by a thread
> + * that hasn't had the IA32_PASID MSR initialized.  If it looks like that
> + * is the problem, try initializing the IA32_PASID MSR. If the heuristic
> + * guesses incorrectly, take one more #GP fault.

How is that going to help? Aren't we then going to run this same
heuristic again and again and again?

> + */
> +bool __fixup_pasid_exception(void)
> +{
> +	u64 pasid_msr;
> +	unsigned int pasid;
> +
> +	/*
> +	 * This function is called only when this #GP was triggered from user
> +	 * space. So the mm cannot be NULL.
> +	 */
> +	pasid = current->mm->pasid;
> +	/* If the mm doesn't have a valid PASID, then can't help. */
> +	if (invalid_pasid(pasid))
> +		return false;
> +
> +	/*
> +	 * Since IRQ is disabled now, the current task still owns the FPU on

That's just weird and confusing. What you want to say is that you rely
on the exception disabling the interrupt.

> +	 * this CPU and the PASID MSR can be directly accessed.
> +	 *
> +	 * If the MSR has a valid PASID, the #GP must be for some other reason.
> +	 *
> +	 * If rdmsr() is really a performance issue, a TIF_ flag may be
> +	 * added to check if the thread has a valid PASID instead of rdmsr().

I don't understand any of this. Nobody except us writes to this MSR, we
should bloody well know what's in it. What gives?

> +	 */
> +	rdmsrl(MSR_IA32_PASID, pasid_msr);
> +	if (pasid_msr & MSR_IA32_PASID_VALID)
> +		return false;
> +
> +	/* Fix up the MSR if the MSR doesn't have a valid PASID. */
> +	wrmsrl(MSR_IA32_PASID, pasid | MSR_IA32_PASID_VALID);
> +
> +	return true;
> +}
> -- 
> 2.19.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
