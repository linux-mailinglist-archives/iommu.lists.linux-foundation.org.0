Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0527BC37
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 06:58:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D42B86FEB;
	Tue, 29 Sep 2020 04:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bofjR3cGCSuo; Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4A4D86FDB;
	Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 833B8C0051;
	Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF1BC0051
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 286F385BD3
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjAUtAUaHu1e for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 04:58:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D833C847AC
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:21 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k13so3361815pfg.1
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WcAzkOGZ9dG56NRxUJHzwDEuHInbnX4+CA+UxuupEp0=;
 b=jUW4NrwIs8MohyGXB00UM3IYkVbNLJrSbtsx+ak2jvFMxkiLP5OThwhdzydCBj+4aO
 1A2JKQx6dZzPII++txHZexC0KSNT4RuG0ZnGi0swjX0iOGXQ6AV+qOjH28a6km+MrZnW
 bGDhzvyiURSz2mk57bNFM8/Udd5Uq9q4pF8YdupE1uMC9NZnnXUEepv3KrSxObm0Xc+t
 cKnufRpf2PwL17nfy2STHYbzqZPWJta+GGiFwIIMzIXtJ5cEjOXqpVQu2Pyyul00q44Z
 Tf/zcCox22dqYsFFZF/mk9P8lm40WmPfNeL63PdIUAVbfqb1aC9YISt4c3/xrCci6mjJ
 XuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WcAzkOGZ9dG56NRxUJHzwDEuHInbnX4+CA+UxuupEp0=;
 b=rw43hvIjbWzjYdlOWD7dVS2WuR3tnkhEcwX/TVR3wUCLVnFSfmJCfdVWPEecVRtA7Q
 lNgTDiOZwCT8Z1HlNVGsPFwPA7SeBVD8ZW4P1mV5AlYr1cKga0xa3EiUvx9AExAuUr0F
 nhHT/GF1NmuMiSk3dL8EE7zFuXJS2SxaCdjQ6Np7spNQisjAxOeomSVzsLrLR0e/FOWQ
 KNIBcP0l+LObHu9VeOgcxPDvswxA84GSThNR506poAFXO0XfNVFbYH2FUR3YxTbIBBsN
 DEfcbUdFbgMROIdydwvekIbok5mYAo9Y3vcReATr1xYlpQwey3g6WBZ/660JE3d8hV9M
 XcMw==
X-Gm-Message-State: AOAM5311hzgvNBXgZcAqlVtZGiot4M8uN/aoBLGkmtX6duN1ZovfO6rX
 AcaP6QUUeQBBjwFotnBuCfA=
X-Google-Smtp-Source: ABdhPJw1G14Ap4d06yym2CPFSTcMb1VvQeJfuKHlk49EQq1LAZ3bmf8jgRBcjURIS3ZDNqEAeHBSUQ==
X-Received: by 2002:a63:1b57:: with SMTP id b23mr1806815pgm.81.1601355501207; 
 Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 21:58:20 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v3 0/2] iommu/tegra-smmu: Two followup changes
Date: Mon, 28 Sep 2020 21:52:45 -0700
Message-Id: <20200929045247.15596-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

Two followup patches for tegra-smmu:
PATCH-1 is a clean-up patch for the recently applied SWGROUP change.
PATCH-2 fixes a potential race condition

Changelog
v2->v3:
 * PATCH-2: renamed "err_unlock" to "unlock"
v1->v2:
 * Separated first two changs of V1 so they may get applied first,
   since the other three changes need some extra time to finalize.

Nicolin Chen (2):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expend mutex protection range

 drivers/iommu/tegra-smmu.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
