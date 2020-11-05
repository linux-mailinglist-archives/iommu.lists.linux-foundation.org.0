Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6922A8463
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 18:03:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BEFAE232D2;
	Thu,  5 Nov 2020 17:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SksLjOy7uusK; Thu,  5 Nov 2020 17:03:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F33A22041A;
	Thu,  5 Nov 2020 17:03:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC514C088B;
	Thu,  5 Nov 2020 17:03:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3AF5C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8DA123077
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzqqnjhidQCE for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 17:03:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 67FBA2041A
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:03:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1537568B02; Thu,  5 Nov 2020 18:03:29 +0100 (CET)
Date: Thu, 5 Nov 2020 18:03:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/6] RMDA/sw: don't allow drivers using dma_virt_ops on
 highmem configs
Message-ID: <20201105170328.GB7502@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-2-hch@lst.de> <20201105144123.GB4142106@ziepe.ca>
 <74729b8d-146f-803a-98a3-e8149bd97e34@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74729b8d-146f-803a-98a3-e8149bd97e34@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <bhelgaas@google.com>, Bernard Metzler <bmt@zurich.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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

On Thu, Nov 05, 2020 at 03:29:58PM +0000, Robin Murphy wrote:
> It's commonly done using the "def_bool" shorthand. I fact, I think simply 
> "def_bool !HIGHMEM" would suffice for the fundamental definition here.

Indeed, I'll switch it over.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
