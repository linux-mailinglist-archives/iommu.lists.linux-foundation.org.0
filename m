Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42868637E3
	for <lists.iommu@lfdr.de>; Tue,  9 Jul 2019 16:27:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2E6483A08;
	Tue,  9 Jul 2019 14:27:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16A85375C
	for <iommu@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 14:20:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A7D96148
	for <iommu@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XMQ8HzVhV6llIr9Uj69ef+r1U5wbO5cJKt+uhgrA3co=;
	b=h6hi8M5UNIIpQMGL6nIGE34A2
	nOTVOcfCr9ReD7AdY26h+nNCeC8/9lsfk0YxDLhim/hfRKvTKuEEGuW28ENauItW6QutKUo+aLUaL
	26hrhEChLGn0jVkHF1ZCqbCp+HhjQ7HyrgqXrn31PR7FkEgDDX1/KADLubImwFRq5GUFPzTxEh6b0
	tq/AmOtOemotAkzFe8/7vpZizzEhzeYM1ByzCEHlHrtQq/HG4k+pXtca+HFpIM5r4sEcF49XixB0/
	SkivzY/zSgB0JR5jPh+tV1f+PEu0WMFYoEQEn4qLRtbOxZmcraYzm65S2z/sfAhYQjigs3l/I4zWq
	w7rNyS//g==;
Received: from [209.244.105.251] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hkqya-0001BM-5n; Tue, 09 Jul 2019 14:20:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: add swiotlb support to arm32
Date: Tue,  9 Jul 2019 07:20:09 -0700
Message-Id: <20190709142011.24984-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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

Hi Russell,

This series adds swiotlb support to the 32-bit arm port to ensure
platforms with LPAE support can support DMA mapping for all devices
using 32-bit dma masks, just like we do on other ports that support
> 32-bit physical addressing and don't have an iommu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
