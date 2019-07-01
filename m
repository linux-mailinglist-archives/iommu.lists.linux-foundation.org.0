Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7CE495AB
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 01:08:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF94ECC8;
	Mon, 17 Jun 2019 23:08:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E4562C
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 23:08:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 38967832
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 23:08:22 +0000 (UTC)
Received: from p5b06daab.dip0.t-ipconnect.de ([91.6.218.171] helo=nanos)
	by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1hd0jQ-00009H-2G; Tue, 18 Jun 2019 01:08:08 +0200
Date: Tue, 18 Jun 2019 01:08:06 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Stephane Eranian <eranian@google.com>
Subject: Re: [RFC PATCH v4 20/21] iommu/vt-d: hpet: Reserve an interrupt
	remampping table entry for watchdog
In-Reply-To: <CABPqkBTai76Bgb4E61tF-mJUkFNxVa4B8M2bxTEYVgBsuAANNQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1906172343120.1963@nanos.tec.linutronix.de>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-21-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906162049300.1760@nanos.tec.linutronix.de>
	<alpine.DEB.2.21.1906171007360.1760@nanos.tec.linutronix.de>
	<CABPqkBTai76Bgb4E61tF-mJUkFNxVa4B8M2bxTEYVgBsuAANNQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
	SHORTCIRCUIT=-0.0001
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Ricardo Neri <ricardo.neri@intel.com>, Ingo Molnar <mingo@kernel.org>,
	Wincy Van <fanwenyi0529@gmail.com>,
	Ashok Raj <ashok.raj@intel.com>, x86 <x86@kernel.org>,
	Andi Kleen <andi.kleen@intel.com>, Borislav Petkov <bp@suse.de>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Juergen Gross <jgross@suse.com>, Tony Luck <tony.luck@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>
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

Stephane,

On Mon, 17 Jun 2019, Stephane Eranian wrote:
> On Mon, Jun 17, 2019 at 1:25 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> > Great that there is no trace of any mail from Andi or Stephane about this
> > on LKML. There is no problem with talking offlist about this stuff, but
> > then you should at least provide a rationale for those who were not part of
> > the private conversation.
> >
> Let me add some context to this whole patch series. The pressure on the
> core PMU counters is increasing as more people want to use them to
> measure always more events. When the PMU is overcommitted, i.e., more
> events than counters for them, there is multiplexing. It comes with an
> overhead that is too high for certain applications. One way to avoid this
> is to lower the multiplexing frequency, which is by default 1ms, but that
> comes with loss of accuracy. Another approach is to measure only a small
> number of events at a time and use multiple runs, but then you lose
> consistent event view. Another approach is to push for increasing the
> number of counters. But getting new hardware counters takes time. Short
> term, we can investigate what it would take to free one cycle-capable
> counter which is commandeered by the hard lockup detector on all X86
> processors today. The functionality of the watchdog, being able to get a
> crash dump on kernel deadlocks, is important and we cannot simply disable
> it. At scale, many bugs are exposed and thus machines
> deadlock. Therefore, we want to investigate what it would take to move
> the detector to another NMI-capable source, such as the HPET because the
> detector does not need high low granularity timer and interrupts only
> every 2s.

I'm well aware about the reasons for this.

> Furthermore, recent Intel erratum, e.g., the TSX issue forcing the TFA
> code in perf_events, have increased the pressure even more with only 3
> generic counters left. Thus, it is time to look at alternative ways of
> getting a hard lockup detector (NMI watchdog) from another NMI source
> than the PMU. To that extent, I have been discussing about alternatives.
>
> Intel suggested using the HPET and Ricardo has been working on
> producing this patch series. It is clear from your review
> that the patches have issues, but I am hoping that they can be
> resolved with constructive feedback knowing what the end goal is.

Well, I gave constructive feedback from the very first version on. But
essential parts of that feedback have been ignored for whatever reasons.

> As for the round-robin changes, yes, we discussed this as an alternative
> to avoid overloading CPU0 with handling all of the work to broadcasting
> IPI to 100+ other CPUs.

I can understand the reason why you don't want to do that, but again, I
said way before this was tried that changing affinity from NMI context with
the IOMMU cannot work by just calling into the iommu code and it needs some
deep investigation with the IOMMU wizards whether a preallocated entry can
be used lockless (including the subsequently required flush).

The outcome is that the change was implemented by simply calling into
functions which I told that they cannot be called from NMI context.

Unless this problem is not solved and I doubt it can be solved after
talking to IOMMU people and studying manuals, the round robin mechanics in
the current form are not going to happen. We'd need a SMI based lockup
detector to debug the resulting livelock wreckage.

There are two possible options:

  1) Back to the IPI approach

     The probem with broadcast is that it sends IPIs one by one to each
     online CPU, which sums up with a large number of CPUs.

     The interesting question is why the kernel does not utilize the all
     excluding self destination shorthand for this. The SDM is not giving
     any information.

     But there is a historic commit which is related and gives a hint:

        commit e77deacb7b078156fcadf27b838a4ce1a65eda04
        Author: Keith Owens <kaos@sgi.com>
        Date:   Mon Jun 26 13:59:56 2006 +0200

        [PATCH] x86_64: Avoid broadcasting NMI IPIs
    
        On some i386/x86_64 systems, sending an NMI IPI as a broadcast will
    	reset the system.  This seems to be a BIOS bug which affects
    	machines where one or more cpus are not under OS control.  It
    	occurs on HT systems with a version of the OS that is not compiled
    	without HT support.  It also occurs when a system is booted with
    	max_cpus=n where 2 <= n < cpus known to the BIOS.  The fix is to
    	always send NMI IPI as a mask instead of as a broadcast.

    I can see the issue with max_cpus and that'd be trivial to solve by
    disabling the HPET watchdog when maxcpus < num_present_cpus is on the
    command line (That's broken anyway with respect to MCEs. See the stupid
    dance we need to do for 'nosmt').

    Though the HT part of the changelog is unparseable garbage but might be
    a cryptic hint to the 'nosmt' mess. Though back then we did not have
    a way to disable the siblings (or did we?). Weird...

    It definitely would be worthwhile to experiment with that. if we could
    use shorthands (also for regular IPIs) that would be a great
    improvement in general and would nicely solve that NMI issue. Beware of
    the dragons though.

  2) Delegate round robin to irq_work

    Use the same mechanism as perf for stuff which needs to be done outside
    of NMI context.

    That can solve the issue, but the drawback is that in case the NMI hits
    a locked up interrupt disabled region the affinity stays on the same
    CPU as the regular IPI which kicks the irq work is not going to be
    handled.  Might not be a big issue as we could detect the situation
    that the IPI comes back to the same CPU. Not pretty and lots of nasty
    corner case and race condition handling.

    There is another issue with that round robin scheme as I pointed out to
    Ricardo:

      With a small watchdog threshold and tons of CPUs the time to switch
      the affinity becomes short. That brings the HPET reprogramming (in
      case of oneshot) into the SMI endagered zone and aside of that it
      will eat performance as well because with lets say 1 second threshold
      and 1000 CPUs we are going to flush the interrupt remapping
      table/entry once per millisecond. No idea how big the penalty is, but
      it's certainly not free.

    One possible way out would be to use a combined approach of building
    CPU groups (lets say 8) where one of the CPUs gets the NMI and IPIs the
    other 7 and then round robins to the next group. Whether that's any
    better, I can't tell.

Sorry that I can't come up with the magic cure and just can provide more
questions than answers.

Thanks,

	tglx



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
