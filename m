Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 751892B2D04
	for <lists.iommu@lfdr.de>; Sat, 14 Nov 2020 13:10:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 299A6866C8;
	Sat, 14 Nov 2020 12:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rYVYILL+KRO; Sat, 14 Nov 2020 12:10:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CF7B86193;
	Sat, 14 Nov 2020 12:10:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F99CC0800;
	Sat, 14 Nov 2020 12:10:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE43FC0800
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A42FC86360
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 12:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsZ_YldV9iPh for <iommu@lists.linux-foundation.org>;
 Sat, 14 Nov 2020 12:10:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7748186352
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 12:10:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E83767373; Sat, 14 Nov 2020 13:10:06 +0100 (CET)
Date: Sat, 14 Nov 2020 13:10:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 2/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
Message-ID: <20201114121005.GA21068@lst.de>
References: <20201029015241.73920-1-aik@ozlabs.ru>
 <20201029015241.73920-3-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029015241.73920-3-aik@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
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

On Thu, Oct 29, 2020 at 12:52:41PM +1100, Alexey Kardashevskiy wrote:
> +EXPORT_SYMBOL_GPL(arch_dma_map_page_direct);

I've dropped the unused exports and applied the series to dma-mapping-for-next.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
