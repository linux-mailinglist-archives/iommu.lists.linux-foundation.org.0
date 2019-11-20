Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 10287104425
	for <lists.iommu@lfdr.de>; Wed, 20 Nov 2019 20:18:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B357F88FCA;
	Wed, 20 Nov 2019 19:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf2sbMR-lIUM; Wed, 20 Nov 2019 19:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB0B488FC8;
	Wed, 20 Nov 2019 19:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B120AC18DA;
	Wed, 20 Nov 2019 19:18:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D069C18DA
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 19:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6333F2E846
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 19:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdWu+XCqrxqo for <iommu@lists.linux-foundation.org>;
 Wed, 20 Nov 2019 19:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id CE5B42E848
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 19:18:31 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E652020855;
 Wed, 20 Nov 2019 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574277511;
 bh=Ssfx4CJHpMammtH5BPVwDenu7QC6d8HZXPkTNCSMfXw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=WGnWjh8EO6X5mm63XsuyeBLs3ywKIWBqzkVVBChkiRDF/xkFaHFQzJhPbBNn//p5k
 YAgJswMFkv1+svrvAvfiRBYc0kJry7vep3GkykWRQYCIuhjS1brvMADy2gUZyD4wGa
 1tQtyRbhGKTQNzMA7XM1++IBWa2JkaBtXztIu3CA=
Date: Wed, 20 Nov 2019 19:18:27 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/10] iommu/io-pgtable-arm: Prepare for TTBR1 usage
Message-ID: <20191120191827.GE4799@willie-the-truck>
References: <cover.1572024119.git.robin.murphy@arm.com>
 <9ec05935de3f1c1da5d1780201147ed40e129295.1572024120.git.robin.murphy@arm.com>
 <20191104234006.GC16446@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104234006.GC16446@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Nov 04, 2019 at 04:40:06PM -0700, Jordan Crouse wrote:
> On Fri, Oct 25, 2019 at 07:08:39PM +0100, Robin Murphy wrote:
> > Now that we can correctly extract top-level indices without relying on
> > the remaining upper bits being zero, the only remaining impediments to
> > using a given table for TTBR1 are the address validation on map/unmap
> > and the awkward TCR translation granule format. Add a quirk so that we
> > can do the right thing at those points.
> 
> This looks great.  I have one comment about the TCR.A1 bit below but otherwise
> this is sane. My immediate todo this week and next is to try to get something
> spun up and working on the db845 for verification.

How did that go?

> > @@ -800,15 +812,16 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> >  		tcr->orgn = ARM_LPAE_TCR_RGN_NC;
> >  	}
> >  
> > +	tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;
> >  	switch (ARM_LPAE_GRANULE(data)) {
> >  	case SZ_4K:
> > -		tcr->tg = ARM_LPAE_TCR_TG0_4K;
> > +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_4K : ARM_LPAE_TCR_TG0_4K;
> >  		break;
> >  	case SZ_16K:
> > -		tcr->tg = ARM_LPAE_TCR_TG0_16K;
> > +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_16K : ARM_LPAE_TCR_TG0_16K;
> >  		break;
> >  	case SZ_64K:
> > -		tcr->tg = ARM_LPAE_TCR_TG0_64K;
> > +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_64K : ARM_LPAE_TCR_TG0_64K;
> >  		break;
> >  	}
> 
> The comment in one of the previous patches about the ASID in TTBR1 triggered
> something in my brain. v2 TCR A1,bit[22] controls from which TTBR the ASID is
> used I'm not sure if that qualifies as a quirk here or if it should be entirely
> handled within arm_smmu_lpae_tcr() but I thought I should point it out.

That should be confined entirely to the driver code though, no? The
io-pgtable code doesn't go near ASIDs or the A1 bit.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
