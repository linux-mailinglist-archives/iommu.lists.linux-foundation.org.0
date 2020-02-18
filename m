Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75406162ED7
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 19:41:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7842F851FA;
	Tue, 18 Feb 2020 18:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRzHPNLJm7tx; Tue, 18 Feb 2020 18:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F46A851CC;
	Tue, 18 Feb 2020 18:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C549C1D8E;
	Tue, 18 Feb 2020 18:41:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50B74C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 40000862B7
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-i1ul0fsA2t for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 18:41:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 70D198621D
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1oMlAqkswRy6z1mHgxyhn28sxtzqgf7pOgIVPkyRZVw=; b=MSVWYxBsB6pwrCb63c9y7K9Eof
 CM3I0J+nMSxFYWJqUAxpLv8JD/I2seyhRqFKC5ZouzNomNp9OI6hSY+fkNbvM+DzrwQW05M7k8U51
 Yx+Rz6pjkDhoZmFjdmZUipxZgnLhfa6e/wN78P2XNdkfKFFVbA08jnhGdImDsPKHF9zisJZS5B0LE
 fJOy2Rrxmr1wh5MJBuRzIPWNplu6BtqS6wDC0pzYPaJarTqSWohHG/Ag63n2XKwavAVTvZr4zdqcs
 YcpyPhjXtGKB5AXHHt9plw6LHVjW3gqnGyy+QVFGsS7LvsWNVRPq3K30q9ihnIZca2nNTfgv9oK/x
 +wA31VUQ==;
Received: from [199.255.44.128] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j47oF-0002Ka-9J; Tue, 18 Feb 2020 18:41:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Russell King <linux@armlinux.org.uk>
Subject: take the bus_dma_limit into account on arm
Date: Tue, 18 Feb 2020 10:41:00 -0800
Message-Id: <20200218184103.35932-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Russell,

this series fixes the arm dma coherent allocator to take the bus dma
mask into account, similar to what other architectures do.  Without
this devices that support 64-bit mask, but are limited by the
interconnect won't work properly.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
