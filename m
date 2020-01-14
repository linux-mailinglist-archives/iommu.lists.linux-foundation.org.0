Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0070A13A8C8
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 12:56:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE6D9858F7;
	Tue, 14 Jan 2020 11:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFKXrRwrd-KT; Tue, 14 Jan 2020 11:56:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D82E6857D6;
	Tue, 14 Jan 2020 11:56:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8617C077D;
	Tue, 14 Jan 2020 11:56:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E893AC077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D6218203F0
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPgRijH30HCa for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 11:56:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D30A2203C7
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 11:56:17 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2B6424672;
 Tue, 14 Jan 2020 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579002977;
 bh=ahbXe4hwMQQLlrN5u66UYJDrMHT3NIY/p5dKKof/mlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZd5ICnclBnHLWVfm9YUQb5LWnL7oJhvwxZkC88/Qfz/xVf7KUgZ8/ayoCIO7ZVY4
 kzZacU3EMKl9p71FFs2ixfivPi6PsnxWs/K7aKsLkECRQmsPqQyhhtdDdv7bv1Inov
 /MVYLw34ynCIxhIjPlRlKlOz7eRnPqLnOObYNQdM=
Date: Tue, 14 Jan 2020 11:56:11 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 06/13] iommu/arm-smmu-v3: Add context descriptor
 tables allocators
Message-ID: <20200114115611.GB29222@willie-the-truck>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
 <20191219163033.2608177-7-jean-philippe@linaro.org>
 <20200114110651.GA29222@willie-the-truck>
 <20200114115230.GA1799@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114115230.GA1799@myrica>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, guohanjun@huawei.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Tue, Jan 14, 2020 at 12:52:30PM +0100, Jean-Philippe Brucker wrote:
> On Tue, Jan 14, 2020 at 11:06:52AM +0000, Will Deacon wrote:
> > >  /* Context descriptor manipulation functions */
> > > +static int arm_smmu_alloc_cd_leaf_table(struct arm_smmu_device *smmu,
> > > +					struct arm_smmu_cd_table *table,
> > > +					size_t num_entries)
> > > +{
> > > +	size_t size = num_entries * (CTXDESC_CD_DWORDS << 3);
> > > +
> > > +	table->ptr = dmam_alloc_coherent(smmu->dev, size, &table->ptr_dma,
> > > +					 GFP_KERNEL);
> > > +	if (!table->ptr) {
> > > +		dev_warn(smmu->dev,
> > > +			 "failed to allocate context descriptor table\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static void arm_smmu_free_cd_leaf_table(struct arm_smmu_device *smmu,
> > > +					struct arm_smmu_cd_table *table,
> > > +					size_t num_entries)
> > > +{
> > > +	size_t size = num_entries * (CTXDESC_CD_DWORDS << 3);
> > > +
> > > +	dmam_free_coherent(smmu->dev, size, table->ptr, table->ptr_dma);
> > > +}
> > 
> > I think we'd be better off taking the 'arm_smmu_s1_cfg' as a parameter here
> > instead of the table pointer and a num_entries value, since the code above
> > implies that we support partial freeing of the context descriptors.
> > 
> > I can do that as a follow-up patch if you agree. Thoughts?
> 
> Do you mean only changing the arguments of arm_smmu_free_cd_leaf_table(),
> or arm_smmu_alloc_cd_leaf_table() as well? For free() I agree, for alloc()
> I'm not sure it would look better.

Yeah, just for free(). I'll spin something on top after I've finished
reviewing the series.

> For my tests I have a debug patch that allocates PASIDs randomly which
> quickly consumes DMA for leaf tables. So I do have to free the leaves
> individually when they aren't used, but it will be easy for me to update.

Cool.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
