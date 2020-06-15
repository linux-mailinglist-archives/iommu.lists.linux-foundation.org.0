Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D81F9AF2
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 16:53:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69D96233B0;
	Mon, 15 Jun 2020 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6t+GQGCOsLg; Mon, 15 Jun 2020 14:53:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 14CC520467;
	Mon, 15 Jun 2020 14:53:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3ED3C016E;
	Mon, 15 Jun 2020 14:53:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20A27C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 14:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F3D188734
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 14:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTpHeKEIjWXQ for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 14:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6628F8872E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 14:53:47 +0000 (UTC)
IronPort-SDR: RWbWOYECXBiivwCnuQ2NsARtqf7CF5SZthV/PiPRYMuqrdmpsmHd1P2U3bZ/bFCYdySyZpuqRU
 sWV2XuwNbIog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 07:53:46 -0700
IronPort-SDR: hBkuUtQL8+lhTWXLYi651EBCBrGOEnQVfzIuldPKgK9Hg1HqC5sQmkx3kq2cejv4s2HjL2N4xD
 LCQ6U6PgIXpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; d="scan'208";a="382567032"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 07:53:46 -0700
Date: Mon, 15 Jun 2020 07:53:46 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 00/12] x86: tag application address space for devices
Message-ID: <20200615145345.GA13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <20200615075202.GI2497@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615075202.GI2497@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi, Peter,
On Mon, Jun 15, 2020 at 09:52:02AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 12, 2020 at 05:41:21PM -0700, Fenghua Yu wrote:
> 
> > This series only provides simple and basic support for ENQCMD and the MSR:
> > 1. Clean up type definitions (patch 1-3). These patches can be in a
> >    separate series.
> >    - Define "pasid" as "unsigned int" consistently (patch 1 and 2).
> >    - Define "flags" as "unsigned int"
> > 2. Explain different various technical terms used in the series (patch 4).
> > 3. Enumerate support for ENQCMD in the processor (patch 5).
> > 4. Handle FPU PASID state and the MSR during context switch (patches 6-7).
> > 5. Define "pasid" in mm_struct (patch 8).
> > 5. Clear PASID state for new mm and forked and cloned thread (patch 9-10).
> > 6. Allocate and free PASID for a process (patch 11).
> > 7. Fix up the PASID MSR in #GP handler when one thread in a process
> >    executes ENQCMD for the first time (patches 12).
> 
> If this is per mm, should not switch_mm() update the MSR ? I'm not
> seeing that, nor do I see it explained why not.

PASID value is per mm and all threads in a process have the same PASID
value in the MSR. However, the MSR is per thread and is context switched
by XSAVES/XRSTROS in patches 6-7.

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
