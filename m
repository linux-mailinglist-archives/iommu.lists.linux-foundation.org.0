Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428A1308BA
	for <lists.iommu@lfdr.de>; Sun,  5 Jan 2020 16:27:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A1FC826D3;
	Sun,  5 Jan 2020 15:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7GcSKPPfWvM; Sun,  5 Jan 2020 15:27:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6253682125;
	Sun,  5 Jan 2020 15:27:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E075C18DD;
	Sun,  5 Jan 2020 15:27:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17006C077D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 16:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0589A86269
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 16:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2ZYyyG6tk3C for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 16:34:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8759C87804
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 16:34:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so42960745wrt.6
 for <iommu@lists.linux-foundation.org>; Fri, 03 Jan 2020 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuPXHvUieOmI5Quzb1wPB6cX8GScS9645pKcrDEMVR0=;
 b=AVBQvJs49csGx2cdaeh5gmzw6Urii3kTtSyLmvLNi8gpVnaPQrbqs0ZY45KCIz6EC/
 C7RTEpgo77kCamXGyms333DcRTTHK0t3d+FkSC7lRW6R2yAo1bU+VYVYQrh15JxLZjFJ
 MuToaslvZw7Jtf2t/LLiH67L5GSUT2SzX2v4oFRtpk8hx4kmcAbZD1tjzOYwWDFbsl/U
 gSzTD7KiTKWxXbY5zWGhMcZhVoTHrTagHR4uj58CrjbwmtXM5qH42ph2GDpaL1aGFo2A
 8zXyJlNuNISbDnnP4yeBhSHj5p0ap31ktsXFF4udaFwBhIzhi9C+ydlsrhVJuMispf9J
 iKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuPXHvUieOmI5Quzb1wPB6cX8GScS9645pKcrDEMVR0=;
 b=U0E8xVRMGZ2/9Z1yMQ6XdWdf9cs0vBZxQ/ad3SzM/mLU6a/LLKXfkfBuZ1ynAwhYce
 zwLTQBeHVctbyCKNOCozYZqj5O4S4XCodR+Ob8FRotn0oAu/SGIsnJTjoRtIVszH21ig
 tfOnw0TQnAZXvCf6R9DNv6lEWZTlffdFMJYpAo+QhWable/mLlrDNtwACwNcKkz3yZgI
 an3qAu9WqPFmNVRRMGH+vjH1yVmmUOWF1VSRuCoYBPo5EgBlsaf+A5WsIPPDOAuxCDM/
 6l1ELkIkQ39O8HvrH94Qbq3X5kO9JqE2sRZqzCVs4qAfd+eyn1rFxpdBMnT9c/KMLPNa
 0W3w==
X-Gm-Message-State: APjAAAV36T0VEp1ot7F1gMa0FWQ1jBePv8WWH+vcU9jm/1IAj/MG2m/Z
 4KcnkWO55QzKTqpYUorvnygHwHHfMZuJlw==
X-Google-Smtp-Source: APXvYqywRWOLXJTVexW1vEFrIxddF8NF9xPYtArFe6KifUVJASSItqf4NTiWw0Ldz6UjN1VmdQKlBQ==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr86888598wrm.278.1578068795065; 
 Fri, 03 Jan 2020 08:26:35 -0800 (PST)
Received: from radium.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x14sm12564234wmj.42.2020.01.03.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:26:34 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: iommu: Add binding for MediaTek MT8167 IOMMU
Date: Fri,  3 Jan 2020 17:26:31 +0100
Message-Id: <20200103162632.109553-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0.rc0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 Jan 2020 15:27:38 +0000
Cc: mark.rutland@arm.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 Fabien Parent <fparent@baylibre.com>
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
2.25.0.rc0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
