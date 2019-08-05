Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B3813CD
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 10:01:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 39A9CCDB;
	Mon,  5 Aug 2019 08:01:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FE40CCE
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:01:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1DDF85E4
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9C8BalNHtgcMpImxrnOhx7BfTEOVdkXTrjPSmrzHY1w=;
	b=lJc/miCU9VChJUuc3X35x4rbP
	UsPENE26leGH/y10sD6gJC6gfDd8wOyNBx6q8qCcYJdpzuy0LaNyfk6wo/ebbjq951Qu8+AdbM5sH
	yawOAdRIGDYeIoynYesWF5SN8ZmUHhW8xgMqta6RlXnV+OsRhmWioixd9/HPog9I1pdVALdfFPPxv
	7fYv3+w6gurV55Nd880nPBrPBCtzAT9YulYKUsqb2GMCITJmJ3ppRgUyP8d5QbbSWwgW9p+R2B8y+
	T4uvJJ9sbIdRDdnY2yUSsUszxZwcaUNdCBnGnOEgp8qVTR8dEj8c09HeJlLU6ZrYW8mdGX3rFDJB4
	GUc+lIiuw==;
Received: from [195.167.85.94] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1huXwC-0003Lv-6m; Mon, 05 Aug 2019 08:01:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: fix default dma_mmap_* pgprot v2
Date: Mon,  5 Aug 2019 11:01:43 +0300
Message-Id: <20190805080145.5694-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
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

As Shawn pointed out we've had issues with the dma mmap pgprots ever
since the dma_common_mmap helper was added beyong the initial
architectures - we default to uncached mappings, but for devices that
are DMA coherent, or if the DMA_ATTR_NON_CONSISTENT is set (and
supported) this can lead to aliasing of cache attributes.  This patch
fixes that.  My explanation of why this hasn't been much of an issue
is that the dma_mmap_ helpers aren't used widely and mostly just in
architecture specific drivers.

Changes since v1:
 - fix handling of DMA_ATTR_NON_CONSISTENT where it is a no-op
   (which is most architectures)
 - remove DMA_ATTR_WRITE_COMBINE on mips, as it seem dangerous as-is
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
