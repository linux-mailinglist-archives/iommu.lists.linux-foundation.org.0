Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EE2A84C7
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 18:24:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A85785F8E;
	Thu,  5 Nov 2020 17:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBtLk8bzttl1; Thu,  5 Nov 2020 17:24:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD1E785EF2;
	Thu,  5 Nov 2020 17:24:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA129C0889;
	Thu,  5 Nov 2020 17:24:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A608C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 23B1185F8E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQuda2KZLYqk for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 17:23:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68C9585EF2
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:23:59 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 140so1901705qko.2
 for <iommu@lists.linux-foundation.org>; Thu, 05 Nov 2020 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2B5gOlL5nEl3XjpJXMg7If7oslzOmLgcHQpHnMqi7Hw=;
 b=C9SYVaVvboE1sfIPHmPX7gvl6UpySnTrFzNjFxz3UU9PoltRnebJp1lAGGxgFK+jUY
 hH2EuRWrxVBu7IenA2OO7GEDJPKQMYJ/h6u6H4cItN52gW2Qp3oHb+FX2saxv4x2efM3
 dIkbh/sWZ/IxXCkGnFmrQNsR5nUGKskdqTfhXQBQ0Oag6Ii2M7NbC/PeER8GLAVajf+4
 uyHlLSd+YrCUGmuqrSDlDuszLEz0Jdtq5vEDaeWazHVQFFLO5hKjBDYStoisxZ5xmObW
 FUic7YJQHNn1Tgp25ObdqwT5FaSQez+ILUc7djoCSNFCNsqOuYHkm6ZEEJ8WCLaC4RJF
 k0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2B5gOlL5nEl3XjpJXMg7If7oslzOmLgcHQpHnMqi7Hw=;
 b=W5XGvfCsI8Iy6UctfkABs0qUMt4K6jW5sy9vgdnBbGfP4GAqT/9Ixoq7GlCKYQ67lv
 +MqlQIeANyn4kQouiRVnT5G2+XHSScUyGKcd9AgyKisIobJGsTd1SfTsRoOmirwxzbOE
 UT0hOTofmaeGSxkIEADw1Qr7D5parsoibwf7wuT4U/vbf7/XIkfuEdU+MFT9CkDemnGj
 51yIEnBUA2KjhBpdZtTykNU6FazlSCWebP9KzGy9VRXQz3kIzv+Si+lS3id7Qwpl+mou
 d/VfYHzCF14iHVtojfuruowhmpclqY+PRIf9ELoNaeqjjC2stOdX6k8svccjNaxc7vUY
 6SSQ==
X-Gm-Message-State: AOAM531iSinYOPfh+Lzu9b5anbFkMEf29gwoi+z4HYHmq3FiOgix/IvE
 8itDI7JgqR6Uu7Y9vLB5N2Fkbg==
X-Google-Smtp-Source: ABdhPJyZP8gOea6uCcCox3ZqvL5WisJsd8QV4kBs1sNsfV16ZBsIwlbJYUZDhA73Ep/Bt+jQ7nomOA==
X-Received: by 2002:a05:620a:21c4:: with SMTP id
 h4mr2759256qka.242.1604597038375; 
 Thu, 05 Nov 2020 09:23:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h82sm1404189qke.109.2020.11.05.09.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:23:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaizN-0008S7-4l; Thu, 05 Nov 2020 13:23:57 -0400
Date: Thu, 5 Nov 2020 13:23:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/6] PCI/P2PDMA: Remove the DMA_VIRT_OPS hacks
Message-ID: <20201105172357.GE36674@ziepe.ca>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-5-hch@lst.de>
 <20201105143418.GA4142106@ziepe.ca> <20201105170816.GC7502@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105170816.GC7502@lst.de>
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDY6MDg6MTZQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMTA6MzQ6MThBTSAtMDQwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gVGhlIGNoZWNrIGlzIHJlbW92ZWQgaGVyZSwgYnV0IEkg
ZGlkbid0IHNlZSBhIG1hdGNoaW5nIGNoZWNrIGFkZGVkIHRvCj4gPiB0aGUgSUIgc2lkZT8gU29t
ZXRoaW5nIGxpa2U6Cj4gPiAKPiA+IHN0YXRpYyBpbnQgcmRtYV9yd19tYXBfc2coc3RydWN0IGli
X2RldmljZSAqZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLAo+ID4gCQkJICB1MzIgc2dfY250
LCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCj4gPiB7Cj4gPiAJaWYgKGlzX3BjaV9wMnBk
bWFfcGFnZShzZ19wYWdlKHNnKSkpIHsKPiA+IAkJaWYgKGliX3VzZXNfdmlydF9kbWEoZGV2KSkK
PiA+IAkJCXJldHVybiAwOwo+ID4gCQlyZXR1cm4gcGNpX3AycGRtYV9tYXBfc2coZGV2LT5kbWFf
ZGV2aWNlLCBzZywgc2dfY250LCBkaXIpOwo+ID4gCX0KPiA+IAlyZXR1cm4gaWJfZG1hX21hcF9z
ZyhkZXYsIHNnLCBzZ19jbnQsIGRpcik7Cj4gPiB9Cj4gCj4gV2Ugc2hvdWxkIG5ldmVyIGdldCBh
IFAyUCBwYWdlIGludG8gdGhlIHJkbWFfcndfbWFwX3NnIG9yIG90aGVyIGliX2RtYSoKPiByb3V0
aW5lcyBmb3IgdGhlIHNvZnR3YXJlIGRyaXZlcnMsIGFzIHRoZWlyIHN0cnVjdCBkZXZpY2VzIGRv
bid0IGNvbm5lY3QKPiB0byBhIFBD0IYgZGV2aWNlIHVuZGVybmVhdGgsIGFuZCB0aHVzIG5vIHZh
bGlkIFAyUCBkaXN0YW5jZSBjYW4gYmUKPiByZXRvdXJuZWQuICAKCkJ1dCB0aGF0IGRlcGVuZHMg
b24gdGhlIGNhbGxpbmcgZHJpdmVyIGRvaW5nIHRoaXMgcHJvcGVybHksIGFuZCB3ZQpkb24ndCBl
eHBvc2UgYW4gQVBJIHRvIGdldCB0aGUgUENJIGRldmljZSBvZiB0aGUgc3RydWN0IGliX2Rldmlj
ZQouLiBob3cgZG9lcyBudm1lIGV2ZW4gd29yayBoZXJlPwoKSWYgd2UgY2FuJ3QgZ2V0IGhlcmUg
dGhlbiB3aHkgZGlkIHlvdSBhZGQgdGhlIGNoZWNrIHRvIHRoZSB1bm1hcCBzaWRlPwoKV2h5IGRp
ZCB0aGlzIGNvZGUgaW4gcDJwZG1hIGV4aXN0IGF0IGFsbD8KCj4gVGhhdCBiZWluZyBzYWlkIElG
RiB3ZSB3YW50IHRvIGltcGxlbWVudCBQMlAgZm9yIHRob3NlIHdlJ2QgbmVlZAo+IHNvbWV0aGln
biBsaWtlIHRoZSBhYm92ZSBjaGVjaywgZXhjZXB0IHRoYXQgd2Ugc3RpbGwgbmVlZCB0byBjYWwK
PiBpYl9kbWFfbWFwX3NnLCBpLmUuOgo+IAo+IHN0YXRpYyBpbnQgcmRtYV9yd19tYXBfc2coc3Ry
dWN0IGliX2RldmljZSAqZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLAo+ICAJCQkgIHUzMiBz
Z19jbnQsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiB7Cj4gCWlmIChpc19wY2lfcDJw
ZG1hX3BhZ2Uoc2dfcGFnZShzZykpICYmICFpYl91c2VzX3ZpcnRfZG1hKGRldikpCj4gCQlyZXR1
cm4gcGNpX3AycGRtYV9tYXBfc2coZGV2LT5kbWFfZGV2aWNlLCBzZywgc2dfY250LCBkaXIpOwo+
IAlyZXR1cm4gaWJfZG1hX21hcF9zZyhkZXYsIHNnLCBzZ19jbnQsIGRpcik7Cj4gfQoKVGhlIFNX
IGRyaXZlcnMgY2FuJ3QgaGFuZGxlIFBDSSBwYWdlcyBhdCBhbGwsIHRoZXkgYXJlIGdvaW5nIHRv
IHRyeSB0bwptZW1jcHkgdGhlbSBvciBzb21ldGhpbmcgZWxzZSBub3QgX19pb21lbSwgc28gd2Ug
cmVhbGx5IGRvIG5lZWQgdG8KcHJldmVudCBQMlAgcGFnZXMgZ29pbmcgaW50byB0aGVtLgoKSmFz
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
