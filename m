Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 86718708F8
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 20:57:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3B41ECD1;
	Mon, 22 Jul 2019 18:57:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C5CA86D
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:57:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 350C0FE
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 18:57:11 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id k9so26985947vso.5
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 11:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=G3LydhjrGZyGaJaE+altqgbzUT7GXQbjY/6XoX/pvZc=;
	b=UCjyJ5iG6TBjqwQIK1bUzkVef4QEuzMC6QwDyDXLgPLDmprX6RQXBR01vWahktfBeb
	0WoMSGmq7WFd6efmvoytx/9/AMP3+QmR0loTDxjKbPM8ZcyLYw7zwLis8qvvXbgLBZl8
	jJAJCCmFnyaraKTw9wL41a8thpRsGaBXr8m1Dc0FUP8OHvOVK3b4EUxEXt31LkPFX+fn
	+lwbpKjR6DuocEmwiyISydWR58YBPkKeyTiBiuKiQxCER2xRV5HeARRsEsNdbI8sa4YL
	zRu7GWvmsgd4i2ux7ZGeA4pweqEufsVovXPRvnROEVsCiz42wQNZ0ismDY9BMYUQ0Ip1
	LxAw==
X-Gm-Message-State: APjAAAWpLx7jvDBRCk/yt7avjJXtMHsehwmk1j59WcrymBHykfNltJ7W
	ZQNnbHp0p8pOZOl/uTXQUC/1lQ==
X-Google-Smtp-Source: APXvYqzW0y3QVeCN9/3wXCNVqVYfu/ELakwZssJ444dY3sQr1CJFwY193H4yB3WcP4zsonz0yfKcug==
X-Received: by 2002:a67:8c84:: with SMTP id
	o126mr44506592vsd.122.1563821830405; 
	Mon, 22 Jul 2019 11:57:10 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	l129sm38783525vki.45.2019.07.22.11.57.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 11:57:09 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:57:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2] dma-mapping: Use dma_get_mask in dma_addressing_limited
Message-ID: <20190722145639-mutt-send-email-mst@kernel.org>
References: <20190722165149.3763-1-eric.auger@redhat.com>
	<77ba1061-08b6-421e-a6dd-d5db9851325b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77ba1061-08b6-421e-a6dd-d5db9851325b@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jasowang@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	robin.murphy@arm.com, hch@lst.de
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

On Mon, Jul 22, 2019 at 06:56:49PM +0200, Auger Eric wrote:
> Hi Christoph,
> 
> On 7/22/19 6:51 PM, Eric Auger wrote:
> > We currently have cases where the dma_addressing_limited() gets
> > called with dma_mask unset. This causes a NULL pointer dereference.
> > 
> > Use dma_get_mask() accessor to prevent the crash.
> > 
> > Fixes: b866455423e0 ("dma-mapping: add a dma_addressing_limited helper")
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> As a follow-up of my last email, here is a patch featuring
> dma_get_mask(). But you don't have the WARN_ON_ONCE anymore, pointing
> out suspect users.

OTOH these users then simply become okay so no need for WARN_ON_ONCE
then :)

> Feel free to pick up your preferred approach
> 
> Thanks
> 
> Eric
> > 
> > ---
> > 
> > v1 -> v2:
> > - was [PATCH 1/2] dma-mapping: Protect dma_addressing_limited
> >   against NULL dma_mask
> > - Use dma_get_mask
> > ---
> >  include/linux/dma-mapping.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > index e11b115dd0e4..f7d1eea32c78 100644
> > --- a/include/linux/dma-mapping.h
> > +++ b/include/linux/dma-mapping.h
> > @@ -689,8 +689,8 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
> >   */
> >  static inline bool dma_addressing_limited(struct device *dev)
> >  {
> > -	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
> > -		dma_get_required_mask(dev);
> > +	return min_not_zero(dma_get_mask(dev), dev->bus_dma_mask) <
> > +			    dma_get_required_mask(dev);
> >  }
> >  
> >  #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
> > 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
