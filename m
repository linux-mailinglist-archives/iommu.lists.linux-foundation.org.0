Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 476874B2A9B
	for <lists.iommu@lfdr.de>; Fri, 11 Feb 2022 17:42:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B403861C2C;
	Fri, 11 Feb 2022 16:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqiSa93PAvdc; Fri, 11 Feb 2022 16:41:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DD04C61C31;
	Fri, 11 Feb 2022 16:41:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B166BC000B;
	Fri, 11 Feb 2022 16:41:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E64A4C000B;
 Fri, 11 Feb 2022 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD34061C2C;
 Fri, 11 Feb 2022 16:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isiEJVY4g1KF; Fri, 11 Feb 2022 16:41:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4484F60B6A;
 Fri, 11 Feb 2022 16:41:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7367F58037F;
 Fri, 11 Feb 2022 11:41:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 11 Feb 2022 11:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=8yuexR1+nrtHGS
 O8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=D3VqJlhlbyWtV6r6GqE/sdQHhhzfao
 jEbpnb9Wr0ZReRqYHRz6KCXTCd0yivunmYqzFRoQLkQegNx2uHlUfqnjdWV/uzSJ
 zU8M0dPa33aRq+dlCTIv1HKtBD/Kh7pykEWL/ODQJPonFg0wqPv8sIrL0qYanslJ
 /JLrIUPIaJr4Z6KM4Og/F2X8lkSYDPbN7ITWDitlcOlpiq78n71xOGLIXJXz0Odg
 DRLO19YIQToJHSo/aJlV9Z59lWZxCAiI+H1agFbgcJWflqv/7sa6Z/DEHrtZkp3d
 sm83CKxYJVqNKbxcCcoENzJCEn26apNqoREHw+PQFH0GDXE8WDR4bjCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8yuexR1+nrtHGSO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=YQN1sACl
 87xj+F47lfbNUuu2eOmgbTwH2DjTS/HIzp4OOKxqbF9Ccp5g2TMpkwWX2gBWSZNt
 EIPNTSk5Nl922Lg6gwveaU2GuyEA3/UfkKtvPP7p+AGcRnn4sIlGCdRzlTfHo2x1
 OxQNvyL/puQhqVLBtDsJccw8y7Iaq1sUjOQ2m/rnf7M6NoneAkAyKwJj4wZzSkaB
 WxyqKOeTGmYirNdGfaMPZnppY7uXdXPT4AHgxf5NVJMRxE3UDqkMzGCzf8L0gtEi
 VzZ9ycKNj3Y88HlVS7sXcuD+X/zVMZSnrQ0sI1ttCUNu1pmn/5U64GI9YlSxP+j6
 Ee5VZdGDqCSGFw==
X-ME-Sender: <xms:z5EGYoD0HNOZcFFbJ4BM6mXHloZ_7ZKKhfRmcpgqUKvf_v9Nj3klng>
 <xme:z5EGYqg29ZRCUlsrXWU4LEuzwwgbc33fWkpaJRahLkzsJe-fXsry7pQWrWrRrho17
 Ml7Nmn8zyL2dMmaxw>
X-ME-Received: <xmr:z5EGYrmNw8VWdjs_Tz1ZRVcOLW6HyNjege8PTS3V998EKzdu4gQzO5LRhGwaiyvxWsdezm1N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:z5EGYuz5Bj9-JaqGriH-MKRe3zFXlOgPQ60DeTL5Jzmwi573abPhjQ>
 <xmx:z5EGYtQ1VmRFqGNTnFcrQNIS2JDX1K0F3ipTVIQHg82r79TtOBAQjQ>
 <xmx:z5EGYpb_ZyVuWCbl_iOa2f738FO1CUfDztTRyhGyeaILcTWnSeqCNQ>
 <xmx:z5EGYpp4NsHG7dNpBbY_x8GNgLUNpaRSeSapkd1LGcqN-l8MqDZo0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 11:41:50 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v5 6/6] arch: powerpc: adjust fadump alignment to be pageblock
 aligned.
Date: Fri, 11 Feb 2022 11:41:35 -0500
Message-Id: <20220211164135.1803616-7-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211164135.1803616-1-zi.yan@sent.com>
References: <20220211164135.1803616-1-zi.yan@sent.com>
MIME-Version: 1.0
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Oscar Salvador <osalvador@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Mike Rapoport <rppt@kernel.org>,
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

CMA only requires pageblock alignment now. Change CMA alignment in
fadump too.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/powerpc/include/asm/fadump-internal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 52189928ec08..fbfca85b4200 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -20,9 +20,7 @@
 #define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
 
 /* Alignment per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-				 max_t(unsigned long, MAX_ORDER - 1,	\
-				 pageblock_order))
+#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE << pageblock_order)
 
 /* FAD commands */
 #define FADUMP_REGISTER			1
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
