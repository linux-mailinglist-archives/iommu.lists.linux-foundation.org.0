Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163D1F90A9
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 09:52:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EABC08938C;
	Mon, 15 Jun 2020 07:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVyKENKKK6JM; Mon, 15 Jun 2020 07:52:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53C8489381;
	Mon, 15 Jun 2020 07:52:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 319F0C016E;
	Mon, 15 Jun 2020 07:52:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9F1CC016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A0B018842A
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSrGvkVGLoty for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:52:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2E0E88395
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IFIgfCZKxYBKxbJqOaOomXVh77FtYCcmEiPni2KP6UA=; b=PJLM8Zj6g6NZ+vPpv2mFDxYEVR
 ZjwG4jOU060O8kA/hZ3nBzvV0Ys1Ob067i4BJAzLXk0kJFvnTPk9HZv2N4bq1zlOx6kt6I0wYqNYD
 WxXEU7shn6V1Hnnc7bMPriYIGQJxK6my2wENuYqexpKzud2otelfOGiVZI8ThFKaGsZx3wAkFAehx
 xyuZg+PiJgIGmBooQprqIC07vu+0si6nXsW+gBniM0mtgDy0EY4XX2SW3mvm3WDBh0Zyo6E43wWXf
 h7zkeOgMVO5U0sw55sa+N7+9CXGuXOBfv7vXirugectMtOB6P+FPq3eo1CWbJiozbXhA4ITyj/cH5
 ElEiN+6w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjua-0001C1-5z; Mon, 15 Jun 2020 07:52:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A2710307458;
 Mon, 15 Jun 2020 09:52:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EF23021059BE4; Mon, 15 Jun 2020 09:52:02 +0200 (CEST)
Date: Mon, 15 Jun 2020 09:52:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 00/12] x86: tag application address space for devices
Message-ID: <20200615075202.GI2497@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
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

On Fri, Jun 12, 2020 at 05:41:21PM -0700, Fenghua Yu wrote:

> This series only provides simple and basic support for ENQCMD and the MSR:
> 1. Clean up type definitions (patch 1-3). These patches can be in a
>    separate series.
>    - Define "pasid" as "unsigned int" consistently (patch 1 and 2).
>    - Define "flags" as "unsigned int"
> 2. Explain different various technical terms used in the series (patch 4).
> 3. Enumerate support for ENQCMD in the processor (patch 5).
> 4. Handle FPU PASID state and the MSR during context switch (patches 6-7).
> 5. Define "pasid" in mm_struct (patch 8).
> 5. Clear PASID state for new mm and forked and cloned thread (patch 9-10).
> 6. Allocate and free PASID for a process (patch 11).
> 7. Fix up the PASID MSR in #GP handler when one thread in a process
>    executes ENQCMD for the first time (patches 12).

If this is per mm, should not switch_mm() update the MSR ? I'm not
seeing that, nor do I see it explained why not.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
