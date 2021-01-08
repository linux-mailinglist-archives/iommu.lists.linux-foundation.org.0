Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CF2EF176
	for <lists.iommu@lfdr.de>; Fri,  8 Jan 2021 12:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B4FB8752F;
	Fri,  8 Jan 2021 11:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tC5jV-H3ODjI; Fri,  8 Jan 2021 11:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF7A9875A0;
	Fri,  8 Jan 2021 11:39:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDCD4C088B;
	Fri,  8 Jan 2021 11:39:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71EC1C013A
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 11:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 619F386D47
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 11:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPzAq5O2l7+j for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 11:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8A6B386715
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 11:39:25 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i7so7509926pgc.8
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jan 2021 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AG3QUss2Mw2LHvaADYDsO3W7gD6GpMHwEvXoc/WIGa8=;
 b=RG9EPVAGY8kQ+HP8A5vbzyQOVa8/2zlPM5vKCn8PVY8IsqDB6bF9YXeUBVWQDJ/oao
 /IyLuXuemocKHPLS5yJ7NwrKAKqmVMXgesgt3oAYxlcg0YTyXDAM0W2K8YsAQ05a41GA
 HyZSNBZQxTKrBVWA++JxdAIxp28kUk5vtuTO/OEHrCx+xQbbfagivRT9uS63NnpPHoPv
 OjLQCnxWt6e1upM3QMi1ZGbXG3g3BB9kplrzr7GXsAeQJAimTug7+FqjStwPJqT0jigF
 UnlGBGQrdf1Knqdg90nMBSXMcgq5BBrwcmk2twBGUu5+Is0/jZHYnlisLNKqW2WdwebZ
 CGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG3QUss2Mw2LHvaADYDsO3W7gD6GpMHwEvXoc/WIGa8=;
 b=RfZyv0Ba2ETjj9OYWe8jijwHYkGTB3Z74zhYB8UM3EFe+gg/7TM2d47sCsh+o6a5Ke
 N7sJZNGXuGEZNY9J2aoq9NYcvmE1C+2LnKZZqMjt496LW6T35Fu0W7BF2ePdm1gVuPjI
 SXdJAbxIlUZ7cvRNvnG7cehTwCicHGemns8QluATVbGkHnuiEpnw5UoXIWU6+qDa4cAQ
 bJJwwQC2n2hUulpPnSGbg1Ljvb5Xti2pumNY1lGiRtJOmw8EbORI1SBTtEYzGdxtZXbP
 UPpLl/Mm9k5gnNB87CQMHM3jXlYGeflFoXUHKOW3NCCjjyOHtVMYvz5LJt6yqzDhbzTS
 fQ9Q==
X-Gm-Message-State: AOAM5308dZjDxkbiUrEvIZ5TB0vS5+XgrQCt6YTYIuKdA/pnLsg/rhbB
 1LJhBtg+2ZyZmw46DpzYZCI=
X-Google-Smtp-Source: ABdhPJw5IbfLiabVtdNH6drZOTeV31Atl25pgHRRcLuVyayr43zK8MJf683ZQ/PR0M7IdYTKFkx7Ug==
X-Received: by 2002:a63:d903:: with SMTP id r3mr6557255pgg.445.1610105965095; 
 Fri, 08 Jan 2021 03:39:25 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id gm18sm4589136pjb.55.2021.01.08.03.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 03:39:24 -0800 (PST)
From: Chunyan Zhang <zhang.lyra@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH V2 1/2] dt-bindings: iommu: add bindings for sprd iommu
Date: Fri,  8 Jan 2021 19:38:50 +0800
Message-Id: <20210108113851.354947-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108113851.354947-1-zhang.lyra@gmail.com>
References: <20210108113851.354947-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Sheng Xu <sheng.xu@unisoc.com>, iommu@lists.linux-foundation.org,
 Kevin Tang <kevin.tang@unisoc.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>
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

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

This patch only adds bindings to support display iommu.

The iommu support for others would be added once finished tests with those
devices, such as Image codec(jpeg) processor, a few signal processors,
including VSP(video), GSP(graphic), ISP(image), and camera CPP, etc.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 .../devicetree/bindings/iommu/sprd,iommu.yaml | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/sprd,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml b/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml
new file mode 100644
index 000000000000..4d9a578a7cc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/sprd,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc IOMMU and Multi-media MMU
+
+maintainers:
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sprd,iommu-disp
+
+  reg:
+    maxItems: 1
+
+  "#iommu-cells":
+    const: 0
+    description:
+      Unisoc IOMMUs are all single-master IOMMU devices, therefore no
+      additional information needs to associate with its master device.
+      Please refer to the generic bindings document for more details,
+      Documentation/devicetree/bindings/iommu/iommu.txt
+
+required:
+  - compatible
+  - reg
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu_disp: iommu@63000000 {
+      compatible = "sprd,iommu-disp";
+      reg = <0x63000000 0x880>;
+      #iommu-cells = <0>;
+    };
+
+...
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
