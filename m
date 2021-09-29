Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4841BC1B
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 03:16:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 502DF401EC;
	Wed, 29 Sep 2021 01:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cwz_3gr-SGRs; Wed, 29 Sep 2021 01:16:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2D43E40123;
	Wed, 29 Sep 2021 01:16:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1587C000D;
	Wed, 29 Sep 2021 01:16:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87451C000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 01:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62EBF60681
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 01:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFS7kqPHcMdq for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 01:16:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D069460662
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 01:16:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="224876125"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="224876125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 18:16:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="562791541"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 18:16:09 -0700
Date: Wed, 29 Sep 2021 01:16:08 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 4/8] x86/traps: Demand-populate PASID MSR via #GP
Message-ID: <YVO+WAqroakEYI/D@otcwcpicx3.sc.intel.com>
References: <035290e6-d914-a113-ea6c-e845d71069cf@intel.com>
 <YVNj8sm8iectc6iU@agluck-desk2.amr.corp.intel.com>
 <3f97b77e-a609-997b-3be7-f44ff7312b0d@intel.com>
 <YVN652x14dMgyE85@agluck-desk2.amr.corp.intel.com>
 <f6014b16-7b4c-cbb6-c975-1ec34092956f@intel.com>
 <YVOg7zgpdQlc7Zjt@agluck-desk2.amr.corp.intel.com>
 <YVOp60LOL+bfh3iT@otcwcpicx3.sc.intel.com>
 <YVOuYAFaTG6Khotb@agluck-desk2.amr.corp.intel.com>
 <ae7a12650d2741f9970449a08721a28e@intel.com>
 <a60c365c7bca4c84942086939fd988d1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a60c365c7bca4c84942086939fd988d1@intel.com>
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
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

Hi, Tony,

On Tue, Sep 28, 2021 at 06:06:52PM -0700, Luck, Tony wrote:
> >> 	fpregs_lock();
> >
> > I'm afraid we may hit the same locking issue when we send IPI to notify another task to modify its
> > PASID state. Here the API is called to modify another running task's PASID state as well without a right lock.
> > fpregs_lock() is not enough to deal with this, I'm afraid.
> 
> We don't send IPI any more to change PASID state. The only place that the
> current patch series touches the PASID MSR is in the #GP fault handler.

It's safe for the helpers to handle the PASID case (modifying the current task's
PASID state in #GP).

But the helpers seem to be generic. They take "task" as a parameter and
handle the task as non-current case. So the helpers are not for PASID only.
They may be used by others to modify a running task's FPU state. But
It's not safe to do so.

At least need some comments/restriction for the helpers to be used on
a running task?

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
