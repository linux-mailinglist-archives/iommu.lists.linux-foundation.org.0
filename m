Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF114E3D6
	for <lists.iommu@lfdr.de>; Thu, 30 Jan 2020 21:22:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DB5B6203B4;
	Thu, 30 Jan 2020 20:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC3KlIEanfPF; Thu, 30 Jan 2020 20:22:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 371C720346;
	Thu, 30 Jan 2020 20:22:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AC70C0171;
	Thu, 30 Jan 2020 20:22:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13B3C0171
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jan 2020 20:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A9D3D203B4
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jan 2020 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fB0Cpi5ph2B for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 20:22:02 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.7.6
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by silver.osuosl.org (Postfix) with ESMTPS id E714E20346
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jan 2020 20:22:02 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id n17so2388588plp.10
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jan 2020 12:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=HlKKpg7ZjV76vxI7Xx+EGX2+XDB/ZbEOE3aGV0uGAJU=;
 b=MuK6rw1VKmjDpcW2hCj5zPecHj6a5aFQBY42EcDk57gI1XAAXXRAeigAiwxbLP3cwz
 LbG+wZY5IsfR3HtFLnrn+J4/rwn/EbyC+BAhYVSIoSSYy0pgSfz5jIHB7rAJBVqg5Jo9
 +TByoBb3f67w1zmv8yTClg8y4aoR57s4olqCfJEFLQLhPud6H8/7PA68h9t1BMXIJNkY
 8tPInZ+oIakFYO5ELYhP7ciUcCT0laZ4bnjzRkFujaRHlCrP1NwXDx/44dvKHi3qrCc/
 tFzzL2ICult0UdUNEHY3LpmUrTTGpkfx+ihcvskc/G96CyZHZZEjoQzBsAql36fMHxZG
 uIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=HlKKpg7ZjV76vxI7Xx+EGX2+XDB/ZbEOE3aGV0uGAJU=;
 b=PNsFksnhjrylo+EpBDV+NcR/fu+vuQtp3fa+i11QhCqRx0kYxDJjqFydIvDm3DCwjA
 XQLdgo0v1KkZ5nnIGiRJE3FUsBkaVrgx+KuoWAzUvni8kma4VoNavJXmpoBVHgFjhfVb
 Wnyeb3Vt9Bk/aMsvttgn6x0YVfxI6rALSqebW3vkM/KE9jvBDUVItet8Lli8GV/BCs9+
 nQJ93JmJCv0zJ2reKbIAPrdJZjBcymHYjQnNnyZXHrdaCsTjuDEXi71rP7Jy67CwDJKq
 pMIszZ8ohXILIIkl0qrOFrlH8Wh7y0zOilQURcxGRiQEqvRL1z5dWDJFYCkocyDEdITM
 1YRQ==
X-Gm-Message-State: APjAAAUsn62tGIOiEUXxBDN/hWf6mS5OigJop1xNOQzC1L6GpvmHAJTA
 KDMN36XlksgjK8CBUUOJq+2zGGzNMAek8g==
X-Google-Smtp-Source: APXvYqzJwvvP+Ib7mJZPmx/9cOuT+l71pmKBvK0yw337IHvGg20CL49auvi6pJEF5Bu1ekXqm5rIlhelsNpWtg==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr6196940pgf.2.1580415295525;
 Thu, 30 Jan 2020 12:14:55 -0800 (PST)
Date: Thu, 30 Jan 2020 12:14:51 -0800
Message-Id: <20200130201451.253115-1-edumazet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH] dma-debug: add a per-cpu cache to avoid lock contention
To: Christoph Hellwig <hch@lst.de>, Joerg Roedel <jroedel@suse.de>
Cc: iommu@lists.linux-foundation.org, Eric Dumazet <eric.dumazet@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>
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
From: Eric Dumazet via iommu <iommu@lists.linux-foundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Networking drivers very often have to replace one page with
another for their RX ring buffers.

A multi-queue NIC will severly hit a contention point
in dma-debug while grabbing free_entries_lock spinlock.

Adding a one entry per-cpu cache removes the need
to grab this spinlock twice per page replacement.

Tested on a 40Gbit mlx4 NIC, with 16 RX queues and about
1,000,000 replacements per second.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/debug.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index a310dbb1515e92c081f8f3f9a7290dd5e53fc889..b7221426ef49cf640db5bcb261b0817d714a3033 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -97,6 +97,8 @@ static LIST_HEAD(free_entries);
 /* Lock for the list above */
 static DEFINE_SPINLOCK(free_entries_lock);
 
+static DEFINE_PER_CPU(struct dma_debug_entry *, dma_debug_entry_cache);
+
 /* Global disable flag - will be set in case of an error */
 static bool global_disable __read_mostly;
 
@@ -676,6 +678,10 @@ static struct dma_debug_entry *dma_entry_alloc(void)
 	struct dma_debug_entry *entry;
 	unsigned long flags;
 
+	entry = this_cpu_xchg(dma_debug_entry_cache, NULL);
+	if (entry)
+		goto end;
+
 	spin_lock_irqsave(&free_entries_lock, flags);
 	if (num_free_entries == 0) {
 		if (dma_debug_create_entries(GFP_ATOMIC)) {
@@ -690,7 +696,7 @@ static struct dma_debug_entry *dma_entry_alloc(void)
 	entry = __dma_entry_alloc();
 
 	spin_unlock_irqrestore(&free_entries_lock, flags);
-
+end:
 #ifdef CONFIG_STACKTRACE
 	entry->stack_len = stack_trace_save(entry->stack_entries,
 					    ARRAY_SIZE(entry->stack_entries),
@@ -705,6 +711,9 @@ static void dma_entry_free(struct dma_debug_entry *entry)
 
 	active_cacheline_remove(entry);
 
+	if (!this_cpu_cmpxchg(dma_debug_entry_cache, NULL, entry))
+		return;
+
 	/*
 	 * add to beginning of the list - this way the entries are
 	 * more likely cache hot when they are reallocated.
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
