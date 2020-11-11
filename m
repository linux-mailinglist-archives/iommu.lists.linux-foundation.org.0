Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 836392AFB62
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 23:34:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 28BDD2044E;
	Wed, 11 Nov 2020 22:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3vtZ2E4oKTD; Wed, 11 Nov 2020 22:34:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56C5020444;
	Wed, 11 Nov 2020 22:34:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 099E7C1AD6;
	Wed, 11 Nov 2020 22:34:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E29E9C016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C856086D08
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOiZgoGhu1-T for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 22:34:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DBB3586CF5
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:42 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id i26so2436192pgl.5
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cuZKalXwEVA3pcPeo63NU6Thuz7moWllpwq60etHaxg=;
 b=hhkHVHjIgEHs18DPdbHWDlcMPi/y7Baje+dH/qZ011g/UVcLjyMlfBf+5g7K0/PyzW
 ofMV4kdwvPDK4LSCV+GiGQBvYfe4okuL3sxwKOjYhCgajiTkr5EBuWphqyJPLgFakwId
 hhUSiI92+rtLkdBgE3E4G5WyJZINImObasRhY+TrZVZNE+g776/3srMm11jC+nLCsgpE
 38Dy4cErsFi8cxVGaAVBJnEqQ+SToi3jNKy5Y26Y8fXvCYCIxtVoMkIjcsX2jSXWJUuv
 UKHX3mdCKaWm6Rda/iIgkMUHZRB+lj7pl7GqZmh6ghUls+CAB3Gng5gY6WNEWLSPe5zg
 70sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cuZKalXwEVA3pcPeo63NU6Thuz7moWllpwq60etHaxg=;
 b=AzMrAdzqQ0IJAl98lNIMUBy2/eLhvYx+PInPg2vFhc35ZT/zWVB4kxYhNzN/vBEzy9
 zm58q5yFEGK51FQrL4lOv1oiCMjZix2+ls4BawxV/gzETAlYACl7gwFa4CyfRE/0mDTz
 ihBCBKNY+2wZUc0h1aP1pZeQl8XK7CkTiof5LJdUUWqzBhayhFr6Ay7x3WeHZKOF+lwt
 w0T5SNItu6UFiEpMGb0E8ABe/+jBF64MuUCEIyECz3xg/NaAp/mjW46fxdKyDKpgm1sk
 VwhBQSHfleE+S+6goDXLaseMn19Vl34CUngaxRa2gJyc5xvj9iJRl+W1zg/8vrKnlogJ
 bt1A==
X-Gm-Message-State: AOAM533dA+ih4GkD9/2mGnP6WFYajVWD0x7kLORni4uIzQNQLaxO6awF
 nlCVOfdXSGkqmjTZXfYZftQ=
X-Google-Smtp-Source: ABdhPJznXmXA2BGQCR2EjZAQvuohnoaFEGtA7gjXHo/FYBtU8gu6erlpcPJ69H+q5vmKqTZ6v/Rd9w==
X-Received: by 2002:aa7:92c3:0:b029:163:d2d6:8db1 with SMTP id
 k3-20020aa792c30000b0290163d2d68db1mr25303121pfa.17.1605134082430; 
 Wed, 11 Nov 2020 14:34:42 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 14:34:41 -0800 (PST)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed changes
Date: Wed, 11 Nov 2020 14:21:24 -0800
Message-Id: <20201111222129.15736-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

This is a merged set of resend for previously two series of patches
that were reviewed/acked a month ago yet have not got applied.

Series-1: https://lkml.org/lkml/2020/9/29/73
"[PATCH v4 0/2] iommu/tegra-smmu: Two followup changes"

Series-2: https://lkml.org/lkml/2020/10/9/808
"[PATCH v7 0/3] iommu/tegra-smmu: Add PCI support"

Nicolin Chen (5):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expand mutex protection range
  iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
  iommu/tegra-smmu: Rework tegra_smmu_probe_device()
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 240 ++++++++++++++-----------------------
 1 file changed, 88 insertions(+), 152 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
