Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786B2A00E6
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 10:13:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00A5B860CD;
	Fri, 30 Oct 2020 09:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pn8ko6dcSGTQ; Fri, 30 Oct 2020 09:13:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8953B85F8C;
	Fri, 30 Oct 2020 09:13:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F721C0051;
	Fri, 30 Oct 2020 09:13:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 233FFC0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 08F99860CD
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riUQTHR4ZGAr for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B14AF85F8C
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:23 +0000 (UTC)
X-UUID: 7b9274f5c31a45df890ed48599eff29c-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZpW9Nn3WTF72bsEP3pngt8VigIg6cPhwRlY9GBZBlXw=; 
 b=AIhW2Yc+ZpjSEsx+sO3xpFJxvt4v+rmpQ7J+QEkGU32WywXPCARvCiCQRRBH1/ah0s7QAcU3lMWW1Vh6pGa32JXhNnFfX5j4dJRZXO9pyI7kcJ8x3yd0fUR3Q/h+Y0NNbtfE+tPiHm6mGdvQT8Yj2+3XDgwZfCng/GAcZMGFQnM=;
X-UUID: 7b9274f5c31a45df890ed48599eff29c-20201030
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 35128789; Fri, 30 Oct 2020 17:13:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 17:13:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 17:13:12 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/3] MT8192 SMI support
Date: Fri, 30 Oct 2020 17:12:51 +0800
Message-ID: <20201030091254.26382-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C519A5FD6F45B54AFFDD85386FD1928BE0CBF7344F9190F98C31982F514EB482000:8
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
 v4: add if-then segment in the binding.

 v3: [1].

[1] https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/

Yong Wu (3):
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add mt8192 support
  memory: mtk-smi: Add mt8192 support

 .../mediatek,smi-common.txt                   |  50 ------
 .../mediatek,smi-common.yaml                  | 142 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  50 ------
 .../memory-controllers/mediatek,smi-larb.yaml | 131 ++++++++++++++++
 drivers/memory/mtk-smi.c                      |  19 +++
 5 files changed, 292 insertions(+), 100 deletions(-)
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
