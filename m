Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F374E52809A
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 11:14:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A968D40AF7;
	Mon, 16 May 2022 09:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RejGRE8raJJd; Mon, 16 May 2022 09:14:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8F73540AF1;
	Mon, 16 May 2022 09:14:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67254C002D;
	Mon, 16 May 2022 09:14:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD28C002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B7540AF7
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Svkls47lwggc for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 09:14:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6AC140AF1
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=On1cP0Hd5F38adMLMuCa6KfO/g5+NNNnu5Hh1rm2yUM=; b=IOUGJOnzIxL/29DIhLFxxVFObV
 Z7bi5J5unwQxz4DRhymFRcHjITDmo3xu80gVc/ip3ahnzvW8jPvqjfAw6WZkeFUaDFvaT2/I54TX1
 9xHiHy/CSWF4LRLxgVnIOes9vI1RXGsLM2DiXFpOjyjzQJQyqMFcpPXbOF/woGva9iYA6EgHnbnDX
 FoEyd0MX56ZQphN0reqIlJWL61mczUDBL7KBIGwSKl+AZPNv+OU0kt7+dilgo7JPJCU5Meqwq5zQJ
 raNc7DNGzg+Os/4JfP8mgTpFpMzn8HCr1gCWrfxvCn/X3RhHmvGw8dFZ2z53TOdZht4PZhB9rueX0
 +93UyP8g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqWTf-0005fd-Fz; Mon, 16 May 2022 11:53:19 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v5 9/9] drm/tegra: Implement stream ID related callbacks on
 engines
Date: Mon, 16 May 2022 11:52:58 +0300
Message-Id: <20220516085258.1227691-10-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516085258.1227691-1-cyndis@kapsi.fi>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement the get_streamid_offset and can_use_memory_ctx callbacks
required for supporting context isolation. Since old firmware on VIC
cannot support context isolation without hacks that we don't want to
implement, check the firmware binary to see if context isolation
should be enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Split into two callbacks
* Add NVDEC support
v4:
* Add locking in vic_load_firmware
* Return -EOPNOTSUPP if context isolation is not available
* Update for changed get_streamid_offset declaration
* Add comment noting that vic_load_firmware is safe to call
  without the hardware being powered on

Implement context isolation related callbacks in VIC, NVDEC
---
 drivers/gpu/drm/tegra/drm.h   |  8 +++++
 drivers/gpu/drm/tegra/nvdec.c |  9 +++++
 drivers/gpu/drm/tegra/vic.c   | 67 ++++++++++++++++++++++++++++++-----
 3 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 2acc8f2948ad..845e60f144c7 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -100,6 +100,14 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file);
 
+static inline int
+tegra_drm_get_streamid_offset_thi(struct tegra_drm_client *client, u32 *offset)
+{
+	*offset = 0x30;
+
+	return 0;
+}
+
 struct tegra_drm_client {
 	struct host1x_client base;
 	struct list_head list;
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 79e1e88203cf..f1210cfb3708 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -304,10 +304,19 @@ static void nvdec_close_channel(struct tegra_drm_context *context)
 	host1x_channel_put(context->channel);
 }
 
+static int nvdec_can_use_memory_ctx(struct tegra_drm_client *client, bool *supported)
+{
+	*supported = true;
+
+	return 0;
+}
+
 static const struct tegra_drm_client_ops nvdec_ops = {
 	.open_channel = nvdec_open_channel,
 	.close_channel = nvdec_close_channel,
 	.submit = tegra_drm_submit,
+	.get_streamid_offset = tegra_drm_get_streamid_offset_thi,
+	.can_use_memory_ctx = nvdec_can_use_memory_ctx,
 };
 
 #define NVIDIA_TEGRA_210_NVDEC_FIRMWARE "nvidia/tegra210/nvdec.bin"
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 1e342fa3d27b..2c0d554bd13c 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -38,6 +38,8 @@ struct vic {
 	struct clk *clk;
 	struct reset_control *rst;
 
+	bool can_use_context;
+
 	/* Platform configuration */
 	const struct vic_config *config;
 };
@@ -229,28 +231,38 @@ static int vic_load_firmware(struct vic *vic)
 {
 	struct host1x_client *client = &vic->client.base;
 	struct tegra_drm *tegra = vic->client.drm;
+	static DEFINE_MUTEX(lock);
+	u32 fce_bin_data_offset;
 	dma_addr_t iova;
 	size_t size;
 	void *virt;
 	int err;
 
-	if (vic->falcon.firmware.virt)
-		return 0;
+	mutex_lock(&lock);
+
+	if (vic->falcon.firmware.virt) {
+		err = 0;
+		goto unlock;
+	}
 
 	err = falcon_read_firmware(&vic->falcon, vic->config->firmware);
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	size = vic->falcon.firmware.size;
 
 	if (!client->group) {
 		virt = dma_alloc_coherent(vic->dev, size, &iova, GFP_KERNEL);
-		if (!virt)
-			return -ENOMEM;
+		if (!virt) {
+			err = -ENOMEM;
+			goto unlock;
+		}
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
-		if (IS_ERR(virt))
-			return PTR_ERR(virt);
+		if (IS_ERR(virt)) {
+			err = PTR_ERR(virt);
+			goto unlock;
+		}
 	}
 
 	vic->falcon.firmware.virt = virt;
@@ -277,7 +289,28 @@ static int vic_load_firmware(struct vic *vic)
 		vic->falcon.firmware.phys = phys;
 	}
 
-	return 0;
+	/*
+	 * Check if firmware is new enough to not require mapping firmware
+	 * to data buffer domains.
+	 */
+	fce_bin_data_offset = *(u32 *)(virt + VIC_UCODE_FCE_DATA_OFFSET);
+
+	if (!vic->config->supports_sid) {
+		vic->can_use_context = false;
+	} else if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 0xa5a5a5a5) {
+		/*
+		 * Firmware will access FCE through STREAMID0, so context
+		 * isolation cannot be used.
+		 */
+		vic->can_use_context = false;
+		dev_warn_once(vic->dev, "context isolation disabled due to old firmware\n");
+	} else {
+		vic->can_use_context = true;
+	}
+
+unlock:
+	mutex_unlock(&lock);
+	return err;
 
 cleanup:
 	if (!client->group)
@@ -285,6 +318,7 @@ static int vic_load_firmware(struct vic *vic)
 	else
 		tegra_drm_free(tegra, size, virt, iova);
 
+	mutex_unlock(&lock);
 	return err;
 }
 
@@ -358,10 +392,27 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	host1x_channel_put(context->channel);
 }
 
+static int vic_can_use_memory_ctx(struct tegra_drm_client *client, bool *supported)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	/* This doesn't access HW so it's safe to call without powering up. */
+	err = vic_load_firmware(vic);
+	if (err < 0)
+		return err;
+
+	*supported = vic->can_use_context;
+
+	return 0;
+}
+
 static const struct tegra_drm_client_ops vic_ops = {
 	.open_channel = vic_open_channel,
 	.close_channel = vic_close_channel,
 	.submit = tegra_drm_submit,
+	.get_streamid_offset = tegra_drm_get_streamid_offset_thi,
+	.can_use_memory_ctx = vic_can_use_memory_ctx,
 };
 
 #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
-- 
2.36.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
