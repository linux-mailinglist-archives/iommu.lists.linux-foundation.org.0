Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB62C3D53
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 11:11:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3A898748F;
	Wed, 25 Nov 2020 10:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHw4ImPVaP3M; Wed, 25 Nov 2020 10:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B73C8748A;
	Wed, 25 Nov 2020 10:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DEEDC0052;
	Wed, 25 Nov 2020 10:11:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E795C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 10:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5C6AA86B7D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_cqWV1u0tkL for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 10:11:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AC5CB86B7B
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 10:11:49 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b6so1842893pfp.7
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 02:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vv5V+2hLr729rED7Crr86lpX2HrSw0iB0zF2Ja4Hlcc=;
 b=BZFjviglzi+xn8MJO9vBkgjTXTqH74pv4S2JyLBfeD5UBXB5izYqrI3gq2bWEG50nr
 xVVOwMzzPQXfdC8s8vRJ7QOFqwpRXbHum/rIUzB5L+R+r87dFM5mEawigVWchUtzo3Q4
 qpcHu3QrGNNooL5tDQOxR0v7BVjhUhnZW+hzB6+pcvbsRKN1faNd4QXZkWInduJEt2rw
 KAGVVT8hgZqK/TJ6rBFyOE33gOrbwjL97r0kRtCDwqCaq+H1pkkvJumHHAsXvHELNDB6
 Vd8jIKM3ndooyhgF4G+kRGZMjSpviuxas4amU+SLyrm1+YLve3DZbyo8hb4HJ60iMYLR
 RTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vv5V+2hLr729rED7Crr86lpX2HrSw0iB0zF2Ja4Hlcc=;
 b=iyh3M2blqnimlxnzVwlRuQXeu31p329ubdmAVPbgVqTSsEeWhRAKbAG+2sVtlwefAD
 caDj18I6GjcZHCjSu6eN1qbz4hVzWb6X16DTdFmdBOVbI+Sp8AjmIrqfYzfkoz3M/3nN
 BA4bzuHkqlphmCAz3buKXpDU0AD0UKCDkGrw2qbmr/BmUXgBwPBJizY6jC9W5qmLAjtS
 WbM7O8dUU36oHqfX6bmGs1YLoCAL/nza3V4WUaV4TD4sflyRxmuYjb/fmM0Fz5lKl92t
 Krl19IDkgGPYedujZ9FuaOQQa5HntLwaJ/kEcNN+Zw8wmp+BWsec9EYAVeany50v5aEU
 qQ2A==
X-Gm-Message-State: AOAM530+Wxk7e4jYCuu8uF0euRkpJ6fZK5VtsxpFj89Y6AHXpFW1g4hZ
 XveDZsEXAnRVZUvcb9evkb8=
X-Google-Smtp-Source: ABdhPJxq/2D0BIqUKB3jpZKYr+0pPg7cu62GgJEVH3AbieyOZ7p/7UkiIkhfttl25qwYqtzPafEuLg==
X-Received: by 2002:a65:688a:: with SMTP id e10mr2468380pgt.347.1606299109247; 
 Wed, 25 Nov 2020 02:11:49 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r130sm1599496pfc.41.2020.11.25.02.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 02:11:48 -0800 (PST)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: will@kernel.org
Subject: [PATCH RESEND v2 0/5] iommu/tegra-smmu: Some pending reviewed changes
Date: Wed, 25 Nov 2020 02:10:08 -0800
Message-Id: <20201125101013.14953-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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

Changelog
v1->v2:
 * Added Thierry's acks to PATCH-3~5

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
