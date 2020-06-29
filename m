Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925420E893
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 00:39:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D073C86D9A;
	Mon, 29 Jun 2020 22:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfijSb46Ok7u; Mon, 29 Jun 2020 22:39:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8C4586DDE;
	Mon, 29 Jun 2020 22:39:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA4FBC016E;
	Mon, 29 Jun 2020 22:39:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A8D5C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 22:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CE882203BF
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 22:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixxFnQtSbMQc for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 22:39:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 29451203A6
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 22:39:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u185so6482044pfu.1
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7Iu1xPBy5WXwkFFBJOQd76GqrMB06IUJO2waW3mfV8U=;
 b=gTjvUlyTbHz0oJ+ZTJLVjld7MNptvaKU+FuhJs4PHp3VJe7iD78Wnm9qRxP8sGXjkT
 E9n88VrbVyaaM7G/LYjUvQiLO7DTUFz4TNpthv+odbNS6JzQ/4X/5soG013CP6gGIKqC
 fDdzcbxURl4O6Mo+D1YcpoaPilqUwVZhIgGTvtcfp1+Fl9ZZ8INKmvFWWz/i4fBpobtz
 wLsJ1LxWtrcbCgu/x541ND/jRxqGlS0WqWGorP031pC+XmEF6FatSkgYj2F7HGJe3ZMT
 I4Rs4uU+0dsDsK76hJhLW7C0n8dCf/+d1/TbpKay5dGxgUCKgURjQ9aol0DVoL+7UBhS
 3fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Iu1xPBy5WXwkFFBJOQd76GqrMB06IUJO2waW3mfV8U=;
 b=SubePr35BDLQLwqYAlvq1tl+I0EdxCPQJC2qf0MlDn3rSyVYkn/HOpyLFSPqa9LIzx
 oeo7ok2jImakzfXNWk5d2i+eU9WVVAvWYtClD+K1i9jcWwZoDRPtgyEm7m6TFprA6NSI
 yewsKhyQ5dkhyn8COakSnkNXP3yUw4ryNRJ4WI7lvs/HxUomWI/Gkibk7GhBhfazTV8C
 EF+0zXhCol6bqS7OCpSQaEVwzipExXW8Yyx4RStKPMmXoOkbpTAuTf7glKe1yJ4UJnmy
 +I0CSe/RAs6E//SBV6HzLjQY2z6RYSAe+V9jxAOkklJTZL+pxkQFxJMnQX2baqhgkuhs
 hkxw==
X-Gm-Message-State: AOAM531Kv5QcIf1qe45PY7rZ/EzRFSH8snXL0JFYfOXtQfaWyzd3H+VE
 NqTWtaPTHqXkrmlFvpy2VLk=
X-Google-Smtp-Source: ABdhPJxyJjEs525bJOi/owsnsyMW+4K2ovHEsNcudSFqdc/+fbfQqaH+B0HBZxSn54knZLvM1RiQYQ==
X-Received: by 2002:a63:531e:: with SMTP id h30mr11821163pgb.165.1593470347620; 
 Mon, 29 Jun 2020 15:39:07 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id z1sm458786pjz.10.2020.06.29.15.39.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jun 2020 15:39:07 -0700 (PDT)
Date: Mon, 29 Jun 2020 15:38:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v7 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Message-ID: <20200629223833.GE27967@Asurada-Nvidia>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-4-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629022838.29628-4-vdumpa@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: snikam@nvidia.com, mperttunen@nvidia.com, bhuntsman@nvidia.com,
 will@kernel.org, linux-kernel@vger.kernel.org, praithatha@nvidia.com,
 talho@nvidia.com, iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On Sun, Jun 28, 2020 at 07:28:38PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow NVIDIA SMMU implementation
> handle faults across multiple SMMUs.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>

> +static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
> +					       struct arm_smmu_device *smmu,
> +					       int inst)
> +{
> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
> +	void __iomem *gr0_base = nvidia_smmu_page(smmu, inst, 0);
> +
> +	gfsr = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
> +	gfsynr0 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
> +	gfsynr1 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
> +	gfsynr2 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
> +
> +	if (!gfsr)
> +		return IRQ_NONE;

Could move this before gfsynr readings to save some readl() for
!gfsr cases?

> +static irqreturn_t nvidia_smmu_context_fault_bank(int irq,

> +	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
[...]
> +	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
[...]
> +	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);

It reads FSR of the default inst (1st), but clears the FSR of
corresponding inst -- just want to make sure that this is okay
and intended.

> @@ -185,7 +283,8 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
>  	}
>  
>  	nvidia_smmu->smmu.impl = &nvidia_smmu_impl;
> -	/* Free the arm_smmu_device struct allocated in arm-smmu.c.
> +	/*
> +	 * Free the arm_smmu_device struct allocated in arm-smmu.c.
>  	 * Once this function returns, arm-smmu.c would use arm_smmu_device
>  	 * allocated as part of nvidia_smmu struct.
>  	 */

Hmm, this coding style fix should be probably squashed into PATCH-1?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
