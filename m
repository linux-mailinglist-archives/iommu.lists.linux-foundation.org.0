Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F71BB1D4
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 01:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9D28822613;
	Mon, 27 Apr 2020 23:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duncZh3isofi; Mon, 27 Apr 2020 23:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B4B9A20020;
	Mon, 27 Apr 2020 23:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A225BC003B;
	Mon, 27 Apr 2020 23:09:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15E0EC003B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 045D920439
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmrGBf7rbvZB for <iommu@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 23:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C0B820020
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 23:09:01 +0000 (UTC)
IronPort-SDR: Nu1FoBDfs+H+r9Y/2EQop/gGLrSkN5bv2l4dy6Ia9BJHV8WccOFyqDaNcywxigYvs9DsJCPEtU
 6S39nOgG0BWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 16:09:01 -0700
IronPort-SDR: p9W4QCXJcDwYX9ymVbBmEOs/thB1bW7Wf5XfRDODzBOs0MSN6Se7K/rqOUjFRHQIV1cSz84MpT
 jDZ5yQRfCNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="260896169"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga006.jf.intel.com with ESMTP; 27 Apr 2020 16:09:00 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Apr 2020 16:09:00 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.83]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.133]) with mapi id 14.03.0439.000;
 Mon, 27 Apr 2020 16:09:00 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Raj, Ashok" <ashok.raj@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH 6/7] x86/traps: Fix up invalid PASID
Thread-Topic: [PATCH 6/7] x86/traps: Fix up invalid PASID
Thread-Index: AQHWBtMhyjaBsrFNmEyApZQ4dM/Yo6iMJWwAgAINuwD//41J4A==
Date: Mon, 27 Apr 2020 23:08:59 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F6070AA@ORSMSX115.amr.corp.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-7-git-send-email-fenghua.yu@intel.com>
 <87mu6ys20d.fsf@nanos.tec.linutronix.de> <20200427224646.GA103955@otc-nc-03>
In-Reply-To: <20200427224646.GA103955@otc-nc-03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>, David
 Woodhouse <dwmw2@infradead.org>
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

> Just for the record I also suggested to have a proper errorcode in the
> #GP for ENQCMD and I surely did not suggest to avoid decoding the user
> instructions.

Thomas,

Is the heuristic to avoid decoding the user instructions OK (you are just pointing
out that you should not be given credit for this part of the idea)?

Or are you saying that you'd like to see the instruction checked to see that it
was an ENQCMD?

-Tony

 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
