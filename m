Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 355F83B9B03
	for <lists.iommu@lfdr.de>; Fri,  2 Jul 2021 05:25:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED4F60ABD;
	Fri,  2 Jul 2021 03:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAvc6oKyDJ5h; Fri,  2 Jul 2021 03:25:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C83AA60AD8;
	Fri,  2 Jul 2021 03:25:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0669C0022;
	Fri,  2 Jul 2021 03:25:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF3EEC000E
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 03:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C718260AC3
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 03:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtHFNN6xLqXY for <iommu@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 03:25:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 983F260ABD
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625196327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnDTUBO/qel2LJGKzNIBMBJoNluIIwfxXdRX1zb5ugw=;
 b=BwKbchlaUmuikYl4oojjCU4TUBykBYIj94wm8Id2MfOokQ1awVY7JBjvziP5icaTabCvMT
 CgrBAzf5Si9GkWvfOm5RgaEvrc1mH7pZnNipIyX+XnrrIAFUkVaKIepqxKuNnDmMBzZ6IF
 S5Cw+ulDyFrUAQGMoCgH6A7Yt8YIRe8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-hc2Vi4AOM0OBVw1MOmpgAQ-1; Thu, 01 Jul 2021 23:25:26 -0400
X-MC-Unique: hc2Vi4AOM0OBVw1MOmpgAQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 b17-20020a63a1110000b02902231e33459dso5600213pgf.17
 for <iommu@lists.linux-foundation.org>; Thu, 01 Jul 2021 20:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KnDTUBO/qel2LJGKzNIBMBJoNluIIwfxXdRX1zb5ugw=;
 b=rsDLqFOQ1NBegdCZt09HYCfkCeqcm7HIFc8NnGvP5dhJsu5WWzFrZrXYvw+eSgbypm
 Arf1J9Ofzrif9FFy3qN8M3b0vWFBLGsFuWtpn7JK/lOTMpkXYVXL1f0bPG65PlOxZ+m8
 kSlodWFNwIpRgbc+x+tGZ2BytlOl9MEqT7Esdqrpq9WX88bLNtaSQHq0dEpvlBXURqAX
 Wj/50ihVQpcEL/kC/390oKZtNfo6+y21SXtHsdMuklG5xLgy0agkEsl0PqThhWJ09VjA
 ekxfb6bh1YlnPHhBguaxhCm8pKCHuZwwKNfZ3jqwW3GVamEvrcg/dIxzxCXwpJD7gkiV
 o5yg==
X-Gm-Message-State: AOAM533jHgoyCgAf/NIPeVdD8cqcoRLhDvn0EUJ6fBLPcNDz86+dYF43
 BXXvXILySahth2h4wyLhMwtwL9SpZLgB2WyoBFY6AW9niWS9boXYmyHoMogcmPtFGveWLP1Q1RX
 g9Pg3slp+NL3ebJ05GXVi+u6wBcM2Qw==
X-Received: by 2002:a05:6a00:174e:b029:308:35eb:4593 with SMTP id
 j14-20020a056a00174eb029030835eb4593mr3353639pfc.8.1625196324999; 
 Thu, 01 Jul 2021 20:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKMQl/tw5Kx6FHOmk54WvFeYF610dbfRRBBaUlCrS6TkxAlUSkb5jlHy46VzHh0+l9ZFtiag==
X-Received: by 2002:a05:6a00:174e:b029:308:35eb:4593 with SMTP id
 j14-20020a056a00174eb029030835eb4593mr3353600pfc.8.1625196324718; 
 Thu, 01 Jul 2021 20:25:24 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p17sm11147627pjg.54.2021.07.01.20.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 20:25:23 -0700 (PDT)
Subject: Re: [PATCH v8 09/10] vduse: Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210615141331.407-1-xieyongji@bytedance.com>
 <20210615141331.407-10-xieyongji@bytedance.com>
 <YNSatrDFsg+4VvH4@stefanha-x1.localdomain>
 <CACycT3vaXQ4dxC9QUzXXJs7og6TVqqVGa8uHZnTStacsYAiFwQ@mail.gmail.com>
 <YNw+q/ADMPviZi6S@stefanha-x1.localdomain>
 <CACycT3t6M5i0gznABm52v=rdmeeLZu8smXAOLg+WsM3WY1fgTw@mail.gmail.com>
 <7264cb0b-7072-098e-3d22-2b7e89216545@redhat.com>
 <CACycT3v7pYXAFtijPgWCMZ2WXxjT2Y-DUwS3hN_T7dhfE5o_6g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c7d3473c-f855-166b-f4da-47be5a329859@redhat.com>
Date: Fri, 2 Jul 2021 11:25:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACycT3v7pYXAFtijPgWCMZ2WXxjT2Y-DUwS3hN_T7dhfE5o_6g@mail.gmail.com>
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
 Stefano Garzarella <sgarzare@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, songmuchun@bytedance.com,
 Jens Axboe <axboe@kernel.dk>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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

CuWcqCAyMDIxLzcvMSDkuIvljYg2OjI2LCBZb25namkgWGllIOWGmemBkzoKPiBPbiBUaHUsIEp1
bCAxLCAyMDIxIGF0IDM6NTUgUE0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IOWcqCAyMDIxLzcvMSDkuIvljYgyOjUwLCBZb25namkgWGllIOWGmemBkzoKPj4+
IE9uIFdlZCwgSnVuIDMwLCAyMDIxIGF0IDU6NTEgUE0gU3RlZmFuIEhham5vY3ppIDxzdGVmYW5o
YUByZWRoYXQuY29tPiB3cm90ZToKPj4+PiBPbiBUdWUsIEp1biAyOSwgMjAyMSBhdCAxMDo1OTo1
MUFNICswODAwLCBZb25namkgWGllIHdyb3RlOgo+Pj4+PiBPbiBNb24sIEp1biAyOCwgMjAyMSBh
dCA5OjAyIFBNIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
Pj4+PiBPbiBUdWUsIEp1biAxNSwgMjAyMSBhdCAxMDoxMzozMFBNICswODAwLCBYaWUgWW9uZ2pp
IHdyb3RlOgo+Pj4+Pj4+ICsvKiBpb2N0bHMgKi8KPj4+Pj4+PiArCj4+Pj4+Pj4gK3N0cnVjdCB2
ZHVzZV9kZXZfY29uZmlnIHsKPj4+Pj4+PiArICAgICBjaGFyIG5hbWVbVkRVU0VfTkFNRV9NQVhd
OyAvKiB2ZHVzZSBkZXZpY2UgbmFtZSAqLwo+Pj4+Pj4+ICsgICAgIF9fdTMyIHZlbmRvcl9pZDsg
LyogdmlydGlvIHZlbmRvciBpZCAqLwo+Pj4+Pj4+ICsgICAgIF9fdTMyIGRldmljZV9pZDsgLyog
dmlydGlvIGRldmljZSBpZCAqLwo+Pj4+Pj4+ICsgICAgIF9fdTY0IGZlYXR1cmVzOyAvKiBkZXZp
Y2UgZmVhdHVyZXMgKi8KPj4+Pj4+PiArICAgICBfX3U2NCBib3VuY2Vfc2l6ZTsgLyogYm91bmNl
IGJ1ZmZlciBzaXplIGZvciBpb21tdSAqLwo+Pj4+Pj4+ICsgICAgIF9fdTE2IHZxX3NpemVfbWF4
OyAvKiB0aGUgbWF4IHNpemUgb2YgdmlydHF1ZXVlICovCj4+Pj4+PiBUaGUgVklSVElPIHNwZWNp
ZmljYXRpb24gYWxsb3dzIHBlci12aXJ0cXVldWUgc2l6ZXMuIEEgZGV2aWNlIGNhbiBoYXZlCj4+
Pj4+PiB0d28gdmlydHF1ZXVlcywgd2hlcmUgdGhlIGZpcnN0IG9uZSBhbGxvd3MgdXAgdG8gMTAy
NCBkZXNjcmlwdG9ycyBhbmQKPj4+Pj4+IHRoZSBzZWNvbmQgb25lIGFsbG93cyBvbmx5IDEyOCBk
ZXNjcmlwdG9ycywgZm9yIGV4YW1wbGUuCj4+Pj4+Pgo+Pj4+PiBHb29kIHBvaW50ISBCdXQgaXQg
bG9va3MgbGlrZSB2aXJ0aW8tdmRwYS92aXJ0aW8tcGNpIGRvZXNuJ3Qgc3VwcG9ydAo+Pj4+PiB0
aGF0IG5vdy4gQWxsIHZpcnRxdWV1ZXMgaGF2ZSB0aGUgc2FtZSBtYXhpbXVtIHNpemUuCj4+Pj4g
SSBzZWUgc3RydWN0IHZwZGFfY29uZmlnX29wcyBvbmx5IHN1cHBvcnRzIGEgcGVyLWRldmljZSBt
YXggdnEgc2l6ZToKPj4+PiB1MTYgKCpnZXRfdnFfbnVtX21heCkoc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZGV2KTsKPj4+Pgo+Pj4+IHZpcnRpby1wY2kgc3VwcG9ydHMgcGVyLXZpcnRxdWV1ZSBzaXpl
cyBiZWNhdXNlIHRoZSBzdHJ1Y3QKPj4+PiB2aXJ0aW9fcGNpX2NvbW1vbl9jZmctPnF1ZXVlX3Np
emUgcmVnaXN0ZXIgaXMgcGVyLXF1ZXVlIChjb250cm9sbGVkIGJ5Cj4+Pj4gcXVldWVfc2VsZWN0
KS4KPj4+Pgo+Pj4gT2gsIHllcy4gSSBtaXNzIHF1ZXVlX3NlbGVjdC4KPj4+Cj4+Pj4gSSBndWVz
cyB0aGlzIGlzIGEgcXVlc3Rpb24gZm9yIEphc29uOiB3aWxsIHZkcGEgd2lsbCBrZWVwIHRoaXMg
bGltaXRhdGlvbj8KPj4+PiBJZiB5ZXMsIHRoZW4gVkRVU0UgY2FuIHN0aWNrIHRvIGl0IHRvbyB3
aXRob3V0IHJ1bm5pbmcgaW50byBwcm9ibGVtcyBpbgo+Pj4+IHRoZSBmdXR1cmUuCj4+Cj4+IEkg
dGhpbmsgaXQncyBiZXR0ZXIgdG8gZXh0ZW5kIHRoZSBnZXRfdnFfbnVtX21heCgpIHBlciB2aXJ0
cXVldWUuCj4+Cj4+IEN1cnJlbnRseSwgdkRQQSBhc3N1bWVzIHRoZSBwYXJlbnQgdG8gaGF2ZSBh
IGdsb2JhbCBtYXggc2l6ZS4gVGhpcyBzZWVtcwo+PiB0byB3b3JrIG9uIG1vc3Qgb2YgdGhlIHBh
cmVudHMgYnV0IG5vdCB2cC12RFBBICh3aGljaCBjb3VsZCBiZSBiYWNrZWQgYnkKPj4gUUVNVSwg
aW4gdGhhdCBjYXNlIGN2cSdzIHNpemUgaXMgc21hbGxlcikuCj4+Cj4+IEZvcnR1bmF0ZWx5LCB3
ZSBoYXZlbid0IGVuYWJsZWQgaGFkIGN2cSBzdXBwb3J0IGluIHRoZSB1c2Vyc3BhY2Ugbm93Lgo+
Pgo+PiBJIGNhbiBwb3N0IHRoZSBmaXhlcy4KPj4KPiBPSy4gSWYgc28sIGl0IGxvb2tzIGxpa2Ug
d2UgbmVlZCB0byBzdXBwb3J0IHRoZSBwZXItdnEgY29uZmlndXJhdGlvbi4KPiBJIHdvbmRlciBp
ZiBpdCdzIGJldHRlciB0byB1c2Ugc29tZXRoaW5nIGxpa2U6IFZEVVNFX0NSRUFURV9ERVZJQ0Ug
LT4KPiBWRFVTRV9TRVRVUF9WUSAtPiBWRFVTRV9TRVRVUF9WUSAtPiAuLi4gLT4gVkRVU0VfRU5B
QkxFX0RFVklDRSB0byBkbwo+IGluaXRpYWxpemF0aW9uIHJhdGhlciB0aGFuIG9ubHkgdXNlIFZE
VVNFX0NSRUFURV9ERVZJQ0UuCgoKVGhpcyBzaG91bGQgYmUgZmluZS4KClRoYW5rcwoKCj4KPiBU
aGFua3MsCj4gWW9uZ2ppCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9p
b21tdQ==
