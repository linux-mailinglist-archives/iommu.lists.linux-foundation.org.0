Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E446C217A65
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 23:30:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9053289094;
	Tue,  7 Jul 2020 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kf752koNJl9m; Tue,  7 Jul 2020 21:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEF0A890D7;
	Tue,  7 Jul 2020 21:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF33C016F;
	Tue,  7 Jul 2020 21:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96F65C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7D67F88263
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1hiYSpGn4UA for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 21:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED93D88185
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 21:30:46 +0000 (UTC)
IronPort-SDR: 1kmV0xi6EaqXlWDbZSPXgH5PzlY5izrBn8lEekhuRkpcCFXyvXgVoATqw2FRt0a0DBjqQ+2Gn8
 g/CPzf7YoN1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232561018"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="232561018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:30:46 -0700
IronPort-SDR: rwm7lj+DnvL/a1nGsfKY1/7jBpW0zpUQ2Umk8tCEBzRExI+Yqm+0qUJZpUU7FPxDpBzDyT16+x
 cJ0EuuDG1dxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="297521531"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2020 14:30:44 -0700
Date: Tue, 7 Jul 2020 14:30:44 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, H Peter Anvin <hpa@zytor.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Ashok Raj <ashok.raj@intel.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
Subject: Re: [PATCH v5 00/12] x86: tag application address space for devices
Message-ID: <20200707213043.GG32961@romley-ivt3.sc.intel.com>
References: <1593560682-40814-1-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593560682-40814-1-git-send-email-fenghua.yu@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: iommu@lists.linux-foundation.org, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
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

Hi, Thomas, Joerg, Boris, Ingo, Baolu, and x86/iommu maintainers,

On Tue, Jun 30, 2020 at 04:44:30PM -0700, Fenghua Yu wrote:
> Typical hardware devices require a driver stack to translate application
> buffers to hardware addresses, and a kernel-user transition to notify the
> hardware of new work. What if both the translation and transition overhead
> could be eliminated? This is what Shared Virtual Address (SVA) and ENQCMD
> enabled hardware like Data Streaming Accelerator (DSA) aims to achieve.
> Applications map portals in their local-address-space and directly submit
> work to them using a new instruction.
> 

Any comment on this series? Updated patch 1 with minor changes was sent out
on the same patch 1 thread and was Acked-by Felix Kuehling. If you want me
to send the whole series with the minor changes or any other changes, please
let me know.

Any plan to push the patches into your tree and upstream?

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
