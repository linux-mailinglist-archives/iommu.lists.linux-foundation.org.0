Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255214C281
	for <lists.iommu@lfdr.de>; Tue, 28 Jan 2020 23:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 352F12052F;
	Tue, 28 Jan 2020 22:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgLOHwFzLrf9; Tue, 28 Jan 2020 22:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4BD5620525;
	Tue, 28 Jan 2020 22:00:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39DCDC0171;
	Tue, 28 Jan 2020 22:00:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E02DC0171
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7AF9B1FEBF
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAD99xrHar4T for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jan 2020 22:00:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by silver.osuosl.org (Postfix) with ESMTPS id 438622052B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:00:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580248855; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yghdhlFiZU77aOY7g/N4Y1I7xkAvDvSkr40c3b2zObg=;
 b=teP525WQmKS61CqkXWKdiHJhLz5a/e4eMLfi3QqzJXmiMZ8LsIiNfRQLFF6+6bdRJs0lTUid
 7nmGhXFRZ5Pc09QGa5rUDKcQZ+AFO17hWxO9ydcim6jP79tC/HCQ5baviCOYJRbZEX6EzGEf
 PhF6rn9uGsOXAFXDiT/kWTVzF0k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30af0d.7ff069b0a9d0-smtp-out-n01;
 Tue, 28 Jan 2020 22:00:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C7980C447AE; Tue, 28 Jan 2020 22:00:43 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14A37C4479C;
 Tue, 28 Jan 2020 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14A37C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v5 5/5] drm/msm/a6xx: Support split pagetables
Date: Tue, 28 Jan 2020 15:00:19 -0700
Message-Id: <1580248819-12644-6-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
References: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 will@kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Attempt to enable split pagetables if the arm-smmu driver supports it.
This will move the default address space from the default region to
the address range assigned to TTBR1. The behavior should be transparent
to the driver for now but it gets the default buffers out of the way
when we want to start swapping TTBR0 for context-specific pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 52 ++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a2c5412..9bec603c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -878,6 +878,56 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+	u64 start, size;
+	u32 val = 1;
+	int ret;
+
+	if (!iommu)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Try to request split pagetables - the request has to be made before
+	 * the domian is attached
+	 */
+	iommu_domain_set_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	/*
+	 * After the domain is attached, see if the split tables were actually
+	 * successful.
+	 */
+	ret = iommu_domain_get_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
+	if (!ret && val) {
+		/*
+		 * The aperture start will be at the beginning of the TTBR1
+		 * space so use that as a base
+		 */
+		start = iommu->geometry.aperture_start;
+		size = 0xffffffff;
+	} else {
+		/* Otherwise use the legacy 32 bit region */
+		start = SZ_16M;
+		size = 0xffffffff - SZ_16M;
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", start, size);
+	if (IS_ERR(aspace))
+		iommu_domain_free(iommu);
+
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -900,7 +950,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = a6xx_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
-- 
2.7.4
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
