Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AB3F44FA
	for <lists.iommu@lfdr.de>; Mon, 23 Aug 2021 08:32:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A078980DE0;
	Mon, 23 Aug 2021 06:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5r2rlnVd4jC4; Mon, 23 Aug 2021 06:32:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B3F5180DAF;
	Mon, 23 Aug 2021 06:32:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F54C000E;
	Mon, 23 Aug 2021 06:32:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39B9AC000E
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 06:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14D8C401E9
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 06:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxS1lymTWeSM for <iommu@lists.linux-foundation.org>;
 Mon, 23 Aug 2021 06:32:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32BEA400FE
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629700338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F427DPlADbCH/M2u7fz/h7ndiMrb6AVw4qTHSvYRC+w=;
 b=BzWq88deqTYWILQmL0+Ttb67zemEJFD42XlakLf3hhPwYJ+SRUJBcdShqpOUjFGhwPm3qo
 aMBYFNx/F4hRw6mPlfSvp0Xc5UZ+WjXxw/L7lnFECkBRGiAHla+g396IVZ1FTCfHmHkm+z
 +EMaumoF9/LA8UTZx++nYFDScVW+F8E=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-y0nDhrAfN5eJnjxmNkeLLQ-1; Mon, 23 Aug 2021 02:32:15 -0400
X-MC-Unique: y0nDhrAfN5eJnjxmNkeLLQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 k21-20020a056a001695b0290329e718b5a3so8127048pfc.15
 for <iommu@lists.linux-foundation.org>; Sun, 22 Aug 2021 23:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=F427DPlADbCH/M2u7fz/h7ndiMrb6AVw4qTHSvYRC+w=;
 b=Fqi/hoPW3MhOG0C0MZ7j3TlQWjfliUX+2h9ooKnsBUDRsg0XrpmP2SgA6gVyqrR6/L
 50y/qlZ0nUbZVnQTjqkXGTVLCDLoOpoVA/KG0KqLJIYqBz/SsX5xHu2qyRyIcXl7MFGi
 nS1cT7616gO5xyJmPTTPK5ZDPgBMOuShSzNhb34bK8IpE1XnguitDE+dC2kvpTaS3EOY
 1bAgk6NhH59unszhHFI3giRg0uhXDRvHrDUeHkBmYMFmUCukWHpg07qR06j/fcps5BZh
 X7k6jZDw/DsTkuwB5YLLP1u1L3eT0mZq1fKNlqWaNGYwy/YyrEIWpzTNZSIRToY0UMpD
 DA+w==
X-Gm-Message-State: AOAM5323vGJGQcqm3K1Fat/tEBP+gCICiVABlHl/0gODUlfBgCevS9me
 FEc+qAMmnK4lnj+7woLXyC78fpDGERLetgyqDqoQjgB9RHZCg+I8TEmmjsTHxCNSIOfrBfdhtJ8
 2SJ7jRh0MA7NdSB/0WF/AzjjiVkc8jw==
X-Received: by 2002:a65:40c4:: with SMTP id u4mr30729295pgp.186.1629700333943; 
 Sun, 22 Aug 2021 23:32:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMdGRZ8bEDFR6mhq5hnskFTgOQcLb0mODJnisTe/klfXgBImg93E0Jn9mD7e+X41rM+h1P3A==
X-Received: by 2002:a65:40c4:: with SMTP id u4mr30729265pgp.186.1629700333764; 
 Sun, 22 Aug 2021 23:32:13 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d7sm17831032pgu.78.2021.08.22.23.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 23:32:13 -0700 (PDT)
Subject: Re: [PATCH v11 05/12] vhost-vdpa: Handle the failure of vdpa_reset()
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 hch@infradead.org, christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com,
 robin.murphy@arm.com
References: <20210818120642.165-1-xieyongji@bytedance.com>
 <20210818120642.165-6-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a9283bf7-bf24-b092-e79d-37c5c4f9e087@redhat.com>
Date: Mon, 23 Aug 2021 14:32:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818120642.165-6-xieyongji@bytedance.com>
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

CtTaIDIwMjEvOC8xOCDPws7nODowNiwgWGllIFlvbmdqaSDQtLXAOgo+IFRoZSB2ZHBhX3Jlc2V0
KCkgbWF5IGZhaWwgbm93LiBUaGlzIGFkZHMgY2hlY2sgdG8gaXRzIHJldHVybgo+IHZhbHVlIGFu
ZCBmYWlsIHRoZSB2aG9zdF92ZHBhX29wZW4oKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpZSBZb25n
amkgPHhpZXlvbmdqaUBieXRlZGFuY2UuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPgoKCj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyB8IDkgKysr
KysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jIGIvZHJpdmVycy92aG9zdC92
ZHBhLmMKPiBpbmRleCBiMWM5MWI0ZGIwYmEuLmQ5OWQ3NWFkMzBjYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gQEAgLTEx
NiwxMiArMTE2LDEzIEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZkcGFfdW5zZXR1cF92cV9pcnEoc3Ry
dWN0IHZob3N0X3ZkcGEgKnYsIHUxNiBxaWQpCj4gICAJaXJxX2J5cGFzc191bnJlZ2lzdGVyX3By
b2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lk
IHZob3N0X3ZkcGFfcmVzZXQoc3RydWN0IHZob3N0X3ZkcGEgKnYpCj4gK3N0YXRpYyBpbnQgdmhv
c3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmRw
YV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+ICAgCj4gLQl2ZHBhX3Jlc2V0KHZkcGEpOwo+ICAg
CXYtPmluX2JhdGNoID0gMDsKPiArCj4gKwlyZXR1cm4gdmRwYV9yZXNldCh2ZHBhKTsKPiAgIH0K
PiAgIAo+ICAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9nZXRfZGV2aWNlX2lkKHN0cnVjdCB2aG9z
dF92ZHBhICp2LCB1OCBfX3VzZXIgKmFyZ3ApCj4gQEAgLTg2OCw3ICs4NjksOSBAQCBzdGF0aWMg
aW50IHZob3N0X3ZkcGFfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmls
ZXApCj4gICAJCXJldHVybiAtRUJVU1k7Cj4gICAKPiAgIAludnFzID0gdi0+bnZxczsKPiAtCXZo
b3N0X3ZkcGFfcmVzZXQodik7Cj4gKwlyID0gdmhvc3RfdmRwYV9yZXNldCh2KTsKPiArCWlmIChy
KQo+ICsJCWdvdG8gZXJyOwo+ICAgCj4gICAJdnFzID0ga21hbGxvY19hcnJheShudnFzLCBzaXpl
b2YoKnZxcyksIEdGUF9LRVJORUwpOwo+ICAgCWlmICghdnFzKSB7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVA
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
