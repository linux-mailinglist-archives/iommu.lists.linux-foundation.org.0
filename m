Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 622DC129F06
	for <lists.iommu@lfdr.de>; Tue, 24 Dec 2019 09:33:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FA0487155;
	Tue, 24 Dec 2019 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTDDzBosCVsk; Tue, 24 Dec 2019 08:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E6D087143;
	Tue, 24 Dec 2019 08:33:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1567FC0881;
	Tue, 24 Dec 2019 08:33:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ED8AC0881
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 08:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37E0E84D49
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 08:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdCZ-ynTDWil for <iommu@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 08:33:39 +0000 (UTC)
X-Greylist: delayed 00:15:24 by SQLgrey-1.7.6
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2EEE84C53
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 08:33:39 +0000 (UTC)
Received: from BC-Mail-EX02.internal.baidu.com (unknown [172.31.51.42])
 by Forcepoint Email with ESMTPS id 869F7D58A65B88236D2E;
 Tue, 24 Dec 2019 16:18:06 +0800 (CST)
Received: from BC-Mail-Ex03.internal.baidu.com (172.31.51.43) by
 BC-Mail-EX02.internal.baidu.com (172.31.51.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1531.3; Tue, 24 Dec 2019 16:18:06 +0800
Received: from BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) by
 BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) with mapi id
 15.01.1531.010; Tue, 24 Dec 2019 16:18:06 +0800
From: "Jim,Yan" <jimyan@baidu.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Jerry Snitselaar <jsnitsel@redhat.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSBpb21tdS92dC1kOiBE?=
 =?utf-8?Q?on't_reject_nvme_host_due_to_scope_mismatch?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDogRG9uJ3QgcmVq?=
 =?utf-8?Q?ect_nvme_host_due_to_scope_mismatch?=
Thread-Index: AdW6BKk3WRIzqftPRCuhhluvn9v6Mv//tuqA//9dBfA=
Date: Tue, 24 Dec 2019 08:18:05 +0000
Message-ID: <8fbd6988b0a94c5e9e4b23eed59114dc@baidu.com>
References: <4b77511069cb4fbc982eebaad941cd23@baidu.com>
 <149a454d-96ea-1e25-74d1-04a08f8b261e@linux.intel.com>
In-Reply-To: <149a454d-96ea-1e25-74d1-04a08f8b261e@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.200.92]
x-baidu-bdmsfe-datecheck: 1_BC-Mail-EX02_2019-12-24 16:18:06:475
x-baidu-bdmsfe-viruscheck: BC-Mail-EX02_GRAY_Inside_WithoutAtta_2019-12-24
 16:18:06:460
MIME-Version: 1.0
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

SGkgQmFvbHUsDQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IEx1IEJh
b2x1IFttYWlsdG86YmFvbHUubHVAbGludXguaW50ZWwuY29tXQ0KPiDlj5HpgIHml7bpl7Q6IDIw
MTnlubQxMuaciDI05pelIDE0OjI3DQo+IOaUtuS7tuS6ujogSmltLFlhbiA8amlteWFuQGJhaWR1
LmNvbT47IEplcnJ5IFNuaXRzZWxhYXIgPGpzbml0c2VsQHJlZGhhdC5jb20+DQo+IOaKhOmAgTog
aW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCj4g5Li76aKYOiBSZTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDog
RG9uJ3QgcmVqZWN0IG52bWUgaG9zdCBkdWUgdG8NCj4gc2NvcGUgbWlzbWF0Y2gNCj4gDQo+IEhp
IEppbSwNCj4gDQo+IE9uIDIwMTkvMTIvMjQgMTE6MjQsIEppbSxZYW4gd3JvdGU6DQo+ID4+IC0t
LS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4gPj4g5Y+R5Lu25Lq6OiBMdSBCYW9sdSBbbWFpbHRvOmJh
b2x1Lmx1QGxpbnV4LmludGVsLmNvbV0NCj4gPj4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0MTLmnIgy
M+aXpSAyMTowNQ0KPiA+PiDmlLbku7bkuro6IEppbSxZYW4gPGppbXlhbkBiYWlkdS5jb20+OyBK
ZXJyeSBTbml0c2VsYWFyDQo+ID4+IDxqc25pdHNlbEByZWRoYXQuY29tPg0KPiA+PiDmioTpgIE6
IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+ID4+IOS4u+mimDogUmU6IOetlOWkjTogW1BBVENIXSBpb21tdS92dC1kOiBEb24n
dCByZWplY3QgbnZtZSBob3N0IGR1ZSB0byBzY29wZQ0KPiA+PiBtaXNtYXRjaA0KPiA+Pg0KPiA+
PiBIaSwNCj4gPj4NCj4gPj4gT24gMjAxOS8xMi8yMyAxNTo1OSwgSmltLFlhbiB3cm90ZToNCj4g
Pj4+PiAtLS0tLemCruS7tuWOn+S7ti0tLS0tDQo+ID4+Pj4g5Y+R5Lu25Lq6OiBKZXJyeSBTbml0
c2VsYWFyIFttYWlsdG86anNuaXRzZWxAcmVkaGF0LmNvbV0NCj4gPj4+PiDlj5HpgIHml7bpl7Q6
IDIwMTnlubQxMuaciDIw5pelIDE3OjIzDQo+ID4+Pj4g5pS25Lu25Lq6OiBKaW0sWWFuIDxqaW15
YW5AYmFpZHUuY29tPg0KPiA+Pj4+IOaKhOmAgTogam9yb0A4Ynl0ZXMub3JnOyBpb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZzsNCj4gPj4+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQo+ID4+Pj4g5Li76aKYOiBSZTogW1BBVENIXSBpb21tdS92dC1kOiBEb24ndCByZWplY3Qg
bnZtZSBob3N0IGR1ZSB0byBzY29wZQ0KPiA+Pj4+IG1pc21hdGNoDQo+ID4+Pj4NCj4gPj4+PiBP
biBGcmkgRGVjIDIwIDE5LCBqaW15YW4gd3JvdGU6DQo+ID4+Pj4+IE9uIGEgc3lzdGVtIHdpdGgg
YW4gSW50ZWwgUENJZSBwb3J0IGNvbmZpZ3VyZWQgYXMgYSBudm1lIGhvc3QNCj4gPj4+Pj4gZGV2
aWNlLCBpb21tdSBpbml0aWFsaXphdGlvbiBmYWlscyB3aXRoDQo+ID4+Pj4+DQo+ID4+Pj4+ICAg
ICAgRE1BUjogRGV2aWNlIHNjb3BlIHR5cGUgZG9lcyBub3QgbWF0Y2ggZm9yIDAwMDA6ODA6MDAu
MA0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGlzIGlzIGJlY2F1c2UgdGhlIERNQVIgdGFibGUgcmVwb3J0
cyB0aGlzIGRldmljZSBhcyBoYXZpbmcgc2NvcGUNCj4gPj4+Pj4gMg0KPiA+Pj4+PiAoQUNQSV9E
TUFSX1NDT1BFX1RZUEVfQlJJREdFKToNCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IElzbid0IHRo
YXQgYSBwcm9ibGVtIHRvIGJlIGZpeGVkIGluIHRoZSBETUFSIHRhYmxlIHRoZW4/DQo+ID4+Pj4N
Cj4gPj4+Pj4gYnV0IHRoZSBkZXZpY2UgaGFzIGEgdHlwZSAwIFBDSSBoZWFkZXI6DQo+ID4+Pj4+
IDgwOjAwLjAgQ2xhc3MgMDYwMDogRGV2aWNlIDgwODY6MjAyMCAocmV2IDA2KQ0KPiA+Pj4+PiAw
MDogODYgODAgMjAgMjAgNDcgMDUgMTAgMDAgMDYgMDAgMDAgMDYgMTAgMDAgMDAgMDANCj4gPj4+
Pj4gMTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+
ID4+Pj4+IDIwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCA4NiA4MCAwMCAw
MA0KPiA+Pj4+PiAzMDogMDAgMDAgMDAgMDAgOTAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDEg
MDAgMDANCj4gPj4+Pj4NCj4gPj4+Pj4gVlQtZCB3b3JrcyBwZXJmZWN0bHkgb24gdGhpcyBzeXN0
ZW0sIHNvIHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGJhaWwNCj4gPj4+Pj4gb3V0IG9uIGluaXRpYWxp
emF0aW9uIGR1ZSB0byB0aGlzIGFwcGFyZW50IHNjb3BlIG1pc21hdGNoLiBBZGQgdGhlDQo+ID4+
Pj4+IGNsYXNzDQo+ID4+Pj4+IDB4NjAwICgiUENJX0NMQVNTX0JSSURHRV9IT1NUIikgYXMgYSBo
ZXVyaXN0aWMgZm9yIGFsbG93aW5nIERNQVINCj4gPj4+Pj4gaW5pdGlhbGl6YXRpb24gZm9yIG5v
bi1icmlkZ2UgUENJIGRldmljZXMgbGlzdGVkIHdpdGggc2NvcGUgYnJpZGdlLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBqaW15YW4gPGppbXlhbkBiYWlkdS5jb20+DQo+ID4+Pj4+
IC0tLQ0KPiA+Pj4+PiBkcml2ZXJzL2lvbW11L2RtYXIuYyB8IDEgKw0KPiA+Pj4+PiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaW9tbXUvZG1hci5jIGIvZHJpdmVycy9pb21tdS9kbWFyLmMgaW5kZXgNCj4gPj4+Pj4g
ZWVjZDZhNDIxNjY3Li45ZmFmMmYwZTAyMzcgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMv
aW9tbXUvZG1hci5jDQo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZG1hci5jDQo+ID4+Pj4+
IEBAIC0yNDQsNiArMjQ0LDcgQEAgaW50IGRtYXJfaW5zZXJ0X2Rldl9zY29wZShzdHJ1Y3QNCj4g
Pj4+PiBkbWFyX3BjaV9ub3RpZnlfaW5mbyAqaW5mbywNCj4gPj4+Pj4gCQkgICAgIGluZm8tPmRl
di0+aGRyX3R5cGUgIT0gUENJX0hFQURFUl9UWVBFX05PUk1BTCkgfHwNCj4gPj4+Pj4gCQkgICAg
KHNjb3BlLT5lbnRyeV90eXBlID09IEFDUElfRE1BUl9TQ09QRV9UWVBFX0JSSURHRQ0KPiA+PiAm
Jg0KPiA+Pj4+PiAJCSAgICAgKGluZm8tPmRldi0+aGRyX3R5cGUgPT0gUENJX0hFQURFUl9UWVBF
X05PUk1BTCAmJg0KPiA+Pj4+PiArCQkJICBpbmZvLT5kZXYtPmNsYXNzID4+IDggIT0gUENJX0NM
QVNTX0JSSURHRV9IT1NUICYmDQo+ID4+Pj4+IAkJICAgICAgaW5mby0+ZGV2LT5jbGFzcyA+PiA4
ICE9IFBDSV9DTEFTU19CUklER0VfT1RIRVIpKSkgew0KPiA+Pj4+PiAJCQlwcl93YXJuKCJEZXZp
Y2Ugc2NvcGUgdHlwZSBkb2VzIG5vdCBtYXRjaCBmb3IgJXNcbiIsDQo+ID4+Pj4+IAkJCQlwY2lf
bmFtZShpbmZvLT5kZXYpKTsNCj4gPj4+Pj4gLS0NCj4gPj4+Pj4gMi4xMS4wDQo+ID4+Pj4+DQo+
ID4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
ID4+Pj4+IGlvbW11IG1haWxpbmcgbGlzdA0KPiA+Pj4+PiBpb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZw0KPiA+Pj4+PiBodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9pb21tdQ0KPiA+Pj4+Pg0KPiA+Pj4gQWN0dWFsbHkgdGhpcyBwYXRjaCBp
cyBzaW1pbGFyIHRvIHRoZSBjb21taXQ6DQo+ID4+PiBmZmIyZDFlYjg4YzMoImlvbW11L3Z0LWQ6
IERvbid0DQo+ID4+IHJlamVjdCBOVEIgZGV2aWNlcyBkdWUgdG8gc2NvcGUgbWlzbWF0Y2giKS4g
QmVzaWRlcywgbW9kaWZ5aW5nIERNQVINCj4gPj4gdGFibGUgbmVlZCBPRU0gdXBkYXRlIEJJT1Mu
IEl0IGlzIGhhcmQgdG8gaW1wbGVtZW50Lg0KPiA+Pj4NCj4gPj4NCj4gPj4gRm9yIGJvdGggY2Fz
ZXMsIGEgcXVpcmsgZmxhZyBzZWVtcyB0byBiZSBtb3JlIHJlYXNvbmFibGUsIHNvIHRoYXQNCj4g
Pj4gdW5yZWxhdGVkIGRldmljZXMgd2lsbCBub3QgYmUgaW1wYWN0ZWQuDQo+ID4+DQo+ID4+IEJl
c3QgcmVnYXJkcywNCj4gPj4gYmFvbHUNCj4gPg0KPiA+IEhpIEJhb2x1LA0KPiA+IAlUaGFua3Mg
Zm9yIHlvdXIgYWR2aWNlLiBBbmQgSSBtb2RpZnkgdGhlIHBhdGNoIGFzIGZvbGxvdy4NCj4gDQo+
IEkganVzdCBwb3N0ZWQgYSBwYXRjaCBmb3IgYm90aCBOVEcgYW5kIE5WTUUgY2FzZXMuIENhbiB5
b3UgcGxlYXNlIHRha2UgYSBsb29rPw0KPiBEb2VzIGl0IHdvcmsgZm9yIHlvdT8NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gYmFvbHUNCj4gDQpJIGhhdmUgdGVzdGVkIHlvdXIgcGF0Y2guIEl0IGRv
ZXMgd29yayBmb3IgbWUuIEJ1dCBJIHByZWZlciBteSBzZWNvbmQgdmVyc2lvbiwgaXQgaXMgbW9y
ZSBmbGV4aWJsZSwgYW5kIG1heSB1c2UgZm9yIHNpbWlsYXIgdW5rbm93biBkZXZpY2VzLg0KDQo+
ID4NCj4gPiAgICAgIE9uIGEgc3lzdGVtIHdpdGggYW4gSW50ZWwgUENJZSBwb3J0IGNvbmZpZ3Vy
ZWQgYXMgYSBudm1lIGhvc3QgZGV2aWNlLA0KPiBpb21tdQ0KPiA+ICAgICAgaW5pdGlhbGl6YXRp
b24gZmFpbHMgd2l0aA0KPiA+DQo+ID4gICAgICAgICAgRE1BUjogRGV2aWNlIHNjb3BlIHR5cGUg
ZG9lcyBub3QgbWF0Y2ggZm9yIDAwMDA6ODA6MDAuMA0KPiA+DQo+ID4gICAgICBUaGlzIGlzIGJl
Y2F1c2UgdGhlIERNQVIgdGFibGUgcmVwb3J0cyB0aGlzIGRldmljZSBhcyBoYXZpbmcgc2NvcGUg
Mg0KPiA+ICAgICAgKEFDUElfRE1BUl9TQ09QRV9UWVBFX0JSSURHRSk6DQo+ID4NCj4gPiAgICAg
IGJ1dCB0aGUgZGV2aWNlIGhhcyBhIHR5cGUgMCBQQ0kgaGVhZGVyOg0KPiA+ICAgICAgODA6MDAu
MCBDbGFzcyAwNjAwOiBEZXZpY2UgODA4NjoyMDIwIChyZXYgMDYpDQo+ID4gICAgICAwMDogODYg
ODAgMjAgMjAgNDcgMDUgMTAgMDAgMDYgMDAgMDAgMDYgMTAgMDAgMDAgMDANCj4gPiAgICAgIDEw
OiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KPiA+ICAg
ICAgMjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDg2IDgwIDAwIDAwDQo+
ID4gICAgICAzMDogMDAgMDAgMDAgMDAgOTAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDEgMDAg
MDANCj4gPg0KPiA+ICAgICAgVlQtZCB3b3JrcyBwZXJmZWN0bHkgb24gdGhpcyBzeXN0ZW0sIHNv
IHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGJhaWwgb3V0DQo+ID4gICAgICBvbiBpbml0aWFsaXphdGlv
biBkdWUgdG8gdGhpcyBhcHBhcmVudCBzY29wZSBtaXNtYXRjaC4gQWRkIHRoZSBjbGFzcw0KPiA+
ICAgICAgMHgwNiAoIlBDSV9CQVNFX0NMQVNTX0JSSURHRSIpIGFzIGEgaGV1cmlzdGljIGZvciBh
bGxvd2luZyBETUFSDQo+ID4gICAgICBpbml0aWFsaXphdGlvbiBmb3Igbm9uLWJyaWRnZSBQQ0kg
ZGV2aWNlcyBsaXN0ZWQgd2l0aCBzY29wZSBicmlkZ2UuDQo+ID4NCj4gPiAgICAgIFNpZ25lZC1v
ZmYtYnk6IGppbXlhbiA8amlteWFuQGJhaWR1LmNvbT4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L2RtYXIuYyBiL2RyaXZlcnMvaW9tbXUvZG1hci5jIGluZGV4DQo+ID4gZWVj
ZDZhNDIxNjY3Li41MGM5MmViMjNlZTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9k
bWFyLmMNCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L2RtYXIuYw0KPiA+IEBAIC0yNDQsNyArMjQ0
LDcgQEAgaW50IGRtYXJfaW5zZXJ0X2Rldl9zY29wZShzdHJ1Y3QNCj4gZG1hcl9wY2lfbm90aWZ5
X2luZm8gKmluZm8sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGluZm8tPmRldi0+aGRyX3R5
cGUgIT0NCj4gUENJX0hFQURFUl9UWVBFX05PUk1BTCkgfHwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAoc2NvcGUtPmVudHJ5X3R5cGUgPT0NCj4gQUNQSV9ETUFSX1NDT1BFX1RZUEVfQlJJREdF
ICYmDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIChpbmZvLT5kZXYtPmhkcl90eXBlID09DQo+
IFBDSV9IRUFERVJfVFlQRV9OT1JNQUwgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgaW5m
by0+ZGV2LT5jbGFzcyA+PiA4ICE9DQo+IFBDSV9DTEFTU19CUklER0VfT1RIRVIpKSkgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICBpbmZvLT5kZXYtPmNsYXNzID4+IDE2ICE9DQo+ID4gKyBQ
Q0lfQkFTRV9DTEFTU19CUklER0UpKSkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBw
cl93YXJuKCJEZXZpY2Ugc2NvcGUgdHlwZSBkb2VzIG5vdCBtYXRjaA0KPiBmb3IgJXNcbiIsDQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX25hbWUoaW5mby0+ZGV2KSk7
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4N
Cj4gPiBKaW0NCj4gPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
