Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A247A9BE
	for <lists.iommu@lfdr.de>; Mon, 20 Dec 2021 13:35:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE1760C28;
	Mon, 20 Dec 2021 12:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9g5yw6D9Db63; Mon, 20 Dec 2021 12:34:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1E11760C24;
	Mon, 20 Dec 2021 12:34:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2249C0012;
	Mon, 20 Dec 2021 12:34:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32058C0012
 for <iommu@lists.linux-foundation.org>; Mon, 20 Dec 2021 12:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8F983F7E
 for <iommu@lists.linux-foundation.org>; Mon, 20 Dec 2021 12:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zgKgVTfZOVK for <iommu@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 12:34:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F286D83F25
 for <iommu@lists.linux-foundation.org>; Mon, 20 Dec 2021 12:34:56 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b0066e4.dip0.t-ipconnect.de
 [91.0.102.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 11C5228D;
 Mon, 20 Dec 2021 13:34:54 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] iommu/iova: Temporarily include dma-mapping.h from iova.h
Date: Mon, 20 Dec 2021 13:34:48 +0100
Message-Id: <20211220123448.19996-1-joro@8bytes.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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

From: Joerg Roedel <jroedel@suse.de>

Some users of iova.h still expect that dma-mapping.h is also included.
Re-add the include until these users are updated to fix compile
failures in the iommu tree.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/iova.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iova.h b/include/linux/iova.h
index 0abd48c5e622..cea79cb9f26c 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/rbtree.h>
+#include <linux/dma-mapping.h>
 
 /* iova structure */
 struct iova {
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
