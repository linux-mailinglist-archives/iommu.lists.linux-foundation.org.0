Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A325E2FB
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 22:47:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B3AA2E1F4;
	Fri,  4 Sep 2020 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXHIOWNJfrNK; Fri,  4 Sep 2020 20:47:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 916582E1F2;
	Fri,  4 Sep 2020 20:47:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62774C0051;
	Fri,  4 Sep 2020 20:47:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A57DC0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3290F875C5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 20:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHoK6XCB4Kzv for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 20:47:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADD08875B0
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 20:47:05 +0000 (UTC)
IronPort-SDR: tM/1lTIk6ESmLQxrJkbo/mLBLiRoYTRbzDExyNu4BWLu8pFjKMxRHAqKEn5SKo5Px8SLO3kZ1J
 AWvR29QS8zeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="137865024"
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; d="scan'208";a="137865024"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 13:47:05 -0700
IronPort-SDR: 8NER1YNk1rEIiCTIDhyqs/wt8RBbGLsTyJpKcsCwbj3ykC4KTFqH9mCIQckmsB2TFSkyQREo0C
 839Q1CE5ZILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; d="scan'208";a="326806381"
Received: from otcwcpicx6.sc.intel.com ([172.25.55.29])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2020 13:47:05 -0700
Date: Fri, 4 Sep 2020 20:47:04 +0000
From: Fenghua Yu <fenghua.yu@intel.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v7 1/9] iommu: Change type of pasid to u32
Message-ID: <20200904204704.GA414801@otcwcpicx6.sc.intel.com>
References: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
 <1598540794-132666-2-git-send-email-fenghua.yu@intel.com>
 <20200904104614.GE21499@zn.tnic>
 <20200904160613.GA412013@otcwcpicx6.sc.intel.com>
 <20200904194519.GA22577@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904194519.GA22577@zn.tnic>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Andy Lutomirski <luto@kernel.org>,
 H Peter Anvin <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
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

Hi, Boris,

On Fri, Sep 04, 2020 at 09:45:19PM +0200, Borislav Petkov wrote:
> On Fri, Sep 04, 2020 at 04:06:13PM +0000, Fenghua Yu wrote:
> > Thank you very much for your review!
> 
> I'm not done with my review yet.
> 
> > Could you please consider to commit the series?
> 
> Fenghua, how long are you doing kernel development? When do patches get
> considered for inclusion? I'm sure you know the answer...
> 
> > I can send out v8 with the subject "drm," change if you want me to do
> > so.
> 
> Pls be patient until I/we are done with the review.

Really appreciate your help here!

Please let me know any comments and I'll address them ASAP. I'm just eager
to see the patches upstreamed:)

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
