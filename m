Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5A2862CB
	for <lists.iommu@lfdr.de>; Wed,  7 Oct 2020 17:57:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E070E86AE6;
	Wed,  7 Oct 2020 15:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdM9RD0om5z0; Wed,  7 Oct 2020 15:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A514886AEA;
	Wed,  7 Oct 2020 15:57:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96D69C1AD6;
	Wed,  7 Oct 2020 15:57:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22360C0051
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D9958729E
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KegXFb5Bv8CX for <iommu@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 15:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B149B8729C
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:57:38 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1602086256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnPBz1OJFpV0mKJqGXK6GRDXNZF9JrWZUgg0vir1acc=;
 b=VGdNlmqx7yPh9sfJRzpimHFWF8Gs0mr7JUX/QAEshE1jLuxXjAbvVbWdjIDsq8sF2kPSHx
 CUkmeo+B4G9kX+A3vQsIBI6rJyrqQ11hReerdnEgo42KG/eklOqYG96HLjOdi92tsT6xH9
 2XzQYMEoYPGLrggtGrsEvLKt4s11VTki7G4wlJpEcu3XihrX0VZCiwQ++GbPGxvE8cGB7K
 B4/vbU7JqGOUXSFbfblCa8SjXk69KJMMIy85bGGesFf7q9q3pMOuOCdH+BMmqRp3qJHpyz
 tOaSle7ZPJ5pOf3tEYqgqbYv+JvvmIZ3uoGFRSYqkIbmOKi68b5Ln+gZQwQgQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1602086256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnPBz1OJFpV0mKJqGXK6GRDXNZF9JrWZUgg0vir1acc=;
 b=hXDIXyPGj9wUr/HsyDrHOm3so8vzT+6LzoPBCcenlb/EYUkLPcLUQ6DPKiUlq4KzY0OYS7
 kI1PPDly3kW5m0Bw==
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Subject: Re: [PATCH 07/13] irqdomain: Add max_affinity argument to
 irq_domain_alloc_descs()
In-Reply-To: <336029ca32524147a61b6fa1eb734debc9d51a00.camel@infradead.org>
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
 <20201005152856.974112-1-dwmw2@infradead.org>
 <20201005152856.974112-7-dwmw2@infradead.org>
 <87lfgj59mp.fsf@nanos.tec.linutronix.de>
 <75d79c50d586c18f0b1509423ed673670fc76431.camel@infradead.org>
 <87tuv640nw.fsf@nanos.tec.linutronix.de>
 <336029ca32524147a61b6fa1eb734debc9d51a00.camel@infradead.org>
Date: Wed, 07 Oct 2020 17:57:36 +0200
Message-ID: <87a6wy3u6n.fsf@nanos.tec.linutronix.de>
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

On Wed, Oct 07 2020 at 15:10, David Woodhouse wrote:
> On Wed, 2020-10-07 at 15:37 +0200, Thomas Gleixner wrote:
>> What is preventing you to change the function signature? But handing
>> down irqdomain here is not cutting it. The right thing to do is to
>> replace 'struct irq_affinity_desc *affinity' with something more
>> flexible.
>
> Yeah, although I do think I want to ditch this part completely, and
> treat the "possible" mask for the domain very much more like we do
> cpu_online_mask. In that we can allow affinities to be *requested*
> which are outside it, and they can just never be *effective* while
> those CPUs aren't present and reachable.

Huch?

> That way a lot of the nastiness about preparing an "acceptable" mask in
> advance can go away.

There is not lot's of nastiness.

> It's *also* driven, as I noted, by the realisation that on x86, the
> x86_non_ir_cpumask will only ever contain those CPUs which have been
> brought online so far and meet the criteria... but won't that be true
> on *any* system where CPU numbers are virtual and not 1:1 mapped with
> whatever determines reachability by the IRQ domain? It isn't *such* an
> x86ism, surely?

Yes, but that's exactly the reason why I don't want to have whatever
mask name you chose to be directly exposed and want it to be part of the
irq domains because then you can express arbitrary per domain limits.

>> Fact is, that if there are CPUs which cannot be targeted by device
>> interrupts then the multiqueue affinity mechanism has to be fixed to
>> handle this. Right now it's just broken.
>
> I think part of the problem there is that I don't really understand how
> this part is *supposed* to work. I was focusing on getting the simple
> case working first, in the expectation that we'd come back to that part
> ansd you'd keep me honest. Is there some decent documentation on this
> that I'm missing?

TLDR & HTF;

Multiqueue devices want to have at max 1 queue per CPU or if the device
has less queues than CPUs they want the queues to have a fixed
association to a set of CPUs.

At setup time this is established considering possible CPUs to handle
'physical' hotplug correctly.

If a queue has no online CPUs it cannot be started. If it's active and
the last CPU goes down then it's quiesced and stopped and the core code
shuts down the interrupt and does not move it to a still online CPU.

So with your hackery, we end up in a situation where we have a large
possible mask, but not all CPUs in that mask can be reached, which means
in a 1 queue per CPU scenario all unreachable CPUs would have
disfunctional queues.

So that spreading algorithm needs to know about this limitation.

>> So if you look at X86 then you have either:
>> 
>>    [VECTOR] ----------------- [IO/APIC]
>>                           |-- [MSI]
>>                           |-- [WHATEVER]
>> 
>> or
>> 
>>    [VECTOR] ---[REMAP]------- [IO/APIC]
>>              |            |-- [MSI]
>>              |----------------[WHATEVER]
>
> Hierarchically, theoretically the IOAPIC and HPET really ought to be
> children of the MSI domain. It's the Compatibility MSI which has the
> restriction on destination ID, because of how many bits it interprets
> from the MSI address. HPET and IOAPIC are just generating MSIs that hit
> that upstream limit.

We kinda have that, but not nicely abstracted. But we surely can and
should fix that.

>> So if REMAP allows cpu_possible_mask and VECTOR some restricted subset
>> then irqdomain_get_possible_affinity() will return the correct result
>> independent whether remapping is enabled or not.
>
w> Sure. Although VECTOR doesn't have the restriction. As noted, it's the
> Compatibility MSI that does. So the diagram looks something like this:
>
>  [ VECTOR ] ---- [ REMAP ] ---- [ IR-MSI ] ---- [ IR-HPET ]
>               |                             |---[ IR-PCI-MSI ]
>               |                             |---[ IR-IOAPIC ]
>               |
>               |--[ COMPAT-MSI ] ---- [ HPET ]
>                                  |-- [ PCI-MSI ]
>                                  |-- [ IOAPIC ]
>
>
> In this diagram, it's COMPAT-MSI that has the affinity restriction,
> inherited by its children.
>
> Now, I understand that you're not keen on IOAPIC actually being a child
> of the MSI domain, and that's fine. In Linux right now, those generic
> 'IR-MSI' and 'COMPAT-MSI' domains don't exist. So all three of the
> compatibility HPET, PCI-MSI and IOAPIC domains would have to add that
> same 8-bit affinity limit for themselves, as their parent is the VECTOR
> domain.

No. We fix it proper and not by hacking around it.

> I suppose it *might* not hurt to pretend that VECTOR does indeed have
> the limit, and to *remove* it in the remapping domain. And then the
> affinity limit could be removed in one place by the REMAP domain
> because even now in Linux's imprecise hierarchy, the IR-HPET, IR-PCI-
> MSI and IR-IOAPIC domains *are* children of that.

It's not rocket science to fix that as the irq remapping code already
differentiates between the device types.

Thanks,

        tglx


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
