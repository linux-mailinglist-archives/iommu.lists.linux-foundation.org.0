Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09888315F40
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 07:15:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDE95864EA;
	Wed, 10 Feb 2021 06:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gf-pnZpxuk53; Wed, 10 Feb 2021 06:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01EFD86739;
	Wed, 10 Feb 2021 06:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E527EC013A;
	Wed, 10 Feb 2021 06:15:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00DFDC013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 06:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9713600BB
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 06:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2eT7YfIEe-B for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 06:15:06 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id E669B6EAA1; Wed, 10 Feb 2021 06:15:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9480A600BB
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 06:15:04 +0000 (UTC)
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Db8Z50rnyz13rq9;
 Wed, 10 Feb 2021 14:12:45 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 10 Feb 2021 14:15:00 +0800
Received: from dggpemm000003.china.huawei.com (7.185.36.128) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 10 Feb 2021 14:15:01 +0800
Received: from dggpemm000003.china.huawei.com ([7.185.36.128]) by
 dggpemm000003.china.huawei.com ([7.185.36.128]) with mapi id 15.01.2106.002;
 Wed, 10 Feb 2021 14:15:00 +0800
From: zhukeqian <zhukeqian1@huawei.com>
To: Yi Sun <yi.y.sun@linux.intel.com>
Subject: RE: [RFC PATCH 10/11] vfio/iommu_type1: Optimize dirty bitmap
 population based on iommu HWDBM
Thread-Topic: [RFC PATCH 10/11] vfio/iommu_type1: Optimize dirty bitmap
 population based on iommu HWDBM
Thread-Index: AQHW/ThRSJft86PRz0y+dM++XckwuqpL+skAgAM6NwCAAbivUg==
Date: Wed, 10 Feb 2021 06:15:00 +0000
Message-ID: DF48D01B-4A2F-4813-959E-9E44C457B7F8
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
 <20210128151742.18840-11-zhukeqian1@huawei.com>
 <20210207095630.GA28580@yi.y.sun>
 <407d28db-1f86-8d4f-ab15-3c3ac56bbe7f@huawei.com>,
 <20210209115744.GB28580@yi.y.sun>
In-Reply-To: <20210209115744.GB28580@yi.y.sun>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, kvm <kvm@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 jiangkunkun <jiangkunkun@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "yan.y.zhao" <yan.y.zhao@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 lushenming <lushenming@huawei.com>, iommu <iommu@lists.linux-foundation.org>,
 James Morse <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>
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
Content-Type: multipart/mixed; boundary="===============8852971724039242704=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============8852971724039242704==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_DF48D01B4A2F4813959E9E44C457B7F8_"

--_000_DF48D01B4A2F4813959E9E44C457B7F8_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkNoZWVycyBmb3IgdGhlc2UgZGlzY3Vzc2lvbi4gOikNCg0KSSBhbSBvbiB2YWNhdGlv
biwgYW5kIHdpbGwgY29tZSBiYWNrIGF0IDIuMTguDQoNClRoYW5rcywNCktlcWlhbg0KDQpPbiAy
MS0wMi0wNyAxODo0MDozNiwgS2VxaWFuIFpodSB3cm90ZToNCj4gSGkgWWksDQo+DQo+IE9uIDIw
MjEvMi83IDE3OjU2LCBZaSBTdW4gd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBPbiAyMS0wMS0y
OCAyMzoxNzo0MSwgS2VxaWFuIFpodSB3cm90ZToNCj4gPg0KPiA+IFsuLi5dDQo+ID4NCj4gPj4g
K3N0YXRpYyB2b2lkIHZmaW9fZG1hX2RpcnR5X2xvZ19zdGFydChzdHJ1Y3QgdmZpb19pb21tdSAq
aW9tbXUsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZmaW9f
ZG1hICpkbWEpDQo+ID4+ICt7DQo+ID4+ICsgc3RydWN0IHZmaW9fZG9tYWluICpkOw0KPiA+PiAr
DQo+ID4+ICsgbGlzdF9mb3JfZWFjaF9lbnRyeShkLCAmaW9tbXUtPmRvbWFpbl9saXN0LCBuZXh0
KSB7DQo+ID4+ICsgICAgICAgICAgLyogR28gdGhyb3VnaCBhbGwgZG9tYWluIGFueXdheSBldmVu
IGlmIHdlIGZhaWwgKi8NCj4gPj4gKyAgICAgICAgICBpb21tdV9zcGxpdF9ibG9jayhkLT5kb21h
aW4sIGRtYS0+aW92YSwgZG1hLT5zaXplKTsNCj4gPj4gKyB9DQo+ID4+ICt9DQo+ID4NCj4gPiBU
aGlzIHNob3VsZCBiZSBhIHN3aXRjaCB0byBwcmVwYXJlIGZvciBkaXJ0eSBsb2cgc3RhcnQuIFBl
ciBJbnRlbA0KPiA+IFZ0ZCBzcGVjLCB0aGVyZSBpcyBTTEFERSBkZWZpbmVkIGluIFNjYWxhYmxl
LU1vZGUgUEFTSUQgVGFibGUgRW50cnkuDQo+ID4gSXQgZW5hYmxlcyBBY2Nlc3NlZC9EaXJ0eSBG
bGFncyBpbiBzZWNvbmQtbGV2ZWwgcGFnaW5nIGVudHJpZXMuDQo+ID4gU28sIGEgZ2VuZXJpYyBp
b21tdSBpbnRlcmZhY2UgaGVyZSBpcyBiZXR0ZXIuIEZvciBJbnRlbCBpb21tdSwgaXQNCj4gPiBl
bmFibGVzIFNMQURFLiBGb3IgQVJNLCBpdCBzcGxpdHMgYmxvY2suDQo+IEluZGVlZCwgYSBnZW5l
cmljIGludGVyZmFjZSBuYW1lIGlzIGJldHRlci4NCj4NCj4gVGhlIHZlbmRvciBpb21tdSBkcml2
ZXIgcGxheXMgdmVuZG9yJ3Mgc3BlY2lmaWMgYWN0aW9ucyB0byBzdGFydCBkaXJ0eSBsb2csIGFu
ZCBJbnRlbCBpb21tdSBhbmQgQVJNIHNtbXUgbWF5IGRpZmZlci4gQmVzaWRlcywgd2UgbWF5IGFk
ZCBtb3JlIGFjdGlvbnMgaW4gQVJNIHNtbXUgZHJpdmVyIGluIGZ1dHVyZS4NCj4NCj4gT25lIHF1
ZXN0aW9uOiBUaG91Z2ggSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBJbnRlbCBpb21tdSwgSSB0aGlu
ayBpdCBhbHNvIHNob3VsZCBzcGxpdCBibG9jayBtYXBwaW5nIGJlc2lkZXMgZW5hYmxlIFNMQURF
LiBSaWdodD8NCj4NCkkgYW0gbm90IGZhbWlsaWFyIHdpdGggQVJNIHNtbXUuIDopIFNvIEkgd2Fu
dCB0byBjbGFyaWZ5IGlmIHRoZSBibG9jaw0KaW4gc21tdSBpcyBiaWcgcGFnZSwgZS5nLiAyTSBw
YWdlPyBJbnRlbCBWdGQgbWFuYWdlcyB0aGUgbWVtb3J5IHBlcg0KcGFnZSwgNEtCLzJNQi8xR0Iu
IFRoZXJlIGFyZSB0d28gd2F5cyB0byBtYW5hZ2UgZGlydHkgcGFnZXMuDQoxLiBLZWVwIGRlZmF1
bHQgZ3JhbnVsYXJpdHkuIEp1c3Qgc2V0IFNMQURFIHRvIGVuYWJsZSB0aGUgZGlydHkgdHJhY2su
DQoyLiBTcGxpdCBiaWcgcGFnZSB0byA0S0IgdG8gZ2V0IGZpbmVyIGdyYW51bGFyaXR5Lg0KDQpC
dXQgcXVlc3Rpb24gYWJvdXQgdGhlIHNlY29uZCBzb2x1dGlvbiBpcyBpZiBpdCBjYW4gYmVuZWZp
dCB0aGUgdXNlcg0Kc3BhY2UsIGUuZy4gbGl2ZSBtaWdyYXRpb24uIElmIG15IHVuZGVyc3RhbmRp
bmcgYWJvdXQgc21tdSBibG9jayAoaS5lLg0KdGhlIGJpZyBwYWdlKSBpcyBjb3JyZWN0LCBoYXZl
IHlvdSBjb2xsZWN0ZWQgc29tZSBwZXJmb3JtYW5jZSBkYXRhIHRvDQpwcm92ZSB0aGF0IHRoZSBz
cGxpdCBjYW4gaW1wcm92ZSBwZXJmb3JtYW5jZT8gVGhhbmtzIQ0KDQo+IFRoYW5rcywNCj4gS2Vx
aWFuDQoNCg==

--_000_DF48D01B4A2F4813959E9E44C457B7F8_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9tYXRhPjxzdHls
ZSB0eXBlPSJ0ZXh0L2NzcyI+Cioge2JveC1zaXppbmc6Ym9yZGVyLWJveDt9CmJvZHkge2ZvbnQt
ZmFtaWx5OiBDYWxpYnJpO30KPC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj4NCjxkaXYg
aWQ9ImZvY3VzIj4NCjxkaXY+SGksIDwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Q2hl
ZXJzIGZvciB0aGVzZSBkaXNjdXNzaW9uLiA6KSA8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8
ZGl2PkkgYW0gb24gdmFjYXRpb24sIGFuZCB3aWxsIGNvbWUgYmFjayBhdCAyLjE4LiA8L2Rpdj4N
CjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRoYW5rcywgPC9kaXY+DQo8ZGl2PktlcWlhbiA8L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXYgbmFtZT0ibWFpbF9oaXN0X2NvbnRl
bnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEwcHQ7IGJhY2tncm91
bmQtY29sb3I6IGluaGVyaXQ7Ij4NCjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+T24gMjEtMDItMDcg
MTg6NDA6MzYsIEtlcWlhbiBaaHUgd3JvdGU6IDxicj4NCiZndDsgSGkgWWksIDxicj4NCiZndDsg
PGJyPg0KJmd0OyBPbiAyMDIxLzIvNyAxNzo1NiwgWWkgU3VuIHdyb3RlOiA8YnI+DQomZ3Q7ICZn
dDsgSGksIDxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgT24gMjEtMDEtMjggMjM6MTc6
NDEsIEtlcWlhbiBaaHUgd3JvdGU6IDxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgWy4u
Ll0gPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyZndDsgJiM0MztzdGF0aWMgdm9pZCB2
ZmlvX2RtYV9kaXJ0eV9sb2dfc3RhcnQoc3RydWN0IHZmaW9faW9tbXUgKmlvbW11LCA8YnI+DQom
Z3Q7ICZndDsmZ3Q7ICYjNDM7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzdHJ1Y3QgdmZpb19kbWEgKmRtYSkgPGJyPg0KJmd0OyAm
Z3Q7Jmd0OyAmIzQzO3sgPGJyPg0KJmd0OyAmZ3Q7Jmd0OyAmIzQzOyBzdHJ1Y3QgdmZpb19kb21h
aW4gKmQ7IDxicj4NCiZndDsgJmd0OyZndDsgJiM0MzsgPGJyPg0KJmd0OyAmZ3Q7Jmd0OyAmIzQz
OyBsaXN0X2Zvcl9lYWNoX2VudHJ5KGQsICZhbXA7aW9tbXUtJmd0O2RvbWFpbl9saXN0LCBuZXh0
KSB7IDxicj4NCiZndDsgJmd0OyZndDsgJiM0MzsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8qIEdvIHRocm91Z2ggYWxsIGRvbWFpbiBhbnl3YXkgZXZl
biBpZiB3ZSBmYWlsICovIDxicj4NCiZndDsgJmd0OyZndDsgJiM0MzsgJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlvbW11X3NwbGl0X2Jsb2NrKGQtJmd0
O2RvbWFpbiwgZG1hLSZndDtpb3ZhLCBkbWEtJmd0O3NpemUpOyA8YnI+DQomZ3Q7ICZndDsmZ3Q7
ICYjNDM7IH0gPGJyPg0KJmd0OyAmZ3Q7Jmd0OyAmIzQzO30gPGJyPg0KJmd0OyAmZ3Q7IDxicj4N
CiZndDsgJmd0OyBUaGlzIHNob3VsZCBiZSBhIHN3aXRjaCB0byBwcmVwYXJlIGZvciBkaXJ0eSBs
b2cgc3RhcnQuIFBlciBJbnRlbCA8YnI+DQomZ3Q7ICZndDsgVnRkIHNwZWMsIHRoZXJlIGlzIFNM
QURFIGRlZmluZWQgaW4gU2NhbGFibGUtTW9kZSBQQVNJRCBUYWJsZSBFbnRyeS4gPGJyPg0KJmd0
OyAmZ3Q7IEl0IGVuYWJsZXMgQWNjZXNzZWQvRGlydHkgRmxhZ3MgaW4gc2Vjb25kLWxldmVsIHBh
Z2luZyBlbnRyaWVzLiA8YnI+DQomZ3Q7ICZndDsgU28sIGEgZ2VuZXJpYyBpb21tdSBpbnRlcmZh
Y2UgaGVyZSBpcyBiZXR0ZXIuIEZvciBJbnRlbCBpb21tdSwgaXQgPGJyPg0KJmd0OyAmZ3Q7IGVu
YWJsZXMgU0xBREUuIEZvciBBUk0sIGl0IHNwbGl0cyBibG9jay4gPGJyPg0KJmd0OyBJbmRlZWQs
IGEgZ2VuZXJpYyBpbnRlcmZhY2UgbmFtZSBpcyBiZXR0ZXIuIDxicj4NCiZndDsgPGJyPg0KJmd0
OyBUaGUgdmVuZG9yIGlvbW11IGRyaXZlciBwbGF5cyB2ZW5kb3IncyBzcGVjaWZpYyBhY3Rpb25z
IHRvIHN0YXJ0IGRpcnR5IGxvZywgYW5kIEludGVsIGlvbW11IGFuZCBBUk0gc21tdSBtYXkgZGlm
ZmVyLiBCZXNpZGVzLCB3ZSBtYXkgYWRkIG1vcmUgYWN0aW9ucyBpbiBBUk0gc21tdSBkcml2ZXIg
aW4gZnV0dXJlLg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE9uZSBxdWVzdGlvbjogVGhvdWdoIEkg
YW0gbm90IGZhbWlsaWFyIHdpdGggSW50ZWwgaW9tbXUsIEkgdGhpbmsgaXQgYWxzbyBzaG91bGQg
c3BsaXQgYmxvY2sgbWFwcGluZyBiZXNpZGVzIGVuYWJsZSBTTEFERS4gUmlnaHQ/DQo8YnI+DQom
Z3Q7IDxicj4NCkkgYW0gbm90IGZhbWlsaWFyIHdpdGggQVJNIHNtbXUuIDopIFNvIEkgd2FudCB0
byBjbGFyaWZ5IGlmIHRoZSBibG9jayA8YnI+DQppbiBzbW11IGlzIGJpZyBwYWdlLCBlLmcuIDJN
IHBhZ2U/IEludGVsIFZ0ZCBtYW5hZ2VzIHRoZSBtZW1vcnkgcGVyIDxicj4NCnBhZ2UsIDRLQi8y
TUIvMUdCLiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gbWFuYWdlIGRpcnR5IHBhZ2VzLiA8YnI+DQox
LiBLZWVwIGRlZmF1bHQgZ3JhbnVsYXJpdHkuIEp1c3Qgc2V0IFNMQURFIHRvIGVuYWJsZSB0aGUg
ZGlydHkgdHJhY2suIDxicj4NCjIuIFNwbGl0IGJpZyBwYWdlIHRvIDRLQiB0byBnZXQgZmluZXIg
Z3JhbnVsYXJpdHkuIDxicj4NCjxicj4NCkJ1dCBxdWVzdGlvbiBhYm91dCB0aGUgc2Vjb25kIHNv
bHV0aW9uIGlzIGlmIGl0IGNhbiBiZW5lZml0IHRoZSB1c2VyIDxicj4NCnNwYWNlLCBlLmcuIGxp
dmUgbWlncmF0aW9uLiBJZiBteSB1bmRlcnN0YW5kaW5nIGFib3V0IHNtbXUgYmxvY2sgKGkuZS4g
PGJyPg0KdGhlIGJpZyBwYWdlKSBpcyBjb3JyZWN0LCBoYXZlIHlvdSBjb2xsZWN0ZWQgc29tZSBw
ZXJmb3JtYW5jZSBkYXRhIHRvIDxicj4NCnByb3ZlIHRoYXQgdGhlIHNwbGl0IGNhbiBpbXByb3Zl
IHBlcmZvcm1hbmNlPyBUaGFua3MhIDxicj4NCjxicj4NCiZndDsgVGhhbmtzLCA8YnI+DQomZ3Q7
IEtlcWlhbiA8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PGJyPg0KPC9kaXY+DQo8L2Rpdj4N
CjxkaXY+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DF48D01B4A2F4813959E9E44C457B7F8_--

--===============8852971724039242704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============8852971724039242704==--
