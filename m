Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C370341F322
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 19:30:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37B14407D4;
	Fri,  1 Oct 2021 17:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRg5TEChsAxQ; Fri,  1 Oct 2021 17:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 185924032E;
	Fri,  1 Oct 2021 17:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D30B2C000D;
	Fri,  1 Oct 2021 17:30:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0988DC000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF26683FFF
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUZZYMJ9sGZu for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 17:30:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A2283E6B
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:35 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id x124so12277243oix.9
 for <iommu@lists.linux-foundation.org>; Fri, 01 Oct 2021 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IhB/01/IitH3m4NcKKW8vX/IfPHlPDQqhEV0x9b/C7E=;
 b=HlOwQHROTnWHik2T8VfIGkqf3Z67AZudlPX/31hUH96V29bu/c+NtgsWRB35Fae6S8
 LRJpMRytqwLLloUL5SVWhAn+fTyjTWi9hBOYyJPzx0jA5/2izZJvT6HHtKQId01uOYjT
 6tER8Mwb4KIsIdjxAbVaQo4vTLNxi0Wy4/DwKtRQsmM2pNmdv6mlV3mw51tSfEOA58hV
 J4CGdHVbtwVlguR7quRULV2ud9lA60Xg7DqxM3Q4poXa7eh9/xcOOkYCBiQ7P4Ai+16D
 I6qTxZ1DNvPMcZVtnlJmJJl49Toh1yciblo1O1hBLN1UrP28icChZoiCT66oruTHh7NM
 hTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IhB/01/IitH3m4NcKKW8vX/IfPHlPDQqhEV0x9b/C7E=;
 b=mN4y2aAfPHXOAuTwH0OStGKKVFnJCSNe6rDJCYKWZUFfnkGrpYvFgHQzJSS30S40oB
 890qitr+udwuVPs52fdGjMN6i9bDY+FHOJvau/o0isTAFt3SPaziKlygalb5aNSBG7zG
 5BGukTw2ooK2ipdNeuSWAtEIdJEJ/uXmMfbZXgqHG4DZloISDXw1T+etaXmXpAxqRKDm
 gpiapVO428TCY2oHawRHmQSXXoBUu6DZHdT110aKcXOVeJUj1JsMVvQoDj1ZvpZQbekz
 tQN99L/M0sD6jiabHs85qoA2cuo8iA2zDu4Vy/xpVBgiOH9dANzrTJHROZuQoZvD1x8j
 LUSw==
X-Gm-Message-State: AOAM531jbkupUWZz98XID15K/KDzn2rQs58UZoh/93v7qyigDM2WK3jL
 eRHgvY1+jXV7rQbilgAxaszy2g==
X-Google-Smtp-Source: ABdhPJxNJDogYaRDrJIGhbZoMKxXpalTJtz7iUyJqaHo5NPFVSjpShuqvB6eeQBs/lxrG2ph5cJDtw==
X-Received: by 2002:a05:6808:11c8:: with SMTP id
 p8mr4762589oiv.72.1633109434912; 
 Fri, 01 Oct 2021 10:30:34 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z24sm1224876oic.26.2021.10.01.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:30:34 -0700 (PDT)
Date: Fri, 1 Oct 2021 10:32:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH 1/2] iommu: arm-smmu-qcom: Add compatible for qcm2290
Message-ID: <YVdGJtGnH+RMilBv@ripper>
References: <1633096832-7762-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1633096832-7762-1-git-send-email-loic.poulain@linaro.org>
Cc: devicetree@vger.kernel.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, shawn.guo@linaro.org,
 will@kernel.org
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

On Fri 01 Oct 07:00 PDT 2021, Loic Poulain wrote:

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 55690af..d105186 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -412,6 +412,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,sm8150-smmu-500" },
>  	{ .compatible = "qcom,sm8250-smmu-500" },
>  	{ .compatible = "qcom,sm8350-smmu-500" },
> +	{ .compatible = "qcom,qcm2290-smmu-500" },

Would be nice if we kept the alphabetical sort order on these and in the
binding.

With that, please feel free to add my R-b

Regards,
Bjorn

>  	{ }
>  };
>  
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
