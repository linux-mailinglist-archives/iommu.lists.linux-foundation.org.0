Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602D16678D
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 20:52:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0E8AC2153D;
	Thu, 20 Feb 2020 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGON5nkK2IG5; Thu, 20 Feb 2020 19:52:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 811BD214E4;
	Thu, 20 Feb 2020 19:52:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68DEBC013E;
	Thu, 20 Feb 2020 19:52:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98F2AC013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 19:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87CDD8623E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXv_pgGpSep9 for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:52:22 +0000 (UTC)
X-Greylist: delayed 00:07:38 by SQLgrey-1.7.6
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13AE986239
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 19:52:22 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id 71so2760019plb.18
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=A+oVpb+Lk0C4bnIx0YQSuGzTprOuprdSgDwQ17Ryeq8=;
 b=QZ0uQ2KOiOtz27OTmXVuPdy+gb5tJEgosgIPP20QlpfkVTPle1eV9rnsiQPHgrpD5X
 qbCig5OBHinZv6GG1T/hbfwUB04jCeISf9ONeijcwbDWf5dM4cYHteDIz6CDSqJXe6pz
 qPPQ/aG8Alq5YnJesmPag0mar3R4IwZTbwVBEADKHVxphochRgLSh935uNNpkEbn9PyC
 1P8fOHwhNqXJlZmC6Cepf+cUttboYMo4a91VQoIsba8RVrHWdJZPaW9Kl34lcU+s9LrN
 zl8Ehs5Wzl3LkrO7Frqat+skbWh5DML28CSifsderE2+WBhicJl6Mup+ZJeR+iQDguGt
 VcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=A+oVpb+Lk0C4bnIx0YQSuGzTprOuprdSgDwQ17Ryeq8=;
 b=NcXyrRO+rqxikOfNqyEy1To5bBVBOS0csuOhg+lnESnhamUi4EuLuj8Z1Y2zWgZZvA
 ccUkAQuZd+AkWk+BElm5foIfJf5GaIx4sF2vU3ReO0/QtK9wmBA4Urex/Pabt2/FAJw/
 St1i4uXVpYRWfga7AGH0daMj97DN/o8W7IM5o7OYHl6gl2uWlLdRPzFrYytblMmEw7QL
 pyZPQZ1VoD3TcmKUyOCgl5MggCJLmD+fG1s0wuK7M6www/PGaKcGjnLlpmvV+nnCJyHr
 9dXVq3aBLWMNmsmZSvRnl10TUNR8ImhdDz4o/9R+kAVhxzg5mC1MPqGbS6Zfw4auJvg+
 Du/g==
X-Gm-Message-State: APjAAAUf6HIEz5J3iRXuLCbR4SBgV3u+K9zZkvkVkAJgT5PHGf0XAKrB
 0Oj9I13X9OFUCkI3v2VuzU1IlDzUd/pAcg==
X-Google-Smtp-Source: APXvYqyDNBAd9llJr9uXqcKnHjQnxyRTE1k3X8Epf4THWj+dS6sSLVAZ4gd2YU4H44IvNCnSBzQLKMTRfm6Q4g==
X-Received: by 2002:a63:790f:: with SMTP id u15mr33406976pgc.172.1582227883584; 
 Thu, 20 Feb 2020 11:44:43 -0800 (PST)
Date: Thu, 20 Feb 2020 11:44:31 -0800
Message-Id: <20200220194431.169629-1-yonghyun@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2] iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys() for
 huge page
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>
Cc: Yonghyun Hwang <yonghyun@google.com>, linux-kernel@vger.kernel.org,
 Havard Skinnemoen <hskinnemoen@google.com>, iommu@lists.linux-foundation.org,
 Moritz Fischer <mdf@kernel.org>, Deepa Dinamani <deepadinamani@google.com>
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
From: Yonghyun Hwang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yonghyun Hwang <yonghyun@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

intel_iommu_iova_to_phys() has a bug when it translates an IOVA for a huge
page onto its corresponding physical address. This commit fixes the bug by
accomodating the level of page entry for the IOVA and adds IOVA's lower
address to the physical address.

Signed-off-by: Yonghyun Hwang <yonghyun@google.com>
---

Changes from v1:
- level cannot be 0. So, the condition, "if (level > 1)", is removed, which results in a simple code.
- a macro, BIT_MASK, is used to have a bit mask

---
 drivers/iommu/intel-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 932267f49f9a..4fd5c6287b6d 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5554,7 +5554,9 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
 
 	pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
 	if (pte)
-		phys = dma_pte_addr(pte);
+		phys = dma_pte_addr(pte) +
+			(iova & (BIT_MASK(level_to_offset_bits(level) +
+						VTD_PAGE_SHIFT) - 1));
 
 	return phys;
 }
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
