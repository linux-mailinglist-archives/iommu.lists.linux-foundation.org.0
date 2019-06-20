Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 194704CC43
	for <lists.iommu@lfdr.de>; Thu, 20 Jun 2019 12:51:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAB4CC11;
	Thu, 20 Jun 2019 10:51:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82780255
	for <iommu@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 10:51:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16F55822
	for <iommu@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 10:51:56 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 558CF68B20; Thu, 20 Jun 2019 12:51:24 +0200 (CEST)
Date: Thu, 20 Jun 2019 12:51:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: use exact allocation for dma coherent memory
Message-ID: <20190620105124.GA25233@lst.de>
References: <20190614134726.3827-1-hch@lst.de> <20190617082148.GF28859@kadam>
	<20190617083342.GA7883@lst.de> <20190619162903.GF9360@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619162903.GF9360@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, devel@driverdev.osuosl.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	David Airlie <airlied@linux.ie>, Potnuri Bharat Teja <bharat@chelsio.com>,
	Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
	Intel Linux Wireless <linuxwifi@intel.com>,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6Mjk6MDNQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gWWVzLiAgVGhpcyB3aWxsIGJsb3cgdXAgYmFkbHkgb24gbWFueSBwbGF0Zm9y
bXMsIGFzIHNxLT5xdWV1ZQo+ID4gbWlnaHQgYmUgdm1hcHBlZCwgaW9yZW1hcHBlZCwgY29tZSBm
cm9tIGEgcG9vbCB3aXRob3V0IHBhZ2UgYmFja2luZy4KPiAKPiBHYWgsIHRoaXMgYWRkciBnZXRz
IGZlZCBpbnRvIGlvX3JlbWFwX3Bmbl9yYW5nZS9yZW1hcF9wZm5fcmFuZ2UgdG9vLi4KPiAKPiBQ
b3RudXJpLCB5b3Ugc2hvdWxkIGZpeCB0aGlzLi4gCj4gCj4gWW91IHByb2JhYmx5IG5lZWQgdG8g
dXNlIGRtYV9tbWFwX2Zyb21fZGV2X2NvaGVyZW50KCkgaW4gdGhlIG1tYXAgPwoKVGhlIGZ1bmN0
aW9uIHRvIHVzZSBpcyBkbWFfbW1hcF9jb2hlcmVudCwgZG1hX21tYXBfZnJvbV9kZXZfY29oZXJl
bnQgaXMKanVzdCBhbiBpbnRlcm5hbCBoZWxwZXIuCgpUaGF0IGJlacWLIHNhaWQgdGhlIGRyaXZl
cnMvaW5maW5pYmFuZCBjb2RlIGhhcyBhIGxvdCBvZgoqcmVtYXBfcGZuX3JhbmdlLCBhbmQgYSBs
b3Qgb2YgdGhlbSBsb29rIGxpa2UgdGhleSBtaWdodCBiZSBmb3IKRE1BIG1lbW9yeS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBs
aXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
