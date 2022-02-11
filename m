Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D609D4B2E25
	for <lists.iommu@lfdr.de>; Fri, 11 Feb 2022 21:04:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F8341702;
	Fri, 11 Feb 2022 20:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FhK5VlxHttK; Fri, 11 Feb 2022 20:04:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9D25F4166B;
	Fri, 11 Feb 2022 20:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67F35C0073;
	Fri, 11 Feb 2022 20:04:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADE85C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 20:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D0368197D
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 20:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fah52c9m0LCi for <iommu@lists.linux-foundation.org>;
 Fri, 11 Feb 2022 20:04:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8804818EC
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644609893; x=1676145893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2ZlVaDtKfVX9/LVBJ9h/jToT61g2FD0JlwafMGgpbqg=;
 b=Gwq/0oCEP27gIfgDjKcDZLNkHqR9+E8YVPHXfrpRFq/Edv34XEdCGA/M
 neWQ5iMnnhsRkKED7+06j9S2BYK8AMUIHHWT0DlaJD9Z395TULuBKeoDR
 5x8Bhirll+XOagiCztowruQ7nPByjduOycVIwiJJH3rqCkYTiLZ0CN6cf
 1h+EXFZjML4sr10fa0MKKUO0jdtXItaMwVNqFa7/VWC1r8Th1H4f0CGRQ
 KyUIqFJ9pKvfU3U7l3Ic8sFGiz/BczlUUwXbrnLlmvPdW9t++UpvYSRSB
 45I8n9xmjOGLHV2MFzqiPx6xYWK+7EhTET+3cuHFZRgrYbadDZlb8GWFP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="237205073"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="237205073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 12:04:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="702223218"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 12:04:47 -0800
Date: Fri, 11 Feb 2022 12:04:41 -0800
From: Fenghua Yu <fenghua.yu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
Subject: Re: [PATCH v4 00/11] Re-enable ENQCMD and PASID MSR
Message-ID: <YgbBWcLzpddko1wR@otcwcpicx3.sc.intel.com>
References: <20220207230254.3342514-1-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207230254.3342514-1-fenghua.yu@intel.com>
Cc: iommu@lists.linux-foundation.org, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Feb 07, 2022 at 03:02:43PM -0800, Fenghua Yu wrote:
> Problems in the old code to manage SVM (Shared Virtual Memory) devices
> and the PASID (Process Address Space ID) led to that code being
> disabled.
> 
> Subsequent discussions resulted in a far simpler approach:
> 
> 1) PASID life cycle is from first allocation by a process until that
>    process exits.
> 2) All tasks begin with PASID disabled
> 3) The #GP fault handler tries to fix faulting ENQCMD instructions very
>    early (thus avoiding complexities of the XSAVE infrastructure)
> 
> Change Log:
> v4:
> - Update commit message in patch #4 (Thomas).
> - Update commit message in patch #5 (Thomas).
> - Add "Reviewed-by: Thomas Gleixner <tglx@linutronix.de>" in patch #1-#3
>   and patch #6-#9 (Thomas).
> - Rebased to 5.17-rc3.

A friendly reminder. Any comment on this series? Will you pick up this
series in tip?

Thank you very much!

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
