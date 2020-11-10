Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB72AD229
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 10:14:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 54F93204BC;
	Tue, 10 Nov 2020 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQNz3hndMtv8; Tue, 10 Nov 2020 09:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 83C47204BB;
	Tue, 10 Nov 2020 09:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57E56C016F;
	Tue, 10 Nov 2020 09:14:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC155C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B7943871C3
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-TOzy+YIPPN for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 09:14:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5AF1786FD4
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:14:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 352EF6736F; Tue, 10 Nov 2020 10:14:22 +0100 (CET)
Date: Tue, 10 Nov 2020 10:14:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Message-ID: <20201110091421.GA23707@lst.de>
References: <20201023063309.3472987-1-hch@lst.de>
 <20201103094643.GA18936@lst.de> <20201104140438.GA16892@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104140438.GA16892@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Stefano Stabellini <sstabellini@kernel.org>, Christoph Hellwig <hch@lst.de>
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

On Wed, Nov 04, 2020 at 09:04:38AM -0500, Konrad Rzeszutek Wilk wrote:
> On Tue, Nov 03, 2020 at 10:46:43AM +0100, Christoph Hellwig wrote:
> > ping?
> 
> Hopefully this goes through. I am in the process of testing it but ran
> into testing issues that I believe are unrelated.

Did you manage to make any progress?  This fixes an issue with the
new support for systems with DMA offsets in 5.10..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
