Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61F16AC71
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 17:59:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11F6886E2C;
	Mon, 24 Feb 2020 16:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmCxqO4vp0ZE; Mon, 24 Feb 2020 16:59:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D16358754B;
	Mon, 24 Feb 2020 16:59:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7C5EC0177;
	Mon, 24 Feb 2020 16:59:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F40E3C0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E3E4584AC5
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNf3kR8YCmBq for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 16:59:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B16B3845C5
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 16:59:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so45643wmj.3
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scmbAO6wzrt+IWcheRPZehqNHYX56WQHidyo5gafnSg=;
 b=lTdy9mhOFPsmoLMiWYWzUPwO5/L1ZW/zHrw5WHhTOGFGqo0qp1pO1XqXgivCA5tu8f
 4WQQor5LDVG67jiip5XJXjVu0KBJp/48upaRAm3sUJkDdX8PI8Y/dZ2sqayP4YFM7Lth
 M6NG+tFPUc0L24XYFzihuldbhJ9jKoGp/GZFOaf6/CoDo5RnB+s36ZN5IY188JGQYAua
 D1Q+Xkpfkhq1pefdMw0+/huUWPOh1m1Yli+CU0oFvjD/jwECwDIQHByH5vst8JzbuY8K
 pPjJqk1eTJaZLDapQ2r9fU/Bhlrc+tTo4251aNoGDPfuLR/VY5I8Ze3QoL1+aHlvUZRj
 ecdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scmbAO6wzrt+IWcheRPZehqNHYX56WQHidyo5gafnSg=;
 b=n3x414aRZ34Bm8XsyQWxSmcKr4G/OOPZQPzrYwYWM3vcCuA1XATvFpnE4O06Jio/o8
 MFynf56LjtwRB/omSNmemOSSIJCLMbOb3YGOCgA8C36RTZIeyk+Lsxn8QLHYn5vO4y+Q
 Y220kSCboI9x2MW931sZh3kJWT6iPbPwJsoExLJjoiDJV2pOAVQLIk1DihyL+XBNFOdN
 TjiOBxwOfiyuf8QOmowdrZ0y83FWwn8HX79BBzMoQCne4zpJ8Ym62p6aD2ay/b1zQZIc
 5yY4P8VYqjVC1EsPaIgbO0LB5O2R27ZW+2wVrMscbEJk1xEAa/V+pE6uWye548UlLRlq
 x6NQ==
X-Gm-Message-State: APjAAAVsEUQJcMcJ3/BcYtqbCBfeZovN2yNIbePezwP9/dlaT073Rrfc
 Wng11F0E7Qt8TImPlGpx4P2+cw==
X-Google-Smtp-Source: APXvYqxpXn2k4aIHPUjRRSjdhBRuWiMSxycEwYczmhlVZO7EaXRfsvHlrCGZTCB+GlB0NKSXYk0O+w==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr22387669wma.81.1582563542078; 
 Mon, 24 Feb 2020 08:59:02 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id b10sm19473978wrt.90.2020.02.24.08.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 08:59:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, will@kernel.org, bhelgaas@google.com
Subject: [PATCH v2 0/6] iommu/arm-smmu-v3: Finish PASID support and command
 queue batching
Date: Mon, 24 Feb 2020 17:58:40 +0100
Message-Id: <20200224165846.345993-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: zhangfei.gao@linaro.org, robin.murphy@arm.com, robh@kernel.org
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

Finish off PASID support for SMMUv3, and batch command queue.

Since v1 [1]:
* Added patch 4 to factor command queue batching
* Included patch 6 from Rob [2]

[1] https://lore.kernel.org/linux-iommu/20200213101435.229932-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/linux-iommu/20200213205600.19690-1-robh@kernel.org/

Jean-Philippe Brucker (5):
  PCI/ATS: Export symbols of PASID functions
  iommu/arm-smmu-v3: Add support for PCI PASID
  iommu/arm-smmu-v3: Write level-1 descriptors atomically
  iommu/arm-smmu-v3: Add command queue batching helpers
  iommu/arm-smmu-v3: Batch context descriptor invalidation

Rob Herring (1):
  iommu/arm-smmu-v3: Batch ATC invalidation commands

 drivers/iommu/arm-smmu-v3.c | 139 ++++++++++++++++++++++++++++--------
 drivers/pci/ats.c           |   4 ++
 2 files changed, 115 insertions(+), 28 deletions(-)

-- 
2.25.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
