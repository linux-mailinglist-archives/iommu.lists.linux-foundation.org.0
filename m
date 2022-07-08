Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E356CD78
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CCB41864;
	Sun, 10 Jul 2022 06:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25CCB41864
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=MDtkeEsI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOy5BFsBqARJ; Sun, 10 Jul 2022 06:37:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 58C994188F;
	Sun, 10 Jul 2022 06:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C994188F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C60A5C00AB;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2720C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 17:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEAD8607C0
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEAD8607C0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com
 header.a=rsa-sha256 header.s=google header.b=MDtkeEsI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1iIs45fgpbK for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 17:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9675660AF2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9675660AF2
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 17:08:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1429956wmb.1
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jul 2022 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjtnXjJTM76a8uBuPAjTSUIAKlaLeiPacD9QEtS4qDw=;
 b=MDtkeEsInPqXPzZim3GXqcRJnQOfNrk0zyh69sg/F7vVFzZs7k4LbrmXCyoJMhe+pk
 hV6nsVlhB1c8j3aePLXYPVgjfKdkU6l80MZxTr3QLcbG11/Pkn1zcGUlv8v9uLrr+Y2R
 zUbnawCQw1MwEaiv2QUN9UWeC6sUxoBqBUMkGsmZnfBgcqnehNvhJ6lSuElTcEB5F4ov
 fnl76H5vXeqI5YM0r2YMAhMa7Oe2ouD2XUJMLO8XC02bnjHKvz8/Z/bRDT6kP06yvLlp
 E3VxyeGZdW978yMpMTQWBWvM8vblfY6+0by9evAAG1hP2wYpL7l/LhvUnhkHrHW2V5+B
 TUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjtnXjJTM76a8uBuPAjTSUIAKlaLeiPacD9QEtS4qDw=;
 b=LPdjAeI9TUTIWtSLcZh6oi06xQj1Haqn9dLFhJQM13KOL+D3netHpRiHOCJj8drdWe
 yP134by2YJPNm/T5lxPYUzjkMFQbzYvAbg9DMYlup85Igwx8/l6I8mOPXbaJPQp9UphB
 nbS6zdzmSJPENYKDsnkyvBQMmnOfly/LbS3ZH3ynV77Xz7yRRyyBgkxifzTo/TKvOemp
 G908c/td4qa39yExtlZyCnezGhs6jzQypZDLkSmAkfZziN9GnDOtnSHw9G8kRqz+ZqT8
 Wf3elGXr7Ju/SuxHndzcUeNT67V3X9o4/pQo9aIytzptCTl2UrnnYWTlf30FmB/NUy1H
 41wg==
X-Gm-Message-State: AJIora/n8m5ya4bFUw/ZiCrQNBmCXfGPjq6tOE52+VE0sthWazL2aXAf
 t+iRmbdm2Vq4LJYa0SEnG37Flg==
X-Google-Smtp-Source: AGRyM1uLwrXqWANfQe+1Wila+2ISVN7BYY7M0YDfWZQ2VfUWRzFwS//um4Nxt9sS7P6MX4Tl60U/tQ==
X-Received: by 2002:a1c:7405:0:b0:3a2:de4f:5f07 with SMTP id
 p5-20020a1c7405000000b003a2de4f5f07mr840272wmc.117.1657300094872; 
 Fri, 08 Jul 2022 10:08:14 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b0021d9591c64fsm92701wrq.33.2022.07.08.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 10:08:14 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 iommu@lists.linux-foundation.org
Subject: [PATCH] swiotlb: ensure io_tlb_default_mem spinlock always initialised
Date: Fri,  8 Jul 2022 18:08:11 +0100
Message-Id: <20220708170811.270589-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>
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

If the io_tlb_default_mem is used by a device that then gets used
by the swiotlb code, the spinlock warning is triggered causing a
lot of stack-trace.

Fix this by making the structure's lock initialised at build time.

Avoids the following BUG trigger:

[    3.046401] BUG: spinlock bad magic on CPU#3, kworker/u8:0/7
[    3.046689]  lock: io_tlb_default_mem+0x30/0x60, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[    3.047217] CPU: 3 PID: 7 Comm: kworker/u8:0 Not tainted 5.17.0-00056-g1e9bac738084-dirty #310
[    3.048363] Workqueue: events_unbound deferred_probe_work_func
[    3.048892] Call Trace:
[    3.049224] [<ffffffff800048aa>] dump_backtrace+0x1c/0x24
[    3.049576] [<ffffffff805c5f74>] show_stack+0x2c/0x38
[    3.049898] [<ffffffff805cade2>] dump_stack_lvl+0x40/0x58
[    3.050216] [<ffffffff805cae0e>] dump_stack+0x14/0x1c
[    3.050460] [<ffffffff805c69f6>] spin_dump+0x62/0x6e
[    3.050681] [<ffffffff8004e000>] do_raw_spin_lock+0xb0/0xd0
[    3.050934] [<ffffffff805d5b58>] _raw_spin_lock_irqsave+0x20/0x2c
[    3.051157] [<ffffffff80067e38>] swiotlb_tbl_map_single+0xce/0x3da
[    3.051372] [<ffffffff80068320>] swiotlb_map+0x3a/0x15c
[    3.051668] [<ffffffff80065a56>] dma_map_page_attrs+0x76/0x162
[    3.051975] [<ffffffff8031d542>] dw_pcie_host_init+0x326/0x3f2

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index cb50f8d38360..a707a944c39a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -65,7 +65,7 @@
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
 
-struct io_tlb_mem io_tlb_default_mem;
+struct io_tlb_mem io_tlb_default_mem = { .lock = __SPIN_LOCK_UNLOCKED(io_tlb_default_mem.lock) } ;
 
 phys_addr_t swiotlb_unencrypted_base;
 
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
