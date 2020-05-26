Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE11A23C8
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 16:07:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 771BD81F70;
	Wed,  8 Apr 2020 14:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adymj7wP+LOO; Wed,  8 Apr 2020 14:07:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47FA185A1D;
	Wed,  8 Apr 2020 14:06:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CE50C0177;
	Wed,  8 Apr 2020 14:06:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4866DC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 14:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3322B20412
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 14:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yxqd4hJDyw2 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 14:06:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 96E2D20035
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 14:06:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A412A2CC; Wed,  8 Apr 2020 16:06:50 +0200 (CEST)
Date: Wed, 8 Apr 2020 16:06:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/4] iommu: Add Allwinner H6 IOMMU driver
Message-ID: <20200408140649.GI3103@8bytes.org>
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
 <6864f0f28825bb7a2ec1c0d811a4aacdecf5f945.1582222496.git-series.maxime@cerno.tech>
 <20200302153606.GB6540@8bytes.org>
 <20200401114710.doioefzmjhte7jwu@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401114710.doioefzmjhte7jwu@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Hi Maxime,

On Wed, Apr 01, 2020 at 01:47:10PM +0200, Maxime Ripard wrote:
> As far as I understand it, the page table can be accessed concurrently
> since the framework doesn't seem to provide any serialization /
> locking, shouldn't we have some locks to prevent concurrent access?

The dma-iommu code makes sure that there are no concurrent accesses to
the same address-range of the page-table, but there can (and will) be
concurrent accesses to the same page-table, just for different parts of
the address space.

Making this lock-less usually involves updating non-leaf page-table
entries using atomic compare-exchange instructions.

> > > +	*pte_addr = sun50i_mk_pte(paddr, prot);
> > > +	sun50i_table_flush(sun50i_domain, pte_addr, 1);
> >
> > This maps only one page, right? But the function needs to map up to
> > 'size' as given in the parameter list.
> 
> It does, but pgsize_bitmap is set to 4k only (since the hardware only
> supports that), so we would have multiple calls to map, each time with
> a single page judging from:
> https://elixir.bootlin.com/linux/latest/source/drivers/iommu/iommu.c#L1948
> 
> Right?

Okay, you are right here. Just note that when this function is called
for every 4k page it should better be fast and avoid slow things like
TLB flushes.

> The vendor driver was doing something along those lines and I wanted
> to be conservative with the cache management if we didn't run into
> performances issues, but I'll convert to the iotlb callbacks then.

Yeah, that definitly helps performance.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
