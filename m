Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F152E5321C9
	for <lists.iommu@lfdr.de>; Tue, 24 May 2022 05:55:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F79440BF1;
	Tue, 24 May 2022 03:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mysjZlMvb8oP; Tue, 24 May 2022 03:55:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7518A40BEE;
	Tue, 24 May 2022 03:55:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D395C0081;
	Tue, 24 May 2022 03:55:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 878A9C002D
 for <iommu@lists.linux-foundation.org>; Tue, 24 May 2022 03:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E50E405D9
 for <iommu@lists.linux-foundation.org>; Tue, 24 May 2022 03:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6TvMl4B_-bN for <iommu@lists.linux-foundation.org>;
 Tue, 24 May 2022 03:55:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ED0D40395
 for <iommu@lists.linux-foundation.org>; Tue, 24 May 2022 03:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653364553; x=1684900553;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DGcCckkF61WltcMI0jqjRYtrSETEtm9cvQ4zcqOtcFk=;
 b=RV9lpIQKg8UArEAMrMQp7wlCVnCPAfezDxkEUBuGB7yt7ZWv6llZjECT
 lefJ3PMCPgOCxQShIvSkTL1MR2qPTDy40/4MMgzJBOO//eoqy1fxmBsxv
 dUGbLL6CaDhP7A7G8HJ/CrzOyZB8ILAiGqZ0dE8JkCZnrW9sjJC8EJW7r M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 23 May 2022 20:55:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 20:55:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 20:55:51 -0700
Received: from [10.50.42.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 20:55:48 -0700
Message-ID: <28d8529c-28bb-a97a-b421-fcf83760788a@quicinc.com>
Date: Tue, 24 May 2022 09:25:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add debug support for TLB sync
 timeouts
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>
References: <20220523171847.21929-1-quic_saipraka@quicinc.com>
From: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220523171847.21929-1-quic_saipraka@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 quic_guptap@quicinc.com, linux-arm-kernel@lists.infradead.org
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

On 5/23/2022 10:48 PM, Sai Prakash Ranjan wrote:
> TLB sync timeouts can be due to various reasons such as TBU power down
> or pending TCU/TBU invalidation/sync and so on. Debugging these often
> require dumping of some implementation defined registers to know the
> status of TBU/TCU operations and some of these registers are not
> accessible in non-secure world such as from kernel and requires SMC
> calls to read them in the secure world. So, add this debug support
> to dump implementation defined registers for TLB sync timeout issues.
>
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 50 ++++++++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  2 +
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  4 ++
>   3 files changed, 56 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7820711c4560..22e9a0085475 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -5,11 +5,19 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/adreno-smmu-priv.h>
> +#include <linux/delay.h>
>   #include <linux/of_device.h>
>   #include <linux/qcom_scm.h>
>   
>   #include "arm-smmu.h"
>   
> +#define QCOM_DUMMY_VAL	-1
> +
> +/* Implementation Defined Register Space 0 registers */
> +#define QCOM_SMMU_STATS_SYNC_INV_TBU_ACK	0x5dc
> +#define QCOM_SMMU_TBU_PWR_STATUS		0x2204
> +#define QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR	0x2670
> +
>   struct qcom_smmu {
>   	struct arm_smmu_device smmu;
>   	bool bypass_quirk;
> @@ -22,6 +30,46 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   	return container_of(smmu, struct qcom_smmu, smmu);
>   }
>   
> +static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
> +				int sync, int status)
> +{
> +	u32 sync_inv_ack, sync_inv_progress, tbu_pwr_status;
> +	unsigned int spin_cnt, delay;
> +	u32 reg;
> +	int ret;
> +
> +	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
> +	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> +		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			reg = arm_smmu_readl(smmu, page, status);
> +			if (!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
> +				return;
> +			cpu_relax();
> +		}
> +		udelay(delay);
> +	}
> +
> +	sync_inv_ack = arm_smmu_readl(smmu, ARM_SMMU_IMPL_DEF0,
> +				      QCOM_SMMU_STATS_SYNC_INV_TBU_ACK);

Sorry, this doesn't work always, looks like on earlier chipsets this is a secure register and
reading it from non-secure world would probably blow. Also this register can be in other
implementation defined space for different chipsets. So I think we can use SCM call here
and have a device specific data based on already existing compatible for QCOM SoCs to
identify IMP_DEF space used.

> +	ret = qcom_scm_io_readl(smmu->ioaddr + QCOM_SMMU_TBU_PWR_STATUS,
> +				&tbu_pwr_status);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read TBU power status: %d\n", ret);
> +
> +	ret = qcom_scm_io_readl(smmu->ioaddr + QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
> +				&sync_inv_progress);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read SAFE WAIT counter: %d\n", ret);
> +
> +	dev_err_ratelimited(smmu->dev,
> +			    "TLB sync timed out -- SMMU may be deadlocked\n"
> +			    "TBU: sync_inv_ack %#x power_status %#x sync_inv_progress %#x\n",
> +			    sync_inv_ack, tbu_pwr_status, sync_inv_progress);
> +}
> +
>   static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>   		u32 reg)
>   {
> @@ -374,6 +422,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
>   	.write_s2cr = qcom_smmu_write_s2cr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
>   static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> @@ -382,6 +431,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   	.reset = qcom_smmu500_reset,
>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
>   static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 2ed3594f384e..4c5b51109835 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2099,6 +2099,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (IS_ERR(smmu->base))
>   		return PTR_ERR(smmu->base);
>   	ioaddr = res->start;
> +	smmu->ioaddr = ioaddr;
> +
>   	/*
>   	 * The resource size should effectively match the value of SMMU_TOP;
>   	 * stash that temporarily until we know PAGESIZE to validate it with.
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2b9b42fb6f30..8cf6567d970f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -278,6 +278,7 @@ struct arm_smmu_device {
>   	struct device			*dev;
>   
>   	void __iomem			*base;
> +	phys_addr_t			ioaddr;
>   	unsigned int			numpage;
>   	unsigned int			pgshift;
>   
> @@ -502,6 +503,9 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>   
>   #define ARM_SMMU_GR0		0
>   #define ARM_SMMU_GR1		1
> +
> +#define ARM_SMMU_IMPL_DEF0	2
> +
>   #define ARM_SMMU_CB(s, n)	((s)->numpage + (n))
>   
>   #define arm_smmu_gr0_read(s, o)		\

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
