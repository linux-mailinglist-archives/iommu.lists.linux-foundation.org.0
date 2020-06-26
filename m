Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2320B7D4
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 20:10:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9068F8764A;
	Fri, 26 Jun 2020 18:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oEsYYJkvvA1; Fri, 26 Jun 2020 18:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC91687673;
	Fri, 26 Jun 2020 18:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F13AC0895;
	Fri, 26 Jun 2020 18:10:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03B3FC016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CFA6422D2D
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mC960lVtCT6m for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 18:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B4002052C
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 18:10:16 +0000 (UTC)
IronPort-SDR: NAzTLOrgTArY2NcdP2IjbhSa4eGCdAA2gZnIZacmebpvSwVF+uhAgdSBX6zFd1xb4q0IIMR183
 RfZyz6wnAS0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="230194038"
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="230194038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 11:10:01 -0700
IronPort-SDR: g2OBDAD4vVXNapwoCfCslq8K5czLXdJb63lCtfHN+z8y3tjb0E6UQHVMO50vSKUtUJeHklLtUf
 e0+2TA6XdnTQ==
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="302408152"
Received: from agluck-desk2.sc.intel.com (HELO
 agluck-desk2.amr.corp.intel.com) ([10.3.52.68])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 11:10:01 -0700
Date: Fri, 26 Jun 2020 11:10:00 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200626181000.GA22833@agluck-desk2.amr.corp.intel.com>
References: <1593116242-31507-1-git-send-email-fenghua.yu@intel.com>
 <1593116242-31507-13-git-send-email-fenghua.yu@intel.com>
 <20200626094450.GJ4800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626094450.GJ4800@hirez.programming.kicks-ass.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

Do we have a standard way of coding for a feature that depends on multiple
other features?  For this case the system needs to both suport the ENQCMD
instruction, and also have kernel code that programs the IOMMU.

And/or guidance on when to use each of the very somewhat simlar looking
	boot_cpu_has()
	static_cpu_has()
	IS_ENABLED()
	cpu_feature_enabled()
options?

-Tony
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
