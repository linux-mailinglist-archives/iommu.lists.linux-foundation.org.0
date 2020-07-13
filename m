Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC921E2A9
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 23:54:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9069C2736E;
	Mon, 13 Jul 2020 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLIYDSxalpnu; Mon, 13 Jul 2020 21:54:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 738F325B92;
	Mon, 13 Jul 2020 21:54:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53433C0733;
	Mon, 13 Jul 2020 21:54:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6986BC0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 525788A0F1
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtngBaD1c2OP for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 21:40:30 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id D8AF98A11A
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:40:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,348,1589209200"; d="scan'208";a="51803346"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Jul 2020 06:35:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8094940F7FC8;
 Tue, 14 Jul 2020 06:35:22 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Joerg Roedel <joro@8bytes.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 0/9] R8A774E1 SoC enable support for IPMMU, DMAC, GPIO and AVB
Date: Mon, 13 Jul 2020 22:35:11 +0100
Message-Id: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 13 Jul 2020 21:53:59 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Prabhakar <prabhakar.csengg@gmail.com>,
 dmaengine@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi All,

This patch series adds device nodes for IPMMU, DMAC, GPIO
and AVB nodes for RZ/G2H (R8A774E1) SoC.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: iommu: renesas,ipmmu-vmsa: Add r8a774e1 support
  dt-bindings: dma: renesas,rcar-dmac: Document R8A774E1 bindings
  dt-bindings: gpio: renesas,rcar-gpio: Add r8a774e1 support

Marian-Cristian Rotariu (6):
  iommu/ipmmu-vmsa: Hook up R8A774E1 DT matching code
  arm64: dts: renesas: r8a774e1: Add IPMMU device nodes
  arm64: dts: renesas: r8a774e1: Add SYS-DMAC device nodes
  arm64: dts: renesas: r8a774e1: Add GPIO device nodes
  dt-bindings: net: renesas,ravb: Add support for r8a774e1 SoC
  arm64: dts: renesas: r8a774e1: Add Ethernet AVB node

 .../bindings/dma/renesas,rcar-dmac.yaml       |   1 +
 .../bindings/gpio/renesas,rcar-gpio.yaml      |   1 +
 .../bindings/iommu/renesas,ipmmu-vmsa.yaml    |   1 +
 .../devicetree/bindings/net/renesas,ravb.txt  |   1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 361 +++++++++++++++++-
 drivers/iommu/ipmmu-vmsa.c                    |   4 +
 6 files changed, 350 insertions(+), 19 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
