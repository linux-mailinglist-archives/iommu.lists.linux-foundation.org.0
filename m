Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B8C122216
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 03:44:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F8598704C;
	Tue, 17 Dec 2019 02:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY1o2C2tL3rv; Tue, 17 Dec 2019 02:44:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7917B87048;
	Tue, 17 Dec 2019 02:44:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B800C077D;
	Tue, 17 Dec 2019 02:44:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 417CAC077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 02:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D03D2279B
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 02:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Me8VY-qoeqsK for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 02:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F47C22797
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 02:44:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 18:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="221643930"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2019 18:44:47 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Dec 2019 18:44:47 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Dec 2019 18:44:47 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.71]) with mapi id 14.03.0439.000;
 Tue, 17 Dec 2019 10:44:45 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "David Woodhouse" <dwmw2@infradead.org>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 5/6] iommu/vt-d: Flush PASID-based iotlb for iova
 over first level
Thread-Topic: [PATCH v3 5/6] iommu/vt-d: Flush PASID-based iotlb for iova
 over first level
Thread-Index: AQHVr8iiJX/bvAPmK0eIArQDcTD6yKe33K3QgACZjICAAndaMIACHLkAgAAFFACAAACDAIAAl1Vg
Date: Tue, 17 Dec 2019 02:44:44 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A135D50@SHSMSX104.ccr.corp.intel.com>
References: <20191211021219.8997-1-baolu.lu@linux.intel.com>
 <20191211021219.8997-6-baolu.lu@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A130C08@SHSMSX104.ccr.corp.intel.com>
 <f1e5cfea-8b11-6d72-8e57-65daea51c050@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A132C50@SHSMSX104.ccr.corp.intel.com>
 <6a5f6695-d1fd-e7d1-3ea3-f222a1ef0e54@linux.intel.com>
 <b4a879b2-a5c7-b0bf-8cd4-7397aeebc381@linux.intel.com>
 <2b024c1e-79bd-6827-47e6-ae9457054c79@linux.intel.com>
In-Reply-To: <2b024c1e-79bd-6827-47e6-ae9457054c79@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2JiZjNhYjctY2IyNi00NjcxLTkxYjEtZTQ0ZWY2ZWQ0MjQzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic3k5R2ljVUpuY3REWVlQOHl0b01hQnZkSnhUbWtPUXcreEY4c3hMQlJKMDdaMHU3M2UzdHZ0UWpPTkRPT2QyVSJ9
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, 
 Yi Y" <yi.y.sun@intel.com>
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

PiBGcm9tOiBMdSBCYW9sdSBbbWFpbHRvOmJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbV0NCj4gU2Vu
dDogVHVlc2RheSwgRGVjZW1iZXIgMTcsIDIwMTkgOTozOSBBTQ0KPiBUbzogTGl1LCBZaSBMIDx5
aS5sLmxpdUBpbnRlbC5jb20+OyBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz47IERhdmlk
DQo+IFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz47IEFsZXggV2lsbGlhbXNvbg0KPiA8
YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS82
XSBpb21tdS92dC1kOiBGbHVzaCBQQVNJRC1iYXNlZCBpb3RsYiBmb3IgaW92YSBvdmVyIGZpcnN0
DQo+IGxldmVsDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDEyLzE3LzE5IDk6MzcgQU0sIEx1IEJhb2x1
IHdyb3RlOg0KPiA+IFlvdSBhcmUgcmlnaHQuIEkgd2lsbCBjaGFuZ2UgaXQgYWNjb3JkaW5nbHku
IFRoZSBsb2dpYyBzaG91bGQgbG9vaw0KPiA+IGxpa2U6DQo+ID4NCj4gPiBpZiAoZG9tYWluIGF0
dGFjaGVkIHRvIHBoeXNpY2FsIGRldmljZSkNCj4gPiAgwqDCoMKgwqBmbHVzaF9waW90bGJfd2l0
aF9SSUQyUEFTSUQoKQ0KPiA+IGVsc2UgaWYgKGRvbWFpbl9hdHRhY2hlZF90b19tZGV2X2Rldmlj
ZSkNCj4gPiAgwqDCoMKgwqBmbHVzaF9waW90bGJfd2l0aF9kZWZhdWx0X3Bhc2lkKCkNCj4gPg0K
PiANCj4gQm90aCEgc28gbm8gImVsc2UiIGhlcmUuDQoNCmFoYSwgaWYgd2Ugd2FudCB0byBmbHVz
aCBtb3JlIHByZWNpc2VseSwgd2UgbWF5IGNoZWNrIHdoZXRoZXINCmRvbWFpbi0+ZGVmYXVsdF9w
YXNpZCBpcyBhbGxvY2F0ZWQuIElmIG5vdCwgaXQgbWVhbnMgbm8gbWRldiBpcw0KaW52b2x2ZWQs
IHRoZW4gd2UgbWF5IHNhdmUgYSBwX2lvdGxiX2ludl9kc2Mgc3VibWlzc2lvbiBhbmQgYWxzbw0K
c2F2ZSBWVC1kIGhhcmR3YXJlIGNpcmNsZXMgZnJvbSBkb2luZyB1c2VsZXNzIGZsdXNoLiBUaGlz
IGlzIGp1c3QNCm9wdGltaXphdGlvbiwgaXQncyB1cCB0byB5b3UgdG8gcGljayBpdCBvciBub3Qg
aW4gdGhpcyBwYXRjaHNldC4gSSdtDQpmaW5lIHdpdGggZmx1c2ggImJvdGgiIHNpbmNlIGl0IGd1
YXJhbnRlZXMgY29ycmVjdG5lc3MuDQoNClJlZ2FyZHMsDQpZaSBMaXUNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
