Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1627439A
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 15:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31C9C8729E;
	Tue, 22 Sep 2020 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1lHzdYP62WG; Tue, 22 Sep 2020 13:56:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A32EE8724D;
	Tue, 22 Sep 2020 13:56:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A114C0051;
	Tue, 22 Sep 2020 13:56:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D632C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4AE958724D
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmBv+H7+esAZ for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 13:56:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11BB1871FF
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:56:52 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-191-B9hMLBLvPqyihacVwf7g7g-1; Tue, 22 Sep 2020 14:56:46 +0100
X-MC-Unique: B9hMLBLvPqyihacVwf7g7g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 22 Sep 2020 14:56:46 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 22 Sep 2020 14:56:46 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 3/3] dma-mapping: better document dma_addr_t and
 DMA_MAPPING_ERROR
Thread-Topic: [PATCH 3/3] dma-mapping: better document dma_addr_t and
 DMA_MAPPING_ERROR
Thread-Index: AQHWkOXa3XgKgm/pWkOhIuRYbHODmKl0rUBw
Date: Tue, 22 Sep 2020 13:56:46 +0000
Message-ID: <f9c37e5ff1cb4a02bff6d2a8d0ea2dcc@AcuMS.aculab.com>
References: <20200922134002.1227279-1-hch@lst.de>
 <20200922134002.1227279-4-hch@lst.de>
In-Reply-To: <20200922134002.1227279-4-hch@lst.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>
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

From: Christoph Hellwig
> Sent: 22 September 2020 14:40
...
> @@ -131,6 +125,16 @@ struct dma_map_ops {
>  	unsigned long (*get_merge_boundary)(struct device *dev);
>  };
> 
> +/*
> + * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
> + * be given to a device to use as a DMA source or target.  A CPU cannot
> + * reference a dma_addr_t directly because there may be translation between its
> + * physical address space and the bus address space.

It can't access it 'directly' because it isn't a virtual address....

> + *
> + * DMA_MAPPING_ERROR is the magic error code if a mapping failed.  It should not
> + * be used directly in drivers, but checked for using dma_mapping_error()
> + * instead.
> + */

I think it might be worth adding:

A dma_addr_t value may be device dependant and differ from the
'physical address' of the memory.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
