Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C63A20D8
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 01:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31DA60624;
	Wed,  9 Jun 2021 23:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkBPtEOE3kr9; Wed,  9 Jun 2021 23:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 09C50606DE;
	Wed,  9 Jun 2021 23:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B10B5C000B;
	Wed,  9 Jun 2021 23:34:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2707C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 23:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B602540569
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 23:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23oNjG9zcmyc for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 23:34:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28B5C40552
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 23:34:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8478613EA;
 Wed,  9 Jun 2021 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623281672;
 bh=v/OMLrZ7k1ho5plhz+nTklqFfax/AAUTQJ3FLEHqrb0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=r9XhoTnmXYMSJWHKIs4KYbb8PWWQYhZlDxwpUA22hukjgfvytH2lFZD4XcBmLtMjF
 j0817xJ70upRSk0Ooh8FXVR4T54Kpo7OjI5dPSI33iXoAV3PN3VmKzYGuEUN2hLyeV
 J0ePjL2Cq9nCeturi+r/eUzOTYRLYPeYqPr3629SglOJfmYpIqtC1M/OD6zFgLSpat
 VJA6gtDMJNrjiaXaJbYZ7u6lQjaVV9W+TS0fi+wTmGeDpczh0uDBthEcJ7gbyfAaAg
 885L/ML0f2Xnh4Afw7IXB8whR5z3zfNUFzK1qY8M4nyKB21xt8VmQGffXUTneBMTjn
 o34O/maI4AiDg==
Subject: Re: [PATCH] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and
 remove update_pasid()
To: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-10-git-send-email-fenghua.yu@intel.com>
 <87mtsd6gr9.ffs@nanos.tec.linutronix.de> <YLShmFEzddfm7WQs@zn.tnic>
 <87y2bv438p.ffs@nanos.tec.linutronix.de>
 <36866b38ec92425b879881a88acf547b@intel.com>
 <db552f51-76ee-b7f5-20f1-14f1c703d423@kernel.org>
 <7d8788a9e04d4901a03bcea11e8e842b@intel.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <bd5bb38c-0b81-a302-dd20-ef56fd970c9e@kernel.org>
Date: Wed, 9 Jun 2021 16:34:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7d8788a9e04d4901a03bcea11e8e842b@intel.com>
Content-Language: en-US
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, "Hansen, Dave" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>,
 H Peter Anvin <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>
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

On 6/9/21 10:32 AM, Luck, Tony wrote:
>>> I've told Fenghua to dig out the previous iteration of this patch where
>>> the plan was to lazily fix the PASID_MSR in other threads in the #GP
>>> handler.
>>
>> Blech.  Also this won't work for other PASID-like features.
>>
>> I have a half-written patch to fix this up for real.  Stay tuned.
> 
> Andy: Any update on this?
> 
> -Tony
> 

Let me try to merge my pile with tglx's pile and come up with something
halfway sane.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
