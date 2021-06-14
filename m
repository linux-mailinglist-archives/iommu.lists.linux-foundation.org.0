Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E253A5E39
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 10:17:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D09480034;
	Mon, 14 Jun 2021 08:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 668yZ0F0MZoB; Mon, 14 Jun 2021 08:17:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 250BE83A72;
	Mon, 14 Jun 2021 08:17:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFB95C0024;
	Mon, 14 Jun 2021 08:17:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 719C2C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FBBA607A1
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-a31rUl1UZi for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 08:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAB5760642
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:17:20 +0000 (UTC)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G3P9Y2DN7z6H7X8;
 Mon, 14 Jun 2021 16:04:17 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 14 Jun 2021 10:17:18 +0200
Received: from [10.47.95.26] (10.47.95.26) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 14 Jun
 2021 09:17:17 +0100
Subject: Re: [PATCH v12 2/5] iommu: Enhance IOMMU default DMA mode build
 options
To: Lu Baolu <baolu.lu@linux.intel.com>, <joro@8bytes.org>, <will@kernel.org>, 
 <dwmw2@infradead.org>, <robin.murphy@arm.com>
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-3-git-send-email-john.garry@huawei.com>
 <a4c85f00-918b-5952-7585-8e1110ac5195@linux.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <953e1210-c88f-3e50-fbb9-cc559923829e@huawei.com>
Date: Mon, 14 Jun 2021 09:11:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <a4c85f00-918b-5952-7585-8e1110ac5195@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.47.95.26]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
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

T24gMTIvMDYvMjAyMSAwMjoyMSwgTHUgQmFvbHUgd3JvdGU6Cj4gT24gMjAyMS82LzExIDIwOjIw
LCBKb2huIEdhcnJ5IHdyb3RlOgo+PiArY29uZmlnIElPTU1VX0RFRkFVTFRfTEFaWQo+PiArwqDC
oMKgIGJvb2wgImxhenkiCj4+ICvCoMKgwqAgaGVscAo+PiArwqDCoMKgwqDCoCBTdXBwb3J0IGxh
enkgbW9kZSwgd2hlcmUgZm9yIGV2ZXJ5IElPTU1VIERNQSB1bm1hcCBvcGVyYXRpb24sIHRoZQo+
PiArwqDCoMKgwqDCoCBmbHVzaCBvcGVyYXRpb24gb2YgSU9UTEIgYW5kIHRoZSBmcmVlIG9wZXJh
dGlvbiBvZiBJT1ZBIGFyZSAKPj4gZGVmZXJyZWQuCj4+ICvCoMKgwqDCoMKgIFRoZXkgYXJlIG9u
bHkgZ3VhcmFudGVlZCB0byBiZSBkb25lIGJlZm9yZSB0aGUgcmVsYXRlZCBJT1ZBIAo+PiB3aWxs
IGJlCj4+ICvCoMKgwqDCoMKgIHJldXNlZC4KPj4gKwo+PiArwqDCoMKgwqDCoCBUaGUgaXNvbGF0
aW9uIHByb3ZpZGVkIGluIHRoaXMgbW9kZSBpcyBub3QgYXMgc2VjdXJlIGFzIFNUUklDVCAKPj4g
bW9kZSwKPj4gK8KgwqDCoMKgwqAgc3VjaCB0aGF0IGEgdnVsbmVyYWJsZSB0aW1lIHdpbmRvdyBt
YXkgYmUgY3JlYXRlZCBiZXR3ZWVuIHRoZSBETUEKPj4gK8KgwqDCoMKgwqAgdW5tYXAgYW5kIHRo
ZSBtYXBwaW5nIGZpbmFsbHkgYmVpbmcgdG9ybiBkb3duIGluIHRoZSBJT01NVSwgCj4+IHdoZXJl
IHRoZQo+PiArwqDCoMKgwqDCoCBkZXZpY2UgY2FuIHN0aWxsIGFjY2VzcyB0aGUgc3lzdGVtIG1l
bW9yeS4gSG93ZXZlciB0aGlzIG1vZGUgbWF5Cj4gCj4gIiAuLi4gYW5kIHRoZSBtYXBwaW5ncyBj
YWNoZWQgaW4gdGhlIElPTU1VIElPVExCIG9yIGRldmljZSBUTEIgZmluYWxseQo+IGJlaW5nIGlu
dmFsaWRhdGVkLCB3aGVyZSB0aGUgZGV2aWNlIHByb2JhYmx5IGNhbiBzdGlsbCBhY2Nlc3MgdGhl
IG1lbW9yeQo+IHdoaWNoIGhhcyBhbHJlYWR5IGJlZW4gdW5tYXBwZWQgYnkgdGhlIGRldmljZSBk
cml2ZXIuIgoKb2ssIEkgY2FuIHRyeSB0byBpbmNvcnBvcmF0ZSBzb21lIG9mIHRoaXMgd29yZGlu
Zy4KCkFzIGZvciB0aGlzOgoKT24gMTIvMDYvMjAyMSAwMzoxMiwgTHUgQmFvbHUgd3JvdGU6CiA+
IE9uIDIwMjEvNi8xMSAyMDoyMCwgSm9obiBHYXJyeSB3cm90ZToKID4+ICtjaG9pY2UKID4+ICsg
ICAgcHJvbXB0ICJJT01NVSBkZWZhdWx0IERNQSBtb2RlIgogPgogPiBUaGlzIGlzIG5vdCBleHBs
aWNpdC4KID4KID4gSG93IGFib3V0CiA+CiA+ICJJT01NVSBETUEgZGVmYXVsdCBjYWNoZSBpbnZh
bGlkYXRpb24gcG9saWN5IgogPgogPiA/CiA+CgpPSywgYnV0IEknZCByYXRoZXIgdXNlIElPVExC
LCBhcyB0aGF0IGJldHRlciBtYXRjaGVzIHRoZSByZWxldmFudCAKaW9tbXUuYyBBUEkgbmFtZSAo
aW9tbXVfb3BzLmZsdXNoX2lvdGxiX2FsbCkuCgpUaGFua3MsCmpvaG4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
