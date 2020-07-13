Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC321A48D
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 18:19:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DABE87BED;
	Thu,  9 Jul 2020 16:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSW76EGywiAq; Thu,  9 Jul 2020 16:19:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CCFA87B82;
	Thu,  9 Jul 2020 16:19:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04FA9C016F;
	Thu,  9 Jul 2020 16:19:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6E38C016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 16:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D5B9B87B7B
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 16:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZ31O_KWt6NY for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 16:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7FACB879B5
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 16:19:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37A87AEB9;
 Thu,  9 Jul 2020 16:19:31 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: hch@lst.de, Robin Murphy <robin.murphy@arm.com>,
 David Rientjes <rientjes@google.com>, iommu@lists.linux-foundation.org
Subject: [PATCH 0/4] dma-pool: Fix atomic pool selection
Date: Thu,  9 Jul 2020 18:19:00 +0200
Message-Id: <20200709161903.26229-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-rpi-kernel@lists.infradead.org, jeremy.linton@arm.com,
 linux-kernel@vger.kernel.org
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

This is my attempt at fixing one of the regressions we've seen[1] after
the introduction of per-zone atomic pools.

This combined with "dma-pool: Do not allocate pool memory from CMA"[2]
should fix the boot issues on Jeremy's RPi4 setup.

[1] https://lkml.org/lkml/2020/7/2/974
[2] https://lkml.org/lkml/2020/7/8/1108

---

Nicolas Saenz Julienne (4):
  dma-direct: Provide function to check physical memory area validity
  dma-pool: Get rid of dma_in_atomic_pool()
  dma-pool: Introduce dma_guess_pool()
  dma-pool: Make sure atomic pool suits device

 include/linux/dma-direct.h |  1 +
 kernel/dma/direct.c        |  2 +-
 kernel/dma/pool.c          | 76 +++++++++++++++++++++++++++-----------
 3 files changed, 56 insertions(+), 23 deletions(-)

-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
