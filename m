Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4532DDC1
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 15:09:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3FE312626;
	Wed, 29 May 2019 13:09:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B93082453
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 13:06:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 493ACEC
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 13:06:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4BEA78;
	Wed, 29 May 2019 06:06:03 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEA1C3F59C;
	Wed, 29 May 2019 06:06:01 -0700 (PDT)
Date: Wed, 29 May 2019 14:05:59 +0100
From: Will Deacon <will.deacon@arm.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH v2] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <20190529130559.GB11023@fuggles.cambridge.arm.com>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>, Andy Gross <agross@kernel.org>,
	AngeloGioacchino Del Regno <kholk11@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, May 29, 2019 at 01:55:48PM +0200, Marc Gonzalez wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Apparently, some Qualcomm arm64 platforms which appear to expose their
> SMMU global register space are still, in fact, using a hypervisor to
> mediate it by trapping and emulating register accesses. Sadly, some
> deployed versions of said trapping code have bugs wherein they go
> horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
> register.

^^^
This should be in the comment instead of "qcom bug".

> While this can be mitigated for GCC today by tweaking the constraints
> for the implementation of writel_relaxed(), to avoid any potential
> arms race with future compilers more aggressively optimising register
> allocation, the simple way is to just remove all the problematic
> constant zeros. For the write-only TLB operations, the actual value is
> irrelevant anyway and any old nearby variable will provide a suitable
> GPR to encode. The one point at which we really do need a zero to clear
> a context bank happens before any of the TLB maintenance where crashes
> have been reported, so is apparently not a problem... :/

Hmm. It would be nice to understand this a little better. In which cases
does XZR appear to work?

> Reported-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> Changes from v1:
> - Tweak commit message (remove "compilers", s/hangs/crashes)
> - Add a comment before writel_relaxed
> ---
>  drivers/iommu/arm-smmu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0a28b3..3f352268fa8b 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -423,7 +423,8 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>  {
>  	unsigned int spin_cnt, delay;
>  
> -	writel_relaxed(0, sync);
> +	/* Write "garbage" (rather than 0) to work around a qcom bug */
> +	writel_relaxed((unsigned long)sync, sync);
>  	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
>  		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
>  			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
> @@ -1763,8 +1764,9 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Invalidate the TLB, just in case */
> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
> +	/* Write "garbage" (rather than 0) to work around a qcom bug */
> +	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> +	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);

Any reason not to make these obviously dummy values e.g.:

	/*
	 * Text from the commit message about broken hypervisor
	 */
	#define QCOM_DUMMY_VAL_NOT_XZR	~0U

That makes the callsites much easier to understand and I doubt there's a
performance impact from allocating an extra register here.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
