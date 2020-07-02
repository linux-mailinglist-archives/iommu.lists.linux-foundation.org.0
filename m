Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A668212016
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 11:37:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 40F8988E12;
	Thu,  2 Jul 2020 09:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoPx_gVm2CA5; Thu,  2 Jul 2020 09:37:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA0A388E22;
	Thu,  2 Jul 2020 09:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4BBDC0888;
	Thu,  2 Jul 2020 09:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9957BC0888
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 09:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 87F948B29B
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 09:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuojKZXXm7lB for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:37:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFFA08B289
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 09:37:27 +0000 (UTC)
X-UUID: d9cb19290049469cb5a4d6253553cdb7-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cHL3FGvns2Vq3Q+lzPqG/tPY0T/sEGYmRDbEd2Ph2NU=; 
 b=jCpd8f9KSqHTHBz+nHWc0cEaktfjIHJ/vfaVobp8cBqsurxP5NwPVPqYcUuU512nS88J2UZ+rKM9OZWWvq16OCH9+I/REqwl74Fou8RFMT6V+VKNVxhl64owiXokMF6MlnPJc4QVPjbRzahoVZedCDltdwCEB8k24WKUpSaNfug=;
X-UUID: d9cb19290049469cb5a4d6253553cdb7-20200702
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1698284110; Thu, 02 Jul 2020 17:37:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 17:37:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 17:37:20 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/4] dt-bindings: mediatek: add mediatek,infracfg phandle
Date: Thu, 2 Jul 2020 17:37:17 +0800
Message-ID: <20200702093721.6063-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 888036A33ECD69FCAC32F294B9ADA91343BDD3CA9220D418C65C109C141F4D452000:8
X-MTK: N
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Miles Chen <miles.chen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
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

Add a description for mediatek,infracfg. We can check if 4GB mode
is enable by reading it instead of checking the unexported
symbol "max_pfn".

This is a step towards building mtk_iommu as a kernel module.

Cc: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index ce59a505f5a4..a7881deabcca 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -74,6 +74,8 @@ Required properties:
 - mediatek,larbs : List of phandle to the local arbiters in the current Socs.
 	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
 	according to the local arbiter index, like larb0, larb1, larb2...
+- mediatek,infracfg: a phandle to infracfg. It is used to confirm if 4GB mode is set.
+	It is an optional property, add it when the SoC have 4g mode.
 - iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
 	Specifies the mtk_m4u_id as defined in
 	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
