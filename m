Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09B269BB6
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 04:02:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC6C18642E;
	Tue, 15 Sep 2020 02:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G78dOeZJiDSl; Tue, 15 Sep 2020 02:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E79686457;
	Tue, 15 Sep 2020 02:02:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44D19C0864;
	Tue, 15 Sep 2020 02:02:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B01C8C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 02:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 747B82043C
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 02:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKO24kJYpjrx for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 02:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B9FE2040F
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 02:02:16 +0000 (UTC)
IronPort-SDR: e5POSe5rZcLQFaqrpYsk6Cu8Pd7QntKLY+f7sBhkof9RAsLVzUesyJOe84604NkNh6MjDBWFJc
 RzV7HeM36BNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="159234268"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="159234268"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 19:02:15 -0700
IronPort-SDR: N/Yz5aGcM6gsT2R3Poqs+0dJtTuuU+23RLSREefvakHjlB+NAFAaosxh7IeD8BOoc4ThbYgQNg
 42zOt3Ujv1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="330979588"
Received: from otcwcpicx6.sc.intel.com ([172.25.55.29])
 by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2020 19:02:14 -0700
Date: Tue, 15 Sep 2020 02:02:14 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 3/9] docs: x86: Add documentation for SVA (Shared
 Virtual Addressing)
Message-ID: <20200915020214.GA437862@otcwcpicx6.sc.intel.com>
References: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
 <1598540794-132666-4-git-send-email-fenghua.yu@intel.com>
 <626fe21c-1f82-f4f8-e37b-32d91e7d557a@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <626fe21c-1f82-f4f8-e37b-32d91e7d557a@infradead.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Andy Lutomirski <luto@kernel.org>, H Peter Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

Hi, Randy,

On Sat, Sep 05, 2020 at 10:54:59AM -0700, Randy Dunlap wrote:
> Hi,
> 
> I'll add a few edits other than those that Borislav made.
> (nice review job, BP)
> 
> 
> On 8/27/20 8:06 AM, Fenghua Yu wrote:
> > From: Ashok Raj <ashok.raj@intel.com>
> > 
> > ENQCMD and Data Streaming Accelerator (DSA) and all of their associated
> > features are a complicated stack with lots of interconnected pieces.
> > This documentation provides a big picture overview for all of the
> > features.
> > 
> > Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> > Co-developed-by: Fenghua Yu <fenghua.yu@intel.com>
> > Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> > Reviewed-by: Tony Luck <tony.luck@intel.com>
> > ---
> > diff --git a/Documentation/x86/sva.rst b/Documentation/x86/sva.rst
> > new file mode 100644
> > index 000000000000..6e7ac565e127
> > --- /dev/null
> > +++ b/Documentation/x86/sva.rst
> > @@ -0,0 +1,254 @@
> > +MMIO. This doesn't scale as the number of threads becomes quite large. The
> > +hardware also manages the queue depth for Shared Work Queues (SWQ), and
> > +consumers don't need to track queue depth. If there is no space to accept
> > +a command, the device will return an error indicating retry. Also
> > +submitting a command to an MMIO address that can't accept ENQCMD will
> > +return retry in response. In the new DMWr PCIe terminology, devices need to
> 
> so how does a submitter know whether a return of "retry" means no_space or
> invalid_for_this_device?

I will add "A user should check Deferrable Memory Write (DMWr) capability on
the device and only submits ENQCMD when the device supports it."

So the user doesn't need to distinguish "no space" and "invalid for this device"
errors.

All of your other comments will be addressed in the next version.

Thank you very much for your comments!

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
