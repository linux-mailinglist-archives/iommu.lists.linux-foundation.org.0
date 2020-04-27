Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 895501BAF2D
	for <lists.iommu@lfdr.de>; Mon, 27 Apr 2020 22:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 454D0861AA;
	Mon, 27 Apr 2020 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKJB3CuYJgvT; Mon, 27 Apr 2020 20:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D5D086199;
	Mon, 27 Apr 2020 20:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1A6CC08A6;
	Mon, 27 Apr 2020 20:18:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E0A1C003B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 20:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB23A86AFF
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 20:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLMjs98qw103 for <iommu@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 20:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 90D3A84543
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 20:18:13 +0000 (UTC)
IronPort-SDR: 5pnochTwrvl/kCvNsanK6A6jfdAmut/8cgwbgwnqH2YwklD6Rp2apx8gRw7KWPaeCOj3fpt26o
 8S3lFRUP8LUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 13:18:12 -0700
IronPort-SDR: 49XhrD2107mWQOJ8zWIhZV6uyNuG6sFLUOrEq2oeq8Ej1/NfRNLsyu7wwqC5yGsmnNVWwDjb9D
 vaoWJ5gm1VTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="404432935"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga004.jf.intel.com with ESMTP; 27 Apr 2020 13:18:12 -0700
Date: Mon, 27 Apr 2020 13:17:16 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/7] x86/cpufeatures: Enumerate ENQCMD and ENQCMDS
 instructions
Message-ID: <20200427201716.GC242333@romley-ivt3.sc.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-3-git-send-email-fenghua.yu@intel.com>
 <87y2qisdza.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2qisdza.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
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

On Sun, Apr 26, 2020 at 01:06:33PM +0200, Thomas Gleixner wrote:
> Fenghua Yu <fenghua.yu@intel.com> writes:
> > A user space application can execute ENQCMD instruction to submit work
> > to device. The kernel executes ENQCMDS instruction to submit work to
> > device.
> 
> So a user space application _can_ execute ENQCMD and the kernel
> executes ENQCMDS. And both submit work to device.
> 
> > There is a lot of other enabling needed for the instructions to actually
> > be usable in user space and the kernel, and that enabling is coming later
> > in the series and in device drivers.
> 
> That's important information to the enumeration of the instructions in
> which way?

I just want to notify people this enumeration is only part of enabling
ENQCMD. But seems this paragraph is not so useful to be here. Maybe I can
remove it.

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
