Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6FA3DE7A9
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 09:58:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B8A4040D;
	Tue,  3 Aug 2021 07:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfT1IaJqeIzI; Tue,  3 Aug 2021 07:58:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1F579403BB;
	Tue,  3 Aug 2021 07:58:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 084D0C001F;
	Tue,  3 Aug 2021 07:58:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BCFDC0021
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D85F403EF
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kTN6dh3imCH for <iommu@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 601FB403BB
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627977525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4067Q/uBr5whrrksAorpAMgFNv8fx79XPkLrnKf4gpY=;
 b=P3HXDnXNBg0Olc1CaC0uhBxqpk6zhkcneENMGssuGwn+oFycGJtjGOAherIbr3hfV5oXcS
 L3GE5C6bpKHAZmB/Wlfeumesqv75q+ZJuXU52oZzzSHdb2qCntZb1C7xGpo/SM1Ydjwv7p
 fhR2hFfyhl0uyGz8DFMIGqqXE/kKxiY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-RUNznHvsPymWWk-xfGHmQA-1; Tue, 03 Aug 2021 03:58:41 -0400
X-MC-Unique: RUNznHvsPymWWk-xfGHmQA-1
Received: by mail-pj1-f70.google.com with SMTP id
 16-20020a17090a1990b029017582e03c3bso2196546pji.7
 for <iommu@lists.linux-foundation.org>; Tue, 03 Aug 2021 00:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4067Q/uBr5whrrksAorpAMgFNv8fx79XPkLrnKf4gpY=;
 b=ojTKJbkNndmZgCfkztSZCfquDWbFp64yHEB/+V8EkqAgD03l8v5SnDJGxGUTWtX1st
 pA7Jz0XfL18Wcb/ECRD8SZTf3tckZt8z09zOcCUQgQ41PdGPPSc/rUjHDcOi59Z39UT0
 Jf6tdLwOwqVAkJSL7Rw9tkAEd2jXMd7e51/Xpc5AWu0YoMoeDtsDeD3qT33BQgZIxp6A
 cftwYEWueF6w6dmpuJJWQStOV+0xBpaAmZVP49vIv0DZ0NBA6GPSolLAwidiqd3PK7Qq
 30Jc+gODBJ3PXDfrxXk+Td4s+RwcLt9Jcp9Lm7DQqR+nFydRcBJCLQq2ldT4EgR89Amm
 7LiQ==
X-Gm-Message-State: AOAM532Njh0mH6ChWUozYbQGYn47UutOg8W2rzBmUMxhRj+tx/Wrn8Fw
 JqwqA6LnzIhO4m6pcbdJXBG3SOZnomHnxidM9dYQ4uEq7QgXiX98zLnJBqMmbDkZAQKAD9vpKoV
 8dcZ9ZuXPHNljKrR+BMWgumnfZsg8+g==
X-Received: by 2002:a62:64ce:0:b029:3b8:90c:6eec with SMTP id
 y197-20020a6264ce0000b02903b8090c6eecmr13054233pfb.9.1627977520779; 
 Tue, 03 Aug 2021 00:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjX5wUayvV2kr5HqNyIW/IueFG/FKVhos2G8U/pZi0sFBb3YPj3+qYU1BLVJyBkEZqQdqW6A==
X-Received: by 2002:a62:64ce:0:b029:3b8:90c:6eec with SMTP id
 y197-20020a6264ce0000b02903b8090c6eecmr13054211pfb.9.1627977520538; 
 Tue, 03 Aug 2021 00:58:40 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s133sm4953282pfs.190.2021.08.03.00.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 00:58:40 -0700 (PDT)
Subject: Re: [PATCH v10 04/17] vdpa: Fail the vdpa_reset() if fail to set
 device status to zero
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 hch@infradead.org, christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-5-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <39a191f6-555b-d2e6-e712-735b540526d0@redhat.com>
Date: Tue, 3 Aug 2021 15:58:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729073503.187-5-xieyongji@bytedance.com>
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

CtTaIDIwMjEvNy8yOSDPws7nMzozNCwgWGllIFlvbmdqaSDQtLXAOgo+IFJlLXJlYWQgdGhlIGRl
dmljZSBzdGF0dXMgdG8gZW5zdXJlIGl0J3Mgc2V0IHRvIHplcm8gZHVyaW5nCj4gcmVzZXR0aW5n
LiBPdGhlcndpc2UsIGZhaWwgdGhlIHZkcGFfcmVzZXQoKSBhZnRlciB0aW1lb3V0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogWGllIFlvbmdqaSA8eGlleW9uZ2ppQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4g
ICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDE1ICsrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3ZkcGEuaCBiL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gaW5kZXggNDA2ZDUz
YTYwNmFjLi5kMWE4MGVmMDUwODkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC92ZHBhLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+IEBAIC02LDYgKzYsNyBAQAo+ICAgI2luY2x1
ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAg
I2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxiLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5o
Pgo+ICAgCj4gICAvKioKPiAgICAqIHN0cnVjdCB2ZHBhX2NhbGxsYmFjayAtIHZEUEEgY2FsbGJh
Y2sgZGVmaW5pdGlvbi4KPiBAQCAtMzQwLDEyICszNDEsMjQgQEAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgZGV2aWNlICp2ZHBhX2dldF9kbWFfZGV2KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldikKPiAg
IAlyZXR1cm4gdmRldi0+ZG1hX2RldjsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW5saW5lIHZvaWQg
dmRwYV9yZXNldChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpCj4gKyNkZWZpbmUgVkRQQV9SRVNF
VF9USU1FT1VUX01TIDEwMDAKPiArCj4gK3N0YXRpYyBpbmxpbmUgaW50IHZkcGFfcmVzZXQoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZGV2KQo+ICAgewo+ICAgCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZp
Z19vcHMgKm9wcyA9IHZkZXYtPmNvbmZpZzsKPiArCWludCB0aW1lb3V0ID0gMDsKPiAgIAo+ICAg
CXZkZXYtPmZlYXR1cmVzX3ZhbGlkID0gZmFsc2U7Cj4gICAJb3BzLT5zZXRfc3RhdHVzKHZkZXYs
IDApOwo+ICsJd2hpbGUgKG9wcy0+Z2V0X3N0YXR1cyh2ZGV2KSkgewo+ICsJCXRpbWVvdXQgKz0g
MjA7Cj4gKwkJaWYgKHRpbWVvdXQgPiBWRFBBX1JFU0VUX1RJTUVPVVRfTVMpCj4gKwkJCXJldHVy
biAtRUlPOwo+ICsKPiArCQltc2xlZXAoMjApOwo+ICsJfQoKCkkgd29uZGVyIGlmIGl0J3MgYmV0
dGVyIHRvIGRvIHRoaXMgaW4gdGhlIHZEUEEgcGFyZW50PwoKVGhhbmtzCgoKPiArCj4gKwlyZXR1
cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGlubGluZSBpbnQgdmRwYV9zZXRfZmVhdHVyZXMo
c3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1NjQgZmVhdHVyZXMpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVA
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
