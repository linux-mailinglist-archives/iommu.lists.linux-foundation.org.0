Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73F20B7E8
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 20:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B29987C88;
	Fri, 26 Jun 2020 18:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuLmZ-m56pLN; Fri, 26 Jun 2020 18:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C52D587D09;
	Fri, 26 Jun 2020 18:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA271C016F;
	Fri, 26 Jun 2020 18:16:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E405AC016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3A0E87C6F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ikgc3JlZDFNl for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 18:16:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3986E876BF
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:16:45 +0000 (UTC)
IronPort-SDR: gmjsqMd0PWQc5xwgXgL8dLUwUIcdbWkj7w8TsCfn0cDPPaBhVERWZbS2OaOVsJlIIuQKDlWFuv
 IKGOFQSMzV1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="142927736"
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="142927736"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 11:16:44 -0700
IronPort-SDR: LrvGyNnpWX6ik5OFFqZoBMW0OQOmmNpAFfodvXeT2j9bQlZKueLItipolrt/V64t2tcadV1dna
 D9NzoyBXgSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="385835873"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2020 11:16:44 -0700
Date: Fri, 26 Jun 2020 11:16:24 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200626181624.GA32961@romley-ivt3.sc.intel.com>
References: <1593116242-31507-1-git-send-email-fenghua.yu@intel.com>
 <1593116242-31507-13-git-send-email-fenghua.yu@intel.com>
 <20200626094450.GJ4800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626094450.GJ4800@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Christoph Hellwig <hch@infradeed.org>, Thomas Gleixner <tglx@linutronix.de>,
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

Hi, Peter,

On Fri, Jun 26, 2020 at 11:44:50AM +0200, Peter Zijlstra wrote:
> On Thu, Jun 25, 2020 at 01:17:22PM -0700, Fenghua Yu wrote:
> 
> > +static bool fixup_pasid_exception(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
> > +		return false;
> > +	if (!static_cpu_has(X86_FEATURE_ENQCMD))
> > +		return false;
> 
> elsewhere you had another variation:
> 
> +       if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
> +               return;
> +
> +       if (!cpu_feature_enabled(X86_FEATURE_ENQCMD))
> +               return;
> 
> Which is it, and why do we need the CONFIG thing when combined with the
> enabled thing?
> 

I will use the second one with cpu_feature_enabled() for both cases.

The CONFIG thing is for compilation time optimization when
CONFIG_INTEL_IOMMU_SVM is not set.

If CONFIG_INTEL_IOMMU_SVM is not set, IS_ENABLED(CONFIG_INTEL_IOMMU_SVM) 
is "false" during compilation time. Then GCC will optimize 
fixup_pasid_execption() to empty and will not define
__fixup_pasid_exception() at all because no one calls it.

If CONFIG_INTEL_IOMMU_SVM is set, IS_ENABLED(...) is always true.
Depending on cpu_feature_enabled(X86_FEATURE_ENQCMD), __fixup_pasid_execption()
will be called or not during run time.

Does it make sense?

Do you want me to define a helper enqcmd_enabled()?

static inline bool enqcmd_enabled(void)
{
   if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
           return false;
   if (!static_cpu_has(X86_FEATURE_ENQCMD))
           return false;
   return true;
}

Then both fixup_pasid_execption() and free_pasid() can call it.

static bool fixup_pasid_exception(void)
{
	if (!enqcmd_enabled())
		return false;
	
	return __fixup_pasid_exception();
}

statis inline void free_pasid(struct m_struct *mm)
{
	if (!enqcmd_enabled())
		return;

	__free_pasid(mm);
}

Please advice.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
