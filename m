Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E8589205220
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 14:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A511E8958A;
	Tue, 23 Jun 2020 12:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rw7PWX6a5Nut; Tue, 23 Jun 2020 12:13:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F54D89575;
	Tue, 23 Jun 2020 12:13:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29E47C016F;
	Tue, 23 Jun 2020 12:13:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77C84C016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 12:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 661A38958A
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 12:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysbTMnchBV5h for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 12:13:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B1E289575
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 12:13:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B182C68AEF; Tue, 23 Jun 2020 14:13:04 +0200 (CEST)
Date: Tue, 23 Jun 2020 14:13:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2] dma-remap: Align the size in dma_common_*_remap()
Message-ID: <20200623121304.GA20261@lst.de>
References: <20200623120755.27710-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623120755.27710-1-eric.auger@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: jean-philippe@linaro.org, bbhushan2@marvell.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 akpm@linux-foundation.org, eric.auger.pro@gmail.com, robin.murphy@arm.com,
 hch@lst.de
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

On Tue, Jun 23, 2020 at 02:07:55PM +0200, Eric Auger wrote:
> Running a guest with a virtio-iommu protecting virtio devices
> is broken since commit 515e5b6d90d4 ("dma-mapping: use vmap insted
> of reimplementing it"). Before the conversion, the size was
> page aligned in __get_vm_area_node(). Doing so fixes the
> regression.
> 
> Fixes: 515e5b6d90d4 ("dma-mapping: use vmap insted of reimplementing it")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Thanks,

I've applied this locally, waiting for git.infradead.org to be back
up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
