Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C251F9FF0
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 21:09:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01C7C8623E;
	Mon, 15 Jun 2020 19:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPNLGneiF1U2; Mon, 15 Jun 2020 19:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 906DD86F22;
	Mon, 15 Jun 2020 19:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77A74C016E;
	Mon, 15 Jun 2020 19:09:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B550C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 12B0525075
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k+bLBed+UiUy for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 19:09:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 14A9A24E4B
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fqlg5vRi2+I+nrKU5A1wOWFzOs9FiP4c5PxmnzSYwA0=; b=gXa24hOmL3f4ENeQJul7Im5dEd
 w7ctb4wDsGweOpZvIkVt8UvddTn4QcOA8/Sq//DDvayT1tkNGm6cF7n7/TzqHktPh2J0tgKLu6mOZ
 sbQbVBqNpdagwsYXsG2pjFVVtclpy2gMGNcJJJ5UPhfC8hXm5fNDDQZG+4AvT3DidPZhREqrSPGJd
 FBGtX6NRwXmzIsq8pBkneXn34UhoJgnkgjV5aFRDKULI0jwRw6c8AxD24ev/a3M0W9v15SJdQqRu4
 gpAeiRnnH8kpDrKovMLILqON2rdxli7WzLoqN7h8KA+3tq6fotpaiNU8ucXkXoItZyFtOwFOuv7hd
 P4sIex2A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkuU7-0003Gj-L4; Mon, 15 Jun 2020 19:09:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7166301A32;
 Mon, 15 Jun 2020 21:09:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D1EA4201CB844; Mon, 15 Jun 2020 21:09:28 +0200 (CEST)
Date: Mon, 15 Jun 2020 21:09:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
 <20200615185529.GD13792@romley-ivt3.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615185529.GD13792@romley-ivt3.sc.intel.com>
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

On Mon, Jun 15, 2020 at 11:55:29AM -0700, Fenghua Yu wrote:

> Or do you suggest to add a random new flag in struct thread_info instead
> of a TIF flag?

Why thread_info? What's wrong with something simple like the below. It
takes a bit from the 'strictly current' flags word.


diff --git a/include/linux/sched.h b/include/linux/sched.h
index b62e6aaf28f0..fca830b97055 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -801,6 +801,9 @@ struct task_struct {
 	/* Stalled due to lack of memory */
 	unsigned			in_memstall:1;
 #endif
+#ifdef CONFIG_PCI_PASID
+	unsigned			has_valid_pasid:1;
+#endif
 
 	unsigned long			atomic_flags; /* Flags requiring atomic access. */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 142b23645d82..10b3891be99e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -955,6 +955,10 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	tsk->use_memdelay = 0;
 #endif
 
+#ifdef CONFIG_PCI_PASID
+	tsk->has_valid_pasid = 0;
+#endif
+
 #ifdef CONFIG_MEMCG
 	tsk->active_memcg = NULL;
 #endif
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
