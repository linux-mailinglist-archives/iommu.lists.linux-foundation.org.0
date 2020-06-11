Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A71F7023
	for <lists.iommu@lfdr.de>; Fri, 12 Jun 2020 00:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D029986C26;
	Thu, 11 Jun 2020 22:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXp6okEedHZU; Thu, 11 Jun 2020 22:29:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B16087317;
	Thu, 11 Jun 2020 22:29:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57CEAC016F;
	Thu, 11 Jun 2020 22:29:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACF03C016F
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C73386C26
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2jeqqsNwRSO for <iommu@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 22:29:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A724B86BD0
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591914583; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2ISXN2Jfej+BB8O1Al43XIMTVjOYQJJpTZ3rGr3Vsro=;
 b=ZTRYBZcVA+GGBP9Y5kzsqrth01P8Fx5FAl0SDQ0GjEpSHKYk0ZTIkWS2pnkOy5p3nHq+oJd3
 JHiRYvv2EeGdPwSg678RM94UnP49M4ufmK0EPFGPnardipY2HPEfk13YunqZtMOVP4jkA/R6
 Z8Mr1luRhukcYyOUSxS5YGzZmT8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee2b048567385e8e7cd082a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E4902C433AD; Thu, 11 Jun 2020 22:29:27 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FD0FC433CA;
 Thu, 11 Jun 2020 22:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0FD0FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] iommu-arm-smmu: Add auxiliary domains and per-instance
 pagetables
Date: Thu, 11 Jun 2020 16:29:15 -0600
Message-Id: <20200611222921.464-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Cc: Sean Paul <sean@poorly.run>, Joerg Roedel <jroedel@suse.de>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
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

This is a new refresh of support for auxiliary domains for arm-smmu-v2
and per-instance pagetables for drm/msm. The big change here from past
efforts is that outside of creating a single aux-domain to enable TTBR0
all of the per-instance pagetables are created and managed exclusively
in drm/msm without involving the arm-smmu driver. This fits in with the
suggested model of letting the GPU hardware do what it needs and leave the
arm-smmu driver blissfully unaware.

Almost. In order to set up the io-pgtable properly in drm/msm we need to
query the pagetable configuration from the current active domain and we need to
rely on the iommu API to flush TLBs after a unmap. In the future we can optimize
this in the drm/msm driver to track the state of the TLBs but for now the big
hammer lets us get off the ground.

This series is build on the split pagetable support [1].

[1] https://patchwork.kernel.org/patch/11600949/

Jordan Crouse (6):
  iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
  iommu/io-pgtable: Allow a pgtable implementation to skip TLB
    operations
  iommu/arm-smmu: Add a domain attribute to pass the pagetable config
  drm/msm: Add support to create a local pagetable
  drm/msm: Add support for address space instances
  drm/msm/a6xx: Add support for per-instance pagetables

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  69 +++++++-
 drivers/gpu/drm/msm/msm_drv.c         |  15 +-
 drivers/gpu/drm/msm/msm_drv.h         |   4 +
 drivers/gpu/drm/msm/msm_gem_vma.c     |   9 +
 drivers/gpu/drm/msm/msm_gpu.c         |  17 ++
 drivers/gpu/drm/msm/msm_gpu.h         |   5 +
 drivers/gpu/drm/msm/msm_gpummu.c      |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 180 +++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h         |  16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  |   1 +
 drivers/iommu/arm-smmu.c              | 228 ++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h              |   1 +
 include/linux/io-pgtable.h            |  11 +-
 include/linux/iommu.h                 |   1 +
 14 files changed, 529 insertions(+), 30 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
