Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6B3A6C73
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 18:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C81404CF;
	Mon, 14 Jun 2021 16:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNygmYniG4ya; Mon, 14 Jun 2021 16:52:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 723FE404C8;
	Mon, 14 Jun 2021 16:52:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA95C000B;
	Mon, 14 Jun 2021 16:52:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 236ABC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BA3605AE
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xt3cE0NoQerm for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52198600B9
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 16:51:59 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G3cnm2zFZz6wZG;
 Tue, 15 Jun 2021 00:47:56 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (7.185.36.74) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 00:51:53 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 00:51:52 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2176.012; Mon, 14 Jun 2021 17:51:50 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH v5 7/8] iommu/arm-smmu: Get associated RMR info and
 install bypass SMR
Thread-Topic: [PATCH v5 7/8] iommu/arm-smmu: Get associated RMR info and
 install bypass SMR
Thread-Index: AQHXUIyLvua7xjhPQkeDex9n58702KsTV/iAgACATdA=
Date: Mon, 14 Jun 2021 16:51:50 +0000
Message-ID: <9348e07e23db4522b79318b81937f221@huawei.com>
References: <20210524110222.2212-1-shameerali.kolothum.thodi@huawei.com>
 <20210524110222.2212-8-shameerali.kolothum.thodi@huawei.com>
 <2bc3ae21-f2af-ee2c-5e9d-d47633e0439e@arm.com>
In-Reply-To: <2bc3ae21-f2af-ee2c-5e9d-d47633e0439e@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.90.219]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jon@solid-run.com" <jon@solid-run.com>, Linuxarm <linuxarm@huawei.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 yangyicong <yangyicong@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iaW4gTXVycGh5IFtt
YWlsdG86cm9iaW4ubXVycGh5QGFybS5jb21dDQo+IFNlbnQ6IDE0IEp1bmUgMjAyMSAxMTowNg0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsNCj4gaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcNCj4gQ2M6IGpvbkBzb2xpZC1ydW4uY29tOyBMaW51eGFybSA8bGludXhhcm1AaHVhd2Vp
LmNvbT47DQo+IHN0ZXZlbi5wcmljZUBhcm0uY29tOyBHdW9oYW5qdW4gKEhhbmp1biBHdW8pIDxn
dW9oYW5qdW5AaHVhd2VpLmNvbT47DQo+IHlhbmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNv
bT47IFNhbWkuTXVqYXdhckBhcm0uY29tOw0KPiB3YW5naHVpcWlhbmcgPHdhbmdodWlxaWFuZ0Bo
dWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDcvOF0gaW9tbXUvYXJtLXNtbXU6
IEdldCBhc3NvY2lhdGVkIFJNUiBpbmZvIGFuZA0KPiBpbnN0YWxsIGJ5cGFzcyBTTVINCj4gDQo+
IE9uIDIwMjEtMDUtMjQgMTI6MDIsIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6DQo+ID4gRnJvbTog
Sm9uIE5ldHRsZXRvbiA8am9uQHNvbGlkLXJ1bi5jb20+DQo+ID4NCj4gPiBDaGVjayBpZiB0aGVy
ZSBpcyBhbnkgUk1SIGluZm8gYXNzb2NpYXRlZCB3aXRoIHRoZSBkZXZpY2VzIGJlaGluZA0KPiA+
IHRoZSBTTU1VIGFuZCBpZiBhbnksIGluc3RhbGwgYnlwYXNzIFNNUnMgZm9yIHRoZW0uIFRoaXMg
aXMgdG8NCj4gPiBrZWVwIGFueSBvbmdvaW5nIHRyYWZmaWMgYXNzb2NpYXRlZCB3aXRoIHRoZXNl
IGRldmljZXMgYWxpdmUNCj4gPiB3aGVuIHdlIGVuYWJsZS9yZXNldCBTTU1VIGR1cmluZyBwcm9i
ZSgpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uIE5ldHRsZXRvbiA8am9uQHNvbGlkLXJ1
bi5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJt
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFtZWVyIEtvbG90aHVtDQo+IDxzaGFtZWVyYWxp
LmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2lvbW11
L2FybS9hcm0tc21tdS9hcm0tc21tdS5jIHwgNjUNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11L2FybS1zbW11LmMNCj4gYi9kcml2
ZXJzL2lvbW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jDQo+ID4gaW5kZXggNmY3MmM0ZDIwOGNh
Li41NmRiM2QzMjM4ZmMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9hcm0vYXJtLXNt
bXUvYXJtLXNtbXUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11L2FybS1z
bW11LmMNCj4gPiBAQCAtMjA0Miw2ICsyMDQyLDY3IEBAIGVycl9yZXNldF9wbGF0Zm9ybV9vcHM6
IF9fbWF5YmVfdW51c2VkOw0KPiA+ICAgCXJldHVybiBlcnI7DQo+ID4gICB9DQo+ID4NCj4gPiAr
c3RhdGljIHZvaWQgYXJtX3NtbXVfcm1yX2luc3RhbGxfYnlwYXNzX3NtcihzdHJ1Y3QgYXJtX3Nt
bXVfZGV2aWNlDQo+ICpzbW11KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIHJtcl9s
aXN0Ow0KPiA+ICsJc3RydWN0IGlvbW11X3Jlc3ZfcmVnaW9uICplOw0KPiA+ICsJaW50IGksIGNu
dCA9IDA7DQo+ID4gKwl1MzIgc21yOw0KPiA+ICsJdTMyIHJlZzsNCj4gPiArDQo+ID4gKwlJTklU
X0xJU1RfSEVBRCgmcm1yX2xpc3QpOw0KPiA+ICsJaWYgKGlvbW11X2RtYV9nZXRfcm1ycyhkZXZf
Zndub2RlKHNtbXUtPmRldiksICZybXJfbGlzdCkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4g
PiArCXJlZyA9IGFybV9zbW11X2dyMF9yZWFkKHNtbXUsIEFSTV9TTU1VX0dSMF9zQ1IwKTsNCj4g
PiArDQo+ID4gKwlpZiAoKHJlZyAmIEFSTV9TTU1VX3NDUjBfVVNGQ0ZHKSAmJiAhKHJlZyAmDQo+
IEFSTV9TTU1VX3NDUjBfQ0xJRU5UUEQpKSB7DQo+ID4gKwkJLyoNCj4gPiArCQkgKiBTTU1VIGlz
IGFscmVhZHkgZW5hYmxlZCBhbmQgZGlzYWxsb3dpbmcgYnlwYXNzLCBzbyBwcmVzZXJ2ZQ0KPiA+
ICsJCSAqIHRoZSBleGlzdGluZyBTTVJzDQo+ID4gKwkJICovDQo+ID4gKwkJZm9yIChpID0gMDsg
aSA8IHNtbXUtPm51bV9tYXBwaW5nX2dyb3VwczsgaSsrKSB7DQo+ID4gKwkJCXNtciA9IGFybV9z
bW11X2dyMF9yZWFkKHNtbXUsIEFSTV9TTU1VX0dSMF9TTVIoaSkpOw0KPiANCj4gVG8gcmVpdGVy
YXRlLCBqdXN0IGJlY2F1c2UgYSBib290bG9hZGVyL2NyYXNoZWQga2VybmVsL3doYXRldmVyIG1h
eSBoYXZlDQo+IGxlZnQgc29tZSBjb25maWd1cmF0aW9uIGJlaGluZCBkb2Vzbid0IG1lYW4gdGhh
dCBpdCBtYXR0ZXJzIChlLmcuIHdoYXQNCj4gaWYgdGhlc2UgU01ScyBhcmUgcG9pbnRpbmcgYXQg
dHJhbnNsYXRpb24gY29udGV4dHM/KS4gQWxsIHdlIHNob3VsZCBiZQ0KPiBkb2luZyBoZXJlIGlz
IHNldHRpbmcgdGhlIHJlbGV2YW50IFJNUiBhY2NvbW1vZGF0aW9ucyBpbiBvdXIgImNsZWFuDQo+
IHNsYXRlIiBzb2Z0d2FyZSBzdGF0ZSBiZWZvcmUgdGhlIHJlc2V0IHJvdXRpbmUgYXBwbGllcyBp
dCB0byB0aGUNCj4gaGFyZHdhcmUsIGp1c3QgbGlrZSBwYXRjaCAjNSBkb2VzIGZvciBTTU1VdjMu
DQo+IA0KPiBUcnlpbmcgdG8gc2FmZWx5IHJlc2V0IGFuIFNNTVUgd2hlbiB3ZSBkaXNjb3ZlciBp
dCB3aXRoIENMSUVOVFBEPTAgaXMNCj4gcmVhbGx5IGFub3RoZXIgaXNzdWUgZW50aXJlbHksIGFu
ZCBJJ2Qgc2F5IGlzIGJleW9uZCB0aGUgc2NvcGUgb2YgdGhpcw0KPiBzZXJpZXMNCj4gDQo+ID4g
KwkJCWlmICghRklFTERfR0VUKEFSTV9TTU1VX1NNUl9WQUxJRCwgc21yKSkNCj4gPiArCQkJCWNv
bnRpbnVlOw0KPiANCj4gTm90ZSB0aGF0IHRoYXQncyBub3QgZXZlbiBuZWNlc3NhcmlseSBjb3Jy
ZWN0ICh0aGFua3MgdG8gRVhJRFMpLg0KPiANCj4gPiArCQkJc21tdS0+c21yc1tpXS5pZCA9IEZJ
RUxEX0dFVChBUk1fU01NVV9TTVJfSUQsIHNtcik7DQo+ID4gKwkJCXNtbXUtPnNtcnNbaV0ubWFz
ayA9IEZJRUxEX0dFVChBUk1fU01NVV9TTVJfTUFTSywNCj4gc21yKTsNCj4gPiArCQkJc21tdS0+
c21yc1tpXS52YWxpZCA9IHRydWU7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWxp
c3RfZm9yX2VhY2hfZW50cnkoZSwgJnJtcl9saXN0LCBsaXN0KSB7DQo+ID4gKwkJdTMyIHNpZCA9
IGUtPmZ3X2RhdGEucm1yLnNpZDsNCj4gPiArDQo+ID4gKwkJaSA9IGFybV9zbW11X2ZpbmRfc21l
KHNtbXUsIHNpZCwgfjApOw0KPiA+ICsJCWlmIChpIDwgMCkNCj4gPiArCQkJY29udGludWU7DQo+
ID4gKwkJaWYgKHNtbXUtPnMyY3JzW2ldLmNvdW50ID09IDApIHsNCj4gPiArCQkJc21tdS0+c21y
c1tpXS5pZCA9IHNpZDsNCj4gPiArCQkJc21tdS0+c21yc1tpXS5tYXNrID0gfjA7DQo+IA0KPiBU
aGlzIGlzIHZlcnkgd3JvbmcgKGFzIGhhcyBub3cgYWxyZWFkeSBiZWVuIHBvaW50ZWQgb3V0KS4N
Cj4gDQo+ID4gKwkJCXNtbXUtPnNtcnNbaV0udmFsaWQgPSB0cnVlOw0KPiA+ICsJCX0NCj4gPiAr
CQlzbW11LT5zMmNyc1tpXS5jb3VudCsrOw0KPiA+ICsJCXNtbXUtPnMyY3JzW2ldLnR5cGUgPSBT
MkNSX1RZUEVfQllQQVNTOw0KPiA+ICsJCXNtbXUtPnMyY3JzW2ldLnByaXZjZmcgPSBTMkNSX1BS
SVZDRkdfREVGQVVMVDsNCj4gPiArCQlzbW11LT5zMmNyc1tpXS5jYm5keCA9IDB4ZmY7DQo+IA0K
PiBOaXQ6IGNibmR4IGlzIGxlZnQgdW5pbml0aWFsaXNlZCBmb3IgYnlwYXNzL2ZhdWx0IGVudHJp
ZXMgZWxzZXdoZXJlLCBzbw0KPiB0aGVyZSdzIGxpdHRsZSBwb2ludCB0b3VjaGluZyBpdCBoZXJl
Lg0KPiANCj4gPiArDQo+ID4gKwkJY250Kys7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKChy
ZWcgJiBBUk1fU01NVV9zQ1IwX1VTRkNGRykgJiYgIShyZWcgJg0KPiBBUk1fU01NVV9zQ1IwX0NM
SUVOVFBEKSkgew0KPiA+ICsJCS8qIFJlbW92ZSB0aGUgdmFsaWQgYml0IGZvciB1bnVzZWQgU01S
cyAqLw0KPiA+ICsJCWZvciAoaSA9IDA7IGkgPCBzbW11LT5udW1fbWFwcGluZ19ncm91cHM7IGkr
Kykgew0KPiA+ICsJCQlpZiAoc21tdS0+czJjcnNbaV0uY291bnQgPT0gMCkNCj4gPiArCQkJCXNt
bXUtPnNtcnNbaV0udmFsaWQgPSBmYWxzZTsNCj4gPiArCQl9DQo+IA0KPiBJZiB0aGlzIGRhbmNl
IGlzIG9ubHkgYWJvdXQgYXZvaWRpbmcgc3RyZWFtIG1hdGNoIGNvbmZsaWN0cyB3aGVuIHRyeWlu
Zw0KPiB0byByZXByb2dyYW0gbGl2ZSBTTVJzLCBzaW1wbHkgdHVybmluZyB0aGUgU01NVSBvZmYg
YmVmb3JlaGFuZCB3b3VsZCBiZQ0KPiBhIGxvdCBzaW1wbGVyLg0KDQpIaSBTdGV2ZS9Kb24sDQoN
ClNpbmNlIEkgZG9u4oCZdCBoYXZlIGFjY2VzcyB0byBhbiBTTU1VdjIgc2V0dXAsIHJlYWxseSBh
cHByZWNpYXRlIGlmIG9uZSBvZiB5b3UNCmNvdWxkIHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUg
YWJvdmUgY29tbWVudHMgYW5kIHByb3ZpZGUgbWUgd2l0aCBhIHRlc3RlZA0KY29kZSBzbyB0aGF0
IEkgY2FuIGluY2x1ZGUgaXQgaW4gdGhlIHY2IHRoYXQgSSBhbSBwbGFubmluZyB0byBzZW5kIG91
dCBzb29uLiANCg0KVGhhbmtzLA0KU2hhbWVlcg0KDQo+IFJvYmluLg0KPiANCj4gPiArCX0NCj4g
PiArDQo+ID4gKwlkZXZfbm90aWNlKHNtbXUtPmRldiwgIlx0cHJlc2VydmVkICVkIGJvb3QgbWFw
cGluZyVzXG4iLCBjbnQsDQo+ID4gKwkJICAgY250ID09IDEgPyAiIiA6ICJzIik7DQo+ID4gKwlp
b21tdV9kbWFfcHV0X3JtcnMoZGV2X2Z3bm9kZShzbW11LT5kZXYpLCAmcm1yX2xpc3QpOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBhcm1fc21tdV9kZXZpY2VfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgcmVzb3VyY2Ug
KnJlczsNCj4gPiBAQCAtMjE2OCw2ICsyMjI5LDEwIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZGV2
aWNlX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJfQ0KPiA+
DQo+ID4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc21tdSk7DQo+ID4gKw0KPiA+ICsJ
LyogQ2hlY2sgZm9yIFJNUnMgYW5kIGluc3RhbGwgYnlwYXNzIFNNUnMgaWYgYW55ICovDQo+ID4g
Kwlhcm1fc21tdV9ybXJfaW5zdGFsbF9ieXBhc3Nfc21yKHNtbXUpOw0KPiA+ICsNCj4gPiAgIAlh
cm1fc21tdV9kZXZpY2VfcmVzZXQoc21tdSk7DQo+ID4gICAJYXJtX3NtbXVfdGVzdF9zbXJfbWFz
a3Moc21tdSk7DQo+ID4NCj4gPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
