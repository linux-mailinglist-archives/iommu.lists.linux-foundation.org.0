Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D918A3A1E
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 17:14:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AA7CD5C86;
	Fri, 30 Aug 2019 15:14:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8CEE95C78
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 15:13:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 131098A6
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 15:13:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1092344;
	Fri, 30 Aug 2019 08:13:20 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F0323F703;
	Fri, 30 Aug 2019 08:13:17 -0700 (PDT)
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add binding for nvidia, smmu-v2
To: Krishna Reddy <vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
	<1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <37034b76-7e3f-5f3c-25b2-696e25127682@arm.com>
Date: Fri, 30 Aug 2019 16:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: talho@nvidia.com, treding@nvidia.com, mperttunen@nvidia.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	praithatha@nvidia.com, thomasz@nvidia.com, snikam@nvidia.com,
	linux-tegra@vger.kernel.org, yhsu@nvidia.com,
	jtukkinen@nvidia.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 29/08/2019 23:47, Krishna Reddy wrote:
> Add binding doc for Nvidia's smmu-v2 implementation.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3b..0de3759 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -17,6 +17,7 @@ conditions.
>                           "arm,mmu-401"
>                           "arm,mmu-500"
>                           "cavium,smmu-v2"
> +                        "nidia,smmu-v2"
>                           "qcom,smmu-v2"

I agree with Mikko that the compatible must be at least SoC-specific, 
but potentially even instance-specific (e.g. "nvidia,tegra194-gpu-smmu") 
depending on how many of these parallel-SMMU configurations might be 
hiding in current and future SoCs.

Robin.

>   
>                     depending on the particular implementation and/or the
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
