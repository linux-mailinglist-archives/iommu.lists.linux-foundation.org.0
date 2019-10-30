Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DF297EA346
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 19:26:18 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C5D8CD9;
	Wed, 30 Oct 2019 18:26:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9CE4B5F
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:26:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 704D787B
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:26:13 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so1370927plk.0
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=DtrACqPWLXMscKFC3fwao3dgzXOornE3kvjDu6sEkLA=;
	b=KiufJgbrRj86zsIMV1otcowQqEIoRGhhadz0y1H4HBU5AssCVh8qhcYYFYmDKdSq+S
	3WQhFQE3NXpBBvl5Dq+sqppxJ+6ZTiIVYrSB4h7tULFSM7DjtsCFkiE9aZZ8TRdkPfx2
	FXHuk3epmTxo8mMNAjdAagwx0oLzAv9l8YdjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DtrACqPWLXMscKFC3fwao3dgzXOornE3kvjDu6sEkLA=;
	b=M/9AOcXyJpx9N7tXksOmKGMzPY+abUv5GG3lIL28/CEA3gEbDyzL6Z5K7K1GxIPvrP
	Oc8JLq7rozQRjk1DSKg18UxOeO0zVHHvxXMiwkBPHCw/MP3V+4HAKlwsnmrd46mmVBwi
	1FLxfcUF+gIWRpeAqy5ru/yQWsytGKUW9oYLIFKJx+9ZekRAEzWbnKS+S9QilJpWK63S
	deLEWl65LCq2ZNMbxuFABxP9L96/eDEP4FstnVoW12jEwgbRApxiCZ8wNRt59b5A4ziv
	9jI4g0lgJLeJskoQ6kllc68uRgBGQCrtL4gsu6WG26TTHFG0z3h2biq1lUS+3g/9Bg/J
	fAKQ==
X-Gm-Message-State: APjAAAXO1Ps8avvxsLCgaTu5viB7smYDG/zKLFqjgaKbBXV/JKMOEx2j
	i1oyN8dRaSMtdMRnIDI/hlWdHA==
X-Google-Smtp-Source: APXvYqz+gOml2V+1TkezZQvv3jWGc6cqrvBZVedrnNeCwDK/e+32G9IWArX+9+GEEwDFFkiQOHkacQ==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
	bi10mr120764plb.56.1572459972890; 
	Wed, 30 Oct 2019 11:26:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	i16sm594315pfa.184.2019.10.30.11.26.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Oct 2019 11:26:11 -0700 (PDT)
Date: Wed, 30 Oct 2019 11:26:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 1/2] dma-mapping: Add vmap checks to dma_map_single()
Message-ID: <201910301125.A1DD6D5F53@keescook>
References: <20191029213423.28949-1-keescook@chromium.org>
	<20191029213423.28949-2-keescook@chromium.org>
	<20191030091849.GA637042@kroah.com> <20191030180921.GB19366@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030180921.GB19366@lst.de>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Semmle Security Reports <security-reports@semmle.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Allison Randal <allison@lohutok.net>
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

On Wed, Oct 30, 2019 at 07:09:21PM +0100, Christoph Hellwig wrote:
> On Wed, Oct 30, 2019 at 10:18:49AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Oct 29, 2019 at 02:34:22PM -0700, Kees Cook wrote:
> > > As we've seen from USB and other areas[1], we need to always do runtime
> > > checks for DMA operating on memory regions that might be remapped. This
> > > adds vmap checks (similar to those already in USB but missing in other
> > > places) into dma_map_single() so all callers benefit from the checking.
> > > 
> > > [1] https://git.kernel.org/linus/3840c5b78803b2b6cc1ff820100a74a092c40cbb
> > > 
> > > Suggested-by: Laura Abbott <labbott@redhat.com>
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  include/linux/dma-mapping.h | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > > index 4a1c4fca475a..54de3c496407 100644
> > > --- a/include/linux/dma-mapping.h
> > > +++ b/include/linux/dma-mapping.h
> > > @@ -583,6 +583,12 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
> > >  static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
> > >  		size_t size, enum dma_data_direction dir, unsigned long attrs)
> > >  {
> > > +	/* DMA must never operate on areas that might be remapped. */
> > > +	if (dev_WARN_ONCE(dev, is_vmalloc_addr(ptr),
> > > +			  "wanted %zu bytes mapped in vmalloc\n", size)) {
> > > +		return DMA_MAPPING_ERROR;
> > > +	}
> > 
> > That's a very odd error string, I know if I saw it for the first time, I
> > would have no idea what it meant.  The USB message at least gives you a
> > bit more context as to what went wrong and how to fix it.
> > 
> > How about something like "Memory is not DMA capabable, please fix the
> > allocation of it to be correct", or "non-dma-able memory was attempted
> > to be mapped, but this is impossible to to" or something else.
> 
> I've fixed the message to "rejecting DMA map of vmalloc memory" and
> applied the patch.

Great; thank you!

-- 
Kees Cook
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
