Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9444AE12
	for <lists.iommu@lfdr.de>; Wed, 19 Jun 2019 00:47:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC649E1A;
	Tue, 18 Jun 2019 22:47:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 469A1DB2
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:47:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E25CC180
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 22:47:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 15:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="160196036"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2019 15:47:16 -0700
Date: Tue, 18 Jun 2019 15:46:54 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v4 12/21] watchdog/hardlockup/hpet: Adjust timer
	expiration on the number of monitored CPUs
Message-ID: <20190618224654.GB30488@ranerica-svr.sc.intel.com>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-13-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906112205170.2214@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906112205170.2214@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ricardo Neri <ricardo.neri@intel.com>,
	Stephane Eranian <eranian@google.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Ashok Raj <ashok.raj@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	"Luis R. Rodriguez" <mcgrof@kernel.org>,
	David Rientjes <rientjes@google.com>, Andi Kleen <andi.kleen@intel.com>,
	Waiman Long <longman@redhat.com>, Borislav Petkov <bp@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>, Don Zickus <dzickus@redhat.com>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
	Byungchul Park <byungchul.park@lge.com>, Babu Moger <Babu.Moger@amd.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
	Tony Luck <tony.luck@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Jacob Pan <jacob.jun.pan@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Colin Ian King <colin.king@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
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

On Tue, Jun 11, 2019 at 10:11:04PM +0200, Thomas Gleixner wrote:
> On Thu, 23 May 2019, Ricardo Neri wrote:
> > @@ -52,10 +59,10 @@ static void kick_timer(struct hpet_hld_data *hdata, bool force)
> >  		return;
> >  
> >  	if (hdata->has_periodic)
> > -		period = watchdog_thresh * hdata->ticks_per_second;
> > +		period = watchdog_thresh * hdata->ticks_per_cpu;
> >  
> >  	count = hpet_readl(HPET_COUNTER);
> > -	new_compare = count + watchdog_thresh * hdata->ticks_per_second;
> > +	new_compare = count + watchdog_thresh * hdata->ticks_per_cpu;
> >  	hpet_set_comparator(hdata->num, (u32)new_compare, (u32)period);
> 
> So with this you might get close to the point where you trip over the SMI
> induced madness where CPUs vanish for several milliseconds in some value
> add code. You really want to do a read back of the hpet to detect that. See
> the comment in the hpet code. RHEL 7/8 allow up to 768 logical CPUs....

Do you mean adding a readback to check if the new compare value is
greater than the current count? Similar to the check at the end of
hpet_next_event():

	return res < HPET_MIN_CYCLES ? -ETIME : 0;

In such a case, should it try to set the comparator again? I think it
should, as otherwise the hardlockup detector would stop working.

Thanks and BR,
Ricardo
> 
> Thanks,
> 
> 	tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
