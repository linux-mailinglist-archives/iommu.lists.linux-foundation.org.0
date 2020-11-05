Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5262A782D
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 08:45:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1810E23067;
	Thu,  5 Nov 2020 07:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUzn15pE3qVw; Thu,  5 Nov 2020 07:44:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55F9822D24;
	Thu,  5 Nov 2020 07:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 388D2C088B;
	Thu,  5 Nov 2020 07:44:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3DA7C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C42B6839C1
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJk9BjPZwFS9 for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:44:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5AFE386214
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=sdDqJs+tyRqodiImj9cA2noijaJPm3lpR9cgqXfZnTc=; b=ZY41Diy6e0toQAP1LxcHY6dYBZ
 15YTUisplwNmkjfn3i8MJ1+CORNnL8XaNBpvaiOJnWiwIy6gRte5nTHGj1nT5ipDuV+I8GEQJfYSq
 MqbY40NYK66JCTYO84IGJH71Jlh5fdlKwOWKRTBi6KonLRKvfAhPV6Jj9Q3bbmB3vrN3BtNski31P
 81UvbgNgpEOHx4qAwuD5V+zfS7qJizXcOT1k3QKf2Hz0jTZZhsEn0oAJp3MTaHgMxGetRNOccmOI+
 HZI98W3p5DNY1ryVfwFdvLovBJ3VIpcVY+DIf+/UxBwdS3fV63FKXOsSubiivoNCrLHF3I/SWxQ5m
 q6oIQpwQ==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaZwP-0004Ud-Jn; Thu, 05 Nov 2020 07:44:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: remove dma_virt_ops v2
Date: Thu,  5 Nov 2020 08:41:59 +0100
Message-Id: <20201105074205.1690638-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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

Changes since v1:
 - disable software RDMA drivers for highmem configs
 - update the PCI commit logs
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
