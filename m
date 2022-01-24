Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAA498500
	for <lists.iommu@lfdr.de>; Mon, 24 Jan 2022 17:40:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AC0C40917;
	Mon, 24 Jan 2022 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4912m6rYuYok; Mon, 24 Jan 2022 16:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87535405EF;
	Mon, 24 Jan 2022 16:40:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A48BC007A;
	Mon, 24 Jan 2022 16:40:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8A82C002F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9752241736
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uu184ugJx-kM for <iommu@lists.linux-foundation.org>;
 Mon, 24 Jan 2022 16:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F604167D
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 16:40:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37C3CD6E;
 Mon, 24 Jan 2022 08:40:23 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 489923F793;
 Mon, 24 Jan 2022 08:40:22 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	konrad@kernel.org
Subject: [PATCH 0/3] Some minor SWIOTLB cleanups
Date: Mon, 24 Jan 2022 16:40:16 +0000
Message-Id: <cover.1643028164.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: tientzu@chromium.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, guozhengkui@vivo.com
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

Here's a little collection of cleanup patches for some annoyances
that have built up while looking at SWIOTLB code recently.

Cheers,
Robin.


Robin Murphy (3):
  swiotlb: Simplify debugfs setup
  swiotlb: Tidy up includes
  swiotlb: Simplify array allocation

 kernel/dma/swiotlb.c | 74 ++++++++++++++------------------------------
 1 file changed, 24 insertions(+), 50 deletions(-)

-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
