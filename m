Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 094362A3C13
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 06:42:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B2F12050C;
	Tue,  3 Nov 2020 05:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKhtQGgJM7Wa; Tue,  3 Nov 2020 05:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5312920507;
	Tue,  3 Nov 2020 05:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 328D1C0051;
	Tue,  3 Nov 2020 05:42:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCC3FC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 05:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC0A485F7B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 05:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9nQWi4123jo for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 05:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 757EF85F77
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 05:42:24 +0000 (UTC)
X-UUID: 6b5ec04e2eab43fbbcdebd85e2586f00-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WW0Lmah8IaQQ9ZgPn79i+P0KVknepuLmC9kWTei51Yc=; 
 b=unRobiCxA4U4giVNtijjXCMLrUTDa3+b0GCFyEwfpDFKq2y6nQHdqbIsvB4jvilQXHdBbVAt9Jb/6/3Mqlmman5GIkh47fdm/bsOkHOs514Ddhtw1j12NfZ/eOS+GaihhfQ/BVYshDEV0z98xhI+bO6+uxG23GDNGDL+Re7dEUA=;
X-UUID: 6b5ec04e2eab43fbbcdebd85e2586f00-20201103
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1631611038; Tue, 03 Nov 2020 13:42:20 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 13:42:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 13:42:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/3] MT8192 SMI support
Date: Tue, 3 Nov 2020 13:41:57 +0800
Message-ID: <20201103054200.21386-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF9423204EAF833543A28E9D29A571C12114AD1C3BD3F5EA68511EA5BB10A7BA2000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

This patchset mainly adds SMI support for mt8192.

It comes from the patchset[1]. I seperate the smi part into this patchset.
And the two part(IOMMU/SMI) patchset don't depend on each other.

Rebase on v5.10-rc1.

changenote:
 v5: Fix complain from yamllint.

 v4: https://lore.kernel.org/linux-mediatek/20201030091254.26382-1-yong.wu@mediatek.com/T/#meb03b3f4018894bf40c47fece52fe9b386409934 
    add if-then segment in the binding.

 v3: [1]

[1] https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/


Yong Wu (3):
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add mt8192 support
  memory: mtk-smi: Add mt8192 support

 .../mediatek,smi-common.txt                   |  50 ------
 .../mediatek,smi-common.yaml                  | 142 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  50 ------
 .../memory-controllers/mediatek,smi-larb.yaml | 132 ++++++++++++++++
 drivers/memory/mtk-smi.c                      |  19 +++
 5 files changed, 293 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml

-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
