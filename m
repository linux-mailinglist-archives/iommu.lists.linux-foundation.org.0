Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326F23A1DB
	for <lists.iommu@lfdr.de>; Mon,  3 Aug 2020 11:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CAC186788;
	Mon,  3 Aug 2020 09:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Le8u1LyUQdk; Mon,  3 Aug 2020 09:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60EAC8671A;
	Mon,  3 Aug 2020 09:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54744C004C;
	Mon,  3 Aug 2020 09:41:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9035AC004C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 09:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7ECE885B18
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 09:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVwv2goxeRFo for <iommu@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 09:41:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5527C854E0
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 09:41:33 +0000 (UTC)
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 3 Aug 2020
 17:41:29 +0800
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by zxbjmbx2.zhaoxin.com
 (10.29.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 3 Aug 2020
 17:41:29 +0800
Received: from zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416]) by
 zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416%16]) with mapi id
 15.01.1979.003; Mon, 3 Aug 2020 17:41:28 +0800
From: FelixCui-oc <FelixCui-oc@zhaoxin.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSBpb21tdS92dC1kOkFk?=
 =?utf-8?Q?d_support_for_ACPI_device_in_RMRR?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDpBZGQgc3VwcG9y?=
 =?utf-8?Q?t_for_ACPI_device_in_RMRR?=
Thread-Index: AQHWaLTDQmhhOccXwUmx3ozYFRtFBKklJPeAgACMEUD//7NFgIAAiuzg//+YlYCAAIpwQIAADhiQ
Date: Mon, 3 Aug 2020 09:41:28 +0000
Message-ID: <1aea042a1b524ef88e491ca2a6d95fb7@zhaoxin.com>
References: <20200802100735.2722-1-FelixCui-oc@zhaoxin.com>
 <73d4a1e4-f6b7-efb0-e225-2e462c838657@linux.intel.com>
 <f6759b9bb2594026b58f9a89e3ce9dc6@zhaoxin.com>
 <9f64d9b6-16e8-73ce-2186-9d8ba49c39f4@linux.intel.com>
 <44ff8f73fa1f49a183a1d8d6d9c2213c@zhaoxin.com>
 <314679b4-7653-041b-9310-73baf8117766@linux.intel.com> 
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.29.8.19]
MIME-Version: 1.0
Cc: CobeChen-oc <CobeChen-oc@zhaoxin.com>
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

SGkgYmFvbHUsDQoJCSBkbWFyX2FjcGlfZGV2X3Njb3BlX2luaXQoKSBwYXJzZSBBTkREIHN0cnVj
dHVyZSBhbmQgZW51bWVyYXRlZCBuYW1lc3BhY2VzIGRldmljZSBpbiBEUkhELg0KCQkgQnV0IHRo
ZSBuYW1lc3BhY2UgZGV2aWNlIGluIFJNUlIgaXMgbm90IGVudW1lcmF0ZWQsIHJpZ2h0Pw0KDQpC
ZXN0IHJlZ2FyZHMNCkZlbGl4IGN1aS1vYw0KDQoNCg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0t
DQrlj5Hku7bkuro6IEZlbGl4Q3VpLW9jIA0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0OOaciDPml6Ug
MTc6MDINCuaUtuS7tuS6ujogJ0x1IEJhb2x1JyA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPjsg
Sm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+OyBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRGF2aWQgV29vZGhvdXNlIDxk
d213MkBpbmZyYWRlYWQub3JnPg0K5oqE6YCBOiBSYXltb25kUGFuZy1vYyA8UmF5bW9uZFBhbmct
b2NAemhhb3hpbi5jb20+OyBDb2JlQ2hlbi1vYyA8Q29iZUNoZW4tb2NAemhhb3hpbi5jb20+DQrk
uLvpopg6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDpBZGQgc3Vw
cG9ydCBmb3IgQUNQSSBkZXZpY2UgaW4gUk1SUg0KDQpIaSAgYmFvbHU6DQoJCSJUaGUgbmFtZXNw
YWNlIGRldmljZXMgYXJlIGVudW1lcmF0ZWQgaW4gcHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNl
cygpLg0KCQlJdCBjYWxscyBpb21tdV9wcm9iZV9kZXZpY2UoKSB0byBwcm9jZXNzIHRoZSBlbnVt
ZXJhdGlvbiBhbmQgc2V0dXAgdGhlIGlkZW50aXR5IG1hcHBpbmdzLiINCgkJDQoJCVRoaXMgc2l0
dWF0aW9uIG9ubHkgYXBwbGllcyB0byB0aGUgcGh5c2ljYWwgbm9kZSBvZiB0aGUgbmFtZXNwYWNl
cyBkZXZpY2UgYXMgdGhlIHBjaSBkZXZpY2UuDQoJCUluIGZhY3QsIHRoZSBwaHlzaWNhbCBub2Rl
IG9mIHRoZSBuYW1lc3BhY2VzIGRldmljZSBjYW4gYmUgYSBwbGF0Zm9ybSBkZXZpY2Ugb3IgTlVM
TC4NCgkJSWYgdGhlIHBoeXNpY2FsIG5vZGUgb2YgdGhlIG5hbWVzcGFjZXMgaXMgYSBwbGF0Zm9y
bSBkZXZpY2Ugb3IgTlVMTCwgaXQgaGFzIG5vdCBhY3R1YWxseSBiZWVuIGVudW1lcmF0ZWQuDQoJ
CVNvIGl0IGlzIG5lY2Vzc2FyeSB0byBpbmNyZWFzZSB0aGUgYW5hbHlzaXMgb2YgdGhlIG5hbWVz
cGFjZXMgZGV2aWNlIGluIFJNUlIgYW5kIGVzdGFibGlzaCBhbiBpZGVudGl0eSBtYXBwaW5nLg0K
DQpCZXN0IHJlZ2FyZHMNCkZlbGl4IGN1aQ0KDQoNCg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0t
DQrlj5Hku7bkuro6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+DQrlj5HpgIHm
l7bpl7Q6IDIwMjDlubQ45pyIM+aXpSAxNjoyNg0K5pS25Lu25Lq6OiBGZWxpeEN1aS1vYyA8RmVs
aXhDdWktb2NAemhhb3hpbi5jb20+OyBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz47IGlv
bW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+DQrmioTpgIE6IGJhb2x1
Lmx1QGxpbnV4LmludGVsLmNvbTsgUmF5bW9uZFBhbmctb2MgPFJheW1vbmRQYW5nLW9jQHpoYW94
aW4uY29tPjsgQ29iZUNoZW4tb2MgPENvYmVDaGVuLW9jQHpoYW94aW4uY29tPg0K5Li76aKYOiBS
ZTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDpBZGQgc3VwcG9ydCBmb3IgQUNQ
SSBkZXZpY2UgaW4gUk1SUg0KDQpPbiAyMDIwLzgvMyAxNDo1MiwgRmVsaXhDdWktb2Mgd3JvdGU6
DQo+IEhpICBiYW9sdSAsDQo+IAkJWWVzICx0aGF0J3MgcmlnaHQuDQo+IAkJVGhpcyBwYXRjaCBp
cyB0byBhY2hpZXZlIGFjcGkgbmFtZXNwYWNlIGRldmljZXMgdG8gYWNjZXNzIHRoZSBSTVJSIHJl
Z2lvbi4NCg0KVGhlIG5hbWVzcGFjZSBkZXZpY2VzIGFyZSBlbnVtZXJhdGVkIGluIHByb2JlX2Fj
cGlfbmFtZXNwYWNlX2RldmljZXMoKS4NCkl0IGNhbGxzIGlvbW11X3Byb2JlX2RldmljZSgpIHRv
IHByb2Nlc3MgdGhlIGVudW1lcmF0aW9uIGFuZCBzZXR1cCB0aGUgaWRlbnRpdHkgbWFwcGluZ3Mu
IENhbiB5b3UgcGxlYXNlIGNoZWNrIHdoeSB0aGF0IGNvZGUgZG9lc24ndCB3b3JrIGZvciB5b3U/
DQoNCkJlc3QgcmVnYXJkcywNCmJhb2x1DQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBGZWxpeCBj
dWkNCj4gDQo+IA0KPiANCj4gDQo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4g5Y+R5Lu25Lq6
OiBMdSBCYW9sdSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPg0KPiDlj5HpgIHml7bpl7Q6IDIw
MjDlubQ45pyIM+aXpSAxNDoxOQ0KPiDmlLbku7bkuro6IEZlbGl4Q3VpLW9jIDxGZWxpeEN1aS1v
Y0B6aGFveGluLmNvbT47IEpvZXJnIFJvZWRlbCANCj4gPGpvcm9AOGJ5dGVzLm9yZz47IGlvbW11
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyANCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPg0KPiDmioTpgIE6IGJh
b2x1Lmx1QGxpbnV4LmludGVsLmNvbTsgUmF5bW9uZFBhbmctb2MgDQo+IDxSYXltb25kUGFuZy1v
Y0B6aGFveGluLmNvbT47IENvYmVDaGVuLW9jIDxDb2JlQ2hlbi1vY0B6aGFveGluLmNvbT4NCj4g
5Li76aKYOiBSZTog562U5aSNOiBbUEFUQ0hdIGlvbW11L3Z0LWQ6QWRkIHN1cHBvcnQgZm9yIEFD
UEkgZGV2aWNlIGluIFJNUlINCj4gDQo+IEhpLA0KPiANCj4gT24gMjAyMC84LzMgMTI6NDAsIEZl
bGl4Q3VpLW9jIHdyb3RlOg0KPj4gSGkgYmFvbHU6DQo+PiAJCVNvbWUgQUNQSSBkZXZpY2VzIG5l
ZWQgdG8gaXNzdWUgZG1hIHJlcXVlc3RzIHRvIGFjY2VzcyB0aGUgcmVzZXJ2ZWQgbWVtb3J5IGFy
ZWEuDQo+PiAJCVNvIGJpb3MgdXNlcyB0aGUgZGV2aWNlIHNjb3BlIHR5cGUgQUNQSV9OQU1FU1BB
Q0VfREVWSUNFIGluIFJNUlIgdG8gcmVwb3J0IHRoZXNlIEFDUEkgZGV2aWNlcy4NCj4+IAkJQXQg
cHJlc2VudCwgdGhlcmUgaXMgbm8gYW5hbHlzaXMgaW4gdGhlIGtlcm5lbCB0aGF0IHRoZSBkZXZp
Y2Ugc2NvcGUgdHlwZSBpbiBSTVJSIGlzIEFDUElfTkFNRVNQQUNFX0RFVklDRS4NCj4+IAkJVGhp
cyBwYXRjaCBpcyBtYWlubHkgdG8gYWRkIHRoZSBhbmFseXNpcyBvZiB0aGUgZGV2aWNlIHNjb3Bl
IHR5cGUgQUNQSV9OQU1FU1BBQ0VfREVWSUNFIGluIFJNUlIgc3RydWN0dXJlIGFuZCBlc3RhYmxp
c2ggaWRlbnRpdHkgbWFwcGluZyBmb3IgPiB0aGVzZSBBQ1BJIGRldmljZXMuDQo+IA0KPiBTbyB0
aGUgcHJvYmxlbSBpcyAiYWx0aG91Z2ggbmFtZXNwYWNlIGRldmljZXMgaW4gUk1SUiBoYXZlIGJl
ZW4gcGFyc2VkLCBidXQgdGhlIGlkZW50aXR5IG1hcCBmb3IgdGhvc2UgZGV2aWNlcyBhcmVuJ3Qg
Y3JlYXRlZC4gQXMgdGhlIHJlc3VsdCwgdGhlIG5hbWVzcGFjZSBkZXZpY2VzIGZhaWwgdG8gYWNj
ZXNzIHRoZSBSTVJSIHJlZ2lvbi4iDQo+IA0KPiBEbyBJIHVuZGVyc3RhbmQgaXQgcmlnaHQ/DQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IGJhb2x1DQo+IA0KPj4gSW4gYWRkaXRpb24sIHNvbWUgbmFt
aW5nIGNoYW5nZXMgaGF2ZSBiZWVuIG1hZGUgaW4gcGF0Y2ggaW4gb3JkZXIgdG8gZGlzdGluZ3Vp
c2ggYWNwaSBkZXZpY2UgZnJvbSBwY2kgZGV2aWNlLg0KPj4gCQlZb3UgY2FuIHJlZmVyIHRvIHRo
ZSBkZXNjcmlwdGlvbiBvZiB0eXBlIGluIDguMy4xIGRldmljZSBzY29wZSBpbiB2dC1kIHNwZWMu
DQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBGZWxpeEN1aS1vYw0KPj4NCj4+DQo+Pg0KPj4gLS0t
LS3pgq7ku7bljp/ku7YtLS0tLQ0KPj4g5Y+R5Lu25Lq6OiBMdSBCYW9sdSA8YmFvbHUubHVAbGlu
dXguaW50ZWwuY29tPg0KPj4g5Y+R6YCB5pe26Ze0OiAyMDIw5bm0OOaciDPml6UgMTA6MzINCj4+
IOaUtuS7tuS6ujogRmVsaXhDdWktb2MgPEZlbGl4Q3VpLW9jQHpoYW94aW4uY29tPjsgSm9lcmcg
Um9lZGVsIA0KPj4gPGpvcm9AOGJ5dGVzLm9yZz47IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnOyANCj4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IERhdmlkIFdvb2Rob3Vz
ZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4NCj4+IOaKhOmAgTogYmFvbHUubHVAbGludXguaW50ZWwu
Y29tOyBDb2JlIENoZW4oQkotUkQpIA0KPj4gPENvYmVDaGVuQHpoYW94aW4uY29tPjsgUmF5bW9u
ZCBQYW5nKEJKLVJEKSA8UmF5bW9uZFBhbmdAemhhb3hpbi5jb20+DQo+PiDkuLvpopg6IFJlOiBb
UEFUQ0hdIGlvbW11L3Z0LWQ6QWRkIHN1cHBvcnQgZm9yIEFDUEkgZGV2aWNlIGluIFJNUlINCj4+
DQo+PiBIaSwNCj4+DQo+PiBPbiA4LzIvMjAgNjowNyBQTSwgRmVsaXhDdWlvYyB3cm90ZToNCj4+
PiBTb21lIEFDUEkgZGV2aWNlcyByZXF1aXJlIGFjY2VzcyB0byB0aGUgc3BlY2lmaWVkIHJlc2Vy
dmVkIG1lbW9yeSANCj4+PiByZWdpb24uQklPUyByZXBvcnQgdGhlIHNwZWNpZmllZCByZXNlcnZl
ZCBtZW1vcnkgcmVnaW9uIHRocm91Z2ggUk1SUiANCj4+PiBzdHJ1Y3R1cmVzLkFkZCBhbmFseXNp
cyBvZiBBQ1BJIGRldmljZSBpbiBSTVJSIGFuZCBlc3RhYmxpc2ggDQo+Pj4gaWRlbnRpdHkgbWFw
cGluZyBmb3IgQUNQSSBkZXZpY2UuDQo+Pg0KPj4gQ2FuIHlvdSBwbGVhc2UgYWRkIG1vcmUgd29y
ZHMgYWJvdXQgdGhlIHByb2JsZW0geW91IHdhbnQgdG8gc29sdmU/IERvIHlvdSBtZWFuIHNvbWUg
Uk1SUnMgYXJlIG5vdCBlbnVtZXJhdGVkIGNvcnJlY3RseT8gT3IsIGVudW1lcmF0ZWQsIGJ1dCBu
b3QgaWRlbnRpdHkgbWFwcGVkPw0KPj4NCj4+IE5pdDogYWRkIHZlcnNpb24gYW5kIGNoYW5nZSBs
b2cgb25jZSB5b3UgcmVmcmVzaGVkIHlvdXIgcGF0Y2guDQo+Pg0KPj4+DQo+Pj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4NCj4+IE5vIG5lZWQgdG8g
YWRkIHRoaXMuIFRoZSBwcm9ibGVtIHlvdSB3YW50IHRvIHNvbHZlIHRocm91Z2ggdGhpcyBwYXRj
aCBpcyBub3QgcmVwb3J0ZWQgYnkgbGtwLg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IGJhb2x1
DQo+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4Q3Vpb2MgPEZlbGl4Q3VpLW9jQHpoYW94aW4u
Y29tPg0KPj4+IC0tLQ0KPj4+ICAgICBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYyAgfCA3NCAr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICAgIGRyaXZlcnMvaW9t
bXUvaW50ZWwvaW9tbXUuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKystDQo+Pj4gICAgIGRy
aXZlcnMvaW9tbXUvaW9tbXUuYyAgICAgICB8ICA2ICsrKw0KPj4+ICAgICBpbmNsdWRlL2xpbnV4
L2RtYXIuaCAgICAgICAgfCAxMiArKysrKy0NCj4+PiAgICAgaW5jbHVkZS9saW51eC9pb21tdS5o
ICAgICAgIHwgIDMgKysNCj4+PiAgICAgNSBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygr
KSwgMzYgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9p
bnRlbC9kbWFyLmMgYi9kcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYyANCj4+PiBpbmRleCA5M2U2
MzQ1ZjM0MTQuLjAyNGNhMzhkYmExMiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lu
dGVsL2RtYXIuYw0KPj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jDQo+Pj4gQEAg
LTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgYm9vbCBkbWFyX21hdGNoX3BjaV9wYXRoKHN0cnVjdCBk
bWFyX3BjaV9ub3RpZnlfaW5mbyAqaW5mbywgaW50IGJ1cywNCj4+PiAgICAgfQ0KPj4+ICAgICAN
Cj4+PiAgICAgLyogUmV0dXJuOiA+IDAgaWYgbWF0Y2ggZm91bmQsIDAgaWYgbm8gbWF0Y2ggZm91
bmQsIDwgMCBpZiBlcnJvciANCj4+PiBoYXBwZW5zICovIC1pbnQgZG1hcl9pbnNlcnRfZGV2X3Nj
b3BlKHN0cnVjdCBkbWFyX3BjaV9ub3RpZnlfaW5mbyANCj4+PiAqaW5mbywNCj4+PiAraW50IGRt
YXJfcGNpX2luc2VydF9kZXZfc2NvcGUoc3RydWN0IGRtYXJfcGNpX25vdGlmeV9pbmZvICppbmZv
LA0KPj4+ICAgICAJCQkgIHZvaWQgKnN0YXJ0LCB2b2lkKmVuZCwgdTE2IHNlZ21lbnQsDQo+Pj4g
ICAgIAkJCSAgc3RydWN0IGRtYXJfZGV2X3Njb3BlICpkZXZpY2VzLA0KPj4+ICAgICAJCQkgIGlu
dCBkZXZpY2VzX2NudCkNCj4+PiBAQCAtMzA0LDcgKzMwNCw3IEBAIHN0YXRpYyBpbnQgZG1hcl9w
Y2lfYnVzX2FkZF9kZXYoc3RydWN0IA0KPj4+IGRtYXJfcGNpX25vdGlmeV9pbmZvICppbmZvKQ0K
Pj4+ICAgICANCj4+PiAgICAgCQlkcmhkID0gY29udGFpbmVyX29mKGRtYXJ1LT5oZHIsDQo+Pj4g
ICAgIAkJCQkgICAgc3RydWN0IGFjcGlfZG1hcl9oYXJkd2FyZV91bml0LCBoZWFkZXIpOw0KPj4+
IC0JCXJldCA9IGRtYXJfaW5zZXJ0X2Rldl9zY29wZShpbmZvLCAodm9pZCAqKShkcmhkICsgMSks
DQo+Pj4gKwkJcmV0ID0gZG1hcl9wY2lfaW5zZXJ0X2Rldl9zY29wZShpbmZvLCAodm9pZCAqKShk
cmhkICsgMSksDQo+Pj4gICAgIAkJCQkoKHZvaWQgKilkcmhkKSArIGRyaGQtPmhlYWRlci5sZW5n
dGgsDQo+Pj4gICAgIAkJCQlkbWFydS0+c2VnbWVudCwNCj4+PiAgICAgCQkJCWRtYXJ1LT5kZXZp
Y2VzLCBkbWFydS0+ZGV2aWNlc19jbnQpOyBAQCAtNjk2LDQ4ICs2OTYsNTYgQEAgDQo+Pj4gZG1h
cl9maW5kX21hdGNoZWRfZHJoZF91bml0KHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+Pj4gICAgIA0K
Pj4+ICAgICAJcmV0dXJuIGRtYXJ1Ow0KPj4+ICAgICB9DQo+Pj4gLQ0KPj4+IC1zdGF0aWMgdm9p
ZCBfX2luaXQgZG1hcl9hY3BpX2luc2VydF9kZXZfc2NvcGUodTggZGV2aWNlX251bWJlciwNCj4+
PiAtCQkJCQkgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYpDQo+Pj4gK2ludCBkbWFyX2Fj
cGlfaW5zZXJ0X2Rldl9zY29wZSh1OCBkZXZpY2VfbnVtYmVyLA0KPj4+ICsJCQkJc3RydWN0IGFj
cGlfZGV2aWNlICphZGV2LA0KPj4+ICsJCQkJdm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwNCj4+PiAr
CQkJCXN0cnVjdCBkbWFyX2Rldl9zY29wZSAqZGV2aWNlcywNCj4+PiArCQkJCWludCBkZXZpY2Vz
X2NudCkNCj4+PiAgICAgew0KPj4+IC0Jc3RydWN0IGRtYXJfZHJoZF91bml0ICpkbWFydTsNCj4+
PiAtCXN0cnVjdCBhY3BpX2RtYXJfaGFyZHdhcmVfdW5pdCAqZHJoZDsNCj4+PiAgICAgCXN0cnVj
dCBhY3BpX2RtYXJfZGV2aWNlX3Njb3BlICpzY29wZTsNCj4+PiAgICAgCXN0cnVjdCBkZXZpY2Ug
KnRtcDsNCj4+PiAgICAgCWludCBpOw0KPj4+ICAgICAJc3RydWN0IGFjcGlfZG1hcl9wY2lfcGF0
aCAqcGF0aDsNCj4+PiAgICAgDQo+Pj4gKwlmb3IgKDsgc3RhcnQgPCBlbmQ7IHN0YXJ0ICs9IHNj
b3BlLT5sZW5ndGgpIHsNCj4+PiArCQlzY29wZSA9IHN0YXJ0Ow0KPj4+ICsJCWlmIChzY29wZS0+
ZW50cnlfdHlwZSAhPSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9OQU1FU1BBQ0UpDQo+Pj4gKwkJCWNv
bnRpbnVlOw0KPj4+ICsJCWlmIChzY29wZS0+ZW51bWVyYXRpb25faWQgIT0gZGV2aWNlX251bWJl
cikNCj4+PiArCQkJY29udGludWU7DQo+Pj4gKwkJcGF0aCA9ICh2b2lkICopKHNjb3BlICsgMSk7
DQo+Pj4gKwkJZm9yX2VhY2hfZGV2X3Njb3BlKGRldmljZXMsIGRldmljZXNfY250LCBpLCB0bXAp
DQo+Pj4gKwkJCWlmICh0bXAgPT0gTlVMTCkgew0KPj4+ICsJCQkJZGV2aWNlc1tpXS5idXMgPSBz
Y29wZS0+YnVzOw0KPj4+ICsJCQkJZGV2aWNlc1tpXS5kZXZmbiA9IFBDSV9ERVZGTihwYXRoLT5k
ZXZpY2UsIHBhdGgtPmZ1bmN0aW9uKTsNCj4+PiArCQkJCXJjdV9hc3NpZ25fcG9pbnRlcihkZXZp
Y2VzW2ldLmRldiwNCj4+PiArCQkJCQkJICAgZ2V0X2RldmljZSgmYWRldi0+ZGV2KSk7DQo+Pj4g
KwkJCQlyZXR1cm4gMTsNCj4+PiArCQkJfQ0KPj4+ICsJCVdBUk5fT04oaSA+PSBkZXZpY2VzX2Nu
dCk7DQo+Pj4gKwl9DQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICtzdGF0aWMgaW50IGRt
YXJfYWNwaV9idXNfYWRkX2Rldih1OCBkZXZpY2VfbnVtYmVyLCBzdHJ1Y3QgDQo+Pj4gK2FjcGlf
ZGV2aWNlDQo+Pj4gKyphZGV2KSB7DQo+Pj4gKwlzdHJ1Y3QgZG1hcl9kcmhkX3VuaXQgKmRtYXJ1
Ow0KPj4+ICsJc3RydWN0IGFjcGlfZG1hcl9oYXJkd2FyZV91bml0ICpkcmhkOw0KPj4+ICsJaW50
IHJldCA9IDA7DQo+Pj4gKw0KPj4+ICAgICAJZm9yX2VhY2hfZHJoZF91bml0KGRtYXJ1KSB7DQo+
Pj4gICAgIAkJZHJoZCA9IGNvbnRhaW5lcl9vZihkbWFydS0+aGRyLA0KPj4+ICAgICAJCQkJICAg
IHN0cnVjdCBhY3BpX2RtYXJfaGFyZHdhcmVfdW5pdCwNCj4+PiAgICAgCQkJCSAgICBoZWFkZXIp
Ow0KPj4+ICsJCXJldCA9IGRtYXJfYWNwaV9pbnNlcnRfZGV2X3Njb3BlKGRldmljZV9udW1iZXIs
IGFkZXYsICh2b2lkICopKGRyaGQrMSksDQo+Pj4gKwkJCQkJCSgodm9pZCAqKWRyaGQpK2RyaGQt
PmhlYWRlci5sZW5ndGgsDQo+Pj4gKwkJCQkJCWRtYXJ1LT5kZXZpY2VzLCBkbWFydS0+ZGV2aWNl
c19jbnQpOw0KPj4+ICsJCWlmIChyZXQpDQo+Pj4gKwkJCWJyZWFrOw0KPj4+ICsJfQ0KPj4+ICsJ
cmV0ID0gZG1hcl9ybXJyX2FkZF9hY3BpX2RldihkZXZpY2VfbnVtYmVyLCBhZGV2KTsNCj4+PiAg
ICAgDQo+Pj4gLQkJZm9yIChzY29wZSA9ICh2b2lkICopKGRyaGQgKyAxKTsNCj4+PiAtCQkgICAg
ICh1bnNpZ25lZCBsb25nKXNjb3BlIDwgKCh1bnNpZ25lZCBsb25nKWRyaGQpICsgZHJoZC0+aGVh
ZGVyLmxlbmd0aDsNCj4+PiAtCQkgICAgIHNjb3BlID0gKCh2b2lkICopc2NvcGUpICsgc2NvcGUt
Pmxlbmd0aCkgew0KPj4+IC0JCQlpZiAoc2NvcGUtPmVudHJ5X3R5cGUgIT0gQUNQSV9ETUFSX1ND
T1BFX1RZUEVfTkFNRVNQQUNFKQ0KPj4+IC0JCQkJY29udGludWU7DQo+Pj4gLQkJCWlmIChzY29w
ZS0+ZW51bWVyYXRpb25faWQgIT0gZGV2aWNlX251bWJlcikNCj4+PiAtCQkJCWNvbnRpbnVlOw0K
Pj4+ICsJcmV0dXJuIHJldDsNCj4+PiAgICAgDQo+Pj4gLQkJCXBhdGggPSAodm9pZCAqKShzY29w
ZSArIDEpOw0KPj4+IC0JCQlwcl9pbmZvKCJBQ1BJIGRldmljZSBcIiVzXCIgdW5kZXIgRE1BUiBh
dCAlbGx4IGFzICUwMng6JTAyeC4lZFxuIiwNCj4+PiAtCQkJCWRldl9uYW1lKCZhZGV2LT5kZXYp
LCBkbWFydS0+cmVnX2Jhc2VfYWRkciwNCj4+PiAtCQkJCXNjb3BlLT5idXMsIHBhdGgtPmRldmlj
ZSwgcGF0aC0+ZnVuY3Rpb24pOw0KPj4+IC0JCQlmb3JfZWFjaF9kZXZfc2NvcGUoZG1hcnUtPmRl
dmljZXMsIGRtYXJ1LT5kZXZpY2VzX2NudCwgaSwgdG1wKQ0KPj4+IC0JCQkJaWYgKHRtcCA9PSBO
VUxMKSB7DQo+Pj4gLQkJCQkJZG1hcnUtPmRldmljZXNbaV0uYnVzID0gc2NvcGUtPmJ1czsNCj4+
PiAtCQkJCQlkbWFydS0+ZGV2aWNlc1tpXS5kZXZmbiA9IFBDSV9ERVZGTihwYXRoLT5kZXZpY2Us
DQo+Pj4gLQkJCQkJCQkJCSAgICBwYXRoLT5mdW5jdGlvbik7DQo+Pj4gLQkJCQkJcmN1X2Fzc2ln
bl9wb2ludGVyKGRtYXJ1LT5kZXZpY2VzW2ldLmRldiwNCj4+PiAtCQkJCQkJCSAgIGdldF9kZXZp
Y2UoJmFkZXYtPmRldikpOw0KPj4+IC0JCQkJCXJldHVybjsNCj4+PiAtCQkJCX0NCj4+PiAtCQkJ
QlVHX09OKGkgPj0gZG1hcnUtPmRldmljZXNfY250KTsNCj4+PiAtCQl9DQo+Pj4gLQl9DQo+Pj4g
LQlwcl93YXJuKCJObyBJT01NVSBzY29wZSBmb3VuZCBmb3IgQU5ERCBlbnVtZXJhdGlvbiBJRCAl
ZCAoJXMpXG4iLA0KPj4+IC0JCWRldmljZV9udW1iZXIsIGRldl9uYW1lKCZhZGV2LT5kZXYpKTsN
Cj4+PiAgICAgfQ0KPj4+ICAgICANCj4+PiAgICAgc3RhdGljIGludCBfX2luaXQgZG1hcl9hY3Bp
X2Rldl9zY29wZV9pbml0KHZvaWQpIEBAIC03NjYsNw0KPj4+ICs3NzQsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBkbWFyX2FjcGlfZGV2X3Njb3BlX2luaXQodm9pZCkNCj4+PiAgICAgCQkJCSAgICAg
ICBhbmRkLT5kZXZpY2VfbmFtZSk7DQo+Pj4gICAgIAkJCQljb250aW51ZTsNCj4+PiAgICAgCQkJ
fQ0KPj4+IC0JCQlkbWFyX2FjcGlfaW5zZXJ0X2Rldl9zY29wZShhbmRkLT5kZXZpY2VfbnVtYmVy
LCBhZGV2KTsNCj4+PiArCQkJZG1hcl9hY3BpX2J1c19hZGRfZGV2KGFuZGQtPmRldmljZV9udW1i
ZXIsIGFkZXYpOw0KPj4+ICAgICAJCX0NCj4+PiAgICAgCX0NCj4+PiAgICAgCXJldHVybiAwOw0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMgDQo+Pj4gYi9kcml2
ZXJzL2lvbW11L2ludGVsL2lvbW11LmMgaW5kZXggY2E1NTdkMzUxNTE4Li5iZTE3OTM0MTUzMjYN
Cj4+PiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMNCj4+PiAr
KysgYi9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMNCj4+PiBAQCAtNDUwNyw2ICs0NTA3LDI0
IEBAIGludCBkbWFyX2ZpbmRfbWF0Y2hlZF9hdHNyX3VuaXQoc3RydWN0DQo+Pj4gcGNpX2Rldg0K
Pj4+ICpkZXYpDQo+Pj4gICAgIA0KPj4+ICAgICAJcmV0dXJuIHJldDsNCj4+PiAgICAgfQ0KPj4+
ICtpbnQgZG1hcl9ybXJyX2FkZF9hY3BpX2Rldih1OCBkZXZpY2VfbnVtYmVyLCBzdHJ1Y3QgYWNw
aV9kZXZpY2UNCj4+PiArKmFkZXYpIHsNCj4+PiArCWludCByZXQ7DQo+Pj4gKwlzdHJ1Y3QgZG1h
cl9ybXJyX3VuaXQgKnJtcnJ1Ow0KPj4+ICsJc3RydWN0IGFjcGlfZG1hcl9yZXNlcnZlZF9tZW1v
cnkgKnJtcnI7DQo+Pj4gKw0KPj4+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShybXJydSwgJmRtYXJf
cm1ycl91bml0cywgbGlzdCkgew0KPj4+ICsJCXJtcnIgPSBjb250YWluZXJfb2Yocm1ycnUtPmhk
ciwNCj4+PiArCQkJCXN0cnVjdCBhY3BpX2RtYXJfcmVzZXJ2ZWRfbWVtb3J5LA0KPj4+ICsJCQkJ
aGVhZGVyKTsNCj4+PiArCQlyZXQgPSBkbWFyX2FjcGlfaW5zZXJ0X2Rldl9zY29wZShkZXZpY2Vf
bnVtYmVyLCBhZGV2LCAodm9pZCAqKShybXJyICsgMSksDQo+Pj4gKwkJCQkJCSgodm9pZCAqKXJt
cnIpICsgcm1yci0+aGVhZGVyLmxlbmd0aCwNCj4+PiArCQkJCQkJcm1ycnUtPmRldmljZXMsIHJt
cnJ1LT5kZXZpY2VzX2NudCk7DQo+Pj4gKwkJaWYgKHJldCkNCj4+PiArCQkJYnJlYWs7DQo+Pj4g
Kwl9DQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICAgICANCj4+PiAgICAgaW50IGRtYXJf
aW9tbXVfbm90aWZ5X3Njb3BlX2RldihzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8p
DQo+Pj4gICAgIHsNCj4+PiBAQCAtNDUyMyw3ICs0NTQxLDcgQEAgaW50IGRtYXJfaW9tbXVfbm90
aWZ5X3Njb3BlX2RldihzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8pDQo+Pj4gICAg
IAkJcm1yciA9IGNvbnRhaW5lcl9vZihybXJydS0+aGRyLA0KPj4+ICAgICAJCQkJICAgIHN0cnVj
dCBhY3BpX2RtYXJfcmVzZXJ2ZWRfbWVtb3J5LCBoZWFkZXIpOw0KPj4+ICAgICAJCWlmIChpbmZv
LT5ldmVudCA9PSBCVVNfTk9USUZZX0FERF9ERVZJQ0UpIHsNCj4+PiAtCQkJcmV0ID0gZG1hcl9p
bnNlcnRfZGV2X3Njb3BlKGluZm8sICh2b2lkICopKHJtcnIgKyAxKSwNCj4+PiArCQkJcmV0ID0g
ZG1hcl9wY2lfaW5zZXJ0X2Rldl9zY29wZShpbmZvLCAodm9pZCAqKShybXJyICsgMSksDQo+Pj4g
ICAgIAkJCQkoKHZvaWQgKilybXJyKSArIHJtcnItPmhlYWRlci5sZW5ndGgsDQo+Pj4gICAgIAkJ
CQlybXJyLT5zZWdtZW50LCBybXJydS0+ZGV2aWNlcywNCj4+PiAgICAgCQkJCXJtcnJ1LT5kZXZp
Y2VzX2NudCk7DQo+Pj4gQEAgLTQ1NDEsNyArNDU1OSw3IEBAIGludCBkbWFyX2lvbW11X25vdGlm
eV9zY29wZV9kZXYoc3RydWN0DQo+Pj4gZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8pDQo+Pj4g
ICAgIA0KPj4+ICAgICAJCWF0c3IgPSBjb250YWluZXJfb2YoYXRzcnUtPmhkciwgc3RydWN0IGFj
cGlfZG1hcl9hdHNyLCBoZWFkZXIpOw0KPj4+ICAgICAJCWlmIChpbmZvLT5ldmVudCA9PSBCVVNf
Tk9USUZZX0FERF9ERVZJQ0UpIHsNCj4+PiAtCQkJcmV0ID0gZG1hcl9pbnNlcnRfZGV2X3Njb3Bl
KGluZm8sICh2b2lkICopKGF0c3IgKyAxKSwNCj4+PiArCQkJcmV0ID0gZG1hcl9wY2lfaW5zZXJ0
X2Rldl9zY29wZShpbmZvLCAodm9pZCAqKShhdHNyICsgMSksDQo+Pj4gICAgIAkJCQkJKHZvaWQg
KilhdHNyICsgYXRzci0+aGVhZGVyLmxlbmd0aCwNCj4+PiAgICAgCQkJCQlhdHNyLT5zZWdtZW50
LCBhdHNydS0+ZGV2aWNlcywNCj4+PiAgICAgCQkJCQlhdHNydS0+ZGV2aWNlc19jbnQpOw0KPj4+
IEBAIC00Nzc5LDYgKzQ3OTcsMjYgQEAgc3RhdGljIGludCBfX2luaXQNCj4+PiBwbGF0Zm9ybV9v
cHRpbl9mb3JjZV9pb21tdSh2b2lkKQ0KPj4+ICAgICANCj4+PiAgICAgCXJldHVybiAxOw0KPj4+
ICAgICB9DQo+Pj4gK3N0YXRpYyBpbnQgYWNwaV9kZXZpY2VfY3JlYXRlX2RpcmVjdF9tYXBwaW5n
cyhzdHJ1Y3QgZGV2aWNlIA0KPj4+ICsqcG5fZGV2LCBzdHJ1Y3QgZGV2aWNlICphY3BpX2Rldmlj
ZSkgew0KPj4+ICsJaW50IHJldDsNCj4+PiArCXN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXA7DQo+
Pj4gKw0KPj4+ICsJaWYgKHBuX2RldiA9PSBOVUxMKSB7DQo+Pj4gKwkJYWNwaV9kZXZpY2UtPmJ1
cy0+aW9tbXVfb3BzID0gJmludGVsX2lvbW11X29wczsNCj4+PiArCQlyZXQgPSBpb21tdV9wcm9i
ZV9kZXZpY2UoYWNwaV9kZXZpY2UpOw0KPj4+ICsJCWlmIChyZXQpIHsNCj4+PiArCQkJcHJfZXJy
KCJhY3BpX2RldmljZSBwcm9iZSBmYWlsISByZXQ6JWRcbiIsIHJldCk7DQo+Pj4gKwkJCXJldHVy
biByZXQ7DQo+Pj4gKwkJfQ0KPj4+ICsJCXJldHVybiAwOw0KPj4+ICsJfQ0KPj4+ICsJYWNwaV9k
ZXZpY2UtPmJ1cy0+aW9tbXVfb3BzID0gJmludGVsX2lvbW11X29wczsNCj4+PiArCWdyb3VwID0g
aW9tbXVfZ3JvdXBfZ2V0KHBuX2Rldik7DQo+Pj4gKwlfX2FjcGlfZGV2aWNlX2NyZWF0ZV9kaXJl
Y3RfbWFwcGluZ3MoZ3JvdXAsIGFjcGlfZGV2aWNlKTsNCj4+PiArDQo+Pj4gKwlyZXR1cm4gMDsN
Cj4+PiArfQ0KPj4+ICAgICANCj4+PiAgICAgc3RhdGljIGludCBfX2luaXQgcHJvYmVfYWNwaV9u
YW1lc3BhY2VfZGV2aWNlcyh2b2lkKQ0KPj4+ICAgICB7DQo+Pj4gQEAgLTQ3OTQsNiArNDgzMiw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IHByb2JlX2FjcGlfbmFtZXNwYWNlX2RldmljZXModm9pZCkN
Cj4+PiAgICAgCQkJc3RydWN0IGFjcGlfZGV2aWNlX3BoeXNpY2FsX25vZGUgKnBuOw0KPj4+ICAg
ICAJCQlzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwOw0KPj4+ICAgICAJCQlzdHJ1Y3QgYWNwaV9k
ZXZpY2UgKmFkZXY7DQo+Pj4gKwkJCXN0cnVjdCBkZXZpY2UgKnBuX2RldiA9IE5VTEw7DQo+Pj4g
ICAgIA0KPj4+ICAgICAJCQlpZiAoZGV2LT5idXMgIT0gJmFjcGlfYnVzX3R5cGUpDQo+Pj4gICAg
IAkJCQljb250aW51ZTsNCj4+PiBAQCAtNDgwNCw2ICs0ODQzLDcgQEAgc3RhdGljIGludCBfX2lu
aXQgcHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNlcyh2b2lkKQ0KPj4+ICAgICAJCQkJCSAgICAm
YWRldi0+cGh5c2ljYWxfbm9kZV9saXN0LCBub2RlKSB7DQo+Pj4gICAgIAkJCQlncm91cCA9IGlv
bW11X2dyb3VwX2dldChwbi0+ZGV2KTsNCj4+PiAgICAgCQkJCWlmIChncm91cCkgew0KPj4+ICsJ
CQkJCXBuX2RldiA9IHBuLT5kZXY7DQo+Pj4gICAgIAkJCQkJaW9tbXVfZ3JvdXBfcHV0KGdyb3Vw
KTsNCj4+PiAgICAgCQkJCQljb250aW51ZTsNCj4+PiAgICAgCQkJCX0NCj4+PiBAQCAtNDgxMiw3
ICs0ODUyLDkgQEAgc3RhdGljIGludCBfX2luaXQgcHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNl
cyh2b2lkKQ0KPj4+ICAgICAJCQkJcmV0ID0gaW9tbXVfcHJvYmVfZGV2aWNlKHBuLT5kZXYpOw0K
Pj4+ICAgICAJCQkJaWYgKHJldCkNCj4+PiAgICAgCQkJCQlicmVhazsNCj4+PiArCQkJCXBuX2Rl
diA9IHBuLT5kZXY7DQo+Pj4gICAgIAkJCX0NCj4+PiArCQkJcmV0ID0gYWNwaV9kZXZpY2VfY3Jl
YXRlX2RpcmVjdF9tYXBwaW5ncyhwbl9kZXYsIGRldik7DQo+Pj4gICAgIAkJCW11dGV4X3VubG9j
aygmYWRldi0+cGh5c2ljYWxfbm9kZV9sb2NrKTsNCj4+PiAgICAgDQo+Pj4gICAgIAkJCWlmIChy
ZXQpDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYyBiL2RyaXZlcnMvaW9t
bXUvaW9tbXUuYyBpbmRleA0KPj4+IDYwOWJkMjViZjE1NC4uNGY3MTRhMmQ1ZWY3IDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYw0KPj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
aW9tbXUuYw0KPj4+IEBAIC03NzksNiArNzc5LDEyIEBAIHN0YXRpYyBib29sIGlvbW11X2lzX2F0
dGFjaF9kZWZlcnJlZChzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sDQo+Pj4gICAgIAlyZXR1
cm4gZmFsc2U7DQo+Pj4gICAgIH0NCj4+PiAgICAgDQo+Pj4gK3ZvaWQgIF9fYWNwaV9kZXZpY2Vf
Y3JlYXRlX2RpcmVjdF9tYXBwaW5ncyhzdHJ1Y3QgaW9tbXVfZ3JvdXAgDQo+Pj4gKypncm91cCwg
c3RydWN0IGRldmljZSAqYWNwaV9kZXZpY2UpIHsNCj4+PiArCWlvbW11X2NyZWF0ZV9kZXZpY2Vf
ZGlyZWN0X21hcHBpbmdzKGdyb3VwLCBhY3BpX2RldmljZSk7IH0gDQo+Pj4gK0VYUE9SVF9TWU1C
T0xfR1BMKF9fYWNwaV9kZXZpY2VfY3JlYXRlX2RpcmVjdF9tYXBwaW5ncyk7DQo+Pj4gKw0KPj4+
ICAgICAvKioNCj4+PiAgICAgICogaW9tbXVfZ3JvdXBfYWRkX2RldmljZSAtIGFkZCBhIGRldmlj
ZSB0byBhbiBpb21tdSBncm91cA0KPj4+ICAgICAgKiBAZ3JvdXA6IHRoZSBncm91cCBpbnRvIHdo
aWNoIHRvIGFkZCB0aGUgZGV2aWNlIChyZWZlcmVuY2UgDQo+Pj4gc2hvdWxkIGJlIGhlbGQpIGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYXIuaCANCj4+PiBiL2luY2x1ZGUvbGludXgvZG1h
ci5oIGluZGV4IDY1NTY1ODIwMzI4YS4uODgxYWM2MWE0MzM2IDEwMDY0NA0KPj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZG1hci5oDQo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWFyLmgNCj4+PiBA
QCAtMTEzLDEwICsxMTMsMTQgQEAgZXh0ZXJuIGludCBkbWFyX3BhcnNlX2Rldl9zY29wZSh2b2lk
ICpzdGFydCwgdm9pZCAqZW5kLCBpbnQgKmNudCwNCj4+PiAgICAgCQkJCXN0cnVjdCBkbWFyX2Rl
dl9zY29wZSAqKmRldmljZXMsIHUxNiBzZWdtZW50KTsNCj4+PiAgICAgZXh0ZXJuIHZvaWQgKmRt
YXJfYWxsb2NfZGV2X3Njb3BlKHZvaWQgKnN0YXJ0LCB2b2lkICplbmQsIGludCAqY250KTsNCj4+
PiAgICAgZXh0ZXJuIHZvaWQgZG1hcl9mcmVlX2Rldl9zY29wZShzdHJ1Y3QgZG1hcl9kZXZfc2Nv
cGUgKipkZXZpY2VzLCANCj4+PiBpbnQgKmNudCk7IC1leHRlcm4gaW50IGRtYXJfaW5zZXJ0X2Rl
dl9zY29wZShzdHJ1Y3QgDQo+Pj4gZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8sDQo+Pj4gK2V4
dGVybiBpbnQgZG1hcl9wY2lfaW5zZXJ0X2Rldl9zY29wZShzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5
X2luZm8gDQo+Pj4gKyppbmZvLA0KPj4+ICAgICAJCQkJIHZvaWQgKnN0YXJ0LCB2b2lkKmVuZCwg
dTE2IHNlZ21lbnQsDQo+Pj4gICAgIAkJCQkgc3RydWN0IGRtYXJfZGV2X3Njb3BlICpkZXZpY2Vz
LA0KPj4+ICAgICAJCQkJIGludCBkZXZpY2VzX2NudCk7DQo+Pj4gK2V4dGVybiBpbnQgZG1hcl9h
Y3BpX2luc2VydF9kZXZfc2NvcGUodTggZGV2aWNlX251bWJlciwNCj4+PiArCQkJCXN0cnVjdCBh
Y3BpX2RldmljZSAqYWRldiwgdm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwNCj4+PiArCQkJCXN0cnVj
dCBkbWFyX2Rldl9zY29wZSAqZGV2aWNlcywgaW50IGRldmljZXNfY250KTsNCj4+PiArDQo+Pj4g
ICAgIGV4dGVybiBpbnQgZG1hcl9yZW1vdmVfZGV2X3Njb3BlKHN0cnVjdCBkbWFyX3BjaV9ub3Rp
ZnlfaW5mbyAqaW5mbywNCj4+PiAgICAgCQkJCSB1MTYgc2VnbWVudCwgc3RydWN0IGRtYXJfZGV2
X3Njb3BlICpkZXZpY2VzLA0KPj4+ICAgICAJCQkJIGludCBjb3VudCk7DQo+Pj4gQEAgLTE0MCw2
ICsxNDQsNyBAQCBleHRlcm4gaW50IGRtYXJfcGFyc2Vfb25lX2F0c3Ioc3RydWN0IGFjcGlfZG1h
cl9oZWFkZXIgKmhlYWRlciwgdm9pZCAqYXJnKTsNCj4+PiAgICAgZXh0ZXJuIGludCBkbWFyX2No
ZWNrX29uZV9hdHNyKHN0cnVjdCBhY3BpX2RtYXJfaGVhZGVyICpoZHIsIHZvaWQgKmFyZyk7DQo+
Pj4gICAgIGV4dGVybiBpbnQgZG1hcl9yZWxlYXNlX29uZV9hdHNyKHN0cnVjdCBhY3BpX2RtYXJf
aGVhZGVyICpoZHIsIHZvaWQgKmFyZyk7DQo+Pj4gICAgIGV4dGVybiBpbnQgZG1hcl9pb21tdV9o
b3RwbHVnKHN0cnVjdCBkbWFyX2RyaGRfdW5pdCAqZG1hcnUsIGJvb2wgDQo+Pj4gaW5zZXJ0KTsN
Cj4+PiArZXh0ZXJuIGludCBkbWFyX3JtcnJfYWRkX2FjcGlfZGV2KHU4IGRldmljZV9udW1iZXIs
IHN0cnVjdCANCj4+PiArYWNwaV9kZXZpY2UgKmFkZXYpOw0KPj4+ICAgICBleHRlcm4gaW50IGRt
YXJfaW9tbXVfbm90aWZ5X3Njb3BlX2RldihzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmlu
Zm8pOw0KPj4+ICAgICAjZWxzZSAvKiAhQ09ORklHX0lOVEVMX0lPTU1VOiAqLw0KPj4+ICAgICBz
dGF0aWMgaW5saW5lIGludCBpbnRlbF9pb21tdV9pbml0KHZvaWQpIHsgcmV0dXJuIC1FTk9ERVY7
IH0gQEANCj4+PiAtMTUwLDYgKzE1NSwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZWxfaW9t
bXVfc2h1dGRvd24odm9pZCkgeyB9DQo+Pj4gICAgICNkZWZpbmUJZG1hcl9jaGVja19vbmVfYXRz
cgkJZG1hcl9yZXNfbm9vcA0KPj4+ICAgICAjZGVmaW5lCWRtYXJfcmVsZWFzZV9vbmVfYXRzcgkJ
ZG1hcl9yZXNfbm9vcA0KPj4+ICAgICANCj4+PiArc3RhdGljIGlubGluZSBpbnQgZG1hcl9ybXJy
X2FkZF9hY3BpX2Rldih1OCBkZXZpY2VfbnVtYmVyLCBzdHJ1Y3QgDQo+Pj4gK2FjcGlfZGV2aWNl
ICphZGV2KSB7DQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICsNCj4+PiAgICAgc3RhdGlj
IGlubGluZSBpbnQgZG1hcl9pb21tdV9ub3RpZnlfc2NvcGVfZGV2KHN0cnVjdCBkbWFyX3BjaV9u
b3RpZnlfaW5mbyAqaW5mbykNCj4+PiAgICAgew0KPj4+ICAgICAJcmV0dXJuIDA7DQo+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW9tbXUuaCBiL2luY2x1ZGUvbGludXgvaW9tbXUuaCBp
bmRleA0KPj4+IGZlZTIwOWVmYjc1Ni4uOWJlMTM0Nzc1ODg2IDEwMDY0NA0KPj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvaW9tbXUuaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaW9tbXUuaA0KPj4+
IEBAIC01MTQsNiArNTE0LDkgQEAgZXh0ZXJuIHZvaWQgaW9tbXVfZG9tYWluX3dpbmRvd19kaXNh
YmxlKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgdTMyIHduZF9ucikNCj4+PiAgICAgZXh0
ZXJuIGludCByZXBvcnRfaW9tbXVfZmF1bHQoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+Pj4gICAgIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaW92YSwg
aW50IGZsYWdzKTsNCj4+PiAgICAgDQo+Pj4gK2V4dGVybiB2b2lkIF9fYWNwaV9kZXZpY2VfY3Jl
YXRlX2RpcmVjdF9tYXBwaW5ncyhzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwLA0KPj4+ICsJCQkJ
CQlzdHJ1Y3QgZGV2aWNlICphY3BpX2RldmljZSk7DQo+Pj4gKw0KPj4+ICAgICBzdGF0aWMgaW5s
aW5lIHZvaWQgaW9tbXVfZmx1c2hfdGxiX2FsbChzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4p
DQo+Pj4gICAgIHsNCj4+PiAgICAgCWlmIChkb21haW4tPm9wcy0+Zmx1c2hfaW90bGJfYWxsKQ0K
Pj4+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21t
dSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
