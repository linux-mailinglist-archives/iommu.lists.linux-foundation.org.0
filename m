Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA7E9ED6
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 16:26:16 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F728E9D;
	Wed, 30 Oct 2019 15:26:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED762E81
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:26:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 88C8863D
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:26:10 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1A5DF20679;
	Wed, 30 Oct 2019 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572449170;
	bh=XcPD3xE6chl5TShbhycG8IYFjMN9avqjqETDunPqgSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP0+bW9f19MhlLE1t+Pl7Gx9d90rr4NBUDe7X4lm9LMte0Y0INnpMPk8Z0v3ZkRNV
	8p1W9ZGNVsxaKqb/e/k+UX8N9LZ0sfmrpYsApOMyse1zMqPf3XamTW3i+c2hDFh0u8
	jlNrZEjE+w9V8ob44EM8Gat4/AgH5RtY4kGRnHO4=
Date: Wed, 30 Oct 2019 15:26:05 +0000
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] iommu/arm-smmu: Allow building as a module
Message-ID: <20191030152605.GA19096@willie-the-truck>
References: <20191030145112.19738-1-will@kernel.org>
	<20191030145112.19738-8-will@kernel.org>
	<20191030152212.ifzhl2w3knapc367@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030152212.ifzhl2w3knapc367@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>
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

Hi Rob,

On Wed, Oct 30, 2019 at 10:22:12AM -0500, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 02:51:12PM +0000, Will Deacon wrote:
> > By conditionally dropping support for the legacy binding and exporting
> > the newly introduced 'arm_smmu_impl_init()' function we can allow the
> > ARM SMMU driver to be built as a module.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  drivers/iommu/Kconfig         | 14 ++++++++-
> >  drivers/iommu/arm-smmu-impl.c |  6 ++++
> >  drivers/iommu/arm-smmu.c      | 54 +++++++++++++++++++++--------------
> >  3 files changed, 51 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 7583d47fc4d5..02703f51e533 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -350,7 +350,7 @@ config SPAPR_TCE_IOMMU
> >  
> >  # ARM IOMMU support
> >  config ARM_SMMU
> > -	bool "ARM Ltd. System MMU (SMMU) Support"
> > +	tristate "ARM Ltd. System MMU (SMMU) Support"
> >  	depends on (ARM64 || ARM) && MMU
> >  	select IOMMU_API
> >  	select IOMMU_IO_PGTABLE_LPAE
> > @@ -362,6 +362,18 @@ config ARM_SMMU
> >  	  Say Y here if your SoC includes an IOMMU device implementing
> >  	  the ARM SMMU architecture.
> >  
> > +config ARM_SMMU_LEGACY_DT_BINDINGS
> > +	bool "Support the legacy \"mmu-masters\" devicetree bindings"
> 
> Can't we just remove this now? The only user is Seattle. Is anyone still 
> using Seattle AND DT? There's been no real dts change since Feb '16.
> There's a bit of clean-up needed in the Seattle dts files, so I'd like 
> to remove them if there's not users.
> 
> If there are users, can't we just make them move to the new binding? 
> Yes compatibility, but that really depends on the users caring.
> 
> I though Calxeda was using this too, but I guess we didn't get that 
> finished. We should probably remove that secure mode flag as well.

There was a recent mail from somebody using TX1 with this binding, although
it didn't actually appear to be working (but I'm not sure how much of that
is the bindings fault):

http://lists.infradead.org/pipermail/linux-arm-kernel/2019-October/683992.html

However, I agree with you, which is why the new Kconfig option actually
disables the legacy bindings by default in the hope that we can remove it
in a few releases time, with an easy "get things sorta working" option in
the meantime.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
