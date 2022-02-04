Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212E4A998D
	for <lists.iommu@lfdr.de>; Fri,  4 Feb 2022 13:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4292E408B4;
	Fri,  4 Feb 2022 12:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mm1pIDRqVQJX; Fri,  4 Feb 2022 12:57:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BFEB2408B1;
	Fri,  4 Feb 2022 12:57:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B138C0039;
	Fri,  4 Feb 2022 12:57:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08CDFC000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 12:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5664404C3
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 12:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NlFd4YkDQcu for <iommu@lists.linux-foundation.org>;
 Fri,  4 Feb 2022 12:57:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6A554017E
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 12:57:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,342,1635174000"; d="scan'208";a="109494520"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 04 Feb 2022 21:57:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id F21784005E01;
 Fri,  4 Feb 2022 21:57:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org,
	will@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Date: Fri,  4 Feb 2022 21:56:51 +0900
Message-Id: <20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch series is based on renesas-drivers-2022-01-11-v5.16 [1].
Note that we have to prepare the following registers' setting
in a bootloader (U-Boot) because the registers are protected.
Otherwise, data mismatch happened if dmatest with the ipmmu is running.

 => mw eed01500 0xc0000000; mw eed41500 0xc0000000

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2022-01-11-v5.16

Changes from v1:
 - Add Reviewed-by tag in patch 1. (Geert-san, thanks!)
 - Revise a comment in patch 2.
 https://lore.kernel.org/all/20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
  iommu/ipmmu-vmsa: Add support for R-Car Gen4

 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml  |  4 ++++
 drivers/iommu/ipmmu-vmsa.c                             | 10 +++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
