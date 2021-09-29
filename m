Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36B41CAE3
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 19:10:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17C8F4072F;
	Wed, 29 Sep 2021 17:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GEGCIh7C-e9; Wed, 29 Sep 2021 17:10:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 105D54072A;
	Wed, 29 Sep 2021 17:10:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D838AC000D;
	Wed, 29 Sep 2021 17:10:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A02C9C000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 17:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDA7414B9
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 17:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNZg_prErlCc for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 17:09:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 514B9406A6
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 17:09:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224650819"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="224650819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 10:07:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="563435641"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 10:07:54 -0700
Date: Wed, 29 Sep 2021 17:07:48 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 5/8] x86/mmu: Add mm-based PASID refcounting
Message-ID: <YVSdZGhbiqXbUaXV@otcwcpicx3.sc.intel.com>
References: <20210920192349.2602141-6-fenghua.yu@intel.com>
 <87y27nfjel.ffs@tglx>
 <YUyuEjlrcOeCp4qQ@agluck-desk2.amr.corp.intel.com>
 <87o88jfajo.ffs@tglx> <87k0j6dsdn.ffs@tglx>
 <YU3414QT0J7EN4w9@agluck-desk2.amr.corp.intel.com>
 <a77ee33c-6fa7-468c-8fc0-a0a2ce725e75@www.fastmail.com>
 <YVQ3wc/XjeOHpGCX@hirez.programming.kicks-ass.net>
 <87r1d78t2e.ffs@tglx> <57d0e4efcf2d4e9abb91801520a3f386@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57d0e4efcf2d4e9abb91801520a3f386@intel.com>
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Andy Lutomirski <luto@kernel.org>,
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

Hi, Thomas,

On Wed, Sep 29, 2021 at 09:51:15AM -0700, Luck, Tony wrote:
> > There is zero requirement to look at TIF_NEED_FPU_LOAD or
> > fpregs_state_valid() simply because the #GP comes straight from user
> > space which means the FPU registers contain the current tasks user space
> > state.
> 
> Just to double confirm ... there is no point in the #GP handler up to this point
> where pre-emption can occur?

Same question here. The fixup function is called after cond_local_irq_enable().
If an interrupt comes before fixup_pasid_exception(), the interrupt may
use FPU and call kernel_fpu_begin_mask()->set(TIF_NEED_FPU_LOAD)->
__cpu_invalidate_fpregs_state(). Then writing to the IA32_PASID MSR. When
exiting to user, the FPU states will be restored to the FPU regs including
the IA32_PASID MSR. So the MSR could be different from the value written in
fixup_pasid_execption(). Is it possible?

Or should fixup_pasid_exception() be called before cond_local_irq_enable()?

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
