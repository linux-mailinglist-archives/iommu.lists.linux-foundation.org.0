Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B81B107
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 09:14:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D90AEB6C;
	Mon, 13 May 2019 07:14:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9AB295AA
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 07:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400092.outbound.protection.outlook.com [40.107.140.92])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CCB5027B
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=N8IbShBiUUMqsLHq8zLs4GcfmMmDXTcYRsPTqh9a1HE=;
	b=MQSqRIYp1k+HoFcUvhMAuXtYuBrFE+T7JWe/5o6vVPo1LY7knA7TugmbH2e0Powq4hhVs+COQvRAYAhTinT1qJ81a2+ixn7HxB2zy2GBev7OfFyH9prxpUbKsg1GtEQWcZ7XgyPTj6g1gFXBslw92WAdFCpN0QaUZHU9NJD+OOs=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
	OSBPR01MB3654.jpnprd01.prod.outlook.com (20.178.98.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1878.21; Mon, 13 May 2019 07:14:18 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
	([fe80::f873:6332:738d:7213]) by
	OSBPR01MB3174.jpnprd01.prod.outlook.com
	([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024;
	Mon, 13 May 2019 07:14:18 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Joerg Roedel
	<joro@8bytes.org>, Magnus Damm <damm+renesas@opensource.se>
Subject: RE: [PATCH v3 0/6] iommu/ipmmu-vmsa: Suspend/resume support and
	assorted cleanups
Thread-Topic: [PATCH v3 0/6] iommu/ipmmu-vmsa: Suspend/resume support and
	assorted cleanups
Thread-Index: AQHU+qVfgHhw80AXGkWyDL+Z8to0hKZovY3Q
Date: Mon, 13 May 2019 07:14:18 +0000
Message-ID: <OSBPR01MB3174406C91CC4E63C99A359DD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190424135518.25150-1-geert+renesas@glider.be>
In-Reply-To: <20190424135518.25150-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ff36edb-5243-4406-2727-08d6d7729d46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:OSBPR01MB3654; 
x-ms-traffictypediagnostic: OSBPR01MB3654:
x-microsoft-antispam-prvs: <OSBPR01MB3654497F68480743590BBBA2D80F0@OSBPR01MB3654.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(39860400002)(346002)(396003)(189003)(199004)(66946007)(71200400001)(4326008)(229853002)(53936002)(15650500001)(3846002)(6116002)(6246003)(478600001)(52536014)(5660300002)(14454004)(8936002)(8676002)(33656002)(71190400001)(74316002)(73956011)(81166006)(110136005)(102836004)(54906003)(25786009)(186003)(99286004)(86362001)(81156014)(66066001)(11346002)(446003)(486006)(68736007)(7696005)(7736002)(2906002)(66556008)(66476007)(476003)(6436002)(6506007)(76116006)(9686003)(316002)(305945005)(26005)(256004)(66446008)(14444005)(64756008)(76176011)(66574012)(55016002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB3654;
	H:OSBPR01MB3174.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 65ihUsKBZ3iftfnn4ln5WI0t+BdvpgXRE8xVCThZ8vrfJQbDCpWFXqN276JZUoE/P2D/NHVJe3v4KoucQEoaPxff1cE+ijh3pnEcBpHSWOfnrQoEGNfDFjFufOIDx17gsSOKPRE0qCt39vnZXsgqluCZzBPk6rpV2NXDAD1ZmsRhanboFQluhNxcovf3y+0mvyWBpUz1FSbUtJNuUDAVErkODN0REwooGnOUFMXwBiWGU+WGZYngCWxFqz2ncV9uYcYH375vyn8BZ8N/HT10EttnqdGUE+2ClvykZstQsE7XbfhIdQe6XHDooc1FTpgSsfUplzh9Z75O0E0brA0b8kRX/T286rph9giLeGkeAKXuI8WkLvh2qD5JDpIxmChe8vIe5Daz4VCOjvS2UrgcxdqPIjOjS5Rn5kXp8sjx1xo=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff36edb-5243-4406-2727-08d6d7729d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 07:14:18.3208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3654
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyNCwgMjAxOSAxMDo1NSBQTQ0KPiANCj4gCUhpIErDtnJnLCBNYWdudXMsDQo+
IA0KPiBPbiBSLUNhciBHZW4zIHN5c3RlbXMgd2l0aCBQU0NJLCBQU0NJIG1heSBwb3dlciBkb3du
IHRoZSBTb0MgZHVyaW5nDQo+IHN5c3RlbSBzdXNwZW5kLCB0aHVzIGxvc2luZyBhbGwgSU9NTVUg
c3RhdGUuICBIZW5jZSBhZnRlciBzMnJhbSwgZGV2aWNlcw0KPiBiZWhpbmQgYW4gSVBNTVUgKGUu
Zy4gU0FUQSksIGFuZCBjb25maWd1cmVkIHRvIHVzZSBpdCwgd2lsbCBmYWlsIHRvDQo+IGNvbXBs
ZXRlIHRoZWlyIEkvTyBvcGVyYXRpb25zLg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBz
dXNwZW5kL3Jlc3VtZSBzdXBwb3J0IHRvIHRoZSBSZW5lc2FzIElQTU1VLVZNU0ENCj4gSU9NTVUg
ZHJpdmVyLCBhbmQgcGVyZm9ybXMgc29tZSBzbWFsbGVyIGNsZWFudXBzIGFuZCBmaXhlcyBkdXJp
bmcgdGhlDQo+IHByb2Nlc3MuICBNb3N0IHBhdGNoZXMgYXJlIGZhaXJseSBpbmRlcGVuZGVudCwg
ZXhjZXB0IGZvciBwYXRjaCA2LzYsDQo+IHdoaWNoIGRlcGVuZHMgb24gcGF0Y2hlcyA0LzYgYW5k
IDUvNi4NCj4gDQo+IENoYW5nZXMgY29tcGFyZWQgdG8gdjI6DQo+ICAgLSBGaXggc3lzZnMgcGF0
aCB0eXBvIGluIHBhdGNoIGRlc2NyaXB0aW9uLA0KPiAgIC0gQWRkIFJldmlld2VkLWJ5Lg0KPiAN
Cj4gQ2hhbmdlcyBjb21wYXJlZCB0byB2MToNCj4gICAtIERyb3BwZWQgImlvbW11L2lwbW11LXZt
c2E6IENhbGwgaXBtbXVfY3R4X3dyaXRlX3Jvb3QoKSBpbnN0ZWFkIG9mDQo+ICAgICBvcGVuIGNv
ZGluZyIsDQo+ICAgLSBBZGQgUmV2aWV3ZWQtYnksDQo+ICAgLSBNZXJnZSBJTUVBUi9JTUVMQVIs
DQo+ICAgLSBzL2lwbW11X2NvbnRleHRfaW5pdC9pcG1tdV9kb21haW5fc2V0dXBfY29udGV4dC8s
DQo+ICAgLSBEcm9wIFBTQ0kgY2hlY2tzLg0KPiANCj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24g
U2FsdmF0b3ItWFMgd2l0aCBSLUNhciBIMyBFUzIuMCwgd2l0aCBJUE1NVQ0KPiBzdXBvcnQgZm9y
IFNBVEEgZW5hYmxlZC4gIFRvIHBsYXkgc2FmZSwgdGhlIHJlc3VtZSBvcGVyYXRpb24gaGFzIGFs
c28NCj4gYmVlbiB0ZXN0ZWQgb24gUi1DYXIgTTItVy4NCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2ghIEkgcmV2aWV3ZWQgdGhpcyBwYXRjaCBzZXJpZXMgYW5kIHRlc3RlZCBpdCBvbg0KUi1DYXIg
SDMgRVMzLjAgd2l0aCBJUE1NVSBzdXBwb3J0IGZvciBVU0IzLjAgaG9zdCBhbmQgU0RISS4gU28s
DQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQpUZXN0ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
