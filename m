Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD11F9F5F
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 20:31:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5DCB87FBE;
	Mon, 15 Jun 2020 18:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaE7+CEODK9G; Mon, 15 Jun 2020 18:31:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BDCB88005;
	Mon, 15 Jun 2020 18:31:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 308DDC016E;
	Mon, 15 Jun 2020 18:31:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3294DC016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A18924E4B
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pXWrRenHGpI for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 18:31:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A7EC2280C
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0uaXx1a8X6ge6muz2Sp6fD7wbgSxal+3tZhrZaa6Nx0=; b=D0jY9gpNa4VuJV7CCVE0XGTQx+
 wFyrLfr7o8wDoY51qJTNQjm/4B8lqrCNzGQDtIaw4ik+p3fchHqc7GxZQo3PPjYkyaFuJN0vv+3BM
 2lQuY83HRICjGt/2OvYBHm3yWeok729oCC5gH6Ce1JzaIhM3P6pBkVkSZtPK8xvoWPiuvbFN6y7Wn
 Urz7U9kmgzIn63lIN4t/iFRfGFOxrO7VZC7rNkYDf7PaemLg1BDQRCIIRd845l7uL243G3Kxz+WFs
 Tlh3KXfKbIpNqHotyfOur8ysWtNG2ghRlTkgsgoiArC27XGJ1RhR25u1/kKY8q02E0olPt8AwdSSc
 AroCuvcA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkttA-0003xc-97; Mon, 15 Jun 2020 18:31:21 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D9C03003E1;
 Mon, 15 Jun 2020 20:31:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4B487203B815D; Mon, 15 Jun 2020 20:31:16 +0200 (CEST)
Date: Mon, 15 Jun 2020 20:31:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615183116.GD2531@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615181259.GC13792@romley-ivt3.sc.intel.com>
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

On Mon, Jun 15, 2020 at 11:12:59AM -0700, Fenghua Yu wrote:
> > I don't get why you need a rdmsr here, or why not having one would
> > require a TIF flag. Is that because this MSR is XSAVE/XRSTOR managed?
> 
> My concern is TIF flags are precious (only 3 slots available). Defining
> a new TIF flag may be not worth it while rdmsr() can check if PASID
> is valid in the MSR. And performance here might not be a big issue
> in #GP.
> 
> But if you think using TIF flag is better, I can define a new TIF flag
> and maintain it per thread (init 0 when clone()/fork(), set 1 in fixup()).
> Then we can avoid using rdmsr() to check valid PASID in the MSR.

WHY ?!?! What do you need a TIF flag for?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
