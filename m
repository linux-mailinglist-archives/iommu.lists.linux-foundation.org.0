Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 605FB26E23B
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 19:22:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 102E587A2F;
	Thu, 17 Sep 2020 17:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kwi1506YRUnC; Thu, 17 Sep 2020 17:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C35E87A24;
	Thu, 17 Sep 2020 17:22:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2053C0859;
	Thu, 17 Sep 2020 17:22:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4968C0859
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A2A3A8769B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgFqQrT8G2D4 for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 17:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C9B0187697
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 17:22:43 +0000 (UTC)
IronPort-SDR: B9zIdkYHtGCLjl/58wzPPNlfXYZjMGh+oXiMWdmrIp6IwHRHlq6yALd7V+WZkSxNd3uBzDjcYw
 fBubUDFryFYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="221302209"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="221302209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 10:22:42 -0700
IronPort-SDR: d8KguAnRbfpRkGIt60HaTbUnGHuynchkWUobyiJR18CSUF98cdcJxOFmZoRAW0SG2N2WbH/LV+
 f1X/BFqPAyzw==
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="339503224"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 10:22:41 -0700
Date: Thu, 17 Sep 2020 10:22:39 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8 3/9] Documentation/x86: Add documentation for SVA
 (Shared Virtual Addressing)
Message-ID: <20200917172239.GB92038@otc-nc-03>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-4-git-send-email-fenghua.yu@intel.com>
 <20200917075338.GC31960@zn.tnic> <20200917145609.GB91028@otc-nc-03>
 <20200917171849.GO31960@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917171849.GO31960@zn.tnic>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
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

Thanks Boris.

multiple "again" makes it funny again :-)


On Thu, Sep 17, 2020 at 07:18:49PM +0200, Borislav Petkov wrote:
> On Thu, Sep 17, 2020 at 07:56:09AM -0700, Raj, Ashok wrote:
> > Just tweaked it a bit: 
> > 
> > "When ATS lookup fails for a virtual address, device should use PRI in
> > order to request the virtual address to be paged into the CPU page tables.
> > The device must use ATS again in order the fetch the translation again

s/translation again/translation

> > before use"
> 
> Thanks, amended.
> 


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
