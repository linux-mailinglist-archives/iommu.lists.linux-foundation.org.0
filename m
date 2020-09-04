Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABCD25E7AA
	for <lists.iommu@lfdr.de>; Sat,  5 Sep 2020 15:02:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21E3F87274;
	Sat,  5 Sep 2020 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6Ck5K3RuQlN; Sat,  5 Sep 2020 13:01:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 627CC8726C;
	Sat,  5 Sep 2020 13:01:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE41C0052;
	Sat,  5 Sep 2020 13:01:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19B3FC0052
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 13:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E10E220789
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 13:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12EXwJSMMqT7 for <iommu@lists.linux-foundation.org>;
 Sat,  5 Sep 2020 13:01:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 81A1220784
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 13:01:54 +0000 (UTC)
IronPort-SDR: BWazTfkGZwj6uz1VWqUSVYVGe8kmTQIWUdYeRrKQbdzHj6cgT0XqMhiYcuA7/gVQYL5QSLi3Cx
 ZxPekngmzqyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="175908531"
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; d="scan'208";a="175908531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2020 06:01:53 -0700
IronPort-SDR: viw6T7QrSKY8HsbhLF+dS7l/Sn3VOg5cdPOD7jiRnaxrKhGGH9sWzymwVNjf9Y2wvYMPqft8hL
 AU7G3eMkPJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; d="scan'208";a="303003078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 05 Sep 2020 06:01:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 5 Sep 2020 06:01:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Sep 2020 15:25:41 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Fri, 4 Sep 2020 15:25:41 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH V6 1/3] iommu: Add support to change default domain of an
 iommu group
Thread-Topic: [PATCH V6 1/3] iommu: Add support to change default domain of an
 iommu group
Thread-Index: AQHWgpeI539owO3I/k+wFmjHF9kByKlY18mAgACg6oD//5Z/cA==
Date: Fri, 4 Sep 2020 22:25:40 +0000
Message-ID: <b2f4b32e281f44b997b7a26a6b9942b9@intel.com>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
 <458786ba5883eaab3aea51ae2fdc7f5dbe71284a.1595619936.git.sai.praneeth.prakhya@intel.com>
 <20200904083036.GB28508@8bytes.org>
 <d92598a2e54b48eba0c8e30a2c40b937@intel.com>
 <20200904214221.GG16609@8bytes.org>
In-Reply-To: <20200904214221.GG16609@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

SGkgSm9lcmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lcmcg
Um9lZGVsIDxqb3JvQDhieXRlcy5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDQsIDIw
MjAgMjo0MiBQTQ0KPiBUbzogUHJha2h5YSwgU2FpIFByYW5lZXRoIDxzYWkucHJhbmVldGgucHJh
a2h5YUBpbnRlbC5jb20+DQo+IENjOiBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsg
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+OyBSYWosDQo+IEFzaG9rIDxhc2hvay5yYWpA
aW50ZWwuY29tPjsgV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+OyBMdSBCYW9sdQ0K
PiA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPjsgTWVodGEsIFNvaGlsIDxzb2hpbC5tZWh0YUBp
bnRlbC5jb20+OyBSb2Jpbg0KPiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPjsgSmFjb2Ig
UGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBWNiAxLzNdIGlvbW11OiBBZGQgc3VwcG9ydCB0byBjaGFuZ2UgZGVmYXVsdCBkb21haW4gb2YN
Cj4gYW4gaW9tbXUgZ3JvdXANCj4gDQo+IE9uIEZyaSwgU2VwIDA0LCAyMDIwIGF0IDA3OjExOjA3
UE0gKzAwMDAsIFByYWtoeWEsIFNhaSBQcmFuZWV0aCB3cm90ZToNCj4gPiBCdXQgY291cGxlIG9m
IHF1ZXN0aW9ucy4uDQo+ID4gMS4gRG8geW91IHdhbnQgbWUgdG8gcG9zdCB0aGUgZW50aXJlIHBh
dGNoIHNlcmllcz8gKGkuZS4gMyBwYXRjaGVzKSBvcg0KPiA+IGRvIHlvdSB3YW50IG1lIHRvIHBv
c3QganVzdCB0aGlzIHBhdGNoIGkuZS4gMXN0IHBhdGNoIG9ubHkgMi4gRG8geW91IHdhbnQgbWUg
dG8NCj4gYnVtcCB0aGUgdmVyc2lvbiBudW1iZXI/IGkuZS4gcG9zdCBpdCBhcyBWNyA/DQo+ID4g
My4gRGlkbid0IGdldCB3aGF0IHlvdSBtZWFudCBoZXJlLi4gIndvdGggYjQiIOKYuQ0KPiANCj4g
UGxlYXNlIHJlc2VuZCBhbGwgMyBwYXRjaGVzIGEgdjcsIGI0IGlzIGp1c3QgYSB0b29sIEkgYW0g
dXNpbmcgdG8gZG93bmxvYWQgdGhlDQo+IHBhdGNoZXMgZnJvbSB0aGUgbWFpbGluZyBsaXN0IGFu
ZCBhZGQgYWxsIHRhZ3NbMV0uDQoNClRoYW5rcyBmb3IgYW5zd2VyaW5nIHRoZSBxdWVzdGlvbnMu
IEl0J3MgY2xlYXIgdG8gbWUgbm93Li4gSSB3aWxsIHBvc3QgYSBWNyDwn5iKDQoNClJlZ2FyZHMs
DQpTYWkNCg0KPiBSZWdhcmRzLA0KPiANCj4gCUpvZXJnDQo+IA0KPiBbMV0gaHR0cHM6Ly9wZW9w
bGUua2VybmVsLm9yZy9tb25zaWV1cmljb24vaW50cm9kdWNpbmctYjQtYW5kLXBhdGNoLQ0KPiBh
dHRlc3RhdGlvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
