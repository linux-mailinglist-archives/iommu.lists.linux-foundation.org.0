Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A73E5147
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 05:02:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A29833DB;
	Tue, 10 Aug 2021 03:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBdeMlrpGk6v; Tue, 10 Aug 2021 03:02:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8126383419;
	Tue, 10 Aug 2021 03:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7519AC0025;
	Tue, 10 Aug 2021 03:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4E20C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 03:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D31054015B
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 03:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQYEMbgW23Kq for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 03:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAFFB400F8
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 03:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628564550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaO6ycaF20ZgcRI3wGSVNh4K2MMhBW7g6tA5PypVq9o=;
 b=TXK4yjPkiJz+2fIBZ2txcrImcJ8gFHsmE7TBf9iRDeUyw/1PLE0FmVwjxFGufRuewucUKr
 H8cF9RcEcjocn6Omn/CbIENlSsC1wtITjfro6xQSRnfaLua6R+WBI3vL4YVahydUHhOS4G
 VuBWxrUhRZRAcQUqUB6T5aPrjPoQa5w=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-EzkRtGn6OuSw49ZhpunG8w-1; Mon, 09 Aug 2021 23:02:27 -0400
X-MC-Unique: EzkRtGn6OuSw49ZhpunG8w-1
Received: by mail-pl1-f200.google.com with SMTP id
 p5-20020a170902a405b029012cbb4fcc03so9570169plq.19
 for <iommu@lists.linux-foundation.org>; Mon, 09 Aug 2021 20:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oaO6ycaF20ZgcRI3wGSVNh4K2MMhBW7g6tA5PypVq9o=;
 b=K+rzvMFFTi1WJvrJjW0yvn/50QaxLmp21W9rqkiQcOOgMMtFUh4vFhy9lMJkL8yZ4n
 c73koONsYXQAsqdrK1Be/BZH30M2GY3zbH2kE3ObXy7msrfern995eyVEuBIrJk1TaVT
 36//A1M+PNk9mLQXr7mepDu69IpgNFkPz6oof87rnXziELk2wWB5KREJzhLampEE75OM
 KxNwy7iIWR5qnzdK1/JALO/PUVreKkocrRex5ycWmmTor8T/Nazt36rNanVa5U69Ryy0
 +PHO5FQl8QOenhRD6WACHjoQnYg7vuAFLmIRwfEJXE24PtdbP7Sa/vxAbCQ/TwBPSO48
 m5Ng==
X-Gm-Message-State: AOAM531h4RsdqGIum1lMRDZctrDCTWbXGJvdltRnHCgQce8rrqGZ7Zv4
 0XlteURnAEg1F0mXolQr58QA1HWqTpdjiQM8cW067RkWvI48XHF9cEDudVrx80vCWCHJCGZjpsx
 XEW+cLXgwMnfElloKGol0G7q5Xs+1jQ==
X-Received: by 2002:a63:f754:: with SMTP id f20mr131593pgk.385.1628564546406; 
 Mon, 09 Aug 2021 20:02:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4iIBidP48y9gv61bBqE2YoRFI1FZjnrIQXCCS9iv1FkdxvVNARb2MOe/u6xBBvn1K8bmYbw==
X-Received: by 2002:a63:f754:: with SMTP id f20mr131560pgk.385.1628564546126; 
 Mon, 09 Aug 2021 20:02:26 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z18sm17386165pfn.88.2021.08.09.20.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 20:02:25 -0700 (PDT)
Subject: Re: [PATCH v10 01/17] iova: Export alloc_iova_fast() and
 free_iova_fast()
To: Yongji Xie <xieyongji@bytedance.com>, Robin Murphy <robin.murphy@arm.com>
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-2-xieyongji@bytedance.com>
 <43d88942-1cd3-c840-6fec-4155fd544d80@redhat.com>
 <CACycT3vcpwyA3xjD29f1hGnYALyAd=-XcWp8+wJiwSqpqUu00w@mail.gmail.com>
 <6e05e25e-e569-402e-d81b-8ac2cff1c0e8@arm.com>
 <CACycT3sm2r8NMMUPy1k1PuSZZ3nM9aic-O4AhdmRRCwgmwGj4Q@mail.gmail.com>
 <417ce5af-4deb-5319-78ce-b74fb4dd0582@arm.com>
 <CACycT3vARzvd4-dkZhDHqUkeYoSxTa2ty0z0ivE1znGti+n1-g@mail.gmail.com>
 <8c381d3d-9bbd-73d6-9733-0f0b15c40820@redhat.com>
 <CACycT3steXFeg7NRbWpo2J59dpYcumzcvM2zcPJAVe40-EvvEg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b427cf12-2ff6-e5cd-fe6a-3874d8622a29@redhat.com>
Date: Tue, 10 Aug 2021 11:02:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACycT3steXFeg7NRbWpo2J59dpYcumzcvM2zcPJAVe40-EvvEg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 He Zhe <zhe.he@windriver.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

CuWcqCAyMDIxLzgvOSDkuIvljYgxOjU2LCBZb25namkgWGllIOWGmemBkzoKPiBPbiBUaHUsIEF1
ZyA1LCAyMDIxIGF0IDk6MzEgUE0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IOWcqCAyMDIxLzgvNSDkuIvljYg4OjM0LCBZb25namkgWGllIOWGmemBkzoKPj4+
PiBNeSBtYWluIHBvaW50LCB0aG91Z2gsIGlzIHRoYXQgaWYgeW91J3ZlIGFscmVhZHkgZ290IHNv
bWV0aGluZyBlbHNlCj4+Pj4ga2VlcGluZyB0cmFjayBvZiB0aGUgYWN0dWFsIGFkZHJlc3Nlcywg
dGhlbiB0aGUgd2F5IHlvdSdyZSB1c2luZyBhbgo+Pj4+IGlvdmFfZG9tYWluIGFwcGVhcnMgdG8g
YmUgc29tZXRoaW5nIHlvdSBjb3VsZCBkbyB3aXRoIGEgdHJpdmlhbCBiaXRtYXAKPj4+PiBhbGxv
Y2F0b3IuIFRoYXQncyB3aHkgSSBkb24ndCBidXkgdGhlIGVmZmljaWVuY3kgYXJndW1lbnQuIFRo
ZSBtYWluCj4+Pj4gZGVzaWduIHBvaW50cyBvZiB0aGUgSU9WQSBhbGxvY2F0b3IgYXJlIHRvIG1h
bmFnZSBsYXJnZSBhZGRyZXNzIHNwYWNlcwo+Pj4+IHdoaWxlIHRyeWluZyB0byBtYXhpbWlzZSBz
cGF0aWFsIGxvY2FsaXR5IHRvIG1pbmltaXNlIHRoZSB1bmRlcmx5aW5nCj4+Pj4gcGFnZXRhYmxl
IHVzYWdlLCBhbmQgYWxsb2NhdGluZyB3aXRoIGEgZmxleGlibGUgbGltaXQgdG8gc3VwcG9ydAo+
Pj4+IG11bHRpcGxlIGRldmljZXMgd2l0aCBkaWZmZXJlbnQgYWRkcmVzc2luZyBjYXBhYmlsaXRp
ZXMgaW4gdGhlIHNhbWUKPj4+PiBhZGRyZXNzIHNwYWNlLiBJZiBub25lIG9mIHRob3NlIGFzcGVj
dHMgYXJlIHJlbGV2YW50IHRvIHRoZSB1c2UtY2FzZSAtCj4+Pj4gd2hpY2ggQUZBSUNTIGFwcGVh
cnMgdG8gYmUgdHJ1ZSBoZXJlIC0gdGhlbiBhcyBhIGdlbmVyYWwtcHVycG9zZQo+Pj4+IHJlc291
cmNlIGFsbG9jYXRvciBpdCdzIHJ1YmJpc2ggYW5kIGhhcyBhbiB1bnJlYXNvbmFibHkgbWFzc2l2
ZSBtZW1vcnkKPj4+PiBvdmVyaGVhZCBhbmQgdGhlcmUgYXJlIG1hbnksIG1hbnkgYmV0dGVyIGNo
b2ljZXMuCj4+Pj4KPj4+IE9LLCBJIGdldCB5b3VyIHBvaW50LiBBY3R1YWxseSB3ZSB1c2VkIHRo
ZSBnZW5wb29sIGFsbG9jYXRvciBpbiB0aGUKPj4+IGVhcmx5IHZlcnNpb24uIE1heWJlIHdlIGNh
biBmYWxsIGJhY2sgdG8gdXNpbmcgaXQuCj4+Cj4+IEkgdGhpbmsgbWF5YmUgeW91IGNhbiBzaGFy
ZSBzb21lIHBlcmYgbnVtYmVycyB0byBzZWUgaG93IG11Y2gKPj4gYWxsb2NfaW92YV9mYXN0KCkg
Y2FuIGhlbHAuCj4+Cj4gSSBkaWQgc29tZSBmaW8gdGVzdHNbMV0gd2l0aCBhIHJhbS1iYWNrZW5k
IHZkdXNlIGJsb2NrIGRldmljZVsyXS4KPgo+IEZvbGxvd2luZyBhcmUgc29tZSBwZXJmb3JtYW5j
ZSBkYXRhOgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBudW1qb2JzPTEgICBudW1q
b2JzPTIgICAgbnVtam9icz00ICAgbnVtam9icz04Cj4gaW92YV9hbGxvY19mYXN0ICAgIDE0NWsg
aW9wcyAgICAgIDI2NWsgaW9wcyAgICAgIDUxNGsgaW9wcyAgICAgIDc1OGsgaW9wcwo+Cj4gaW92
YV9hbGxvYyAgICAgICAgICAgIDEzN2sgaW9wcyAgICAgMTcwayBpb3BzICAgICAgMTI4ayBpb3Bz
ICAgICAgMTEzayBpb3BzCj4KPiBnZW5fcG9vbF9hbGxvYyAgIDE0M2sgaW9wcyAgICAgIDI3MGsg
aW9wcyAgICAgIDQ1OGsgaW9wcyAgICAgIDUyMWsgaW9wcwo+Cj4gVGhlIGlvdmFfYWxsb2NfZmFz
dCgpIGhhcyB0aGUgYmVzdCBwZXJmb3JtYW5jZSBzaW5jZSB3ZSBhbHdheXMgaGl0IHRoZQo+IHBl
ci1jcHUgY2FjaGUuIFJlZ2FyZGxlc3Mgb2YgdGhlIHBlci1jcHUgY2FjaGUsIHRoZSBnZW5wb29s
IGFsbG9jYXRvcgo+IHNob3VsZCBiZSBiZXR0ZXIgdGhhbiB0aGUgaW92YSBhbGxvY2F0b3IuCgoK
SSB0aGluayB3ZSBzZWUgY29udmluY2luZyBudW1iZXJzIGZvciB1c2luZyBpb3ZhX2FsbG9jX2Zh
c3QoKSB0aGFuIHRoZSAKZ2VuX3BvbGxfYWxsb2MoKSAoNDUlIGltcHJvdmVtZW50IG9uIGpvYj04
KS4KClRoYW5rcwoKCj4KPiBbMV0gZmlvIGpvYmZpbGU6Cj4KPiBbZ2xvYmFsXQo+IHJ3PXJhbmRy
ZWFkCj4gZGlyZWN0PTEKPiBpb2VuZ2luZT1saWJhaW8KPiBpb2RlcHRoPTE2Cj4gdGltZV9iYXNl
ZD0xCj4gcnVudGltZT02MHMKPiBncm91cF9yZXBvcnRpbmcKPiBicz00awo+IGZpbGVuYW1lPS9k
ZXYvdmRhCj4gW2pvYl0KPiBudW1qb2JzPS4uCj4KPiBbMl0gICQgcWVtdS1zdG9yYWdlLWRhZW1v
biBcCj4gICAgICAgIC0tY2hhcmRldiBzb2NrZXQsaWQ9Y2hhcm1vbml0b3IscGF0aD0vdG1wL3Ft
cC5zb2NrLHNlcnZlcixub3dhaXQgXAo+ICAgICAgICAtLW1vbml0b3IgY2hhcmRldj1jaGFybW9u
aXRvciBcCj4gICAgICAgIC0tYmxvY2tkZXYKPiBkcml2ZXI9aG9zdF9kZXZpY2UsY2FjaGUuZGly
ZWN0PW9uLGFpbz1uYXRpdmUsZmlsZW5hbWU9L2Rldi9udWxsYjAsbm9kZS1uYW1lPWRpc2swCj4g
XAo+ICAgICAgICAtLWV4cG9ydCB0eXBlPXZkdXNlLWJsayxpZD10ZXN0LG5vZGUtbmFtZT1kaXNr
MCx3cml0YWJsZT1vbixuYW1lPXZkdXNlLW51bGwsbnVtLXF1ZXVlcz0xNixxdWV1ZS1zaXplPTEy
OAo+Cj4gVGhlIHFlbXUtc3RvcmFnZS1kYWVtb24gY2FuIGJlIGJ1aWxkZWQgYmFzZWQgb24gdGhl
IHJlcG86Cj4gaHR0cHM6Ly9naXRodWIuY29tL2J5dGVkYW5jZS9xZW11L3RyZWUvdmR1c2UtdGVz
dC4KPgo+IFRoYW5rcywKPiBZb25namkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
