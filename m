Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846D258739
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 07:02:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B4838623F;
	Tue,  1 Sep 2020 05:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3syfcuRjodJu; Tue,  1 Sep 2020 05:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 068568623E;
	Tue,  1 Sep 2020 05:01:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2B1EC0051;
	Tue,  1 Sep 2020 05:01:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D13BBC0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 05:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0CC287204
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 05:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OaCEjMj2WWp for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 05:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEF28872A3
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 05:00:50 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 3so73923oih.0
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yS6GI89LI/f0FNWAupbk3KUTtqw1Z/rOa16+RpMuRmA=;
 b=KkTkOtpb155K2KuZCtBzjJYA591c+C7gNJIzWBRPD6NFNJTdClG28hsfJFj3UJ3sAx
 sHnH55pKW+wjdveHMCrtGj76TRtZ4iEJBc88P42HhoBOmRRdgbLoXBU952TSkx5T7ZiG
 8XIts/Uopwy1Oq7yJ1IXf56a+zWf5yohjJvEzkE0UaVx1lB3XgxWycFvxtFqvD6V+Wgw
 MVit4PM/EUHFfJha8cuPCYtWvYPOxlJ8zEi7BsJSqZ+UJIFaW3kfo3Pxm20O8TuGlPxg
 ymoa+Ho2KMXimSYuBOErbEwFeI0CwOBal+89a99M7xhg4stZrDht2IzsQed+5UQySQDg
 KOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yS6GI89LI/f0FNWAupbk3KUTtqw1Z/rOa16+RpMuRmA=;
 b=dsUNnnaH+vLgQDuqPHUnxDZpU6tw96wVhAXfM6AHw/R2h/cW6BA/bs8mvD0qfN1mbO
 BoO7+XQuAwj3+eJkdMj3Y76bYAnaoXjQ0UN5i6n8uAYsge3eAFGBfM07ZqtHab6UZKvm
 kowiIK/IIk6oGLsLw7cAfAhKWrxHrj9o+91X+1OocHICGF9WjuktlLsYap6larjtrS40
 CjPwmmxr1sVq0OqExoIOkJdf/kLxFHcBJDir86a1RYX1ij1XFamKbVw/p1ok1urQRdyC
 UHY4X0CdO50UHdLZPrjcQ4dEejHJECdrKxZnW7s47G1GwhuX/7b7UbHFwV5cx+KgfKGI
 FNGQ==
X-Gm-Message-State: AOAM530Mzf0w03jio7xnRDDqaID1V5ClSPzFgdcrgTwYEYhE0907yRtb
 7tnRwFG+6hoFyglnSJ6IxK0BQQ==
X-Google-Smtp-Source: ABdhPJw49W2MfiCQSAmX6Y0Pae9n6VKgj97b2xwM4u73son8yqzElosho5iEd0Mm4wvTQCxEWQ41mA==
X-Received: by 2002:a54:4388:: with SMTP id u8mr72201oiv.1.1598936449699;
 Mon, 31 Aug 2020 22:00:49 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id m5sm4933ote.27.2020.08.31.22.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:00:49 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:00:46 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 10/19] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
Message-ID: <20200901050046.GR3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-11-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-11-robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 503160a7b9a0..5ec5d0d691f6 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -40,6 +40,10 @@ properties:
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>        - description: Marvell SoCs implementing "arm,mmu-500"
>          items:
>            - const: marvell,ap806-smmu-500
> -- 
> 2.26.2
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
