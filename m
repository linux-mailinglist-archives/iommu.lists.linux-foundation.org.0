Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E945E4AE1A
	for <lists.iommu@lfdr.de>; Wed, 19 Jun 2019 00:48:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9CE59E21;
	Tue, 18 Jun 2019 22:48:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 84D27DD4
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1DC22180
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:48:37 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 15:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="160196298"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2019 15:48:36 -0700
Date: Tue, 18 Jun 2019 15:48:14 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v4 05/21] x86/hpet: Reserve timer for the HPET
	hardlockup detector
Message-ID: <20190618224814.GE30488@ranerica-svr.sc.intel.com>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-6-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906112152430.2214@nanos.tec.linutronix.de>
	<20190614011454.GA6347@ranerica-svr.sc.intel.com>
	<alpine.DEB.2.21.1906141726190.1722@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906141726190.1722@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Fri, Jun 14, 2019 at 06:10:18PM +0200, Thomas Gleixner wrote:
> On Thu, 13 Jun 2019, Ricardo Neri wrote:
> 
> > On Tue, Jun 11, 2019 at 09:54:25PM +0200, Thomas Gleixner wrote:
> > > On Thu, 23 May 2019, Ricardo Neri wrote:
> > > 
> > > > HPET timer 2 will be used to drive the HPET-based hardlockup detector.
> > > > Reserve such timer to ensure it cannot be used by user space programs or
> > > > for clock events.
> > > > 
> > > > When looking for MSI-capable timers for clock events, skip timer 2 if
> > > > the HPET hardlockup detector is selected.
> > > 
> > > Why? Both the changelog and the code change lack an explanation why this
> > > timer is actually touched after it got reserved for the platform. The
> > > reservation should make it inaccessible for other things.
> > 
> > hpet_reserve_platform_timers() will give the HPET char driver a data
> > structure which specifies which drivers are reserved. In this manner,
> > they cannot be used by applications via file opens. The timer used by
> > the hardlockup detector should be marked as reserved.
> > 
> > Also, hpet_msi_capability_lookup() populates another data structure
> > which is used when obtaining an unused timer for a HPET clock event.
> > The timer used by the hardlockup detector should not be included in such
> > data structure.
> > 
> > Is this the explanation you would like to see? If yes, I will include it
> > in the changelog.
> 
> Yes, the explanation makes sense. The code still sucks. Not really your
> fault, but this is not making it any better.
> 
> What bothers me most is the fact that CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
> removes one HPET timer unconditionally. It neither checks whether the hpet
> watchdog is actually enabled on the command line, nor does it validate
> upfront whether the HPET supports FSB delivery.
> 
> That wastes an HPET timer unconditionally for no value. Not that I
> personally care much about /dev/hpet, but some older laptops depend on HPET
> per cpu timers as the local APIC timer stops in C2/3. So this unconditional
> reservation will cause regressions for no reason.
> 
> The proper approach here is to:
> 
>  1) Evaluate the command line _before_ hpet_enable() is invoked
> 
>  2) Check the availability of FSB delivery in hpet_enable()
> 
> Reserve an HPET channel for the watchdog only when #1 and #2 are true.

Sure. I will add the explanation in the message commit and only reserve
the timer if both of the conditions above are met.

Thanks and BR,
Ricardo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
