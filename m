Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 291261AEF03
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 16:42:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD07288020;
	Sat, 18 Apr 2020 14:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpVpTx+vcARK; Sat, 18 Apr 2020 14:42:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A0B987F3F;
	Sat, 18 Apr 2020 14:42:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78506C1D7E;
	Sat, 18 Apr 2020 14:42:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 383DCC0172
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21490877D0
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMbowlYjbGF9 for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 86E8C87775
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:42:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE98421974;
 Sat, 18 Apr 2020 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220949;
 bh=v7Vipc0VT/4/+NWQ5NLJhdexjHV4UhMafyaRIs4x8WU=;
 h=From:To:Cc:Subject:Date:From;
 b=d5B+HIj0GX6/EAc49VIuu5zc+jixmQgtniJc9x+ZudPLTAfGvwNB/E30W5T3GNfQL
 5iEAw3NBlSLmDq29aJlraF3FuTJm+HwGEzuBHVSiMb2tNe8lz2m45NtB0MDw8JvcWf
 IJGdMan6GqLosFFmic8Gekvd+3HOFGoSn7HvXymY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/47] iommu/amd: Fix the configuration of GCR3
 table root pointer
Date: Sat, 18 Apr 2020 10:41:41 -0400
Message-Id: <20200418144227.9802-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Adrian Huang <ahuang12@lenovo.com>
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

From: Adrian Huang <ahuang12@lenovo.com>

[ Upstream commit c20f36534666e37858a14e591114d93cc1be0d34 ]

The SPA of the GCR3 table root pointer[51:31] masks 20 bits. However,
this requires 21 bits (Please see the AMD IOMMU specification).
This leads to the potential failure when the bit 51 of SPA of
the GCR3 table root pointer is 1'.

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
Fixes: 52815b75682e2 ("iommu/amd: Add support for IOMMUv2 domain mode")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index 69f3d4c95b530..859b06424e5c4 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -352,7 +352,7 @@
 
 #define DTE_GCR3_VAL_A(x)	(((x) >> 12) & 0x00007ULL)
 #define DTE_GCR3_VAL_B(x)	(((x) >> 15) & 0x0ffffULL)
-#define DTE_GCR3_VAL_C(x)	(((x) >> 31) & 0xfffffULL)
+#define DTE_GCR3_VAL_C(x)	(((x) >> 31) & 0x1fffffULL)
 
 #define DTE_GCR3_INDEX_A	0
 #define DTE_GCR3_INDEX_B	1
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
