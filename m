Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC72E6D0A
	for <lists.iommu@lfdr.de>; Tue, 29 Dec 2020 02:49:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC346844AF;
	Tue, 29 Dec 2020 01:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYtu3ChD2UQp; Tue, 29 Dec 2020 01:49:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EB38844A1;
	Tue, 29 Dec 2020 01:49:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE0EC0174;
	Tue, 29 Dec 2020 01:49:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 883C9C0174
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 01:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A1C9871FE
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 01:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaYtKGHwvK9m for <iommu@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 01:49:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED2278710F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 01:49:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609206549; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=N8vblr7WLA9MBowjRomnjKEqPtQ1SL9FvyoDvOUsoR4=;
 b=ih+ISigX4Mq0zpMt2DJuBFd6BBbHAF/IZAbm7yjW8IucI7I0R3wY5YoB5+xEOmUYQ3ue2XpM
 KDQ9/xZIq/zE8zWHAFWKXs05pd/yFb4LiemLhrPwsH6h+Xg1gU9UWlfZPY1HS4MtL240E2e4
 ki/seoLLnsdhPtujLMXdnsBLbQE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fea8b146d2f42c666fbc322 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 01:49:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1BFCC433ED; Tue, 29 Dec 2020 01:49:08 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F1E3C433C6;
 Tue, 29 Dec 2020 01:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F1E3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Subject: [PATCH 0/7] iommu: Permit modular builds of io-pgtable drivers
Date: Mon, 28 Dec 2020 17:48:54 -0800
Message-Id: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno@lists.freedesktop.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

The goal of the Generic Kernel Image (GKI) effort is to have a common
kernel image that works across multiple Android devices. This involves
generating a kernel image that has core features integrated into it,
while SoC specific functionality can be added to the kernel for the
device as a module.

Along with modularizing IOMMU drivers, this also means building the
io-pgtable code as modules, which allows for SoC vendors to only include
the io-pgtable implementations that they use. For example, GKI for arm64
must include support for both the IOMMU ARM LPAE/V7S formats at the
moment. Having the code for both formats as modules allows SoC vendors
to only provide the page table format that they use, along with their
IOMMU driver.

The patches are split into 4 parts:

1) Modularizing io-pgtable-arm[-v7s].c, while leaving the io-pgtable.c
code as part of the core kernel, requires removing the references to
the ARM LPAE and ARM V7S io-pgtable init functions, and using a
dynamic method for formats to register their io-pgtable init functions.

2) Taking references to the io-pgtable format drivers to ensure that they
cannot be unloaded while in use.

3) Adding pre MODULE_SOFTDEP() dependencies to drivers in the kernel
that are tristate, and invoke [alloc/free]_io_pgtable_ops(). This makes
it so that the io-pgtable format drivers are loaded before the driver
that needs them.

4) Changing the Kconfig options for the ARM LPAE nad ARM V7S to tristate
and allowing the io-pgtable code to be enabled without having to select
either page table format. The reason for doing this is so that a kernel
can be built, such that it only provides the interface for io-pgtable
formats to be registered as modules, as would be the case for the GKI.

Thanks,
Isaac

Isaac J. Manjarres (7):
  iommu/io-pgtable: Introduce dynamic io-pgtable format registration
  iommu/io-pgtable: Add refcounting for io-pgtable format modules
  iommu/arm-smmu: Add dependency on io-pgtable format modules
  iommu/arm-smmu-v3: Add dependency on io-pgtable-arm format module
  drm/msm: Add dependency on io-pgtable-arm format module
  drm/panfrost: Add dependency on io-pgtable-arm format module
  iommu/io-pgtable-arm: Allow building modular io-pgtable formats

 drivers/gpu/drm/msm/msm_drv.c               |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     |   1 +
 drivers/iommu/Kconfig                       |  11 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   1 +
 drivers/iommu/io-pgtable-arm-v7s.c          |  36 +++++++++-
 drivers/iommu/io-pgtable-arm.c              | 104 +++++++++++++++++++++-------
 drivers/iommu/io-pgtable.c                  |  54 ++++++++++-----
 include/linux/io-pgtable.h                  |  52 +++++++++-----
 9 files changed, 196 insertions(+), 65 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
