Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 850874158BA
	for <lists.iommu@lfdr.de>; Thu, 23 Sep 2021 09:05:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33A74067E;
	Thu, 23 Sep 2021 07:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXTPI47jH_nq; Thu, 23 Sep 2021 07:05:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23DF9406B7;
	Thu, 23 Sep 2021 07:05:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E12FC0022;
	Thu, 23 Sep 2021 07:05:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1CB5C000D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 07:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE4EA4028C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 07:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpwgmuw5DTRC for <iommu@lists.linux-foundation.org>;
 Thu, 23 Sep 2021 07:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA87340151
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MKyCSBe17569FQKUN9uYPzsBrtR6yhh1quExeWYo6x0=; b=Gpo+PfTGtMC8bYFUnWTsGSG9j4
 s0FMMEqMgrIKFtOlEb1F7pdyyPMDdV/ByQsx8MU5bOf0DloJ2sUkVZzUHKyZmltUO7uj6Gvp16LFJ
 HzH1RQJch2GuXtgFu25vuzUer5+PypWZps9jjdO38l7Ts0bHfeFcfLuVmWBxvwGbyu/eexrndoLOm
 7Zdm0mQJizR2xX/uV+yvZWC6rVtg8r/VufBfqnFYKOVN//+5UnOyeVvQjC6pm9Og67M3R7tJ2Vbpm
 H21id5PPRfLhs+xu2hrA483NLoPQ0CeOjeb8Tdk/BW53H313pr55NgNPo8HpRQfHxdyjaNdUox+ki
 9A9HDhZQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTImz-005AUz-Fy; Thu, 23 Sep 2021 07:05:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1631C300250;
 Thu, 23 Sep 2021 09:05:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F102F2C0D22ED; Thu, 23 Sep 2021 09:05:00 +0200 (CEST)
Date: Thu, 23 Sep 2021 09:05:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 4/8] x86/traps: Demand-populate PASID MSR via #GP
Message-ID: <YUwnHDUKfvNKQgPF@hirez.programming.kicks-ass.net>
References: <20210920192349.2602141-1-fenghua.yu@intel.com>
 <20210920192349.2602141-5-fenghua.yu@intel.com>
 <20210922210722.GV4323@worktop.programming.kicks-ass.net>
 <20210922211145.GF5106@worktop.programming.kicks-ass.net>
 <a5944e66-0552-d919-bd11-d9eced48bb45@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5944e66-0552-d919-bd11-d9eced48bb45@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
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

On Wed, Sep 22, 2021 at 02:33:09PM -0700, Dave Hansen wrote:
> On 9/22/21 2:11 PM, Peter Zijlstra wrote:
> >>> +static bool fixup_pasid_exception(void)
> >>> +{
> >>> +	if (!cpu_feature_enabled(X86_FEATURE_ENQCMD))
> >>> +		return false;
> >>> +
> >>> +	return __fixup_pasid_exception();
> >>> +}
> > That is, shouldn't the above at the very least decode the instruction
> > causing the #GP and check it's this ENQCMD thing?
> 
> To reiterate: on systems with no X86_FEATURE_ENQCMD, there is basically
> no additional overhead.  It isn't worth doing decoding there.

Well, they won't get past the X86_FEATURE check anyway, so who cares.

> On systems with X86_FEATURE_ENQCMD, but where it is unused, the #GP
> handler gets some new overhead on every #GP.  Basically:
> 
> > +	pasid = current->mm->pasid;
> > +	if (pasid == PASID_DISABLED)
> > +		return false;
> 
> That's still pretty cheap.  Probably not worth doing decoding there either.
> 
> So, that leaves us with if you are:
> 1. On system with X86_FEATURE_ENQCMD
> 2. In a process/mm that has an allocated pasid
> 3. Your *task* does not have the MSR set
> 4. You get a #GP for some other reason
> 
> Then, you'll do this double-#GP dance.
> 
> So, instruction decoding could absolutely be added between steps 3 and
> 4.  It would absolutely save doing the double-#GP in cases where 1/2/3
> are met.  But, I wouldn't move it up above and of the 1/2/3 checks
> because they're way cheaper than instruction decoding.
> 
> In the end, it didn't seem worth it to me to be optimizing a relatively
> rare path which 99% of the time ends up in a crash.
> 
> If you want instruction decoding in here, though, just say the word. :)

Instruction deoding makes it obvious you only consume your own #GP, the
alternative is a comment that explains this reasoning. Having neither
gets you confusion as per this thread.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
