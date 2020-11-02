Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D52A32D2
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 19:23:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 380E886AAB;
	Mon,  2 Nov 2020 18:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uX79ERWlZ3SO; Mon,  2 Nov 2020 18:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B94D186C9B;
	Mon,  2 Nov 2020 18:23:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A43D5C088B;
	Mon,  2 Nov 2020 18:23:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71851C0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 64C1E86C9B
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QO-lpYI6Ilz1 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 18:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6295086AAB
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:23:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5339139F;
 Mon,  2 Nov 2020 10:23:02 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03F0E3F719;
 Mon,  2 Nov 2020 10:22:59 -0800 (PST)
Subject: Re: [PATCH v18 3/4] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20201102171416.654337-1-jcrouse@codeaurora.org>
 <20201102171416.654337-4-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <77278507-a6be-8517-6f76-02a0ff588e39@arm.com>
Date: Mon, 2 Nov 2020 18:22:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102171416.654337-4-jcrouse@codeaurora.org>
Content-Language: en-GB
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-11-02 17:14, Jordan Crouse wrote:
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 503160a7b9a0..3b63f2ae24db 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,8 +28,6 @@ properties:
>             - enum:
>                 - qcom,msm8996-smmu-v2
>                 - qcom,msm8998-smmu-v2
> -              - qcom,sc7180-smmu-v2
> -              - qcom,sdm845-smmu-v2

What about the "Apps SMMU" instances? Those are distinct and don't 
have/need the GPU special behaviour, right?

Robin.

>             - const: qcom,smmu-v2
>   
>         - description: Qcom SoCs implementing "arm,mmu-500"
> @@ -40,6 +38,13 @@ properties:
>                 - qcom,sm8150-smmu-500
>                 - qcom,sm8250-smmu-500
>             - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - enum:
> +              - qcom,sc7180-smmu-v2
> +              - qcom,sdm845-smmu-v2
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>         - description: Marvell SoCs implementing "arm,mmu-500"
>           items:
>             - const: marvell,ap806-smmu-500
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
