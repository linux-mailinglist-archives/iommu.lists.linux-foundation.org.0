Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABCA218731
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 14:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C6E3868DE;
	Wed,  8 Jul 2020 12:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRV0aHfLViWv; Wed,  8 Jul 2020 12:25:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B21DA868D3;
	Wed,  8 Jul 2020 12:25:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99C42C016F;
	Wed,  8 Jul 2020 12:25:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B83B4C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 12:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B315E88AA9
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 12:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYI5XI4LOGYW for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 12:25:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19E5688A9D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 12:25:26 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f05bb280000>; Wed, 08 Jul 2020 05:25:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 08 Jul 2020 05:25:25 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 08 Jul 2020 05:25:25 -0700
Received: from [10.26.73.185] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jul
 2020 12:25:18 +0000
Subject: Re: [PATCH v10 4/5] dt-bindings: arm-smmu: add binding for Tegra194
 SMMU
To: Krishna Reddy <vdumpa@nvidia.com>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <robh+dt@kernel.org>, <treding@nvidia.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-5-vdumpa@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ec06de3c-fefa-eaa4-3498-abd1eb0d78d7@nvidia.com>
Date: Wed, 8 Jul 2020 13:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708050017.31563-5-vdumpa@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594211113; bh=Xzfh1NzVG82EwW/mARDUWZypAGHmKQgo0WIQYqHsKDc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kDz+S3TyRCG/4o8mz/Uk2mGnf3f30lnrD7KF8Wc1wtV3O/HdkAksX5kzf65vfE4yi
 MnGesmon47DGmcHNIK/k2ypEnPSRbsyXzgwtuXtILxzo4je3d6P6qd44It9+GEL9z+
 kE2H6+wZwwlC2R/Ois07laWv8TCk50ec4JPXn8bk7ZSe+Brhkq9rsoFl1UBxBSKO0G
 7MYo3dBr5w03ywKutHN3eQ1Lu0nVlel7ZEt8w1lfx4AHZdD/NAzx6bsXIAjc/JidE7
 69PlMytZhtkS5fxgBxm5KPfYwsRCXBZa0auLfK9UDDZSSpoWx+N6dR3Y2y2ZD2oExN
 2c9I9k5UVGXzg==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 mperttunen@nvidia.com, bhuntsman@nvidia.com, yhsu@nvidia.com,
 linux-kernel@vger.kernel.org, talho@nvidia.com,
 iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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


On 08/07/2020 06:00, Krishna Reddy wrote:
> Add binding for NVIDIA's Tegra194 SoC SMMU.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423..ac1f526c3424 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,11 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: NVIDIA SoCs that program two ARM MMU-500s identically
> +        items:
> +          - enum:
> +              - nvidia,tegra194-smmu
> +          - const: nvidia,smmu-500
>        - items:
>            - const: arm,mmu-500
>            - const: arm,smmu-v2
> @@ -138,6 +143,19 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-smmu
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
>  examples:
>    - |+
>      /* SMMU with stream matching or stream indexing */
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
