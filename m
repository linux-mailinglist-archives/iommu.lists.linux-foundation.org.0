Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D191BCDC8
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 22:58:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3C69862CA;
	Tue, 28 Apr 2020 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6_BHSENmRLd; Tue, 28 Apr 2020 20:58:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE1DC868E4;
	Tue, 28 Apr 2020 20:58:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95B33C0172;
	Tue, 28 Apr 2020 20:58:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD6BEC0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A6B8888311
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3hb+51CFmZK for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3E04888164
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:58:17 +0000 (UTC)
IronPort-SDR: idE+X+Y61FhsdkZYd0h0vKhh35qOfhiryu6z6SC45GamuBoWjOYn9lF/wHS75Q6rTZrm6n8ioR
 Ex8YYor7LVQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 13:58:16 -0700
IronPort-SDR: pygPwoLUgJeiETJ1sloDS2DdGwuUtTzeCBhfufFSE3zoYrNEjecBG2eUJwiGcoh55mkFBtbLGR
 y3n+sZVRHBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="367614156"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2020 13:58:16 -0700
Date: Tue, 28 Apr 2020 13:57:19 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 5/7] x86/mmu: Allocate/free PASID
Message-ID: <20200428205718.GG242333@romley-ivt3.sc.intel.com>
References: <1585596788-193989-1-git-send-email-fenghua.yu@intel.com>
 <1585596788-193989-6-git-send-email-fenghua.yu@intel.com>
 <87pnbus3du.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pnbus3du.fsf@nanos.tec.linutronix.de>
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

On Sun, Apr 26, 2020 at 04:55:25PM +0200, Thomas Gleixner wrote:
> Fenghua Yu <fenghua.yu@intel.com> writes:
> > diff --git a/arch/x86/include/asm/mmu.h b/arch/x86/include/asm/mmu.h
> > index bdeae9291e5c..137bf51f19e6 100644
> > --- a/arch/x86/include/asm/mmu.h
> > +++ b/arch/x86/include/asm/mmu.h
> > @@ -50,6 +50,10 @@ typedef struct {
> >  	u16 pkey_allocation_map;
> >  	s16 execute_only_pkey;
> >  #endif
> > +
> > +#ifdef CONFIG_INTEL_IOMMU_SVM
> > +	int pasid;
> 
> int? It's a value which gets programmed into the MSR along with the
> valid bit (bit 31) set. 

BTW, ARM is working on PASID as well. Christoph suggested that the PASID
should be defined in mm_struct instead of mm->context so that both ARM and X86
can access it:
https://lore.kernel.org/linux-iommu/20200414170252.714402-1-jean-philippe@linaro.org/T/#mb57110ffe1aaa24750eeea4f93b611f0d1913911

So I will define "pasid" to mm_struct in a separate patch in the next version.

Thanks.

-Fenghua

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
