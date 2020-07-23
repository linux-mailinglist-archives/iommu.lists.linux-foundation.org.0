Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8B22B21B
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 17:05:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C6C3020417;
	Thu, 23 Jul 2020 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbouFR7h5NIB; Thu, 23 Jul 2020 15:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D7FD203B8;
	Thu, 23 Jul 2020 15:05:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FBE8C004C;
	Thu, 23 Jul 2020 15:05:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23853C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C7DE89286
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vS7nfoiRwFcm for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 15:05:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF41989283
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id dg28so4766898edb.3
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/+f3sKHAM8Sl/CeofgRbHbyBXYMnQ69ejRLSfXkX4A=;
 b=vmRz4sivyaOvBBjRqJwfzi3Xv+4wC9cfKI6lJ9Or4nspLfYw2U3rEQemEA3Exo193I
 WxM4L9s64uZDgC0gVj48RpcNjAt/WkC5ow+Q9s7I3btCvBpm1IvhU9QAEt8ozQaeYVP6
 DufnDTFEM0AZZN68xviRbnICMO3/m8ZaS+s+HKo4UlidZEIJl/jqyak9ARVUmIqs6NMt
 N9O2hhxLsw1R/AUnWoPx+RJsrPmGHfsX1+OfghxggEfWj0jnrbyLJvOKyf8Zx4jmO7Wz
 wW7uf/hA6mni5+2pM7jg7t/K8ezHSBu0h3FNKNVYOYnrtNakXPMzBprkCkx14WuAQzFj
 JucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/+f3sKHAM8Sl/CeofgRbHbyBXYMnQ69ejRLSfXkX4A=;
 b=lQ1zJsPm6qPWt4vaRCambvEOe8TiFuCD4qpqLsuB2PMwLb1LZXhT9woanOZcecteRB
 h2wFVTTej5J9DiBWDe9ncuPG1aBSoCdk3XZ1QNGVqiO3vakviA+IC+rcBF41bmDQEKdZ
 pGWTO2SMonrcLS3P9PK7N//Ciqli8WddDIczO6GdcG2E/NDkiDVzWpl+8qbrsSL1avl/
 V8rzG46SJXg+bETkBvXV7vzM6flfm8O9NK7Hq0F5K3eBpvv60mA2pYd7M0cTW6jIH5rx
 Qt1U6WqIyRuq//JPh+u9NNcodKAGy2hjB0Caw9/ErbZaOA+6s7Qb5KkbrU82BQUQ0TCm
 OOoQ==
X-Gm-Message-State: AOAM530omq+KZxQDKWYEiC1Pa/pKd6phl0rYzUZ5c5T4P5tFFEWzslDj
 NVcmfbsnoWM75HivXniXFWEI/qIk98o=
X-Google-Smtp-Source: ABdhPJxO+3iuENTupXWAIhZuhGsltmVGrjTe5cZDQuBd3cd5FCLL/Gxd045cWgTluRNETEALgQAkvQ==
X-Received: by 2002:a05:6402:1c96:: with SMTP id
 cy22mr4467189edb.79.1595516746076; 
 Thu, 23 Jul 2020 08:05:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k15sm2145952eji.49.2020.07.23.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:05:45 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v9 00/13] iommu: Shared Virtual Addressing for SMMUv3 (PT
 sharing part)
Date: Thu, 23 Jul 2020 16:57:12 +0200
Message-Id: <20200723145724.3014766-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhengxiang9@huawei.com, zhangfei.gao@linaro.org, will@kernel.org
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

Add support for sharing CPU page tables with the SMMUv3. Support for I/O
page faults and additional features (DVM, VHE and HTTU) needed for SVA
is available on my sva/current branch [2] and will be sent later.

Since v8 [1]:
* Moved the SVA code to arm-smmu-v3-sva.c under CONFIG_ARM_SMMU_V3_SVA.
  This required moving struct definitions and macros to arm-smmu-v3.h
  (patch 7), hence the new 700 insertions/deletions in the diffstat.
* Updated patches 4 and 8 following review.
* Fixed bug in patch 9 when replacing a private ASID.

[1] https://lore.kernel.org/linux-iommu/20200618155125.1548969-1-jean-philippe@linaro.org/
[2] https://jpbrucker.net/git/linux sva/current

Fenghua Yu (1):
  mm: Define pasid in mm

Jean-Philippe Brucker (12):
  iommu/ioasid: Add ioasid references
  iommu/sva: Add PASID helpers
  arm64: mm: Pin down ASIDs for sharing mm with devices
  iommu/io-pgtable-arm: Move some definitions to a header
  arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
  iommu/arm-smmu-v3: Move definitions to a header
  iommu/arm-smmu-v3: Share process page tables
  iommu/arm-smmu-v3: Seize private ASID
  iommu/arm-smmu-v3: Check for SVA features
  iommu/arm-smmu-v3: Add SVA device feature
  iommu/arm-smmu-v3: Implement iommu_sva_bind/unbind()
  iommu/arm-smmu-v3: Hook up ATC invalidation to mm ops

 drivers/iommu/Kconfig                |  17 +
 drivers/iommu/Makefile               |   6 +-
 arch/arm64/include/asm/mmu.h         |   3 +
 arch/arm64/include/asm/mmu_context.h |  11 +-
 drivers/iommu/arm-smmu-v3.h          | 752 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.h       |  30 +
 drivers/iommu/iommu-sva-lib.h        |  15 +
 include/linux/ioasid.h               |  10 +-
 include/linux/mm_types.h             |   4 +
 arch/arm64/kernel/cpufeature.c       |   1 +
 arch/arm64/mm/context.c              | 105 +++-
 drivers/iommu/arm-smmu-v3-sva.c      | 487 +++++++++++++++
 drivers/iommu/arm-smmu-v3.c          | 860 ++++++---------------------
 drivers/iommu/intel/iommu.c          |   4 +-
 drivers/iommu/intel/svm.c            |   6 +-
 drivers/iommu/io-pgtable-arm.c       |  27 +-
 drivers/iommu/ioasid.c               |  38 +-
 drivers/iommu/iommu-sva-lib.c        |  85 +++
 MAINTAINERS                          |   3 +-
 19 files changed, 1729 insertions(+), 735 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-v3.h
 create mode 100644 drivers/iommu/io-pgtable-arm.h
 create mode 100644 drivers/iommu/iommu-sva-lib.h
 create mode 100644 drivers/iommu/arm-smmu-v3-sva.c
 create mode 100644 drivers/iommu/iommu-sva-lib.c

-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
