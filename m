Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B742797CA
	for <lists.iommu@lfdr.de>; Sat, 26 Sep 2020 10:12:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 49A44204AF;
	Sat, 26 Sep 2020 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RuoHJe61elv; Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 494A820465;
	Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31A39C0051;
	Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EE5EC0051
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 267B486B87
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqLv_we2gyHw for <iommu@lists.linux-foundation.org>;
 Sat, 26 Sep 2020 08:12:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 87BFA8508E
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:29 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w7so5290103pfi.4
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RqGonHimm7XKXd4Ikem1uzvHdZOfGO32j99S5gvNitA=;
 b=j7IRl9KG/Se58SYA6QuKBw/YmiREdDFLHKttC0OcR475GvqIUmNwYl4EH6zKZRjWl4
 UQwJt9nQm2pxOy/cEOr3j3PKZn+0ERaK79LiLsWCHjm304oGXxjYEEcsDN56k2eKixfa
 hscI3xgUxuMp+t4T8gCXGGJvGmOPX2361HMj428IIAj83DHM1sXEuQCHZva8YCBaun89
 6KRJ9Pbqp8czbZzATMwH0ToUTTkrUfvfyJrEWMq7k7lUTuneSPuS8oFfoxmGSwABPngq
 ViS9j5mnTvkWndOh2eSLtjE26QFp35ccwIZh6u44Lz7Mo4g0X7aKAJW0CC9p96YclRt+
 ftCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RqGonHimm7XKXd4Ikem1uzvHdZOfGO32j99S5gvNitA=;
 b=S2MEAKZz/AlS8itIUPIHKUHKqTJjP/4bm0qXkWkt3orMpvLxSD9/Xh39pcxqq5NnSG
 pTswlUPHikebI2HCcbcQRM7MhZscWBn8G5R9weU3NHeugjrlwuOXwC7ck0Ip1bwXmel6
 6lr5aoh5cLbfIQP3HmuUp8US3ltrfD7esd+Cgd/e5jYjBNfxv1q6yxrfMFi4VQjJ/LBO
 LC15utfnuM9pJA8IDmY9BC2aG94QzPJ6EE4UBWDbe3vBV7T4TyFWMR1TXG4EJ9XP9kF6
 qXFwf4uihhlbW8+mQbkXEBNiP2si+joqR0L5IA/zmBP0XLo4F0OInspKtKJmWrRxS1mO
 hWwQ==
X-Gm-Message-State: AOAM531jeaHEVuT90o+KyH0vBfmlQttqw2Zm9uzkCFGhSd729QVSr7hz
 umBie2vKN6dvdZjimwkV4m8=
X-Google-Smtp-Source: ABdhPJy9a1WcIQBjVdYr5QAtqHP0TJd+SJ/l8Mqb8n6WGtKnDdwx1qDk93Bdrq7G0FwZSdF8jpKI0g==
X-Received: by 2002:aa7:97a8:0:b029:13e:d13d:a105 with SMTP id
 d8-20020aa797a80000b029013ed13da105mr2189367pfq.33.1601107949029; 
 Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 01:12:28 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	krzk@kernel.org
Subject: [PATCH 0/5] iommu/tegra-smmu: Adding PCI support and mappings debugfs
 node
Date: Sat, 26 Sep 2020 01:07:14 -0700
Message-Id: <20200926080719.6822-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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

This series of patches are some followup patches for tegra-smmu.

There are four parts:
1, PATCH-1 is a clean-up patch for the recently applied SWGROUP change.
2, PATCH-2 fixes a potential race condition
3, PATCH-3/4 adds PCI device support
4, PATCH-5 adds a debugfs node for phys<=>iova mappings

Each of the four parts is sort of functional independent, so we may
apply them separately or incrementally depending on the reviews.

Nicolin Chen (5):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expend mutex protection range
  iommu/tegra-smmu: Use iommu_fwspec in .probe_/.attach_device()
  iommu/tegra-smmu: Add PCI support
  iommu/tegra-smmu: Add pagetable mappings to debugfs

 drivers/iommu/tegra-smmu.c | 287 ++++++++++++++++++++++++++++---------
 drivers/memory/tegra/mc.c  |   2 +-
 include/soc/tegra/mc.h     |   2 +
 3 files changed, 221 insertions(+), 70 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
