Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9D390E62
	for <lists.iommu@lfdr.de>; Wed, 26 May 2021 04:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7CF4012C;
	Wed, 26 May 2021 02:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvKgCuLQ7thm; Wed, 26 May 2021 02:41:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4468940025;
	Wed, 26 May 2021 02:41:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6330C001C;
	Wed, 26 May 2021 02:41:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3776C0001
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 02:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8359405D4
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 02:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvGTknlsgs4c for <iommu@lists.linux-foundation.org>;
 Wed, 26 May 2021 02:41:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E47A405D3
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 02:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621996911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bc/2MmUW+pgbFW2qFMtYQUjTQyUaBFo1vkB8ZkWRL6s=;
 b=WYwuElLbt8HR3LiQAPzK6gFc9h355udPLg8pOk1tuxHJ4KDZefIsFd/oPL1mBbWYWvozB6
 w5lS9gyGatHMpZjcUADmUBDHMWjmyr6LzrjxcAPJbQY+i3znfjt9zCzunLo71u9RghrfCl
 rEmMGY6jNV+kw6tdSt5aYsCBtuJT6oU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-UdV8-3ruM9ybm8HZCBGGQA-1; Tue, 25 May 2021 22:41:50 -0400
X-MC-Unique: UdV8-3ruM9ybm8HZCBGGQA-1
Received: by mail-pg1-f197.google.com with SMTP id
 a23-20020a6370570000b029021b0f92a171so14831397pgn.16
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 19:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bc/2MmUW+pgbFW2qFMtYQUjTQyUaBFo1vkB8ZkWRL6s=;
 b=oEg9RydzNzc0hI4C25UyC/dfpP4VnP5i7MYGvxiA7aXTantsNWAA3TjMa6bXMveHJs
 OHOm8L92sTGk0UUom2iy6HuqfUK014UYpiLdKLKuxZlWmEuNoRi0GoAa2CKEd0bOFfH7
 C+4RzUrr3bDA7SplfHwPu/VbHXsGVHUaQeC1v89wNIcjRCAc694mwScDcP7i2NFen2+K
 t2p+IWmuSAPM2YSFFtGh1Vl5Q/54bCelMghLSMmeyZQ45XtirbzfLAjxv1xoaJzrfman
 0pxSas4+q/nL28LhW/fID5SRXjI8C+8qHsNel6HCXoF67AVA7fw6pqdemTjzfQUwM+ef
 XzlQ==
X-Gm-Message-State: AOAM532zLxjXl22yLjfsQSmbM2H+aY1J50wK4xI4gs0GvwaTIq0zppG1
 ipHaS5paTgiNAG+fPU0Njmg+FvXj6JLhfHtHXiiANESExgFWWM+AnRcZXkYFQpbQ9Ru4hDeAp8c
 J2KUk5jYIxuTUY4sSSGAu2tK17tq7UA==
X-Received: by 2002:a62:ab10:0:b029:2e8:d5a8:d635 with SMTP id
 p16-20020a62ab100000b02902e8d5a8d635mr15164707pff.74.1621996909406; 
 Tue, 25 May 2021 19:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdM51fqapZ+TAydQBf1YBCQBeMJGeM8QJFnRIR/jK472sF6Fh8jpb1mmntXjLVehm11MPEGA==
X-Received: by 2002:a62:ab10:0:b029:2e8:d5a8:d635 with SMTP id
 p16-20020a62ab100000b02902e8d5a8d635mr15164685pff.74.1621996909140; 
 Tue, 25 May 2021 19:41:49 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a8sm14716088pfk.11.2021.05.25.19.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:41:48 -0700 (PDT)
Subject: Re: [PATCH v7 05/12] virtio_scsi: Add validation for residual bytes
 from response
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 hch@infradead.org, christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org
References: <20210517095513.850-1-xieyongji@bytedance.com>
 <20210517095513.850-6-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <94abb1de-921d-8bf2-4cfc-55c7fc86c5a0@redhat.com>
Date: Wed, 26 May 2021 10:41:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210517095513.850-6-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org
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

CtTaIDIwMjEvNS8xNyDPws7nNTo1NSwgWGllIFlvbmdqaSDQtLXAOgo+IFRoaXMgZW5zdXJlcyB0
aGF0IHRoZSByZXNpZHVhbCBieXRlcyBpbiByZXNwb25zZSAobWlnaHQgY29tZQo+IGZyb20gYW4g
dW50cnVzdGVkIGRldmljZSkgd2lsbCBub3QgZXhjZWVkIHRoZSBkYXRhIGJ1ZmZlciBsZW5ndGgu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWUgWW9uZ2ppIDx4aWV5b25namlAYnl0ZWRhbmNlLmNvbT4K
PiAtLS0KPiAgIGRyaXZlcnMvc2NzaS92aXJ0aW9fc2NzaS5jIHwgMiArLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zY3NpL3ZpcnRpb19zY3NpLmMgYi9kcml2ZXJzL3Njc2kvdmlydGlvX3Njc2kuYwo+IGlu
ZGV4IGVmY2FmMDY3NGM4ZC4uYWQ3ZDhjZWNlYzMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc2Nz
aS92aXJ0aW9fc2NzaS5jCj4gKysrIGIvZHJpdmVycy9zY3NpL3ZpcnRpb19zY3NpLmMKPiBAQCAt
OTcsNyArOTcsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBTY3NpX0hvc3QgKnZpcnRpb19zY3Np
X2hvc3Qoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gICBzdGF0aWMgdm9pZCB2aXJ0c2Nz
aV9jb21wdXRlX3Jlc2lkKHN0cnVjdCBzY3NpX2NtbmQgKnNjLCB1MzIgcmVzaWQpCj4gICB7Cj4g
ICAJaWYgKHJlc2lkKQo+IC0JCXNjc2lfc2V0X3Jlc2lkKHNjLCByZXNpZCk7Cj4gKwkJc2NzaV9z
ZXRfcmVzaWQoc2MsIG1pbihyZXNpZCwgc2NzaV9idWZmbGVuKHNjKSkpOwo+ICAgfQo+ICAgCj4g
ICAvKgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
