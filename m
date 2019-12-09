Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B1116D3F
	for <lists.iommu@lfdr.de>; Mon,  9 Dec 2019 13:42:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE98985E28;
	Mon,  9 Dec 2019 12:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpnehN00V1qM; Mon,  9 Dec 2019 12:42:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 725EC85C5C;
	Mon,  9 Dec 2019 12:42:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60803C0881;
	Mon,  9 Dec 2019 12:42:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8248C0881
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 12:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C68A686689
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 12:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qhubako8TV-g for <iommu@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 12:42:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0513D86DBD
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 12:42:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y23so15357715wma.0
 for <iommu@lists.linux-foundation.org>; Mon, 09 Dec 2019 04:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kt7p4k+Nf/7mN4xNa3BmLBFlNZDiWhRJFK4MIZmtI84=;
 b=ct0ni2DcuwSUbm5dc4GMFI0g5eNd4PKkBlx7rcL9kuH+/13YZ/OtzwhZfM4vMV/dJ7
 Y7jgn+34a7oKQgUUaQgLBnGN53zTdlieD2/KBbIzYm6t+E0PdbBMMMWSIbe2VO4UayzU
 Wa3d9laoDZP056G43UHsU0Q+aAZQnQ5C4fuYbPpvC0jqb8KYszSZ3WxspGju51VxEhAc
 Lf8A1neoJx9+WfPq1pmPUUMo6xeH+EErSa0UiflfaRU6X+XPbiV0deLX/4aLJYpags50
 lX3HhYj8LwgATG1pS7SzWZu+wkDgy3fH6i3xtL9VOjWP+W2Z2ztNwAn94UkA3MaG4sSZ
 eHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kt7p4k+Nf/7mN4xNa3BmLBFlNZDiWhRJFK4MIZmtI84=;
 b=qMqbgDa8Bj6EhhUl37MISzkK/PlTusontnLuZPb/IgYfaWlperSz4IOPR+H2io9mQH
 Lf7cDA7ffOF/ATkyfxRZ3R++dfc7/b53Gke6DSHakO38wAoLBc7pyOznykDXpeAy5sld
 60Es42ksYAM4fZyoW69BIWLquM92XBlVgt9+JIGgfCXRO2idog/AnpAbo22Cs6CTr0MD
 mOUbUKDkyqtsWqXmQMTkaCXLV3+IqsOMN6g91U7vcs0ZtLVhWx5P/PqawJmuircrit8U
 p/xaOAlC6fYQDhhzk6dPgoBqkyQwUjoQrSA7NTbMU0cRm2wb1KMIb+iF0vOkYE/v1Yjx
 /SqQ==
X-Gm-Message-State: APjAAAUjsbYIXmFGrZZk2Gbj3VHOsYOZFc5k27/TMw5eDT4PPtO2wJu6
 CbRG9IT7u8QYXYBck+upJMUrB87U2TQ=
X-Google-Smtp-Source: APXvYqzZHxnQWiQuNC9COZjT09cnIbdwAbAFHjhhSPh+DPFQU0WQziwL/6XwWgSZpI2KfOvj7Uhxaw==
X-Received: by 2002:a05:600c:1051:: with SMTP id
 17mr24275140wmx.49.1575895370230; 
 Mon, 09 Dec 2019 04:42:50 -0800 (PST)
Received: from localhost.localdomain (adsl-62-167-101-88.adslplus.ch.
 [62.167.101.88])
 by smtp.gmail.com with ESMTPSA id a3sm14681035wmh.5.2019.12.09.04.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:42:49 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/dma: Map MSI doorbell with iommu_map_atomic()
Date: Mon,  9 Dec 2019 13:38:25 +0100
Message-Id: <20191209123825.137391-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: jroedel@suse.de, robin.murphy@arm.com
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

Since commit 781ca2de89ba ("iommu: Add gfp parameter to
iommu_ops::map"), iommu_map() might sleep. iommu_dma_get_msi_page() runs
in atomic context and thus should call iommu_map_atomic() instead.

Fixes: 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0cc702a70a96..f5add956641d 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1184,7 +1184,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!iova)
 		goto out_free_page;
 
-	if (iommu_map(domain, iova, msi_addr, size, prot))
+	if (iommu_map_atomic(domain, iova, msi_addr, size, prot))
 		goto out_free_iova;
 
 	INIT_LIST_HEAD(&msi_page->list);
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
