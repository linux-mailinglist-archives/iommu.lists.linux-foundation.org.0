Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8D494056
	for <lists.iommu@lfdr.de>; Wed, 19 Jan 2022 20:06:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3440C80F59;
	Wed, 19 Jan 2022 19:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKMXusX3qQ4J; Wed, 19 Jan 2022 19:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F9BA80CDE;
	Wed, 19 Jan 2022 19:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A49AC007A;
	Wed, 19 Jan 2022 19:06:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 558E9C002F;
 Wed, 19 Jan 2022 19:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF1B4159B;
 Wed, 19 Jan 2022 19:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sent.com header.b="iI0Xifsc";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="ln/IExRu"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qN7NyKu1CYKE; Wed, 19 Jan 2022 19:06:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E59741594;
 Wed, 19 Jan 2022 19:06:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B986580730;
 Wed, 19 Jan 2022 14:06:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 19 Jan 2022 14:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=VbnqumJAL4r7o
 PXU1B7/2AqlEeyilMgkB8Z6AdGXQWo=; b=iI0XifscyxRyNU2nNcg0p2IMkEy3e
 1EuyVZfwKTLv+XEo9nCFdk0H5mkwD7i7Aq+gayhI/BlCO24BAgXF5jaHx3S3FQRE
 rxdrdZsc12FBtiE2Dpar0r6YxrhJU+WU6hTXLnsZjClhQ8cTTWFKKq7ea+N9rq6T
 Xh7uK0moTsH4LK4/jK0QbDVdODFQa1o+99M/gn46XI67hUpfY65bcPCyJHv6PHF/
 bGcAwer4Ms9MbJmV2ET/Tw3v54jfWJgP92rHXTF0kbhZEMuiK8LZWVccwfOF9NRx
 Y8wYL2JPLD1mXMtkWQCf9fE74qq7bnrnrOC3VPh40ulPoeJZs3qjZc/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VbnqumJAL4r7oPXU1B7/2AqlEeyilMgkB8Z6AdGXQWo=; b=ln/IExRu
 IX3Ngu9Srz6FhkcAULotpPuKNYZGxiHzOvW3borqnE/QzdlHZ9Z7R/ZXOULt5zd7
 XgZdpUUIVFX2rj1W7OkdqrhQa5/SfoU/EZFTMye5P5+TmSbriwaBHVWc7xXT8Bd7
 9rbQ4Q0A+UecyD0TADRV1zaCKmgjNeWOE0EuXw9widzTi6YryjkGqp11INm1zwzk
 CvdrBNAUGz0bxozLyW5o9FMi//QVU3lBQAUCFoUQvB4xWcxrHjUzHmn1hmFreVpN
 V7dPt938YbZA1XI5W/flHNeegA98GnbKMOpTdQw5i4iUI92GTwy0mrqC6jT77Gv/
 KSZUvGlhcve8Wg==
X-ME-Sender: <xms:QGHoYbtp_B1wdpMo5t2l9oE7stqZFzq20lCeQ4uCxBMgaZV1F2c9MA>
 <xme:QGHoYcci0XXibWIkEosG1VlR9Rvx_MHnWSEf1IBPA2w39EMp3Ho4N5nk0VBIMoW6u
 1-fMcFG49YaHimOSg>
X-ME-Received: <xmr:QGHoYezwHqjwC8A7_YI1pFVJYTWHfhXWYwjdXWq7D1l2WsX7CQUGIUK_Mt8WTAHKp8M2cak1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:QGHoYaMIFGiyyNjgwRGKm380P0rbj2Frq10NmQVKCCjaPPhbW2Flpw>
 <xmx:QGHoYb_j0dzi9YXmkoNqMy_hu9Ge4gKGK02fSjLO7eZTdA8DYz4a_Q>
 <xmx:QGHoYaUu9q5u7A5e7HgnMDS97TVHUVwdqePaaQYgyTAa3wtxSiJAUg>
 <xmx:QGHoYeUrjpbHQ0fZM8NhK9zLdS_e2FUfjnVkcUw25okDdKH3fWbFAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 14:06:39 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v4 6/7] drivers: virtio_mem: use pageblock size as the minimum
 virtio_mem size.
Date: Wed, 19 Jan 2022 14:06:22 -0500
Message-Id: <20220119190623.1029355-7-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119190623.1029355-1-zi.yan@sent.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
MIME-Version: 1.0
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
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
Reply-To: Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Zi Yan <ziy@nvidia.com>

alloc_contig_range() now only needs to be aligned to pageblock_order,
drop virtio_mem size requirement that it needs to be the max of
pageblock_order and MAX_ORDER.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index a6a78685cfbe..eafba2119ae3 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2476,13 +2476,12 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
 
 	/*
-	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
-	 * pageblock_nr_pages pages. This:
+	 * We want subblocks to span at least pageblock_nr_pages pages.
+	 * This:
 	 * - Is required for now for alloc_contig_range() to work reliably -
 	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
 	 */
-	sb_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
-			pageblock_nr_pages) * PAGE_SIZE;
+	sb_size = pageblock_nr_pages * PAGE_SIZE;
 	sb_size = max_t(uint64_t, vm->device_block_size, sb_size);
 
 	if (sb_size < memory_block_size_bytes() && !force_bbm) {
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
