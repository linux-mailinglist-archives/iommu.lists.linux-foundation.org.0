Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7F8904B
	for <lists.iommu@lfdr.de>; Sun, 11 Aug 2019 10:06:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 90709AD7;
	Sun, 11 Aug 2019 08:05:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C4D2FAC8
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:05:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 056206E0
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SRihJ2JCOubb4xOLvkiaXfqbtokLoWesn+Hfy8/Vu0Q=;
	b=T46e9N54SMpr4GBv9pEwtOISh
	8/dhFXd16JGfmcLf2eLpHpf42sr2Bl89BbcsVn78EvBYavRPWjJnCCfr61VUbbd7pC0bJSI3dXBiK
	RNwWWO7xpA1SustKupCRocJIOMXxD4ifjurw05OKz/wk9fvh+CB6DwzdKjAPt0wss6bImBTMAZwgw
	iGT4dCCWVxHYAwsvPKv7gMFJ4ba6oyPfmBeNFsECPn7X2j9bXyRWwTuXJblluWLjH2gc3ZRQZHmFa
	bRegtSVX/8coTJsg53ce9JsZyT0FA5FzCeKMKV/4665rURUx3jNb9GTGLf+uOIZEcgX74HKJ1M1Uf
	voPPGPSSA==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hwir0-0001uh-74; Sun, 11 Aug 2019 08:05:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: next take at setting up a dma mask by default for platform devices
Date: Sun, 11 Aug 2019 10:05:14 +0200
Message-Id: <20190811080520.21712-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, Olav Kongas <ok@artecdesign.ee>,
	Gavin Li <git@thegavinli.com>, linuxppc-dev@lists.ozlabs.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
	iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>, Bin Liu <b-liu@ti.com>,
	linux-arm-kernel@lists.infradead.org
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

this is another attempt to make sure the dma_mask pointer is always
initialized for platform devices.  Not doing so lead to lots of
boilerplate code, and makes platform devices different from all our
major busses like PCI where we always set up a dma_mask.  In the long
run this should also help to eventually make dma_mask a scalar value
instead of a pointer and remove even more cruft.

The bigger blocker for this last time was the fact that the usb
subsystem uses the presence or lack of a dma_mask to check if the core
should do dma mapping for the driver, which is highly unusual.  So we
fix this first.  Note that this has some overlap with the pending
desire to use the proper dma_mmap_coherent helper for mapping usb
buffers.  The first two patches from this series should probably
go into 5.3 and then uses as the basis for the decision to use
dma_mmap_coherent.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
