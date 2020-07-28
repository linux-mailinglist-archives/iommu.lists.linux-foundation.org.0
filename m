Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E000B230DCE
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 17:29:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EE1686A79;
	Tue, 28 Jul 2020 15:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h96L1CNh1QH5; Tue, 28 Jul 2020 15:29:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EAE384C26;
	Tue, 28 Jul 2020 15:29:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F084C004D;
	Tue, 28 Jul 2020 15:29:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ED91C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 76F2487F83
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpXLboOt2P0D for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 15:29:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 20D3587F4A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 15:29:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8B11E68B05; Tue, 28 Jul 2020 17:28:56 +0200 (CEST)
Date: Tue, 28 Jul 2020 17:28:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 1/2] dma-pool: fix coherent pool allocations for IOMMU
 mappings
Message-ID: <20200728152856.GA16545@lst.de>
References: <20200728104742.422960-1-hch@lst.de>
 <20200728104742.422960-2-hch@lst.de>
 <0c602a1d887d0fe38857e21aa963d51f5c772661.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c602a1d887d0fe38857e21aa963d51f5c772661.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Amit Pundir <amit.pundir@linaro.org>, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Jul 28, 2020 at 04:56:29PM +0200, Nicolas Saenz Julienne wrote:
> > +	phys = gen_pool_virt_to_phys(pool, addr);
> > +	if (!phys_addr_ok(dev, phys, size)) {
> 
> Shoudn't we check if phys_addr_ok() != NULL?

Yes, we should.  This also means the system that causes problems for
Amit isn't using the iommu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
