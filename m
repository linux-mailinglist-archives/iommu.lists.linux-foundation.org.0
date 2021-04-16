Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 64457361BBF
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 10:56:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64DD605FB;
	Fri, 16 Apr 2021 08:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yIYSeJuNHcy; Fri, 16 Apr 2021 08:56:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1598E605EF;
	Fri, 16 Apr 2021 08:56:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 834C5C000D;
	Fri, 16 Apr 2021 08:56:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF8D2C000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 08:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB505605FB
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 08:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7ZzkLSYbRgl for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 08:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DC7E605EF
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 08:56:26 +0000 (UTC)
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FM8yR6WPNz689NW;
 Fri, 16 Apr 2021 16:49:03 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 16 Apr 2021 10:56:23 +0200
Received: from [10.47.83.179] (10.47.83.179) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 16 Apr
 2021 09:56:22 +0100
Subject: Re: [PATCH v2] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, <robin.murphy@arm.com>,
 <will@kernel.org>, <joro@8bytes.org>
References: <1618458725-244583-1-git-send-email-chenxiang66@hisilicon.com>
 <80a373d8-0136-b026-9b72-d558c0dd2a66@huawei.com>
 <10c2cba9-9515-a555-314e-f5449dfd67f5@hisilicon.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <193ec6d8-f68a-210b-5172-c97591019b7f@huawei.com>
Date: Fri, 16 Apr 2021 09:53:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <10c2cba9-9515-a555-314e-f5449dfd67f5@hisilicon.com>
Content-Language: en-US
X-Originating-IP: [10.47.83.179]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
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

T24gMTYvMDQvMjAyMSAwNDozMCwgY2hlbnhpYW5nIChNKSB3cm90ZToKPj4KPj4geW91IG5lZWQg
dG8gbWFrZSB0aGlzOgo+PiDCoMKgwqAgaWYgKGlvdmEpCj4+IMKgwqDCoMKgwqDCoMKgIGZyZWVf
aW92YV9tZW0oaW92YSk7Cj4+Cj4+IGFzIGZyZWVfaW92YV9tZW0oaW92YSkgZGVyZWZlcmVuY2Vz
IGlvdmE6Cj4+Cj4+IGlmIChpb3ZhLT5wZm5fbG8gIT0gSU9WQV9BTkNIT1IpCj4+IMKgwqDCoCBr
bWVtX2NhY2hlX2ZyZWUoaW92YV9jYWNoZSwgaW92YSkKPj4KPj4gU28gaWYgaW92YSB3ZXJlIE5V
TEwsIHdlIGNyYXNoLgo+Pgo+PiBPciB5b3UgY2FuIG1ha2UgZnJlZV9pb3ZhX21lbSgpIE5VTEwg
c2FmZS4KPiAKPiBSaWdodCwgaXQgaGFzIHRoZSBpc3N1ZS4gV2hhdCBhYm91dCBjaGFuZ2luZyBp
dCBhcyBiZWxvdz8KPiAKPiBAQCAtNDcyLDEwICs0NzIsMTMgQEAgZnJlZV9pb3ZhKHN0cnVjdCBp
b3ZhX2RvbWFpbiAqaW92YWQsIHVuc2lnbmVkIGxvbmcgCj4gcGZuKQo+IAo+ICDCoMKgwqDCoMKg
wqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmaW92YWQtPmlvdmFfcmJ0cmVlX2xvY2ssIGZsYWdzKTsK
PiAgwqDCoMKgwqDCoMKgwqAgaW92YSA9IHByaXZhdGVfZmluZF9pb3ZhKGlvdmFkLCBwZm4pOwo+
IC3CoMKgwqDCoMKgwqAgaWYgKGlvdmEpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cHJpdmF0ZV9mcmVlX2lvdmEoaW92YWQsIGlvdmEpOwo+ICvCoMKgwqDCoMKgwqAgaWYgKCFpb3Zh
KSB7Cj4gKyBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb3ZhZC0+aW92YV9yYnRyZWVfbG9jaywg
ZmxhZ3MpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiArwqDCoMKg
wqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgIHJlbW92ZV9pb3ZhKGlvdmFkLCBpb3ZhKTsKPiAgwqDC
oMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW92YWQtPmlvdmFfcmJ0cmVlX2xv
Y2ssIGZsYWdzKTsKPiAtCj4gK8KgwqDCoMKgwqDCoCBmcmVlX2lvdmFfbWVtKGlvdmEpOwo+ICDC
oH0KPiAgwqBFWFBPUlRfU1lNQk9MX0dQTChmcmVlX2lvdmEpOwoKSSBkb24ndCBmZWVsIHRvbyBz
dHJvbmdseSBhYm91dCBob3cgaXQncyBkb25lLgoKUGxlYXNlIG5vdGUgdGhhdCBrbWVtX2NhY2hl
X2ZyZWUoKSBpcyBub3QgTlVMTCBzYWZlLiBTbyB0aGUgTlVMTCBjaGVjayAKY291bGQgYmUgYWRk
ZWQgaW4gZnJlZV9pb3ZhX21lbSgpLCBidXQgd2UgcHJvYiBkb24ndCB3YW50IHNpbGVudCAKZnJl
ZV9pb3ZhX21lbShOVUxMKSBjYWxscywgc28gSSB3b3VsZCBzdGljayB3aXRoIGNoYW5naW5nIGZy
ZWVfaW92YSgpLgoKVGhhbmtzLApKb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9pb21tdQ==
