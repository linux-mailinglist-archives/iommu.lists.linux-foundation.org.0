Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A22AC84A
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 23:23:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9703286246;
	Mon,  9 Nov 2020 22:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3fLWiKvO10i; Mon,  9 Nov 2020 22:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E162B86B31;
	Mon,  9 Nov 2020 22:23:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDBA0C016F;
	Mon,  9 Nov 2020 22:23:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8857EC016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 22:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 73708873E7
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 22:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYTiKsKa3+aP for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 22:23:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD996873E9
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 22:23:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604960623; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=h4kLvDOrgWdJbJRz3YUB6R5KJh03EMAS6v5CqdFVeFw=;
 b=Rq5UQjyRNla1wxi0zAwCL3TpYZ16vCEuk99Fg3P4aR9heI7t5Brk24Rd7MDAFZ46cxMFUiV/
 kuw0PBcsPYQaoVJmI0LElFXQ22hK+NK+af9A564Tv3vaM5lYd/OKlS6dTIXmHRU0SKCXfRO7
 EbVkHKv4zaGeKUbYoU8kpea3qFc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa9c1608723a97b7029f13e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 22:23:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31E67C433AD; Mon,  9 Nov 2020 22:23:27 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 255EBC433C6;
 Mon,  9 Nov 2020 22:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 255EBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v1 0/3] iommu/arm-smmu: adreno-smmu page fault handling
Date: Mon,  9 Nov 2020 15:23:16 -0700
Message-Id: <20201109222319.2630557-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

This is an RFC to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

Jordan Crouse (3):
  iommu/arm-smmu: Add support for driver IOMMU fault handlers
  drm/msm: Add an adreno-smmu-priv callback to get pagefault info
  drm/msm: Improve the a6xx page fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 76 +++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_iommu.c            | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h              |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 16 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +
 include/linux/adreno-smmu-priv.h           | 31 ++++++++-
 8 files changed, 151 insertions(+), 12 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
