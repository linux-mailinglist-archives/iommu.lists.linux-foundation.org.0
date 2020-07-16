Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD7221EE1
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 10:51:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E0398AF0B;
	Thu, 16 Jul 2020 08:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsrig+BKpTq5; Thu, 16 Jul 2020 08:51:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA92A8AE5D;
	Thu, 16 Jul 2020 08:51:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C6B1C0733;
	Thu, 16 Jul 2020 08:51:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84C1DC0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 66DC121546
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v70yqdK65HcA for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:50:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 8A8142052E
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 08:50:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7ABE2067D;
 Thu, 16 Jul 2020 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594889458;
 bh=U7X430J5V6ePsxTX3punZtP6BZO/DUniM8aSGD0rCbE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lZz7/S2vinkg3caYNt3YEW0+aHk66D0ubE/cVS+1d1BJj1TOMJLdy0VXqxtqvmFif
 cDATDWQ5495bMsQhe9jCZDMOaj8c/C54/Gzxzj3D8BOc5ai8vt33x1Nk/IMcu71aBm
 4fkAgq1cHMXKB9HNNTG5q2laTa6Mvod6Foqi0R5M=
Date: Thu, 16 Jul 2020 09:50:53 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
Message-ID: <20200716085053.GB6771@willie-the-truck>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-5-jcrouse@codeaurora.org>
 <20200713150901.GA3072@willie-the-truck>
 <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com>
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

On Mon, Jul 13, 2020 at 11:19:17AM -0600, Jordan Crouse wrote:
> On Mon, Jul 13, 2020 at 04:09:02PM +0100, Will Deacon wrote:
> > On Fri, Jun 26, 2020 at 02:00:38PM -0600, Jordan Crouse wrote:
> > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > index 5f2de20e883b..d33cfe26b2f5 100644
> > > --- a/drivers/iommu/arm-smmu.h
> > > +++ b/drivers/iommu/arm-smmu.h
> > > @@ -345,6 +345,7 @@ struct arm_smmu_domain {
> > >  	struct mutex			init_mutex; /* Protects smmu pointer */
> > >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> > >  	struct iommu_domain		domain;
> > > +	struct device			*dev;	/* Device attached to this domain */
> > 
> > This really doesn't feel right to me -- you can generally have multiple
> > devices attached to a domain and they can come and go without the domain
> > being destroyed. Perhaps you could instead identify the GPU during
> > cfg_probe() and squirrel that information away somewhere?
> 
> I need some help here. The SMMU device (qcom,adreno-smmu) will have at least two
> stream ids from two different platform devices (GPU and GMU) and I need to
> configure split-pagetable and stall/terminate differently on the two domains.

Hmm. How does the GPU driver know which context bank is assigned to the GPU
and which one is assigned to the GMU? I assume it needs this information so
that it can play its nasty tricks with the TTBR registers?

I ask because if we need to guarantee stability of the context-bank
assignment, then you could match on that in the ->init_context() callback,
but now I worry that it currently works by luck :/

Do we need to add an extra callback to allocate the context bank?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
