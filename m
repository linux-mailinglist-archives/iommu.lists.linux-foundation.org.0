Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4882C3090
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 20:16:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 259C28690C;
	Tue, 24 Nov 2020 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPvJ3B5s--5a; Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BC4686913;
	Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83D9FC0052;
	Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16186C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 04EDB8626B
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK60cfKfKRck for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 19:16:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BDD0386257
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:16:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606245377; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=5buuSHSoW4H28tI/ERKmRVeWEk8S64oetvKCFJleVEE=;
 b=IMhR/lDQQIV8iLhU3BOMzxvgOpdB+mRLIubZMos+hF41z+muanc+OUBw8Nfw9TGD3w1jLc78
 4g0xf6sLPcXKcYI2P91H/INUhC7mVOrYSZFWMgROYpO1osp53uY8XExnMcV1HZZBYUsM1BZp
 0hQ0cibsS1r576ajDa8q2cMDsxg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fbd5bf97f0cfa6a163b4233 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 19:16:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 92BD9C4346F; Tue, 24 Nov 2020 19:16:08 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FE67C433ED;
 Tue, 24 Nov 2020 19:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FE67C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] iommu/arm-smmu: adreno-smmu page fault handling
Date: Tue, 24 Nov 2020 12:15:57 -0700
Message-Id: <20201124191600.2051751-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sharat Masetty <smasetty@codeaurora.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
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

This is a stack to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

v2: Fix comment wording and function pointer check per Rob Clark

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
