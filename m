Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4293DE761
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 09:41:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8379606E2;
	Tue,  3 Aug 2021 07:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBROqlRkTfio; Tue,  3 Aug 2021 07:41:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ECA0A60749;
	Tue,  3 Aug 2021 07:41:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C3D1C0025;
	Tue,  3 Aug 2021 07:41:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F449C000E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F70E82FC9
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrtVHBSstu6B for <iommu@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C20582F4F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627976508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEW12L7lEJwVitr0islGtcOwaqb3auoW/6llqcQs9Bo=;
 b=Okn0H+JgfP7Ekiwvw8197e1vYRmbD5ZVcTUxfi/nRpSE8nYhx41ugWGaCS2tG1k4HajPQg
 GXNJ2aLvH1agvkb1gkMMFLZ2udVwh0LwUNCZZnHXHiJ1PGBPHsrBPlCw0dJGY6/5uH36PM
 ZBg72B/ZJ65qM+iFqk7RwPexeStmbOc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-XlRmt8y8OFidlXFwruAP0w-1; Tue, 03 Aug 2021 03:41:44 -0400
X-MC-Unique: XlRmt8y8OFidlXFwruAP0w-1
Received: by mail-pj1-f70.google.com with SMTP id
 o23-20020a17090a4217b02901774c248202so2141530pjg.9
 for <iommu@lists.linux-foundation.org>; Tue, 03 Aug 2021 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sEW12L7lEJwVitr0islGtcOwaqb3auoW/6llqcQs9Bo=;
 b=bL1Y7nUs51iJK3USIUjRPOj2TfaAUyTakfKMG2Tc9sXoh4AukJF5I5IRsu8E5Yi4/W
 L0M1MV8h3Miw30HOCc1iGtcrqWoX6IkxOB7opoInwMuDYTHM+98LjlWaohaCbZPw1LSY
 gZyd8g7lgVznTEcF7o/QVtMMfacWZ1++Go4MF307Z07kIKcL4r9HR5uL6hcCCAb2Jgd5
 vMq24RKp2utI2P5xIHAOOYmijb9MmRSVfxwZDrd6mzZKT3mH3gBk8uJTNm94QH07TK3H
 jQiMgcWGRTqrQu6i38cUSbEBPCTmZkJ6Da53lls9MSJKp0u8saX66HceIoRpPiWxTyn0
 DfqQ==
X-Gm-Message-State: AOAM532/yU4cf2mMm9z35encGe4D2WQPqBRCMqLAL4dIcso6CwyMV7Ur
 XDD1U9g/gCQnqjQvdPIiZcFYqCaKG2RgIosGldVByiJUeeHYVDSg0e4jOtBbK3zEcg5vm/jpM82
 uRTUjmMiYp9uqCL0XlHUZEclj442XQw==
X-Received: by 2002:a65:6658:: with SMTP id z24mr924179pgv.266.1627976503787; 
 Tue, 03 Aug 2021 00:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTQ9FIMwD850kYRySFMOvwSa2Mh3zZSaM4w5MdRtHBvqDzhjK3JTqHR+x1mQoJbyhltJ0O8Q==
X-Received: by 2002:a65:6658:: with SMTP id z24mr924161pgv.266.1627976503586; 
 Tue, 03 Aug 2021 00:41:43 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r15sm13016701pjl.29.2021.08.03.00.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 00:41:42 -0700 (PDT)
Subject: Re: [PATCH v10 01/17] iova: Export alloc_iova_fast() and
 free_iova_fast()
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 hch@infradead.org, christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-2-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <43d88942-1cd3-c840-6fec-4155fd544d80@redhat.com>
Date: Tue, 3 Aug 2021 15:41:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729073503.187-2-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNy8yOSDPws7nMzozNCwgWGllIFlvbmdqaSDQtLXAOgo+IEV4cG9ydCBhbGxvY19p
b3ZhX2Zhc3QoKSBhbmQgZnJlZV9pb3ZhX2Zhc3QoKSBzbyB0aGF0Cj4gc29tZSBtb2R1bGVzIGNh
biB1c2UgaXQgdG8gaW1wcm92ZSBpb3ZhIGFsbG9jYXRpb24gZWZmaWNpZW5jeS4KCgpJdCdzIGJl
dHRlciB0byBleHBsYWluIHdoeSBhbGxvY19pb3ZhKCkgaXMgbm90IHN1ZmZpY2llbnQgaGVyZS4K
ClRoYW5rcwoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWUgWW9uZ2ppIDx4aWV5b25namlAYnl0ZWRh
bmNlLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaW9tbXUvaW92YS5jIHwgMiArKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUv
aW92YS5jIGIvZHJpdmVycy9pb21tdS9pb3ZhLmMKPiBpbmRleCBiNmNmNWYxNjEyM2IuLjM5NDFl
ZDZiYjk5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvdmEuYwo+ICsrKyBiL2RyaXZl
cnMvaW9tbXUvaW92YS5jCj4gQEAgLTUyMSw2ICs1MjEsNyBAQCBhbGxvY19pb3ZhX2Zhc3Qoc3Ry
dWN0IGlvdmFfZG9tYWluICppb3ZhZCwgdW5zaWduZWQgbG9uZyBzaXplLAo+ICAgCj4gICAJcmV0
dXJuIG5ld19pb3ZhLT5wZm5fbG87Cj4gICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGFsbG9jX2lv
dmFfZmFzdCk7Cj4gICAKPiAgIC8qKgo+ICAgICogZnJlZV9pb3ZhX2Zhc3QgLSBmcmVlIGlvdmEg
cGZuIHJhbmdlIGludG8gcmNhY2hlCj4gQEAgLTUzOCw2ICs1MzksNyBAQCBmcmVlX2lvdmFfZmFz
dChzdHJ1Y3QgaW92YV9kb21haW4gKmlvdmFkLCB1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQg
bG9uZyBzaXplKQo+ICAgCj4gICAJZnJlZV9pb3ZhKGlvdmFkLCBwZm4pOwo+ICAgfQo+ICtFWFBP
UlRfU1lNQk9MX0dQTChmcmVlX2lvdmFfZmFzdCk7Cj4gICAKPiAgICNkZWZpbmUgZnFfcmluZ19m
b3JfZWFjaChpLCBmcSkgXAo+ICAgCWZvciAoKGkpID0gKGZxKS0+aGVhZDsgKGkpICE9IChmcSkt
PnRhaWw7IChpKSA9ICgoaSkgKyAxKSAlIElPVkFfRlFfU0laRSkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
