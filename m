Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BC39EBB4
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 03:55:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26516089B;
	Tue,  8 Jun 2021 01:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 809GEJCPiate; Tue,  8 Jun 2021 01:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B542608AA;
	Tue,  8 Jun 2021 01:55:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73F4DC0001;
	Tue,  8 Jun 2021 01:55:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A71E6C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BFA83A8F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghQB8hn6ztzV for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 01:55:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 109CC83A8B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:23 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s14so13607965pfd.9
 for <iommu@lists.linux-foundation.org>; Mon, 07 Jun 2021 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gA93gcDJeBg/RhtboQ/3cmND2A1WryjuLSn85WsFu6g=;
 b=smr3+6OdXCX0hxcoS3KifFK/dV+LXqWV0dvi3Zm9J0DyNPNH7h2U08dl5QLHIjkWXM
 UKozM1JMhBxDdFhL1Ce2WCfg9Ig4REet6bVp8J9Bm/pglDJfb5H+m2hSp+fcPB4Ocjfi
 RTrsMc+gLmd5Pjb36a6ezbUGGDre5VVLY2jR2BRU89KOAUSUPoJUoKkScAJjA3tnwMyw
 WKTSumESx4sH8LDWKWCY1BXJPkDubzipufR8I3eHaomR3DfugGYS3kuhDsNOM+o/lCme
 mOPEPV89hmsgtakWyeP+Knl1ZS4/mrrMx3er/HSZWkteycTJrddPXtMmxDWyRKvR3RAT
 XqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gA93gcDJeBg/RhtboQ/3cmND2A1WryjuLSn85WsFu6g=;
 b=owVZsjqnRw39oEUFpCqrJRxj6a6IJpTgbRNZwzQ2rZs+YvyY6ixcktiANNJdsqOPDu
 3VDD0BnWqE1wdaKk2RMwbIJ6kZng9648XhNBvqBDD/bfPZ6ThGW7fMHV0Pm8np4oQG++
 SnAzuZ3zdOCdbf+DDKnHIuh6rmxZRjBBb2uoK5JDPQFuy6LVIuzdCt/t/nUFxP+sq+Eb
 BLBgSekvqH3D27E+HzWcQwrvp73jcAS/rvPDfD5ZaiJABoCH9l2MA9QYPpG/u/DjcYFR
 iAoM/UHZV7tPGhROZHY2SwBT5k/BQZKXMTy+XSbccKNztYNF5ujl+IQ0ATxmsb1c2goH
 /tsw==
X-Gm-Message-State: AOAM533K3RgoyWmu/RpQ9hIr4jM9X6F21HbHl/HnWmgQkYPOxwzchTF9
 x4qeBNR5RJJUyQ1AKB6aWZw=
X-Google-Smtp-Source: ABdhPJxEWq3ejES1pz5zIYlzqOcXjYDrBEEmksqiBOvaj5ucy7+uYMegKQfJMj4S4H4yXtBkArI+ew==
X-Received: by 2002:a62:b604:0:b029:2d5:d7b8:b531 with SMTP id
 j4-20020a62b6040000b02902d5d7b8b531mr19567614pff.31.1623117323356; 
 Mon, 07 Jun 2021 18:55:23 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id s24sm9284767pfh.104.2021.06.07.18.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 18:55:22 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 2/6] iommu/amd: Do not use flush-queue when NpCache is on
Date: Mon,  7 Jun 2021 11:25:37 -0700
Message-Id: <20210607182541.119756-3-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607182541.119756-1-namit@vmware.com>
References: <20210607182541.119756-1-namit@vmware.com>
MIME-Version: 1.0
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Nadav Amit <namit@vmware.com>,
 Jiajun Cao <caojiajun@vmware.com>, Will Deacon <will@kernel.org>
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

Do not use flush-queue on virtualized environments, where the NpCache
capability of the IOMMU is set. This is required to reduce
virtualization overheads.

This change follows a similar change to Intel's VT-d and a detailed
explanation as for the rationale is described in commit 29b32839725f
("iommu/vt-d: Do not use flush-queue when caching-mode is on").

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jiajun Cao <caojiajun@vmware.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 drivers/iommu/amd/init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index d006724f4dc2..ba3b76ed776d 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1850,8 +1850,13 @@ static int __init iommu_init_pci(struct amd_iommu *iommu)
 	if (ret)
 		return ret;
 
-	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE))
+	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE)) {
+		if (!amd_iommu_unmap_flush)
+			pr_warn_once("IOMMU batching is disabled due to virtualization");
+
 		amd_iommu_np_cache = true;
+		amd_iommu_unmap_flush = true;
+	}
 
 	init_iommu_perf_ctr(iommu);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
