Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE5261AEE
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 20:46:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 617C081E21;
	Tue,  8 Sep 2020 18:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzoHiFfiLeTV; Tue,  8 Sep 2020 18:46:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF53F872A2;
	Tue,  8 Sep 2020 18:46:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A93E6C0051;
	Tue,  8 Sep 2020 18:46:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76E7C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 99800275A5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVkw5OSBhCJ8 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by silver.osuosl.org (Postfix) with ESMTPS id 1599C274ED
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599590783;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=XYPnjA0MRzA0A/fJXn3clO2nfgIwdaUl5HRpG8otbc8=;
 b=QkYfhVL/NwqDy28tcCc9rFFrsBvzFEaOAHHnp3he/jw38mQTl97vLjxorQUiSYuK
 Idn20po8+hGAE8WeslWU0CNI2ouLrP3VSprkxOk9OKD25MbvjVukw3rPV1ao24Ve+eU
 9rFiWkKdgpsKlpH2PGeZx4nJ0XW1LVu9ww8IqBDI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599590783;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=XYPnjA0MRzA0A/fJXn3clO2nfgIwdaUl5HRpG8otbc8=;
 b=CID+lFANKTjJWaOarmyQQ0N2K+YKPUCJCcTmiu/4vnPwcADjuKS1h0lzzvrEePPF
 s7SB55HHMltNoE5Zo4O7E1/eQuGdn2p5CEDlnsf5r16g9NefLggmqK9zdO1a/qx+7L3
 CSTxSCOYseY8elmguo8lX6+vy8OBRPaed9oc8feQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12C95C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 8 Sep 2020 18:46:23 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>, Sibi Sankar <sibis@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] iommu/arm-smmu: Refactor context bank allocation
Message-ID: <010101746f0a5980-71ffe4a2-d66b-4a21-bd74-d29f606607dd-000000@us-west-2.amazonses.com>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-2-bjorn.andersson@linaro.org>
 <010101746f066ece-dac1eef9-768d-4c90-95fd-56900d13b4c9-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <010101746f066ece-dac1eef9-768d-4c90-95fd-56900d13b4c9-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.08-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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

On Tue, Sep 08, 2020 at 06:42:06PM +0000, Jordan Crouse wrote:
> On Fri, Sep 04, 2020 at 03:55:06PM +0000, Bjorn Andersson wrote:
> > Extract the conditional invocation of the platform defined
> > alloc_context_bank() to a separate function to keep
> > arm_smmu_init_domain_context() cleaner.
> > 
> > Instead pass a reference to the arm_smmu_device as parameter to the
> > call. Also remove the count parameter, as this can be read from the
> > newly passed object.
> > 
> > This allows us to not assign smmu_domain->smmu before attempting to
> > allocate the context bank and as such we don't need to roll back this
> > assignment on failure.
> 
> Much nicer.
> 
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

I didn't notice that Rob had grabbed this one for his stack. That's fine too.

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Note that this series applies ontop of:
> > https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
> > 
> > This could either go on its own, or be squashed with "[PATCH v16 14/20]
> > iommu/arm-smmu: Prepare for the adreno-smmu implementation" from Rob's series.
> > 
> > Changes since v2:
> > - New patch
> > 
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  6 ++++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 23 ++++++++++++----------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
> >  3 files changed, 19 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > index 2aa6249050ff..0663d7d26908 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -91,9 +91,10 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
> >  }
> >  
> >  static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> > -		struct device *dev, int start, int count)
> > +					       struct arm_smmu_device *smmu,
> > +					       struct device *dev, int start)
> >  {
> > -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> > +	int count;
> >  
> >  	/*
> >  	 * Assign context bank 0 to the GPU device so the GPU hardware can
> > @@ -104,6 +105,7 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
> >  		count = 1;
> >  	} else {
> >  		start = 1;
> > +		count = smmu->num_context_banks;
> >  	}
> >  
> >  	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index bbec5793faf8..e19d7bdc7674 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -623,6 +623,16 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
> >  }
> >  
> > +static int arm_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> > +				       struct arm_smmu_device *smmu,
> > +				       struct device *dev, unsigned int start)
> > +{
> > +	if (smmu->impl && smmu->impl->alloc_context_bank)
> > +		return smmu->impl->alloc_context_bank(smmu_domain, smmu, dev, start);
> > +
> > +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, smmu->num_context_banks);
> > +}
> > +
> >  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  					struct arm_smmu_device *smmu,
> >  					struct device *dev)
> > @@ -741,20 +751,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		goto out_unlock;
> >  	}
> >  
> > -	smmu_domain->smmu = smmu;
> > -
> > -	if (smmu->impl && smmu->impl->alloc_context_bank)
> > -		ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
> > -				start, smmu->num_context_banks);
> > -	else
> > -		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> > -				      smmu->num_context_banks);
> > -
> > +	ret = arm_smmu_alloc_context_bank(smmu_domain, smmu, dev, start);
> >  	if (ret < 0) {
> > -		smmu_domain->smmu = NULL;
> >  		goto out_unlock;
> >  	}
> >  
> > +	smmu_domain->smmu = smmu;
> > +
> >  	cfg->cbndx = ret;
> >  	if (smmu->version < ARM_SMMU_V2) {
> >  		cfg->irptndx = atomic_inc_return(&smmu->irptndx);
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 2df3a70a8a41..ddf2ca4c923d 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -437,7 +437,8 @@ struct arm_smmu_impl {
> >  	irqreturn_t (*global_fault)(int irq, void *dev);
> >  	irqreturn_t (*context_fault)(int irq, void *dev);
> >  	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> > -			struct device *dev, int start, int max);
> > +				  struct arm_smmu_device *smmu,
> > +				  struct device *dev, int start);
> >  };
> >  
> >  #define INVALID_SMENDX			-1
> > -- 
> > 2.28.0
> > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
