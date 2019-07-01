Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D481F24F23
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 14:47:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 855BCC03;
	Tue, 21 May 2019 12:47:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5877DB3E
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1EC527B
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TvIxT1o5Tbn+yqyNJ0aiw485bDsO1MWG8TucFoAEnuY=;
	b=T+OFfgbbJHtIJe647qbAal/v4
	4+2lqlj+lN40ITfC77kbAS9Vmhp9UHGOTLbHbAGa9SDxdHQuH50OBvqBSgBpGxnKrtGFdkbOrRChr
	XP8iIVRyRDVd3X9M4yb9TUYQT7kxWRXQTp5uP61N/fysxGYSpBWExj5YuONT4n09tmT2L3f4L8YtM
	dbx+IK1GbCqlVBmVYKIg+dVWwRxYkUck3wmUAW+XmcSPJdNbluMSHJMgD92n2f0jlqqM41fmpKckS
	UYJEyu/wEJzipFXxRtYaoEmIJiafJZHXqO4uoeJqXxtQT/zVgbsLe93CKJVj4SldbCIlGSzIXyZl1
	fHQvDs/lg==;
Received: from 089144214035.atnat0023.highway.a1.net ([89.144.214.35]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT4B3-0004Hk-Vr; Tue, 21 May 2019 12:47:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Russell King <linux@armlinux.org.uk>
Subject: fixups for the dma_set_mask beahvior change in 5.1
Date: Tue, 21 May 2019 14:47:27 +0200
Message-Id: <20190521124729.23559-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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

in 5.1 I fixed up the DMA mapping API to always accept larger than
required DMA mask.  Except that I forgot about a check in the arm
code that is not required any more, and about the case where a
architecture only supports a 32-bit dma mask, but could potentially
generate large addresses due to offsets for the DMA address.

These two patches should fix up these issues (which were only found by
code inspection).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
