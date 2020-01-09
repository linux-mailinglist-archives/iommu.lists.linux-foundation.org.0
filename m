Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF41354E7
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 09:57:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D21F85D52;
	Thu,  9 Jan 2020 08:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6BWc6N7iRxe; Thu,  9 Jan 2020 08:57:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA3EE85FC9;
	Thu,  9 Jan 2020 08:57:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0817C1D8B;
	Thu,  9 Jan 2020 08:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 792C5C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 08:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6476F87F44
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 08:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzoKn9BZ8BXi for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 08:57:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DA3787EE6
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 08:57:01 +0000 (UTC)
Received: from BC-Mail-Ex21.internal.baidu.com (unknown [172.31.51.15])
 by Forcepoint Email with ESMTPS id 64F15F37100A4D03FC7B;
 Thu,  9 Jan 2020 16:56:58 +0800 (CST)
Received: from BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) by
 BC-Mail-Ex21.internal.baidu.com (172.31.51.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 9 Jan 2020 16:56:58 +0800
Received: from BC-Mail-Ex03.internal.baidu.com (172.31.51.43) by
 BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 9 Jan 2020 16:56:58 +0800
Received: from BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) by
 BC-Mail-Ex03.internal.baidu.com ([100.100.100.102]) with mapi id
 15.01.1531.010; Thu, 9 Jan 2020 16:56:57 +0800
From: "Jim,Yan" <jimyan@baidu.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMjIvMjJdIGlvbW11L3Z0LWQ6IEFkZCBhIHF1aXJr?=
 =?utf-8?Q?_flag_for_scope_mismatched_devices?=
Thread-Topic: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
Thread-Index: AQHVwQJdlyeJaUiGx0OLiIVXnGor1qfgVDCAgACaZ4CAAH/4AIAAHdIAgACGpkA=
Date: Thu, 9 Jan 2020 08:56:57 +0000
Message-ID: <b8e8b58d8ff64a38ac6e8f05dd254d41@baidu.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <20200108141603.GA11875@infradead.org>
 <d73ac0f4-b347-8f59-d2a7-8eeee142ed8d@linux.intel.com>
 <20200109070642.GA13212@infradead.org>
 <7874bf1f-43e3-7e44-6bdd-4dd3cea1803d@linux.intel.com>
In-Reply-To: <7874bf1f-43e3-7e44-6bdd-4dd3cea1803d@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.200.84]
x-baidu-bdmsfe-datecheck: 1_BJHW-MAIL-EX04_2020-01-09 16:56:58:302
x-baidu-bdmsfe-viruscheck: BJHW-MAIL-EX04_GRAY_Inside_WithoutAtta_2020-01-09
 16:56:58:287
MIME-Version: 1.0
X-Baidu-BdMsfe-DateCheck: 1_BC-Mail-Ex21_2020-01-09 16:56:58:425
Cc: Roland Dreier <roland@purestorage.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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
MjDlubQx5pyIOeaXpSAxNjo1Mw0KPiDmlLbku7bkuro6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4NCj4g5oqE6YCBOiBiYW9sdS5sdUBsaW51eC5pbnRlbC5jb207IEpvZXJn
IFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPjsgUm9sYW5kDQo+IERyZWllciA8cm9sYW5kQHB1cmVz
dG9yYWdlLmNvbT47IEppbSxZYW4gPGppbXlhbkBiYWlkdS5jb20+Ow0KPiBpb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZw0KPiDkuLvpopg6IFJlOiBbUEFUQ0ggMjIvMjJdIGlvbW11L3Z0
LWQ6IEFkZCBhIHF1aXJrIGZsYWcgZm9yIHNjb3BlIG1pc21hdGNoZWQNCj4gZGV2aWNlcw0KPiAN
Cj4gT24gMS85LzIwIDM6MDYgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiA+IE9uIFRo
dSwgSmFuIDA5LCAyMDIwIGF0IDA3OjI4OjQxQU0gKzA4MDAsIEx1IEJhb2x1IHdyb3RlOg0KPiA+
PiBUaGlzIHBhdGNoIGhhcyBiZWVuIHJlcGxhY2VkIHdpdGggdGhpcyBvbmUuDQo+ID4+DQo+ID4+
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzEvNS8xMDMNCj4gPg0KPiA+IFRoYXQgc3RpbGwg
bWVudGlvbnMgYSAibnZtZSBob3N0IGRldmljZSIsIHdoaWNoIGRlc3BpdGUgdGhlIGRpZmZlcmVu
dA0KPiA+IHNwZWxsaW5nIHN0aWxsIGRvZXNuJ3QgbWFrZSBhbnkgc2Vuc2UuDQo+ID4NCj4gDQo+
IEppbSwgY2FuIHlvdSBwbGVhc2UgcmVmaW5lIGl0IGFjY29yZGluZ2x5Pw0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBCYW9sdQ0KDQoNClllcywgSSBhbSB3b3JraW5nIG9uIGl0Lg0KDQpSZWdhcmRz
DQpKaW0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
