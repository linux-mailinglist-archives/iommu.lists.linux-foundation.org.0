Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CB1F80D
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 17:58:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 68954CAF;
	Wed, 15 May 2019 15:58:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86C88481
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 15:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2ECD783A
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 15:58:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 08:58:17 -0700
X-ExtLoop1: 1
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by orsmga004.jf.intel.com with ESMTP; 15 May 2019 08:58:16 -0700
Date: Wed, 15 May 2019 08:56:37 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH v3 11/21] x86/watchdog/hardlockup: Add an HPET-based
	hardlockup detector
Message-ID: <20190515155637.GC10526@ranerica-svr.sc.intel.com>
References: <1557842534-4266-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1557842534-4266-12-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<62576937-50fc-fded-784b-d691e455dfc1@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62576937-50fc-fded-784b-d691e455dfc1@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Ricardo Neri <ricardo.neri@intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
	Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
	Andi Kleen <andi.kleen@intel.com>, Borislav Petkov <bp@suse.de>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Stephane Eranian <eranian@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Nayna Jain <nayna@linux.ibm.com>
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

On Tue, May 14, 2019 at 07:26:58AM -0700, Randy Dunlap wrote:
> On 5/14/19 7:02 AM, Ricardo Neri wrote:
> > diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
> > index 15d0fbe27872..376a5db81aec 100644
> > --- a/arch/x86/Kconfig.debug
> > +++ b/arch/x86/Kconfig.debug
> > @@ -169,6 +169,17 @@ config IOMMU_LEAK
> >  config HAVE_MMIOTRACE_SUPPORT
> >  	def_bool y
> >  
> > +config X86_HARDLOCKUP_DETECTOR_HPET
> > +	bool "Use HPET Timer for Hard Lockup Detection"
> > +	select SOFTLOCKUP_DETECTOR
> > +	select HARDLOCKUP_DETECTOR
> > +	select HARDLOCKUP_DETECTOR_CORE
> > +	depends on HPET_TIMER && HPET && X86_64
> > +	help
> > +	  Say y to enable a hardlockup detector that is driven by an High-
> 
> 	                                                       by a
> 
I'll correct.

Thanks and BR,
Ricardo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
