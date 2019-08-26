Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 938089D07C
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 15:27:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B05C15CD;
	Mon, 26 Aug 2019 13:27:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5497515BB
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:26:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 19EA78AA
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rPETQGaDckDZVtLIzvt1M3lT8jH23GiXzU9sIDOMY7g=;
	b=ReaDf4JWYplq41pCVxv3bXWp9
	Cuu9gd7GPo3H6qUuEWvSd5ZvsQHizunWLcCUeE8CF+GtlIilI/apIO1wxGBB+LaGLJZAQUkUaBoAo
	zmpjQYEG8cdwaZFqo2ylFhNQmkwvT+AMaXw9ZNVs/tFFbFm6/3UBeKTX8hn0VATipq7Xx8tNjA3UI
	l5XG2kAplfYXzqIOKj2/IEGK9yN0XLFtYiWDTl97XrK5Ps4QX/d9ikTqgbM6DwEDW55o+CQkN8bgW
	5ZaZNFN9NKK/kpK+1fI2S7dWlLlkPcR97byuTnosY9xRA6TACMW510W7cX+bte91+aQ/100y1A4FA
	4Sw+IQLQA==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i2F0O-0007u5-36; Mon, 26 Aug 2019 13:25:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: cleanup the dma_pgprot handling v2
Date: Mon, 26 Aug 2019 15:25:47 +0200
Message-Id: <20190826132553.4116-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
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

Hi all,

this series replaces the arch_dma_mmap_pgprot hooks with the
simpler pgprot_dmacoherent as used by the arm code already and
cleans up various bits around that area.

Changes since v1:
 - improve the new arm64 comment
 - keep the special DMA_ATTR_WRITE_COMBINE handling for mips and
   document it
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
