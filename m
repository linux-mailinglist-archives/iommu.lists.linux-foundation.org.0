Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030F312FB
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 18:48:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35FDA17AC;
	Fri, 31 May 2019 16:48:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 36DB9175D
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 16:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5EB775F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oX44ziWmEph5ufOyRc7xIddIakQ4mqQV5NsPkZ0UQUo=;
	b=CfkE4HLlmpdY330PqqAV6tF4t/sFd55XUvMgJoOCQoyMPyW0KvrKXqX9NvMr7xLax4GAWrOOTXAu3PRfV/uiO+PnVlN6tG3QZ+xsIUuBvzp1sho87CFRz4LjxPnm6FTmMjJCSB29OADadzZqsthaqB+t12LAoMyI7ZRMGOyZPrY=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.50.159) by
	VI1PR04MB6254.eurprd04.prod.outlook.com (20.179.25.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.20; Fri, 31 May 2019 16:46:57 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::8d0e:de86:9b49:b40]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::8d0e:de86:9b49:b40%7]) with mapi id 15.20.1922.024;
	Fri, 31 May 2019 16:46:57 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: RE: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Thread-Topic: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Thread-Index: AQHVFvLAUsVmmx2jaE2ZHLZY1pGN66aFajIAgAAH5dA=
Date: Fri, 31 May 2019 16:46:57 +0000
Message-ID: <VI1PR04MB5134BFA391D8FF013762882FEC190@VI1PR04MB5134.eurprd04.prod.outlook.com>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
	<d086216f-f3fc-c88a-3891-81e84e8bdb01@suse.de>
In-Reply-To: <d086216f-f3fc-c88a-3891-81e84e8bdb01@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-originating-ip: [192.88.166.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61349436-142e-4e7d-a13f-08d6e5e79876
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR04MB6254; 
x-ms-traffictypediagnostic: VI1PR04MB6254:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB6254BEEDEEE9619A3981F5D9EC190@VI1PR04MB6254.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(13464003)(26005)(66556008)(6506007)(81166006)(8676002)(5660300002)(68736007)(8936002)(14444005)(102836004)(64756008)(446003)(76116006)(81156014)(6246003)(229853002)(7736002)(66476007)(33656002)(14454004)(66446008)(66946007)(73956011)(99286004)(9686003)(71190400001)(305945005)(71200400001)(6436002)(76176011)(7696005)(6116002)(3846002)(53936002)(25786009)(54906003)(86362001)(2906002)(66574012)(55016002)(486006)(11346002)(74316002)(316002)(186003)(44832011)(52536014)(476003)(478600001)(4326008)(256004)(4744005)(66066001)(6916009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6254;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F+XQXjwWCSXRL+zgQQnOITyfdHhqKI/LUALGucfpyAjYQ1qx2g3wUTQ3Ya9utXqc3Dbr9ct1QcfVS62ew4CGtpUiv0THWt4Lt33n5Bt2e9lOx1CZ8cRfTXAkFXBdAbaBDm65SS65FoL2180jgrXe5gjzqfTY9SHXda8pGNNgxcgt7HQWqULgQtO/Xj3s3a23t8hHBVtA3BhXVW156Uur3y0buBI/4mznXJXmnCercBNr6s3nLzb57LPmLmB8k3JzlG/UGGvJU2BNSn4c2ShUhFD+nALd2QuB22ElP7PxlwvW09HqXnoMui5cp7GjBd5oDqoQ/aIDl5+nW3qSIBR5BMDFhQ7jBX7YRu/jF+1V8InSrPSP6684mgP2b0UieT0nvXjjLnCiT4s6F80cfql4aUQFdV/e/SbDQiSi4wMTCuk=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61349436-142e-4e7d-a13f-08d6e5e79876
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 16:46:57.4732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurentiu.tudor@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6254
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Roy Pledge <roy.pledge@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leo Li <leoyang.li@nxp.com>,
	"jocke@infinera.com" <joakim.tjernlund@infinera.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Camelia Alexandra Groza <camelia.groza@nxp.com>,
	Mian Yousaf Kaukab <yousaf.kaukab@suse.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

SGVsbG8gQW5kcmVhcywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBB
bmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDMx
LCAyMDE5IDc6MTUgUE0NCj4gDQo+IEhpIExhdXJlbnRpdSwNCj4gDQo+IEFtIDMwLjA1LjE5IHVt
IDE2OjE5IHNjaHJpZWIgbGF1cmVudGl1LnR1ZG9yQG54cC5jb206DQo+ID4gVGhpcyBwYXRjaCBz
ZXJpZXMgY29udGFpbnMgc2V2ZXJhbCBmaXhlcyBpbiBwcmVwYXJhdGlvbiBmb3IgU01NVQ0KPiA+
IHN1cHBvcnQgb24gTlhQIExTMTA0M0EgYW5kIExTMTA0NkEgY2hpcHMuIE9uY2UgdGhlc2UgZ2V0
IHBpY2tlZCB1cCwNCj4gPiBJJ2xsIHN1Ym1pdCB0aGUgYWN0dWFsIFNNTVUgZW5hYmxlbWVudCBw
YXRjaGVzIGNvbnNpc3RpbmcgaW4gdGhlDQo+ID4gcmVxdWlyZWQgZGV2aWNlIHRyZWUgY2hhbmdl
cy4NCj4gDQo+IEhhdmUgeW91IHRob3VnaHQgdGhyb3VnaCB3aGF0IHdpbGwgaGFwcGVuIGlmIHRo
aXMgcGF0Y2ggb3JkZXJpbmcgaXMgbm90DQo+IHByZXNlcnZlZD8gSW4gcGFydGljdWxhciwgYSB1
c2VyIGluc3RhbGxpbmcgYSBmdXR1cmUgVS1Cb290IHVwZGF0ZSB3aXRoDQo+IHRoZSBEVEIgYml0
cyBidXQgYm9vdGluZyBhIHN0YWJsZSBrZXJuZWwgd2l0aG91dCB0aGlzIHBhdGNoIHNlcmllcyAt
DQo+IHdvdWxkbid0IHRoYXQgcmVncmVzcyBkcGFhIHRoZW4gZm9yIG91ciBjdXN0b21lcnM/DQo+
IA0KDQpUaGVzZSBhcmUgZml4ZXMgZm9yIGlzc3VlcyB0aGF0IHBvcHBlZCBvdXQgYWZ0ZXIgZW5h
YmxpbmcgU01NVS4gDQpJIGRvIG5vdCBleHBlY3QgdGhlbSB0byBicmVhayBhbnl0aGluZy4NCg0K
LS0tDQpCZXN0IFJlZ2FyZHMsIExhdXJlbnRpdQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lvbW11
