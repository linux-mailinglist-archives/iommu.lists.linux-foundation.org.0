Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE382B2DFB
	for <lists.iommu@lfdr.de>; Sat, 14 Nov 2020 16:28:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73A42877B1;
	Sat, 14 Nov 2020 15:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgyvYJ5mNl19; Sat, 14 Nov 2020 15:28:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8BC61877B3;
	Sat, 14 Nov 2020 15:28:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76C0BC0800;
	Sat, 14 Nov 2020 15:28:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06B39C0800
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 15:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 027E2872D7
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 15:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VXE-T3fnsru for <iommu@lists.linux-foundation.org>;
 Sat, 14 Nov 2020 15:28:41 +0000 (UTC)
X-Greylist: delayed 00:07:38 by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A67D6869DE
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 15:28:41 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q5so12426020qkc.12
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyihr231RMubay4CbLM0CzqsU3IYdDyAVzI9nCSyEmQ=;
 b=b7SR3HvX3UB6CNFmVT1MRh/T3AbOW0rx0EaBSC6J0raX7wx7URuwvoXNL03RrNiIfA
 GdtxCFmiigylNWInfqOD1MEcs9K6nTYuEPrVCXeIfl0YXHiinU0QTGfDtg33HobVUtk2
 YMTUdLBp0Q++2LtPhu8OguQ6WxjSlF5XAtAGRdr5vk6TpZD+6TbqPeKtgI4V27RwzanU
 dqZ3dtoO1E8ZtvbzP+l/TATxTJbqVY15hOY/Z8byQheAgoJF5qDxNfaHnKbe7bY0pmHD
 EtKxqGKYknBH/SEbJITgMzc4oVE2Yw4m0Eam9pgW9FUz9YSL6b9xkzBnHa4QC0dV2/bs
 NFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyihr231RMubay4CbLM0CzqsU3IYdDyAVzI9nCSyEmQ=;
 b=APIDYXHTIsnlnYdO34CnBE40oBuUD3d3HPB1KR4xZBozn8VAeNUuCRFpNtk+JOI+FW
 6cU9FJmrEb1denk0+O6SWrym5wpz7XtXf4447jJ0B0Gtn1pylZRXMhyD2QRzzyWR2fDg
 Lv/2XdohSZRSmAOrsW+Ty8gIenDeAsgv61X9Vyou7IbE+o+o5X+w/o7aMvnM7NvJTgYj
 WVSL2Mtn1qmEWbSqt6VpEu4vWeQtUf3GCFXxzmBRpt2wyyqTgcOpSV9ygOsq/Ts1lXrw
 c0a0C00CJncZilBxHbbLniiq8sLb8S+R1oDZ9neNL90l7+1hncIvMpiMLPlBGDKORpQa
 70Sg==
X-Gm-Message-State: AOAM530ws2To52yEZOw1K/2x+L+WOd3Ut4mIyEI3NM1pqiRq90bVYaE0
 wt2wNN2JJhxVPAC4TVNneDRHRROejIOVtSQ5izA=
X-Google-Smtp-Source: ABdhPJzVgK6CWOkIV4kq6V0/HrLYtOKZUR5SOFvW/AyGaPBokJsqJ+1bD6K/JnISu5gV/3s+3gOJEA==
X-Received: by 2002:a05:620a:1521:: with SMTP id
 n1mr6768979qkk.187.1605367267658; 
 Sat, 14 Nov 2020 07:21:07 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:07 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Subject: [RESEND PATCH v2 2/5] dma-direct: add dma_direct_bypass() to force
 direct ops
Date: Sat, 14 Nov 2020 10:17:10 -0500
Message-Id: <20201114151717.5369-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
Cc: "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>
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

Add a function to force direct ops and disable swiotlb for a deivce.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/linux/dma-direct.h |  9 +++++++++
 kernel/dma/direct.c        | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 18aade195884..41f57e1b7aa5 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -124,4 +124,13 @@ int dma_direct_supported(struct device *dev, u64 mask);
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 
+#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)
+int dma_direct_bypass(struct device *dev);
+#else
+static inline int dma_direct_bypass(struct device *dev)
+{
+	return -EIO;
+}
+#endif
+
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06c111544f61..304a5a77cccb 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -548,3 +548,26 @@ int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_direct_set_offset);
+
+/**
+ * dma_direct_bypass - always use direct mapping path for device
+ * @dev:	device pointer
+ *
+ * Note: this also bypasses swiotlb. Not available for arch with
+ * force_dma_unencrypted(), since this doesn't deal with that.
+ */
+#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)
+int dma_direct_bypass(struct device *dev)
+{
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	dev->bus_dma_limit = DMA_BIT_MASK(64);
+	dev->dma_ops_bypass = true;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_direct_bypass);
+#endif
-- 
2.26.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
