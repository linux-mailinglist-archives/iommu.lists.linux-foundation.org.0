Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF72743F4
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 16:17:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E75CF8670E;
	Tue, 22 Sep 2020 14:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1ViIboOjbdI; Tue, 22 Sep 2020 14:16:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27D848670C;
	Tue, 22 Sep 2020 14:16:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09C36C0893;
	Tue, 22 Sep 2020 14:16:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD56C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E5D40866E9
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJ-aBjQ7EklG for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 14:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id A70E7866E3
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:16:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7377101E;
 Tue, 22 Sep 2020 07:16:55 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F8BC3F718;
 Tue, 22 Sep 2020 07:16:54 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
Subject: [PATCH v2 0/3] drm: panfrost: Coherency support
Date: Tue, 22 Sep 2020 15:16:47 +0100
Message-Id: <cover.1600780574.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

Hi all,

Here's a quick v2 with the tags so far picked up and some inline
commentary about the shareability domains for the pagetable code.

Robin.


Robin Murphy (3):
  iommu/io-pgtable-arm: Support coherency for Mali LPAE
  drm/panfrost: Support cache-coherent integrations
  arm64: dts: meson: Describe G12b GPU as coherent

 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi |  4 ++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c     |  1 +
 drivers/iommu/io-pgtable-arm.c              | 11 ++++++++++-
 6 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
