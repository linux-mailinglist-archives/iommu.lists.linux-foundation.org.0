Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F1288ECC
	for <lists.iommu@lfdr.de>; Fri,  9 Oct 2020 18:26:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4F3987060;
	Fri,  9 Oct 2020 16:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ubz6BetTwJzN; Fri,  9 Oct 2020 16:26:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC46F86C4B;
	Fri,  9 Oct 2020 16:26:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90213C1AD6;
	Fri,  9 Oct 2020 16:26:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F36CC0051
 for <iommu@lists.linux-foundation.org>; Fri,  9 Oct 2020 16:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 24EC0877D0
 for <iommu@lists.linux-foundation.org>; Fri,  9 Oct 2020 16:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVXOj6CxG63Z for <iommu@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 16:26:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9194487764
 for <iommu@lists.linux-foundation.org>; Fri,  9 Oct 2020 16:26:52 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so7568953pgf.9
 for <iommu@lists.linux-foundation.org>; Fri, 09 Oct 2020 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FA0/JRQWBmowCExEqFY++1Bu3iAIWMgGDVt4Foa40XE=;
 b=fj2z75zDP7uH9u6yWI8HPvMSK8We2AyjvvoQ+3ukk9wM8AC1MCTP415+Iaw9+6C3Si
 08MjIYSaDHba+W1stkSGMOcRfCN4I1ni089iS2gAVb8wgiLbPxsN7XOzL442nAcFfWFN
 BjBwxVoSREgpIO2D7MyFo9tp7IHF89zh6pREFqOSQTd6QS7OjLGka2Zs3aSe7AlXtT8z
 eLmTVslMxZJ2uTKOIgsOqCwwy5WYR24HLhy/wHlAw2f7PlEvMtbCBC7vZBum012kkmu0
 wGvocCzbRivI3tEOZZbeT3bzHxONaG3kx+zkd2QMaoJoIZd4/MHQrMPR7jPZVeFc1DSK
 h+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FA0/JRQWBmowCExEqFY++1Bu3iAIWMgGDVt4Foa40XE=;
 b=kWmYIEhYPUwd8awZC8rRl+yoVB//YVy9NPZRuXCvSHHvc3R0T5p5CrRlx3w+XCC+K7
 M4BIDAUvGch49HL0jMpvdAxCG7MZzXgBfQOlYjMmEFl0EKXYCpYQCP+fk7ZgK1OCH40e
 dJ0K0zpnByeEIci6DAbn0cSa0vlTw5DxEO1n2xC5/zh8U7T4jparClAQvpKoDqp242O6
 xBapnIVIumzLM8N1nuvxpJxnareXPbJyPBX7pisTw/QEqLjlUKrAOCHrbR47S7e/4dpX
 a/ayxBz2XAY2obtOYmy95gh2jGUPzyR8wFQ3CDVjnJuR3EdCnp+LOEgcNUfmYpcPlbvb
 edgA==
X-Gm-Message-State: AOAM5326jvwRShGhr+J/sh9jHTQhiaRtDWZHPyVv4vmKqZMPxYOGPQP+
 RrHm5j90LhU1+asW/4sbhxc=
X-Google-Smtp-Source: ABdhPJx5yClDpScDvtHP/agSL+c+p6kXovmCoBzq1O3u/I4qImi4LCIfDR/iGkEB3MTz8KzkA2hl1g==
X-Received: by 2002:a63:7702:: with SMTP id s2mr3985330pgc.240.1602260812129; 
 Fri, 09 Oct 2020 09:26:52 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q24sm9591229pgb.12.2020.10.09.09.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:26:51 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	digetx@gmail.com
Subject: [PATCH v7 0/3] iommu/tegra-smmu: Add PCI support
Date: Fri,  9 Oct 2020 09:19:33 -0700
Message-Id: <20201009161936.23122-1-nicoleotsuka@gmail.com>
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

This series is to add PCI support in tegra-smmu driver.

Changelog (Detail in each patch)
v6->v7
 * Added comments for put_device in PATCH-2
 * Renamed goto labels in PATCH-3
 * Kept Dmitry's Reviewed-by and Tested-by as no function change
v5->v6
 * Dropped a NULL check, per Dmitry's comments
 * Added Dmitry's Reviewed-by and Tested-by
v4->v5
 * PATCH-1 Cleaned two variables inits
 * PATCH-2 Fixed put() in ->of_xlate() and Updated commit message
 * PATCH-3 Added Dmitry's Reviewed-by
v3->v4
 * Dropped helper function, per Thierry's comments
 * Found another way to get smmu pointer
v2->v3
 * Replaced with devm_tegra_get_memory_controller
 * Updated changes by following Dmitry's comments
v1->v2
 * Added PATCH-1 suggested by Dmitry
 * Reworked PATCH-2 to unify certain code

Nicolin Chen (3):
  iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
  iommu/tegra-smmu: Rework tegra_smmu_probe_device()
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 187 +++++++++++++------------------------
 1 file changed, 63 insertions(+), 124 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
