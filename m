Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1C6B699
	for <lists.iommu@lfdr.de>; Wed, 17 Jul 2019 08:26:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AEA3AC2C;
	Wed, 17 Jul 2019 06:26:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98F63AE0
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 54FD412E
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K7H/a4NErovUxRGU06/uLQsjkN/DLzAnnlN1h9ancXw=;
	b=lrTdWqvXNyoOtCzQpqjDXorzc
	SQhUNNHtbufMJYXk+tysnO6m3RMQbWASa8Tfa8j5YzLW5Ik+zuJJh4fkVrRl8LwcAbKapgowl1ak6
	z8CkMZJvg2aiDWlazThgXQ++CGLAaJal0tZiN64mj989OyIOXfIdnBKJIGFZZ7r9dixa0ICXLplLf
	N07/nfb+MB7wXbOh/Prhf3nDyQkPe5dJfBK90Qaoqx9mBIItlqLJ6Ixfle9H06iyuB8s4I/E1Po40
	hg1Rg2Ov/SgUNqOupzzgirMwputAO7Wbt+XIQExfidBQ3yuZ6179O3h5euvzLJHfNvxk2fl8d9L4z
	QF/pUXKxw==;
Received: from [213.208.157.38] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hndOL-0003lg-Tn; Wed, 17 Jul 2019 06:26:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: fix nvme performance regression due to dma_max_mapping_size()
Date: Wed, 17 Jul 2019 08:26:13 +0200
Message-Id: <20190717062615.10569-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	RCVD_IN_SBL_CSS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org
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

the new dma_max_mapping_size function is a little to eager to limit
the I/O size if the swiotlb buffer is present, but the device is
not addressing limited.  Fix this by adding an additional check.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
