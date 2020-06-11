Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E231F6649
	for <lists.iommu@lfdr.de>; Thu, 11 Jun 2020 13:10:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC569895E1;
	Thu, 11 Jun 2020 11:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKtja7OZRfHB; Thu, 11 Jun 2020 11:10:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D93BE895D7;
	Thu, 11 Jun 2020 11:10:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C80D2C016F;
	Thu, 11 Jun 2020 11:10:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A0B8C016F
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 11:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C68724BE6
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 11:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAf-hm-T5Llg for <iommu@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by silver.osuosl.org (Postfix) with ESMTP id 01716204AB
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 11:10:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,499,1583161200"; d="scan'208";a="49411148"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2020 20:10:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id EDC7042B6920;
 Thu, 11 Jun 2020 20:10:38 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org,
	robh+dt@kernel.org
Subject: [PATCH 0/2] iommu/renesas: Add support for r8a77961
Date: Thu, 11 Jun 2020 20:10:28 +0900
Message-Id: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

This patch series is based on next-20200611.

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a77961 support
  iommu/renesas: Add support for r8a77961

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
 drivers/iommu/ipmmu-vmsa.c                                      | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
