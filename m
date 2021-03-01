Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D5329500
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 23:58:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA0D4F219;
	Mon,  1 Mar 2021 22:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoOPmYi0_wMb; Mon,  1 Mar 2021 22:58:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E0A4F20F;
	Mon,  1 Mar 2021 22:58:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEC1EC0001;
	Mon,  1 Mar 2021 22:57:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0008CC0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 22:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD7E6F484
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 22:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbB74dfPZOng for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 22:57:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12E09606DF
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 22:57:57 +0000 (UTC)
IronPort-SDR: ck1N/lm60G36vN1wD88jOAwTkP1O9k9oQ1gr+9lHlGGiiK2xPQ3q9J45Gp1gNpwmEjxKKOlljO
 rNDzv84QzR+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="183223414"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="183223414"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 14:57:57 -0800
IronPort-SDR: tJve8x1cqIyj1Zp29MjKeC6e8QzZkBYQiEg5LY5/Q2mEq6QeMUgOU1orgYtb4aPV0pYaO/g7ns
 twgRDb4Xl6sA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="368758360"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 14:57:57 -0800
Date: Mon, 1 Mar 2021 15:00:11 -0800
From: Jacob Pan <jacob.jun.pan@intel.com>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v6 08/12] fork: Clear PASID for new mm
Message-ID: <20210301150011.766e70a3@jacob-builder>
In-Reply-To: <YDgh53AcQHT+T3L0@otcwcpicx3.sc.intel.com>
References: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
 <1594684087-61184-9-git-send-email-fenghua.yu@intel.com>
 <YDYoL/zZ9YaGgwSV@myrica>
 <YDgh53AcQHT+T3L0@otcwcpicx3.sc.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ashok Raj <ashok.raj@intel.com>, zhangfei.gao@foxmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Hi Fenghua,

On Thu, 25 Feb 2021 22:17:11 +0000, Fenghua Yu <fenghua.yu@intel.com> wrote:

> Hi, Jean,
> 
> On Wed, Feb 24, 2021 at 11:19:27AM +0100, Jean-Philippe Brucker wrote:
> > Hi Fenghua,
> > 
> > [Trimmed the Cc list]
> > 
> > On Mon, Jul 13, 2020 at 04:48:03PM -0700, Fenghua Yu wrote:  
> > > When a new mm is created, its PASID should be cleared, i.e. the PASID
> > > is initialized to its init state 0 on both ARM and X86.  
> > 
> > I just noticed this patch was dropped in v7, and am wondering whether we
> > could still upstream it. Does x86 need a child with a new address space
> > (!CLONE_VM) to inherit the PASID of the parent?  That doesn't make much
> > sense with regard to IOMMU structures - same PASID indexing multiple
> > PGDs?  
> 
> You are right: x86 should clear mm->pasid when a new mm is created.
> This patch somehow is losted:(
> 
> > 
> > Currently iommu_sva_alloc_pasid() assumes mm->pasid is always
> > initialized to 0 and fails on forked tasks. I'm trying to figure out
> > how to fix this. Could we clear the pasid on fork or does it break the
> > x86 model?  
> 
> x86 calls ioasid_alloc() instead of iommu_sva_alloc_pasid(). So
We should consolidate at some point, there is no need to store pasid in two
places.

> functionality is not a problem without this patch on x86. But I think
I feel the reason that x86 doesn't care is that mm->pasid is not used
unless bind_mm is called. For the fork children even mm->pasid is non-zero,
it has no effect since it is not loaded onto MSRs.
Perhaps you could also add a check or WARN_ON(!mm->pasid) in load_pasid()?

> we do need to have this patch in the kernel because PASID is per addr
> space and two addr spaces shouldn't have the same PASID.
> 
Agreed.

> Who will accept this patch?
> 
> Thanks.
> 
> -Fenghua


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
