Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AE15D5F7
	for <lists.iommu@lfdr.de>; Fri, 14 Feb 2020 11:44:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1D208648E;
	Fri, 14 Feb 2020 10:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOCJV0uqdFPf; Fri, 14 Feb 2020 10:44:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68B4F863F4;
	Fri, 14 Feb 2020 10:44:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEC0C0177;
	Fri, 14 Feb 2020 10:44:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30858C0177
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 10:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B2B0203D5
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 10:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XesNN5+JgH3u for <iommu@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 10:44:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C72520364
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 10:44:54 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9so3588417plo.11
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JSubFwN35T+b62vP9jWgmVJY6HbBGZE3vWLKxHHl+uo=;
 b=H5Zgz6FJSDr5ZiBjaSFtuahR4lYtYeelris7xNWPQ8zzSWEx0wdPi83Cf/H/odrsCQ
 UzOk3rywcvABbHcYTvPc2DRBEZ3i27p00h/Nn6YHFInj4t+bjJf4IrszGYHCEkhL7RzO
 wR2ugoQC38jTDhy54d7zstdnJhHjRrYBx48a4djmuV+GzApD5mUjmJ4ZZ4VniUzZxUkm
 DWR22Yfuw3gmT6eD8mSGoSPYSm73yU4Mv8tSjESCYVSDPcNEhApx1yRUj8cP7RO8N/E1
 vkNsL3Z1f5X3RQ1oYhkKlt7zXaQxWDhM7UznxJ6iHLMYcN8DdzoL+Q6KMewCrS8l7u7j
 pOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JSubFwN35T+b62vP9jWgmVJY6HbBGZE3vWLKxHHl+uo=;
 b=JW9LyidcF1IejnFlDMmNpj4qi0bqrB4vNrphal5dh13JxzehV2aY5sJ/TtvHjjUopm
 2H0ZkoKAwAqhFmNCs5xaxlrMmSGWI4lLZz9LU/vtqioy5f46KqNSPY+bFAMDddD28u/S
 Rg8xLVD77akNra3i308Togj1DSbqkJeQJbYgagvMcfd/13WkTypbKQWZXH8CGc9nHGjO
 iTFHlCLm4M5d92ozWyjL0yst0IN58WVUPXmWF0iUHr2eSz2/6MRrwNHmT2BA7VPTf+8n
 VOrGc7BAkoLNagfPhLUWE0SlNTj7w/gpJt2gmEMaEydfM4y5tUEJyjLiEuf3rbAUGqv9
 gBxg==
X-Gm-Message-State: APjAAAVrp3zHng45fhVCvXy1tMH798/SNQCnXQXoR9s+69MFyIYLuH2j
 3zqkVTtnLe4EX89eTK5FlHk=
X-Google-Smtp-Source: APXvYqx31ArjPm59PPd3XhYXn9lBvQM3fANjquCTPy7Rj1RhdoCbBX1korIJPqJrV1WoBrbDgdbazw==
X-Received: by 2002:a17:90a:c084:: with SMTP id
 o4mr2707853pjs.35.1581677093958; 
 Fri, 14 Feb 2020 02:44:53 -0800 (PST)
Received: from AHUANG12-1LT7M0.lenovo.com
 (111-254-13-157.dynamic-ip.hinet.net. [111.254.13.157])
 by smtp.googlemail.com with ESMTPSA id x21sm6372980pfn.164.2020.02.14.02.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 02:44:53 -0800 (PST)
From: Adrian Huang <adrianhuang0701@gmail.com>
X-Google-Original-From: Adrian Huang <ahuang12@lenovo.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/amd: Fix the configuration of GCR3 table root
 pointer
Date: Fri, 14 Feb 2020 18:44:51 +0800
Message-Id: <20200214104451.16076-1-ahuang12@lenovo.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

From: Adrian Huang <ahuang12@lenovo.com>

The SPA of the GCR3 table root pointer[51:31] masks 20 bits. However,
this requires 21 bits (Please see the AMD IOMMU specification).
This leads to the potential failure when the bit 51 of SPA of
the GCR3 table root pointer is 1'.

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
---
 drivers/iommu/amd_iommu_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index f8d01d6b00da..ca8c4522045b 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -348,7 +348,7 @@
 
 #define DTE_GCR3_VAL_A(x)	(((x) >> 12) & 0x00007ULL)
 #define DTE_GCR3_VAL_B(x)	(((x) >> 15) & 0x0ffffULL)
-#define DTE_GCR3_VAL_C(x)	(((x) >> 31) & 0xfffffULL)
+#define DTE_GCR3_VAL_C(x)	(((x) >> 31) & 0x1fffffULL)
 
 #define DTE_GCR3_INDEX_A	0
 #define DTE_GCR3_INDEX_B	1
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
