Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7574144
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 00:11:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BEE1159F;
	Wed, 24 Jul 2019 22:11:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4835215A5
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 22:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 47C848A7
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 22:11:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a15so47104719qtn.7
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 15:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ZiT1oQ3le6gupTI0pwbmKNqZ9qeZj4CLKlZRplQnTAY=;
	b=n4nioEFz0eEixhvC4LWBGQ4Uia1wSdk64JIohjbhC31AsDp4AK8OyscgSZOHxA0O2I
	WbzGvHYMb08gz5FkQS8YYr+uOmtsrlaPvU9xRgpDhm9WXD4LL9d1LHpmtG0tilftWCxJ
	WlEFyiKVlZR8DTNbqEX2WSdHMKFMWOOdQ+I+RebL424azA2rcUTEJTLjOEpfIPEnT+XQ
	KZRc0qg3ZeDJFWsxfKnyuIqtw+oZm1vqtr6EW2OHIQ86XMtFbSsh1Bt7X1oK1dd3fz03
	OTCvj5fWClJBQSAAm96kNAtUWaSryIP0o4Thw0U14tD6tmvUm064N8XptYXyYcFkpOYv
	Ts1g==
X-Gm-Message-State: APjAAAV73Dp9qLZXH/1LpigM8vliWpd6U+sTcEOYfbpEypP7HE6GYtGC
	WOFp+Us0OENKKNLIE7DM1YAwBA==
X-Google-Smtp-Source: APXvYqwsl34mAeI1ycJq/WD6DI4M1e7pIzRNfVQKDNOWFybfH6EBHoRGki9/ggsy5dsu/ZaP8T89Pw==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr59384146qte.69.1564006259498; 
	Wed, 24 Jul 2019 15:10:59 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	g54sm28199760qtc.61.2019.07.24.15.10.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 15:10:58 -0700 (PDT)
Date: Wed, 24 Jul 2019 18:10:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio/virtio_ring: Fix the dma_max_mapping_size call
Message-ID: <20190723114750-mutt-send-email-mst@kernel.org>
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-3-eric.auger@redhat.com>
	<e4a288f2-a93a-5ce4-32da-f5434302551f@arm.com>
	<20190723153851.GE720@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723153851.GE720@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jasowang@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com,
	Robin Murphy <robin.murphy@arm.com>
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

On Tue, Jul 23, 2019 at 05:38:51PM +0200, Christoph Hellwig wrote:
> On Mon, Jul 22, 2019 at 04:36:09PM +0100, Robin Murphy wrote:
> >> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> >> index c8be1c4f5b55..37c143971211 100644
> >> --- a/drivers/virtio/virtio_ring.c
> >> +++ b/drivers/virtio/virtio_ring.c
> >> @@ -262,7 +262,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev)
> >>   {
> >>   	size_t max_segment_size = SIZE_MAX;
> >>   -	if (vring_use_dma_api(vdev))
> >> +	if (vring_use_dma_api(vdev) && vdev->dev.dma_mask)
> >
> > Hmm, might it make sense to roll that check up into vring_use_dma_api() 
> > itself? After all, if the device has no mask then it's likely that other 
> > DMA API ops wouldn't really work as expected either.
> 
> Makes sense to me.

Christoph - would a documented API wrapping dma_mask make sense?
With the documentation explaining how users must
desist from using DMA APIs if that returns false ...


-- 
MST
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
