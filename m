Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F426DE71
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 16:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB3E7877E9;
	Thu, 17 Sep 2020 14:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hL-JGHzF9h9a; Thu, 17 Sep 2020 14:40:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDD2A877AE;
	Thu, 17 Sep 2020 14:40:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D35A4C089E;
	Thu, 17 Sep 2020 14:40:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42047C0051
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 14:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E3A387073
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 14:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pktiZRdXta4P for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 14:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3CE4C87035
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 14:40:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y15so2319595wmi.0
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AFLyIaK95Pcs3v3wg/rAuVTRxjhXIS5PXfpZ3zAaOv4=;
 b=nWLsOgjoU61ywvQ9ZZ82TsQRhow3wqYpSRb7J3wrgivoxq+dHXdSETF3r8wIxY00Am
 BIU5UH87TtUtB+HdqoiumsJLElQEnKYOVcBNrkycJGKU0aE2ZBcUW/HDU+JzXELttajy
 aWIjt7wufdqdBtB43FS6vYywByed9MFwtiI9wQrB9sICqofHKioVFZPGrsRqjfUHxjBO
 7uXR6+UQZrebS7j3o8Wr8jbOOphKwcs1eYzv/854R7WIliBwwohybQEvJJWKN1z2/yQA
 1v2Dea/oMLcs0y3iFzEMK9ef9WkXjT3mhbRMX/lDcTK1MXCvgAh+oCC6Thl4YvyWSTPu
 WvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AFLyIaK95Pcs3v3wg/rAuVTRxjhXIS5PXfpZ3zAaOv4=;
 b=HG1CoRBePdXLtsXrsb74UDcG+/rllvPDC9KRcPN8S7OrhLzvZ2QCSvfckh3YxXOvK6
 PSc40Zpm6Pat5eSUj3MW4crHrdSQarmvBR7qddM6m8Cf/BcG3xe05v4MzV+nJEX24jVS
 PwEF5fxWhhimguERpZVJRJtEpGUOyhhDA889ufDxUUgtqw9WgCkyyg/20njKXVW3tEFM
 x7M0cx+B2NQvPJK07C1MoY4twxu/aUm1DdlNyz6UyyiFBBTccjW5SyMLjhNBGTfq4eRx
 tkGAiXqyWsNBEIjCGDocKRLW7/gxaFFy8YwCOcWioNckmXj6r36HPv3PgOmC7/Z2SOJj
 0mAg==
X-Gm-Message-State: AOAM531YVfCdLFppZKu4IO9vaIeZu9JD0YhlCtI/GeZThslWFdJ6e+9Q
 fuTI/rSAqBSyUDmGiGf+kBjvjQ==
X-Google-Smtp-Source: ABdhPJxSUUGTyJ6hnRF8W/ZFmbozBT4cLiO00TWm8X3HAAtPbdXGCiYd8wCQULGNjrxSn5FlEfb6QQ==
X-Received: by 2002:a05:600c:2155:: with SMTP id
 v21mr10911853wml.118.1600353610755; 
 Thu, 17 Sep 2020 07:40:10 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id f16sm9869987wrp.47.2020.09.17.07.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:40:10 -0700 (PDT)
Date: Thu, 17 Sep 2020 16:39:51 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH RESEND v9 10/13] iommu/arm-smmu-v3: Check for SVA features
Message-ID: <20200917143951.GE134903@myrica>
References: <20200817171558.325917-1-jean-philippe@linaro.org>
 <20200817171558.325917-11-jean-philippe@linaro.org>
 <d8cef101-fae8-eead-a898-1fca5fe4faaf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8cef101-fae8-eead-a898-1fca5fe4faaf@redhat.com>
Cc: fenghua.yu@intel.com, will@kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, catalin.marinas@arm.com,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Tue, Sep 08, 2020 at 11:38:31AM +0200, Auger Eric wrote:
> Hi Jean,
> On 8/17/20 7:15 PM, Jean-Philippe Brucker wrote:
> > Aggregate all sanity-checks for sharing CPU page tables with the SMMU
> > under a single ARM_SMMU_FEAT_SVA bit. For PCIe SVA, users also need to
> > check FEAT_ATS and FEAT_PRI. For platform SVA, they will have to check
> > FEAT_STALLS.
> > 
> > Introduce ARM_SMMU_FEAT_BTM (Broadcast TLB Maintenance), but don't
> > enable it at the moment. Since the entire VMID space is shared with the
> > CPU, enabling DVM (by clearing SMMU_CR2.PTM) could result in
> > over-invalidation and affect performance of stage-2 mappings.
> In which series do you plan to enable it?

In the third part, after the PRI+stall series. I still haven't had time to
look at solving the stage-2 DVM problem (pinning VMIDs through KVM), so it
might be a while.

[...]
> > +	/*
> > +	 * See max_pinned_asids in arch/arm64/mm/context.c. The following is
> > +	 * generally the maximum number of bindable processes.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0))
> Out of curiosity, What is the rationale behind using
> arm64_kernel_unmapped_at_el0() versus
> IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0)?
> CPU caps being finalized?

I'm not sure. The caps are finalized at this point. I'll change it.

> Is that why you say "generally" here?

I said "generally" because having less PASIDs than ASIDs is in theory
possible, but hardware will normally support 20-bit PASIDs.

> > +		asid_bits--;
> > +	dev_dbg(smmu->dev, "%d shared contexts\n", (1 << asid_bits) -> +		num_possible_cpus() - 2);
> nit: s/shared/bindable?

I find "shared" clearer, with regard to contexts

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
