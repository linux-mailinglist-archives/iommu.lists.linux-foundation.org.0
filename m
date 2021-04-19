Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF336464B
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 16:38:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE4760A62;
	Mon, 19 Apr 2021 14:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brOs6Bot8P0D; Mon, 19 Apr 2021 14:38:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E2060A5E;
	Mon, 19 Apr 2021 14:38:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BC9EC000B;
	Mon, 19 Apr 2021 14:38:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AEFAC000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 14:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5DF960A62
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 14:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9r_rKCcA_ygz for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 14:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20A7E60A5E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 14:38:06 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 5-20020a9d09050000b029029432d8d8c5so6817442otp.11
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KA74mLe8fkXTNtvVxnUD/R9BP6DUvXU6GqQ2V7QKU48=;
 b=bAzz2nqBdmNDb3rFxnWCQS/xFq26jaqJ1ftmMT9fjQKqUQ+ZIT37hcoSvqn+IRFGgT
 GVip74BqDG4qz9eauJZKuBdu13AU7teUbvwlKaK3avT3/JwXHS9clecYMVF191V3lHDo
 WHV9gLkUcYKpeWr80FofB30gMK7aXB8XKdNtneDOVHCgCvl1toUTYefb4j6F7kqLJcwh
 MeFOwJVtLxF9QJ/GfBpeR5f44kwz0iau8kJLvMGhx/7i9NlAN1ebmLP/LpN6jMdqgCQY
 yCdCkYlGQ5AAj1PJ4BgaljpuB1UBYg63Bg/rI++eUqe28RWzzx0uV2P9BUf4v1pRNXZ1
 vuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KA74mLe8fkXTNtvVxnUD/R9BP6DUvXU6GqQ2V7QKU48=;
 b=TUAvOdJcSOn0dW7reBVcDFSipQ+m7cB3j4Iwl5ywP4NsBo9xEw4a5zjZpomaLPyq/T
 XwHRSsQeDjg3Cvy+1D0DtiMQbOtPA1aW7bnojuLgQaWtJv29tfClFLz8WxOeZUhAA/2F
 Th+8Tyn18W1PW9/CU/4UXw9QaC/zlByv9dKpul7mKPrkmxYq8jOTcGD2ebz/EffyulWh
 MRmkFoFZFkiwDBrxGORsRWYku+SqO9jSWODbpHaNUl/+HL1LV+koWqZ96wd89+JlkHUZ
 K1i6o+m9b6Uu8s9nLtXgHyAohmtm/eF8CTAoRtftpnHZHmaVDKFjJOoWv5bI6ToJUa+n
 0ZGw==
X-Gm-Message-State: AOAM532OZDSXFyI5//yJiABJYyh7R9DsY7OqWhJcHDdcyU0VfYwtOnRb
 Cmhqwf88fp9t3LvEuyeDgxY+TQ==
X-Google-Smtp-Source: ABdhPJwpnzs8sEJmdIC3gggfdBnNIayOKuztT5Ad2mhWhCKzjzRYS/+RcMa4CWJUYLuJ6RVpczhslQ==
X-Received: by 2002:a05:6830:1601:: with SMTP id
 g1mr4499748otr.0.1618843085133; 
 Mon, 19 Apr 2021 07:38:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q130sm3161649oif.40.2021.04.19.07.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:38:04 -0700 (PDT)
Date: Mon, 19 Apr 2021 09:38:02 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
Message-ID: <20210419143802.GP1538589@yoga>
References: <cover.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
Cc: Will Deacon <will@kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri 26 Feb 03:55 CST 2021, Sai Prakash Ranjan wrote:

> Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
> both implement "arm,mmu-500" in some QTI SoCs and to run through
> adreno smmu specific implementation such as enabling split pagetables
> support, we need to match the "qcom,adreno-smmu" compatible first
> before apss smmu or else we will be running apps smmu implementation
> for adreno smmu and the additional features for adreno smmu is never
> set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
> and adreno smmu implementing "arm,mmu-500", so the adreno smmu
> implementation is never reached because the current sequence checks
> for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
> specific impl and we never reach adreno smmu specific implementation.
> 
> Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Sorry for taking my time thinking about this.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index bea3ee0dabc2..03f048aebb80 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -345,11 +345,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
>  	const struct device_node *np = smmu->dev->of_node;
>  
> -	if (of_match_node(qcom_smmu_impl_of_match, np))
> -		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> -
> +	/*
> +	 * Do not change this order of implementation, i.e., first adreno
> +	 * smmu impl and then apss smmu since we can have both implementing
> +	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
> +	 * features if the order is changed.
> +	 */
>  	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>  		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
>  
> +	if (of_match_node(qcom_smmu_impl_of_match, np))
> +		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +
>  	return smmu;
>  }
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
