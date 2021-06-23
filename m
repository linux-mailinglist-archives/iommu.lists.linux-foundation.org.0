Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC93B1368
	for <lists.iommu@lfdr.de>; Wed, 23 Jun 2021 07:50:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309864014B;
	Wed, 23 Jun 2021 05:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRwTsBzQLeoP; Wed, 23 Jun 2021 05:50:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 206D3401D2;
	Wed, 23 Jun 2021 05:50:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE594C001D;
	Wed, 23 Jun 2021 05:50:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B2D3C000E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DEDC400BE
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hI73_XVvTo3 for <iommu@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 05:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 515BF400E8
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 05:50:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bu12so2178215ejb.0
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4GiuBeValxmP+XXrOzcRmIGN8AohLiEvZ/1N4xkfEsc=;
 b=1ojgGgahexzFXE9RdNLyeoPjvzgy1FuMSknCgn9K5GwXoXKChPXHlt8RFqJU6xJGuF
 Cgrqzm5EDspyu9pceCZQxvmPvCVRPYcOLwyyVOaWAFc+/73Sd1ei8PUVLb3hMJg85yGd
 OoiS+Tom58BzQ4gVjO0sTB3pg1TBBl4FTS0KCFKWgNCJHr3b6clNKWi9sch5PBKWSbC5
 hdgylXBSI1fEHL65mcL5+HqoUj0DqlN+Vgg5BbVMgsnjT5z5R29YjArWCkkrPQkSQcTP
 G0euaC5g3D/chfHTH21pgGDle3JiDm7q2fqGYTk+72WN78OHY9b3+JAT5mbt83TyJaUN
 rngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4GiuBeValxmP+XXrOzcRmIGN8AohLiEvZ/1N4xkfEsc=;
 b=OPjHGaskrtDK1tLCMcfS48I+YACDgbZFu3Pvo/d28i/zLD4SE6nYCUS9l6qAFOL09x
 H1qzpzwdGKGcqF8+3wauwUWHMoBGa0NoMjrux8er3eR7oMQari6PsqXcW/XWMBWRTiLc
 1Od2vqB9kRyh7FNmIVxk/l1enBtvRLAE+WxjJNFGtQGS84NUfP9A+Ky0uc2uYhA9Weaw
 ZMO4Ve01s7yjn0VaXsI1MNDcORaae7fwZ7g9uC0HatiIi6TIjN8EcBPv0s6nCBnSluQe
 1RM/xF7KG7NE/MT5Zs+VNNj3+9mDLE5LieYY4PT3vSPJWAd/GRqm4Vd/BEnKS3ALSq0D
 5jFQ==
X-Gm-Message-State: AOAM532bnJYbqAwPVH8zvdLyIh6uqvazN+h8cBA3Y2cfzHamgKgYzp1d
 LS998Q30UzDIxR2AvSXiaZPfRRRhD2MZJKsHNj4A
X-Google-Smtp-Source: ABdhPJwbg3yWypQN4cxrZmP3uYn4KoXMLaW0oW+bJJtUlpWP6iDiZd3Hcvf9/eWyaRh10eQQqnKlblyzvYXHH4O6Z7k=
X-Received: by 2002:a17:906:9a4f:: with SMTP id
 aj15mr7921850ejc.197.1624427411326; 
 Tue, 22 Jun 2021 22:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210615141331.407-1-xieyongji@bytedance.com>
 <20210615141331.407-10-xieyongji@bytedance.com>
 <adfb2be9-9ed9-ca37-ac37-4cd00bdff349@redhat.com>
 <CACycT3tAON+-qZev+9EqyL2XbgH5HDspOqNt3ohQLQ8GqVK=EA@mail.gmail.com>
 <1bba439f-ffc8-c20e-e8a4-ac73e890c592@redhat.com>
 <CACycT3uzMJS7vw6MVMOgY4rb=SPfT2srV+8DPdwUVeELEiJgbA@mail.gmail.com>
 <0aeb7cb7-58e5-1a95-d830-68edd7e8ec2e@redhat.com>
 <CACycT3uuooKLNnpPHewGZ=q46Fap2P4XCFirdxxn=FxK+X1ECg@mail.gmail.com>
 <e4cdee72-b6b4-d055-9aac-3beae0e5e3e1@redhat.com>
In-Reply-To: <e4cdee72-b6b4-d055-9aac-3beae0e5e3e1@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 23 Jun 2021 13:50:00 +0800
Message-ID: <CACycT3u8=_D3hCtJR+d5BgeUQMce6S7c_6P3CVfvWfYhCQeXFA@mail.gmail.com>
Subject: Re: Re: [PATCH v8 09/10] vduse: Introduce VDUSE - vDPA Device in
 Userspace
To: Jason Wang <jasowang@redhat.com>
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, songmuchun@bytedance.com,
 Jens Axboe <axboe@kernel.dk>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>
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

T24gV2VkLCBKdW4gMjMsIDIwMjEgYXQgMTE6MzEgQU0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPgo+IOWcqCAyMDIxLzYvMjIg5LiL5Y2INDoxNCwgWW9uZ2ppIFhp
ZSDlhpnpgZM6Cj4gPiBPbiBUdWUsIEp1biAyMiwgMjAyMSBhdCAzOjUwIFBNIEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4g5ZyoIDIwMjEvNi8yMiDkuIvl
jYgzOjIyLCBZb25namkgWGllIOWGmemBkzoKPiA+Pj4+IFdlIG5lZWQgZml4IGEgd2F5IHRvIHBy
b3BhZ2F0ZSB0aGUgZXJyb3IgdG8gdGhlIHVzZXJzcGFjZS4KPiA+Pj4+Cj4gPj4+PiBFLmcgaWYg
d2Ugd2FudCB0byBzdG9wIHRoZSBkZWl2Y2UsIHdlIHdpbGwgZGVsYXkgdGhlIHN0YXR1cyByZXNl
dCB1bnRpbAo+ID4+Pj4gd2UgZ2V0IHJlc3Bvc2UgZnJvbSB0aGUgdXNlcnNwYWNlPwo+ID4+Pj4K
PiA+Pj4gSSBkaWRuJ3QgZ2V0IGhvdyB0byBkZWxheSB0aGUgc3RhdHVzIHJlc2V0LiBBbmQgc2hv
dWxkIGl0IGJlIGEgRG9TCj4gPj4+IHRoYXQgd2Ugd2FudCB0byBmaXggaWYgdGhlIHVzZXJzcGFj
ZSBkb2Vzbid0IGdpdmUgYSByZXNwb25zZSBmb3JldmVyPwo+ID4+Cj4gPj4gWW91J3JlIHJpZ2h0
LiBTbyBsZXQncyBtYWtlIHNldF9zdGF0dXMoKSBjYW4gZmFpbCBmaXJzdCwgdGhlbiBwcm9wYWdh
dGUKPiA+PiBpdHMgZmFpbHVyZSB2aWEgVkhPU1RfVkRQQV9TRVRfU1RBVFVTLgo+ID4+Cj4gPiBP
Sy4gU28gd2Ugb25seSBuZWVkIHRvIHByb3BhZ2F0ZSB0aGUgZmFpbHVyZSBpbiB0aGUgdmhvc3Qt
dmRwYSBjYXNlLCByaWdodD8KPgo+Cj4gSSB0aGluayBub3QsIHdlIG5lZWQgdG8gZGVhbCB3aXRo
IHRoZSByZXNldCBmb3IgdmlydGlvIGFzIHdlbGw6Cj4KPiBFLmcgaW4gcmVnaXN0ZXJfdmlydGlv
X2RldmljZXMoKSwgd2UgaGF2ZToKPgo+ICAgICAgICAgIC8qIFdlIGFsd2F5cyBzdGFydCBieSBy
ZXNldHRpbmcgdGhlIGRldmljZSwgaW4gY2FzZSBhIHByZXZpb3VzCj4gICAgICAgICAgICogZHJp
dmVyIG1lc3NlZCBpdCB1cC4gIFRoaXMgYWxzbyB0ZXN0cyB0aGF0IGNvZGUgcGF0aCBhCj4gbGl0
dGxlLiAqLwo+ICAgICAgICBkZXYtPmNvbmZpZy0+cmVzZXQoZGV2KTsKPgo+IFdlIHByb2JhYmx5
IG5lZWQgdG8gbWFrZSByZXNldCBjYW4gZmFpbCBhbmQgdGhlbiBmYWlsIHRoZQo+IHJlZ2lzdGVy
X3ZpcnRpb19kZXZpY2UoKSBhcyB3ZWxsLgo+CgpPSywgbG9va3MgbGlrZSB2aXJ0aW9fYWRkX3N0
YXR1cygpIGFuZCB2aXJ0aW9fZGV2aWNlX3JlYWR5KClbMV0gc2hvdWxkCmJlIGFsc28gbW9kaWZp
ZWQgaWYgd2UgbmVlZCB0byBwcm9wYWdhdGUgdGhlIGZhaWx1cmUgaW4gdGhlCnZpcnRpby12ZHBh
IGNhc2UuIE9yIGRvIHdlIG9ubHkgbmVlZCB0byBjYXJlIGFib3V0IHRoZSByZXNldCBjYXNlPwoK
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA1MTcwOTM0MjguNjcwLTEteGll
eW9uZ2ppQGJ5dGVkYW5jZS5jb20vCgpUaGFua3MsCllvbmdqaQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
