Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AC133D13
	for <lists.iommu@lfdr.de>; Wed,  8 Jan 2020 09:27:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9C6085BC2;
	Wed,  8 Jan 2020 08:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PH5t7eF6vReH; Wed,  8 Jan 2020 08:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B41EE85B94;
	Wed,  8 Jan 2020 08:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90167C0881;
	Wed,  8 Jan 2020 08:27:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9A09C0881
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jan 2020 08:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D2F25203E4
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jan 2020 08:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbHaZAG8g7RU for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by silver.osuosl.org (Postfix) with ESMTPS id 34C7820116
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jan 2020 08:27:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0088RbCH062712;
 Wed, 8 Jan 2020 02:27:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578472057;
 bh=wFg73YVwQfnxGOrhgZ1oB4k+pVwwAVzHuobXhZs/WPE=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=s6jPSG/Dg7LeFnTjKRbwqQIh9PM+sh+yDM6we0Zo690JXIvyTuaotMEfXRN7/ARpr
 U9JfbMMwPcA7KgR10n0ENhW3q5w+rpf32s80He+JexKznrCnC7Qv62G9QEQKvwFjvH
 WX3gri9IZjCUknueOUlRsrfA32yaVNeVTR7K788o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0088Rb7n103987
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Jan 2020 02:27:37 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 02:27:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 02:27:36 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0088RY1H106131;
 Wed, 8 Jan 2020 02:27:34 -0600
Subject: Re: [PATCH 2/2] arm: use swiotlb for bounce buffer on LPAE configs
To: Christoph Hellwig <hch@lst.de>
References: <20190709142011.24984-1-hch@lst.de>
 <20190709142011.24984-3-hch@lst.de>
 <9bbd87c2-5b6c-069c-dd22-5105dc827428@ti.com> <20191219150259.GA3003@lst.de>
 <20106a84-8247-fa78-2381-2c94fad9cb6a@ti.com>
Message-ID: <eca457b6-c685-59ac-1dec-5b28e4430e1d@ti.com>
Date: Wed, 8 Jan 2020 10:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20106a84-8247-fa78-2381-2c94fad9cb6a@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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
From: Peter Ujfalusi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgQ2hyaXN0b3BoLAoKT24gMTkvMTIvMjAxOSAxNy4yMCwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6
Cj4gSGkgQ2hyaXN0b3BoLAo+IAo+IE9uIDE5LzEyLzIwMTkgMTcuMDIsIENocmlzdG9waCBIZWxs
d2lnIHdyb3RlOgo+PiBIaSBQZXRlciwKPj4KPj4gY2FuIHlvdSB0cnkgdGhlIHBhdGNoIGJlbG93
IChpdCB3aWxsIG5lZWQgdG8gYmUgc3BsaXQgaW50byB0d28pOgo+IAo+IFRoYW5rIHlvdSEKPiAK
PiBVbmZvcnR1bmF0ZWx5IGl0IGRvZXMgbm90IGhlbHA6Cj4gWyAgICAwLjU5NjIwOF0gZWRtYTog
cHJvYmUgb2YgMjcwMDAwMC5lZG1hIGZhaWxlZCB3aXRoIGVycm9yIC01Cj4gWyAgICAwLjU5NjYy
Nl0gZWRtYTogcHJvYmUgb2YgMjcyODAwMC5lZG1hIGZhaWxlZCB3aXRoIGVycm9yIC01Cj4gLi4u
Cj4gWyAgICAyLjEwODYwMl0gc2RoY2ktb21hcCAyMzAwMDAwMC5tbWM6IEdvdCBDRCBHUElPCj4g
WyAgICAyLjExMzg5OV0gbW1jMDogRmFpbGVkIHRvIHNldCAzMi1iaXQgRE1BIG1hc2suCj4gWyAg
ICAyLjExODU5Ml0gbW1jMDogTm8gc3VpdGFibGUgRE1BIGF2YWlsYWJsZSAtIGZhbGxpbmcgYmFj
ayB0byBQSU8KPiBbICAgIDIuMTU5MDM4XSBtbWMwOiBTREhDSSBjb250cm9sbGVyIG9uIDIzMDAw
MDAwLm1tYyBbMjMwMDAwMDAubW1jXQo+IHVzaW5nIFBJTwo+IFsgICAgMi4xNjc1MzFdIG1tYzE6
IEZhaWxlZCB0byBzZXQgMzItYml0IERNQSBtYXNrLgo+IFsgICAgMi4xNzIxOTJdIG1tYzE6IE5v
IHN1aXRhYmxlIERNQSBhdmFpbGFibGUgLSBmYWxsaW5nIGJhY2sgdG8gUElPCj4gWyAgICAyLjIx
Mzg0MV0gbW1jMTogU0RIQ0kgY29udHJvbGxlciBvbiAyMzEwMDAwMC5tbWMgWzIzMTAwMDAwLm1t
Y10KPiB1c2luZyBQSU8KCkRvIHlvdSBoYXZlIGlkZWEgb24gaG93IHRvIGZpeCB0aGlzIGluIGEg
cHJvcGVyIHdheT8KCklNSE8gd2hlbiBkcml2ZXJzIGFyZSBzZXR0aW5nIHRoZSBkbWFfbWFzayBh
bmQgY29oZXJlbnRfbWFzayB0aGUKZG1hX3Bmbl9vZmZzZXQgc2hvdWxkIG5vdCBiZSBhcHBsaWVk
IHRvIHRoZSBtYXNrIGF0IGFsbC4KCklmIEkgdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkgZm9yIEVE
TUEgYXMgZXhhbXBsZToKCkkgc2V0IGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoZGV2LCBETUFf
QklUX01BU0soMzIpKTsKc2luY2UgaXQgY2FuIG9ubHkgYWRkcmVzcyBtZW1vcnkgaW4gdGhpcyBy
YW5nZS4KCkl0IGRvZXMgbm90IG1hdHRlciBpZiBkbWFfcGZuX29mZnNldCBpcyAwIG9yIG5vdCAw
IChsaWtlIGluIGsyZywgd2hlcmUKaXQgaXMgMHg3ODAwMDApIHRoZSBFRE1BIHN0aWxsIGNhbiBv
bmx5IGFkZHJlc3Mgd2l0aGluIDMyIGJpdHMuCgpUaGUgZG1hX3Bmbl9vZmZzZXQgd2lsbCB0ZWxs
IHVzIHRoYXQgdGhlIG1lbW9yeSBsb2NhdGlvbidzIHBoeXNpY2FsCmFkZHJlc3MgaXMgc2VlbiBi
eSB0aGUgRE1BIGF0IChwaHlzX3BmbiAtIGRtYV9wZm5fb2Zmc2V0KSAtPiBkbWFfcGZuLgoKVGhl
IGRtYV9tYXNrIHNob3VsZCBiZSBjaGVja2VkIGFnYWluc3QgdGhlIGRtYV9wZm4uCgpXZSBjYW4g
bm90ICdtb3ZlJyB0aGUgZG1hX21hc2sgd2l0aCBkbWFfcGZuX29mZnNldCB3aGVuIHNldHRpbmcg
dGhlIG1hc2sKc2luY2UgaXQgaXMgbm90IGNvcnJlY3QuIFRoZSBETUEgY2FuIGFjY2VzcyBpbiAz
MiBiaXRzIHJhbmdlIGFuZCB3ZSBoYXZlCnRoZSBwZXJpcGhlcmFscyB1bmRlciAweDgwMDAgMDAw
MC4KCkkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBpdCBsb29rcyB0byBtZSB0aGF0
IHRoZSB3YXkgd2Ugc2V0IHRoZQpkbWFfbWFzayBhbmQgdGhlIGNvaGVyZW50X21hc2sgaXMgdGhl
IHBsYWNlIHdoZXJlIHRoaXMgY2FuIGJlIGZpeGVkLgoKQmVzdCByZWdhcmRzLAotIFDDqXRlcgoK
PiAKPiAtIFDDqXRlcgo+IAo+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vZG1hLW1hcHBp
bmcuYyBiL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKPj4gaW5kZXggZTgyMmFmMGQ5MjE5Li4z
MGI5YzY3ODZjZTMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKPj4g
KysrIGIvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYwo+PiBAQCAtMjIxLDcgKzIyMSw4IEBAIEVY
UE9SVF9TWU1CT0woYXJtX2NvaGVyZW50X2RtYV9vcHMpOwo+PiAgCj4+ICBzdGF0aWMgaW50IF9f
ZG1hX3N1cHBvcnRlZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBtYXNrLCBib29sIHdhcm4pCj4+
ICB7Cj4+IC0JdW5zaWduZWQgbG9uZyBtYXhfZG1hX3BmbiA9IG1pbihtYXhfcGZuLCBhcm1fZG1h
X3Bmbl9saW1pdCk7Cj4+ICsJdW5zaWduZWQgbG9uZyBtYXhfZG1hX3BmbiA9Cj4+ICsJCW1pbl90
KHVuc2lnbmVkIGxvbmcsIG1heF9wZm4sIHpvbmVfZG1hX2xpbWl0ID4+IFBBR0VfU0hJRlQpOwo+
PiAgCj4+ICAJLyoKPj4gIAkgKiBUcmFuc2xhdGUgdGhlIGRldmljZSdzIERNQSBtYXNrIHRvIGEg
UEZOIGxpbWl0LiAgVGhpcwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vaW5pdC5jIGIvYXJj
aC9hcm0vbW0vaW5pdC5jCj4+IGluZGV4IDNlZjIwNDEzN2U3My4uZGQwZTE2OWExYmIxIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL2FybS9tbS9pbml0LmMKPj4gKysrIGIvYXJjaC9hcm0vbW0vaW5pdC5j
Cj4+IEBAIC0xOSw2ICsxOSw3IEBACj4+ICAjaW5jbHVkZSA8bGludXgvZ2ZwLmg+Cj4+ICAjaW5j
bHVkZSA8bGludXgvbWVtYmxvY2suaD4KPj4gICNpbmNsdWRlIDxsaW51eC9kbWEtY29udGlndW91
cy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1kaXJlY3QuaD4KPj4gICNpbmNsdWRlIDxsaW51
eC9zaXplcy5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+PiAgI2luY2x1
ZGUgPGxpbnV4L3N3aW90bGIuaD4KPj4gQEAgLTg0LDE1ICs4NSw2IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBmaW5kX2xpbWl0cyh1bnNpZ25lZCBsb25nICptaW4sIHVuc2lnbmVkIGxvbmcgKm1heF9s
b3csCj4+ICBwaHlzX2FkZHJfdCBhcm1fZG1hX3pvbmVfc2l6ZSBfX3JlYWRfbW9zdGx5Owo+PiAg
RVhQT1JUX1NZTUJPTChhcm1fZG1hX3pvbmVfc2l6ZSk7Cj4+ICAKPj4gLS8qCj4+IC0gKiBUaGUg
RE1BIG1hc2sgY29ycmVzcG9uZGluZyB0byB0aGUgbWF4aW11bSBidXMgYWRkcmVzcyBhbGxvY2F0
YWJsZQo+PiAtICogdXNpbmcgR0ZQX0RNQS4gIFRoZSBkZWZhdWx0IGhlcmUgcGxhY2VzIG5vIHJl
c3RyaWN0aW9uIG9uIERNQQo+PiAtICogYWxsb2NhdGlvbnMuICBUaGlzIG11c3QgYmUgdGhlIHNt
YWxsZXN0IERNQSBtYXNrIGluIHRoZSBzeXN0ZW0sCj4+IC0gKiBzbyBhIHN1Y2Nlc3NmdWwgR0ZQ
X0RNQSBhbGxvY2F0aW9uIHdpbGwgYWx3YXlzIHNhdGlzZnkgdGhpcy4KPj4gLSAqLwo+PiAtcGh5
c19hZGRyX3QgYXJtX2RtYV9saW1pdDsKPj4gLXVuc2lnbmVkIGxvbmcgYXJtX2RtYV9wZm5fbGlt
aXQ7Cj4+IC0KPj4gIHN0YXRpYyB2b2lkIF9faW5pdCBhcm1fYWRqdXN0X2RtYV96b25lKHVuc2ln
bmVkIGxvbmcgKnNpemUsIHVuc2lnbmVkIGxvbmcgKmhvbGUsCj4+ICAJdW5zaWduZWQgbG9uZyBk
bWFfc2l6ZSkKPj4gIHsKPj4gQEAgLTEwOCwxNCArMTAwLDE0IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBhcm1fYWRqdXN0X2RtYV96b25lKHVuc2lnbmVkIGxvbmcgKnNpemUsIHVuc2lnbmVkIGxvbmcg
KmhvbGUsCj4+ICAKPj4gIHZvaWQgX19pbml0IHNldHVwX2RtYV96b25lKGNvbnN0IHN0cnVjdCBt
YWNoaW5lX2Rlc2MgKm1kZXNjKQo+PiAgewo+PiAtI2lmZGVmIENPTkZJR19aT05FX0RNQQo+PiAt
CWlmIChtZGVzYy0+ZG1hX3pvbmVfc2l6ZSkgewo+PiArCWlmICghSVNfRU5BQkxFRChDT05GSUdf
Wk9ORV9ETUEpKSB7Cj4+ICsJCXpvbmVfZG1hX2xpbWl0ID0gKChwaHlzX2FkZHJfdCl+MCk7Cj4+
ICsJfSBlbHNlIGlmIChtZGVzYy0+ZG1hX3pvbmVfc2l6ZSkgewo+PiAgCQlhcm1fZG1hX3pvbmVf
c2l6ZSA9IG1kZXNjLT5kbWFfem9uZV9zaXplOwo+PiAtCQlhcm1fZG1hX2xpbWl0ID0gUEhZU19P
RkZTRVQgKyBhcm1fZG1hX3pvbmVfc2l6ZSAtIDE7Cj4+IC0JfSBlbHNlCj4+IC0JCWFybV9kbWFf
bGltaXQgPSAweGZmZmZmZmZmOwo+PiAtCWFybV9kbWFfcGZuX2xpbWl0ID0gYXJtX2RtYV9saW1p
dCA+PiBQQUdFX1NISUZUOwo+PiAtI2VuZGlmCj4+ICsJCXpvbmVfZG1hX2xpbWl0ID0gUEhZU19P
RkZTRVQgKyBhcm1fZG1hX3pvbmVfc2l6ZSAtIDE7Cj4+ICsJfSBlbHNlIHsKPj4gKwkJem9uZV9k
bWFfbGltaXQgPSAweGZmZmZmZmZmOwo+PiArCX0KPj4gIH0KPj4gIAo+PiAgc3RhdGljIHZvaWQg
X19pbml0IHpvbmVfc2l6ZXNfaW5pdCh1bnNpZ25lZCBsb25nIG1pbiwgdW5zaWduZWQgbG9uZyBt
YXhfbG93LAo+PiBAQCAtMjc5LDcgKzI3MSw3IEBAIHZvaWQgX19pbml0IGFybV9tZW1ibG9ja19p
bml0KGNvbnN0IHN0cnVjdCBtYWNoaW5lX2Rlc2MgKm1kZXNjKQo+PiAgCWVhcmx5X2luaXRfZmR0
X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7Cj4+ICAKPj4gIAkvKiByZXNlcnZlIG1lbW9yeSBmb3IgRE1B
IGNvbnRpZ3VvdXMgYWxsb2NhdGlvbnMgKi8KPj4gLQlkbWFfY29udGlndW91c19yZXNlcnZlKGFy
bV9kbWFfbGltaXQpOwo+PiArCWRtYV9jb250aWd1b3VzX3Jlc2VydmUoem9uZV9kbWFfbGltaXQp
Owo+PiAgCj4+ICAJYXJtX21lbWJsb2NrX3N0ZWFsX3Blcm1pdHRlZCA9IGZhbHNlOwo+PiAgCW1l
bWJsb2NrX2R1bXBfYWxsKCk7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9tbS5oIGIvYXJj
aC9hcm0vbW0vbW0uaAo+PiBpbmRleCA4OGMxMjFhYzE0YjMuLjdkYmQ3NzU1NDI3MyAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9hcm0vbW0vbW0uaAo+PiArKysgYi9hcmNoL2FybS9tbS9tbS5oCj4+IEBA
IC04MiwxNCArODIsNiBAQCBleHRlcm4gX19pbml0IHZvaWQgYWRkX3N0YXRpY192bV9lYXJseShz
dHJ1Y3Qgc3RhdGljX3ZtICpzdm0pOwo+PiAgCj4+ICAjZW5kaWYKPj4gIAo+PiAtI2lmZGVmIENP
TkZJR19aT05FX0RNQQo+PiAtZXh0ZXJuIHBoeXNfYWRkcl90IGFybV9kbWFfbGltaXQ7Cj4+IC1l
eHRlcm4gdW5zaWduZWQgbG9uZyBhcm1fZG1hX3Bmbl9saW1pdDsKPj4gLSNlbHNlCj4+IC0jZGVm
aW5lIGFybV9kbWFfbGltaXQgKChwaHlzX2FkZHJfdCl+MCkKPj4gLSNkZWZpbmUgYXJtX2RtYV9w
Zm5fbGltaXQgKH4wdWwgPj4gUEFHRV9TSElGVCkKPj4gLSNlbmRpZgo+PiAtCj4+ICBleHRlcm4g
cGh5c19hZGRyX3QgYXJtX2xvd21lbV9saW1pdDsKPj4gIAo+PiAgdm9pZCBfX2luaXQgYm9vdG1l
bV9pbml0KHZvaWQpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9pbml0LmMgYi9hcmNo
L2FybTY0L21tL2luaXQuYwo+PiBpbmRleCBiNjVkZmZkZmIyMDEuLjdhNzUwMWFjZDc2MyAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9tbS9pbml0LmMKPj4gKysrIGIvYXJjaC9hcm02NC9tbS9p
bml0LmMKPj4gQEAgLTQ0MSw3ICs0NDEsNyBAQCB2b2lkIF9faW5pdCBhcm02NF9tZW1ibG9ja19p
bml0KHZvaWQpCj4+ICAJZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPj4gIAo+
PiAgCWlmIChJU19FTkFCTEVEKENPTkZJR19aT05FX0RNQSkpIHsKPj4gLQkJem9uZV9kbWFfYml0
cyA9IEFSTTY0X1pPTkVfRE1BX0JJVFM7Cj4+ICsJCXpvbmVfZG1hX2xpbWl0ID0gRE1BX0JJVF9N
QVNLKEFSTTY0X1pPTkVfRE1BX0JJVFMpOwo+PiAgCQlhcm02NF9kbWFfcGh5c19saW1pdCA9IG1h
eF96b25lX3BoeXMoQVJNNjRfWk9ORV9ETUFfQklUUyk7Cj4+ICAJfQo+PiAgCj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvbW0vbWVtLmMgYi9hcmNoL3Bvd2VycGMvbW0vbWVtLmMKPj4gaW5k
ZXggOTQ4OGI2M2RmYzg3Li4zMzdhY2UwM2QzZjAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9tbS9tZW0uYwo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbWVtLmMKPj4gQEAgLTIyMyw3ICsy
MjMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXJrX25vbnJhbV9ub3NhdmUodm9pZCkKPj4gICAq
IGV2ZXJ5dGhpbmcgZWxzZS4gR0ZQX0RNQTMyIHBhZ2UgYWxsb2NhdGlvbnMgYXV0b21hdGljYWxs
eSBmYWxsIGJhY2sgdG8KPj4gICAqIFpPTkVfRE1BLgo+PiAgICoKPj4gLSAqIEJ5IHVzaW5nIDMx
LWJpdCB1bmNvbmRpdGlvbmFsbHksIHdlIGNhbiBleHBsb2l0IHpvbmVfZG1hX2JpdHMgdG8gaW5m
b3JtIHRoZQo+PiArICogQnkgdXNpbmcgMzEtYml0IHVuY29uZGl0aW9uYWxseSwgd2UgY2FuIGV4
cGxvaXQgem9uZV9kbWFfbGltaXQgdG8gaW5mb3JtIHRoZQo+PiAgICogZ2VuZXJpYyBETUEgbWFw
cGluZyBjb2RlLiAgMzItYml0IG9ubHkgZGV2aWNlcyAoaWYgbm90IGhhbmRsZWQgYnkgYW4gSU9N
TVUKPj4gICAqIGFueXdheSkgd2lsbCB0YWtlIGEgZmlyc3QgZGlwIGludG8gWk9ORV9OT1JNQUwg
YW5kIGdldCBvdGhlcndpc2Ugc2VydmVkIGJ5Cj4+ICAgKiBaT05FX0RNQS4KPj4gQEAgLTI1Nywx
OCArMjU3LDIwIEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCj4+ICAJcHJpbnRrKEtF
Uk5fREVCVUcgIk1lbW9yeSBob2xlIHNpemU6ICVsZE1CXG4iLAo+PiAgCSAgICAgICAobG9uZyBp
bnQpKCh0b3Bfb2ZfcmFtIC0gdG90YWxfcmFtKSA+PiAyMCkpOwo+PiAgCj4+ICsjaWZkZWYgQ09O
RklHX1pPTkVfRE1BCj4+ICAJLyoKPj4gIAkgKiBBbGxvdyAzMC1iaXQgRE1BIGZvciB2ZXJ5IGxp
bWl0ZWQgQnJvYWRjb20gd2lmaSBjaGlwcyBvbiBtYW55Cj4+ICAJICogcG93ZXJib29rcy4KPj4g
IAkgKi8KPj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDMzIpKQo+PiAtCQl6b25lX2RtYV9i
aXRzID0gMzA7Cj4+IC0JZWxzZQo+PiAtCQl6b25lX2RtYV9iaXRzID0gMzE7Cj4+IC0KPj4gLSNp
ZmRlZiBDT05GSUdfWk9ORV9ETUEKPj4gLQltYXhfem9uZV9wZm5zW1pPTkVfRE1BXQk9IG1pbiht
YXhfbG93X3BmbiwKPj4gLQkJCQkgICAgICAxVUwgPDwgKHpvbmVfZG1hX2JpdHMgLSBQQUdFX1NI
SUZUKSk7Cj4+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMyKSkgewo+PiArCQl6b25lX2Rt
YV9saW1pdCA9IERNQV9CSVRfTUFTSygzMCk7Cj4+ICsJCW1heF96b25lX3BmbnNbWk9ORV9ETUFd
CT0gbWluKG1heF9sb3dfcGZuLAo+PiArCQkJCQkgICAgICAxVUwgPDwgKDMwIC0gUEFHRV9TSElG
VCkpOwo+PiArCX0gZWxzZSB7Cj4+ICsJCXpvbmVfZG1hX2xpbWl0ID0gRE1BX0JJVF9NQVNLKDMx
KTsKPj4gKwkJbWF4X3pvbmVfcGZuc1taT05FX0RNQV0JPSBtaW4obWF4X2xvd19wZm4sCj4+ICsJ
CQkJCSAgICAgIDFVTCA8PCAoMzEgLSBQQUdFX1NISUZUKSk7Cj4+ICsJfQo+PiAgI2VuZGlmCj4+
ICAJbWF4X3pvbmVfcGZuc1taT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbjsKPj4gICNpZmRlZiBD
T05GSUdfSElHSE1FTQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL21tL2luaXQuYyBiL2FyY2gv
czM5MC9tbS9pbml0LmMKPj4gaW5kZXggZjBjZTIyMjIwNTY1Li5jNDAzZjYxY2I1NmIgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvczM5MC9tbS9pbml0LmMKPj4gKysrIGIvYXJjaC9zMzkwL21tL2luaXQu
Ywo+PiBAQCAtMTE4LDcgKzExOCw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCj4+
ICAKPj4gIAlzcGFyc2VfbWVtb3J5X3ByZXNlbnRfd2l0aF9hY3RpdmVfcmVnaW9ucyhNQVhfTlVN
Tk9ERVMpOwo+PiAgCXNwYXJzZV9pbml0KCk7Cj4+IC0Jem9uZV9kbWFfYml0cyA9IDMxOwo+PiAr
CXpvbmVfZG1hX2xpbWl0ID0gRE1BX0JJVF9NQVNLKDMxKTsKPj4gIAltZW1zZXQobWF4X3pvbmVf
cGZucywgMCwgc2l6ZW9mKG1heF96b25lX3BmbnMpKTsKPj4gIAltYXhfem9uZV9wZm5zW1pPTkVf
RE1BXSA9IFBGTl9ET1dOKE1BWF9ETUFfQUREUkVTUyk7Cj4+ICAJbWF4X3pvbmVfcGZuc1taT05F
X05PUk1BTF0gPSBtYXhfbG93X3BmbjsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1h
LWRpcmVjdC5oIGIvaW5jbHVkZS9saW51eC9kbWEtZGlyZWN0LmgKPj4gaW5kZXggMjRiODY4NGFh
MjFkLi4yMGQ1NmQ1OTc1MDYgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWRpcmVj
dC5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oCj4+IEBAIC02LDcgKzYsNyBA
QAo+PiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+IC8qIGZvciBtaW5fbG93X3BmbiAqLwo+
PiAgI2luY2x1ZGUgPGxpbnV4L21lbV9lbmNyeXB0Lmg+Cj4+ICAKPj4gLWV4dGVybiB1bnNpZ25l
ZCBpbnQgem9uZV9kbWFfYml0czsKPj4gK2V4dGVybiBwaHlzX2FkZHJfdCB6b25lX2RtYV9saW1p
dDsKPj4gIAo+PiAgI2lmZGVmIENPTkZJR19BUkNIX0hBU19QSFlTX1RPX0RNQQo+PiAgI2luY2x1
ZGUgPGFzbS9kbWEtZGlyZWN0Lmg+Cj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvZG1hL2RpcmVjdC5j
IGIva2VybmVsL2RtYS9kaXJlY3QuYwo+PiBpbmRleCA2YWY3YWU4M2M0YWQuLjVlYTFiZWQyYmE2
ZiAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2RtYS9kaXJlY3QuYwo+PiArKysgYi9rZXJuZWwvZG1h
L2RpcmVjdC5jCj4+IEBAIC0yMSw3ICsyMSw3IEBACj4+ICAgKiBpdCBmb3IgZW50aXJlbHkgZGlm
ZmVyZW50IHJlZ2lvbnMuIEluIHRoYXQgY2FzZSB0aGUgYXJjaCBjb2RlIG5lZWRzIHRvCj4+ICAg
KiBvdmVycmlkZSB0aGUgdmFyaWFibGUgYmVsb3cgZm9yIGRtYS1kaXJlY3QgdG8gd29yayBwcm9w
ZXJseS4KPj4gICAqLwo+PiAtdW5zaWduZWQgaW50IHpvbmVfZG1hX2JpdHMgX19yb19hZnRlcl9p
bml0ID0gMjQ7Cj4+ICtwaHlzX2FkZHJfdCB6b25lX2RtYV9saW1pdCBfX3JvX2FmdGVyX2luaXQg
PSBETUFfQklUX01BU0soMjQpOwo+PiAgCj4+ICBzdGF0aWMgdm9pZCByZXBvcnRfYWRkcihzdHJ1
Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgZG1hX2FkZHIsIHNpemVfdCBzaXplKQo+PiAgewo+
PiBAQCAtNzQsNyArNzQsNyBAQCBzdGF0aWMgZ2ZwX3QgX19kbWFfZGlyZWN0X29wdGltYWxfZ2Zw
X21hc2soc3RydWN0IGRldmljZSAqZGV2LCB1NjQgZG1hX21hc2ssCj4+ICAJICogTm90ZSB0aGF0
IEdGUF9ETUEzMiBhbmQgR0ZQX0RNQSBhcmUgbm8gb3BzIHdpdGhvdXQgdGhlIGNvcnJlc3BvbmRp
bmcKPj4gIAkgKiB6b25lcy4KPj4gIAkgKi8KPj4gLQlpZiAoKnBoeXNfbGltaXQgPD0gRE1BX0JJ
VF9NQVNLKHpvbmVfZG1hX2JpdHMpKQo+PiArCWlmICgqcGh5c19saW1pdCA8PSB6b25lX2RtYV9s
aW1pdCkKPj4gIAkJcmV0dXJuIEdGUF9ETUE7Cj4+ICAJaWYgKCpwaHlzX2xpbWl0IDw9IERNQV9C
SVRfTUFTSygzMikpCj4+ICAJCXJldHVybiBHRlBfRE1BMzI7Cj4+IEBAIC00ODMsNyArNDgzLDcg
QEAgaW50IGRtYV9kaXJlY3Rfc3VwcG9ydGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTY0IG1hc2sp
Cj4+ICAJdTY0IG1pbl9tYXNrOwo+PiAgCj4+ICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1pPTkVf
RE1BKSkKPj4gLQkJbWluX21hc2sgPSBETUFfQklUX01BU0soem9uZV9kbWFfYml0cyk7Cj4+ICsJ
CW1pbl9tYXNrID0gem9uZV9kbWFfbGltaXQ7Cj4+ICAJZWxzZQo+PiAgCQltaW5fbWFzayA9IERN
QV9CSVRfTUFTSygzMik7Cj4+ICAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo+Pgo+IAo+IFRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+
IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo+IAoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAw
NjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
