Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C5694F35EE
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 18:42:13 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 868C2E7A;
	Thu,  7 Nov 2019 17:40:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0ABB5E28
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 17:40:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C3029756
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dLNx8yX02Kzj1oRWP3mQD5vnGq79lBQ8cwVKhpycAZU=;
	b=cIm6jVZ03X0FF3ZUZEVUBNxG2
	TzFrLwgk9odu/08Us6Nlkwas9WZ15XFdpPT2mAfyh3/Q3/Jfr87m38La8EyX3BRe/M5B+OsKGdj78
	bLUUAIvM0bNRoeNsydjx3SfAzM8kAGyt4E78aHVnQkSQwU3ifXbxIotnL525AOyqb3r2IXzsDv0K5
	DgvUNXavRIyemwxa8KPa9J6lWpHc9hTtoDxV+ZQrBpoU5JEDCWfOy4WXKCChV1Xw2SXz+QHiTWoLC
	i6PvhObHRRkUQS7SizmzKHusOkrT5aoQyK6Winw83d4cMSqk05qzHLFHvvtU3ShbRr5DoB3Q9XZhg
	sk/4vf4xw==;
Received: from [2001:4bb8:184:e48:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSllt-0002NX-Tu; Thu, 07 Nov 2019 17:40:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Subject: provide in-place uncached remapping for dma-direct
Date: Thu,  7 Nov 2019 18:40:33 +0100
Message-Id: <20191107174035.13783-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	openrisc@lists.librecores.org, Will Deacon <will@kernel.org>,
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

this series provides support for remapping places uncached in-place in
the generic dma-direct code, and moves openrisc over from its own
in-place remapping scheme.  The arm64 folks also had interest in such
a scheme to avoid problems with speculating into cache aliases.

Also all architectures that always use small page mappings for the
kernel and have non-coherent DMA should look into enabling this
scheme, as it is much more efficient than the vmap remapping.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
