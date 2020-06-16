Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9F1FC241
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 01:23:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14D6888A41;
	Tue, 16 Jun 2020 23:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wI2nZ7nFk5uw; Tue, 16 Jun 2020 23:23:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BFC888A37;
	Tue, 16 Jun 2020 23:23:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA2BC0895;
	Tue, 16 Jun 2020 23:23:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 568E3C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 23:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D87189551
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 23:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cPE-SQlp7la for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 23:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8C0AF89549
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 23:23:47 +0000 (UTC)
IronPort-SDR: Nd4u/bRgQK1ERcYh4DZx4qbBnvNk7snueLT8pXcz0Uh+Wj2aj98UeQnesFwg5IEWrc2OcU3hsb
 VD0sg4aLe/UA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 16:23:46 -0700
IronPort-SDR: PUdSL9s9aHkzES9vhHisJzVKu+uTZCb7Oi6VKOJd77E027eK2Hl4S07EMQa0cGcGT0pSq7Rw33
 qrXIWSr0CLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; d="scan'208";a="383022347"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2020 16:23:46 -0700
Date: Tue, 16 Jun 2020 16:23:46 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200616232345.GC15763@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
 <20200615185529.GD13792@romley-ivt3.sc.intel.com>
 <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
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

Hi, Peter,

On Mon, Jun 15, 2020 at 09:09:28PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 15, 2020 at 11:55:29AM -0700, Fenghua Yu wrote:
> 
> > Or do you suggest to add a random new flag in struct thread_info instead
> > of a TIF flag?
> 
> Why thread_info? What's wrong with something simple like the below. It
> takes a bit from the 'strictly current' flags word.
> 
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b62e6aaf28f0..fca830b97055 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -801,6 +801,9 @@ struct task_struct {
>  	/* Stalled due to lack of memory */
>  	unsigned			in_memstall:1;
>  #endif
> +#ifdef CONFIG_PCI_PASID
> +	unsigned			has_valid_pasid:1;
> +#endif
>  
>  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 142b23645d82..10b3891be99e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -955,6 +955,10 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>  	tsk->use_memdelay = 0;
>  #endif
>  
> +#ifdef CONFIG_PCI_PASID
> +	tsk->has_valid_pasid = 0;
> +#endif
> +
>  #ifdef CONFIG_MEMCG
>  	tsk->active_memcg = NULL;
>  #endif

Can I add "Signed-off-by: Peter Zijlstra <peterz@infradead.org>"
to this patch? I will send this patch in the next version of the series.

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
