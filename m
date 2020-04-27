Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CD1BB218
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 01:44:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16DF487D48;
	Mon, 27 Apr 2020 23:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHrKXEDF+5fg; Mon, 27 Apr 2020 23:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4961887B77;
	Mon, 27 Apr 2020 23:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DDFFC003B;
	Mon, 27 Apr 2020 23:44:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C75DFC003B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B5BA787B77
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER-DkFPvd3QV for <iommu@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 23:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 169CF87B5D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:44:39 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jTDQE-0004J5-Fg; Tue, 28 Apr 2020 01:44:22 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id E009B100FC0; Tue, 28 Apr 2020 01:44:21 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH 5/7] x86/mmu: Allocate/free PASID
In-Reply-To: <20200427221825.GF242333@romley-ivt3.sc.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-6-git-send-email-fenghua.yu@intel.com>
 <87pnbus3du.fsf@nanos.tec.linutronix.de>
 <20200427221825.GF242333@romley-ivt3.sc.intel.com>
Date: Tue, 28 Apr 2020 01:44:21 +0200
Message-ID: <87d07spk8a.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Fenghua Yu <fenghua.yu@intel.com> writes:
> On Sun, Apr 26, 2020 at 04:55:25PM +0200, Thomas Gleixner wrote:
>> Fenghua Yu <fenghua.yu@intel.com> writes:
>> > + +#ifdef CONFIG_INTEL_IOMMU_SVM +	int pasid;
>> 
>> int? It's a value which gets programmed into the MSR along with the valid 
>> bit (bit 31) set.
>
> The pasid is defined as "int" in struct intel_svm and in 
> intel_svm_bind_mm() and intel_svm_unbind_mm(). So the pasid defined in this 
> patch follows the same type defined in those places.

Which are wrong to begin with.

>> ioasid_alloc() uses ioasid_t which is
>> 
>> typedef unsigned int ioasid_t;
>> 
>> Can we please have consistent types and behaviour all over the place?
>
> Should I just define "pasid", "pasid_max", "flags" as "unsigned int" for
> the new functions/code?
>
> Or should I also change their types to "unsigned int" in the original
> svm code (struct intel_svm, ...bind_mm(), etc)? I'm afraid that will be
> a lot of changes and should be in a separate preparation patch.

Yes, please. The existance of non-sensical code is not an excuse to
proliferate it.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
