Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 237AA1F9FB4
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 20:55:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BC2225075;
	Mon, 15 Jun 2020 18:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKjIEEDYDLRZ; Mon, 15 Jun 2020 18:55:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 85D8D24FFE;
	Mon, 15 Jun 2020 18:55:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A771C016E;
	Mon, 15 Jun 2020 18:55:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89AD4C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 583F425075
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndazAKCc2Wb3 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 18:55:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D323824FFE
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:55:29 +0000 (UTC)
IronPort-SDR: LgsKRjdNAPwqGTLTWjR7nxwHC1SiXhwgU54lqV7OktWmR7zfiO5FqcsOL+OLeTR6/fuJpqoEly
 6TTCUj0/jSpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 11:55:29 -0700
IronPort-SDR: 7AOfFl+Q9Zk9+pLDv+ctsLfdexol4Ooa9fms1lqtuvgDaDmflZdjgu5bI2sLLO96QFzKhPty0n
 Vry9GVkoZi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; d="scan'208";a="382630204"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 11:55:30 -0700
Date: Mon, 15 Jun 2020 11:55:29 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615185529.GD13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615183116.GD2531@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi, Peter,

On Mon, Jun 15, 2020 at 08:31:16PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 15, 2020 at 11:12:59AM -0700, Fenghua Yu wrote:
> > > I don't get why you need a rdmsr here, or why not having one would
> > > require a TIF flag. Is that because this MSR is XSAVE/XRSTOR managed?
> > 
> > My concern is TIF flags are precious (only 3 slots available). Defining
> > a new TIF flag may be not worth it while rdmsr() can check if PASID
> > is valid in the MSR. And performance here might not be a big issue
> > in #GP.
> > 
> > But if you think using TIF flag is better, I can define a new TIF flag
> > and maintain it per thread (init 0 when clone()/fork(), set 1 in fixup()).
> > Then we can avoid using rdmsr() to check valid PASID in the MSR.
> 
> WHY ?!?! What do you need a TIF flag for?

We need "a way" to check if the per thread MSR has a valid PASID. If yes,
no need to fix up the MSR (wrmsr()), and let other handler to handle the #GP.
Otherwise, apply the heuristics and fix up the MSR and exit the #GP.

The way to check the valid PASID in the MSR is rdmsr() in this series.
A TIF flag will be much faster than rdmsr() and seems a sutiable way
to check valid PASID status per thread. That's why it could replace
rdmsr() to check PASID in the MSR.

Or do you suggest to add a random new flag in struct thread_info instead
of a TIF flag?

Thanks.

-Fenghua

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
