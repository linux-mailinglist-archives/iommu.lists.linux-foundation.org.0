Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453A2A9BE3
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 19:20:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C213386CA6;
	Fri,  6 Nov 2020 18:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLz5WMzqwWcU; Fri,  6 Nov 2020 18:20:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C67486C7B;
	Fri,  6 Nov 2020 18:20:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7418FC0889;
	Fri,  6 Nov 2020 18:20:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59054C1AD7
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A0678754A
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF76fsmNWpHl for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 18:20:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5A3A387546
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mhhxrFElh9XAgV4r8RFj88/oUF482qQDia6CDAfPp3A=; b=KCAgJkpPBd9RbBwfVfsiJt0bEJ
 vxkKj002ZBPd2P4huLXRf8se6b/AMgfHdQC4Jif8H9VV11DJTges84PlTFMq9Gxd6mEGgewd6tjni
 nDf7nkqnXhZzn+juogWqBHHKuId1j3g+1qtmG4XtBTUy6DDpC8W14PhXMUSBV0k6AVTssAr63HWo6
 6OWkHKrcXo1uJc0JjuvSdpWcXlfZ5Kzr45BEUEV/eMt6dU6eC7x9IP5DFWL6bvH4I4ZWFanhg2CYU
 Pz1ARAf3UPw/f2fJrrD89wiVfEzmsglTYRLYVvoesZu2zKuVIfY3wO0o+9Wf3caS8D42QR0HBVref
 7x/GANHQ==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb6Kt-0005cf-2Y; Fri, 06 Nov 2020 18:19:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: remove dma_virt_ops v2
Date: Fri,  6 Nov 2020 19:19:31 +0100
Message-Id: <20201106181941.1878556-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
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

Note that the rds changes are untested, as I could not find any
simple rds test setup.

Changes since v2:
 - simplify the INFINIBAND_VIRT_DMA dependencies
 - add a ib_uses_virt_dma helper
 - use ib_uses_virt_dma in nvmet-rdma to disable p2p for virt_dma devices
 - use ib_dma_max_seg_size in umem
 - stop using dmapool in rds

Changes since v1:
 - disable software RDMA drivers for highmem configs
 - update the PCI commit logs
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
