Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA91BCC17
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 21:07:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82A44875BA;
	Tue, 28 Apr 2020 19:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsqYxYkqK1BJ; Tue, 28 Apr 2020 19:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98F9F875D7;
	Tue, 28 Apr 2020 19:07:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79816C0172;
	Tue, 28 Apr 2020 19:07:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53F13C0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3CA62875BA
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 19:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoVBTe1vkJqo for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 19:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 540E28410C
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 19:07:34 +0000 (UTC)
IronPort-SDR: OD8CISXqwmoT2jJJ+VXm5ylEe1CL6rULrpdJKuIU7UPAw+xT2P5thvmAobURaMdPd5e1qsY00P
 cZN2Hhr9RCVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 12:07:26 -0700
IronPort-SDR: H9WMt1ccVsFYYldEOJJiXYnUjdrg0S5E87Hcxdt2iFCHphHKG0StdfXzj9GjiUZAd+NHrqTEpG
 AJy/ZUPIkUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="459331916"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2020 12:07:26 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Apr 2020 12:07:26 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.83]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.187]) with mapi id 14.03.0439.000;
 Tue, 28 Apr 2020 12:07:26 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Pan, Jacob jun"
 <jacob.jun.pan@intel.com>
Subject: RE: [PATCH 5/7] x86/mmu: Allocate/free PASID
Thread-Topic: [PATCH 5/7] x86/mmu: Allocate/free PASID
Thread-Index: AQHWBtMgRqn1rM/ldEi9589O6eqhDKiMHSGAgANeKoCAAAkqgP//jPrQ
Date: Tue, 28 Apr 2020 19:07:25 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F608BE9@ORSMSX115.amr.corp.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-6-git-send-email-fenghua.yu@intel.com>
 <87pnbus3du.fsf@nanos.tec.linutronix.de> <20200428112113.000033bd@intel.com>
 <87tv13o306.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87tv13o306.fsf@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, "Shankar,
 Ravi V" <ravi.v.shankar@intel.com>, x86 <x86@kernel.org>,
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

> If fd release cleans up then how should there be something in flight at
> the final mmdrop?

ENQCMD from the user is only synchronous in that it lets the user know their
request has been added to a queue (or not).  Execution of the request may happen
later (if the device is busy working on requests for other users).  The request will
take some time to complete. Someone told me the theoretical worst case once,
which I've since forgotten, but it can be a long time.

So the driver needs to use flush/drain operations to make sure all the in-flight
work has completed before releasing/re-using the PASID.

-Tony
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
