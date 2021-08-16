Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33A3ED6D2
	for <lists.iommu@lfdr.de>; Mon, 16 Aug 2021 15:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CD6402E0;
	Mon, 16 Aug 2021 13:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyqyRN-yapXv; Mon, 16 Aug 2021 13:26:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 73FDD402A9;
	Mon, 16 Aug 2021 13:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA35C0022;
	Mon, 16 Aug 2021 13:26:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8546C000E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 13:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A2816077B
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 13:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPeHqmfUQVCX for <iommu@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 13:26:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0E4760784
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 13:26:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4B3A60EE0;
 Mon, 16 Aug 2021 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629120383;
 bh=nJlI5nsttxgiWcZmG7gDRDAOUwH3HLjZvAb35dPozVg=;
 h=From:To:Cc:Subject:Date:From;
 b=AQmLm1LoZ1gUij0NnLdcMeyWAc7Td4t533QxhJCPA2KyWC8TgyjVriDo8NCZSZN5S
 X3mgcUSmvudWkU0W3xHhnfhBfqKIqYeSKM3intDrqzxxZYIOL0sjqu/2OYKUVneQzK
 /AKisa99nD1tJejzCdfWFJC3X4PabPupp/p9se38AU1TOY5z6lr+gado7MztakUFAG
 v4ulrwVEI2mxsUAM4LZ5JYdNlrDEosUzrl131NRSi/+QlMiciW9KPiCHFS0ePcaFdM
 qRaBzGMC1EFmucTbA5c/6LmZ/uycj6RF94uOwJRWrnyYO7WR/VC6psQB8yXoDGhU4M
 /wHG9lcQFwn3g==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Don't fail device probing due to
 of_dma_set_restricted_buffer()
Date: Mon, 16 Aug 2021 14:26:15 +0100
Message-Id: <20210816132618.11707-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Claire Chang <tientzu@chromium.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
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

This is v2 of the patch I previously posted here:

  https://lore.kernel.org/r/20210805094736.902-1-will@kernel.org

Changes since v1 are:

  * Move of_dma_set_restricted_buffer() into of/device.c (Rob)
  * Use IS_ENABLED() instead of 'static inline' stub (Rob)

This applies on Konrad's devel/for-linus-5.15 branch in swiotlb.git

Cheers,

Will

Cc: Claire Chang <tientzu@chromium.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>

--->8

Will Deacon (2):
  of: Move of_dma_set_restricted_buffer() into device.c
  of: restricted dma: Don't fail device probe on rmem init failure

 drivers/of/address.c    | 33 ---------------------------------
 drivers/of/device.c     | 39 ++++++++++++++++++++++++++++++++++++++-
 drivers/of/of_private.h |  7 -------
 3 files changed, 38 insertions(+), 41 deletions(-)

-- 
2.33.0.rc1.237.g0d66db33f3-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
