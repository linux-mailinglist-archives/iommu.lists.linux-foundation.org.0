Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9AAA195
	for <lists.iommu@lfdr.de>; Thu,  5 Sep 2019 13:36:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1DE0AFEA;
	Thu,  5 Sep 2019 11:36:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D39CAFEA
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:36:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F1AFA9
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PcPa5IlnDPH8tm4OAmhfwwgRlNISzvs+UWn9umBpAfg=;
	b=oHktuR8r49WzS31A+UiLvH2Z1
	NOyMpC+gF++rhCh0op7LqLwwAWVUNUm2SQ9KmfLw9Pn/jUxylg5DwsGYh3+9dzQi14KQdNMBbj9oc
	doMl3phBErpwrkl1GIePI1UGZRc2kIdHNs44uBX4QikSp831ZWfdwCW4SV0WZ2Dnd43ncD/uZM+J2
	/Rw7f9H5PeR8pjZMTjToV/ZWxAE/xpX2xJSe5VGnQdi5AWvDDfwFt8fHgPIJMw1JPMcO2WHpzvs14
	eaEIYtaQygNOOsdigW27oG6DgRt17ieKZVa5HK7Ouw9qXpBM1CF3SwzHnSMOjBiYRp+Lhz2szCjNB
	xKIvE8g0w==;
Received: from 213-225-38-191.nat.highway.a1.net ([213.225.38.191]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i5q3o-0001wn-Rm; Thu, 05 Sep 2019 11:36:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
	boris.ostrovsky@oracle.com
Subject: swiotlb-xen cleanups v4
Date: Thu,  5 Sep 2019 13:33:57 +0200
Message-Id: <20190905113408.3104-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
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

Hi Xen maintainers and friends,

please take a look at this series that cleans up the parts of swiotlb-xen
that deal with non-coherent caches.


Changes since v3:
 - don't use dma_direct_alloc on x86

Changes since v2:
 - further dma_cache_maint improvements
 - split the previous patch 1 into 3 patches

Changes since v1:
 - rewrite dma_cache_maint to be much simpler
 - improve various comments and commit logs
 - remove page-coherent.h entirely
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
