Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDC25CDB6
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 00:35:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D6E152E169;
	Thu,  3 Sep 2020 22:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4knYvD1Mo5Dp; Thu,  3 Sep 2020 22:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C1382270C;
	Thu,  3 Sep 2020 22:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F12DC0051;
	Thu,  3 Sep 2020 22:34:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB0DBC0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 22:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D8D0287494
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 22:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5Et98i88Xq0 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 22:34:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47C2E87493
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 22:34:54 +0000 (UTC)
IronPort-SDR: aQj+aId/J/ANkAP+pBbHeKwu+N5SwhH/xQWpTmCh6/BV3T3pbu/oiZJOO/OJrPgeHJ102IJQ0f
 52ijVYLHUkUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145401633"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="145401633"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 15:34:53 -0700
IronPort-SDR: u790SXF/INpCFqyCHnMzD1KOSwujaEmm1KPJsg8RXI9m0TfIgJbwR0MMq1d1xR66xa6sMsGdRZ
 cZTk+kjb68cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="326396319"
Received: from otcwcpicx6.sc.intel.com ([172.25.55.29])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2020 15:34:53 -0700
Date: Thu, 3 Sep 2020 22:34:53 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v7 9/9] x86/mmu: Allocate/free PASID
Message-ID: <20200903223453.GA410113@otcwcpicx6.sc.intel.com>
References: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
 <1598540794-132666-10-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598540794-132666-10-git-send-email-fenghua.yu@intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Andy Lutomirski <luto@kernel.org>, H Peter Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

Hi, Thomas, Andy, et al,

On Thu, Aug 27, 2020 at 08:06:34AM -0700, Fenghua Yu wrote:
> A PASID is allocated for an "mm" the first time any thread binds
> to an SVM capable device and is freed from the "mm" when the SVM is
> unbound by the last thread. It's possible for the "mm" to have different
> PASID values in different binding/unbinding SVM cycles.
> 
> The mm's PASID (non-zero for valid PASID or 0 for invalid PASID) is
> propagated to per-thread PASID MSR for all threads within the mm through
> through IPI, context switch, or inherit to ensure a running thread has
> the right PASID MSR matching the mm's PASID.
> 
> Suggested-by: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> v7:
> - Don't fix up PASID in #GP. Instead, update the PASID MSR by IPI and
>   context switch after PASID allocation and free. Inherit PASID from
>   parent. (Andy)
> 
> Before v7:
> - Allocate a PASID for the mm and free it until mm exit.

This is a friendly reminder. Any comment on this series?

This patch (9/9) is essentially the only changed patch that implements
updating PASID MSR for a thread by IPI and context switch per Andy's
comment.

Thank you very much in advance!

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
