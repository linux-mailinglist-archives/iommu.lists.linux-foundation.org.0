Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D23872C115C
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 18:06:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4BE7320429;
	Mon, 23 Nov 2020 17:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByFz555kO7Mi; Mon, 23 Nov 2020 17:06:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1E0082049B;
	Mon, 23 Nov 2020 17:06:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13801C0052;
	Mon, 23 Nov 2020 17:06:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C602C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B9C885D3D
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ErOBu6b67sZ for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 17:06:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D23385CD8
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:06:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606151208; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QDNChIaB6BgEGpDuub8yzuD+zEw4pvx88TbufP1apAU=;
 b=rZyKDlUTMyIFh9XG5V63CJzZ3DS05jAqzHH3dB51bGMii3ZgnquwJzG6y7mRGsPArzHDRNeh
 w8WdEkjGLPd4Iy3jly/pOt/y+Kz1A08O36mZkYepRVq78YoVE0WAGK+HbjzUnv/Z5udeOyG2
 6v9lIvM9+POUEbLq1uAz2X8/l/A=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fbbec16c6fdb18c638009b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 17:06:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 178DBC43461; Mon, 23 Nov 2020 17:06:30 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CBD4C43460;
 Mon, 23 Nov 2020 17:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CBD4C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv9 0/8] System Cache support for GPU and required SMMU support
Date: Mon, 23 Nov 2020 22:35:53 +0530
Message-Id: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
effort to enable and use two of those slices preallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
Patch 7 and 8 are minor cleanups for arm-smmu impl.

Changes in v9:
 * Change name from domain_attr_io_pgtbl_cfg to io_pgtable_domain_attr (Will)
 * Modify comment for the quirk as suggested (Will)
 * Compare with IO_PGTABLE_QUIRK_NON_STRICT for non-strict mode (Will)

Changes in v8:
 * Introduce a generic domain attribute for pagetable config (Will)
 * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
 * Move non-strict mode to use new struct domain_attr_io_pgtbl_config (Will)

Changes in v7:
 * Squash Jordan's patch to support MMU500 targets
 * Rebase on top of for-joerg/arm-smmu/updates and Jordan's short series for adreno-smmu impl

Changes in v6:
 * Move table to arm-smmu-qcom (Robin)

Changes in v5:
 * Drop cleanup of blank lines since it was intentional (Robin)
 * Rebase again on top of msm-next-pgtables as it moves pretty fast

Changes in v4:
 * Drop IOMMU_SYS_CACHE prot flag
 * Rebase on top of https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables

Changes in v3:
 * Fix domain attribute setting to before iommu_attach_device()
 * Fix few code style and checkpatch warnings
 * Rebase on top of Jordan's latest split pagetables and per-instance
   pagetables support

Changes in v2:
 * Addressed review comments and rebased on top of Jordan's split
   pagetables series

Jordan Crouse (1):
  drm/msm/a6xx: Add support for using system cache on MMU500 based
    targets

Sai Prakash Ranjan (5):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for pagetable configuration
  iommu/arm-smmu: Move non-strict mode to use io_pgtable_domain_attr
  iommu: arm-smmu-impl: Use table to list QCOM implementations
  iommu: arm-smmu-impl: Add a space before open parenthesis

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 109 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  17 ++++
 drivers/gpu/drm/msm/msm_drv.c              |   8 ++
 drivers/gpu/drm/msm/msm_drv.h              |   1 +
 drivers/gpu/drm/msm/msm_gpu.h              |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  11 +--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  21 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  26 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   3 +-
 drivers/iommu/io-pgtable-arm.c             |  10 +-
 include/linux/io-pgtable.h                 |   8 ++
 include/linux/iommu.h                      |   1 +
 13 files changed, 199 insertions(+), 26 deletions(-)


base-commit: a29bbb0861f487a5e144dc997a9f71a36c7a2404
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
