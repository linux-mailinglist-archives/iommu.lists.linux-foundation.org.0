Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B91F1BC4
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 17:13:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5ED2A20524;
	Mon,  8 Jun 2020 15:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gh240wMkELC3; Mon,  8 Jun 2020 15:13:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 822892051B;
	Mon,  8 Jun 2020 15:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64823C016F;
	Mon,  8 Jun 2020 15:13:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05870C016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 15:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E7B24861C7
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 15:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYMmBwK4lc50 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 15:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6DAA4861A3
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 15:13:13 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFFBE2064C;
 Mon,  8 Jun 2020 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591629193;
 bh=tqmNda7HBIejgaZeX5xWNh1g+XYUKXmSNmP+2Xa8+uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RRjy7+Fp91CTEsYxYNd2ee6/qMl5ukLmjlfcRoc9tsCixzdo5D5os9ofKPeQC1D0f
 Z8aGOtvK94u6jG0qLLo/Z8XMc0KArq3nPyTp1ewvZqlcTaVvKaJnO3u/DFSfyoqnOQ
 CUe2cVWU2q/IR78hgR4FfVJQ6iiczo5GT18rtF/U=
Date: Mon, 8 Jun 2020 16:13:08 +0100
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Mark qcom_smmu_client_of_match as
 possibly unused
Message-ID: <20200608151308.GB8060@willie-the-truck>
References: <20200604203905.31964-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604203905.31964-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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

On Thu, Jun 04, 2020 at 02:39:04PM -0600, Jordan Crouse wrote:
> When CONFIG_OF=n of_match_device() gets pre-processed out of existence
> leaving qcom-smmu_client_of_match unused. Mark it as possibly unused to
> keep the compiler from warning in that case.
> 
> Fixes: 0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")
> Reported-by: kbuild test robot <lkp@intel.com>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index cf01d0215a39..be4318044f96 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -12,7 +12,7 @@ struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  };
>  
> -static const struct of_device_id qcom_smmu_client_of_match[] = {
> +static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,adreno" },
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },

Thanks. Joerg -- can you pick this one up, please? I don't have any other
SMMU fixes pending at the moment.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
