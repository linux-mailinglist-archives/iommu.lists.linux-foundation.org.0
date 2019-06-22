Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF574F428
	for <lists.iommu@lfdr.de>; Sat, 22 Jun 2019 09:23:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D1A3159D;
	Sat, 22 Jun 2019 07:23:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F643159D
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 07:23:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2BA54224
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 07:23:05 +0000 (UTC)
Received: from p5b06daab.dip0.t-ipconnect.de ([91.6.218.171] helo=nanos)
	by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1heaL9-0003VY-9L; Sat, 22 Jun 2019 09:21:35 +0200
Date: Sat, 22 Jun 2019 09:21:33 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [RFC PATCH v4 20/21] iommu/vt-d: hpet: Reserve an interrupt
	remampping table entry for watchdog
In-Reply-To: <20190621235541.GA25773@ranerica-svr.sc.intel.com>
Message-ID: <alpine.DEB.2.21.1906220920270.5503@nanos.tec.linutronix.de>
References: <1558660583-28561-21-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906162049300.1760@nanos.tec.linutronix.de>
	<alpine.DEB.2.21.1906171007360.1760@nanos.tec.linutronix.de>
	<CABPqkBTai76Bgb4E61tF-mJUkFNxVa4B8M2bxTEYVgBsuAANNQ@mail.gmail.com>
	<alpine.DEB.2.21.1906172343120.1963@nanos.tec.linutronix.de>
	<20190619084316.71ce5477@jacob-builder>
	<alpine.DEB.2.21.1906211732330.5503@nanos.tec.linutronix.de>
	<20190621103126.585ca6d3@jacob-builder>
	<20190621113938.1679f329@jacob-builder>
	<alpine.DEB.2.21.1906212201400.5503@nanos.tec.linutronix.de>
	<20190621235541.GA25773@ranerica-svr.sc.intel.com>
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
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>,
	Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, x86 <x86@kernel.org>,
	Ricardo Neri <ricardo.neri@intel.com>,
	Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Juergen Gross <jgross@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	iommu@lists.linux-foundation.org, Randy Dunlap <rdunlap@infradead.org>,
	Jacob Pan <jacob.jun.pan@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Andi Kleen <andi.kleen@intel.com>, Borislav Petkov <bp@suse.de>,
	Ingo Molnar <mingo@kernel.org>, Wincy Van <fanwenyi0529@gmail.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>
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

On Fri, 21 Jun 2019, Ricardo Neri wrote:
> On Fri, Jun 21, 2019 at 10:05:01PM +0200, Thomas Gleixner wrote:
> > On Fri, 21 Jun 2019, Jacob Pan wrote:
> > > > 
> > > I looked at the code again, seems the per cpu HPET code already taken
> > > care of HPET MSI management. Why can't we use IR-HPET-MSI chip and
> > > domain to allocate and set affinity etc.?
> > > Most APIC timer has ARAT not enough per cpu HPET, so per cpu HPET is
> > > not used mostly.
> > 
> > Sure, we can use that, but that does not allow to move the affinity from
> > NMI context either. Same issue with the IOMMU as with the other hack.
> 
> If I understand Thomas' point correctly, the problem is having to take
> lock in NMI context to update the IRTE for the HPET; both as in my hack
> and in the generic irq code. The problem is worse when using the generic
> irq code as there are several layers and several locks that need to be
> handled.

It does not matter how many locks are involved. One is enough to wedge the
machine.

Thanks,

	tglx


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
