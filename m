Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E7247985
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 00:02:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFE6686B50;
	Mon, 17 Aug 2020 22:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODgEvUDyDXcE; Mon, 17 Aug 2020 22:02:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 724B986B68;
	Mon, 17 Aug 2020 22:02:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C173C0051;
	Mon, 17 Aug 2020 22:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0189DC0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F227B855CC
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kL9QqYuiiPCI for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 22:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9E57C85621
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:02:30 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f5so8218793plr.9
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 15:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
 b=fqbybyBm7z5qHp16UsUH3SOGLylsTrFEsZzyxPJ14MD4pMo7A7oyruGBH/RYNESpDA
 zA49RiuTo8tr6pJHCAdVih9UxTi3DW5cuEPgku2ES3eGQM9+EopWW2qEzLilMwVRxICy
 TsZaF4BKDnSK8sWv9FGM503OLhe6y7vNcuSG3QmOGzR53mxXirF10ITO95xIz1zT1FgE
 RNQ04aKBj+CF6bVv43LJCV355jCDhJWNKOEF6H06BGY2joiysSb4/1U/4ZoQoSabe7Fs
 mVT30wpWeQd5eQHVob+YO+vcbDHB2cE9Ubyfmw5GhvVpxYAq6VITYrXX7gqIuumaWq0a
 xf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
 b=Rc2TDCWFWKhBOeoe1Q2u9/5DiuWW2Hsuwv8Z8EhiuF2JytJIEiBHMxo3oWOUGPhL/P
 PKzUQbAiBVQV4aO5gOpsGcH+mE7/mbaP0ANRAZtUDaaDdt99doht997Nu33vTtUWNrko
 oycfKET43Gi0zR/O8sVv/bhaaxW6kePaw+sScI4mO9uwXrNHzM72kdxZoz6Q5izoFqD4
 tSNSmUzB2LXkbRPRCMsXR8JkJJQG3FIZGXbbc+JUsKKGn+udAsERKg8KpfhegFfUGbx+
 gBHTzAAI++ZhCXQVJV2xabSPJ+jCypmAm3oX19tycWc2LBMhWxP4njqPu1bPNSmDEODX
 +VMw==
X-Gm-Message-State: AOAM532F9OCTDJOgWGZu/JYHrqX1kMik/Pf+o7MxEogJSKlLgVGOk7QR
 68X+g8tHgTYgw+HguVP7eM8=
X-Google-Smtp-Source: ABdhPJzb87wot0OJq3pKRI1lcGXVEJD9eArYIfi7vaTspllxzoTevR0H/Rhizmew9avqzmLEP2cUHg==
X-Received: by 2002:a17:902:4b:: with SMTP id
 69mr13118700pla.245.1597701749719; 
 Mon, 17 Aug 2020 15:02:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r7sm21658693pfl.186.2020.08.17.15.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:02:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 05/20] iommu: add private interface for adreno-smmu
Date: Mon, 17 Aug 2020 15:01:30 -0700
Message-Id: <20200817220238.603465-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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

From: Rob Clark <robdclark@chromium.org>

This interface will be used for drm/msm to coordinate with the
qcom_adreno_smmu_impl to enable/disable TTBR0 translation.

Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
will directly switch TTBR0 pgtables (and do the necessary TLB inv)
synchronized to the GPU's operation.  But help from the SMMU driver
is needed to initially bootstrap TTBR0 translation, which cannot be
done from the GPU.

Since this is a very special case, a private interface is used to
avoid adding highly driver specific things to the public iommu
interface.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/linux/adreno-smmu-priv.h

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
new file mode 100644
index 000000000000..a889f28afb42
--- /dev/null
+++ b/include/linux/adreno-smmu-priv.h
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Google, Inc
+ */
+
+#ifndef __ADRENO_SMMU_PRIV_H
+#define __ADRENO_SMMU_PRIV_H
+
+#include <linux/io-pgtable.h>
+
+/**
+ * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
+ *
+ * @cookie:        An opque token provided by adreno-smmu and passed
+ *                 back into the callbacks
+ * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
+ * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
+ *                 NULL config disables TTBR0 translation, otherwise
+ *                 TTBR0 translation is enabled with the specified cfg
+ *
+ * The GPU driver (drm/msm) and adreno-smmu work together for controlling
+ * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
+ * updating the SMMU for context switches, while on the other hand we do
+ * not want to duplicate all of the initial setup logic from arm-smmu.
+ *
+ * This private interface is used for the two drivers to coordinate.  The
+ * cookie and callback functions are populated when the GPU driver attaches
+ * it's domain.
+ */
+struct adreno_smmu_priv {
+    const void *cookie;
+    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
+    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+};
+
+#endif /* __ADRENO_SMMU_PRIV_H */
\ No newline at end of file
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
