Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 560074513CE
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 20:55:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A317480D61;
	Mon, 15 Nov 2021 19:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8b7vLkkumZf; Mon, 15 Nov 2021 19:55:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BCC5880D77;
	Mon, 15 Nov 2021 19:55:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E872C0012;
	Mon, 15 Nov 2021 19:55:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82397C0031;
 Mon, 15 Nov 2021 19:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5626540278;
 Mon, 15 Nov 2021 19:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sent.com header.b="0KSmGcem";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="AG6W7724"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zep9wp4efIe; Mon, 15 Nov 2021 19:46:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 824294026F;
 Mon, 15 Nov 2021 19:46:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 490E5580631;
 Mon, 15 Nov 2021 14:37:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 15 Nov 2021 14:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=YFFMYVihWiPWk
 tyuxrOQDQ9eoOlotAMNNpVZGNCElO4=; b=0KSmGcem0XSmBLi02KfOtT89MOTZm
 Z4IwFx+QEXZqMm9++dx+bVPqeYflclLgTijihCkbG3s6+Eky5F2lf6aFaXEqLRHD
 QXWVVps72mZG/SDaBR48uA/py4FZ/lrH/C8H4IYNePPY1SMkE7zG7RLQBeJ6iOgb
 NWmjiIROVXymlsb3OlpA9NcHUZYGin1/sGkSx5cV33lSBFFerYaA4a042ztvizP9
 lYIZ/7miQQEPhi3OzlywV4dxvBWTb/4LVxVzhZqHze5C2nL8kZ0+Szraiw+sWqSL
 YhaD1bH8jWoPpwRqkwRJkpLfmSo75LU4pv8XDfIkpXx9LtFqufoufdDtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YFFMYVihWiPWktyuxrOQDQ9eoOlotAMNNpVZGNCElO4=; b=AG6W7724
 w7Vhj06SHRZjFE5aU+pnidCinTGfjv2nhxJZ6TS6uRSphj9r4DRwfRzwtAlwiyIu
 bfcqb9UuKAeHnI7c65ujBBKh4zFj/kh8Lv5pexFDa4EtIURbKPur0FTkBPl2Qzag
 dfp0NU1PZ+tTPSTFvTb40cpl9zNtKGA4Vv5Mtqxs4NqEQE7zaPJsCcFtjyYVOnMJ
 CM4rCwlCYtDhE/5L2eyV2fVmI2iPcdD994UiDrGP05p3G3gzrFnzL74Bm7/4In48
 NG1l/W0XuYMPkAR0fI4Haw8j13qj2IUs7iW/Dp20cmR+VZ7XEeUkvCxrdv08tiJU
 JTsrAy3/AJdG6A==
X-ME-Sender: <xms:D7eSYR6F2OCY0aXFjolRkyiLBwUm32hkrpDW71yH2l3z9yq8yQcirQ>
 <xme:D7eSYe69Z0e0J9imxreIuQ7ljrcXkMShhzOi7Hiyiin8CWsdHLManl2sSfm1bZoL7
 353LyVjCu3k_AXYlw>
X-ME-Received: <xmr:D7eSYYcKmA6JuI4rVsFCUxaAaWia70Hkyp3ZR9MO9sMh6Mmwt0A2cv0pf2oFWt0QncpB6bI9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:D7eSYaIxidt93JQnvs-8VA9VlQE9H9wWsjtj_jteON4m098vlZF6Fw>
 <xmx:D7eSYVJynTUv1E1Gn2kLXcxam7_4OfTH85AuqAk3OrDZU0k1gkO-rQ>
 <xmx:D7eSYTz1PUmixsZoMw4rWRLueT399yXJBV5agTa10jzreI5ii-_DkA>
 <xmx:ELeSYeX-tSoOAwwfRfuGF2owt7JF4z9ZpWx6we5_tg1jp0WhR_Q9Jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 14:37:51 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 3/3] arch: powerpc: adjust fadump alignment to pageblock
 aligned.
Date: Mon, 15 Nov 2021 14:37:25 -0500
Message-Id: <20211115193725.737539-5-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115193725.737539-1-zi.yan@sent.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Nov 2021 19:55:29 +0000
Cc: Michael Ellerman <mpe@ellerman.id.au>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Zi Yan <ziy@nvidia.com>, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

CMA only requires pageblock alignment. Change fadump too.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/powerpc/include/asm/fadump-internal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 8d61c8f3fec4..9198f20b6b68 100644
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
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
