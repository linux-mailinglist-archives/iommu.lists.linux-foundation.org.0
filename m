Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE539A34E
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 16:33:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2FB240530;
	Thu,  3 Jun 2021 14:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OByyAGvkASiQ; Thu,  3 Jun 2021 14:33:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34BA040533;
	Thu,  3 Jun 2021 14:33:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10098C0001;
	Thu,  3 Jun 2021 14:33:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F297DC0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 14:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC4EF40521
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 14:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKKFp2E7EVBL for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 14:33:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1A7C40520
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 14:33:43 +0000 (UTC)
Received: from zn.tnic (p200300ec2f13850038a9e66fdc616f42.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f13:8500:38a9:e66f:dc61:6f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 35C261EC0288;
 Thu,  3 Jun 2021 16:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1622730820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=v3uLhwvoQ2U0ccwLZNAng7garG6ceRKAsS1cWo3FxGE=;
 b=TbMLnSs+xjHJ2zv7bGB2HOM5OdBW/ymiYLTb8DcTvCbjG9TvwcIHi4Q+yxRfppfSMfwtU6
 XambKTiz9jdQEUUJ3tLZGqM3qq3dloPb+RpUUzc95cpW6S89NM+64dav7k3HPnGhoTHrof
 KNVeGYG91J8VM5Z2Ncg3jFW5tmMKKCY=
Date: Thu, 3 Jun 2021 16:33:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and
 remove update_pasid()
Message-ID: <YLjoPS32PFDon48f@zn.tnic>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-10-git-send-email-fenghua.yu@intel.com>
 <87mtsd6gr9.ffs@nanos.tec.linutronix.de> <YLdZ7bZDPNup1n9c@zn.tnic>
 <YLi6+vICUmu07b0E@vkoul-mobl> <YLjALi9hoxv2kubX@zn.tnic>
 <YLjPSAfBPIfQvmha@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLjPSAfBPIfQvmha@vkoul-mobl>
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 H Peter Anvin <hpa@zytor.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, dmaengine@vger.kernel.org,
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

On Thu, Jun 03, 2021 at 06:17:04PM +0530, Vinod Koul wrote:
> You can add:
> 
> Acked-By: Vinod Koul <vkoul@kernel.org>

Done.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
