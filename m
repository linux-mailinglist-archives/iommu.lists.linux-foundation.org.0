Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D8112F0E
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 16:56:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7926230E6;
	Wed,  4 Dec 2019 15:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlmEWCE6YLGO; Wed,  4 Dec 2019 15:56:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B103E23100;
	Wed,  4 Dec 2019 15:56:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F00C1DDD;
	Wed,  4 Dec 2019 15:56:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41ED3C077D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 15:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3CF5722FF0
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 15:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jecm3yggH7Xz for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 15:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 0EDD2203A8
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 15:56:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BC9E31B;
 Wed,  4 Dec 2019 07:56:00 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0FE53F52E;
 Wed,  4 Dec 2019 07:55:58 -0800 (PST)
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
To: Jordan Crouse <jcrouse@codeaurora.org>, iommu@lists.linux-foundation.org
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95751c0b-33c9379b-6b8c-43b1-8785-e5e1b6f084f1-000000@us-west-2.amazonses.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3a283a7c-df75-a30a-1bcb-74e631f06a71@arm.com>
Date: Wed, 4 Dec 2019 15:55:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0101016e95751c0b-33c9379b-6b8c-43b1-8785-e5e1b6f084f1-000000@us-west-2.amazonses.com>
Content-Language: en-GB
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, will@kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 22/11/2019 11:31 pm, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.

A software policy decision is not, in itself, a good justification for a 
DT property. Is the GPU SMMU fundamentally different in hardware* from 
the other SMMU(s) in any given SoC?

(* where "hardware" may encompass hypervisor shenanigans)

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..db9f826 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -31,6 +31,12 @@ properties:
>                 - qcom,sdm845-smmu-v2
>             - const: qcom,smmu-v2
>   
> +      - description: Qcom Adreno GPU SMMU iplementing split pagetables
> +        items:
> +          - enum:
> +              - qcom,adreno-smmu-v2
> +          - const: qcom,smmu-v2

Given that we already have per-SoC compatibles for Qcom SMMUs in 
general, this seems suspiciously vague.

Robin.

> +
>         - description: Qcom SoCs implementing "arm,mmu-500"
>           items:
>             - enum:
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
