Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E061E57EF
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 08:53:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB664888DE;
	Thu, 28 May 2020 06:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Z4ksNzRHFqy; Thu, 28 May 2020 06:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2363E8886A;
	Thu, 28 May 2020 06:53:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0755AC016F;
	Thu, 28 May 2020 06:53:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 025F9C016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E15EE85531
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpPRmhhLsObq for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 06:53:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2DA5C85085
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:53:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n15so2592814pjt.4
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zbKuT3nrBchNOXLtoqggayeJJOXuYIPFyuAneEl5VZE=;
 b=WeIYDG9i+HPcpC+T7wLyd72laBytTR0RvEwehEj45sRWw4OKQzXYNNFynXnVehee4d
 Xz6/jjgw409iODdX8f+4nfB4ksOmJlLeRUjPatyd73dc4YdD/O6i/XN42ATrsS/CHqC2
 Hj1KqTS/6K1rdwTjZSmW73Clu5pi1g+wvul9mqCnXjpkHb3po6GXlCny3fXX4LNkVWWh
 +Rf0+FfG/tiIkuRFgH2XUOnYBAJUB98HYAgq5RhcSvah+qLAhflgOXk0g/sakA7NLXbh
 qEjIntovK2YBpTUr74m+FL9V9Iy1pdy/deZKUseiSeBwZTjQlJikyz4UUCdSr+OwEHgX
 9Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zbKuT3nrBchNOXLtoqggayeJJOXuYIPFyuAneEl5VZE=;
 b=jVtteDqAgLc/gKAUX/A/x7GMZu5b2T+EpDATANbQovu291FFGiIA7p0NX6d5YGo2/Z
 v/OVqfO98/5+lxSt9DENVzaBvb+5QbGO5tR2PrItkUC13IwYzI5oq6RCrSbb7H4kAqot
 qcDEWwRtVzEWu9cbzvfAQkX1kIjWgi6BSAHC1NuMr6abxyHaMTJ4XWE5+OdCohujAKiS
 3Vup82Ky14AgR/ocJBPIgxr2c1xh/hYrfu2w9MScHu9FU6ybuM80YCUWIGzbPep7lUJY
 PNlAd8avSd89iHznJ35mV3NAQsI0ZSxj1/ahPTUtrFRIUCf6mqneAb4NQGcCAzHle4wZ
 Urrw==
X-Gm-Message-State: AOAM532EMaXxWOUdUQw2ueD1nc8+zDabSFZfmotlZC2xElFn4tc4tP5J
 g2TCMUMb2D7StR62hT9OePco5Q==
X-Google-Smtp-Source: ABdhPJzZUXUIWStr7BtNwklBZN744dC8lv7AAZWH3qxAABW36QOxKh3qydTDu9mclcxQ1QgO9lDG4g==
X-Received: by 2002:a17:90a:d317:: with SMTP id
 p23mr2285917pju.107.1590648813784; 
 Wed, 27 May 2020 23:53:33 -0700 (PDT)
Received: from [10.140.6.42] ([45.135.186.12])
 by smtp.gmail.com with ESMTPSA id g18sm3799582pfq.146.2020.05.27.23.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 23:53:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] iommu: calling pci_fixup_iommu in iommu_fwspec_init
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1590493749-13823-1-git-send-email-zhangfei.gao@linaro.org>
 <1590493749-13823-3-git-send-email-zhangfei.gao@linaro.org>
 <20200527090115.GB179718@kroah.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <e8293663-7fb8-ee57-0b9f-b3057b8aae7d@linaro.org>
Date: Thu, 28 May 2020 14:53:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527090115.GB179718@kroah.com>
Content-Language: en-US
Cc: jean-philippe <jean-philippe@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 linux-pci@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, kenneth-lee-2012@foxmail.com,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
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

CgpPbiAyMDIwLzUvMjcg5LiL5Y2INTowMSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IE9u
IFR1ZSwgTWF5IDI2LCAyMDIwIGF0IDA3OjQ5OjA5UE0gKzA4MDAsIFpoYW5nZmVpIEdhbyB3cm90
ZToKPj4gQ2FsbGluZyBwY2lfZml4dXBfaW9tbXUgaW4gaW9tbXVfZndzcGVjX2luaXQsIHdoaWNo
IGFsbG9jCj4+IGlvbW11X2Z3bm9kZS4gU29tZSBwbGF0Zm9ybSBkZXZpY2VzIGFwcGVhciBhcyBQ
Q0kgYnV0IGFyZQo+PiBhY3R1YWxseSBvbiB0aGUgQU1CQSBidXMsIGFuZCB0aGV5IG5lZWQgZml4
dXAgaW4KPj4gZHJpdmVycy9wY2kvcXVpcmtzLmMgaGFuZGxpbmcgaW9tbXVfZndub2RlLgo+PiBT
byBjYWxsaW5nIHBjaV9maXh1cF9pb21tdSBhZnRlciBpb21tdV9md25vZGUgaXMgYWxsb2NhdGVk
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGFuZ2ZlaSBHYW8gPHpoYW5nZmVpLmdhb0BsaW5hcm8u
b3JnPgo+PiAtLS0KPj4gICBkcml2ZXJzL2lvbW11L2lvbW11LmMgfCA0ICsrKysKPj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lv
bW11L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4gaW5kZXggN2IzNzU0Mi4uZmI4
NGM0MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+ICsrKyBiL2RyaXZl
cnMvaW9tbXUvaW9tbXUuYwo+PiBAQCAtMjQxOCw2ICsyNDE4LDEwIEBAIGludCBpb21tdV9md3Nw
ZWNfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBmd25vZGVfaGFuZGxlICppb21tdV9m
d25vZGUsCj4+ICAgCWZ3c3BlYy0+aW9tbXVfZndub2RlID0gaW9tbXVfZndub2RlOwo+PiAgIAlm
d3NwZWMtPm9wcyA9IG9wczsKPj4gICAJZGV2X2lvbW11X2Z3c3BlY19zZXQoZGV2LCBmd3NwZWMp
Owo+PiArCj4+ICsJaWYgKGRldl9pc19wY2koZGV2KSkKPj4gKwkJcGNpX2ZpeHVwX2RldmljZShw
Y2lfZml4dXBfaW9tbXUsIHRvX3BjaV9kZXYoZGV2KSk7Cj4gV2h5IGNhbid0IHRoZSBjYWxsZXIg
ZG8gdGhpcyBhcyBpdCAia25vd3MiIGl0IGlzIGEgUENJIGRldmljZSBhdCB0aGF0Cj4gcG9pbnQg
aW4gdGltZSwgcmlnaHQ/ClB1dHRpbmcgZml4dXAgaGVyZSBpcyBiZWNhdXNlCjEuIGlvbW11X2Z3
c3BlYyBoYXMgYmVlbiBhbGxvY2F0ZWQKMi4gaW9tbXVfZndzcGVjX2luaXQgd2lsbCBiZSBjYWxs
ZWQgYnkgb2ZfcGNpX2lvbW11X2luaXQgYW5kIAppb3J0X3BjaV9pb21tdV9pbml0LCBjb3Zlcmlu
ZyBib3RoIGFjcGkgYW5kIGR0CgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
