Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D09D08B
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 15:28:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B685C15BE;
	Mon, 26 Aug 2019 13:28:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB6B915BB
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:26:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73E5B710
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MhfKilNLV8AdxkyYpV9V+99YpggpHbv15IYon9mhMkc=;
	b=SxWguzeHjibJiQGTh0enGJ7wsj
	xvlWsmuxilsSrybCT7ApvIPfTJthkTEJChIJ5pY9DHIsQGjUN67v8cKOOKr5a0uXhM5HM4z32vow4
	bkkZjRbgFpCc/BYTH1TR2Srt2asiNr4QwjlKzC6thdTiNry7uant3AU9xHnoI8haOOP/qM8zbiqxw
	4HlaZ9eaMXY9Je+6oKpIzLdltUVMmtCOJrHiTM/zTsoJ2sL1u6Gn862HOqAy+cr2ZFt3K9eB+DHlR
	YzntowaXSIiZlnQk9a3lTajwZqbRPQp/EZ6iFMq2aXPq9PasHkqpCJwWzyHeA9WB3ILK9MurfmZqm
	+7QSFpkQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i2F0h-0007zP-RH; Mon, 26 Aug 2019 13:26:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 6/6] MIPS: document mixing "slightly different CCAs"
Date: Mon, 26 Aug 2019 15:25:53 +0200
Message-Id: <20190826132553.4116-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
	linux-m68k@lists.linux-m68k.org, Guan Xuetao <gxt@pku.edu.cn>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Based on an email from Paul Burton, quoting section 4.8 "Cacheability and
Coherency Attributes and Access Types" of "MIPS Architecture Volume 1:
Introduction to the MIPS32 Architecture" (MD00080, revision 6.01).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc88f68ea1ee..aff1cadeea43 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1119,6 +1119,13 @@ config DMA_PERDEV_COHERENT
 
 config DMA_NONCOHERENT
 	bool
+	#
+	# MIPS allows mixing "slightly different" Cacheability and Coherency
+	# Attribute bits.  It is believed that the uncached access through
+	# KSEG1 and the implementation specific "uncached accelerated" used
+	# by pgprot_writcombine can be mixed, and the latter sometimes provides
+	# significant advantages.
+	#
 	select ARCH_HAS_DMA_WRITE_COMBINE
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_UNCACHED_SEGMENT
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
