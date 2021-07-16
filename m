Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 025723CB2AB
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 08:32:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2C583E49;
	Fri, 16 Jul 2021 06:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8ZH3h-33aX0; Fri, 16 Jul 2021 06:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EE9283E5B;
	Fri, 16 Jul 2021 06:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D325C000E;
	Fri, 16 Jul 2021 06:32:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85BE6C000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644D860D5F
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGB140f6EEB0 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 06:32:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF66E607A5
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:32:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2BDE767373; Fri, 16 Jul 2021 08:32:42 +0200 (CEST)
Date: Fri, 16 Jul 2021 08:32:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v1 14/16] x86/amd_gart: return error code from
 gart_map_sg()
Message-ID: <20210716063241.GC13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-15-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-15-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Niklas Schnelle <schnelle@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Bates <sbates@raithlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jul 15, 2021 at 10:45:42AM -0600, Logan Gunthorpe wrote:
> @@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  	iommu_full(dev, pages << PAGE_SHIFT, dir);
>  	for_each_sg(sg, s, nents, i)
>  		s->dma_address = DMA_MAPPING_ERROR;
> -	return 0;
> +	return ret;

While we're at it - setting the ->dma_address to DMA_MAPPING_ERROR is
not part of the ->map_sg calling convention.  Might be worth to fix
up while we're at it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
