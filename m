Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B006C225A64
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 10:51:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FC0C85ECE;
	Mon, 20 Jul 2020 08:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soYQH75bqlR7; Mon, 20 Jul 2020 08:51:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4675D85EC0;
	Mon, 20 Jul 2020 08:51:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4051BC016F;
	Mon, 20 Jul 2020 08:51:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F40C016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 11372874E0
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2BupsvaDww5 for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:51:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A8547861F8
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:51:28 +0000 (UTC)
IronPort-SDR: KmlN0+hp37+GFsLS+r0gS1ufn8Si3429cvH+3i1aIpiB5TSf/0VzilKqushrWlot3hBPxXgj4o
 D2xbM03yFlyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="129443299"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="129443299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 01:51:28 -0700
IronPort-SDR: Ac97XU2MaJq/aEH1PE6wbUsBjQySbO1TWR5k+KOQQfrPZUkzL0WniDM3epNDmNCcOH8SJZsfkV
 Ic7BHDHTT+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="391978719"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2020 01:51:28 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jul 2020 01:51:27 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX113.amr.corp.intel.com (10.22.240.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jul 2020 01:51:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jul 2020 01:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH1AYcNBaCxJ2/scoPhpD+wk8GFUF1zTxIS5Q8YJG98/RZVu3pFG7Vzo9oHSiA0yUfZYkWJUnifoDYwKRWBjBp1li+POkaAcjVsDcnetPN1hKG982fHZeWF3Ygl2vZ/FgLY2TgPTYg6o/6H/o7Mr2tT8FueVyJgzuoAEF7Mie9Tt6fY5fscOTl4QHAAEJ9ES0+vhwfbkYtJhTOaS2XzVh2cuKsxiLGQzB6bibRnGw+GkylRTFIlr55/x5hxZlQgpN/0DAW9bE7G6X5oIJFwkqKn3ngiNM7Dbh0dsDupIPRr1VkonMfgq/+jBP7Nc6urTjel/7qRNZdjlt7yW5JmYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA+uhzmt8Y3tBW2EY6+Qn4AOl51MphSbZDGIV18uS34=;
 b=fICTIV7d7cEwTfzFhJNIuKZ/EGxo76IK67vl13RXn/EdJ0ayXGZcfvDfEgfgHoCXFJbkFD2brSIMxolMbV9sWOfI8z/vPx8vv1WcpRyrwGJyrD7wHZ/bLdFvPF4JwZ5zWD6Ts+XxCFpFd1zThhjdvgz5dhTrJYvhJpnBolqwuN2O9vru6TYsc5cNjjfi18uq2At+WFPQbkpzt7C4rsUMa5xK/u6/hSmKDRUSDTTOS62xXc+fBuaWo1Uy1YPEElO4WH0cWrgRafMADWjpC4Fu3HzErGpCZbq4VFUgV4qQX4S0JJI8sDRorEkOwfaOFYVMYkaaKfBbDFzp0uMO0LZ8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA+uhzmt8Y3tBW2EY6+Qn4AOl51MphSbZDGIV18uS34=;
 b=Q4tiV0sCFYb6SD4IRRwmxYM4UxHdImY7knADufOkxp+0pgC55pHqZ4ZsSm0noVf8EwPMvnfaetUNIwxv5RJdb0lbRsksE3zbsPK5HMh56IiKxdwr2UzfB5i0HeglwQGObXsKnIOXRGUx9D9UNc+SC1Ei+D17LQB7CbraXsivJPU=
Received: from DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) by
 DM5PR11MB1996.namprd11.prod.outlook.com (2603:10b6:3:13::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.25; Mon, 20 Jul 2020 08:51:24 +0000
Received: from DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364]) by DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364%10]) with mapi id 15.20.3195.025; Mon, 20 Jul
 2020 08:51:24 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "joro@8bytes.org" <joro@8bytes.org>
Subject: RE: [PATCH v5 04/15] vfio/type1: Report iommu nesting info to
 userspace
Thread-Topic: [PATCH v5 04/15] vfio/type1: Report iommu nesting info to
 userspace
Thread-Index: AQHWWD2mH52kXgEkW0OSi8evIQBECqkMEIoAgAQOHZCAABGvAIAABJyg
Date: Mon, 20 Jul 2020 08:51:24 +0000
Message-ID: <DM5PR11MB1435C2A2F212B73B5F833C32C37B0@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1594552870-55687-1-git-send-email-yi.l.liu@intel.com>
 <1594552870-55687-5-git-send-email-yi.l.liu@intel.com>
 <2eb692fc-a399-8298-4b4b-68adb0357404@redhat.com>
 <DM5PR11MB1435AF9531C5CF29CD1D1251C37B0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <34931d94-b63b-e366-3c7f-9fd85c8e982d@redhat.com>
In-Reply-To: <34931d94-b63b-e366-3c7f-9fd85c8e982d@redhat.com>
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
x-ms-office365-filtering-correlation-id: a060080b-858c-4671-1cf3-08d82c8a156a
x-ms-traffictypediagnostic: DM5PR11MB1996:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1996FCB333FE585AD957FAE3C37B0@DM5PR11MB1996.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4iq4JJTMR/kpQ3X09uSESwpiYZOOcgFZ1t03fOL19XLVakjSuu3iDVsU0KGW8vGzusR5TnX48SJ2SDq0vODivvWm++JeHRoZ9wM79zJ889/5fM25Vj0B5yfQeD4HNVOz0faesBdVOMpRhEQI+QocVAb7VvG6zWwUDAEfXQu8naud4dPC1HAVTzWh4/MMjwI35l3RvtnJpJF6QKvxDP85aFi0VLPRHSHfgZpsJUJaP7vRiC4OUqm8EjukMLaccdjTFGWfvJhrSDT0/Clq7uYd4PrftsfMqaIV1YlR6emCWnuPspiJLpNmn9V3w8FhIqw/GXTuTBiuwgtiZw96Qoqm9gUsWzwE0qdee6BkHT/K5pkixTKMBd+2wRo1B4wyD65uPCWPpS+X1HLpPlwPcK0ctw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1435.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(9686003)(186003)(26005)(316002)(7696005)(55016002)(83380400001)(33656002)(6506007)(4326008)(53546011)(64756008)(8676002)(2906002)(52536014)(8936002)(110136005)(54906003)(71200400001)(5660300002)(966005)(86362001)(76116006)(66446008)(66946007)(7416002)(66476007)(478600001)(30864003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aG18HvN92ifDp08mdiTT27blRddQi5Gh7AEJvEFoTs1dnnvN4fQAmO0VlgSoKMZmZoKwSBGF4ZscToC85GPbtlNX775onn7j76I7WAEzZaiFNuQ/jQ11XHjq+KhA458LH9GwOmfyyFV3bKzS+5e8gt2G+oyBQHnGTitdNkYWnl0md5QM63WcRee+PmbKyoM9SiYTN5/wK5v5zywrn89IROg41yx9NRLtC7j/ot+cK6yP//HSSQIASgW4hcBYGO192+NNxE9ovdFVr9/xq114p6TK/hf9BwN/2ZBtv7jjjCc02ZkXr1als8ZWujhjDssd6au2SScOMFI31Nb5w3FKcghmjtGf3TSpkbPwDT3h0K3OrKJhkH79ztSaS3UbOo7IGu68iYQvWhu3QaTExbZiuPZSvifsn213GCOvpgH69jvIKSf3b07rIvlcsglIYyMJrnUGbWLwG+NieiJ5s99B65yDp99gkxGg6wNfktZBdxGsiVZ2R8UnbdD00709sCGc
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a060080b-858c-4671-1cf3-08d82c8a156a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 08:51:24.7090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDoKCwJbOurPTTAtFfYWxsPdH6xp1kNq7sW+9hRInZTbXlIndryFqAjnVMcXxR6IYJP9YhegAPwqVs0QKNgWdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1996
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
IFNlbnQ6IE1vbmRheSwgSnVseSAyMCwgMjAyMCA0OjMzIFBNDQo+IA0KPiBZaSwNCj4gDQo+IE9u
IDcvMjAvMjAgOTo1MSBBTSwgTGl1LCBZaSBMIHdyb3RlOg0KPiA+IEhpIEVyaWMsDQo+ID4NCj4g
Pj4gRnJvbTogQXVnZXIgRXJpYyA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBT
YXR1cmRheSwgSnVseSAxOCwgMjAyMCAxOjM0IEFNDQo+ID4+DQo+ID4+IFlpLA0KPiA+Pg0KPiA+
PiBPbiA3LzEyLzIwIDE6MjAgUE0sIExpdSBZaSBMIHdyb3RlOg0KPiA+Pj4gVGhpcyBwYXRjaCBl
eHBvcnRzIGlvbW11IG5lc3RpbmcgY2FwYWJpbGl0eSBpbmZvIHRvIHVzZXIgc3BhY2UNCj4gPj4+
IHRocm91Z2ggVkZJTy4gVXNlciBzcGFjZSBpcyBleHBlY3RlZCB0byBjaGVjayB0aGlzIGluZm8g
Zm9yIHN1cHBvcnRlZCB1QVBJcyAoZS5nLg0KPiA+PiBpdCBpcyBub3Qgb25seSB0byBjaGVjayB0
aGUgc3VwcG9ydGVkIHVBUElTIGJ1dCByYXRoZXIgdG8ga25vdyB3aGljaA0KPiA+PiBjYWxsYmFj
a3MgaXQgbXVzdCBjYWxsIHVwb24gdklPTU1VIGV2ZW50cyBhbmQgd2hpY2ggZmVhdHVyZXMgYXJl
DQo+ID4+IHN1cHBvcnRlZCBieSB0aGUgcGh5c2ljYWwgSU9NTVUuDQo+ID4NCj4gPiB5ZXMsIHdp
bGwgcmVmaW5lIHRoZSBkZXNjcmlwdGlvbiBwZXIgeW91ciBjb21tZW50Lg0KPiA+DQo+ID4+PiBQ
QVNJRCBhbGxvYy9mcmVlLCBiaW5kIHBhZ2UgdGFibGUsIGFuZCBjYWNoZSBpbnZhbGlkYXRpb24p
IGFuZCB0aGUNCj4gPj4+IHZlbmRvciBzcGVjaWZpYyBmb3JtYXQgaW5mb3JtYXRpb24gZm9yIGZp
cnN0IGxldmVsL3N0YWdlIHBhZ2UgdGFibGUNCj4gPj4+IHRoYXQgd2lsbCBiZSBib3VuZCB0by4N
Cj4gPj4+DQo+ID4+PiBUaGUgbmVzdGluZyBpbmZvIGlzIGF2YWlsYWJsZSBvbmx5IGFmdGVyIHRo
ZSBuZXN0aW5nIGlvbW11IHR5cGUgaXMNCj4gPj4+IHNldCBmb3IgYSBjb250YWluZXIuDQo+ID4+
IHRvIE5FU1RFRCB0eXBlDQo+ID4NCj4gPiB5b3UgbWVhbiAiVGhlIG5lc3RpbmcgaW5mbyBpcyBh
dmFpbGFibGUgb25seSBhZnRlciBjb250YWluZXIgc2V0IHRvIGJlIE5FU1RFRA0KPiB0eXBlLiIN
Cj4gPg0KPiA+IHJpZ2h0Pw0KPiBjb3JyZWN0DQoNCmdvdCB5b3UuDQoNCj4gPg0KPiA+PiAgQ3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBpbXBvc2VzIG9uZSBsaW1pdGF0aW9uIC0gb25lDQo+ID4+PiBu
ZXN0aW5nIGNvbnRhaW5lciBzaG91bGQgaW5jbHVkZSBhdCBtb3N0IG9uZSBncm91cC4gVGhlIHBo
aWxvc29waHkNCj4gPj4+IG9mIHZmaW8gY29udGFpbmVyIGlzIGhhdmluZyBhbGwgZ3JvdXBzL2Rl
dmljZXMgd2l0aGluIHRoZSBjb250YWluZXINCj4gPj4+IHNoYXJlIHRoZSBzYW1lIElPTU1VIGNv
bnRleHQuIFdoZW4gdlNWQSBpcyBlbmFibGVkLCBvbmUgSU9NTVUNCj4gPj4+IGNvbnRleHQgY291
bGQgaW5jbHVkZSBvbmUgMm5kLWxldmVsIGFkZHJlc3Mgc3BhY2UgYW5kIG11bHRpcGxlIDFzdC1s
ZXZlbCBhZGRyZXNzDQo+IHNwYWNlcy4NCj4gPj4+IFdoaWxlIHRoZSAybmQtbGV2ZWwgYWRkcmVz
cyBzcGFjZSBpcyByZWFzb25hYmx5IHNoYXJhYmxlIGJ5IG11bHRpcGxlDQo+ID4+PiBncm91cHMg
LCBibGluZGx5IHNoYXJpbmcgMXN0LWxldmVsIGFkZHJlc3Mgc3BhY2VzIGFjcm9zcyBhbGwgZ3Jv
dXBzDQo+ID4+PiB3aXRoaW4gdGhlIGNvbnRhaW5lciBtaWdodCBpbnN0ZWFkIGJyZWFrIHRoZSBn
dWVzdCBleHBlY3RhdGlvbi4gSW4NCj4gPj4+IHRoZSBmdXR1cmUgc3ViLyBzdXBlciBjb250YWlu
ZXIgY29uY2VwdCBtaWdodCBiZSBpbnRyb2R1Y2VkIHRvIGFsbG93DQo+ID4+PiBwYXJ0aWFsIGFk
ZHJlc3Mgc3BhY2Ugc2hhcmluZyB3aXRoaW4gYW4gSU9NTVUgY29udGV4dC4gQnV0IGZvciBub3cN
Cj4gPj4+IGxldCdzIGdvIHdpdGggdGhpcyByZXN0cmljdGlvbiBieSByZXF1aXJpbmcgc2luZ2xl
dG9uIGNvbnRhaW5lciBmb3INCj4gPj4+IHVzaW5nIG5lc3RpbmcgaW9tbXUgZmVhdHVyZXMuIEJl
bG93IGxpbmsgaGFzIHRoZSByZWxhdGVkIGRpc2N1c3Npb24gYWJvdXQgdGhpcw0KPiBkZWNpc2lv
bi4NCj4gPj4NCj4gPj4gTWF5YmUgYWRkIGEgbm90ZSBhYm91dCBTTU1VIHJlbGF0ZWQgY2hhbmdl
cyBzcG90dGVkIGJ5IEplYW4uDQo+ID4NCj4gPiBJIGd1ZXNzIHlvdSBtZWFuIHRoZSBjb21tZW50
cyBKZWFuIGdhdmUgaW4gcGF0Y2ggMy8xNSwgcmlnaHQ/IEknbGwNCj4gPiBjb3B5IGhpcyBjb21t
ZW50cyBhbmQgYWxzbyBnaXZlIHRoZSBiZWxvdyBsaW5rIGFzIHdlbGwuDQo+ID4NCj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyMDA3MTcwOTA5MDAuR0M0ODUwQG15cmljYS8NCj4g
Y29ycmVjdA0KDQpJIHNlZS4NCg0KUmVnYXJkcywNCllpIExpdQ0KDQo+IFRoYW5rcw0KPiANCj4g
RXJpYw0KPiA+DQo+ID4+Pg0KPiA+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNS8xNS8x
MDI4DQo+ID4+Pg0KPiA+Pj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
PiA+Pj4gQ0M6IEphY29iIFBhbiA8amFjb2IuanVuLnBhbkBsaW51eC5pbnRlbC5jb20+DQo+ID4+
PiBDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4NCj4gPj4+
IENjOiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+ID4+PiBDYzogSmVhbi1Q
aGlsaXBwZSBCcnVja2VyIDxqZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc+DQo+ID4+PiBDYzogSm9l
cmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+DQo+ID4+PiBDYzogTHUgQmFvbHUgPGJhb2x1Lmx1
QGxpbnV4LmludGVsLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IExpdSBZaSBMIDx5aS5sLmxp
dUBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IHY0IC0+IHY1Og0KPiA+Pj4gKikgYWRkcmVz
cyBjb21tZW50cyBmcm9tIEVyaWMgQXVnZXIuDQo+ID4+PiAqKSByZXR1cm4gc3RydWN0IGlvbW11
X25lc3RpbmdfaW5mbyBmb3INCj4gPj4gVkZJT19JT01NVV9UWVBFMV9JTkZPX0NBUF9ORVNUSU5H
IGFzDQo+ID4+PiAgICBjYXAgaXMgbXVjaCAiY2hlYXAiLCBpZiBuZWVkcyBleHRlbnNpb24gaW4g
ZnV0dXJlLCBqdXN0IGRlZmluZSBhbm90aGVyIGNhcC4NCj4gPj4+ICAgIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2t2bS8yMDIwMDcwODEzMjk0Ny41YjdlZTk1NEB4MS5ob21lLw0KPiA+Pj4NCj4g
Pj4+IHYzIC0+IHY0Og0KPiA+Pj4gKikgYWRkcmVzcyBjb21tZW50cyBhZ2FpbnN0IHYzLg0KPiA+
Pj4NCj4gPj4+IHYxIC0+IHYyOg0KPiA+Pj4gKikgYWRkZWQgaW4gdjINCj4gPj4+IC0tLQ0KPiA+
Pj4gIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAxMDINCj4gPj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+Pj4gIGluY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmggICAgICAgfCAgMTkgKysrKysrKysNCj4gPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDEw
OSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYw0KPiA+Pj4gYi9kcml2ZXJzL3ZmaW8v
dmZpb19pb21tdV90eXBlMS5jIGluZGV4IDNiZDcwZmYuLmVkODAxMDQgMTAwNjQ0DQo+ID4+PiAt
LS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jDQo+ID4+PiArKysgYi9kcml2ZXJz
L3ZmaW8vdmZpb19pb21tdV90eXBlMS5jDQo+ID4+PiBAQCAtNjIsMTggKzYyLDIwIEBAIE1PRFVM
RV9QQVJNX0RFU0MoZG1hX2VudHJ5X2xpbWl0LA0KPiA+Pj4gIAkJICJNYXhpbXVtIG51bWJlciBv
ZiB1c2VyIERNQSBtYXBwaW5ncyBwZXIgY29udGFpbmVyICg2NTUzNSkuIik7DQo+ID4+Pg0KPiA+
Pj4gIHN0cnVjdCB2ZmlvX2lvbW11IHsNCj4gPj4+IC0Jc3RydWN0IGxpc3RfaGVhZAlkb21haW5f
bGlzdDsNCj4gPj4+IC0Jc3RydWN0IGxpc3RfaGVhZAlpb3ZhX2xpc3Q7DQo+ID4+PiAtCXN0cnVj
dCB2ZmlvX2RvbWFpbgkqZXh0ZXJuYWxfZG9tYWluOyAvKiBkb21haW4gZm9yIGV4dGVybmFsIHVz
ZXIgKi8NCj4gPj4+IC0Jc3RydWN0IG11dGV4CQlsb2NrOw0KPiA+Pj4gLQlzdHJ1Y3QgcmJfcm9v
dAkJZG1hX2xpc3Q7DQo+ID4+PiAtCXN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkIG5vdGlm
aWVyOw0KPiA+Pj4gLQl1bnNpZ25lZCBpbnQJCWRtYV9hdmFpbDsNCj4gPj4+IC0JdWludDY0X3QJ
CXBnc2l6ZV9iaXRtYXA7DQo+ID4+PiAtCWJvb2wJCQl2MjsNCj4gPj4+IC0JYm9vbAkJCW5lc3Rp
bmc7DQo+ID4+PiAtCWJvb2wJCQlkaXJ0eV9wYWdlX3RyYWNraW5nOw0KPiA+Pj4gLQlib29sCQkJ
cGlubmVkX3BhZ2VfZGlydHlfc2NvcGU7DQo+ID4+PiArCXN0cnVjdCBsaXN0X2hlYWQJCWRvbWFp
bl9saXN0Ow0KPiA+Pj4gKwlzdHJ1Y3QgbGlzdF9oZWFkCQlpb3ZhX2xpc3Q7DQo+ID4+PiArCS8q
IGRvbWFpbiBmb3IgZXh0ZXJuYWwgdXNlciAqLw0KPiA+Pj4gKwlzdHJ1Y3QgdmZpb19kb21haW4J
CSpleHRlcm5hbF9kb21haW47DQo+ID4+PiArCXN0cnVjdCBtdXRleAkJCWxvY2s7DQo+ID4+PiAr
CXN0cnVjdCByYl9yb290CQkJZG1hX2xpc3Q7DQo+ID4+PiArCXN0cnVjdCBibG9ja2luZ19ub3Rp
Zmllcl9oZWFkCW5vdGlmaWVyOw0KPiA+Pj4gKwl1bnNpZ25lZCBpbnQJCQlkbWFfYXZhaWw7DQo+
ID4+PiArCXVpbnQ2NF90CQkJcGdzaXplX2JpdG1hcDsNCj4gPj4+ICsJYm9vbAkJCQl2MjsNCj4g
Pj4+ICsJYm9vbAkJCQluZXN0aW5nOw0KPiA+Pj4gKwlib29sCQkJCWRpcnR5X3BhZ2VfdHJhY2tp
bmc7DQo+ID4+PiArCWJvb2wJCQkJcGlubmVkX3BhZ2VfZGlydHlfc2NvcGU7DQo+ID4+PiArCXN0
cnVjdCBpb21tdV9uZXN0aW5nX2luZm8JKm5lc3RpbmdfaW5mbzsNCj4gPj4+ICB9Ow0KPiA+Pj4N
Cj4gPj4+ICBzdHJ1Y3QgdmZpb19kb21haW4gew0KPiA+Pj4gQEAgLTEzMCw2ICsxMzIsOSBAQCBz
dHJ1Y3QgdmZpb19yZWdpb25zIHsNCj4gPj4+ICAjZGVmaW5lIElTX0lPTU1VX0NBUF9ET01BSU5f
SU5fQ09OVEFJTkVSKGlvbW11KQlcDQo+ID4+PiAgCQkJCQkoIWxpc3RfZW1wdHkoJmlvbW11LT5k
b21haW5fbGlzdCkpDQo+ID4+Pg0KPiA+Pj4gKyNkZWZpbmUgQ09OVEFJTkVSX0hBU19ET01BSU4o
aW9tbXUpCSgoKGlvbW11KS0NCj4gPmV4dGVybmFsX2RvbWFpbikgfHwgXA0KPiA+Pj4gKwkJCQkJ
ICghbGlzdF9lbXB0eSgmKGlvbW11KS0+ZG9tYWluX2xpc3QpKSkNCj4gPj4+ICsNCj4gPj4+ICAj
ZGVmaW5lIERJUlRZX0JJVE1BUF9CWVRFUyhuKQkoQUxJR04obiwgQklUU19QRVJfVFlQRSh1NjQp
KSAvDQo+ID4+IEJJVFNfUEVSX0JZVEUpDQo+ID4+Pg0KPiA+Pj4gIC8qDQo+ID4+PiBAQCAtMTky
OSw2ICsxOTM0LDEzIEBAIHN0YXRpYyB2b2lkDQo+ID4+PiB2ZmlvX2lvbW11X2lvdmFfaW5zZXJ0
X2NvcHkoc3RydWN0DQo+ID4+IHZmaW9faW9tbXUgKmlvbW11LA0KPiA+Pj4NCj4gPj4+ICAJbGlz
dF9zcGxpY2VfdGFpbChpb3ZhX2NvcHksIGlvdmEpOyAgfQ0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRp
YyB2b2lkIHZmaW9faW9tbXVfcmVsZWFzZV9uZXN0aW5nX2luZm8oc3RydWN0IHZmaW9faW9tbXUN
Cj4gPj4+ICsqaW9tbXUpIHsNCj4gPj4+ICsJa2ZyZWUoaW9tbXUtPm5lc3RpbmdfaW5mbyk7DQo+
ID4+PiArCWlvbW11LT5uZXN0aW5nX2luZm8gPSBOVUxMOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4g
Pj4+ICBzdGF0aWMgaW50IHZmaW9faW9tbXVfdHlwZTFfYXR0YWNoX2dyb3VwKHZvaWQgKmlvbW11
X2RhdGEsDQo+ID4+PiAgCQkJCQkgc3RydWN0IGlvbW11X2dyb3VwICppb21tdV9ncm91cCkNCj4g
eyBAQCAtMTk1OSw2ICsxOTcxLDEyIEBADQo+ID4+PiBzdGF0aWMgaW50IHZmaW9faW9tbXVfdHlw
ZTFfYXR0YWNoX2dyb3VwKHZvaWQNCj4gPj4gKmlvbW11X2RhdGEsDQo+ID4+PiAgCQl9DQo+ID4+
PiAgCX0NCj4gPj4+DQo+ID4+PiArCS8qIE5lc3RpbmcgdHlwZSBjb250YWluZXIgY2FuIGluY2x1
ZGUgb25seSBvbmUgZ3JvdXAgKi8NCj4gPj4+ICsJaWYgKGlvbW11LT5uZXN0aW5nICYmIENPTlRB
SU5FUl9IQVNfRE9NQUlOKGlvbW11KSkgew0KPiA+Pj4gKwkJbXV0ZXhfdW5sb2NrKCZpb21tdS0+
bG9jayk7DQo+ID4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsJfQ0KPiA+Pj4gKw0KPiA+
Pj4gIAlncm91cCA9IGt6YWxsb2Moc2l6ZW9mKCpncm91cCksIEdGUF9LRVJORUwpOw0KPiA+Pj4g
IAlkb21haW4gPSBremFsbG9jKHNpemVvZigqZG9tYWluKSwgR0ZQX0tFUk5FTCk7DQo+ID4+PiAg
CWlmICghZ3JvdXAgfHwgIWRvbWFpbikgew0KPiA+Pj4gQEAgLTIwMjksNiArMjA0NywzMiBAQCBz
dGF0aWMgaW50IHZmaW9faW9tbXVfdHlwZTFfYXR0YWNoX2dyb3VwKHZvaWQNCj4gPj4gKmlvbW11
X2RhdGEsDQo+ID4+PiAgCWlmIChyZXQpDQo+ID4+PiAgCQlnb3RvIG91dF9kb21haW47DQo+ID4+
Pg0KPiA+Pj4gKwkvKiBOZXN0aW5nIGNhcCBpbmZvIGlzIGF2YWlsYWJsZSBvbmx5IGFmdGVyIGF0
dGFjaGluZyAqLw0KPiA+Pj4gKwlpZiAoaW9tbXUtPm5lc3RpbmcpIHsNCj4gPj4+ICsJCXN0cnVj
dCBpb21tdV9uZXN0aW5nX2luZm8gdG1wID0geyAuc2l6ZSA9IDAsIH07DQo+ID4+PiArDQo+ID4+
PiArCQkvKiBGaXJzdCBnZXQgdGhlIHNpemUgb2YgdmVuZG9yIHNwZWNpZmljIG5lc3RpbmcgaW5m
byAqLw0KPiA+Pj4gKwkJcmV0ID0gaW9tbXVfZG9tYWluX2dldF9hdHRyKGRvbWFpbi0+ZG9tYWlu
LA0KPiA+Pj4gKwkJCQkJICAgIERPTUFJTl9BVFRSX05FU1RJTkcsDQo+ID4+PiArCQkJCQkgICAg
JnRtcCk7DQo+ID4+PiArCQlpZiAocmV0KQ0KPiA+Pj4gKwkJCWdvdG8gb3V0X2RldGFjaDsNCj4g
Pj4+ICsNCj4gPj4+ICsJCWlvbW11LT5uZXN0aW5nX2luZm8gPSBremFsbG9jKHRtcC5zaXplLCBH
RlBfS0VSTkVMKTsNCj4gPj4+ICsJCWlmICghaW9tbXUtPm5lc3RpbmdfaW5mbykgew0KPiA+Pj4g
KwkJCXJldCA9IC1FTk9NRU07DQo+ID4+PiArCQkJZ290byBvdXRfZGV0YWNoOw0KPiA+Pj4gKwkJ
fQ0KPiA+Pj4gKw0KPiA+Pj4gKwkJLyogTm93IGdldCB0aGUgbmVzdGluZyBpbmZvICovDQo+ID4+
PiArCQlpb21tdS0+bmVzdGluZ19pbmZvLT5zaXplID0gdG1wLnNpemU7DQo+ID4+PiArCQlyZXQg
PSBpb21tdV9kb21haW5fZ2V0X2F0dHIoZG9tYWluLT5kb21haW4sDQo+ID4+PiArCQkJCQkgICAg
RE9NQUlOX0FUVFJfTkVTVElORywNCj4gPj4+ICsJCQkJCSAgICBpb21tdS0+bmVzdGluZ19pbmZv
KTsNCj4gPj4+ICsJCWlmIChyZXQpDQo+ID4+PiArCQkJZ290byBvdXRfZGV0YWNoOw0KPiA+DQo+
ID4gZ2V0IG5lc3RpbmdfaW5mbyBmYWlsdXJlIHdpbGwgcmVzdWx0IGluIGdyb3VwX2F0dGFjaCBm
YWlsdXJlLlsxXQ0KPiA+DQo+ID4+PiArCX0NCj4gPj4+ICsNCj4gPj4+ICAJLyogR2V0IGFwZXJ0
dXJlIGluZm8gKi8NCj4gPj4+ICAJaW9tbXVfZG9tYWluX2dldF9hdHRyKGRvbWFpbi0+ZG9tYWlu
LCBET01BSU5fQVRUUl9HRU9NRVRSWSwNCj4gPj4gJmdlbyk7DQo+ID4+Pg0KPiA+Pj4gQEAgLTIx
MzgsNiArMjE4Miw3IEBAIHN0YXRpYyBpbnQgdmZpb19pb21tdV90eXBlMV9hdHRhY2hfZ3JvdXAo
dm9pZA0KPiA+PiAqaW9tbXVfZGF0YSwNCj4gPj4+ICAJcmV0dXJuIDA7DQo+ID4+Pg0KPiA+Pj4g
IG91dF9kZXRhY2g6DQo+ID4+PiArCXZmaW9faW9tbXVfcmVsZWFzZV9uZXN0aW5nX2luZm8oaW9t
bXUpOw0KPiA+Pj4gIAl2ZmlvX2lvbW11X2RldGFjaF9ncm91cChkb21haW4sIGdyb3VwKTsNCj4g
Pj4+ICBvdXRfZG9tYWluOg0KPiA+Pj4gIAlpb21tdV9kb21haW5fZnJlZShkb21haW4tPmRvbWFp
bik7DQo+ID4+PiBAQCAtMjMzOCw2ICsyMzgzLDggQEAgc3RhdGljIHZvaWQgdmZpb19pb21tdV90
eXBlMV9kZXRhY2hfZ3JvdXAodm9pZA0KPiA+PiAqaW9tbXVfZGF0YSwNCj4gPj4+ICAJCQkJCXZm
aW9faW9tbXVfdW5tYXBfdW5waW5fYWxsKGlvbW11KTsNCj4gPj4+ICAJCQkJZWxzZQ0KPiA+Pj4N
Cj4gPj4gCXZmaW9faW9tbXVfdW5tYXBfdW5waW5fcmVhY2NvdW50KGlvbW11KTsNCj4gPj4+ICsN
Cj4gPj4+ICsJCQkJdmZpb19pb21tdV9yZWxlYXNlX25lc3RpbmdfaW5mbyhpb21tdSk7DQo+ID4+
PiAgCQkJfQ0KPiA+Pj4gIAkJCWlvbW11X2RvbWFpbl9mcmVlKGRvbWFpbi0+ZG9tYWluKTsNCj4g
Pj4+ICAJCQlsaXN0X2RlbCgmZG9tYWluLT5uZXh0KTsNCj4gPj4+IEBAIC0yNTQ2LDYgKzI1OTMs
MzEgQEAgc3RhdGljIGludA0KPiA+Pj4gdmZpb19pb21tdV9taWdyYXRpb25fYnVpbGRfY2Fwcyhz
dHJ1Y3QNCj4gPj4gdmZpb19pb21tdSAqaW9tbXUsDQo+ID4+PiAgCXJldHVybiB2ZmlvX2luZm9f
YWRkX2NhcGFiaWxpdHkoY2FwcywgJmNhcF9taWcuaGVhZGVyLA0KPiA+Pj4gc2l6ZW9mKGNhcF9t
aWcpKTsgIH0NCj4gPj4+DQo+ID4+PiArc3RhdGljIGludCB2ZmlvX2lvbW11X2luZm9fYWRkX25l
c3RpbmdfY2FwKHN0cnVjdCB2ZmlvX2lvbW11ICppb21tdSwNCj4gPj4+ICsJCQkJCSAgIHN0cnVj
dCB2ZmlvX2luZm9fY2FwICpjYXBzKSB7DQo+ID4+PiArCXN0cnVjdCB2ZmlvX2luZm9fY2FwX2hl
YWRlciAqaGVhZGVyOw0KPiA+Pj4gKwlzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9u
ZXN0aW5nICpuZXN0aW5nX2NhcDsNCj4gPj4+ICsJc2l6ZV90IHNpemU7DQo+ID4+PiArDQo+ID4+
PiArCXNpemUgPSBvZmZzZXRvZihzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9uZXN0
aW5nLCBpbmZvKSArDQo+ID4+PiArCQlpb21tdS0+bmVzdGluZ19pbmZvLT5zaXplOw0KPiA+Pj4g
Kw0KPiA+Pj4gKwloZWFkZXIgPSB2ZmlvX2luZm9fY2FwX2FkZChjYXBzLCBzaXplLA0KPiA+Pj4g
KwkJCQkgICBWRklPX0lPTU1VX1RZUEUxX0lORk9fQ0FQX05FU1RJTkcsIDEpOw0KPiA+Pj4gKwlp
ZiAoSVNfRVJSKGhlYWRlcikpDQo+ID4+PiArCQlyZXR1cm4gUFRSX0VSUihoZWFkZXIpOw0KPiA+
Pj4gKw0KPiA+Pj4gKwluZXN0aW5nX2NhcCA9IGNvbnRhaW5lcl9vZihoZWFkZXIsDQo+ID4+PiAr
CQkJCSAgIHN0cnVjdCB2ZmlvX2lvbW11X3R5cGUxX2luZm9fY2FwX25lc3RpbmcsDQo+ID4+PiAr
CQkJCSAgIGhlYWRlcik7DQo+ID4+PiArDQo+ID4+PiArCW1lbWNweSgmbmVzdGluZ19jYXAtPmlu
Zm8sIGlvbW11LT5uZXN0aW5nX2luZm8sDQo+ID4+PiArCSAgICAgICBpb21tdS0+bmVzdGluZ19p
bmZvLT5zaXplKTsNCj4gPj4geW91IG11c3QgY2hlY2sgd2hldGhlciBuZXN0aW5nX2luZm8gaXMg
bm9uIE5VTEwgYmVmb3JlIGRvaW5nIHRoYXQuDQo+ID4NCj4gPiBpdCdzIG5vdyB2YWxpZGF0ZWQg
aW4gdGhlIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uLiA6LSkNCj4gYWggb2sgc29ycnkgSSBtaXNz
ZWQgdGhhdC4NCj4gPg0KPiA+PiBCZXNpZGVzIEkgYWdyZWUgd2l0aCBKZWFuIG9uIHRoZSBmYWN0
IGl0IG1heSBiZSBiZXR0ZXIgdG8gbm90IHJlcG9ydA0KPiA+PiB0aGUgY2FwYWJpbGl0eSBpZiBu
ZXN0ZWQgaXMgbm90IHN1cHBvcnRlZC4NCj4gPg0KPiA+IEkgc2VlLiBpbiB0aGlzIHBhdGNoLCBq
dXN0IGZldyBsaW5lcyBiZWxvdyBbMl0sIHZmaW8gb25seSByZXBvcnRzDQo+ID4gbmVzdGluZyBj
YXAgd2hlbiBpb21tdS0+bmVzdGluZ19pbmZvIGlzIG5vbi1udWxsLiBzbyBldmVuIGlmIHVzZXJz
cGFjZQ0KPiA+IHNlbGVjdGVkIG5lc3RpbmcgdHlwZSwgaXQgbWF5IGZhaWwgYXQgdGhlIFZGSU9f
U0VUX0lPTU1VIHBoYXNlIHNpbmNlDQo+ID4gZ3JvdXBfYXR0YWNoIHdpbGwgYmUgZmFpbGVkIGZv
ciBORVNURUQgdHlwZSBjb250YWluZXIgaWYgaG9zdCBpb21tdQ0KPiA+IGRvZXNu4oCZdCBzdXBw
b3J0IG5lc3RpbmcuIHRoZSBjb2RlIGlzIG1hcmtlZCBhcyBbMV0gaW4gdGhpcyBlbWFpbC4NCj4g
T0sgdGhhdCdzIGFscmVhZHkgdGhlcmUgdGhlbi4NCj4NCj4gVGhhbmtzDQo+IA0KPiBFcmljDQo+
ID4NCj4gPj4+ICsNCj4gPj4+ICsJcmV0dXJuIDA7DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4g
IHN0YXRpYyBpbnQgdmZpb19pb21tdV90eXBlMV9nZXRfaW5mbyhzdHJ1Y3QgdmZpb19pb21tdSAq
aW9tbXUsDQo+ID4+PiAgCQkJCSAgICAgdW5zaWduZWQgbG9uZyBhcmcpDQo+ID4+PiAgew0KPiA+
Pj4gQEAgLTI1ODEsNiArMjY1MywxMiBAQCBzdGF0aWMgaW50IHZmaW9faW9tbXVfdHlwZTFfZ2V0
X2luZm8oc3RydWN0DQo+ID4+IHZmaW9faW9tbXUgKmlvbW11LA0KPiA+Pj4gIAlpZiAoIXJldCkN
Cj4gPj4+ICAJCXJldCA9IHZmaW9faW9tbXVfaW92YV9idWlsZF9jYXBzKGlvbW11LCAmY2Fwcyk7
DQo+ID4+Pg0KPiA+Pj4gKwlpZiAoaW9tbXUtPm5lc3RpbmdfaW5mbykgew0KPiA+Pj4gKwkJcmV0
ID0gdmZpb19pb21tdV9pbmZvX2FkZF9uZXN0aW5nX2NhcChpb21tdSwgJmNhcHMpOw0KPiA+Pj4g
KwkJaWYgKHJldCkNCj4gPj4+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gaGVyZSBjaGVja3Mg
bmVzdGluZ19pbmZvIGJlZm9yZSByZXBvcnRpbmcgbmVzdGluZyBjYXAuIFsyXQ0KPiA+DQo+ID4+
PiArCX0NCj4gPj4+ICsNCj4gPj4+ICAJbXV0ZXhfdW5sb2NrKCZpb21tdS0+bG9jayk7DQo+ID4+
Pg0KPiA+Pj4gIAlpZiAocmV0KQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oDQo+ID4+PiBpbmRleCA5MjA0NzA1
Li40NmE3OGFmIDEwMDY0NA0KPiA+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaA0K
PiA+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaA0KPiA+Pj4gQEAgLTE0LDYgKzE0
LDcgQEANCj4gPj4+DQo+ID4+PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4+PiAgI2lu
Y2x1ZGUgPGxpbnV4L2lvY3RsLmg+DQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+DQo+
ID4+Pg0KPiA+Pj4gICNkZWZpbmUgVkZJT19BUElfVkVSU0lPTgkwDQo+ID4+Pg0KPiA+Pj4gQEAg
LTEwMzksNiArMTA0MCwyNCBAQCBzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvX2NhcF9taWdy
YXRpb24gew0KPiA+Pj4gIAlfX3U2NAltYXhfZGlydHlfYml0bWFwX3NpemU7CQkvKiBpbiBieXRl
cyAqLw0KPiA+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gKy8qDQo+ID4+PiArICogVGhlIG5lc3Rpbmcg
Y2FwYWJpbGl0eSBhbGxvd3MgdG8gcmVwb3J0IHRoZSByZWxhdGVkIGNhcGFiaWxpdHkNCj4gPj4+
ICsgKiBhbmQgaW5mbyBmb3IgbmVzdGluZyBpb21tdSB0eXBlLg0KPiA+Pj4gKyAqDQo+ID4+PiAr
ICogVGhlIHN0cnVjdHVyZXMgYmVsb3cgZGVmaW5lIHZlcnNpb24gMSBvZiB0aGlzIGNhcGFiaWxp
dHkuDQo+ID4+PiArICoNCj4gPj4+ICsgKiBVc2VyIHNwYWNlIHNlbGVjdGVkIFZGSU9fVFlQRTFf
TkVTVElOR19JT01NVSB0eXBlIHNob3VsZCBjaGVjaw0KPiA+Pj4gKyAqIHRoaXMgY2FwdG8gZ2V0
IHN1cHBvcnRlZCBmZWF0dXJlcy4NCj4gPj4gcy9jYXB0by9jYXBhYmlsaXR5IHRvIGdldA0KPiA+
DQo+ID4gZ290IGl0Lg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBZaSBMaXUNCj4gPg0KPiA+Pj4g
KyAqDQo+ID4+PiArICogQGluZm86IHRoZSBuZXN0aW5nIGluZm8gcHJvdmlkZWQgYnkgSU9NTVUg
ZHJpdmVyLg0KPiA+Pj4gKyAqLw0KPiA+Pj4gKyNkZWZpbmUgVkZJT19JT01NVV9UWVBFMV9JTkZP
X0NBUF9ORVNUSU5HICAzDQo+ID4+PiArDQo+ID4+PiArc3RydWN0IHZmaW9faW9tbXVfdHlwZTFf
aW5mb19jYXBfbmVzdGluZyB7DQo+ID4+PiArCXN0cnVjdAl2ZmlvX2luZm9fY2FwX2hlYWRlciBo
ZWFkZXI7DQo+ID4+PiArCXN0cnVjdCBpb21tdV9uZXN0aW5nX2luZm8gaW5mbzsNCj4gPj4+ICt9
Ow0KPiA+Pj4gKw0KPiA+Pj4gICNkZWZpbmUgVkZJT19JT01NVV9HRVRfSU5GTyBfSU8oVkZJT19U
WVBFLCBWRklPX0JBU0UgKyAxMikNCj4gPj4+DQo+ID4+PiAgLyoqDQo+ID4+Pg0KPiA+Pg0KPiA+
PiBUaGFua3MNCj4gPj4NCj4gPj4gRXJpYw0KPiA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9pb21tdQ==
