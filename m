Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6C17596B
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 12:22:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ECB692012F;
	Mon,  2 Mar 2020 11:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISEQFID4o+Vs; Mon,  2 Mar 2020 11:22:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5F9262043B;
	Mon,  2 Mar 2020 11:22:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 487A3C013E;
	Mon,  2 Mar 2020 11:22:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC30BC013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 11:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CB347850EA
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 11:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8N13jKkF43g for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:22:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 61510850E1
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 11:22:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so3326569wro.9
 for <iommu@lists.linux-foundation.org>; Mon, 02 Mar 2020 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
 b=NPzYl0+Cj9Bodz62CFuc/7zeYsqpkh13Et0PpWoBeAy0TS2FC5OplEhDkxAYsc7Uvp
 GkkjKKcMZX9GWQNuJ5iT4Dq6TigXqR+mvYZZJpZyWpiCVEjb9PJ9fvCRFFGTnOQ4LZkO
 YzxSjml2OP392/Scf5dO8G7l4Kmh5NyMy/neFvB5mwjAoWkrkHhTs/jdvRjF9gs4KE8M
 kyZFxBfe6c7nR6gxQNu1/BoVNv9QgAajUc8QZpwFJUc4A11WKRDG7YBLYwsOMd2im58i
 CO7l/S5+9YSI9y0Ts7mQtTlB+k0k2jRGaGJRBOLGJ/oGOpWl2+2d566XLfXw+zwRHKS3
 jmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
 b=Fx6smdu/6pkf6+FBOBmJ2TgkOXb9qf+hGhAJ9PWie4OwgYBqQcdZ17+RttnmOPYFMK
 u1E5FrBlGEBAQYTEzvGD1XVwME3oJgOPNMllRXgpKUHvM4KFv348KE4QaHqJUDqOAY4H
 qyfLk/0RacGr6Ooc+IWbVK4EEewOw9dwR7DpTu6NiWLTjRxumuo85ZnWQkLbZquRL+zU
 SZRMfiPNa771gy4+qQfEJdwwnaQzZnvWMniutAFTcL0bnfefbItF6msyd0T52wDLLbh7
 jM+6+sNHbrHjc9HD/ErMfVePKIasIiP4u7fqxpUjznEOF/xI7XPfZ1i8MbT5FX54RiUa
 KPhw==
X-Gm-Message-State: APjAAAWdcFUvosbj+fb74Qh+3BxvxTV6dkosZ14+yY8uNOKQ8hpXYtyM
 P/UfaoFiRhs8FDamnE0yv07F5Q==
X-Google-Smtp-Source: APXvYqyZlRonNGPN6OZje8r6g98mgNwbkojbpYskc2y6mkeqC9MkKpFwp4Ipsn5QsmRq8gTVXPpHag==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr21397636wrn.209.1583148120855; 
 Mon, 02 Mar 2020 03:22:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:6f5c:582a:cc84:32f5])
 by smtp.gmail.com with ESMTPSA id j14sm28398441wrn.32.2020.03.02.03.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 03:22:00 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/3] dt-bindings: iommu: Add binding for MediaTek MT8167
 IOMMU
Date: Mon,  2 Mar 2020 12:21:50 +0100
Message-Id: <20200302112152.2887131-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 ck.hu@mediatek.com, matthias.bgg@gmail.com
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

This commit adds IOMMU binding documentation for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V2: no change

---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index ce59a505f5a4..eee9116cf9bb 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -60,6 +60,7 @@ Required properties:
 	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
 	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
 						     generation one m4u HW.
+	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
 	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
 	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
 - reg : m4u register base and size.
-- 
2.25.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
