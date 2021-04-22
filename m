Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 11383368242
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 16:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C7C083E25;
	Thu, 22 Apr 2021 14:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUvFSaUsrGQX; Thu, 22 Apr 2021 14:16:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF4B83E20;
	Thu, 22 Apr 2021 14:16:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2D3C000B;
	Thu, 22 Apr 2021 14:16:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C874C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D4EE83E22
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57Q9Rs1lNTh3 for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 14:16:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B232883E20
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: benjamin.gaignard)
 with ESMTPSA id 4BC1C1F4323A
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 xxm@rock-chips.com
Subject: [PATCH v2 0/4] Add driver for rk356x
Date: Thu, 22 Apr 2021 16:15:58 +0200
Message-Id: <20210422141602.350746-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, kernel@collabora.com,
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

This series adds the IOMMU driver for rk356x SoC.
Since a new compatible is needed to distinguish this second version of 
IOMMU hardware block from the first one, it is an opportunity to convert
the binding to DT schema.

version 2:
 - Fix iommu-cells typo in rk322x.dtsi
 - Change maintainer
 - Change reg maxItems
 - Add power-domains property

Benjamin Gaignard (3):
  dt-bindings: iommu: rockchip: Convert IOMMU to DT schema
  dt-bindings: iommu: rockchip: Add compatible for v2
  ARM: dts: rockchip: rk322x: Fix iommu-cells properties name

Simon Xue (1):
  iommu: rockchip: Add support iommu v2

 .../bindings/iommu/rockchip,iommu.txt         |  38 --
 .../bindings/iommu/rockchip,iommu.yaml        |  84 ++++
 arch/arm/boot/dts/rk322x.dtsi                 |   6 +-
 drivers/iommu/rockchip-iommu.c                | 422 +++++++++++++++++-
 4 files changed, 493 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
