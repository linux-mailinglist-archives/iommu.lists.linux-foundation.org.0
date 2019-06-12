Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7240D431DD
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 01:19:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 298D62D14;
	Wed, 12 Jun 2019 23:18:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 66EDB215B
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 17:58:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4EB379
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 17:58:47 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i21so12266693ita.5
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iJG2vQZhcPeJyWwyoiZlnIBWFYcWNy7uPN6RTvt3o+0=;
	b=XzeKPY4UghingG2IHUZj64o5cUYXhSbgoRNlc2ZYSYp19Xb8MeOj9g4cyCBylvQIJh
	wLdBJkIJKdeeyzOChwsKtMRRjxXx+i7HA90CEf1Zjd+ke64dOY4eZ0vo4X+P8bUVg2x8
	cTnwDbkdqGs29ml8EOlAOsZ/CeH1L2BFZnzI96H2449TrjsRS3mLgYGPhGde3CEOFWTU
	d5rtmjG4RDEjw06GweP8Ae/jfnCaibpeyqnj1mhSIkHNUliG5KoRzga9xg6ZfrcBJTBP
	toh6V70LGrupSKYSDQK32DkuGqg9WZcJzYMNZ1/7Wmtg2LyTXR72r+qsWNzwhviHYpN8
	SWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iJG2vQZhcPeJyWwyoiZlnIBWFYcWNy7uPN6RTvt3o+0=;
	b=LhzR36YNVYGYCItmlp/8u0vyHIrYAjuRiV8kgJ7HYrfkbhsd0u8fvaTyzbOXiOEIUz
	mNUphAv/D3fSUeHAbkSSCYNmsnGCvXIXLMX1DIxeVBaUXNquw7HugKpEi8Cp1rvhRZtp
	IPQHLbcRrJQPq/IY6qdfV4OukgWxM9rGBEDxUnQx5TXhrhkDKrQ9wO4FjS25wE7tVtzU
	W5hyjItCQh8v/KdVvUukjxxm7WlbP+nKN4scbqbKxj7LS4lFG5kpCS9XntPmJm2MZi5D
	qeBdLPAip8sjjbLAqbpqq3NZw8vpNi7QMQLRkXfzpko3KOK0tqppbFLYcrZTIowxOaY3
	1U6w==
X-Gm-Message-State: APjAAAWnlozm6gc8Xg3Jjod5aeNiskJf4hBkphInwynJHbIlc1RRhusi
	ht/vK4yJ8hY0tw5EyMkTOXKp0Dqv1+BS4e5HMDI=
X-Google-Smtp-Source: APXvYqy8FsnT2tXAP9AmLOyZ4r6ik6vu3DdC9qVPGnxzd/WzDMecFvfZ2ITzSGUE4E2Ce+Va6U+5wKKkP5QgrxvaLiI=
X-Received: by 2002:a02:7121:: with SMTP id n33mr52373916jac.19.1560362326654; 
	Wed, 12 Jun 2019 10:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190605210856.20677-1-bjorn.andersson@linaro.org>
	<20190605210856.20677-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190605210856.20677-3-bjorn.andersson@linaro.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 12 Jun 2019 11:58:35 -0600
Message-ID: <CAOCk7Nocb7VO5xCcuK1FAPVdPr9U-7z8qOL4yt3ig=05e7brgg@mail.gmail.com>
Subject: Re: [RFC 2/2] iommu: arm-smmu: Don't blindly use first SMR to
	calculate mask
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 12 Jun 2019 23:16:10 +0000
Cc: Patrick Daly <pdaly@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
	MSM <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>,
	lkml <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 5, 2019 at 3:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> With the SMRs inherited from the bootloader the first SMR might actually
> be valid and in use. As such probing the SMR mask using the first SMR
> might break a stream in use. Search for an unused stream and use this to
> probe the SMR mask.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

I don't quite like the situation where the is no SMR to compute the mask, but I
think the way you've handled it is the best option/

I'm curious, why is this not included in patch #1?  Seems like patch
#1 introduces
the issue, yet doesn't also fix it.

> ---
>  drivers/iommu/arm-smmu.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index c8629a656b42..0c6f5fe6f382 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1084,23 +1084,35 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
>  {
>         void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
>         u32 smr;
> +       int idx;
>
>         if (!smmu->smrs)
>                 return;
>
> +       for (idx = 0; idx < smmu->num_mapping_groups; idx++) {
> +               smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
> +               if (!(smr & SMR_VALID))
> +                       break;
> +       }
> +
> +       if (idx == smmu->num_mapping_groups) {
> +               dev_err(smmu->dev, "Unable to compute streamid_mask\n");
> +               return;
> +       }
> +
>         /*
>          * SMR.ID bits may not be preserved if the corresponding MASK
>          * bits are set, so check each one separately. We can reject
>          * masters later if they try to claim IDs outside these masks.
>          */
>         smr = smmu->streamid_mask << SMR_ID_SHIFT;
> -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
>         smmu->streamid_mask = smr >> SMR_ID_SHIFT;
>
>         smr = smmu->streamid_mask << SMR_MASK_SHIFT;
> -       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
> -       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
> +       writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(idx));
> +       smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(idx));
>         smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
>  }
>
> --
> 2.18.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
