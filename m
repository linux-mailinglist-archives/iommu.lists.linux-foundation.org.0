Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EF461F3
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 17:01:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 951C61393;
	Fri, 14 Jun 2019 15:01:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B85CF45
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 15:01:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4E009E5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 15:01:28 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-6-Ae-vvi9EMKOPr28p6sbQQA-1; Fri, 14 Jun 2019 16:01:23 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
	(fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Fri, 14 Jun 2019 16:01:22 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Fri, 14 Jun 2019 16:01:22 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>
Subject: RE: [PATCH 16/16] dma-mapping: use exact allocation in
	dma_alloc_contiguous
Thread-Topic: [PATCH 16/16] dma-mapping: use exact allocation in
	dma_alloc_contiguous
Thread-Index: AQHVIrfpTFjppS25RkWUhwqPPyqZ4qabLzdw///7eICAABIeYA==
Date: Fri, 14 Jun 2019 15:01:22 +0000
Message-ID: <d93fd4c2c1584d92a05dd641929f6d63@AcuMS.aculab.com>
References: <20190614134726.3827-1-hch@lst.de>
	<20190614134726.3827-17-hch@lst.de>
	<a90cf7ec5f1c4166b53c40e06d4d832a@AcuMS.aculab.com>
	<20190614145001.GB9088@lst.de>
In-Reply-To: <20190614145001.GB9088@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: Ae-vvi9EMKOPr28p6sbQQA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	David Airlie <airlied@linux.ie>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Intel Linux Wireless <linuxwifi@intel.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>
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

From: 'Christoph Hellwig'
> Sent: 14 June 2019 15:50
> To: David Laight
> On Fri, Jun 14, 2019 at 02:15:44PM +0000, David Laight wrote:
> > Does this still guarantee that requests for 16k will not cross a 16k boundary?
> > It looks like you are losing the alignment parameter.
> 
> The DMA API never gave you alignment guarantees to start with,
> and you can get not naturally aligned memory from many of our
> current implementations.

Hmmm...
I thought that was even documented.

I'm pretty sure there is a lot of code out there that makes that assumption.
Without it many drivers will have to allocate almost double the
amount of memory they actually need in order to get the required alignment.
So instead of saving memory you'll actually make more be used.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
