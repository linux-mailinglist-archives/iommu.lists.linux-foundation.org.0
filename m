Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7151BB19D
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 00:46:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 499E8875BB;
	Mon, 27 Apr 2020 22:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Rj1LUx60DhC; Mon, 27 Apr 2020 22:46:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D4C78767B;
	Mon, 27 Apr 2020 22:46:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3361AC0172;
	Mon, 27 Apr 2020 22:46:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 054EDC003B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E17E2875BB
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhXD7CFNKtK1 for <iommu@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 22:46:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E9DDE87356
 for <iommu@lists.linux-foundation.org>; Mon, 27 Apr 2020 22:46:47 +0000 (UTC)
IronPort-SDR: 6Wv8iCXbPgL7V5oFbLg2X9u81azZb/BK+C52qVorM1x0fBsqsSfCn/XUC3oCyTX7myv3F3Vjba
 gtBKwF4wKnIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 15:46:47 -0700
IronPort-SDR: UHVzSlXZVdNamgJeTnygmEuXY5wBVq5RZcNSoRgPwHzzqHDm3NcyQ2wPRbh+JCVXcKjUrc6TKD
 /A5HxJvcQb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="459025738"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 15:46:46 -0700
Date: Mon, 27 Apr 2020 15:46:46 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/7] x86/traps: Fix up invalid PASID
Message-ID: <20200427224646.GA103955@otc-nc-03>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-7-git-send-email-fenghua.yu@intel.com>
 <87mu6ys20d.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mu6ys20d.fsf@nanos.tec.linutronix.de>
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

Hi Thomas

On Sun, Apr 26, 2020 at 05:25:06PM +0200, Thomas Gleixner wrote:
> Fenghua Yu <fenghua.yu@intel.com> writes:
> > A #GP fault is generated when ENQCMD instruction is executed without
> > a valid PASID value programmed in.
> 
> Programmed in what?
> 
> > The #GP fault handler will initialize the current thread's PASID MSR.
> >
> > The following heuristic is used to avoid decoding the user instructions
> > to determine the precise reason for the #GP fault:
> > 1) If the mm for the process has not been allocated a PASID, this #GP
> >    cannot be fixed.
> > 2) If the PASID MSR is already initialized, then the #GP was for some
> >    other reason
> > 3) Try initializing the PASID MSR and returning. If the #GP was from
> >    an ENQCMD this will fix it. If not, the #GP fault will be repeated
> >    and we will hit case "2".
> >
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Just for the record I also suggested to have a proper errorcode in the
> #GP for ENQCMD and I surely did not suggest to avoid decoding the user
> instructions.

We certainly discussed the possiblity of adding an error code to 
identiy #GP due to ENQCMD with our HW architects. 

There are only a few cases that have an error code, like move to segment
with an invalid value for instance. There were a few but i don't
recall that entire list. 

Since the error code is 0 in most places, there isn't plumbing in hw to return
this value in all cases. It appeared that due to some uarch reasons it
wasn't as simple as it appears to /me sw kinds :-)

So after some internal discussion we decided to take the current
approach. Its possible that if the #GP was due to some other reason
we might #GP another time. Since this wasn't perf or speed path we took
this lazy approach. 

We will keep tabs with HW folks for future consideration. 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
