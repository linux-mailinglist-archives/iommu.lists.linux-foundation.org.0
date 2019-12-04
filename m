Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E91112C33
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 14:03:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85DE48835C;
	Wed,  4 Dec 2019 13:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8HVd7nznQg7; Wed,  4 Dec 2019 13:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D14E087D7C;
	Wed,  4 Dec 2019 13:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99A81C077D;
	Wed,  4 Dec 2019 13:03:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A750EC077D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A365C20384
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ks55OdiZpgz4 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:03:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id DCFFF2000A
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAw+exV6zFNd79GLsJ/i683SHwBX9ctSDVhWZEuWOOo=; b=V9NFCvdSmtkVG2Erzr/1Lg4wA
 WPk5PvNGR+PQCfY+6HS/6i3CBsIjfOt6+DqPNrwPgGaILBpaSAkNwQZfiGFUaB395Bw1IhWlq6RUz
 R3w7Z94R6RpKPBBGEzWa8KS1dfIgd1C1Sqg6a8HFsNgQcP9hE3s1/ufXIdaFr81MhT0h+YzUlQleV
 pPyNAzssNUd0iT3dSLt71WgPiSL/hnwhYhosH3jrPywToVGSq96EJXlYPYLtqlQZLCnHn2wF1vf2J
 R3oHrIsvK2sKKA3k0Eh2MY75cpD1mqJu3LQ6Zr0I/MDcGmpgTRK90NOWRIy6E6duNqMMR5OJigo7m
 AACJbWy5A==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icUJi-000462-KO; Wed, 04 Dec 2019 13:03:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: make dma_addressing_limited work for memory encryption setups v2
Date: Wed,  4 Dec 2019 14:03:37 +0100
Message-Id: <20191204130339.22804-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
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

Hi all,

this little series fixes dma_addressing_limited to return true for
systems that use bounce buffers due to memory encryption.

Changes since v1:
 - take SWIOTLB_FORCE into account
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
