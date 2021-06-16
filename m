Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC563A9DBC
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 16:38:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A32404A4;
	Wed, 16 Jun 2021 14:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGpMIitvBTBL; Wed, 16 Jun 2021 14:38:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0B7714047D;
	Wed, 16 Jun 2021 14:38:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D20ABC000B;
	Wed, 16 Jun 2021 14:38:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 872C7C000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6820E4047D
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IcBj5DywbRD for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 14:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F71403B3
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:38:19 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id y15so2398369pfl.4
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=oBV8BMNG17jQpDc2Z9mJ7iOyNaaQ3dbfVhC8dxppwpw=;
 b=GXj+LbmIzNStnKhQkl3zrV8ozqhhcrKqh7SvYRN6ctSmh0OzbK4OJ4eVJjvqLNH8lW
 XuRuwFNElrIdpEGQzkzTrpdfS0u/9MLOrpbkQfvfY+vAb8SLkNXedkRXfruOCdG63sjS
 0B8B9GstQDTdILpNy8/Jy9+kbsh1TwddlLAy0MYUrel7blvlnzahu6JHc4Oxumt4HE4/
 Ibzf45zrfTv3HexMT3BMtGyBhAVn4fGyNB3cKLYZKviRq1HYEovehFopeRNwOWoaY47M
 Npr+s5yg+NTo2R85+l+0rZJ0g/29En2tI1LtR1JQa3rKjkgpOOvNtZJ6WBcPGW9mgAV2
 4eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oBV8BMNG17jQpDc2Z9mJ7iOyNaaQ3dbfVhC8dxppwpw=;
 b=pVgR45w8Anc4s0/SxLwHJ75ty3VZoMlQrtm+RYsXS/7zfpXDRy+GNUO4FQ4+7SENCS
 m1UAsutgnlYWXEswgAcgPAw9kyekV36NBmV9j+M21BcBDTc+gLXEPHhUv33S5l2iXMAW
 xbavTwD51liwCCshfy2jvu+RcrL6KdSEhslAXP7kKUsUG+HGSZLkTP2W5tP/NObc4Xqd
 ejrQ5XYGp+dX7srAjK4IjyVbVMJ5qn18zSNUIG1d4vmr6ViJ3fKPcsezbgjqZyWU9/2F
 jqAoQTR+ccWZfxUfBCgqVLlsmfuEuRFX2aaYA4y4WeEWyR1TxaQUJhCrMc2eev+lycRl
 74og==
X-Gm-Message-State: AOAM530zfhGW11sbTemm6nL/3LmoKKU40suv4jTifPCanfMz2UKK8E1h
 by30/55yI8mR7Ut1uqNs+CSlmA==
X-Google-Smtp-Source: ABdhPJwXVpPd88OHpJz/W5LE8otngNl59ImAIj0cVI1N3R15at/MbzFshEuQOZC+FS2/rPO4fk0/oQ==
X-Received: by 2002:a63:f955:: with SMTP id q21mr5348896pgk.448.1623854298753; 
 Wed, 16 Jun 2021 07:38:18 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.116])
 by smtp.gmail.com with ESMTPSA id d15sm2473084pfd.35.2021.06.16.07.38.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:38:18 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Auger Eric <eric.auger@redhat.com>,
 jean-philippe <jean-philippe@linaro.org>
Subject: [RFC PATCH] iommu: add domain->nested
Date: Wed, 16 Jun 2021 22:38:02 +0800
Message-Id: <1623854282-26121-1-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org
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

Add domain->nested to decide whether domain is in nesting mode,
since attr DOMAIN_ATTR_NESTING is removed in the patches:
7876a83 iommu: remove iommu_domain_{get,set}_attr
7e14754 iommu: remove DOMAIN_ATTR_NESTING

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---

Nesting info is still required for vsva according to
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210301084257.945454-16-hch@lst.de/

 drivers/iommu/iommu.c | 8 +++++++-
 include/linux/iommu.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 808ab70..ba26ad0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2684,11 +2684,17 @@ core_initcall(iommu_init);
 
 int iommu_enable_nesting(struct iommu_domain *domain)
 {
+	int ret;
+
 	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
 		return -EINVAL;
 	if (!domain->ops->enable_nesting)
 		return -EINVAL;
-	return domain->ops->enable_nesting(domain);
+	ret = domain->ops->enable_nesting(domain);
+	if (!ret)
+		domain->nested = 1;
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_enable_nesting);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d4480..179f849 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -87,6 +87,7 @@ struct iommu_domain {
 	void *handler_token;
 	struct iommu_domain_geometry geometry;
 	void *iova_cookie;
+	int nested;
 };
 
 enum iommu_cap {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
