Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827F27B182
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 18:11:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8EA2D2033B;
	Mon, 28 Sep 2020 16:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NX31wqtqG34d; Mon, 28 Sep 2020 16:11:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5217620117;
	Mon, 28 Sep 2020 16:11:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E8E0C0891;
	Mon, 28 Sep 2020 16:11:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F6E8C016F
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 16:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BEA085784
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XO8AB2hmMLc for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 16:11:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 85D1C85580
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 16:11:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601309505; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=s9fijHNheVDmzida4xj/2XoHPDhyh+OA4s/ikxlL/dU=;
 b=Rgoj5Ijb4bt2dmMqV7hyKh1xdV+721ifA8oz23b0XfUL/JvDxK+7G4FiVdN+8HkBIVp/+9Qo
 Y5P3JrW97PvhmCvIdzf2dgJXK6P60sxgvFWny37cpFQHMbaE8xwcueaozv92riWGGsUuN9FS
 5mzmt/0EGGFBNKZGJlAertgrS+c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f720b3419fe605f255d7fc2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:11:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3A6C1C433FF; Mon, 28 Sep 2020 16:11:32 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F37BC433CA;
 Mon, 28 Sep 2020 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F37BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 28 Sep 2020 10:11:26 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv5 4/6] drm/msm/a6xx: Add support for using system
 cache(LLC)
Message-ID: <20200928161125.GA29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <889a32458cec92ed110b94f393aa1c2f0d64dca5.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <20200923150320.GD31425@jcrouse1-lnx.qualcomm.com>
 <800c2108606cb921fef1ffc27569ffb2@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <800c2108606cb921fef1ffc27569ffb2@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Sharat Masetty <smasetty@codeaurora.org>,
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

On Mon, Sep 28, 2020 at 05:56:55PM +0530, Sai Prakash Ranjan wrote:
> Hi Jordan,
> 
> On 2020-09-23 20:33, Jordan Crouse wrote:
> >On Tue, Sep 22, 2020 at 11:48:17AM +0530, Sai Prakash Ranjan wrote:
> >>From: Sharat Masetty <smasetty@codeaurora.org>
> >>
> >>The last level system cache can be partitioned to 32 different
> >>slices of which GPU has two slices preallocated. One slice is
> >>used for caching GPU buffers and the other slice is used for
> >>caching the GPU SMMU pagetables. This talks to the core system
> >>cache driver to acquire the slice handles, configure the SCID's
> >>to those slices and activates and deactivates the slices upon
> >>GPU power collapse and restore.
> >>
> >>Some support from the IOMMU driver is also needed to make use
> >>of the system cache to set the right TCR attributes. GPU then
> >>has the ability to override a few cacheability parameters which
> >>it does to override write-allocate to write-no-allocate as the
> >>GPU hardware does not benefit much from it.
> >>
> >>DOMAIN_ATTR_SYS_CACHE is another domain level attribute used by the
> >>IOMMU driver to set the right attributes to cache the hardware
> >>pagetables into the system cache.
> >>
> >>Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>[saiprakash.ranjan: fix to set attr before device attach to iommu and
> >>rebase]
> >>Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >>---
> >> drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 83 +++++++++++++++++++++++++
> >> drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  4 ++
> >> drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++
> >> 3 files changed, 104 insertions(+)
> >>
> >>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>index 8915882e4444..151190ff62f7 100644
> >>--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>@@ -8,7 +8,9 @@
> >> #include "a6xx_gpu.h"
> >> #include "a6xx_gmu.xml.h"
> >>
> >>+#include <linux/bitfield.h>
> >> #include <linux/devfreq.h>
> >>+#include <linux/soc/qcom/llcc-qcom.h>
> >>
> >> #define GPU_PAS_ID 13
> >>
> >>@@ -1022,6 +1024,79 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >> 	return IRQ_HANDLED;
> >> }
> >>
> >>+static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask,
> >>u32 or)
> >>+{
> >>+	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
> >>+}
> >>+
> >>+static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32
> >>value)
> >>+{
> >>+	return msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
> >>+}
> >>+
> >>+static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
> >>+{
> >>+	llcc_slice_deactivate(a6xx_gpu->llc_slice);
> >>+	llcc_slice_deactivate(a6xx_gpu->htw_llc_slice);
> >>+}
> >>+
> >>+static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
> >>+{
> >>+	u32 cntl1_regval = 0;
> >>+
> >>+	if (IS_ERR(a6xx_gpu->llc_mmio))
> >>+		return;
> >>+
> >>+	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> >>+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
> >>+
> >>+		gpu_scid &= 0x1f;
> >>+		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
> >>+			       (gpu_scid << 15) | (gpu_scid << 20);
> >>+	}
> >>+
> >>+	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
> >>+		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
> >>+
> >>+		gpuhtw_scid &= 0x1f;
> >>+		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
> >>+	}
> >>+
> >>+	if (cntl1_regval) {
> >>+		/*
> >>+		 * Program the slice IDs for the various GPU blocks and GPU MMU
> >>+		 * pagetables
> >>+		 */
> >>+		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
> >>cntl1_regval);
> >>+
> >>+		/*
> >>+		 * Program cacheability overrides to not allocate cache lines on
> >>+		 * a write miss
> >>+		 */
> >>+		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF,
> >>0x03);
> >>+	}
> >>+}
> >
> >This code has been around long enough that it pre-dates a650. On a650 and
> >other
> >MMU-500 targets the htw_llc is configured by the firmware and the
> >llc_slice is
> >configured in a different register.
> >
> >I don't think we need to pause everything and add support for the MMU-500
> >path,
> >but we do need a way to disallow LLCC on affected targets until such time
> >that
> >we can get it fixed up.
> >
> 
> Thanks for taking a close look, does something like below look ok or
> something
> else is needed here?
> 
> +         /* Till the time we get in LLCC support for A650 */
> +         if (!(info && info->revn == 650))
> +                 a6xx_llc_slices_init(pdev, a6xx_gpu);

It doesn't look like Rob picked this up for 5.10, so we have some time to do it
right.  Would you like me to give you an add-on patch for mmu-500 targets?

Jordan

> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
