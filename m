Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 982584AA3F9
	for <lists.iommu@lfdr.de>; Sat,  5 Feb 2022 00:07:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D87E405FD;
	Fri,  4 Feb 2022 23:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvM5xN7k8txW; Fri,  4 Feb 2022 23:07:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E252840004;
	Fri,  4 Feb 2022 23:07:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7DA5C000B;
	Fri,  4 Feb 2022 23:07:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AC4CC000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F2160D6C
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="EEXdM43Y";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="jMvBOaIp"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wskpaHeAv3qL for <iommu@lists.linux-foundation.org>;
 Fri,  4 Feb 2022 23:07:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0EF560AF2
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:51 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644016069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ld1PFYBLYxe6OCr2s2kgC8WKseN0fuK+fr3Z4cIGHcU=;
 b=EEXdM43YWo46V68aujQjWgrltp7wN0bI61WoXn8oEWXUGhsDkJVlbSYLsoizCE+o1vi4Yj
 fYyrfor/EEQMTJdDd7IKEg9wMLJVARTHls75/ey2yrDQATdI8KRUnesWnivrQmBowOK/tj
 a3YOG/Vv1PXc4dI+8wP2Y0j9MmrXLdPksjIFxQX87FkLu2KQzVkdEDjjhM6fWta+HZajiT
 EUFW0WQ/9lScvrcnJgHE0tFSQ56JwhsKxTVZ8sp+2X3N7Gyli87O7MLyUjVSSV1p7z1IQa
 Ak7UMA5ODZX6MWc2P/OTBRZifM+eKnJj4ROqhUw3xl6OZAEuyrWhU0CJfv1kww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644016069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ld1PFYBLYxe6OCr2s2kgC8WKseN0fuK+fr3Z4cIGHcU=;
 b=jMvBOaIpolZEID1SEOxXurziTcZcYEdIzb/6ZjUwcwqwQdwZTGgmPAxu5pPaw9fac9erdB
 kyYeyxTCNno1lMDw==
To: Fenghua Yu <fenghua.yu@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, Tony Luck <tony.luck@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok
 Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>
Subject: Re: [PATCH v3 02/11] mm: Change CONFIG option for mm->pasid field
In-Reply-To: <20220128202905.2274672-3-fenghua.yu@intel.com>
References: <20220128202905.2274672-1-fenghua.yu@intel.com>
 <20220128202905.2274672-3-fenghua.yu@intel.com>
Date: Sat, 05 Feb 2022 00:07:48 +0100
Message-ID: <874k5ecjsr.ffs@tglx>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Jan 28 2022 at 12:28, Fenghua Yu wrote:

> This currently depends on CONFIG_IOMMU_SUPPORT. But it is only
> needed when CONFIG_IOMMU_SVA option is enabled.
>
> Change the CONFIG guards around definition and initialization
> of mm->pasid field.
>
> Suggested-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
