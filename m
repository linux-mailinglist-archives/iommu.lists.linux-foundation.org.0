Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495B126408
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 14:54:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E66F4855F1;
	Thu, 19 Dec 2019 13:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiziBPfZ5u-T; Thu, 19 Dec 2019 13:54:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F80A87D5C;
	Thu, 19 Dec 2019 13:54:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8853CC077D;
	Thu, 19 Dec 2019 13:54:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5706DC077D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 13:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 32F1E884B3
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 13:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kILVpeDzcpp9 for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 13:15:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF27B884CA
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 13:15:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576761332; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MatkvjJ++f5xYHSRzGDp53AIHwv/yYm+qCfukmt6X8c=;
 b=q6kbj3Zyk+PSm76NDx6LmDHS1DK94CqR6unOg9X0Kvuj5je8wCz4fX37TahNCSOz+31FoT5L
 P+LyScsgNhmy0orfExce6Lmqgk4BW+EaHC15oYN4dot5ZZcN9obgHt99m9CgBdmXvElvn4hd
 qk+JHeMFngixD7WlnSRgFfsl+Tc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb77f3.7fb240c64df8-smtp-out-n03;
 Thu, 19 Dec 2019 13:15:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 186E5C447A5; Thu, 19 Dec 2019 13:15:30 +0000 (UTC)
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15F0AC447A3;
 Thu, 19 Dec 2019 13:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15F0AC447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm/a6xx: System Cache Support
Date: Thu, 19 Dec 2019 18:44:41 +0530
Message-Id: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 19 Dec 2019 13:54:46 +0000
Cc: will@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@freedesktop.org, robin.murphy@arm.com,
 Sharat Masetty <smasetty@codeaurora.org>
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

Some hardware variants contain a system level cache or the last level
cache(llc). This cache is typically a large block which is shared by multiple
clients on the SOC. GPU uses the system cache to cache both the GPU data
buffers(like textures) as well the SMMU pagetables. This helps with
improved render performance as well as lower power consumption by reducing
the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices which
then be used by multiple SOC clients. This patch series is an effort to enable
and use two of those slices perallocated for the GPU, one for the GPU data
buffers and another for the GPU SMMU hardware pagetables.

To enable the system cache driver, add [1] to your stack if not already
present. Please review.

[1] https://lore.kernel.org/patchwork/patch/1165298/

Jordan Crouse (1):
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context

Sharat Masetty (3):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm: Pass mmu features to generic layers
  drm/msm/a6xx: Add support for using system cache(LLC)

Vivek Gautam (1):
  iommu/arm-smmu: Add domain attribute for QCOM system cache

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 122 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |   9 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_drv.c           |   8 +++
 drivers/gpu/drm/msm/msm_drv.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.c           |   6 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   6 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  13 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |  14 ++++
 drivers/iommu/arm-smmu-impl.c           |   3 +-
 drivers/iommu/arm-smmu-qcom.c           |  10 +++
 drivers/iommu/arm-smmu.c                |  25 +++++--
 drivers/iommu/arm-smmu.h                |   4 +-
 include/linux/iommu.h                   |   1 +
 19 files changed, 216 insertions(+), 20 deletions(-)

--
1.9.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
