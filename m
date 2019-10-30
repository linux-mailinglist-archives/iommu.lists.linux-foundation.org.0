Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6CEA309
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 19:09:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4CF4DC91;
	Wed, 30 Oct 2019 18:09:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E7AEF16
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:09:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D703E876
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:09:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A18E468B05; Wed, 30 Oct 2019 19:09:21 +0100 (CET)
Date: Wed, 30 Oct 2019 19:09:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/2] dma-mapping: Add vmap checks to dma_map_single()
Message-ID: <20191030180921.GB19366@lst.de>
References: <20191029213423.28949-1-keescook@chromium.org>
	<20191029213423.28949-2-keescook@chromium.org>
	<20191030091849.GA637042@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030091849.GA637042@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>,
	Semmle Security Reports <security-reports@semmle.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Allison Randal <allison@lohutok.net>
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

On Wed, Oct 30, 2019 at 10:18:49AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Oct 29, 2019 at 02:34:22PM -0700, Kees Cook wrote:
> > As we've seen from USB and other areas[1], we need to always do runtime
> > checks for DMA operating on memory regions that might be remapped. This
> > adds vmap checks (similar to those already in USB but missing in other
> > places) into dma_map_single() so all callers benefit from the checking.
> > 
> > [1] https://git.kernel.org/linus/3840c5b78803b2b6cc1ff820100a74a092c40cbb
> > 
> > Suggested-by: Laura Abbott <labbott@redhat.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/dma-mapping.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > index 4a1c4fca475a..54de3c496407 100644
> > --- a/include/linux/dma-mapping.h
> > +++ b/include/linux/dma-mapping.h
> > @@ -583,6 +583,12 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
> >  static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
> >  		size_t size, enum dma_data_direction dir, unsigned long attrs)
> >  {
> > +	/* DMA must never operate on areas that might be remapped. */
> > +	if (dev_WARN_ONCE(dev, is_vmalloc_addr(ptr),
> > +			  "wanted %zu bytes mapped in vmalloc\n", size)) {
> > +		return DMA_MAPPING_ERROR;
> > +	}
> 
> That's a very odd error string, I know if I saw it for the first time, I
> would have no idea what it meant.  The USB message at least gives you a
> bit more context as to what went wrong and how to fix it.
> 
> How about something like "Memory is not DMA capabable, please fix the
> allocation of it to be correct", or "non-dma-able memory was attempted
> to be mapped, but this is impossible to to" or something else.

I've fixed the message to "rejecting DMA map of vmalloc memory" and
applied the patch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
