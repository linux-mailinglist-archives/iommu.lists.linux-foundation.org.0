Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE0408B29
	for <lists.iommu@lfdr.de>; Mon, 13 Sep 2021 14:40:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250E3402C1;
	Mon, 13 Sep 2021 12:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUzJLo7OtSdg; Mon, 13 Sep 2021 12:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 18B75400C3;
	Mon, 13 Sep 2021 12:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E723AC0022;
	Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 178CEC000D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0067D402A2
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f-r_tgvzsau for <iommu@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 12:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFCA9402A1
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC7E031B;
 Mon, 13 Sep 2021 05:40:11 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01E9C3F59C;
 Mon, 13 Sep 2021 05:40:10 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 0/2] iommu: DMA domain epilogue
Date: Mon, 13 Sep 2021 13:40:04 +0100
Message-Id: <cover.1631531973.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Hi Joerg,

As planned, here are the follow-up patches to resolve the merge of the
DART driver with the core changes. There's some argument for this being
5.15 fix material (the driver getting DMA cookies unconditionally is
still technically wrong), but in practice it shouldn't be an issue
either if you'd prefer to treat it as cleanup for 5.16. Your choice :)

Cheers,
Robin.


Robin Murphy (2):
  iommu/dart: Clean up IOVA cookie crumbs
  iommu/dma: Unexport IOVA cookie management

 drivers/iommu/apple-dart.c | 2 --
 drivers/iommu/dma-iommu.c  | 7 -------
 drivers/iommu/iommu.c      | 3 +--
 3 files changed, 1 insertion(+), 11 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
