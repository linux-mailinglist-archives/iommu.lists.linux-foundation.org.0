Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2894994B3
	for <lists.iommu@lfdr.de>; Mon, 24 Jan 2022 21:56:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C0684BFC;
	Mon, 24 Jan 2022 20:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmP0S1BD9Khz; Mon, 24 Jan 2022 20:56:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1406484C08;
	Mon, 24 Jan 2022 20:56:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE9AC007A;
	Mon, 24 Jan 2022 20:56:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D92E0C002F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2F6E60AE7
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 20:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="lKXSQDPR";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="G3ENNrBj"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEjqLOH0QDw8 for <iommu@lists.linux-foundation.org>;
 Mon, 24 Jan 2022 20:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B1160AE1
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 20:55:59 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1643057757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ewg7Dhv9g66Ay9i+CemB/iAHIgq8aLwWkreYxw8kj/g=;
 b=lKXSQDPRwtX3JbI5kY4OS0NvZR/TtL6HQvc1pAby9EDjOYmhD5/59olQqxj2uLie0QcmXD
 122jSktPVHZZZXrwOHEgRzWf0nL0CBHeDPrSnDDr8HDOszOc/HBm5rmP9RF+gXhBjXTn5t
 BOt4I8USw4ZZZYWMNLOZPfxrxIWpgrJJfyajfFitSwYv2H6JgoZMgt5ENKQsfH3WtPxwrh
 X891rpgKH/dqXmcZFOicjJ/6jhZv/n7K819/xU9XoTJJJG0UmRxK0IBf2I1GcI+nlIFdYZ
 hcAXac4/1ZFqNnIiV/DS6ITtBOgFtesQaRMiqKByg+iV2ltmyDTXH+IW24cw5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1643057757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ewg7Dhv9g66Ay9i+CemB/iAHIgq8aLwWkreYxw8kj/g=;
 b=G3ENNrBjyqKPwM/QWySmB1I+RO6YHoUmLNztYTPsSSISUX2jBvJ6FDZadlS6OF25uukxWG
 XkpauCr0fKJ7TtCA==
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
In-Reply-To: <Ye8RmmKpJT8brmDE@otcwcpicx3.sc.intel.com>
References: <20211217220136.2762116-1-fenghua.yu@intel.com>
 <20211217220136.2762116-6-fenghua.yu@intel.com> <87ee4w6g1n.ffs@tglx>
 <87bl006fdb.ffs@tglx> <Ye8RmmKpJT8brmDE@otcwcpicx3.sc.intel.com>
Date: Mon, 24 Jan 2022 21:55:56 +0100
Message-ID: <878rv46eg3.ffs@tglx>
MIME-Version: 1.0
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
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

On Mon, Jan 24 2022 at 12:52, Fenghua Yu wrote:
> On Mon, Jan 24, 2022 at 09:36:00PM +0100, Thomas Gleixner wrote:
>> On Mon, Jan 24 2022 at 21:21, Thomas Gleixner wrote:
> Ah. This patch should remove ioasid_get(). So I will change this patch
> as follows:
>
> 1. Remove ioasid_get() because it's not used any more when IOASID's
>    refcount is set to 1 once the IOASID is allocated and is freed on mm exit.
> 2. Change mm_pasid_get() to mm_pasid_set().

Yes. Just resend this one. No need to post the full queue again.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
