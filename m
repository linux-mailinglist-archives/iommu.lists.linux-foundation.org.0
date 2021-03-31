Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE034FDC5
	for <lists.iommu@lfdr.de>; Wed, 31 Mar 2021 12:05:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04E68481B;
	Wed, 31 Mar 2021 10:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vG1p5xPR6KX; Wed, 31 Mar 2021 10:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E3984827;
	Wed, 31 Mar 2021 10:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05F54C000A;
	Wed, 31 Mar 2021 10:04:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E640CC000A
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55238481B
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wL-rHxAD7NVE for <iommu@lists.linux-foundation.org>;
 Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.8.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6B0584812
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:52 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ada2:b4da:6568:5ad5])
 by andre.telenet-ops.be with bizsmtp
 id mxzd240055W9KJv01xzdoY; Wed, 31 Mar 2021 11:59:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lRXdQ-00BseR-AW; Wed, 31 Mar 2021 11:59:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lRXBt-001bpk-Cn; Wed, 31 Mar 2021 11:31:09 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH 2/3] tracing: Use pr_crit() instead of long fancy messages
Date: Wed, 31 Mar 2021 11:31:03 +0200
Message-Id: <20210331093104.383705-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331093104.383705-1-geert+renesas@glider.be>
References: <20210331093104.383705-1-geert+renesas@glider.be>
MIME-Version: 1.0
Cc: Marco Elver <elver@google.com>, linux-embedded@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, Gary R Hook <gary.hook@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

While long fancy messages have a higher probability of being seen than
small messages, they may scroll of the screen fast, if visible at all,
and may still be missed.  In addition, they increase boot time and
kernel size.

The correct mechanism to increase importance of a kernel message is not
to draw fancy boxes with more text, but to shout louder, i.e. increase
the message's reporting level.  Making sure the administrator of the
system is aware of such a message is a system policy, and is the
responsability of a user-space log daemon.

Fix this by increasing the reporting level from KERN_WARNING to
KERN_CRIT, and removing irrelevant text and graphics.

This reduces kernel size by ca. 0.5 KiB.

Fixes: 2184db46e425c2b8 ("tracing: Print nasty banner when trace_printk() is in use")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 kernel/trace/trace.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index eccb4e1187cc788e..b3a93aff01045923 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3175,20 +3175,9 @@ void trace_printk_init_buffers(void)
 
 	/* trace_printk() is for debug use only. Don't use it in production. */
 
-	pr_warn("\n");
-	pr_warn("**********************************************************\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** trace_printk() being used. Allocating extra memory.  **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** This means that this is a DEBUG kernel and it is     **\n");
-	pr_warn("** unsafe for production use.                           **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** If you see this message and you are not debugging    **\n");
-	pr_warn("** the kernel, report this immediately to your vendor!  **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**********************************************************\n");
+	pr_crit("trace_printk() being used. Allocating extra memory.\n");
+	pr_crit("This means that this is a DEBUG kernel and it is\n");
+	pr_crit("unsafe for production use.\n");
 
 	/* Expand the buffers to set size */
 	tracing_update_buffers();
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
