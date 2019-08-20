Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DE9657A
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 17:50:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4FD9BE5A;
	Tue, 20 Aug 2019 15:50:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5AB9CE3E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:50:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E681B89B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:50:47 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A2DCB22CE3;
	Tue, 20 Aug 2019 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566316247;
	bh=ANVTtr5Xsou0jrnOGs4/B/GU+B2WDK+TAYrfLomhjio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTQS3qDiX8U9XJEr4PxCXNlFxiDFBAS0nBEFkMdUxA8fn8j7Cm837FD7d4JmjcD1I
	tUCaZ92tiWPS7nJQVToZx3mwggI6hk62RIMxNJ+yP0IgNi0kLC1CXYoWBkSfymA/Kd
	e7OM4Itc9lTjZdoZYaRahocomAdfDh4af8+nErWY=
Date: Tue, 20 Aug 2019 16:50:43 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/4] iommu/io-pgtable-arm: Rationalise TTBRn handling
Message-ID: <20190820155042.t4a67qhzlglevo5a@willie-the-truck>
References: <cover.1566238530.git.robin.murphy@arm.com>
	<dbb942070c2ef812e379414c236734931613d860.1566238530.git.robin.murphy@arm.com>
	<20190820101911.ndwtaf76kn3zplk2@willie-the-truck>
	<e644e0f6-4588-56eb-a6e9-7b482e3d228d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e644e0f6-4588-56eb-a6e9-7b482e3d228d@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, Aug 20, 2019 at 03:17:19PM +0100, Robin Murphy wrote:
> On 20/08/2019 11:19, Will Deacon wrote:
> > On Mon, Aug 19, 2019 at 07:19:29PM +0100, Robin Murphy wrote:
> > > TTBR1 values have so far been redundant since no users implement any
> > > support for split address spaces. Crucially, though, one of the main
> > > reasons for wanting to do so is to be able to manage each half entirely
> > > independently, e.g. context-switching one set of mappings without
> > > disturbing the other. Thus it seems unlikely that tying two tables
> > > together in a single io_pgtable_cfg would ever be particularly desirable
> > > or useful.
> > > 
> > > Streamline the configs to just a single conceptual TTBR value
> > > representing the allocated table. This paves the way for future users to
> > > support split address spaces by simply allocating a table and dealing
> > > with the detailed TTBRn logistics themselves.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   drivers/iommu/arm-smmu-v3.c        |  2 +-
> > >   drivers/iommu/arm-smmu.c           |  9 ++++-----
> > >   drivers/iommu/io-pgtable-arm-v7s.c | 16 +++++++---------
> > >   drivers/iommu/io-pgtable-arm.c     |  7 +++----
> > >   drivers/iommu/ipmmu-vmsa.c         |  2 +-
> > >   drivers/iommu/msm_iommu.c          |  4 ++--
> > >   drivers/iommu/mtk_iommu.c          |  4 ++--
> > >   drivers/iommu/qcom_iommu.c         |  3 +--
> > >   include/linux/io-pgtable.h         |  4 ++--
> > >   9 files changed, 23 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> > > index 2a8db896d698..2e50cf49c3c4 100644
> > > --- a/drivers/iommu/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm-smmu-v3.c
> > > @@ -1722,7 +1722,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
> > >   	}
> > >   	cfg->cd.asid	= (u16)asid;
> > > -	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
> > > +	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > >   	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
> > >   	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
> > >   	return 0;
> > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > index 184ca41e9de7..19030c4b5904 100644
> > > --- a/drivers/iommu/arm-smmu.c
> > > +++ b/drivers/iommu/arm-smmu.c
> > > @@ -473,13 +473,12 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> > >   	/* TTBRs */
> > >   	if (stage1) {
> > >   		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
> > > -			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr[0];
> > > -			cb->ttbr[1] = pgtbl_cfg->arm_v7s_cfg.ttbr[1];
> > > +			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
> > > +			cb->ttbr[1] = 0;
> > >   		} else {
> > > -			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
> > > +			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > >   			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> > > -			cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[1];
> > > -			cb->ttbr[1] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> > > +			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> > 
> > Why do you continue to put the ASID in here?
> 
> For the same reason we put it there before ;)
> 
> Although I guess if TCR.A1 were ever to get flipped accidentally then we're
> still cool.

Hmm, but we don't do this for other drivers, so I'd be inclined to zap it
with 0 for consistency.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
