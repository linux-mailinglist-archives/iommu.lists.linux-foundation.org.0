Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D86156339
	for <lists.iommu@lfdr.de>; Sat,  8 Feb 2020 07:53:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5844866E5;
	Sat,  8 Feb 2020 06:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxJcjVmKuopb; Sat,  8 Feb 2020 06:53:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4D8C86709;
	Sat,  8 Feb 2020 06:53:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D20C089F;
	Sat,  8 Feb 2020 06:53:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ACD2C013E
 for <iommu@lists.linux-foundation.org>; Sat,  8 Feb 2020 06:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7C2785D02
 for <iommu@lists.linux-foundation.org>; Sat,  8 Feb 2020 06:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjF4XomJW0Hr for <iommu@lists.linux-foundation.org>;
 Sat,  8 Feb 2020 06:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6B7A885C4C
 for <iommu@lists.linux-foundation.org>; Sat,  8 Feb 2020 06:53:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 22:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,416,1574150400"; d="scan'208";a="226706968"
Received: from zhiyuanh-mobl.ccr.corp.intel.com (HELO [10.254.211.219])
 ([10.254.211.219])
 by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2020 22:53:17 -0800
Subject: Re: warning from domain_get_iommu
To: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200204200714.u4ezhi6vhqhxog6e@cantor>
 <20200206174358.shzhieijle5wdshr@cantor>
 <20200207093413.oy4tclbrb3vqs3vz@cantor>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <c99f11f8-6243-6cea-d984-f162d11d36e0@linux.intel.com>
Date: Sat, 8 Feb 2020 14:53:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207093413.oy4tclbrb3vqs3vz@cantor>
Content-Language: en-US
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

SGkgSmVycnksCgpPbiAyMDIwLzIvNyAxNzozNCwgSmVycnkgU25pdHNlbGFhciB3cm90ZToKPiBP
biBUaHUgRmViIDA2IDIwLCBKZXJyeSBTbml0c2VsYWFyIHdyb3RlOgo+PiBPbiBUdWUgRmViIDA0
IDIwLCBKZXJyeSBTbml0c2VsYWFyIHdyb3RlOgo+Pj4gSSdtIHdvcmtpbmcgb24gZ2V0dGluZyBh
IHN5c3RlbSB0byByZXByb2R1Y2UgdGhpcywgYW5kIHZlcmlmeSBpdCBhbHNvIAo+Pj4gb2NjdXJz
Cj4+PiB3aXRoIDUuNSwgYnV0IEkgaGF2ZSBhIHJlcG9ydCBvZiBhIGNhc2Ugd2hlcmUgdGhlIGtk
dW1wIGtlcm5lbCBnaXZlcwo+Pj4gd2FybmluZ3MgbGlrZSB0aGUgZm9sbG93aW5nIG9uIGEgaHAg
ZGwzNjAgZ2VuOToKPj4+Cj4+PiBbwqDCoMKgIDIuODMwNTg5XSBlaGNpX2hjZDogVVNCIDIuMCAn
RW5oYW5jZWQnIEhvc3QgQ29udHJvbGxlciAoRUhDSSkgCj4+PiBEcml2ZXIKPj4+IFvCoMKgwqAg
Mi44MzI2MTVdIGVoY2ktcGNpOiBFSENJIFBDSSBwbGF0Zm9ybSBkcml2ZXIKPj4+IFvCoMKgwqAg
Mi44MzQxOTBdIGVoY2ktcGNpIDAwMDA6MDA6MWEuMDogRUhDSSBIb3N0IENvbnRyb2xsZXIKPj4+
IFvCoMKgwqAgMi44MzU5NzRdIGVoY2ktcGNpIDAwMDA6MDA6MWEuMDogbmV3IFVTQiBidXMgcmVn
aXN0ZXJlZCwgCj4+PiBhc3NpZ25lZCBidXMgbnVtYmVyIDEKPj4+IFvCoMKgwqAgMi44MzgyNzZd
IGVoY2ktcGNpIDAwMDA6MDA6MWEuMDogZGVidWcgcG9ydCAyCj4+PiBbwqDCoMKgIDIuODM5NzAw
XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0IAo+Pj4gZHJpdmVycy9pb21tdS9pbnRlbC1pb21t
dS5jOjU5OCBkb21haW5fZ2V0X2lvbW11KzB4NTUvMHg2MAo+Pj4gW8KgwqDCoCAyLjg0MDY3MV0g
TW9kdWxlcyBsaW5rZWQgaW46Cj4+PiBbwqDCoMKgIDIuODQwNjcxXSBDUFU6IDAgUElEOiAxIENv
bW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCAKPj4+IDQuMTguMC0xNzAuZWw4LmtkdW1wMi54ODZf
NjQgIzEKPj4+IFvCoMKgwqAgMi44NDA2NzFdIEhhcmR3YXJlIG5hbWU6IEhQIFByb0xpYW50IERM
MzYwIEdlbjkvUHJvTGlhbnQgREwzNjAgCj4+PiBHZW45LCBCSU9TIFA4OSAwNy8yMS8yMDE5Cj4+
PiBbwqDCoMKgIDIuODQwNjcxXSBSSVA6IDAwMTA6ZG9tYWluX2dldF9pb21tdSsweDU1LzB4NjAK
Pj4+IFvCoMKgwqAgMi44NDA2NzFdIENvZGU6IGMyIDAxIGViIDBiIDQ4IDgzIGMwIDAxIDhiIDM0
IDg3IDg1IGY2IDc1IDBiIDQ4IAo+Pj4gNjMgYzggNDggMzkgYzIgNzUgZWQgMzEgYzAgYzMgNDgg
YzEgZTEgMDMgNDggOGIgMDUgNzAgZjMgOTEgMDEgNDggOGIgCj4+PiAwNCAwOCBjMyA8MGY+IDBi
IDMxIGMwIGMzIDMxIGM5IGViIGViIDY2IDkwIDBmIDFmIDQ0IDAwIDAwIDQxIDU1IDQwIAo+Pj4g
MGYgYjYgZjYKPj4+IFvCoMKgwqAgMi44NDA2NzFdIFJTUDogMDAxODpmZmZmYzkwMDAwMGRmYWI4
IEVGTEFHUzogMDAwMTAyMDIKPj4+IFvCoMKgwqAgMi44NDA2NzFdIFJBWDogZmZmZjg4ZWM3ZjFj
ODAwMCBSQlg6IDAwMDAwMDZjN2M4NjcwMDAgUkNYOiAKPj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+
IFvCoMKgwqAgMi44NDA2NzFdIFJEWDogMDAwMDAwMDBmZmZmZmZmMCBSU0k6IDAwMDAwMDAwMDAw
MDAwMDAgUkRJOiAKPj4+IGZmZmY4OGVjN2YxYzgwMDAKPj4+IFvCoMKgwqAgMi44NDA2NzFdIFJC
UDogZmZmZjg4ZWM2ZjcwMDBiMCBSMDg6IGZmZmY4OGVjN2YxOWQwMDAgUjA5OiAKPj4+IGZmZmY4
OGVjN2NiZmNkMDAKPj4+IFvCoMKgwqAgMi44NDA2NzFdIFIxMDogMDAwMDAwMDAwMDAwMDA5NSBS
MTE6IGZmZmZjOTAwMDAwZGY5MjggUjEyOiAKPj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFvCoMKg
wqAgMi44NDA2NzFdIFIxMzogZmZmZjg4ZWM3ZjFjODAwMCBSMTQ6IDAwMDAwMDAwMDAwMDEwMDAg
UjE1OiAKPj4+IDAwMDAwMDAwZmZmZmZmZmYKPj4+IFvCoMKgwqAgMi44NDA2NzFdIEZTOsKgIDAw
MDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg4ZWM3ZjYwMDAwMCgwMDAwKSAKPj4+IGtubEdT
OjAwMDAwMDAwMDAwMDAwMDAKPj4+IFvCoMKgwqAgMi44NDA2NzFdIENTOsKgIDAwMTAgRFM6IDAw
MDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4+PiBbwqDCoMKgIDIuODQwNjcxXSBD
UjI6IDAwMDA3ZmYzZTE3MTMwMDAgQ1IzOiAwMDAwMDA2YzdkZTBhMDA0IENSNDogCj4+PiAwMDAw
MDAwMDAwMTYwNmIwCj4+PiBbwqDCoMKgIDIuODQwNjcxXSBDYWxsIFRyYWNlOgo+Pj4gW8KgwqDC
oCAyLjg0MDY3MV3CoCBfX2ludGVsX21hcF9zaW5nbGUrMHg2Mi8weDE0MAo+Pj4gW8KgwqDCoCAy
Ljg0MDY3MV3CoCBpbnRlbF9hbGxvY19jb2hlcmVudCsweGE2LzB4MTMwCj4+PiBbwqDCoMKgIDIu
ODQwNjcxXcKgIGRtYV9wb29sX2FsbG9jKzB4ZDgvMHgxZTAKPj4+IFvCoMKgwqAgMi44NDA2NzFd
wqAgZV9xaF9hbGxvYysweDU1LzB4MTMwCj4+PiBbwqDCoMKgIDIuODQwNjcxXcKgIGVoY2lfc2V0
dXArMHgyODQvMHg3YjAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAgZWhjaV9wY2lfc2V0dXArMHhh
My8weDUzMAo+Pj4gW8KgwqDCoCAyLjg0MDY3MV3CoCB1c2JfYWRkX2hjZCsweDJiNi8weDgwMAo+
Pj4gW8KgwqDCoCAyLjg0MDY3MV3CoCB1c2JfaGNkX3BjaV9wcm9iZSsweDM3NS8weDQ2MAo+Pj4g
W8KgwqDCoCAyLjg0MDY3MV3CoCBsb2NhbF9wY2lfcHJvYmUrMHg0MS8weDkwCj4+PiBbwqDCoMKg
IDIuODQwNjcxXcKgIHBjaV9kZXZpY2VfcHJvYmUrMHgxMDUvMHgxYjAKPj4+IFvCoMKgwqAgMi44
NDA2NzFdwqAgZHJpdmVyX3Byb2JlX2RldmljZSsweDEyZC8weDQ2MAo+Pj4gW8KgwqDCoCAyLjg0
MDY3MV3CoCBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDUwLzB4NjAKPj4+IFvCoMKgwqAgMi44NDA2
NzFdwqAgX19kcml2ZXJfYXR0YWNoKzB4NjEvMHgxMzAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAg
PyBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDYwLzB4NjAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAg
YnVzX2Zvcl9lYWNoX2RldisweDc3LzB4YzAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAgPyBrbGlz
dF9hZGRfdGFpbCsweDNiLzB4NzAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAgYnVzX2FkZF9kcml2
ZXIrMHgxNGQvMHgxZTAKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAgPyBlaGNpX2hjZF9pbml0KzB4
YWEvMHhhYQo+Pj4gW8KgwqDCoCAyLjg0MDY3MV3CoCA/IGRvX2Vhcmx5X3BhcmFtKzB4OTEvMHg5
MQo+Pj4gW8KgwqDCoCAyLjg0MDY3MV3CoCBkcml2ZXJfcmVnaXN0ZXIrMHg2Yi8weGIwCj4+PiBb
wqDCoMKgIDIuODQwNjcxXcKgID8gZWhjaV9oY2RfaW5pdCsweGFhLzB4YWEKPj4+IFvCoMKgwqAg
Mi44NDA2NzFdwqAgZG9fb25lX2luaXRjYWxsKzB4NDYvMHgxYzMKPj4+IFvCoMKgwqAgMi44NDA2
NzFdwqAgPyBkb19lYXJseV9wYXJhbSsweDkxLzB4OTEKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAg
a2VybmVsX2luaXRfZnJlZWFibGUrMHgxYWYvMHgyNTgKPj4+IFvCoMKgwqAgMi44NDA2NzFdwqAg
PyByZXN0X2luaXQrMHhhYS8weGFhCj4+PiBbwqDCoMKgIDIuODQwNjcxXcKgIGtlcm5lbF9pbml0
KzB4YS8weGY5Cj4+PiBbwqDCoMKgIDIuODQwNjcxXcKgIHJldF9mcm9tX2ZvcmsrMHgzNS8weDQw
Cj4+PiBbwqDCoMKgIDIuODQwNjcxXSAtLS1bIGVuZCB0cmFjZSBlODdiMGQ5YTFjODEzNWM0IF0t
LS0KPj4+IFvCoMKgwqAgMy4wMTA4NDhdIGVoY2ktcGNpIDAwMDA6MDA6MWEuMDogVXNpbmcgaW9t
bXUgZG1hIG1hcHBpbmcKPj4+IFvCoMKgwqAgMy4wMTI1NTFdIGVoY2ktcGNpIDAwMDA6MDA6MWEu
MDogMzJiaXQgRE1BIHVzZXMgbm9uLWlkZW50aXR5IAo+Pj4gbWFwcGluZwo+Pj4gW8KgwqDCoCAz
LjAxODUzN10gZWhjaS1wY2kgMDAwMDowMDoxYS4wOiBjYWNoZSBsaW5lIHNpemUgb2YgNjQgaXMg
bm90IAo+Pj4gc3VwcG9ydGVkCj4+PiBbwqDCoMKgIDMuMDIxMTg4XSBlaGNpLXBjaSAwMDAwOjAw
OjFhLjA6IGlycSAxOCwgaW8gbWVtIDB4OTMwMDIwMDAKPj4+IFvCoMKgwqAgMy4wMjkwMDZdIGVo
Y2ktcGNpIDAwMDA6MDA6MWEuMDogVVNCIDIuMCBzdGFydGVkLCBFSENJIDEuMDAKPj4+IFvCoMKg
wqAgMy4wMzA5MThdIHVzYiB1c2IxOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MWQ2
YiwgCj4+PiBpZFByb2R1Y3Q9MDAwMiwgYmNkRGV2aWNlPSA0LjE4Cj4+PiBbwqDCoMKgIDMuMDMz
NDkxXSB1c2IgdXNiMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9Miwg
Cj4+PiBTZXJpYWxOdW1iZXI9MQo+Pj4gW8KgwqDCoCAzLjAzNTkwMF0gdXNiIHVzYjE6IFByb2R1
Y3Q6IEVIQ0kgSG9zdCBDb250cm9sbGVyCj4+PiBbwqDCoMKgIDMuMDM3NDIzXSB1c2IgdXNiMTog
TWFudWZhY3R1cmVyOiBMaW51eCAKPj4+IDQuMTguMC0xNzAuZWw4LmtkdW1wMi54ODZfNjQgZWhj
aV9oY2QKPj4+IFvCoMKgwqAgMy4wMzk2OTFdIHVzYiB1c2IxOiBTZXJpYWxOdW1iZXI6IDAwMDA6
MDA6MWEuMAo+Pj4KPj4+IEl0IGxvb2tzIGxpa2UgdGhlIGRldmljZSBmaW5pc2hlcyBpbml0aWFs
aXppbmcgb25jZSBpdCBmaWd1cmVzIG91dCBpdAo+Pj4gbmVlZHMgZG1hIG1hcHBpbmcgaW5zdGVh
ZCBvZiB0aGUgZGVmYXVsdAo+Pj4gcGFzc3Rocm91Z2guIGludGVsX2FsbG9jX2NvaGVyZW50IGNh
bGxzIGlvbW11X25lZWRfbWFwcGluZywgYmVmb3JlIGl0Cj4+PiBjYWxscyBfX2ludGVsX21hcF9z
aW5nbGUsIHNvIEknbSBub3Qgc3VyZSB3aHkgaXQgaXMgdHJpcHBpbmcgb3ZlciB0aGUKPj4+IFdB
Uk5fT04gaW4gZG9tYWluX2dldF9pb21tdS4KPj4+Cj4+PiBvbmUgdGhpbmcgSSBub3RpY2VkIHdo
aWxlIGxvb2tpbmcgYXQgdGhpcyBpcyB0aGF0IGRvbWFpbl9nZXRfaW9tbXUgY2FuCj4+PiByZXR1
cm4gTlVMTC4gU28gc2hvdWxkIHRoZXJlIGJlIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcg
aW4KPj4+IF9faW50ZWxfbWFwX3NpbmdsZSBhZnRlciB0aGUgZG9tYWluX2dldF9pb21tdSBjYWxs
Pwo+Pj4KPj4+IGlmICghaW9tbXUpCj4+PiDCoGdvdG8gZXJyb3I7Cj4+Pgo+Pj4gSXQgaXMgcG9z
c2libGUgdG8gZGVyZWYgdGhlIG51bGwgcG9pbnRlciBsYXRlciBvdGhlcndpc2UuCj4+Pgo+Pj4g
UmVnYXJkcywKPj4+IEplcnJ5Cj4+Cj4+IEkgcmVwcm9kdWNlZCB0aGUgd2FybmluZyB3aXRoIGEg
NS41IGtlcm5lbCBvbiBhbiBJbnRlbCBOVUM1aTVNWUJFLgo+IAo+IEhpIEJhb2x1LAo+IAo+IEkg
dGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUuIFdpdGggdGhlIGtkdW1w
IGJvb3QKPiB0cmFuc2xhdGlvbiBpcyBwcmUtZW5hYmxlZCwgc28gaW4gaW50ZWxfaW9tbXVfYWRk
X2RldmljZSB0aGluZ3MgYXJlCj4gZ2V0dGluZyBzZXQgdG8gREVGRVJfREVWSUNFX0RPTUFJTl9J
TkZPLiBXaGVuIGludGVsX2FsbG9jX2NvaGVyZW50Cj4gY2FsbHMgaW9tbXVfbmVlZF9tYXBwaW5n
IGl0IHJldHVybnMgdHJ1ZSwgYnV0IGRvZXNuJ3QgZG8gdGhlIGRtYQo+IGRvbWFpbiBzd2l0Y2gg
YmVjYXVzZSBvZiBERUZFUl9ERVZJQ0VfRE9NQUlOX0lORk8uIFRoZW4KPiBfX2ludGVsX21hcF9z
aW5nbGUgZ2V0cyBjYWxsZWQgYW5kIGl0IGNhbGxzIGRlZmVycmVkX2F0dGFjaF9kb21haW4sCj4g
d2hpY2ggc2V0cyB0aGUgZG9tYWluIHRvIHRoZSBncm91cCBkb21haW4sIHdoaWNoIGluIHRoaXMg
Y2FzZSBpcyB0aGUKPiBpZGVudGl0eSBkb21haW4uIFRoZW4gaXQgY2FsbHMgZG9tYWluX2dldF9p
b21tdSwgd2hpY2ggc3BpdHMgb3V0IHRoZQo+IHdhcm5pbmcgYmVjYXVzZSB0aGUgZG9tYWluIHR5
cGUgd2FzIGRtYSBhbmQgcmV0dXJucyBudWxsLiBNeQo+IHdvcmthcm91bmQgd2FzIHRvIGFkZCBh
IGNhbGwgdG8gaW9tbXVfbmVlZF9tYXBwaW5nIGFuZCBmaW5kX2RvbWFpbgo+IGFmdGVyIHRoZSBk
ZWZlcnJlZF9hdHRhY2hfZG9tYWluLCBidXQgSSBkb24ndCBrbm93IGlmIHRoYXQgaXMgdGhlCj4g
Y29ycmVjdCBzb2x1dGlvbi4gVGhlcmUgYXJlIGEgY291cGxlIG90aGVyIHNwb3RzIGxpa2UgaW50
ZWxfbWFwX3NnCj4gdGhhdCBoYXZlIHRoZSBkZWZlcnJlZF9hdHRhY2hfZG9tYWluIGFmdGVyIGlv
bW11X25lZWRfbWFwcGluZyB0aGF0Cj4gcG9zc2libHkgd2lsbCBzdWZmZXIgZnJvbSB0aGUgc2Ft
ZSBwcm9ibGVtLgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMg
Yi9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiBpbmRleCBiNWM1YWI1OGQzOTUuLjA2M2Y0
NTMyM2NmYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiArKysg
Yi9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKPiBAQCAtMzUxNSw2ICszNTE1LDEwIEBAIHN0
YXRpYyBkbWFfYWRkcl90IF9faW50ZWxfbWFwX3NpbmdsZShzdHJ1Y3QgCj4gZGV2aWNlICpkZXYs
IHBoeXNfYWRkcl90IHBhZGRyLAo+ICDCoMKgwqDCoMKgwqDCoCBpZiAoIWRvbWFpbikKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBETUFfTUFQUElOR19FUlJPUjsKPiAK
PiArwqDCoMKgwqDCoMKgIGlmICghaW9tbXVfbmVlZF9tYXBwaW5nKGRldikpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHBhZGRyOwo+ICsKPiArwqDCoMKgwqDCoMKgIGRv
bWFpbiA9IGZpbmRfZG9tYWluKGRldik7Cj4gIMKgwqDCoMKgwqDCoMKgIGlvbW11ID0gZG9tYWlu
X2dldF9pb21tdShkb21haW4pOwo+ICDCoMKgwqDCoMKgwqDCoCBzaXplID0gYWxpZ25lZF9ucnBh
Z2VzKHBhZGRyLCBzaXplKTsKPiAKPiAKPiBJIGZpbmFsbHkgZ290IGEgZ2l0IHJlcG8gb3ZlciB0
byBvbmUgb2YgdGhlc2Ugc3lzdGVtcywgYW5kIHdhcwo+IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZSB3aXRoIHRoZSBoZWFkIG9mIGxpbnVzJ3MgdHJlZS4gV2l0aCBjb21taXQKPiA5MjM1Y2Ix
M2Q3ZDEgKCJpb21tdS92dC1kOiBBbGxvdyBkZXZpY2VzIHdpdGggUk1SUnMgdG8gdXNlIGlkZW50
aXR5IAo+IGRvbWFpbiIpCj4gdGhlcmUgYXJlIG1vcmUgb2YgdGhlIHdhcm5pbmdzLCBiZWNhdXNl
IGRldmljZXMgYXJlIHVzaW5nIGlkZW50aXR5IHRoYXQKPiB3ZXJlbid0IGJlZm9yZS4KPgoKSXMg
aXQgcG9zc2libGUgdG8gbW92ZSBkZWZlcnJlZCBkb21haW4gYXR0YWNobWVudCB0byBpZGVudGl0
eV9tYXBwaW5nKCk/CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jIGIv
ZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jCmluZGV4IDlkYzM3NjcyYmY4OS4uMjM0YWIzNDYx
OThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMKKysrIGIvZHJpdmVy
cy9pb21tdS9pbnRlbC1pb21tdS5jCkBAIC0yOTEzLDEzICsyOTEzLDExIEBAIHN0YXRpYyBpbnQg
X19pbml0IHNpX2RvbWFpbl9pbml0KGludCBodykKCiAgc3RhdGljIGludCBpZGVudGl0eV9tYXBw
aW5nKHN0cnVjdCBkZXZpY2UgKmRldikKICB7Ci0gICAgICAgc3RydWN0IGRldmljZV9kb21haW5f
aW5mbyAqaW5mbzsKKyAgICAgICBzdHJ1Y3QgZG1hcl9kb21haW4gKmRvbWFpbjsKCi0gICAgICAg
aW5mbyA9IGRldi0+YXJjaGRhdGEuaW9tbXU7Ci0gICAgICAgaWYgKGluZm8gJiYgaW5mbyAhPSBE
VU1NWV9ERVZJQ0VfRE9NQUlOX0lORk8gJiYgaW5mbyAhPSAKREVGRVJfREVWSUNFX0RPTUFJTl9J
TkZPKQotICAgICAgICAgICAgICAgcmV0dXJuIChpbmZvLT5kb21haW4gPT0gc2lfZG9tYWluKTsK
KyAgICAgICBkb21haW4gPSBkZWZlcnJlZF9hdHRhY2hfZG9tYWluKGRldik7CgotICAgICAgIHJl
dHVybiAwOworICAgICAgIHJldHVybiAoIWRvbWFpbiB8fCBkb21haW5fdHlwZV9pc19zaShkb21h
aW4pKTsKICB9CgogIHN0YXRpYyBpbnQgZG9tYWluX2FkZF9kZXZfaW5mbyhzdHJ1Y3QgZG1hcl9k
b21haW4gKmRvbWFpbiwgc3RydWN0IApkZXZpY2UgKmRldikKCkJlc3QgcmVnYXJkcywKYmFvbHUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFp
bGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
