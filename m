Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B2BC2D8
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 09:41:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E18CBA4;
	Tue, 24 Sep 2019 07:41:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3FDCDAF5
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 07:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A8DF08B0
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 07:41:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; d="scan'208";a="27336957"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2019 16:41:07 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 880A341ECAD3;
	Tue, 24 Sep 2019 16:41:05 +0900 (JST)
From: Biju Das <biju.das@bp.renesas.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Add r8a774b1 support
Date: Tue, 24 Sep 2019 08:40:54 +0100
Message-Id: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
	devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
	iommu@lists.linux-foundation.org, Simon Horman <horms@verge.net.au>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Document RZ/G2N (R8A774B1) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
index b6bfbec..020d6f2 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
@@ -15,6 +15,7 @@ Required Properties:
     - "renesas,ipmmu-r8a7744" for the R8A7744 (RZ/G1N) IPMMU.
     - "renesas,ipmmu-r8a7745" for the R8A7745 (RZ/G1E) IPMMU.
     - "renesas,ipmmu-r8a774a1" for the R8A774A1 (RZ/G2M) IPMMU.
+    - "renesas,ipmmu-r8a774b1" for the R8A774B1 (RZ/G2N) IPMMU.
     - "renesas,ipmmu-r8a774c0" for the R8A774C0 (RZ/G2E) IPMMU.
     - "renesas,ipmmu-r8a7790" for the R8A7790 (R-Car H2) IPMMU.
     - "renesas,ipmmu-r8a7791" for the R8A7791 (R-Car M2-W) IPMMU.
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
