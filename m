Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 237312258F9
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 09:51:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9F70A20004;
	Mon, 20 Jul 2020 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZGwAkS8QC0n; Mon, 20 Jul 2020 07:51:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA27520002;
	Mon, 20 Jul 2020 07:51:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A193CC016F;
	Mon, 20 Jul 2020 07:51:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD9ADC016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A31F685BB5
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxZgNeivOqEf for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 07:51:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 717C3857D8
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 07:51:42 +0000 (UTC)
IronPort-SDR: 6VbUxNPFEUE6lMkppn/RntdeFfCHBzn4Rb12ghCEvWvTPfABEAT8TEdLR+E00vKIWzhAIp53ho
 sjwWn949clgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="137351539"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="137351539"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 00:51:41 -0700
IronPort-SDR: P+R/4zPZTDvUZsG9+DJCTmsrXcRbsY9H/FFQVC/7BQdX6P584EpJ+ZJsHwVG4O1O76I6BRlvdc
 WrP4bXsJxwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="271369502"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2020 00:51:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jul 2020 00:51:40 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Jul 2020 00:51:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jul 2020 00:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0LeXj5yI5dH+iehBlFSnk5y1AyUdwpoI0CmVsefOGead7GWm02Qb6AbyXFgugr6YiX3mtc5q9F+R4PPfBxFVwfpp0xYQzTU6DA4aZ+wPV9EsHhM7SfpvqAm3jaHnm2AHPHLXqGYROexkHTBa2mvwHb+2Y5oRWRel42ftWA1k1+AyNhnyBfjogtYnywlOkThyiJdW42Z+M09owoZrFVdqwvBFtW5JL1jPBRxfytSzpgIIfp+A1ovm3A/XgG8mQ3WpHpaWPaCDSezvtZ2l5BwgeEyAhLyctcLHYNxf0Tl9BUoztcKwE3ftDr6tyZpcIARyAGGkiLL5abn75NvCJIjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVQzkonj3R10WmuN6POi0aJL0lgZHLTzp8o/YcOHm0I=;
 b=cMMASRPpZD+Qg4Ya8TtotBrakkP+i2P7GWSnENE/5g/ShbpK55tP/5yd9/mTYf5MlXnLXwqzGyUb0ZU31TM6292ZZjdo7hGxZmut0/d0EwHdHDCQcIZwCDFPi7TB3r27F3pWjXFO/4zFwLDaa8EXLWy1WJJRtnZm4OMC5x109OiP1c6b2L0mzn4Qda97CItA6dAT40kUu2l/pNZ2/7ARqD3/NYP5jGWYP1J+Uhsgppy/u0IKWj0H1AOcMKz5hT7gZuJLchqg+EgURPjn3I4zqSWfVix9rcnH88eLYA84SAk75jAKqS1QSpMnBtMOIcGZaVORt/ixSwb/Rxf3U9Zd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVQzkonj3R10WmuN6POi0aJL0lgZHLTzp8o/YcOHm0I=;
 b=P48RFOUJ3kUS58ZI9ouD8o+vBfKq30xvn4L/2C1yZdneHNiRqmOyq5QDtHQhbqgZ659NodyOfKu5y2tyz5w3PYbwzbDaWoFNVeHlVoNnuV++pv9C3t+1zHyVU9ErjNS6tCcFqHOfIcEeSMwMZ+cFpnqm2mJN63bJNCT3GogB5jI=
Received: from DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) by
 DM6PR11MB3146.namprd11.prod.outlook.com (2603:10b6:5:67::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17; Mon, 20 Jul 2020 07:51:33 +0000
Received: from DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364]) by DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364%10]) with mapi id 15.20.3195.025; Mon, 20 Jul
 2020 07:51:33 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "joro@8bytes.org" <joro@8bytes.org>
Subject: RE: [PATCH v5 04/15] vfio/type1: Report iommu nesting info to
 userspace
Thread-Topic: [PATCH v5 04/15] vfio/type1: Report iommu nesting info to
 userspace
Thread-Index: AQHWWD2mH52kXgEkW0OSi8evIQBECqkMEIoAgAQOHZA=
Date: Mon, 20 Jul 2020 07:51:33 +0000
Message-ID: <DM5PR11MB1435AF9531C5CF29CD1D1251C37B0@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1594552870-55687-1-git-send-email-yi.l.liu@intel.com>
 <1594552870-55687-5-git-send-email-yi.l.liu@intel.com>
 <2eb692fc-a399-8298-4b4b-68adb0357404@redhat.com>
In-Reply-To: <2eb692fc-a399-8298-4b4b-68adb0357404@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6589716e-188c-4ff0-5206-08d82c81b8b8
x-ms-traffictypediagnostic: DM6PR11MB3146:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3146EB835BC178D98E36F05FC37B0@DM6PR11MB3146.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 336XeKoMuv8KwJmf27u1C6dfqW0PIRy2wQ0LYkWlrc9QXsKUhWQaCL4E2UyZhNhxMgzfPTo/A6XjbKoURePD0VIBpTQXYl+sTXi4pyuXxvxAz9IWH7E5P2xmhYNwtLUtb7VTxdsydo2vB0qe4lO0v2TUmwN2j8AiX86kl0Jzkjk9tQgOyezyN25jhXR9VBs06JEMREEwsV5Ofq+l9knMP4fQLeFIRSsHeXp1aJU1nuU2wk0GWkUVjuzsuDAhFhcUo2/pCHoT0KpVcLTGCSA8Uckc2t9BEoJZt7yy24/GwOpIRgVBgA7z40y1LvN4Y4/nck4lTGSEHXocQ8RAwcbRpgztrIlmHFcf8RdaVE9r3Ag6iIIMoDXwp324vc6LWOvgEMNYSCRt7c7yTq7wcJk0Jg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1435.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(186003)(8936002)(76116006)(64756008)(966005)(66446008)(8676002)(7696005)(71200400001)(86362001)(26005)(478600001)(66946007)(4326008)(66556008)(66476007)(316002)(9686003)(83380400001)(33656002)(2906002)(6506007)(53546011)(7416002)(54906003)(110136005)(55016002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bpvenPAFwNMjjPSPexqY+jBksfUcZi1RXwAGnnIPhUeXL0xTO8twVOPNJVeCc8YTjDflfyZZxA0Z0m/svqBKw6EiBLTHcvnRS/hUs7QwfiMnYcjYGZBHQVHb4RqKB6qJGR0AjlM3ig/s00N2vzPdzQj0T/mpO/UcVN6xhEBM+peTT+ylvKEnnXDvduwSuJ5h2IrFESTmYWihcaN/2FQC8GBgmhKLE3CSxV1YSJSzv0txZo5pLj5RC39hDWyyo7JE0cdqCgQIAANHv2JZ0ZZNviROdAfUez83T8+G9OT1cLQ7M56osUi7YrSqmSymUOgqlD6VzgX/5Ab2Fenlqzpn9JWBxoCij0c25t4DRBRcPg+BsoNZ7Vd3/9Rqck/fLYHciGlF5LQyWhTu+cjtYcltogDvqqpjaxpC2cYBMUEYrSt2LVkljF48MwxHCvp447RegByYkYk8vHXj405PYqLj1lcox7n8D0SRBZUGIDTC8u68lp73RsQCkjt+WorKQ1JL
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6589716e-188c-4ff0-5206-08d82c81b8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 07:51:33.2376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAPQlgPi9MJU0jaQR9GBMUABZt19vwj/a7y3vjfguuFtbQ1p7lAxtil70gmbRTQurX2q+NoedPojdsBkS8rNog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3146
X-OriginatorOrg: intel.com
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, "Tian, 
 Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

SGkgRXJpYywNCg0KPiBGcm9tOiBBdWdlciBFcmljIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+
IFNlbnQ6IFNhdHVyZGF5LCBKdWx5IDE4LCAyMDIwIDE6MzQgQU0NCj4gDQo+IFlpLA0KPiANCj4g
T24gNy8xMi8yMCAxOjIwIFBNLCBMaXUgWWkgTCB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGV4cG9y
dHMgaW9tbXUgbmVzdGluZyBjYXBhYmlsaXR5IGluZm8gdG8gdXNlciBzcGFjZSB0aHJvdWdoDQo+
ID4gVkZJTy4gVXNlciBzcGFjZSBpcyBleHBlY3RlZCB0byBjaGVjayB0aGlzIGluZm8gZm9yIHN1
cHBvcnRlZCB1QVBJcyAoZS5nLg0KPiBpdCBpcyBub3Qgb25seSB0byBjaGVjayB0aGUgc3VwcG9y
dGVkIHVBUElTIGJ1dCByYXRoZXIgdG8ga25vdyB3aGljaA0KPiBjYWxsYmFja3MgaXQgbXVzdCBj
YWxsIHVwb24gdklPTU1VIGV2ZW50cyBhbmQgd2hpY2ggZmVhdHVyZXMgYXJlDQo+IHN1cHBvcnRl
ZCBieSB0aGUgcGh5c2ljYWwgSU9NTVUuDQoNCnllcywgd2lsbCByZWZpbmUgdGhlIGRlc2NyaXB0
aW9uIHBlciB5b3VyIGNvbW1lbnQuDQoNCj4gPiBQQVNJRCBhbGxvYy9mcmVlLCBiaW5kIHBhZ2Ug
dGFibGUsIGFuZCBjYWNoZSBpbnZhbGlkYXRpb24pIGFuZCB0aGUgdmVuZG9yDQo+ID4gc3BlY2lm
aWMgZm9ybWF0IGluZm9ybWF0aW9uIGZvciBmaXJzdCBsZXZlbC9zdGFnZSBwYWdlIHRhYmxlIHRo
YXQgd2lsbCBiZQ0KPiA+IGJvdW5kIHRvLg0KPiA+DQo+ID4gVGhlIG5lc3RpbmcgaW5mbyBpcyBh
dmFpbGFibGUgb25seSBhZnRlciB0aGUgbmVzdGluZyBpb21tdSB0eXBlIGlzIHNldA0KPiA+IGZv
ciBhIGNvbnRhaW5lci4NCj4gdG8gTkVTVEVEIHR5cGUNCg0KeW91IG1lYW4gIlRoZSBuZXN0aW5n
IGluZm8gaXMgYXZhaWxhYmxlIG9ubHkgYWZ0ZXIgY29udGFpbmVyIHNldCB0byBiZSBORVNURUQg
dHlwZS4iDQoNCnJpZ2h0Pw0KDQo+ICBDdXJyZW50IGltcGxlbWVudGF0aW9uIGltcG9zZXMgb25l
IGxpbWl0YXRpb24gLSBvbmUNCj4gPiBuZXN0aW5nIGNvbnRhaW5lciBzaG91bGQgaW5jbHVkZSBh
dCBtb3N0IG9uZSBncm91cC4gVGhlIHBoaWxvc29waHkgb2YNCj4gPiB2ZmlvIGNvbnRhaW5lciBp
cyBoYXZpbmcgYWxsIGdyb3Vwcy9kZXZpY2VzIHdpdGhpbiB0aGUgY29udGFpbmVyIHNoYXJlDQo+
ID4gdGhlIHNhbWUgSU9NTVUgY29udGV4dC4gV2hlbiB2U1ZBIGlzIGVuYWJsZWQsIG9uZSBJT01N
VSBjb250ZXh0IGNvdWxkDQo+ID4gaW5jbHVkZSBvbmUgMm5kLWxldmVsIGFkZHJlc3Mgc3BhY2Ug
YW5kIG11bHRpcGxlIDFzdC1sZXZlbCBhZGRyZXNzIHNwYWNlcy4NCj4gPiBXaGlsZSB0aGUgMm5k
LWxldmVsIGFkZHJlc3Mgc3BhY2UgaXMgcmVhc29uYWJseSBzaGFyYWJsZSBieSBtdWx0aXBsZSBn
cm91cHMNCj4gPiAsIGJsaW5kbHkgc2hhcmluZyAxc3QtbGV2ZWwgYWRkcmVzcyBzcGFjZXMgYWNy
b3NzIGFsbCBncm91cHMgd2l0aGluIHRoZQ0KPiA+IGNvbnRhaW5lciBtaWdodCBpbnN0ZWFkIGJy
ZWFrIHRoZSBndWVzdCBleHBlY3RhdGlvbi4gSW4gdGhlIGZ1dHVyZSBzdWIvDQo+ID4gc3VwZXIg
Y29udGFpbmVyIGNvbmNlcHQgbWlnaHQgYmUgaW50cm9kdWNlZCB0byBhbGxvdyBwYXJ0aWFsIGFk
ZHJlc3Mgc3BhY2UNCj4gPiBzaGFyaW5nIHdpdGhpbiBhbiBJT01NVSBjb250ZXh0LiBCdXQgZm9y
IG5vdyBsZXQncyBnbyB3aXRoIHRoaXMgcmVzdHJpY3Rpb24NCj4gPiBieSByZXF1aXJpbmcgc2lu
Z2xldG9uIGNvbnRhaW5lciBmb3IgdXNpbmcgbmVzdGluZyBpb21tdSBmZWF0dXJlcy4gQmVsb3cN
Cj4gPiBsaW5rIGhhcyB0aGUgcmVsYXRlZCBkaXNjdXNzaW9uIGFib3V0IHRoaXMgZGVjaXNpb24u
DQo+IA0KPiBNYXliZSBhZGQgYSBub3RlIGFib3V0IFNNTVUgcmVsYXRlZCBjaGFuZ2VzIHNwb3R0
ZWQgYnkgSmVhbi4NCg0KSSBndWVzcyB5b3UgbWVhbiB0aGUgY29tbWVudHMgSmVhbiBnYXZlIGlu
IHBhdGNoIDMvMTUsIHJpZ2h0PyBJJ2xsDQpjb3B5IGhpcyBjb21tZW50cyBhbmQgYWxzbyBnaXZl
IHRoZSBiZWxvdyBsaW5rIGFzIHdlbGwuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8y
MDIwMDcxNzA5MDkwMC5HQzQ4NTBAbXlyaWNhLw0KDQo+ID4NCj4gPiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyMC81LzE1LzEwMjgNCj4gPg0KPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4NCj4gPiBDQzogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVs
LmNvbT4NCj4gPiBDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNv
bT4NCj4gPiBDYzogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+IENjOiBK
ZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gPiBDYzog
Sm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+DQo+ID4gQ2M6IEx1IEJhb2x1IDxiYW9sdS5s
dUBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGl1IFlpIEwgPHlpLmwubGl1
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiB2NCAtPiB2NToNCj4gPiAqKSBhZGRyZXNzIGNvbW1l
bnRzIGZyb20gRXJpYyBBdWdlci4NCj4gPiAqKSByZXR1cm4gc3RydWN0IGlvbW11X25lc3Rpbmdf
aW5mbyBmb3INCj4gVkZJT19JT01NVV9UWVBFMV9JTkZPX0NBUF9ORVNUSU5HIGFzDQo+ID4gICAg
Y2FwIGlzIG11Y2ggImNoZWFwIiwgaWYgbmVlZHMgZXh0ZW5zaW9uIGluIGZ1dHVyZSwganVzdCBk
ZWZpbmUgYW5vdGhlciBjYXAuDQo+ID4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLzIw
MjAwNzA4MTMyOTQ3LjViN2VlOTU0QHgxLmhvbWUvDQo+ID4NCj4gPiB2MyAtPiB2NDoNCj4gPiAq
KSBhZGRyZXNzIGNvbW1lbnRzIGFnYWluc3QgdjMuDQo+ID4NCj4gPiB2MSAtPiB2MjoNCj4gPiAq
KSBhZGRlZCBpbiB2Mg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBl
MS5jIHwgMTAyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4g
PiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgICAgICB8ICAxOSArKysrKysrKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVy
cy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYw0KPiA+IGluZGV4IDNiZDcwZmYuLmVkODAxMDQgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMNCj4gPiBAQCAtNjIsMTggKzYyLDIwIEBA
IE1PRFVMRV9QQVJNX0RFU0MoZG1hX2VudHJ5X2xpbWl0LA0KPiA+ICAJCSAiTWF4aW11bSBudW1i
ZXIgb2YgdXNlciBETUEgbWFwcGluZ3MgcGVyIGNvbnRhaW5lciAoNjU1MzUpLiIpOw0KPiA+DQo+
ID4gIHN0cnVjdCB2ZmlvX2lvbW11IHsNCj4gPiAtCXN0cnVjdCBsaXN0X2hlYWQJZG9tYWluX2xp
c3Q7DQo+ID4gLQlzdHJ1Y3QgbGlzdF9oZWFkCWlvdmFfbGlzdDsNCj4gPiAtCXN0cnVjdCB2Zmlv
X2RvbWFpbgkqZXh0ZXJuYWxfZG9tYWluOyAvKiBkb21haW4gZm9yIGV4dGVybmFsIHVzZXIgKi8N
Cj4gPiAtCXN0cnVjdCBtdXRleAkJbG9jazsNCj4gPiAtCXN0cnVjdCByYl9yb290CQlkbWFfbGlz
dDsNCj4gPiAtCXN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkIG5vdGlmaWVyOw0KPiA+IC0J
dW5zaWduZWQgaW50CQlkbWFfYXZhaWw7DQo+ID4gLQl1aW50NjRfdAkJcGdzaXplX2JpdG1hcDsN
Cj4gPiAtCWJvb2wJCQl2MjsNCj4gPiAtCWJvb2wJCQluZXN0aW5nOw0KPiA+IC0JYm9vbAkJCWRp
cnR5X3BhZ2VfdHJhY2tpbmc7DQo+ID4gLQlib29sCQkJcGlubmVkX3BhZ2VfZGlydHlfc2NvcGU7
DQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkCQlkb21haW5fbGlzdDsNCj4gPiArCXN0cnVjdCBsaXN0
X2hlYWQJCWlvdmFfbGlzdDsNCj4gPiArCS8qIGRvbWFpbiBmb3IgZXh0ZXJuYWwgdXNlciAqLw0K
PiA+ICsJc3RydWN0IHZmaW9fZG9tYWluCQkqZXh0ZXJuYWxfZG9tYWluOw0KPiA+ICsJc3RydWN0
IG11dGV4CQkJbG9jazsNCj4gPiArCXN0cnVjdCByYl9yb290CQkJZG1hX2xpc3Q7DQo+ID4gKwlz
dHJ1Y3QgYmxvY2tpbmdfbm90aWZpZXJfaGVhZAlub3RpZmllcjsNCj4gPiArCXVuc2lnbmVkIGlu
dAkJCWRtYV9hdmFpbDsNCj4gPiArCXVpbnQ2NF90CQkJcGdzaXplX2JpdG1hcDsNCj4gPiArCWJv
b2wJCQkJdjI7DQo+ID4gKwlib29sCQkJCW5lc3Rpbmc7DQo+ID4gKwlib29sCQkJCWRpcnR5X3Bh
Z2VfdHJhY2tpbmc7DQo+ID4gKwlib29sCQkJCXBpbm5lZF9wYWdlX2RpcnR5X3Njb3BlOw0KPiA+
ICsJc3RydWN0IGlvbW11X25lc3RpbmdfaW5mbwkqbmVzdGluZ19pbmZvOw0KPiA+ICB9Ow0KPiA+
DQo+ID4gIHN0cnVjdCB2ZmlvX2RvbWFpbiB7DQo+ID4gQEAgLTEzMCw2ICsxMzIsOSBAQCBzdHJ1
Y3QgdmZpb19yZWdpb25zIHsNCj4gPiAgI2RlZmluZSBJU19JT01NVV9DQVBfRE9NQUlOX0lOX0NP
TlRBSU5FUihpb21tdSkJXA0KPiA+ICAJCQkJCSghbGlzdF9lbXB0eSgmaW9tbXUtPmRvbWFpbl9s
aXN0KSkNCj4gPg0KPiA+ICsjZGVmaW5lIENPTlRBSU5FUl9IQVNfRE9NQUlOKGlvbW11KQkoKChp
b21tdSktPmV4dGVybmFsX2RvbWFpbikgfHwgXA0KPiA+ICsJCQkJCSAoIWxpc3RfZW1wdHkoJihp
b21tdSktPmRvbWFpbl9saXN0KSkpDQo+ID4gKw0KPiA+ICAjZGVmaW5lIERJUlRZX0JJVE1BUF9C
WVRFUyhuKQkoQUxJR04obiwgQklUU19QRVJfVFlQRSh1NjQpKSAvDQo+IEJJVFNfUEVSX0JZVEUp
DQo+ID4NCj4gPiAgLyoNCj4gPiBAQCAtMTkyOSw2ICsxOTM0LDEzIEBAIHN0YXRpYyB2b2lkIHZm
aW9faW9tbXVfaW92YV9pbnNlcnRfY29weShzdHJ1Y3QNCj4gdmZpb19pb21tdSAqaW9tbXUsDQo+
ID4NCj4gPiAgCWxpc3Rfc3BsaWNlX3RhaWwoaW92YV9jb3B5LCBpb3ZhKTsNCj4gPiAgfQ0KPiA+
ICsNCj4gPiArc3RhdGljIHZvaWQgdmZpb19pb21tdV9yZWxlYXNlX25lc3RpbmdfaW5mbyhzdHJ1
Y3QgdmZpb19pb21tdSAqaW9tbXUpDQo+ID4gK3sNCj4gPiArCWtmcmVlKGlvbW11LT5uZXN0aW5n
X2luZm8pOw0KPiA+ICsJaW9tbXUtPm5lc3RpbmdfaW5mbyA9IE5VTEw7DQo+ID4gK30NCj4gPiAr
DQo+ID4gIHN0YXRpYyBpbnQgdmZpb19pb21tdV90eXBlMV9hdHRhY2hfZ3JvdXAodm9pZCAqaW9t
bXVfZGF0YSwNCj4gPiAgCQkJCQkgc3RydWN0IGlvbW11X2dyb3VwICppb21tdV9ncm91cCkNCj4g
PiAgew0KPiA+IEBAIC0xOTU5LDYgKzE5NzEsMTIgQEAgc3RhdGljIGludCB2ZmlvX2lvbW11X3R5
cGUxX2F0dGFjaF9ncm91cCh2b2lkDQo+ICppb21tdV9kYXRhLA0KPiA+ICAJCX0NCj4gPiAgCX0N
Cj4gPg0KPiA+ICsJLyogTmVzdGluZyB0eXBlIGNvbnRhaW5lciBjYW4gaW5jbHVkZSBvbmx5IG9u
ZSBncm91cCAqLw0KPiA+ICsJaWYgKGlvbW11LT5uZXN0aW5nICYmIENPTlRBSU5FUl9IQVNfRE9N
QUlOKGlvbW11KSkgew0KPiA+ICsJCW11dGV4X3VubG9jaygmaW9tbXUtPmxvY2spOw0KPiA+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCWdyb3VwID0ga3phbGxvYyhz
aXplb2YoKmdyb3VwKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAlkb21haW4gPSBremFsbG9jKHNpemVv
ZigqZG9tYWluKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAlpZiAoIWdyb3VwIHx8ICFkb21haW4pIHsN
Cj4gPiBAQCAtMjAyOSw2ICsyMDQ3LDMyIEBAIHN0YXRpYyBpbnQgdmZpb19pb21tdV90eXBlMV9h
dHRhY2hfZ3JvdXAodm9pZA0KPiAqaW9tbXVfZGF0YSwNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJ
Z290byBvdXRfZG9tYWluOw0KPiA+DQo+ID4gKwkvKiBOZXN0aW5nIGNhcCBpbmZvIGlzIGF2YWls
YWJsZSBvbmx5IGFmdGVyIGF0dGFjaGluZyAqLw0KPiA+ICsJaWYgKGlvbW11LT5uZXN0aW5nKSB7
DQo+ID4gKwkJc3RydWN0IGlvbW11X25lc3RpbmdfaW5mbyB0bXAgPSB7IC5zaXplID0gMCwgfTsN
Cj4gPiArDQo+ID4gKwkJLyogRmlyc3QgZ2V0IHRoZSBzaXplIG9mIHZlbmRvciBzcGVjaWZpYyBu
ZXN0aW5nIGluZm8gKi8NCj4gPiArCQlyZXQgPSBpb21tdV9kb21haW5fZ2V0X2F0dHIoZG9tYWlu
LT5kb21haW4sDQo+ID4gKwkJCQkJICAgIERPTUFJTl9BVFRSX05FU1RJTkcsDQo+ID4gKwkJCQkJ
ICAgICZ0bXApOw0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCWdvdG8gb3V0X2RldGFjaDsNCj4g
PiArDQo+ID4gKwkJaW9tbXUtPm5lc3RpbmdfaW5mbyA9IGt6YWxsb2ModG1wLnNpemUsIEdGUF9L
RVJORUwpOw0KPiA+ICsJCWlmICghaW9tbXUtPm5lc3RpbmdfaW5mbykgew0KPiA+ICsJCQlyZXQg
PSAtRU5PTUVNOw0KPiA+ICsJCQlnb3RvIG91dF9kZXRhY2g7DQo+ID4gKwkJfQ0KPiA+ICsNCj4g
PiArCQkvKiBOb3cgZ2V0IHRoZSBuZXN0aW5nIGluZm8gKi8NCj4gPiArCQlpb21tdS0+bmVzdGlu
Z19pbmZvLT5zaXplID0gdG1wLnNpemU7DQo+ID4gKwkJcmV0ID0gaW9tbXVfZG9tYWluX2dldF9h
dHRyKGRvbWFpbi0+ZG9tYWluLA0KPiA+ICsJCQkJCSAgICBET01BSU5fQVRUUl9ORVNUSU5HLA0K
PiA+ICsJCQkJCSAgICBpb21tdS0+bmVzdGluZ19pbmZvKTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+
ICsJCQlnb3RvIG91dF9kZXRhY2g7DQoNCmdldCBuZXN0aW5nX2luZm8gZmFpbHVyZSB3aWxsIHJl
c3VsdCBpbiBncm91cF9hdHRhY2ggZmFpbHVyZS5bMV0NCg0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAg
CS8qIEdldCBhcGVydHVyZSBpbmZvICovDQo+ID4gIAlpb21tdV9kb21haW5fZ2V0X2F0dHIoZG9t
YWluLT5kb21haW4sIERPTUFJTl9BVFRSX0dFT01FVFJZLA0KPiAmZ2VvKTsNCj4gPg0KPiA+IEBA
IC0yMTM4LDYgKzIxODIsNyBAQCBzdGF0aWMgaW50IHZmaW9faW9tbXVfdHlwZTFfYXR0YWNoX2dy
b3VwKHZvaWQNCj4gKmlvbW11X2RhdGEsDQo+ID4gIAlyZXR1cm4gMDsNCj4gPg0KPiA+ICBvdXRf
ZGV0YWNoOg0KPiA+ICsJdmZpb19pb21tdV9yZWxlYXNlX25lc3RpbmdfaW5mbyhpb21tdSk7DQo+
ID4gIAl2ZmlvX2lvbW11X2RldGFjaF9ncm91cChkb21haW4sIGdyb3VwKTsNCj4gPiAgb3V0X2Rv
bWFpbjoNCj4gPiAgCWlvbW11X2RvbWFpbl9mcmVlKGRvbWFpbi0+ZG9tYWluKTsNCj4gPiBAQCAt
MjMzOCw2ICsyMzgzLDggQEAgc3RhdGljIHZvaWQgdmZpb19pb21tdV90eXBlMV9kZXRhY2hfZ3Jv
dXAodm9pZA0KPiAqaW9tbXVfZGF0YSwNCj4gPiAgCQkJCQl2ZmlvX2lvbW11X3VubWFwX3VucGlu
X2FsbChpb21tdSk7DQo+ID4gIAkJCQllbHNlDQo+ID4NCj4gCXZmaW9faW9tbXVfdW5tYXBfdW5w
aW5fcmVhY2NvdW50KGlvbW11KTsNCj4gPiArDQo+ID4gKwkJCQl2ZmlvX2lvbW11X3JlbGVhc2Vf
bmVzdGluZ19pbmZvKGlvbW11KTsNCj4gPiAgCQkJfQ0KPiA+ICAJCQlpb21tdV9kb21haW5fZnJl
ZShkb21haW4tPmRvbWFpbik7DQo+ID4gIAkJCWxpc3RfZGVsKCZkb21haW4tPm5leHQpOw0KPiA+
IEBAIC0yNTQ2LDYgKzI1OTMsMzEgQEAgc3RhdGljIGludCB2ZmlvX2lvbW11X21pZ3JhdGlvbl9i
dWlsZF9jYXBzKHN0cnVjdA0KPiB2ZmlvX2lvbW11ICppb21tdSwNCj4gPiAgCXJldHVybiB2Zmlv
X2luZm9fYWRkX2NhcGFiaWxpdHkoY2FwcywgJmNhcF9taWcuaGVhZGVyLCBzaXplb2YoY2FwX21p
ZykpOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCB2ZmlvX2lvbW11X2luZm9fYWRkX25l
c3RpbmdfY2FwKHN0cnVjdCB2ZmlvX2lvbW11ICppb21tdSwNCj4gPiArCQkJCQkgICBzdHJ1Y3Qg
dmZpb19pbmZvX2NhcCAqY2FwcykNCj4gPiArew0KPiA+ICsJc3RydWN0IHZmaW9faW5mb19jYXBf
aGVhZGVyICpoZWFkZXI7DQo+ID4gKwlzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9u
ZXN0aW5nICpuZXN0aW5nX2NhcDsNCj4gPiArCXNpemVfdCBzaXplOw0KPiA+ICsNCj4gPiArCXNp
emUgPSBvZmZzZXRvZihzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9uZXN0aW5nLCBp
bmZvKSArDQo+ID4gKwkJaW9tbXUtPm5lc3RpbmdfaW5mby0+c2l6ZTsNCj4gPiArDQo+ID4gKwlo
ZWFkZXIgPSB2ZmlvX2luZm9fY2FwX2FkZChjYXBzLCBzaXplLA0KPiA+ICsJCQkJICAgVkZJT19J
T01NVV9UWVBFMV9JTkZPX0NBUF9ORVNUSU5HLCAxKTsNCj4gPiArCWlmIChJU19FUlIoaGVhZGVy
KSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihoZWFkZXIpOw0KPiA+ICsNCj4gPiArCW5lc3Rpbmdf
Y2FwID0gY29udGFpbmVyX29mKGhlYWRlciwNCj4gPiArCQkJCSAgIHN0cnVjdCB2ZmlvX2lvbW11
X3R5cGUxX2luZm9fY2FwX25lc3RpbmcsDQo+ID4gKwkJCQkgICBoZWFkZXIpOw0KPiA+ICsNCj4g
PiArCW1lbWNweSgmbmVzdGluZ19jYXAtPmluZm8sIGlvbW11LT5uZXN0aW5nX2luZm8sDQo+ID4g
KwkgICAgICAgaW9tbXUtPm5lc3RpbmdfaW5mby0+c2l6ZSk7DQo+IHlvdSBtdXN0IGNoZWNrIHdo
ZXRoZXIgbmVzdGluZ19pbmZvIGlzIG5vbiBOVUxMIGJlZm9yZSBkb2luZyB0aGF0Lg0KDQppdCdz
IG5vdyB2YWxpZGF0ZWQgaW4gdGhlIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uLiA6LSkNCiANCj4g
QmVzaWRlcyBJIGFncmVlIHdpdGggSmVhbiBvbiB0aGUgZmFjdCBpdCBtYXkgYmUgYmV0dGVyIHRv
IG5vdCByZXBvcnQgdGhlDQo+IGNhcGFiaWxpdHkgaWYgbmVzdGVkIGlzIG5vdCBzdXBwb3J0ZWQu
DQoNCkkgc2VlLiBpbiB0aGlzIHBhdGNoLCBqdXN0IGZldyBsaW5lcyBiZWxvdyBbMl0sIHZmaW8g
b25seSByZXBvcnRzIG5lc3RpbmcNCmNhcCB3aGVuIGlvbW11LT5uZXN0aW5nX2luZm8gaXMgbm9u
LW51bGwuIHNvIGV2ZW4gaWYgdXNlcnNwYWNlIHNlbGVjdGVkDQpuZXN0aW5nIHR5cGUsIGl0IG1h
eSBmYWlsIGF0IHRoZSBWRklPX1NFVF9JT01NVSBwaGFzZSBzaW5jZSBncm91cF9hdHRhY2gNCndp
bGwgYmUgZmFpbGVkIGZvciBORVNURUQgdHlwZSBjb250YWluZXIgaWYgaG9zdCBpb21tdSBkb2Vz
buKAmXQgc3VwcG9ydA0KbmVzdGluZy4gdGhlIGNvZGUgaXMgbWFya2VkIGFzIFsxXSBpbiB0aGlz
IGVtYWlsLg0KDQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0
YXRpYyBpbnQgdmZpb19pb21tdV90eXBlMV9nZXRfaW5mbyhzdHJ1Y3QgdmZpb19pb21tdSAqaW9t
bXUsDQo+ID4gIAkJCQkgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQ0KPiA+ICB7DQo+ID4gQEAgLTI1
ODEsNiArMjY1MywxMiBAQCBzdGF0aWMgaW50IHZmaW9faW9tbXVfdHlwZTFfZ2V0X2luZm8oc3Ry
dWN0DQo+IHZmaW9faW9tbXUgKmlvbW11LA0KPiA+ICAJaWYgKCFyZXQpDQo+ID4gIAkJcmV0ID0g
dmZpb19pb21tdV9pb3ZhX2J1aWxkX2NhcHMoaW9tbXUsICZjYXBzKTsNCj4gPg0KPiA+ICsJaWYg
KGlvbW11LT5uZXN0aW5nX2luZm8pIHsNCj4gPiArCQlyZXQgPSB2ZmlvX2lvbW11X2luZm9fYWRk
X25lc3RpbmdfY2FwKGlvbW11LCAmY2Fwcyk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJcmV0
dXJuIHJldDsNCg0KaGVyZSBjaGVja3MgbmVzdGluZ19pbmZvIGJlZm9yZSByZXBvcnRpbmcgbmVz
dGluZyBjYXAuIFsyXQ0KDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJbXV0ZXhfdW5sb2NrKCZpb21t
dS0+bG9jayk7DQo+ID4NCj4gPiAgCWlmIChyZXQpDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
dWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oDQo+ID4gaW5kZXgg
OTIwNDcwNS4uNDZhNzhhZiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZp
by5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaA0KPiA+IEBAIC0xNCw2ICsx
NCw3IEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9pb2N0bC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4NCj4gPg0KPiA+
ICAjZGVmaW5lIFZGSU9fQVBJX1ZFUlNJT04JMA0KPiA+DQo+ID4gQEAgLTEwMzksNiArMTA0MCwy
NCBAQCBzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9taWdyYXRpb24gew0KPiA+ICAJ
X191NjQJbWF4X2RpcnR5X2JpdG1hcF9zaXplOwkJLyogaW4gYnl0ZXMgKi8NCj4gPiAgfTsNCj4g
Pg0KPiA+ICsvKg0KPiA+ICsgKiBUaGUgbmVzdGluZyBjYXBhYmlsaXR5IGFsbG93cyB0byByZXBv
cnQgdGhlIHJlbGF0ZWQgY2FwYWJpbGl0eQ0KPiA+ICsgKiBhbmQgaW5mbyBmb3IgbmVzdGluZyBp
b21tdSB0eXBlLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGUgc3RydWN0dXJlcyBiZWxvdyBkZWZpbmUg
dmVyc2lvbiAxIG9mIHRoaXMgY2FwYWJpbGl0eS4NCj4gPiArICoNCj4gPiArICogVXNlciBzcGFj
ZSBzZWxlY3RlZCBWRklPX1RZUEUxX05FU1RJTkdfSU9NTVUgdHlwZSBzaG91bGQgY2hlY2sNCj4g
PiArICogdGhpcyBjYXB0byBnZXQgc3VwcG9ydGVkIGZlYXR1cmVzLg0KPiBzL2NhcHRvL2NhcGFi
aWxpdHkgdG8gZ2V0DQoNCmdvdCBpdC4NCg0KUmVnYXJkcywNCllpIExpdQ0KDQo+ID4gKyAqDQo+
ID4gKyAqIEBpbmZvOiB0aGUgbmVzdGluZyBpbmZvIHByb3ZpZGVkIGJ5IElPTU1VIGRyaXZlci4N
Cj4gPiArICovDQo+ID4gKyNkZWZpbmUgVkZJT19JT01NVV9UWVBFMV9JTkZPX0NBUF9ORVNUSU5H
ICAzDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9uZXN0aW5n
IHsNCj4gPiArCXN0cnVjdAl2ZmlvX2luZm9fY2FwX2hlYWRlciBoZWFkZXI7DQo+ID4gKwlzdHJ1
Y3QgaW9tbXVfbmVzdGluZ19pbmZvIGluZm87DQo+ID4gK307DQo+ID4gKw0KPiA+ICAjZGVmaW5l
IFZGSU9fSU9NTVVfR0VUX0lORk8gX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTIpDQo+ID4N
Cj4gPiAgLyoqDQo+ID4NCj4gDQo+IFRoYW5rcw0KPiANCj4gRXJpYw0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
