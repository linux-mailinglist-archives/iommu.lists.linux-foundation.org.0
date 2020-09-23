Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC122751FE
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 08:58:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C04C381D35;
	Wed, 23 Sep 2020 06:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-4TviGwiTS7; Wed, 23 Sep 2020 06:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 318DB80114;
	Wed, 23 Sep 2020 06:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F56CC0859;
	Wed, 23 Sep 2020 06:58:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E270EC0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 06:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DCE3685D57
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 06:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crKJeuBQa2ew for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 06:58:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D64285D26
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 06:58:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C68CA67373; Wed, 23 Sep 2020 08:58:08 +0200 (CEST)
Date: Wed, 23 Sep 2020 08:58:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: IOVA allocation dependency between firmware buffer and
 remaining buffers
Message-ID: <20200923065808.GA16366@lst.de>
References: <CAEC9eQOX9BHX4v5aY2cfCT=T-ZHA7y0xF7aiZhW9xzG4fme36Q@mail.gmail.com>
 <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
 <59cda41f-170c-a1ad-a345-bc38b9ed4d73@arm.com>
 <CGME20200424161534eucas1p29177cad5b4790d392acb69a335a3992e@eucas1p2.samsung.com>
 <CAOD6ATrWYLPT0ydz2vFhNwWhqHum_q_pyCe=oGJWOcEqjmNOqQ@mail.gmail.com>
 <11584d09-5995-6133-3bd3-8f7a0afd0e01@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11584d09-5995-6133-3bd3-8f7a0afd0e01@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: jean-philippe@linaro.org, will@kernel.org, linux-mm@kvack.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>,
 Shaik Ameer Basha <shaik.ameer@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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

On Wed, Sep 23, 2020 at 08:48:26AM +0200, Marek Szyprowski wrote:
> Hi Shaik,
> 
> I've run into similar problem while adapting S5P-MFC and Exynos4-IS 
> drivers for generic IOMMU-DMA framework. Here is my first solution: 
> https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/T/ 
> 
> 
> It allows to remap given buffer at the specific IOVA address, although 
> it doesn't guarantee that those specific addresses won't be later used 
> by the IOVA allocator. Probably it would make sense to add an API for 
> generic IOMMU-DMA framework to mark the given IOVA range as 
> reserved/unused to protect them.

If you want to use IOVA addresses in a device otherwise managed by
dma-iommu we need to expose an API through the dma API.  Can you please
include the iommu list in the discussion of your series?

I don't think using the raw IOMMU API is a very idea in these drivers,
we probably want a way to change the allocator algorithm or hint the
next IOVA and keep using the normal DMA API.  Maybe Robin has a better
idea.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
