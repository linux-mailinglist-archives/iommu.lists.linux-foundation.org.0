Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F23B6D60
	for <lists.iommu@lfdr.de>; Tue, 29 Jun 2021 06:13:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E1D403D6;
	Tue, 29 Jun 2021 04:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQrmr9IrQhOa; Tue, 29 Jun 2021 04:13:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A00DD403D4;
	Tue, 29 Jun 2021 04:13:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E6A8C001F;
	Tue, 29 Jun 2021 04:13:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B10BDC000E
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 04:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B80440232
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 04:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfAzEwYk7IQP for <iommu@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 04:13:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5C79400DE
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624939993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7N6S5aXlTsxjRnLUAwuT1GGB2dsJH/gvDpQ3UzIqM0M=;
 b=de10XCib3R7RBtNayfm/Uju9GOggjYSz7IGmZyfGySF/Djyuyel6VwSnQE+c1Pe6yRcWpO
 KxpxcqrwtapRYlsXDG32nc6IBOLW/zZOMbZKocmKVFBJfDbgZWYdyqGbzNw3A72UTc0jzd
 aAt5NJcNMgJ5S1Dx1EfSpoVELUrc48M=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-l3LDxWFQNIOKnUVPByfy2A-1; Tue, 29 Jun 2021 00:13:09 -0400
X-MC-Unique: l3LDxWFQNIOKnUVPByfy2A-1
Received: by mail-pg1-f200.google.com with SMTP id
 j17-20020a63cf110000b0290226eb0c27acso13033051pgg.23
 for <iommu@lists.linux-foundation.org>; Mon, 28 Jun 2021 21:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7N6S5aXlTsxjRnLUAwuT1GGB2dsJH/gvDpQ3UzIqM0M=;
 b=VvqT2fxOhGTWfh7fsiVfv6xz48jAUuQd9XgvxagWge5LkJLYGB/VWM337RD9jj1tbj
 5AY7++klqf/vZVhidgJsTh1BdPzOt9oZfgfe8y2OURErTq8+ddgHZu1gttbnLKR6uALX
 59B8YmRoZEPyYNNOIOPRSJE7GBgay5vhLYre7gUySCJb2RN66Ovkbubs70Lufy+sy/EV
 YEY+LPZQ4UU9vF7EaBHw4xFs+frCU9VKCIsFjv9FYZAxLaBq4ZnS3PFr7DVJPkLji7OB
 8XPJyQ1tcKV0aMsIzxxtZNNteqxGj6Lbuvz9DGQX8Mq6b+VZx+TO3Mtm0c+utUn53b38
 m64w==
X-Gm-Message-State: AOAM532ed01YGusrV+pD8mezq+LTC3bDD7QB9z4mdbk0Ta8WKnzw1sFa
 Z36fi0fDfbNtsECf8cIulNk3AGrRHfKUk2K9+n/PR1o53VHpaq/uZFY/mf6Sn/sNO0Obuu5KNCr
 VF+RpV2FUTFPf5gsQk7ac+A5dcgaEIw==
X-Received: by 2002:a65:478d:: with SMTP id e13mr26587080pgs.37.1624939987923; 
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTnV+jCJcWth5Gh1PanbNwyDV44mMvsm0eLCzSFKGOg12/3H6rwksZzo35n3QJumwiuRcZHQ==
X-Received: by 2002:a65:478d:: with SMTP id e13mr26587053pgs.37.1624939987713; 
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k13sm1525904pgh.82.2021.06.28.21.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
Subject: Re: [PATCH v8 00/10] Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <elohimes@gmail.com>, Liu Xiaodong <xiaodong.liu@intel.com>
References: <20210615141331.407-1-xieyongji@bytedance.com>
 <20210628103309.GA205554@storage2.sh.intel.com>
 <CAONzpcbjr2zKOAQrWa46Tv=oR1fYkcKLcqqm_tSgO7RkU20yBA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d5321870-ef29-48e2-fdf6-32d99a5fa3b9@redhat.com>
Date: Tue, 29 Jun 2021 12:12:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAONzpcbjr2zKOAQrWa46Tv=oR1fYkcKLcqqm_tSgO7RkU20yBA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 corbet@lwn.net, willy@infradead.org, hch@infradead.org,
 Xie Yongji <xieyongji@bytedance.com>, dan.carpenter@oracle.com,
 sgarzare@redhat.com, viro@zeniv.linux.org.uk,
 Stefan Hajnoczi <stefanha@redhat.com>, songmuchun@bytedance.com,
 axboe@kernel.dk, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bcrl@kvack.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 mika.penttila@nextfour.com
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

CuWcqCAyMDIxLzYvMjgg5LiL5Y2INjozMiwgWW9uZ2ppIFhpZSDlhpnpgZM6Cj4+IFRoZSBsYXJn
ZSBiYXJyaWVyIGlzIGJvdW5jZS1idWZmZXIgbWFwcGluZzogU1BESyByZXF1aXJlcyBodWdlcGFn
ZXMKPj4gZm9yIE5WTWUgb3ZlciBQQ0llIGFuZCBSRE1BLCBzbyB0YWtlIHNvbWUgcHJlYWxsY29h
dGVkIGh1Z2VwYWdlcyB0bwo+PiBtYXAgYXMgYm91bmNlIGJ1ZmZlciBpcyBuZWNlc3NhcnkuIE9y
IGl0J3MgaGFyZCB0byBhdm9pZCBhbiBleHRyYQo+PiBtZW1jcHkgZnJvbSBib3VuY2UtYnVmZmVy
IHRvIGh1Z2VwYWdlLgo+PiBJZiB5b3UgY2FuIGFkZCBhbiBvcHRpb24gdG8gbWFwIGh1Z2VwYWdl
cyBhcyBib3VuY2UtYnVmZmVyLAo+PiB0aGVuIFNQREsgY291bGQgYWxzbyBiZSBhIHBvdGVudGlh
bCB1c2VyIG9mIHZkdXNlLgo+Pgo+IEkgdGhpbmsgd2UgY2FuIHN1cHBvcnQgcmVnaXN0ZXJpbmcg
dXNlciBzcGFjZSBtZW1vcnkgZm9yIGJvdW5jZS1idWZmZXIKPiB1c2UgbGlrZSBYRFAgZG9lcy4g
QnV0IHRoaXMgbmVlZHMgdG8gcGluIHRoZSBwYWdlcywgc28gSSBkaWRuJ3QKPiBjb25zaWRlciBp
dCBpbiB0aGlzIGluaXRpYWwgdmVyc2lvbi4KPgoKTm90ZSB0aGF0IHVzZXJzcGFjZSBzaG91bGQg
YmUgdW5hd2FyZSBvZiB0aGUgZXhpc3RlbmNlIG9mIHRoZSBib3VuY2UgYnVmZmVyLgoKU28gd2Ug
bmVlZCB0byB0aGluayBjYXJlZnVsbHkgb2YgbW1hcCgpIHZzIHVtZW0gcmVnaXN0ZXJpbmcuCgpU
aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
