Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B1D270203
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 18:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FCE487479;
	Fri, 18 Sep 2020 16:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MbiFCMVUFZ7; Fri, 18 Sep 2020 16:22:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5F6087477;
	Fri, 18 Sep 2020 16:22:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84C06C0051;
	Fri, 18 Sep 2020 16:22:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4CABC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A421E8787B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 16:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9hQ9+FGITyX for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 16:22:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1DED2876C2
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 16:22:16 +0000 (UTC)
IronPort-SDR: A1zm03ugpxVfTwREc5Tf/iiAXBFmL+dg5+tXayOLeXhOSyVFHkeXUefbFADQQ7t/XQfRHWxLnV
 HxQ72YXPbedA==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160034063"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160034063"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 09:22:13 -0700
IronPort-SDR: xi6E08IvoZBUkpZ1Z7pbYXExv9ngdCp9u1d4BqY/0BPBMX91LZEW3Bh9HS2MOnDppXEf4rEDIs
 WOfjiggeoaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="289391730"
Received: from otcwcpicx6.sc.intel.com ([172.25.55.29])
 by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2020 09:22:13 -0700
Date: Fri, 18 Sep 2020 16:22:12 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8 3/9] Documentation/x86: Add documentation for SVA
 (Shared Virtual Addressing)
Message-ID: <20200918162212.GA444227@otcwcpicx6.sc.intel.com>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-4-git-send-email-fenghua.yu@intel.com>
 <20200917075338.GC31960@zn.tnic> <20200917145609.GB91028@otc-nc-03>
 <20200917171849.GO31960@zn.tnic> <20200917172239.GB92038@otc-nc-03>
 <20200917173041.GQ31960@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917173041.GQ31960@zn.tnic>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>,
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

On Thu, Sep 17, 2020 at 07:30:41PM +0200, Borislav Petkov wrote:
> On Thu, Sep 17, 2020 at 10:22:39AM -0700, Raj, Ashok wrote:
> > s/translation again/translation
> 
> Ok, last one. Now stop looking at that text because you'll find more.
> 
> :-)))

Thank you very much for taking care of the series, Boris!

I tested the tip:x86/pasid branch and everything works fine by my tests.
I'll enable more tests for the branch.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
