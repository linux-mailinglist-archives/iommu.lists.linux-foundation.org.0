Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D34AE1B
	for <lists.iommu@lfdr.de>; Wed, 19 Jun 2019 00:49:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF0A7E28;
	Tue, 18 Jun 2019 22:48:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C18BDDE
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A236E180
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 15:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="160196365"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2019 15:48:56 -0700
Date: Tue, 18 Jun 2019 15:48:35 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v4 04/21] x86/hpet: Add hpet_set_comparator() for
	periodic and one-shot modes
Message-ID: <20190618224835.GF30488@ranerica-svr.sc.intel.com>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-5-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906142010230.1760@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906142010230.1760@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>, x86@kernel.org,
	Ashok Raj <ashok.raj@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Stephane Eranian <eranian@google.com>,
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

On Fri, Jun 14, 2019 at 08:17:14PM +0200, Thomas Gleixner wrote:
> On Thu, 23 May 2019, Ricardo Neri wrote:
> > +/**
> > + * hpet_set_comparator() - Helper function for setting comparator register
> > + * @num:	The timer ID
> > + * @cmp:	The value to be written to the comparator/accumulator
> > + * @period:	The value to be written to the period (0 = oneshot mode)
> > + *
> > + * Helper function for updating comparator, accumulator and period values.
> > + *
> > + * In periodic mode, HPET needs HPET_TN_SETVAL to be set before writing
> > + * to the Tn_CMP to update the accumulator. Then, HPET needs a second
> > + * write (with HPET_TN_SETVAL cleared) to Tn_CMP to set the period.
> > + * The HPET_TN_SETVAL bit is automatically cleared after the first write.
> > + *
> > + * For one-shot mode, HPET_TN_SETVAL does not need to be set.
> > + *
> > + * See the following documents:
> > + *   - Intel IA-PC HPET (High Precision Event Timers) Specification
> > + *   - AMD-8111 HyperTransport I/O Hub Data Sheet, Publication # 24674
> > + */
> > +void hpet_set_comparator(int num, unsigned int cmp, unsigned int period)
> > +{
> > +	if (period) {
> > +		unsigned int v = hpet_readl(HPET_Tn_CFG(num));
> > +
> > +		hpet_writel(v | HPET_TN_SETVAL, HPET_Tn_CFG(num));
> > +	}
> > +
> > +	hpet_writel(cmp, HPET_Tn_CMP(num));
> > +
> > +	if (!period)
> > +		return;
> 
> TBH, I hate this conditional handling. What's wrong with two functions?

There is probably nothing wrong with two functions. I can split it into
hpet_set_comparator_periodic() and hpet_set_comparator(). Perhaps the
latter is not needed as it would be a one-line function; you have
suggested earlier to avoid such small functions.
> 
> > +
> > +	/*
> > +	 * This delay is seldom used: never in one-shot mode and in periodic
> > +	 * only when reprogramming the timer.
> > +	 */
> > +	udelay(1);
> > +	hpet_writel(period, HPET_Tn_CMP(num));
> > +}
> > +EXPORT_SYMBOL_GPL(hpet_set_comparator);
> 
> Why is this exported? Which module user needs this?

It is not used anywhere else. I will remove this export.

Thanks and BR,

Ricardo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
