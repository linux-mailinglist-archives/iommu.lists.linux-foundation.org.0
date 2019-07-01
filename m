Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBD33F43
	for <lists.iommu@lfdr.de>; Tue,  4 Jun 2019 08:55:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 52864E19;
	Tue,  4 Jun 2019 06:55:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D037DDE
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 06:55:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A44D19B
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bxnoQG0ijuRDsL2dBIq1SQiaI/rZFtwyO7A8d4rEqxc=;
	b=WA4XuLy/pL0N5n09h+1lolxMj
	TUAhYXwjnwJJZyUxgnxzMPFg9I0NuRJAZAKLgr8jViYrmseCTyQIfNxRTLIKFw4zzxV1qG3bFI3ik
	DtsIfrbtE7c3vD+/ooSOMNk6jgC17JuriYfaysroA4hLy/C3aJcWBamfH7RoGUNBQ1q9h91jrDgdX
	PKRZbvnnXTz4XSlxMFrkwsa9ngEKk8wh/vlIqQkA5chsCkL4HSSkUT0MuLM93NQ+JZ0DMq85h1gIe
	X1WIoNFTb6iFitzENGlzBXr2XXuRr0BW+XL3sUIyA0+D2oRQNHSU5ZeGwH38Y0Xwg0ViQd3Z2upBt
	JimL+peNg==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY3Lf-0002ih-2y; Tue, 04 Jun 2019 06:55:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: cleanup vmap usage in the dma-mapping layer
Date: Tue,  4 Jun 2019 08:55:01 +0200
Message-Id: <20190604065504.25662-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
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

the common DMA remapping code uses the vmalloc/vmap code to create
page table entries for DMA mappings.  This series lifts the currently
arm specific VM_* flag for that into common code, and also exposes
it to userspace in procfs to better understand the mappings, and cleans
up a couple helpers in this area.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
