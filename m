Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240038C69B
	for <lists.iommu@lfdr.de>; Fri, 21 May 2021 14:34:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4447404BE;
	Fri, 21 May 2021 12:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTXFxFq-QeMa; Fri, 21 May 2021 12:34:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655A24056F;
	Fri, 21 May 2021 12:34:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D45CC001C;
	Fri, 21 May 2021 12:34:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91855C0001
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 12:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731FD83B9C
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 12:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMIcOdcWpYCG for <iommu@lists.linux-foundation.org>;
 Fri, 21 May 2021 12:34:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 375FC83B7F
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 12:34:38 +0000 (UTC)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmmFs12M7zlfbp;
 Fri, 21 May 2021 20:32:17 +0800 (CST)
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 20:34:34 +0800
Received: from [127.0.0.1] (10.40.193.166) by dggeme756-chm.china.huawei.com
 (10.3.19.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 20:34:34 +0800
Subject: Re: [PATCH] dma-iommu: Add a check to avoid dereference null pointer
 in function iommu_dma_map_sg()
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>, 
 <hch@lst.de>
References: <1621566334-93468-1-git-send-email-chenxiang66@hisilicon.com>
 <56f7f4fa-8d62-cc6e-cb1c-adbf82e34d31@arm.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <8a323d71-006f-fe3c-4ecc-a69d85a6409a@hisilicon.com>
Date: Fri, 21 May 2021 20:34:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <56f7f4fa-8d62-cc6e-cb1c-adbf82e34d31@arm.com>
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org,
 linuxarm@huawei.com
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

CgrlnKggMjAyMS81LzIxIDE4OjM2LCBSb2JpbiBNdXJwaHkg5YaZ6YGTOgo+IE9uIDIwMjEtMDUt
MjEgMDQ6MDUsIGNoZW54aWFuZyB3cm90ZToKPj4gRnJvbTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5n
NjZAaGlzaWxpY29uLmNvbT4KPj4KPj4gVGhlIGlzc3VlIGlzIHJlcG9ydGVkIGJ5IHRvb2wgVHNj
YW5Db2RlLCBhbmQgaXQgaXMgcG9zc2libGUgdG8gZGVmZXJlbmNlCj4+IG51bGwgcG9pbnRlciB3
aGVuIHByZXYgaXMgTlVMTCB3aGljaCBpcyB0aGUgaW5pdGlhbCB2YWx1ZS4KPgo+IE5vIGl0IGlz
bid0LiBUaGlzIGlzIGxpdGVyYWxseSBleHBsYWluZWQgaW4gdGhlIGNvbW1lbnQgdmlzaWJsZSBp
biB0aGUgCj4gZGlmZiBjb250ZXh0IGJlbG93Li4uCj4KPiBSb2Jpbi4KCm9rLCB0aGFua3MKCj4K
Pj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4K
Pj4gLS0tCj4+ICAgZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYyB8IDIgKy0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMgYi9kcml2ZXJzL2lvbW11L2RtYS1pb21tdS5jCj4+
IGluZGV4IDRjYjYzYjIuLjg4YTRmMzQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvZG1h
LWlvbW11LmMKPj4gKysrIGIvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwo+PiBAQCAtMTA0Miw3
ICsxMDQyLDcgQEAgc3RhdGljIGludCBpb21tdV9kbWFfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRl
diwgCj4+IHN0cnVjdCBzY2F0dGVybGlzdCAqc2csCj4+ICAgICAgICAgICAgKiAgIGlvdmFfbGVu
ID09IDAsIHRodXMgd2UgY2Fubm90IGRlcmVmZXJlbmNlIHByZXYgdGhlIGZpcnN0Cj4+ICAgICAg
ICAgICAgKiAgIHRpbWUgdGhyb3VnaCBoZXJlIChpLmUuIGJlZm9yZSBpdCBoYXMgYSBtZWFuaW5n
ZnVsIAo+PiB2YWx1ZSkuCj4+ICAgICAgICAgICAgKi8KPj4gLSAgICAgICAgaWYgKHBhZF9sZW4g
JiYgcGFkX2xlbiA8IHNfbGVuZ3RoIC0gMSkgewo+PiArICAgICAgICBpZiAocHJldiAmJiBwYWRf
bGVuICYmIHBhZF9sZW4gPCBzX2xlbmd0aCAtIDEpIHsKPj4gICAgICAgICAgICAgICBwcmV2LT5s
ZW5ndGggKz0gcGFkX2xlbjsKPj4gICAgICAgICAgICAgICBpb3ZhX2xlbiArPSBwYWRfbGVuOwo+
PiAgICAgICAgICAgfQo+Pgo+Cj4gLgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
