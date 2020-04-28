Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 456481BB33B
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 03:08:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB98B87E23;
	Tue, 28 Apr 2020 01:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RM9HWLVJ08lz; Tue, 28 Apr 2020 01:08:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36C1C87E17;
	Tue, 28 Apr 2020 01:08:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2529FC08A6;
	Tue, 28 Apr 2020 01:08:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49991C003B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 01:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3525986959
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 01:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrYfSJQM4jy5 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 01:08:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 57F5C86940
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 01:08:09 +0000 (UTC)
IronPort-SDR: A6kxDNRmQZwQWU9/S0JPx5WquW2KyyfRYqc+iPqv3eJ8GcWhrirjQ52GM2auSIs4jJ2+wyzd3D
 f3OXQ/4PAeDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 18:08:08 -0700
IronPort-SDR: 2YoVZ36m76ZElHEJ97QaJ9BSnZaX0q6H1YcE2h2urZ+Ix/dX43x5tEXzq+SzYZx7OAac/BP8ym
 0SsxcIBGu0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="459058326"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 18:08:08 -0700
Date: Mon, 27 Apr 2020 18:08:08 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/7] x86/traps: Fix up invalid PASID
Message-ID: <20200428010808.GA18865@otc-nc-03>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-7-git-send-email-fenghua.yu@intel.com>
 <87mu6ys20d.fsf@nanos.tec.linutronix.de>
 <20200427224646.GA103955@otc-nc-03>
 <874kt4pgyk.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kt4pgyk.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

Hi Thomas,

On Tue, Apr 28, 2020 at 02:54:59AM +0200, Thomas Gleixner wrote:
> Ashok,
> 
> "Raj, Ashok" <ashok.raj@intel.com> writes:
> > On Sun, Apr 26, 2020 at 05:25:06PM +0200, Thomas Gleixner wrote:
> >> Just for the record I also suggested to have a proper errorcode in the
> >> #GP for ENQCMD and I surely did not suggest to avoid decoding the user
> >> instructions.
> >
> > We certainly discussed the possiblity of adding an error code to 
> > identiy #GP due to ENQCMD with our HW architects. 
> >
> > There are only a few cases that have an error code, like move to segment
> > with an invalid value for instance. There were a few but i don't
> > recall that entire list. 
> >
> > Since the error code is 0 in most places, there isn't plumbing in hw to return
> > this value in all cases. It appeared that due to some uarch reasons it
> > wasn't as simple as it appears to /me sw kinds :-)
> 
> Sigh.
> 
> > So after some internal discussion we decided to take the current
> > approach. Its possible that if the #GP was due to some other reason
> > we might #GP another time. Since this wasn't perf or speed path we took
> > this lazy approach.
> 
> I know that the HW people's mantra is that everything can be fixed in
> software and therefore slapping new features into the CPUs can be done
> without thinking about the consequeses.
> 
> But we all know from painful experience that this is fundamentally wrong
> unless there is a really compelling reason.

:-)... I'm still looking for the quote from Linus about RAS before
he went to behavior school.


> 
> For new features there is absolutely no reason at all.
> 
> Can HW people pretty please understand that hardware and software have
> to be co-designed and not dictated by 'some uarch reasons'. This is
> nothing fundamentally new. This problem existed 30+ years ago, is well
> documented and has been ignored forever. I'm tired of that, really.
> 
> But as this seems to be unsolvable for the problem at hand can you
> please document the inability, unwillingness or whatever in the
> changelog?

Most certainly!

> 
> The question why this brand new_ ENQCMD + invalid PASID induced #GP does
> not generate an useful error code and needs heuristics to be dealt with
> is pretty obvious.
> 

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
