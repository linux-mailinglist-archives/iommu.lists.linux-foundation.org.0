Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D6129D0F
	for <lists.iommu@lfdr.de>; Tue, 24 Dec 2019 04:24:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D068A855D2;
	Tue, 24 Dec 2019 03:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbrDGUCfObIE; Tue, 24 Dec 2019 03:24:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AFC184FC0;
	Tue, 24 Dec 2019 03:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C995C1D88;
	Tue, 24 Dec 2019 03:24:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF24C0881
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 03:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0FC258527F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 03:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRrA5r+eGKYu for <iommu@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 03:24:30 +0000 (UTC)
X-Greylist: delayed 19:09:06 by SQLgrey-1.7.6
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by whitealder.osuosl.org (Postfix) with ESMTP id B55DC84FC0
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 03:24:30 +0000 (UTC)
Received: from BC-Mail-Ex20.internal.baidu.com (unknown [172.31.51.14])
 by Forcepoint Email with ESMTPS id 4B48D1892EE3D18B334E;
 Tue, 24 Dec 2019 11:24:25 +0800 (CST)
Received: from BC-Mail-Ex03.internal.baidu.com (172.31.51.43) by
 BC-Mail-Ex20.internal.baidu.com (172.31.51.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Tue, 24 Dec 2019 11:24:25 +0800
Received: from BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) by
 BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) with mapi id
 15.01.1531.010; Tue, 24 Dec 2019 11:24:25 +0800
From: "Jim,Yan" <jimyan@baidu.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Jerry Snitselaar <jsnitsel@redhat.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDogRG9uJ3QgcmVq?=
 =?utf-8?Q?ect_nvme_host_due_to_scope_mismatch?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlvbW11L3Z0LWQ6IERvbid0IHJlamVjdCBudm1l?=
 =?utf-8?Q?_host_due_to_scope_mismatch?=
Thread-Index: AdW6BKk3WRIzqftPRCuhhluvn9v6Mg==
Date: Tue, 24 Dec 2019 03:24:24 +0000
Message-ID: <4b77511069cb4fbc982eebaad941cd23@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.200.92]
x-baidu-bdmsfe-datecheck: 1_BC-Mail-Ex20_2019-12-24 11:24:25:189
x-baidu-bdmsfe-viruscheck: BC-Mail-Ex20_GRAY_Inside_WithoutAtta_2019-12-24
 11:24:25:158
MIME-Version: 1.0
Cc: "Jim, Yan" <jimyan@baidu.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiAtLS0tLemCruS7tuWOn+S7ti0tLS0tDQo+IOWPkeS7tuS6ujogTHUgQmFvbHUgW21haWx0bzpi
YW9sdS5sdUBsaW51eC5pbnRlbC5jb21dDQo+IOWPkemAgeaXtumXtDogMjAxOeW5tDEy5pyIMjPm
l6UgMjE6MDUNCj4g5pS25Lu25Lq6OiBKaW0sWWFuIDxqaW15YW5AYmFpZHUuY29tPjsgSmVycnkg
U25pdHNlbGFhciA8anNuaXRzZWxAcmVkaGF0LmNvbT4NCj4g5oqE6YCBOiBpb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiDkuLvp
opg6IFJlOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDogRG9uJ3QgcmVqZWN0IG52bWUgaG9z
dCBkdWUgdG8gc2NvcGUNCj4gbWlzbWF0Y2gNCj4gDQo+IEhpLA0KPiANCj4gT24gMjAxOS8xMi8y
MyAxNTo1OSwgSmltLFlhbiB3cm90ZToNCj4gPj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiA+
PiDlj5Hku7bkuro6IEplcnJ5IFNuaXRzZWxhYXIgW21haWx0bzpqc25pdHNlbEByZWRoYXQuY29t
XQ0KPiA+PiDlj5HpgIHml7bpl7Q6IDIwMTnlubQxMuaciDIw5pelIDE3OjIzDQo+ID4+IOaUtuS7
tuS6ujogSmltLFlhbiA8amlteWFuQGJhaWR1LmNvbT4NCj4gPj4g5oqE6YCBOiBqb3JvQDhieXRl
cy5vcmc7IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOw0KPiA+PiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+ID4+IOS4u+mimDogUmU6IFtQQVRDSF0gaW9tbXUvdnQtZDog
RG9uJ3QgcmVqZWN0IG52bWUgaG9zdCBkdWUgdG8gc2NvcGUNCj4gPj4gbWlzbWF0Y2gNCj4gPj4N
Cj4gPj4gT24gRnJpIERlYyAyMCAxOSwgamlteWFuIHdyb3RlOg0KPiA+Pj4gT24gYSBzeXN0ZW0g
d2l0aCBhbiBJbnRlbCBQQ0llIHBvcnQgY29uZmlndXJlZCBhcyBhIG52bWUgaG9zdA0KPiA+Pj4g
ZGV2aWNlLCBpb21tdSBpbml0aWFsaXphdGlvbiBmYWlscyB3aXRoDQo+ID4+Pg0KPiA+Pj4gICAg
IERNQVI6IERldmljZSBzY29wZSB0eXBlIGRvZXMgbm90IG1hdGNoIGZvciAwMDAwOjgwOjAwLjAN
Cj4gPj4+DQo+ID4+PiBUaGlzIGlzIGJlY2F1c2UgdGhlIERNQVIgdGFibGUgcmVwb3J0cyB0aGlz
IGRldmljZSBhcyBoYXZpbmcgc2NvcGUgMg0KPiA+Pj4gKEFDUElfRE1BUl9TQ09QRV9UWVBFX0JS
SURHRSk6DQo+ID4+Pg0KPiA+Pg0KPiA+PiBJc24ndCB0aGF0IGEgcHJvYmxlbSB0byBiZSBmaXhl
ZCBpbiB0aGUgRE1BUiB0YWJsZSB0aGVuPw0KPiA+Pg0KPiA+Pj4gYnV0IHRoZSBkZXZpY2UgaGFz
IGEgdHlwZSAwIFBDSSBoZWFkZXI6DQo+ID4+PiA4MDowMC4wIENsYXNzIDA2MDA6IERldmljZSA4
MDg2OjIwMjAgKHJldiAwNikNCj4gPj4+IDAwOiA4NiA4MCAyMCAyMCA0NyAwNSAxMCAwMCAwNiAw
MCAwMCAwNiAxMCAwMCAwMCAwMA0KPiA+Pj4gMTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+ID4+PiAyMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgODYgODAgMDAgMDANCj4gPj4+IDMwOiAwMCAwMCAwMCAwMCA5MCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMSAwMCAwMA0KPiA+Pj4NCj4gPj4+IFZULWQgd29ya3MgcGVyZmVj
dGx5IG9uIHRoaXMgc3lzdGVtLCBzbyB0aGVyZSdzIG5vIHJlYXNvbiB0byBiYWlsDQo+ID4+PiBv
dXQgb24gaW5pdGlhbGl6YXRpb24gZHVlIHRvIHRoaXMgYXBwYXJlbnQgc2NvcGUgbWlzbWF0Y2gu
IEFkZCB0aGUNCj4gPj4+IGNsYXNzDQo+ID4+PiAweDYwMCAoIlBDSV9DTEFTU19CUklER0VfSE9T
VCIpIGFzIGEgaGV1cmlzdGljIGZvciBhbGxvd2luZyBETUFSDQo+ID4+PiBpbml0aWFsaXphdGlv
biBmb3Igbm9uLWJyaWRnZSBQQ0kgZGV2aWNlcyBsaXN0ZWQgd2l0aCBzY29wZSBicmlkZ2UuDQo+
ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogamlteWFuIDxqaW15YW5AYmFpZHUuY29tPg0KPiA+
Pj4gLS0tDQo+ID4+PiBkcml2ZXJzL2lvbW11L2RtYXIuYyB8IDEgKw0KPiA+Pj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW9tbXUvZG1hci5jIGIvZHJpdmVycy9pb21tdS9kbWFyLmMgaW5kZXgNCj4gPj4+IGVlY2Q2YTQy
MTY2Ny4uOWZhZjJmMGUwMjM3IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9kbWFy
LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZG1hci5jDQo+ID4+PiBAQCAtMjQ0LDYgKzI0
NCw3IEBAIGludCBkbWFyX2luc2VydF9kZXZfc2NvcGUoc3RydWN0DQo+ID4+IGRtYXJfcGNpX25v
dGlmeV9pbmZvICppbmZvLA0KPiA+Pj4gCQkgICAgIGluZm8tPmRldi0+aGRyX3R5cGUgIT0gUENJ
X0hFQURFUl9UWVBFX05PUk1BTCkgfHwNCj4gPj4+IAkJICAgIChzY29wZS0+ZW50cnlfdHlwZSA9
PSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9CUklER0UNCj4gJiYNCj4gPj4+IAkJICAgICAoaW5mby0+
ZGV2LT5oZHJfdHlwZSA9PSBQQ0lfSEVBREVSX1RZUEVfTk9STUFMICYmDQo+ID4+PiArCQkJICBp
bmZvLT5kZXYtPmNsYXNzID4+IDggIT0gUENJX0NMQVNTX0JSSURHRV9IT1NUICYmDQo+ID4+PiAJ
CSAgICAgIGluZm8tPmRldi0+Y2xhc3MgPj4gOCAhPSBQQ0lfQ0xBU1NfQlJJREdFX09USEVSKSkp
IHsNCj4gPj4+IAkJCXByX3dhcm4oIkRldmljZSBzY29wZSB0eXBlIGRvZXMgbm90IG1hdGNoIGZv
ciAlc1xuIiwNCj4gPj4+IAkJCQlwY2lfbmFtZShpbmZvLT5kZXYpKTsNCj4gPj4+IC0tDQo+ID4+
PiAyLjExLjANCj4gPj4+DQo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiA+Pj4gaW9tbXUgbWFpbGluZyBsaXN0DQo+ID4+PiBpb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZw0KPiA+Pj4gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXUNCj4gPj4+DQo+ID4gQWN0dWFsbHkgdGhpcyBw
YXRjaCBpcyBzaW1pbGFyIHRvIHRoZSBjb21taXQ6IGZmYjJkMWViODhjMygiaW9tbXUvdnQtZDog
RG9uJ3QNCj4gcmVqZWN0IE5UQiBkZXZpY2VzIGR1ZSB0byBzY29wZSBtaXNtYXRjaCIpLiBCZXNp
ZGVzLCBtb2RpZnlpbmcgRE1BUiB0YWJsZQ0KPiBuZWVkIE9FTSB1cGRhdGUgQklPUy4gSXQgaXMg
aGFyZCB0byBpbXBsZW1lbnQuDQo+ID4NCj4gDQo+IEZvciBib3RoIGNhc2VzLCBhIHF1aXJrIGZs
YWcgc2VlbXMgdG8gYmUgbW9yZSByZWFzb25hYmxlLCBzbyB0aGF0IHVucmVsYXRlZA0KPiBkZXZp
Y2VzIHdpbGwgbm90IGJlIGltcGFjdGVkLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBiYW9sdQ0K
DQpIaSBCYW9sdSwNCglUaGFua3MgZm9yIHlvdXIgYWR2aWNlLiBBbmQgSSBtb2RpZnkgdGhlIHBh
dGNoIGFzIGZvbGxvdy4NCg0KICAgIE9uIGEgc3lzdGVtIHdpdGggYW4gSW50ZWwgUENJZSBwb3J0
IGNvbmZpZ3VyZWQgYXMgYSBudm1lIGhvc3QgZGV2aWNlLCBpb21tdQ0KICAgIGluaXRpYWxpemF0
aW9uIGZhaWxzIHdpdGgNCiAgICANCiAgICAgICAgRE1BUjogRGV2aWNlIHNjb3BlIHR5cGUgZG9l
cyBub3QgbWF0Y2ggZm9yIDAwMDA6ODA6MDAuMA0KICAgIA0KICAgIFRoaXMgaXMgYmVjYXVzZSB0
aGUgRE1BUiB0YWJsZSByZXBvcnRzIHRoaXMgZGV2aWNlIGFzIGhhdmluZyBzY29wZSAyDQogICAg
KEFDUElfRE1BUl9TQ09QRV9UWVBFX0JSSURHRSk6DQogICAgDQogICAgYnV0IHRoZSBkZXZpY2Ug
aGFzIGEgdHlwZSAwIFBDSSBoZWFkZXI6DQogICAgODA6MDAuMCBDbGFzcyAwNjAwOiBEZXZpY2Ug
ODA4NjoyMDIwIChyZXYgMDYpDQogICAgMDA6IDg2IDgwIDIwIDIwIDQ3IDA1IDEwIDAwIDA2IDAw
IDAwIDA2IDEwIDAwIDAwIDAwDQogICAgMTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwDQogICAgMjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDg2IDgwIDAwIDAwDQogICAgMzA6IDAwIDAwIDAwIDAwIDkwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAxIDAwIDAwDQogICAgDQogICAgVlQtZCB3b3JrcyBwZXJmZWN0bHkgb24gdGhp
cyBzeXN0ZW0sIHNvIHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGJhaWwgb3V0DQogICAgb24gaW5pdGlh
bGl6YXRpb24gZHVlIHRvIHRoaXMgYXBwYXJlbnQgc2NvcGUgbWlzbWF0Y2guIEFkZCB0aGUgY2xh
c3MNCiAgICAweDA2ICgiUENJX0JBU0VfQ0xBU1NfQlJJREdFIikgYXMgYSBoZXVyaXN0aWMgZm9y
IGFsbG93aW5nIERNQVINCiAgICBpbml0aWFsaXphdGlvbiBmb3Igbm9uLWJyaWRnZSBQQ0kgZGV2
aWNlcyBsaXN0ZWQgd2l0aCBzY29wZSBicmlkZ2UuDQogICAgDQogICAgU2lnbmVkLW9mZi1ieTog
amlteWFuIDxqaW15YW5AYmFpZHUuY29tPg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9k
bWFyLmMgYi9kcml2ZXJzL2lvbW11L2RtYXIuYw0KaW5kZXggZWVjZDZhNDIxNjY3Li41MGM5MmVi
MjNlZTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2lvbW11L2RtYXIuYw0KKysrIGIvZHJpdmVycy9p
b21tdS9kbWFyLmMNCkBAIC0yNDQsNyArMjQ0LDcgQEAgaW50IGRtYXJfaW5zZXJ0X2Rldl9zY29w
ZShzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8sDQogICAgICAgICAgICAgICAgICAg
ICBpbmZvLT5kZXYtPmhkcl90eXBlICE9IFBDSV9IRUFERVJfVFlQRV9OT1JNQUwpIHx8DQogICAg
ICAgICAgICAgICAgICAgIChzY29wZS0+ZW50cnlfdHlwZSA9PSBBQ1BJX0RNQVJfU0NPUEVfVFlQ
RV9CUklER0UgJiYNCiAgICAgICAgICAgICAgICAgICAgIChpbmZvLT5kZXYtPmhkcl90eXBlID09
IFBDSV9IRUFERVJfVFlQRV9OT1JNQUwgJiYNCi0gICAgICAgICAgICAgICAgICAgICBpbmZvLT5k
ZXYtPmNsYXNzID4+IDggIT0gUENJX0NMQVNTX0JSSURHRV9PVEhFUikpKSB7DQorICAgICAgICAg
ICAgICAgICAgICAgaW5mby0+ZGV2LT5jbGFzcyA+PiAxNiAhPSBQQ0lfQkFTRV9DTEFTU19CUklE
R0UpKSkgew0KICAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiRGV2aWNlIHNjb3BlIHR5
cGUgZG9lcyBub3QgbWF0Y2ggZm9yICVzXG4iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwY2lfbmFtZShpbmZvLT5kZXYpKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KDQoNCkppbQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
