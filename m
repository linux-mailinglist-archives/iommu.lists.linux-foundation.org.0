Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8D20CFDD
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 17:53:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B210284AAD;
	Mon, 29 Jun 2020 15:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq3K10qWykq4; Mon, 29 Jun 2020 15:53:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE50688640;
	Mon, 29 Jun 2020 15:53:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7D20C08A0;
	Mon, 29 Jun 2020 15:53:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09AB0C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 050108928F
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cG1q4Y9A8GuJ for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:53:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E65258928B
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:53:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593446007; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MMgpD5DCLQ6JjRpMGo318xv/+oipR7QB8aPXFQoSC2I=;
 b=F4BMFqfkmrWv/y1eUEb0lo7qjgtGEkCNb6nHultLK1PKcGpJPRdgc1xE0zduOq8dFJDergen
 lvMasnPkZAn5Ho3KaniQO2+I+J+RfyGSXvkxto0IOJSF5ROFCDawqYbjIghJOYv6hiVz5L+R
 1EUm+4qMfoZha5d6MgFfVl/2Cl4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5efa0e69117610c7ffcf129a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 15:53:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E439CC433C6; Mon, 29 Jun 2020 15:53:13 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 467E3C433CA;
 Mon, 29 Jun 2020 15:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 467E3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv3 0/7] System Cache support for GPU and required SMMU support
Date: Mon, 29 Jun 2020 21:22:43 +0530
Message-Id: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, iommu@lists.linux-foundation.org,
 Matthias Kaehlcke <mka@chromium.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
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

Some hardware variants contain a system cache or the last level
cache(llc). This cache is typically a large block which is shared
by multiple clients on the SOC. GPU uses the system cache to cache
both the GPU data buffers(like textures) as well the SMMU pagetables.
This helps with improved render performance as well as lower power
consumption by reducing the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices
which then be used by multiple SOC clients. This patch series is an
effort to enable and use two of those slices perallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 adds a init_context_bank implementation hook to set SCTLR.HUPCF.
Patch 2,3,6,7 adds system cache support in SMMU and GPU driver.
Patch 4 and 5 are minor cleanups for arm-smmu impl.

Changes in v3:
 * Fix domain attribute setting to before iommu_attach_device()
 * Fix few code style and checkpatch warnings
 * Rebase on top of Jordan's latest split pagetables and per-instance
   pagetables support [1][2]

Changes in v2:
 * Addressed review comments and rebased on top of Jordan's split
   pagetables series

[1] https://lore.kernel.org/patchwork/cover/1264446/
[2] https://lore.kernel.org/patchwork/cover/1264460/

Jordan Crouse (1):
  iommu/arm-smmu: Add a init_context_bank implementation hook

Sai Prakash Ranjan (4):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for system cache
  iommu: arm-smmu-impl: Remove unwanted extra blank lines
  iommu: arm-smmu-impl: Convert to use of_match_node() for qcom impl

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 ++++++-
 drivers/gpu/drm/msm/msm_drv.c           |  8 +++
 drivers/gpu/drm/msm/msm_drv.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  3 +
 drivers/gpu/drm/msm/msm_mmu.h           |  4 ++
 drivers/iommu/arm-smmu-impl.c           | 13 ++--
 drivers/iommu/arm-smmu-qcom.c           | 13 ++++
 drivers/iommu/arm-smmu.c                | 46 +++++++++-----
 drivers/iommu/arm-smmu.h                | 13 ++++
 drivers/iommu/io-pgtable-arm.c          |  7 ++-
 include/linux/io-pgtable.h              |  4 ++
 include/linux/iommu.h                   |  1 +
 15 files changed, 198 insertions(+), 28 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
