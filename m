Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B221C26E20F
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 19:19:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68C4C87693;
	Thu, 17 Sep 2020 17:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K09yHj9-uAHH; Thu, 17 Sep 2020 17:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 251E187476;
	Thu, 17 Sep 2020 17:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03E05C089E;
	Thu, 17 Sep 2020 17:19:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06A27C0859
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6E518702D
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rI4EiZDRIFWq for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 17:18:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B414386FE7
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:18:59 +0000 (UTC)
Received: from zn.tnic (p200300ec2f105300d80be81ad57dea02.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f10:5300:d80b:e81a:d57d:ea02])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F0CBD1EC032C;
 Thu, 17 Sep 2020 19:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1600363137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=WU5uCzjAtxqK1mwx7rQrEjQuAmt9/FJg9bmOpsWfM5g=;
 b=XxZqzp9yxOxK+AiJsoXf7Nt2uhPsR3sU4Oq3YAjmssSjcf8rFOJ3TJS0tafGBkpH8Y7Dka
 CPO66Bq2xmvjSDo+QAXMTWEPQAwnAQVENAKAgc5FqKw02PfmQ0ds/Y+VB906mByT9ba9R0
 PyiQ9Gvp9Gh4CQakJo9rN4W8UJLODuo=
Date: Thu, 17 Sep 2020 19:18:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH v8 3/9] Documentation/x86: Add documentation for SVA
 (Shared Virtual Addressing)
Message-ID: <20200917171849.GO31960@zn.tnic>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-4-git-send-email-fenghua.yu@intel.com>
 <20200917075338.GC31960@zn.tnic> <20200917145609.GB91028@otc-nc-03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917145609.GB91028@otc-nc-03>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Andy Lutomirski <luto@kernel.org>,
 H Peter Anvin <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, x86 <x86@kernel.org>
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

On Thu, Sep 17, 2020 at 07:56:09AM -0700, Raj, Ashok wrote:
> Just tweaked it a bit: 
> 
> "When ATS lookup fails for a virtual address, device should use PRI in
> order to request the virtual address to be paged into the CPU page tables.
> The device must use ATS again in order the fetch the translation again
> before use"

Thanks, amended.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
