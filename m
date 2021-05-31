Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B723958CE
	for <lists.iommu@lfdr.de>; Mon, 31 May 2021 12:17:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB35060A49;
	Mon, 31 May 2021 10:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXFijdszOYDW; Mon, 31 May 2021 10:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14F160A47;
	Mon, 31 May 2021 10:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A144CC0001;
	Mon, 31 May 2021 10:17:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91DECC0001
 for <iommu@lists.linux-foundation.org>; Mon, 31 May 2021 10:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8616F403A1
 for <iommu@lists.linux-foundation.org>; Mon, 31 May 2021 10:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="0/Aob5Vg";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="2TcAlmkj"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pORuZ-EeCCl for <iommu@lists.linux-foundation.org>;
 Mon, 31 May 2021 10:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADB6B4035B
 for <iommu@lists.linux-foundation.org>; Mon, 31 May 2021 10:16:58 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1622456214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XP/7cHDjM7AcyJT0WqOBpKhECSitGh7KPRl8GthYiCA=;
 b=0/Aob5Vgmmyc+nNO0ibkrtD6SKUV81urd1poAdJQq0E6QgJ7IVTVBzz2oALXMcMyDUVv/3
 eFRmkmF8eXTZdi6qd+pzWmlqdKp0KEOOOdr4o6sp7VdtidOo1wmQk9QWhTaTs+cRxlY3OJ
 k4iR54Z0HZT2rXBBXA+d5kGL4JltZBixqCoWufgxLa65muWnoGY/xD3XO5InjUk/e42a/Y
 ROVPWmHYgTQn9vEDwbZbY5K6/EsHGuwsAwUvEeCtaZDyUSl06Zsiny4Hu1g4uadYFdCHHz
 pjT2nh3GwdgQX5de/TA33ooJ/Om0a15zzvLheuyWAfs0HCRigYBvtf2xISt7EQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1622456214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XP/7cHDjM7AcyJT0WqOBpKhECSitGh7KPRl8GthYiCA=;
 b=2TcAlmkjnAj+YI85xX7piawpzztpkiaVA21gzmInASwrMGzjuHy8XqP/zXThQejPR+9L22
 SBeOo3NY5dLL9BBg==
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and
 remove update_pasid()
In-Reply-To: <YLShmFEzddfm7WQs@zn.tnic>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-10-git-send-email-fenghua.yu@intel.com>
 <87mtsd6gr9.ffs@nanos.tec.linutronix.de> <YLShmFEzddfm7WQs@zn.tnic>
Date: Mon, 31 May 2021 12:16:54 +0200
Message-ID: <87y2bv438p.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, H Peter Anvin <hpa@zytor.com>,
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

On Mon, May 31 2021 at 10:43, Borislav Petkov wrote:
> On Sat, May 29, 2021 at 11:17:30AM +0200, Thomas Gleixner wrote:
>> #2 is broken beyond repair. The comment in the code claims that it is safe
>>    to invoke this in an IPI, but that's just wishful thinking.
>> 
>>    FPU state of a running task is protected by fregs_lock() which is
>>    nothing else than a local_bh_disable(). As BH disabled regions run
>>    usually with interrupts enabled the IPI can hit a code section which
>>    modifies FPU state and there is absolutely no guarantee that any of the
>>    assumptions which are made for the IPI case is true.
>
> ... so on a PASID system, your trivial reproducer would theoretically
> fire the same way and corrupt FPU state just as well.

This is worse and you can't selftest it because the IPI can just hit in
the middle of _any_ FPU state operation and corrupt state.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
