Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C24AE18
	for <lists.iommu@lfdr.de>; Wed, 19 Jun 2019 00:48:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 616D1DB2;
	Tue, 18 Jun 2019 22:48:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15A17DB2
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0DCF180
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 15:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="160196241"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2019 15:48:22 -0700
Date: Tue, 18 Jun 2019 15:48:00 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v4 03/21] x86/hpet: Calculate ticks-per-second in a
	separate function
Message-ID: <20190618224800.GD30488@ranerica-svr.sc.intel.com>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-4-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906141749330.1722@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906141749330.1722@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>, x86@kernel.org,
	Ashok Raj <ashok.raj@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Randy Dunlap <rdunlap@infradead.org>, Clemens Ladisch <clemens@ladisch.de>,
	linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
	Ricardo Neri <ricardo.neri@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andi Kleen <andi.kleen@intel.com>, Borislav Petkov <bp@suse.de>,
	Ingo Molnar <mingo@kernel.org>
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

On Fri, Jun 14, 2019 at 05:54:05PM +0200, Thomas Gleixner wrote:
> On Thu, 23 May 2019, Ricardo Neri wrote:
> >  
> > +u64 hpet_get_ticks_per_sec(u64 hpet_caps)
> > +{
> > +	u64 ticks_per_sec, period;
> > +
> > +	period = (hpet_caps & HPET_COUNTER_CLK_PERIOD_MASK) >>
> > +		 HPET_COUNTER_CLK_PERIOD_SHIFT; /* fs, 10^-15 */
> > +
> > +	/*
> > +	 * The frequency is the reciprocal of the period. The period is given
> > +	 * in femtoseconds per second. Thus, prepare a dividend to obtain the
> > +	 * frequency in ticks per second.
> > +	 */
> > +
> > +	/* 10^15 femtoseconds per second */
> > +	ticks_per_sec = 1000000000000000ULL;
> > +	ticks_per_sec += period >> 1; /* round */
> > +
> > +	/* The quotient is put in the dividend. We drop the remainder. */
> > +	do_div(ticks_per_sec, period);
> > +
> > +	return ticks_per_sec;
> > +}
> > +
> >  int hpet_alloc(struct hpet_data *hdp)
> >  {
> >  	u64 cap, mcfg;
> > @@ -844,7 +867,6 @@ int hpet_alloc(struct hpet_data *hdp)
> >  	struct hpets *hpetp;
> >  	struct hpet __iomem *hpet;
> >  	static struct hpets *last;
> > -	unsigned long period;
> >  	unsigned long long temp;
> >  	u32 remainder;
> >  
> > @@ -894,12 +916,7 @@ int hpet_alloc(struct hpet_data *hdp)
> >  
> >  	last = hpetp;
> >  
> > -	period = (cap & HPET_COUNTER_CLK_PERIOD_MASK) >>
> > -		HPET_COUNTER_CLK_PERIOD_SHIFT; /* fs, 10^-15 */
> > -	temp = 1000000000000000uLL; /* 10^15 femtoseconds per second */
> > -	temp += period >> 1; /* round */
> > -	do_div(temp, period);
> > -	hpetp->hp_tick_freq = temp; /* ticks per second */
> > +	hpetp->hp_tick_freq = hpet_get_ticks_per_sec(cap);
> 
> Why are we actually computing this over and over?
> 
> In hpet_enable() which is the first function invoked we have:
> 
>         /*
>          * The period is a femto seconds value. Convert it to a
>          * frequency.
>          */
>         freq = FSEC_PER_SEC;
>         do_div(freq, hpet_period);
>         hpet_freq = freq;
> 
> So we already have ticks per second, aka frequency, right? So why do we
> need yet another function instead of using the value which is computed
> once? The frequency of the HPET channels has to be identical no matter
> what. If it's not HPET is broken beyond repair.

I don't think it needs to be recomputed again. I missed the fact that
the frequency was already computed here.

Also, the hpet char driver has its own frequency computation. Perhaps it
could also obtain it from here, right?

Thanks and BR,
Ricardo
> 
> Thanks,
> 
> 	tglx
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
