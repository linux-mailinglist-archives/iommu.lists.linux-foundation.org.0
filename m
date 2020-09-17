Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58026DA56
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 13:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 656A287843;
	Thu, 17 Sep 2020 11:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cB5Ca-4DC89; Thu, 17 Sep 2020 11:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7BEE86FAD;
	Thu, 17 Sep 2020 11:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAAE7C0859;
	Thu, 17 Sep 2020 11:35:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB345C0859
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D6A8786DE0
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdEXP4tvaTWm for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 11:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 935D286FAD
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:21 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g29so1211737pgl.2
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GvmM/Nssdueta9CrhTB+xKzv+MVW+fGaedO25VPM3wI=;
 b=eXKakrSKUeMzAXKyJsDOzKwVoFULgNSRkUcOz/zGh23WFcBhzUv6ZqH1ZHaFSE97XW
 J/iDAG+4eNrdDsrsdwbusHLauALH/pPxywUoq3Qca25K6gkCpgpcQSI7TWwuZZjKS0VZ
 wdw6lyIpMRiSM1TBsFV4pkoKI/yvLKEIzpuveTTlP5ktNqvIW5MbnadhUsPm7qjFkAB0
 OiombkC5GdfchY0x5JaKwGR9NjhR+khRelj/IEgIJRXR9BeEFdCb780xm4Eq2yg6++Sp
 ouqV4QrEo2bh3lRq1VemVidYAiXbEmlozjhaDpeNnQKePsAlGUThCK1AyClDwG1xgu+/
 dw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GvmM/Nssdueta9CrhTB+xKzv+MVW+fGaedO25VPM3wI=;
 b=bbKPGPDazuHQRyCTRtmCsr/dh6QQVWSiTcia7iMviHR/XAu793gR8pxbFr5TnH7fk8
 amy3DltZHbeKD50za04rJJbRDWFHAVpoKgQKn9NIItCSIaPz7ylki3sJFfYVixg1J1Zt
 Ht0imNpzyhGA0oGSCDOgXZ0gM+6TfDm3JTQvJbWzL6W6TjXA7H/O4NjiKsDt75tWOagJ
 2mrIo8NCKYPACzwzICOZeUfmZm6Exd+Y3GtGvag/VYO971+Ijfq1jmKtd3i5pQhuRojQ
 kqCj9edRZlVLyfvcn2+ALAQCRT1VoEY37Ek4WKjGEo0rywRKfQwzhjD1dCTaqVou3Tg7
 hTcA==
X-Gm-Message-State: AOAM531MnZCtYGMLRs9nAOk5yhTOn0pTxgjafUIB/GKu4reCUVvhuLZm
 B5KzNU3uAJ2P2MQ3AiSIo9E=
X-Google-Smtp-Source: ABdhPJynw2LhC50rKek/46CFwADUp7ZQhyDvwiGFvl/E2XFVwla9P5bdDg13UZedoG9QVBThxEbYpA==
X-Received: by 2002:aa7:96e1:0:b029:13e:d13d:a138 with SMTP id
 i1-20020aa796e10000b029013ed13da138mr26450620pfq.32.1600342521100; 
 Thu, 17 Sep 2020 04:35:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a138sm21128382pfd.19.2020.09.17.04.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:35:20 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: krzk@kernel.org,
	joro@8bytes.org
Subject: [RESEND][PATCH 0/2] iommu/tegra-smmu: Fix TLB line for Tegra210
Date: Thu, 17 Sep 2020 04:31:53 -0700
Message-Id: <20200917113155.13438-1-nicoleotsuka@gmail.com>
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

These two patches fix ACTIVE_TLB_LINES field setting in tegra-smmu
driver for Tegra210 platforms.

This resend in series groups two previous seperate changes that're
corelated, being pointed out by Thierry. Also adding his Acked-by.

Nicolin Chen (2):
  iommu/tegra-smmu: Fix tlb_mask
  memory: tegra: Correct num_tlb_lines for tegra210

 drivers/iommu/tegra-smmu.c      | 2 +-
 drivers/memory/tegra/tegra210.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
