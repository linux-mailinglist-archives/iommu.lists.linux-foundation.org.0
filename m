Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F310B715
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 20:56:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C426D85B97;
	Wed, 27 Nov 2019 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1a01XxFyKRlV; Wed, 27 Nov 2019 19:56:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2FADB85AE2;
	Wed, 27 Nov 2019 19:56:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B7CEC0881;
	Wed, 27 Nov 2019 19:56:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86507C0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 19:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7718D85DF1
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 19:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6KCQtC40d9M for <iommu@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 19:56:49 +0000 (UTC)
X-Greylist: delayed 01:33:50 by SQLgrey-1.7.6
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27803859EF
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 19:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAn5DFfOLuxfyKbe1t2cxVy7fEtMjLep9tltV0uo267GxBJTWqUi+Vy+S9gU2S0/rMj7RdbpiVXGb4UQ7+w4qdABut4Qb39MZTfqoK7EundEb2YRTAevOPhfswAV3LOqRgbUb8HCepr1t8jN8SchXoCFPxpff1McUeNRetyfa6DVKOu5tWPwVa1H6PVL3TFaQ5rpUvZe3lM5bPWuXS40kYOtUXFzERDg8PHGdrvjWKIqg/TmEll2gwcVyolwhgRHKh1txKKcbvOeNX0P0iGEs7NE3WItYVmapyI3d8n4ZPIlpK9IZgoxTKwftoiFclJZR1NaAOIngevms7kqWV4xfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuMgHDOn5lHvGjALlQNF3yph+H4Iqy1nTFO6QNLrOGA=;
 b=AA+MbEpzkHVGLCki7oeJvnTL+5U5rwl5vAlwojq8rE2nZjQ+idVCi/ja5Y4zPwWDAFgLquJ0nQRz9qDUmg92J0EUtpelDsvkngnqZvTy15sleaC4RXR26qfPiF0fthCNhuEOI8xOZFwQsqi7OQmOizSg47RrCqXn6/SHjU6TdzKH5VKq7DuRn+Qyt6KP4xSJL0pEyWe/tBn0UR1eICPcZHY1pYQ78KXG0ddudS3DGhIT5o/Pj/G7Q2njSWxN61hZ3pisTlVscLXyX/B9bMtd93k6A1lKzhTGFPK4rCrQgSgVdmKV+As7snEkuOHlG+51b/iwS0a2BqTxuaA/jzir/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuMgHDOn5lHvGjALlQNF3yph+H4Iqy1nTFO6QNLrOGA=;
 b=2gmajf1RtUtrsnCIem0MrMGAobiqBC8WpqcoEMwOnsATuoRRtKRWLvwmG5PHBh9crSM+0qyyq7v8D3spz7eJ9iIBNBHCRM2TKXUBJUdqySezhSOQQhAmSeSaScbNcdB9DS7o2E0WK/7n+9tCDEf7LtHv/g7LR0anux7pZMcbh/k=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6656.namprd05.prod.outlook.com (20.178.248.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.13; Wed, 27 Nov 2019 18:22:58 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 18:22:57 +0000
To: "hch@lst.de" <hch@lst.de>
Subject: Re: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Thread-Topic: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Thread-Index: AQHVpTCUSCVjXh+W+0SSCl6TSmyYRqefVP8A
Date: Wed, 27 Nov 2019 18:22:57 +0000
Message-ID: <a95d9115fc2a80de2f97f001bbcd9aba6636e685.camel@vmware.com>
References: <20191127144006.25998-1-hch@lst.de>
 <20191127144006.25998-3-hch@lst.de>
In-Reply-To: <20191127144006.25998-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42b7cdaa-ddb7-4565-f003-08d77366d41f
x-ms-traffictypediagnostic: MN2PR05MB6656:
x-microsoft-antispam-prvs: <MN2PR05MB6656B6716DAA261E8F4F920EA1440@MN2PR05MB6656.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(6246003)(81166006)(81156014)(99286004)(71190400001)(64756008)(66476007)(66446008)(66556008)(71200400001)(5640700003)(76116006)(5660300002)(86362001)(4001150100001)(305945005)(2906002)(3846002)(4744005)(2351001)(8936002)(6116002)(478600001)(2501003)(1730700003)(66066001)(66946007)(4326008)(14454004)(66574012)(8676002)(91956017)(6506007)(6916009)(36756003)(102836004)(26005)(6512007)(316002)(76176011)(2616005)(11346002)(446003)(6436002)(6486002)(54906003)(186003)(14444005)(229853002)(25786009)(7736002)(118296001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6656;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5WSTzJQWxhcLb668CNC7xze7ZTWu4qQozikCotT108+wIhC8jVCF5fn0kkwp/PO9m4RU4jvNEClw0iSUtgEa+rYHtXEBE5PgoHBrYMxqGeWozztLgdKP3SX7ufaRXSnCMUhnoLouyc0NrgThkjzGwqDFkm5pU67RL7kH690kC+xtvoWFyvVDGmJH6JDFBo3u5RnJhPPBUwNRSs2O1ZnBqcmvI7l/T1qISM+BZwdx60rK9ZdZOHOk1LE2aQF/VhV8UYrl6PUZoCPqT5qiL83luMKII3Ek2QDxogQr+ym0xoLTCNnsypIWvm0MuQvv+nvVCVtAGuJFXqPrYNTt2/j5RPNt8xDY8lH/UTOFgbgV8tG4nNRaLS2OqiRbQImRvwCw1fZhxP0SUDtyI1jIr/pbI5OjCOIKycm2DE3O4tCfp+vRM46PsJ9fGoCFjHpnxKOz
x-ms-exchange-transport-forked: True
Content-ID: <38743A5396C8804FAD8F2C094844A946@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b7cdaa-ddb7-4565-f003-08d77366d41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 18:22:57.7446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFuKIitcxg1bU+jJpzc3UvRD0/8SFpicolcDaOpS+7RRAOdMAu39N779TODqXV2DIVM515VZ2Dh6X0apkuquJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6656
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
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
From: Thomas Hellstrom via iommu <iommu@lists.linux-foundation.org>
Reply-To: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGksDQoNCk9uIFdlZCwgMjAxOS0xMS0yNyBhdCAxNTo0MCArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IERldmljZXMgdGhhdCBhcmUgZm9yY2VkIHRvIERNQSB0aHJvdWdoIHVuZW5j
cnlwdGVkIGJvdW5jZSBidWZmZXJzDQo+IG5lZWQgdG8gYmUgdHJlYXRlZCBhcyBpZiB0aGV5IGFy
ZSBhZGRyZXNzaW5nIGxpbWl0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4NCj4gLS0tDQo+ICBrZXJuZWwvZG1hL21hcHBpbmcuYyB8IDIgKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9r
ZXJuZWwvZG1hL21hcHBpbmcuYyBiL2tlcm5lbC9kbWEvbWFwcGluZy5jDQo+IGluZGV4IDFkYmU2
ZDcyNTk2Mi4uZjZjMzViNTNkOTk2IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvZG1hL21hcHBpbmcu
Yw0KPiArKysgYi9rZXJuZWwvZG1hL21hcHBpbmcuYw0KPiBAQCAtNDE2LDYgKzQxNiw4IEBAIEVY
UE9SVF9TWU1CT0xfR1BMKGRtYV9nZXRfbWVyZ2VfYm91bmRhcnkpOw0KPiAgICovDQo+ICBib29s
IGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiArCWlm
IChmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoZGV2KSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICAJcmV0
dXJuIG1pbl9ub3RfemVybyhkbWFfZ2V0X21hc2soZGV2KSwgZGV2LT5idXNfZG1hX2xpbWl0KSA8
DQo+ICAJCQkgICAgZG1hX2dldF9yZXF1aXJlZF9tYXNrKGRldik7DQo+ICB9DQoNCkFueSBjaGFu
Y2UgdG8gaGF2ZSB0aGUgY2FzZQ0KDQooc3dpb3RsYl9mb3JjZSA9PSBTV0lPVExCX0ZPUkNFKQ0K
DQphbHNvIGluY2x1ZGVkPw0KDQpPdGhlcndpc2UgZm9yIHRoZSBzZXJpZXMNCg0KUmV2aWV3ZWQt
Ynk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQoNCiANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGlu
ZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
