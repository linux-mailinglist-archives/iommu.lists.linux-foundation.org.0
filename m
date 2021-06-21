Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF73AEAA3
	for <lists.iommu@lfdr.de>; Mon, 21 Jun 2021 15:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAA7A606A9;
	Mon, 21 Jun 2021 13:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqDwSBCBnkL1; Mon, 21 Jun 2021 13:58:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0E8336062D;
	Mon, 21 Jun 2021 13:58:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFB40C000C;
	Mon, 21 Jun 2021 13:58:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF97DC000C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 13:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A948B60656
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 13:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbQQhLR3s8Xz for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 13:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED1786062D
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 13:58:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j2so9250859wrs.12
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+p+TgaX+cjsRrYhlo9eaS/AjH4uGF+T77t1kVIwioV4=;
 b=roxCxTrOd1dMyX2YglDM1HLLJlkqVEAsORboDhYP7ZG2hVfdrF4hXki5Z6POpADPBj
 JzWPF4yJfiRN/M+mD1QGQDd1KBwrtn/Me6Wc4mVoXfWabSKnKN7aerPqgjA9dlck2ncz
 EQ+KN7fETCutCbEIqD94mXexNyZYZPDh/1XIHYBSa/46v3JdQF7A+Lx9E8vVF2Gnj+NC
 yFglcytXNA3dKUYeeYqO6hsYShyRAa8NT9XTUVYRKgUTuPD21Wr6kGdPsfMpJE0Z1Hbs
 5jcnRkxSl6iyCd7iO+n2d5poim23DBmiqhCjXtHM1mhK67zBFnsKXdjDT/vSRro2iZAD
 gbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+p+TgaX+cjsRrYhlo9eaS/AjH4uGF+T77t1kVIwioV4=;
 b=pI5TYL4bDc3LmC4KfQML5ZMTngTWuED2Ewj8VefwOuHWG7mgRkA/hACHirH7EVMFV7
 mwYXmEgWAZ+c8v/9yr7vTX3DEhVKPubti09U7zmv9YIiwu4oDUPS+sW1tixCJpjiJL2M
 OhXH4E2DQTbKX8oPZbrCwjjwy+7iYMjzBklaO5hSfdVBtenNKclnB0oWJg8jEule1ADi
 3uvLq4VVOG8WygV9MLs7qwyiQ4/WtNBSQ3WCTo0tJYBeCPCqn6tUivGjEwQ+9QlkyEkJ
 iHIf2MJKUw5D3mYfRgq/jIjeh5zIorZ9LlNl9DjP6/CR/dP4cJVpU6TzbwDznSP/Nh79
 UtfA==
X-Gm-Message-State: AOAM5332niW7mmDmS4JFuf7LqIMJdc3/I2NK+YemqetYdjYB4oX+I/1/
 NmwezznHaiS5IEtuTL9gypo=
X-Google-Smtp-Source: ABdhPJzwO7wl+RPE7Nx+g9DxMIPsQupg3909rly3rdMjuD1D6FHkghJiDZYzX5lLka8Wa0nqYY5Y6g==
X-Received: by 2002:a5d:5402:: with SMTP id g2mr27795226wrv.226.1624283924261; 
 Mon, 21 Jun 2021 06:58:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c13sm18261292wrb.5.2021.06.21.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:58:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] dt-bindings: arm-smmu: Fix json-schema syntax
Date: Mon, 21 Jun 2021 16:00:36 +0200
Message-Id: <20210621140036.2879563-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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

From: Thierry Reding <treding@nvidia.com>

Commit 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible
string") introduced a jsonschema syntax error as a result of a rebase
gone wrong. Fix it.

Fixes: 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible string")
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 1181b590db71..03f2b2d4db30 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -52,16 +52,14 @@ properties:
         items:
           - const: marvell,ap806-smmu-500
           - const: arm,mmu-500
-      - description: NVIDIA SoCs that program two ARM MMU-500s identically
-        items:
       - description: NVIDIA SoCs that require memory controller interaction
           and may program multiple ARM MMU-500s identically with the memory
           controller interleaving translations between multiple instances
           for improved performance.
         items:
           - enum:
-              - const: nvidia,tegra194-smmu
-              - const: nvidia,tegra186-smmu
+              - nvidia,tegra194-smmu
+              - nvidia,tegra186-smmu
           - const: nvidia,smmu-500
       - items:
           - const: arm,mmu-500
-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
