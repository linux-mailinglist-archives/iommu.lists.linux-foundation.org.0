Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCED2853DB
	for <lists.iommu@lfdr.de>; Tue,  6 Oct 2020 23:26:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69538861F8;
	Tue,  6 Oct 2020 21:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEcMRM71cO0z; Tue,  6 Oct 2020 21:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB27985EA5;
	Tue,  6 Oct 2020 21:26:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D726C1AD6;
	Tue,  6 Oct 2020 21:26:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8772C0051
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 864612153E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucY1LDmNPh1h for <iommu@lists.linux-foundation.org>;
 Tue,  6 Oct 2020 21:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 68842207A1
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 21:26:24 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1602019582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9tgJmD3H+kQvwmmqg/DvlciSq+QY0pyLjKsrBXUuu/A=;
 b=cFZqIT7fnWiav7/ztiQ2eAZrNezy6ROUKWOKBglQIHXDFoiq3KUUqCJCc5Wp39X9/Eg/h+
 6DlYgVyjN9FUH/Z/swKRJ1r9WHK9/Wat8PDyz7jVThsRanPge08+fbZnY5oRymbD0eP6LT
 GsTabN4RzNPO0qgLhRxj8CmGRqE9UfFtO/PefUZd0Zis2ykaWtmw7jeg/rJEisMmQ726XB
 wHaOtOeTMSTZZD/TiVsJZGOGS8qcn/VaFUWw7A1ns2jX5CHxYeLPonhKtSMFIbgTUSP4fZ
 FTk2JISn0dEb5Ni3gQJz9230XCZuzW8A21AOyPT5rCiS+K4ngwGaMp28rWdfCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1602019582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9tgJmD3H+kQvwmmqg/DvlciSq+QY0pyLjKsrBXUuu/A=;
 b=icOFZZbqoBxXqalrREJjpN5TJ4yXrK7d43bToBL6O7AO9brurovFGjOxPaxYzqSMXBxJMR
 QbIvBKtz5ojRUsBQ==
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Subject: Re: [PATCH 07/13] irqdomain: Add max_affinity argument to
 irq_domain_alloc_descs()
In-Reply-To: <20201005152856.974112-7-dwmw2@infradead.org>
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
 <20201005152856.974112-1-dwmw2@infradead.org>
 <20201005152856.974112-7-dwmw2@infradead.org>
Date: Tue, 06 Oct 2020 23:26:22 +0200
Message-ID: <87lfgj59mp.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 iommu <iommu@lists.linux-foundation.org>, linux-hyperv@vger.kernel.org,
 kvm <kvm@vger.kernel.org>
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

On Mon, Oct 05 2020 at 16:28, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> This is the maximum possible set of CPUs which can be used. Use it
> to calculate the default affinity requested from __irq_alloc_descs()
> by first attempting to find the intersection with irq_default_affinity,
> or falling back to using just the max_affinity if the intersection
> would be empty.

And why do we need that as yet another argument?

This is an optional property of the irq domain, really and no caller has
any business with that. 

>  int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
> -			   int node, const struct irq_affinity_desc *affinity)
> +			   int node, const struct irq_affinity_desc *affinity,
> +			   const struct cpumask *max_affinity)
>  {
> +	cpumask_var_t default_affinity;
>  	unsigned int hint;
> +	int i;
> +
> +	/* Check requested per-IRQ affinities are in the possible range */
> +	if (affinity && max_affinity) {
> +		for (i = 0; i < cnt; i++)
> +			if (!cpumask_subset(&affinity[i].mask, max_affinity))
> +				return -EINVAL;

https://lore.kernel.org/r/alpine.DEB.2.20.1701171956290.3645@nanos

What is preventing the affinity spreading code from spreading the masks
out to unusable CPUs? The changelog is silent about that part.

> +	/*
> +	 * Generate default affinity. Either the possible subset of
> +	 * irq_default_affinity if such a subset is non-empty, or fall
> +	 * back to the provided max_affinity if there is no intersection.
..
> +	 * And just a copy of irq_default_affinity in the
> +	 * !CONFIG_CPUMASK_OFFSTACK case.

We know that already...

> +	 */
> +	memset(&default_affinity, 0, sizeof(default_affinity));

Right, memset() before allocating is useful.

> +	if ((max_affinity &&
> +	     !cpumask_subset(irq_default_affinity, max_affinity))) {
> +		if (!alloc_cpumask_var(&default_affinity, GFP_KERNEL))
> +			return -ENOMEM;
> +		cpumask_and(default_affinity, max_affinity,
> +			    irq_default_affinity);
> +		if (cpumask_empty(default_affinity))
> +			cpumask_copy(default_affinity, max_affinity);
> +	} else if (cpumask_available(default_affinity))
> +		cpumask_copy(default_affinity, irq_default_affinity);

That's garbage and unreadable.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
