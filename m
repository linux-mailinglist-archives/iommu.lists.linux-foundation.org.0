Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F01C82EF
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 08:59:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88B2388B6D;
	Thu,  7 May 2020 06:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z7TBVfSNm3r; Thu,  7 May 2020 06:59:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9446688B38;
	Thu,  7 May 2020 06:59:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86BCDC07FF;
	Thu,  7 May 2020 06:59:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 826EAC07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6BA4686216
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6W9Lft2zz7cE for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 06:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DF9D286126
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:59:35 +0000 (UTC)
Received: from lhreml715-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 3EF2735A948518C8025E;
 Thu,  7 May 2020 07:59:33 +0100 (IST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml715-chm.china.huawei.com (10.201.108.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 7 May 2020 07:59:32 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1913.007; Thu, 7 May 2020 07:59:32 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "will@kernel.org" <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "maz@kernel.org" <maz@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>
Subject: RE: [PATCH v11 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
Thread-Topic: [PATCH v11 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
Thread-Index: AQHWEm6UKSWHwUIWVEisrcDF38xxfKh7GISAgAA31ACAFixYIIAK1E8A
Date: Thu, 7 May 2020 06:59:32 +0000
Message-ID: <c7786a2a314e4c4ab37ef157ddfa23af@huawei.com>
References: <20200414150607.28488-1-eric.auger@redhat.com>
 <eb27f625-ad7a-fcb5-2185-5471e4666f09@linaro.org>
 <06fe02f7-2556-8986-2f1e-dcdf59773b8c@redhat.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.81.249]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "bbhushan2@marvell.com" <bbhushan2@marvell.com>
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

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFtZWVy
YWxpIEtvbG90aHVtIFRob2RpDQo+IFNlbnQ6IDMwIEFwcmlsIDIwMjAgMTA6MzgNCj4gVG86ICdB
dWdlciBFcmljJyA8ZXJpYy5hdWdlckByZWRoYXQuY29tPjsgWmhhbmdmZWkgR2FvDQo+IDx6aGFu
Z2ZlaS5nYW9AbGluYXJvLm9yZz47IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNvbTsNCj4gaW9tbXVA
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGt2bWFybUBsaXN0cy5jcy5jb2x1bWJpYS5lZHU7IHdp
bGxAa2VybmVsLm9yZzsNCj4gam9yb0A4Ynl0ZXMub3JnOyBtYXpAa2VybmVsLm9yZzsgcm9iaW4u
bXVycGh5QGFybS5jb20NCj4gQ2M6IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgYWxleC53aWxs
aWFtc29uQHJlZGhhdC5jb207DQo+IGphY29iLmp1bi5wYW5AbGludXguaW50ZWwuY29tOyB5aS5s
LmxpdUBpbnRlbC5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gdG5Ac2VtaWhhbGYu
Y29tOyBiYmh1c2hhbjJAbWFydmVsbC5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MTEgMDAv
MTNdIFNNTVV2MyBOZXN0ZWQgU3RhZ2UgU2V0dXAgKElPTU1VIHBhcnQpDQo+IA0KPiBIaSBFcmlj
LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEF1Z2VyIEVy
aWMgW21haWx0bzplcmljLmF1Z2VyQHJlZGhhdC5jb21dDQo+ID4gU2VudDogMTYgQXByaWwgMjAy
MCAwODo0NQ0KPiA+IFRvOiBaaGFuZ2ZlaSBHYW8gPHpoYW5nZmVpLmdhb0BsaW5hcm8ub3JnPjsg
ZXJpYy5hdWdlci5wcm9AZ21haWwuY29tOw0KPiA+IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+IGt2bUB2Z2VyLmtlcm5l
bC5vcmc7IGt2bWFybUBsaXN0cy5jcy5jb2x1bWJpYS5lZHU7IHdpbGxAa2VybmVsLm9yZzsNCj4g
PiBqb3JvQDhieXRlcy5vcmc7IG1hekBrZXJuZWwub3JnOyByb2Jpbi5tdXJwaHlAYXJtLmNvbQ0K
PiA+IENjOiBqZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc7IFNoYW1lZXJhbGkgS29sb3RodW0gVGhv
ZGkNCj4gPiA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPjsgYWxleC53aWxs
aWFtc29uQHJlZGhhdC5jb207DQo+ID4gamFjb2IuanVuLnBhbkBsaW51eC5pbnRlbC5jb207IHlp
LmwubGl1QGludGVsLmNvbTsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOw0KPiA+IHRuQHNlbWlo
YWxmLmNvbTsgYmJodXNoYW4yQG1hcnZlbGwuY29tDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTEgMDAvMTNdIFNNTVV2MyBOZXN0ZWQgU3RhZ2UgU2V0dXAgKElPTU1VIHBhcnQpDQo+ID4NCj4g
PiBIaSBaaGFuZ2ZlaSwNCj4gPg0KPiA+IE9uIDQvMTYvMjAgNjoyNSBBTSwgWmhhbmdmZWkgR2Fv
IHdyb3RlOg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPbiAyMDIwLzQvMTQg5LiL5Y2IMTE6MDUsIEVy
aWMgQXVnZXIgd3JvdGU6DQo+ID4gPj4gVGhpcyB2ZXJzaW9uIGZpeGVzIGFuIGlzc3VlIG9ic2Vy
dmVkIGJ5IFNoYW1lZXIgb24gYW4gU01NVSAzLjIsDQo+ID4gPj4gd2hlbiBtb3ZpbmcgZnJvbSBk
dWFsIHN0YWdlIGNvbmZpZyB0byBzdGFnZSAxIG9ubHkgY29uZmlnLg0KPiA+ID4+IFRoZSAyIGhp
Z2ggNjRiIG9mIHRoZSBTVEUgbm93IGdldCByZXNldC4gT3RoZXJ3aXNlLCBsZWF2aW5nIHRoZQ0K
PiA+ID4+IFMyVFRCIHNldCBtYXkgY2F1c2UgYSBDX0JBRF9TVEUgZXJyb3IuDQo+ID4gPj4NCj4g
PiA+PiBUaGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6DQo+ID4gPj4gaHR0cHM6Ly9naXRodWIu
Y29tL2VhdWdlci9saW51eC90cmVlL3Y1LjYtMnN0YWdlLXYxMV8xMC4xDQo+ID4gPj4gKGluY2x1
ZGluZyB0aGUgVkZJTyBwYXJ0KQ0KPiA+ID4+IFRoZSBRRU1VIGZlbGxvdyBzZXJpZXMgc3RpbGwg
Y2FuIGJlIGZvdW5kIGF0Og0KPiA+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lYXVnZXIvcWVtdS90
cmVlL3Y0LjIuMC0yc3RhZ2UtcmZjdjYNCj4gPiA+Pg0KPiA+ID4+IFVzZXJzIGhhdmUgZXhwcmVz
c2VkIGludGVyZXN0IGluIHRoYXQgd29yayBhbmQgdGVzdGVkIHY5L3YxMDoNCj4gPiA+PiAtIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTEwMzk5OTUvIzIzMDEyMzgxDQo+ID4g
Pj4gLSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMDM5OTk1LyMyMzE5NzIz
NQ0KPiA+ID4+DQo+ID4gPj4gQmFja2dyb3VuZDoNCj4gPiA+Pg0KPiA+ID4+IFRoaXMgc2VyaWVz
IGJyaW5ncyB0aGUgSU9NTVUgcGFydCBvZiBIVyBuZXN0ZWQgcGFnaW5nIHN1cHBvcnQNCj4gPiA+
PiBpbiB0aGUgU01NVXYzLiBUaGUgVkZJTyBwYXJ0IGlzIHN1Ym1pdHRlZCBzZXBhcmF0ZWx5Lg0K
PiA+ID4+DQo+ID4gPj4gVGhlIElPTU1VIEFQSSBpcyBleHRlbmRlZCB0byBzdXBwb3J0IDIgbmV3
IEFQSSBmdW5jdGlvbmFsaXRpZXM6DQo+ID4gPj4gMSkgcGFzcyB0aGUgZ3Vlc3Qgc3RhZ2UgMSBj
b25maWd1cmF0aW9uDQo+ID4gPj4gMikgcGFzcyBzdGFnZSAxIE1TSSBiaW5kaW5ncw0KPiA+ID4+
DQo+ID4gPj4gVGhlbiB0aG9zZSBjYXBhYmlsaXRpZXMgZ2V0cyBpbXBsZW1lbnRlZCBpbiB0aGUg
U01NVXYzIGRyaXZlci4NCj4gPiA+Pg0KPiA+ID4+IFRoZSB2aXJ0dWFsaXplciBwYXNzZXMgaW5m
b3JtYXRpb24gdGhyb3VnaCB0aGUgVkZJTyB1c2VyIEFQSQ0KPiA+ID4+IHdoaWNoIGNhc2NhZGVz
IHRoZW0gdG8gdGhlIGlvbW11IHN1YnN5c3RlbS4gVGhpcyBhbGxvd3MgdGhlIGd1ZXN0DQo+ID4g
Pj4gdG8gb3duIHN0YWdlIDEgdGFibGVzIGFuZCBjb250ZXh0IGRlc2NyaXB0b3JzIChzby1jYWxs
ZWQgUEFTSUQNCj4gPiA+PiB0YWJsZSkgd2hpbGUgdGhlIGhvc3Qgb3ducyBzdGFnZSAyIHRhYmxl
cyBhbmQgbWFpbiBjb25maWd1cmF0aW9uDQo+ID4gPj4gc3RydWN0dXJlcyAoU1RFKS4NCj4gPiA+
Pg0KPiA+ID4+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIEVyaWMNCj4gPiA+DQo+ID4gPiBUZXN0ZWQg
djExIG9uIEhpc2lsaWNvbiBrdW5wZW5nOTIwIGJvYXJkIHZpYSBoYXJkd2FyZSB6aXAgYWNjZWxl
cmF0b3IuDQo+ID4gPiAxLiBuby1zdmEgd29ya3MsIHdoZXJlIGd1ZXN0IGFwcCBkaXJlY3RseSB1
c2UgcGh5c2ljYWwgYWRkcmVzcyB2aWEgaW9jdGwuDQo+ID4gVGhhbmsgeW91IGZvciB0aGUgdGVz
dGluZy4gR2xhZCBpdCB3b3JrcyBmb3IgeW91Lg0KPiA+ID4gMi4gdlNWQSBzdGlsbCBub3Qgd29y
aywgc2FtZSBhcyB2MTAsDQo+ID4gWWVzIHRoYXQncyBub3JtYWwgdGhpcyBzZXJpZXMgaXMgbm90
IG1lYW50IHRvIHN1cHBvcnQgdlNWTSBhdCB0aGlzIHN0YWdlLg0KPiA+DQo+ID4gSSBpbnRlbmQg
dG8gYWRkIHRoZSBtaXNzaW5nIHBpZWNlcyBkdXJpbmcgdGhlIG5leHQgd2Vla3MuDQo+IA0KPiBU
aGFua3MgZm9yIHRoYXQuIEkgaGF2ZSBtYWRlIGFuIGF0dGVtcHQgdG8gYWRkIHRoZSB2U1ZBIGJh
c2VkIG9uDQo+IHlvdXIgdjEwICsgSlBCcyBzdmEgcGF0Y2hlcy4gVGhlIGhvc3Qga2VybmVsIGFu
ZCBRZW11IGNoYW5nZXMgY2FuDQo+IGJlIGZvdW5kIGhlcmVbMV1bMl0uDQo+IA0KPiBUaGlzIGJh
c2ljYWxseSBhZGRzIG11bHRpcGxlIHBhc2lkIHN1cHBvcnQgb24gdG9wIG9mIHlvdXIgY2hhbmdl
cy4NCj4gSSBoYXZlIGRvbmUgc29tZSBiYXNpYyBzYW5pdHkgdGVzdGluZyBhbmQgd2UgaGF2ZSBz
b21lIGluaXRpYWwgc3VjY2Vzcw0KPiB3aXRoIHRoZSB6aXAgdmYgZGV2IG9uIG91ciBEMDYgcGxh
dGZvcm0uIFBsZWFzZSBub3RlIHRoYXQgdGhlIFNUQUxMIGV2ZW50IGlzDQo+IG5vdCB5ZXQgc3Vw
cG9ydGVkIHRob3VnaCwgYnV0IHdvcmtzIGZpbmUgaWYgd2UgbWxvY2soKSBndWVzdCB1c3IgbWVt
Lg0KDQpJIGhhdmUgYWRkZWQgU1RBTEwgc3VwcG9ydCBmb3Igb3VyIHZTVkEgcHJvdG90eXBlIGFu
ZCBpdCBzZWVtcyB0byBiZQ0Kd29ya2luZyhvbiBvdXIgaGFyZHdhcmUpLiBJIGhhdmUgdXBkYXRl
ZCB0aGUga2VybmVsIGFuZCBxZW11IGJyYW5jaGVzIHdpdGgNCnRoZSBzYW1lWzFdWzJdLiBJIHNo
b3VsZCB3YXJuIHlvdSB0aG91Z2ggdGhhdCB0aGVzZSBhcmUgcHJvdG90eXBlIGNvZGUgYW5kIEkg
YW0gcHJldHR5DQptdWNoIHJlLXVzaW5nIHRoZSBWRklPX0lPTU1VX1NFVF9QQVNJRF9UQUJMRSBp
bnRlcmZhY2UgZm9yIGFsbW9zdCBldmVyeXRoaW5nLg0KQnV0IHRob3VnaHQgb2Ygc2hhcmluZywg
aW4gY2FzZSBpZiBpdCBpcyB1c2VmdWwgc29tZWhvdyEuDQoNClRoYW5rcywNClNoYW1lZXINCg0K
WzFdaHR0cHM6Ly9naXRodWIuY29tL2hpc2lsaWNvbi9rZXJuZWwtZGV2L2NvbW1pdHMvdnN2YS1w
cm90b3R5cGUtaG9zdC12MQ0KDQpbMl1odHRwczovL2dpdGh1Yi5jb20vaGlzaWxpY29uL3FlbXUv
dHJlZS92NC4yLjAtMnN0YWdlLXJmY3Y2LXZzdmEtcHJvdG90eXBlLXYxDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
