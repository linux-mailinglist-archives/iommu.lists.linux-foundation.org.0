Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8144538FA84
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 08:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9EBC83BFA;
	Tue, 25 May 2021 06:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOOsHiAS3jrq; Tue, 25 May 2021 06:11:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A52982CF9;
	Tue, 25 May 2021 06:11:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD0ACC0001;
	Tue, 25 May 2021 06:11:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36165C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24AA2607B5
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8vT-_GxIMci for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:11:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9647D607B8
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id c12so11180342pfl.3
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 23:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IdcS0bFy+y6ulhI9jyzfyMDlCSagPAt22qi8j9Vz510=;
 b=mc4IUwZLJpdkM8bbnvHKPA26QdF+Ie2VdMYPxDl7eC3vIr98RQhLTsZbiRzQV4lZV6
 b6rdy5h6snfAVuj2BsDPxPJv4mQfj7sGtfCltHDRuSke2KeyQQpxS6+QvDBjeZBTuCCh
 0PvUc6xRGYUW/6U7gz2fBhTDRSPZyLCrr3fdK0u3bF8TtBdZRi26JGxaA4ZXZmDt1FNn
 fYDS6sWJrW6HnXloZWf3lBGURTFw1NRUoXBdTG6IqIin0yXnGe/9m9SKHe+mqYg+nFSr
 w6Dsrg6whm32mkaNx1jwiUEAiDlWcUcPiDebNsaxn4fdeMho6yqb7wC1Tkv4+sIVf8nf
 tyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IdcS0bFy+y6ulhI9jyzfyMDlCSagPAt22qi8j9Vz510=;
 b=NqamUUgZRWEQmMaltWCGNMG+LvRO65ouWLzJ8lG2c0FgGjspwM018AbG/gkQ86rzaS
 smjCB/wWHSH+0Z5bbuvwR+/okKUtwP2F7McAfrTbbcOdLHIQP6erTiU0LAhTSm/UyGrD
 LR6rXMuGb6QldXhGNZzBBvH684NONzHbdOgEJGHK25wXpkbwwPWSyk3pS3MSvBPkAL0q
 eEKRZT9368v7+MM/W7ykfFJvWaRk6qZgq0wMKNn7v+XxNZk+HzIQO44yvjWSWLRFCnGn
 +sqsHl0rWD1A2VUn/9gSE57bw5juALGdmQTsmN6Qdczpyo80cnktlinyxXDbysYEJYTI
 zN1Q==
X-Gm-Message-State: AOAM531W3C/tCSDnMFdIy+EMSZvSrbm+Jp4VNplVInUQs7xdsO1LQAJ4
 7kwrXUXMEU4gGww3Tm22EvE=
X-Google-Smtp-Source: ABdhPJxHFskWnQ3Twf0BOzSFH/LrWOUSxi3nuj1D6nt0WdQu2zeZNePHmRy1XEpqnnuunDpeUbBlcw==
X-Received: by 2002:a63:3444:: with SMTP id b65mr17373426pga.185.1621923073765; 
 Mon, 24 May 2021 23:11:13 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id h3sm12452301pgp.10.2021.05.24.23.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 23:11:13 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 0/4] iommu/amd: Enable page-selective flushes
Date: Mon, 24 May 2021 15:41:55 -0700
Message-Id: <20210524224159.32807-1-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, Jiajun Cao <caojiajun@vmware.com>,
 linux-kernel@vger.kernel.org
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

From: Nadav Amit <namit@vmware.com>

The previous patch, commit 268aa4548277 ("iommu/amd: Page-specific
invalidations for more than one page") was supposed to enable
page-selective IOTLB flushes on AMD.

The patch had an embaressing bug, and I apologize for it.

Analysis as for why this bug did not result in failures raised
additional issues that caused at least most of the IOTLB flushes not to
be page-selective ones.

The first patch corrects the bug from the previous patch. The next
patches enable page-selective invalidations, which were not enabled
despite the previous patch.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jiajun Cao <caojiajun@vmware.com>
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org

---

v1->v2:
* Rebase on v5.13-rc3

Nadav Amit (4):
  iommu/amd: Fix wrong parentheses on page-specific invalidations
  iommu/amd: Selective flush on unmap
  iommu/amd: Do not sync on page size changes
  iommu/amd: Do not use flush-queue when NpCache is on

 drivers/iommu/amd/init.c  |  7 ++++++-
 drivers/iommu/amd/iommu.c | 18 +++++++++++++++---
 include/linux/iommu.h     |  3 ++-
 3 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
