Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C7FAB01
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 08:32:24 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E1ED0F29;
	Wed, 13 Nov 2019 07:32:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40D18F21
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:32:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B829102
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U6DH1QSowvu6LETtPO1B1oHlFjT7uBOtz6fVqlVLip0=;
	b=RsudJmSmKim0oEYcXcZOUcyhj
	SV3uKDell/ryfxj25r7DQiv8uTeNLQCR6F0ohKS9BCDSwCaH0y3q/z9IOReMlZD+lWHwFy5o9sW53
	0YJSm/VzWwMoTG68nRjiEmMdXGcixFFUQX//Q3kGrgr8N+COGzma7SimVMUIIBnBhTADVkapCD6BX
	GJTtoPdECIAMp/6Qf76tnHRe8Q+rPAcH5U9/ER3sagqqDc885GfUosDC5rQnIbY70O0y13h6Hoc6v
	uOmF4zVa+MhrxPcaxGNIS8e66BEW+8G+6AFwoP6e0xSiOpotQVzq+hGLMmE6zNdlPWlukbSYPsHOd
	yAH70Irqg==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUn8R-0006qp-UU; Wed, 13 Nov 2019 07:32:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
	iommu@lists.linux-foundation.org
Subject: remove DMA_ATTR_WRITE_BARRIER
Date: Wed, 13 Nov 2019 08:32:12 +0100
Message-Id: <20191113073214.9514-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-rdma@vger.kernel.org
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

There is no implementation of the DMA_ATTR_WRITE_BARRIER flag left
now that the ia64 sn2 code has been removed.  Drop the flag and
the calling convention to set it in the RDMA code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
