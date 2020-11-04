Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4572A60F1
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 10:53:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C45E20530;
	Wed,  4 Nov 2020 09:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uonWTv7nn5v; Wed,  4 Nov 2020 09:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D93932049E;
	Wed,  4 Nov 2020 09:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAFE0C0051;
	Wed,  4 Nov 2020 09:53:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98AFFC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 60F252049E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXEGzrGpCz9T for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 09:53:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C5262043D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=10NYNDvXK47Xx4pemLtAWVco029+HRxpmX00NcH63GE=; b=NGo9ostWCiYg6sDnjnfEcDzzIu
 bw1JEU/3J8uJGjIQtQ3FGZ9lzz5hIabozqpexq5IduLABu5XJ2D0ympH0erezuMJAke3Q+N9+2j6y
 CQZarVzZ/0rhSi4bUrotHZGNaoSczpDABKXioE9c65Nxmn1Ccoe0A8LOAmfcZ2cUH8twiu62GDa/L
 l5fhVcQKYIfQKjkufFFoYGjsvK2Ox2oFBUmuutOyqSjOR3KNxhsbBO09mBu27EycME4Vq/ONGvnJp
 Ce2DQNYH/udzwjJIRM1gpsiIoXqJH24M/o6dZHhkX4lZ79dU0Es+bWJROyRq5sliVITz95pPA4/5A
 KK0kP2ww==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaFTT-0001yT-E1; Wed, 04 Nov 2020 09:53:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: remove dma_virt_ops
Date: Wed,  4 Nov 2020 10:50:47 +0100
Message-Id: <20201104095052.1222754-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>,
 linux-pci@vger.kernel.org
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

Hi Jason,

this series switches the RDMA core to opencode the special case of
devices bypassing the DMA mapping in the RDMA ULPs.  The virt ops
have caused a bit of trouble due to the P2P code node working with
them due to the fact that we'd do two dma mapping iterations for a
single I/O, but also are a bit of layering violation and lead to
more code than necessary.

Tested with nvme-rdma over rxe.

Diffstat:
 b/drivers/infiniband/core/device.c      |   41 +++++++-------
 b/drivers/infiniband/core/rw.c          |    2 
 b/drivers/infiniband/sw/rdmavt/Kconfig  |    3 -
 b/drivers/infiniband/sw/rdmavt/mr.c     |    6 --
 b/drivers/infiniband/sw/rdmavt/vt.c     |    8 --
 b/drivers/infiniband/sw/rxe/Kconfig     |    2 
 b/drivers/infiniband/sw/rxe/rxe_verbs.c |    7 --
 b/drivers/infiniband/sw/rxe/rxe_verbs.h |    1 
 b/drivers/infiniband/sw/siw/Kconfig     |    1 
 b/drivers/infiniband/sw/siw/siw.h       |    1 
 b/drivers/infiniband/sw/siw/siw_main.c  |    7 --
 b/drivers/pci/p2pdma.c                  |   25 ---------
 b/include/linux/dma-mapping.h           |    2 
 b/include/rdma/ib_verbs.h               |   88 ++++++++++++++------------------
 b/kernel/dma/Kconfig                    |    5 -
 b/kernel/dma/Makefile                   |    1 
 kernel/dma/virt.c                       |   61 ----------------------
 17 files changed, 66 insertions(+), 195 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
