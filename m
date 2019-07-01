Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5E4EC1B
	for <lists.iommu@lfdr.de>; Fri, 21 Jun 2019 17:34:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EC96DD99;
	Fri, 21 Jun 2019 15:34:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08EFBCC6
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 15:34:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 928E5831
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 15:34:48 +0000 (UTC)
Received: from p5b06daab.dip0.t-ipconnect.de ([91.6.218.171] helo=nanos)
	by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1heLXd-00065k-Gq; Fri, 21 Jun 2019 17:33:29 +0200
Date: Fri, 21 Jun 2019 17:33:28 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Jacob Pan <jacob.jun.pan@intel.com>
Subject: Re: [RFC PATCH v4 20/21] iommu/vt-d: hpet: Reserve an interrupt
	remampping table entry for watchdog
In-Reply-To: <20190619084316.71ce5477@jacob-builder>
Message-ID: <alpine.DEB.2.21.1906211732330.5503@nanos.tec.linutronix.de>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<1558660583-28561-21-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<alpine.DEB.2.21.1906162049300.1760@nanos.tec.linutronix.de>
	<alpine.DEB.2.21.1906171007360.1760@nanos.tec.linutronix.de>
	<CABPqkBTai76Bgb4E61tF-mJUkFNxVa4B8M2bxTEYVgBsuAANNQ@mail.gmail.com>
	<alpine.DEB.2.21.1906172343120.1963@nanos.tec.linutronix.de>
	<20190619084316.71ce5477@jacob-builder>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
	SHORTCIRCUIT=-0.0001
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00
	autolearn=unavailable version=3.3.1
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
	iommu@lists.linux-foundation.org,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Andi Kleen <andi.kleen@intel.com>, Borislav Petkov <bp@suse.de>,
	Ingo Molnar <mingo@kernel.org>, Wincy Van <fanwenyi0529@gmail.com>
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

On Wed, 19 Jun 2019, Jacob Pan wrote:
> On Tue, 18 Jun 2019 01:08:06 +0200 (CEST)
> Thomas Gleixner <tglx@linutronix.de> wrote:
> > 
> > Unless this problem is not solved and I doubt it can be solved after
> > talking to IOMMU people and studying manuals,
>
> I agree. modify irte might be done with cmpxchg_double() but the queued
> invalidation interface for IRTE cache flush is shared with DMA and
> requires holding a spinlock for enque descriptors, QI tail update etc.
> 
> Also, reserving & manipulating IRTE slot for hpet via backdoor might not
> be needed if the HPET PCI BDF (found in ACPI) can be utilized. But it
> might need more work to add a fake PCI device for HPET.

What would PCI/BDF solve?

Thanks,

	tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
