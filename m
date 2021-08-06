Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 280563E28AE
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 12:35:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB95607DB;
	Fri,  6 Aug 2021 10:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LNtAeUdltd1; Fri,  6 Aug 2021 10:35:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C0FC2607E0;
	Fri,  6 Aug 2021 10:35:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED4DC000E;
	Fri,  6 Aug 2021 10:35:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB366C000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C2D403A2
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmkqLc99yeKt for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 10:35:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F1FC40224
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id ca5so15926508pjb.5
 for <iommu@lists.linux-foundation.org>; Fri, 06 Aug 2021 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=311Qrp/16sgcWVRbiBW1ji3+YqnLCaF+bjOOYcGzpWw=;
 b=kDJmlzSa7gXw23y9ZGrjSZtDDyL19vojbj4zmLRjjrIOGkeaGpPNk7jGp7M+MO+kbv
 OpryDXdcfLMwcU3U+XEcv+GviPNqYaN4Dpj831+4Ny4Z0TIOtm9Z23hCN4j4Rjs7EYbz
 vPCBmcco9kacyt5zMdifQ3mwpYeZ9kx4hMz4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=311Qrp/16sgcWVRbiBW1ji3+YqnLCaF+bjOOYcGzpWw=;
 b=CDTUf3b0mstgCQrSlcHp+0RKvmtmQTExTRo2Glx4KjnTC7JAospTLCEHFdW0xORKav
 JynIThhL4Ch4P2Axwm2pgIt8qy/pyto+CpF0ijDqHqpXE7bFcqHbKKnRzoYtrOQB5CHe
 nqDpyXiJbA7AiWgrXb37xQ2ijtLegR1zhD/3afDOEQpmCySc/Jer4FAF/ORaQV52Mgsp
 rqio9vGj9OtwaPW5plUV1Fk7TbWUNKsAEMH1ZXK0zVp946VSCFLq73dfQFGpQyLCk8jB
 YBhr7U+iSqiJBE4vySt7BqIzcqZlqPYmiX+dIZgBC6M/kfCIRp/2F5h8xPUlscV1OWA7
 piUA==
X-Gm-Message-State: AOAM5300/ojafwgjH3QAW2sBLM907ikBeD+1przRKvPBGWKDhGDebEIm
 SmCXa6pozZYp43ao0SKSPwpjBQ==
X-Google-Smtp-Source: ABdhPJwK9KKczWO0B40b5SR8Cr1BOHwx5rPmOAFQ/XlD7OP/2TYnqlGWAV9zxPKbQ20mySLAuD9L+w==
X-Received: by 2002:a17:90a:fb85:: with SMTP id
 cp5mr9915798pjb.214.1628246114578; 
 Fri, 06 Aug 2021 03:35:14 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:6f20:cf00:347a:afc2])
 by smtp.gmail.com with UTF8SMTPSA id u190sm10242809pfb.95.2021.08.06.03.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 03:35:14 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 5/9] dma-iommu: clear only necessary bytes
Date: Fri,  6 Aug 2021 19:34:19 +0900
Message-Id: <20210806103423.3341285-6-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
In-Reply-To: <20210806103423.3341285-1-stevensd@google.com>
References: <20210806103423.3341285-1-stevensd@google.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, David Stevens <stevensd@chromium.org>,
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

From: David Stevens <stevensd@chromium.org>

Only clear the padding bytes in bounce buffers, since syncing from the
original buffer already overwrites the non-padding bytes.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/iommu/io-bounce-buffers.c | 64 +++++++++++++++++++++++++++++--
 drivers/iommu/io-buffer-manager.c |  7 +---
 2 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-bounce-buffers.c b/drivers/iommu/io-bounce-buffers.c
index c7c52a3f8bf7..ed05f593a195 100644
--- a/drivers/iommu/io-bounce-buffers.c
+++ b/drivers/iommu/io-bounce-buffers.c
@@ -296,14 +296,70 @@ bool io_bounce_buffers_unmap_sg(struct io_bounce_buffers *buffers,
 		io_bounce_buffers_unmap_sg_sync, &args);
 }
 
+static void io_bounce_buffers_clear_padding(struct io_bounce_buffer_info *info,
+					    size_t pad_hd_end,
+					    size_t pad_tl_start)
+{
+	size_t idx, pad_hd_idx, pad_tl_idx, count;
+
+	count = info->size / PAGE_SIZE;
+	pad_hd_idx = pad_hd_end / PAGE_SIZE;
+	pad_tl_idx = pad_tl_start / PAGE_SIZE;
+
+	if (!IS_ALIGNED(pad_hd_end, PAGE_SIZE)) {
+		struct page *page = info->bounce_buffer[pad_hd_idx];
+		size_t len = offset_in_page(pad_hd_end);
+
+		memset_page(page, 0, 0, len);
+		arch_sync_dma_for_device(page_to_phys(page), 0, len);
+	}
+
+	if (!IS_ALIGNED(pad_tl_start, PAGE_SIZE)) {
+		size_t off = offset_in_page(pad_tl_start);
+		size_t len = PAGE_SIZE - off;
+		struct page *page = info->bounce_buffer[pad_tl_idx];
+
+		memset_page(page, off, 0, len);
+		arch_sync_dma_for_device(page_to_phys(page) + off, 0, len);
+
+		pad_tl_idx++;
+	}
+
+	idx = pad_hd_idx ? 0 : pad_tl_idx;
+	while (idx < count) {
+		struct page *page = info->bounce_buffer[idx++];
+
+		clear_highpage(page);
+		arch_sync_dma_for_device(page_to_phys(page), 0, PAGE_SIZE);
+		if (idx == pad_hd_idx)
+			idx = pad_tl_idx;
+	}
+}
+
 static bool io_bounce_buffers_map_buffer(struct io_bounce_buffers *buffers,
 					 struct io_bounce_buffer_info *info,
-					 int prot)
+					 int prot, bool skiped_sync,
+					 size_t offset, size_t orig_size)
 {
 	unsigned int count = info->size >> PAGE_SHIFT;
 	struct sg_table sgt;
 	size_t mapped;
 
+	if (offset || offset + orig_size < info->size || skiped_sync) {
+		// Ensure that nothing is leaked to untrusted devices when
+		// mapping the buffer by clearing any part of the bounce buffer
+		// that wasn't already cleared by syncing.
+		size_t pad_hd_end, pad_tl_start;
+
+		if (skiped_sync) {
+			pad_hd_end = pad_tl_start = 0;
+		} else {
+			pad_hd_end = offset;
+			pad_tl_start = offset + orig_size;
+		}
+		io_bounce_buffers_clear_padding(info, pad_hd_end, pad_tl_start);
+	}
+
 	if (sg_alloc_table_from_pages(&sgt, info->bounce_buffer, count, 0,
 				      info->size, GFP_ATOMIC))
 		return false;
@@ -338,7 +394,8 @@ bool io_bounce_buffers_map_page(struct io_bounce_buffers *buffers,
 		io_bounce_buffers_do_sync(buffers, info.bounce_buffer, offset,
 					  page, offset, size, dir, prot, false);
 
-	if (!io_bounce_buffers_map_buffer(buffers, &info, prot)) {
+	if (!io_bounce_buffers_map_buffer(buffers, &info, prot, skip_cpu_sync,
+					  offset, size)) {
 		io_buffer_manager_release_buffer(&buffers->manager,
 						 buffers->domain, info.iova,
 						 false, NULL, NULL);
@@ -381,7 +438,8 @@ bool io_bounce_buffers_map_sg(struct io_bounce_buffers *buffers,
 					    info.bounce_buffer, dir, prot,
 					    false);
 
-	if (!io_bounce_buffers_map_buffer(buffers, &info, prot)) {
+	if (!io_bounce_buffers_map_buffer(buffers, &info, prot, skip_cpu_sync,
+					  0, size)) {
 		io_buffer_manager_release_buffer(&buffers->manager,
 						 buffers->domain, info.iova,
 						 false, NULL, NULL);
diff --git a/drivers/iommu/io-buffer-manager.c b/drivers/iommu/io-buffer-manager.c
index 79b9759da928..587584fdf26b 100644
--- a/drivers/iommu/io-buffer-manager.c
+++ b/drivers/iommu/io-buffer-manager.c
@@ -37,13 +37,10 @@ static struct page **io_buffer_manager_alloc_pages(int count, unsigned int nid)
 	// pages first to make accessing the buffer cheaper.
 	for (i = 0; i < count; i++) {
 		pages[i] = alloc_pages_node(
-			nid,
-			GFP_ATOMIC | __GFP_ZERO | __GFP_NORETRY | __GFP_NOWARN,
-			0);
+			nid, GFP_ATOMIC | __GFP_NORETRY | __GFP_NOWARN, 0);
 		if (!pages[i]) {
 			pages[i] = alloc_pages_node(
-				nid, GFP_ATOMIC | __GFP_ZERO | __GFP_HIGHMEM,
-				0);
+				nid, GFP_ATOMIC | __GFP_HIGHMEM, 0);
 			if (!pages[i]) {
 				io_buffer_manager_free_pages(pages, i);
 				return NULL;
-- 
2.32.0.605.g8dce9f2422-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
