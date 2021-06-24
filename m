Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B33B2DAA
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 13:19:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3D183CF9;
	Thu, 24 Jun 2021 11:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXuPDUM18UXo; Thu, 24 Jun 2021 11:19:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E07E883CFB;
	Thu, 24 Jun 2021 11:19:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B27B9C0022;
	Thu, 24 Jun 2021 11:19:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8866DC000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 11:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C4B405FF
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 11:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHZFCB9uCAGs for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 11:19:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8592440456
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 11:19:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D5C7613C1;
 Thu, 24 Jun 2021 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624533547;
 bh=fyQk9K7V5mi+iulKCuVouHY96p/8l9exJzzlUIeSpn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bw4AVsGwRrbnlqsX5CZZBCGVkLRWbVSBBROzH0cW0WxgQnoyiN2SkbZT9Y0qsOq8u
 JL8IIrlYNHTHfBROv+myGIoSXn3V0Qajeyu6WrQ15CejRET9x4mwWpuBCwWkKgfe+I
 +cOMFFna8tPSjLTq48KMyVkK5wGgtDdocNICZALKyCcFBQrrDac4GVZrs41lrwovdH
 A7+mTUl4b8SpYL5RZSXQGAdCk4J4xBM23HuRVgN0YiE8QMME9/0wtATNSKneCXnM3U
 aM6IUBXxfGBIajg731amXfhwP7wHdtJMySWai/ROQfVX1amjwBJVAnH3akjkMUY271
 lYvk5WkbaBLcQ==
Date: Thu, 24 Jun 2021 12:18:56 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210624111855.GA1382@willie-the-truck>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
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

On Thu, Jun 24, 2021 at 12:14:39PM +0100, Robin Murphy wrote:
> On 2021-06-24 07:05, Claire Chang wrote:
> > On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> > > > is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> > > > 
> > > > is_swiotlb_force_bounce() was the new function introduced in this patch here.
> > > > 
> > > > +static inline bool is_swiotlb_force_bounce(struct device *dev)
> > > > +{
> > > > +     return dev->dma_io_tlb_mem->force_bounce;
> > > > +}
> > > 
> > > To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
> > > turn this into :
> > > 
> > >          return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
> > > 
> > > for a quick debug check?
> > 
> > I just realized that dma_io_tlb_mem might be NULL like Christoph
> > pointed out since swiotlb might not get initialized.
> > However,  `Unable to handle kernel paging request at virtual address
> > dfff80000000000e` looks more like the address is garbage rather than
> > NULL?
> > I wonder if that's because dev->dma_io_tlb_mem is not assigned
> > properly (which means device_initialize is not called?).
> 
> What also looks odd is that the base "address" 0xdfff800000000000 is held in
> a couple of registers, but the offset 0xe looks too small to match up to any
> relevant structure member in that dereference chain :/

FWIW, I've managed to trigger a NULL dereference locally when swiotlb hasn't
been initialised but we dereference 'dev->dma_io_tlb_mem', so I think
Christoph's suggestion is needed regardless. But I agree that it won't help
with the issue reported by Qian Cai.

Qian Cai: please can you share your .config and your command line?

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
