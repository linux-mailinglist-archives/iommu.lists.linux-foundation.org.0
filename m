Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24A3994AD
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 22:38:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF88606B9;
	Wed,  2 Jun 2021 20:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NmH_NrgkinY; Wed,  2 Jun 2021 20:38:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB48E60684;
	Wed,  2 Jun 2021 20:37:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8BB0C0001;
	Wed,  2 Jun 2021 20:37:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FC5AC0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F60E4049B
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sd-Q-xQYcZ7 for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 20:37:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 865A040492
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 20:37:57 +0000 (UTC)
IronPort-SDR: DaAzBGH+JRmzFaetBAKvNuWbJXtf37rzq6qpRnAzk9vLaB8yorOSzriVXcIEUajQEfeHKUQIOR
 nCYwVhUWWEHg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="191001418"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="191001418"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 13:37:54 -0700
IronPort-SDR: 7o4Ko8qf/YRzlDUJz4aakcBst7Sj7ZsY8RdyqRwMdV8376kw73r6vMeokEPqWEPnk11j7Qk3T3
 JmLdWAInr/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="617366863"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 02 Jun 2021 13:37:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:37:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:37:48 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.008;
 Wed, 2 Jun 2021 13:37:48 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>
Subject: RE: [PATCH] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and
 remove update_pasid()
Thread-Topic: [PATCH] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and
 remove update_pasid()
Thread-Index: AQHXVGt3asHLaBFynUG7zSoQX2rt5Kr9vnIAgAAaOACAA1lTUA==
Date: Wed, 2 Jun 2021 20:37:47 +0000
Message-ID: <36866b38ec92425b879881a88acf547b@intel.com>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
 <1600187413-163670-10-git-send-email-fenghua.yu@intel.com>
 <87mtsd6gr9.ffs@nanos.tec.linutronix.de> <YLShmFEzddfm7WQs@zn.tnic>
 <87y2bv438p.ffs@nanos.tec.linutronix.de>
In-Reply-To: <87y2bv438p.ffs@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, "Hansen, Dave" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Ingo
 Molnar <mingo@redhat.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>,
 Andy Lutomirski <luto@kernel.org>, H Peter Anvin <hpa@zytor.com>,
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

>> ... so on a PASID system, your trivial reproducer would theoretically
>> fire the same way and corrupt FPU state just as well.
>
> This is worse and you can't selftest it because the IPI can just hit in
> the middle of _any_ FPU state operation and corrupt state.

That sounds like we should abandon the "IPI all the other threads
to force enable the PASID for them" approach. It would just be a
nightmare of papering over cracks when the IPI was delivered at
some inconvenient moment when the recipient was in the middle
of touching xsave state.

I've told Fenghua to dig out the previous iteration of this patch where
the plan was to lazily fix the PASID_MSR in other threads in the #GP
handler.

That algorithm is very simple and easy to check. Pseudo-code:

#GP
	if (usermode && current->mm->pasid && rdmsr(PASID_MSR) != valid) {
		wrmsr(PASID_MSR, current->mm->pasid | PASID_VALID);
		return;
	}

Worst case is that some thread of a multi-threaded process that is using PASID
takes some unrelated #GP ... this code will try to fix it by enabling the PASID_MSR.
That will just #GP a second time and this test will see the MSR is already set,
so fall into the usual #GP handling code.

Seems like a better direction than trying to fix the IPI method. The virtualization
folks will like this way more because IPI in guest causes a couple of VMEXIT
so is somewhat expensive.

-Tony
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
