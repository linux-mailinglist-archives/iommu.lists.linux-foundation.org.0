Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40107FB499
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 17:03:54 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D494E2A;
	Wed, 13 Nov 2019 16:03:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86773D99
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 16:03:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02935102
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 16:03:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 830D068AFE; Wed, 13 Nov 2019 17:03:44 +0100 (CET)
Date: Wed, 13 Nov 2019 17:03:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: remove DMA_ATTR_WRITE_BARRIER
Message-ID: <20191113160344.GA12853@lst.de>
References: <20191113073214.9514-1-hch@lst.de>
	<20191113154712.GF21728@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113154712.GF21728@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Wed, Nov 13, 2019 at 03:47:18PM +0000, Jason Gunthorpe wrote:
> On Wed, Nov 13, 2019 at 08:32:12AM +0100, Christoph Hellwig wrote:
> > There is no implementation of the DMA_ATTR_WRITE_BARRIER flag left
> > now that the ia64 sn2 code has been removed.  Drop the flag and
> > the calling convention to set it in the RDMA code.
> 
> This looks OK, do you want it to go through the RDMA tree?

Either the dma-mapping or rdma tree is fine with me.  I guess
there are more potential conflicts with rdma changes, so tht might
be the better choice.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
