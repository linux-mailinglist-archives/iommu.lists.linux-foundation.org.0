Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA220F249
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:09:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A20FB870A3;
	Tue, 30 Jun 2020 10:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYj4yDoIMYmB; Tue, 30 Jun 2020 10:09:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 510008709F;
	Tue, 30 Jun 2020 10:09:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA5AC016E;
	Tue, 30 Jun 2020 10:09:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1216FC016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 019BF8709F
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45wpF_yPR0Dc for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:09:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 699CA87060
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:09:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 88B422A7; Tue, 30 Jun 2020 12:09:49 +0200 (CEST)
Date: Tue, 30 Jun 2020 12:09:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: SUN50I_IOMMU should depend on HAS_DMA
Message-ID: <20200630100947.GL28824@8bytes.org>
References: <20200629121146.24011-1-geert@linux-m68k.org>
 <c2047394-ea6e-3bc3-4bf0-a732237dbeca@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2047394-ea6e-3bc3-4bf0-a732237dbeca@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org
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

On Mon, Jun 29, 2020 at 05:29:36PM +0100, Robin Murphy wrote:
> On 2020-06-29 13:11, Geert Uytterhoeven wrote:
> > If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):
> > 
> >      drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
> >      dma-iommu.c:(.text+0x92e): undefined reference to `dma_pgprot'
> > 
> > IOMMU_DMA must not be selected, unless HAS_DMA=y.
> 
> Wait, no, IOMMU_DMA should not be selected by drivers at all - it's for arch
> code to choose.

Okay, but that is a different fix, right? I queued this patch for v5.8
for now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
