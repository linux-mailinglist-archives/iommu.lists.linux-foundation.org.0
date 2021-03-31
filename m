Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F034FDC3
	for <lists.iommu@lfdr.de>; Wed, 31 Mar 2021 12:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A1A84824;
	Wed, 31 Mar 2021 10:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5j4ne7dVVGJ; Wed, 31 Mar 2021 10:04:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A8584822;
	Wed, 31 Mar 2021 10:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0549C0017;
	Wed, 31 Mar 2021 10:04:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0988C000C
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAA5860ABA
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHhlw4t_2VQI for <iommu@lists.linux-foundation.org>;
 Wed, 31 Mar 2021 10:04:53 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.8.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8FF460AB0
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 10:04:52 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ada2:b4da:6568:5ad5])
 by andre.telenet-ops.be with bizsmtp
 id mxzc2400c5W9KJv01xzcoU; Wed, 31 Mar 2021 11:59:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lRXdQ-00BseR-3H; Wed, 31 Mar 2021 11:59:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lRXdP-001cdD-ED; Wed, 31 Mar 2021 11:59:35 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] clk: Align provider-specific CLK_* bit definitions
Date: Wed, 31 Mar 2021 11:59:19 +0200
Message-Id: <505e19bac2deb6015e76391ce7ad044c43499681.1617184676.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The definition of CLK_MULTIPLIER_ROUND_CLOSEST is not aligned to the two
bit definitions next to it.  A deeper inspection reveals that the
alignment of CLK_MULTIPLIER_ROUND_CLOSEST does match the most common
alignment.

Align the bit definitions for the various provider types throughout the
file at 40 columns, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/clk-provider.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 58f6fe866ae9b797..8f37829565f9640e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -342,7 +342,7 @@ struct clk_fixed_rate {
 	unsigned long	flags;
 };
 
-#define CLK_FIXED_RATE_PARENT_ACCURACY		BIT(0)
+#define CLK_FIXED_RATE_PARENT_ACCURACY	BIT(0)
 
 extern const struct clk_ops clk_fixed_rate_ops;
 struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
@@ -984,8 +984,8 @@ struct clk_fractional_divider {
 
 #define to_clk_fd(_hw) container_of(_hw, struct clk_fractional_divider, hw)
 
-#define CLK_FRAC_DIVIDER_ZERO_BASED		BIT(0)
-#define CLK_FRAC_DIVIDER_BIG_ENDIAN		BIT(1)
+#define CLK_FRAC_DIVIDER_ZERO_BASED	BIT(0)
+#define CLK_FRAC_DIVIDER_BIG_ENDIAN	BIT(1)
 
 extern const struct clk_ops clk_fractional_divider_ops;
 struct clk *clk_register_fractional_divider(struct device *dev,
@@ -1033,9 +1033,9 @@ struct clk_multiplier {
 
 #define to_clk_multiplier(_hw) container_of(_hw, struct clk_multiplier, hw)
 
-#define CLK_MULTIPLIER_ZERO_BYPASS		BIT(0)
+#define CLK_MULTIPLIER_ZERO_BYPASS	BIT(0)
 #define CLK_MULTIPLIER_ROUND_CLOSEST	BIT(1)
-#define CLK_MULTIPLIER_BIG_ENDIAN		BIT(2)
+#define CLK_MULTIPLIER_BIG_ENDIAN	BIT(2)
 
 extern const struct clk_ops clk_multiplier_ops;
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
