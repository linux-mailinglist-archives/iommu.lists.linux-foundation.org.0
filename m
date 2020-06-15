Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0C1F90AF
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 09:53:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2159689380;
	Mon, 15 Jun 2020 07:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZJoBtAJoWm0; Mon, 15 Jun 2020 07:53:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8AD618937A;
	Mon, 15 Jun 2020 07:53:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CE28C016E;
	Mon, 15 Jun 2020 07:53:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 259F8C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0AD992077C
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3TEZ0u4U1Qp for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 3788A20404
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NFpMfrG9hSicO32ZjKxBqJx63rGzA3U+MKaGGKR/+vs=; b=AlyICsaSytn6UKQYHxgxKALtpV
 davZqqhBuoT/RALUO6rpXUvSYemJAE7crjXLyGQz3wbtvJTFfNaoi1Rglp6dVg2CZH9x4sLqemnu+
 JklbibNrlyLTx/g+gc6cJqZ8uENDkmFIgntMBecpf7QJUgDOcc4+Tj7zectWHzIWlHd3EuG7t814g
 +HYj3pC5QDAkoOzs/dcpjIJjYIHYvoTsSP0JEPJ1TUnTQ4+WpbTcVnJyVT/SF1TFsWwxusgVOJ9RB
 tHGz1xreZFmg2kBRIxtz3nKYW7EGfKHYpY+Xt6vG7x6b7wJGzxfsH3whAUU2bWyLmRByvFylgrVdv
 DZNY7+/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjvi-0005ii-KF; Mon, 15 Jun 2020 07:53:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 28ED530604B;
 Mon, 15 Jun 2020 09:53:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 107F021059BE3; Mon, 15 Jun 2020 09:53:13 +0200 (CEST)
Date: Mon, 15 Jun 2020 09:53:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615075313.GJ2497@hirez.programming.kicks-ass.net>
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
> @@ -447,6 +458,18 @@ dotraplinkage void do_general_protection(struct pt_regs *regs, long error_code)
>  	int ret;
>  
>  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "entry code didn't wake RCU");
> +
> +	/*
> +	 * Perform the check for a user mode PASID exception before enable
> +	 * interrupts. Doing this here ensures that the PASID MSR can be simply
> +	 * accessed because the contents are known to be still associated
> +	 * with the current process.
> +	 */
> +	if (user_mode(regs) && fixup_pasid_exception()) {
> +		cond_local_irq_enable(regs);
> +		return;

OK, so we're done with the exception, lets enable interrupts?

> +	}
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
