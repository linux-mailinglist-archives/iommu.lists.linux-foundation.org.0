Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8B4B4325
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 08:59:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D614E400EA;
	Mon, 14 Feb 2022 07:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FC5GTNyAdf32; Mon, 14 Feb 2022 07:59:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B32F3401B7;
	Mon, 14 Feb 2022 07:59:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AFD2C0073;
	Mon, 14 Feb 2022 07:59:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62A66C000B;
 Mon, 14 Feb 2022 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 502904026C;
 Mon, 14 Feb 2022 07:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPmc1AlXK7it; Mon, 14 Feb 2022 07:59:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CC1E4026B;
 Mon, 14 Feb 2022 07:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaUzXym1ou4jLYgCndxMC18YIm/KXqIraL2unsM1TF8GdivXOH+UsYwbTVrIgeAPsM7MSVDvsE4KJlnrWD8VlOJgDcO/jUe6gr+Qnl0w2VVe3xonRkRAdzdFFaN83VhQOMPm7q/sTTpAGB95sM94a6r+YInnyioPsGFamq58Ll7J8+swNbscVvYshMtX3QRROOIE4VzeQyH3lREnyoHSDurNkkakqB3Ner2XQGf7GqsB5rZUdMURxWQuMKF+4C2ssMeWIwjo49cizsRrhcVGqpaA9olkQKhD+SIhTGUrO7aBC2k+0rzf6GnmRA9yIx76+PHZNy62mwpvPkkclfywww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyoV4F2LKutM50r41ZhRiH98anznILGEM9yj37eGX4Q=;
 b=eOd/LoMBxepQtRi/EQQW5WWKvCATQIxXDd0KG0mk1g0QaN0+n294lWOlihN5I57LpmYsTYDNCeImQE31yipAhjNzzEWH3wVwwZFv1Vi8pLCgkK8sD0VUsnwMDoI21oLn6foGxmvUC0QJdLP18Ep4DraHDxUYcWnKEZ6sSxGld+C8mbVIufgdrk6Go44jRyjDP7FFmiQUlBP7n4Hkoor+omEPCuMLkM9iVz9blP4/aC0riHKE4WXh0OKd9XEfPnDettaTsyukoVhrn5nhO+28NUaimrIwuSsKxAkuYZ05YC1l/FGrdXD+h95vSaqCXLXYxPMN2uX/LJfbwZr23RLqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR2P264MB0798.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Mon, 14 Feb
 2022 07:59:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 07:59:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Thread-Topic: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Thread-Index: AQHYH2agGhDlouzydUeyi0eCkxm8w6ySssaA
Date: Mon, 14 Feb 2022 07:59:28 +0000
Message-ID: <3c4e08f4-67ca-6df5-b6d0-2f2cf2aee597@csgroup.eu>
References: <20220211164135.1803616-1-zi.yan@sent.com>
 <20220211164135.1803616-4-zi.yan@sent.com>
In-Reply-To: <20220211164135.1803616-4-zi.yan@sent.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37369114-bdd6-4182-7147-08d9ef8fece0
x-ms-traffictypediagnostic: PR2P264MB0798:EE_
x-microsoft-antispam-prvs: <PR2P264MB0798E29BF151353DA86E153EED339@PR2P264MB0798.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNPvpCzc1LG0/9ih7KkRAkM/TdbQ4YYmjbFIDc1XEarMihQJi1IBrSjo7c0675AB81YFDscCYIOGvSZlNtPkTq71AXHPnsC+QTc+b78QROy2wjrSwdqkDNVTDoz0E2ZkODuxmuL4uVkLNj6ecora2O2p3ZXFVQIg/mvp5BhTak7yB6FU0iYRKESYvB4kTZA+BlwLSh1JIyJnfp9qMemkRC2JInQUwQDE6JezNLBv834ZfCTJqBi6HB/1qfluzE/IhNxA2EPbu+KUv/47M4aO1It579svO0ef1yvkl4bBB24qPVOupOoMYZdeO+ORgbW19j5L8rwJhwxosiJDMXaopnTc+k/J3oiNPu55An7QhR7fN07i51177f3ZRpRUzYAnRUAJTCdBbHq2BxeoejVw/thqQSXKjIdK/uK3k5eruSH1R2P2Xa8goWKJEogy/fwf6k6w3TNqwEP5qFap08trxUDQpTrhKsvTtCoB1JOXXN7QAnGOw+WWqUMx9Sft73bnyHP786dQRtwUEp22oKM1YxoaaSGClBShVg2GIqylkDPcChEDQJ/r0OtIJTz9yRW043OzU/KKALecq+lb7/HaZA9e++9c5+oxwOT6xmGcPB6yvAm1JwBWdxN3ifh9ZfX0v7mw8uu5MZVrVzIiMzaUz3MRW76Iwoa7K+8rsUqLQ1KVbVU2TFpnv1g5ramAf06okx3BbEj30TTC1bs7FGHp3kkNM5YmQOL+00fgcrXqL49WD1PuHu22o2o2Nx1DzsKoZH1Lyk0KSLNnREB/tsy8idGWM8n/1rgvsULDKAYNfPAH02t3vqatjBEFtFe2iyLDP+QBKAnMeCVIxaluwmotSDc8l2gxIjDn0XQ74AQTYfI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(44832011)(30864003)(66574015)(7416002)(4326008)(66446008)(66476007)(64756008)(8676002)(8936002)(2906002)(66556008)(122000001)(6506007)(66946007)(76116006)(5660300002)(38100700002)(6512007)(91956017)(508600001)(36756003)(966005)(31686004)(83380400001)(6486002)(316002)(110136005)(54906003)(2616005)(186003)(38070700005)(26005)(86362001)(71200400001)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGxlOEZqZytQNmhDTm1Wd2sremxYU0l3eWplOWZ4M2xJY2pPNE5rT2lZdVZ6?=
 =?utf-8?B?d2VvQkU5enA5TktFTlBkSXc1emJMNGRSVFVzS3VSTWZSYjZ4MUhNOTdyOVNR?=
 =?utf-8?B?cytndzRlV04zQUl3eEtJM0pEV1NwSWEvN1p2a0NRdXhtUjFhUHJpem9McWtP?=
 =?utf-8?B?ZndDMUR4N25NeSs5KzVYVE1BT0Q4V3Z1WG1zdjdGWnE3VFVaWXcwQ1QxNUNu?=
 =?utf-8?B?M2pZaXFVZW5PWlYram5rdXNGY2ZQM1VtQUxRUFV1VUc4dGVLMnJhbmsvT2NJ?=
 =?utf-8?B?NzlTUWtuejFLM1Zid1cxSUlEVUpmRkNlRlNKMXZYM3lZbWI2N1dkdGxwcnVu?=
 =?utf-8?B?elE2NnJGQ0JSTG0ySzJia1pkUm1HK3FhYldxMjFNZCt2UWUwSnhYTEExUENH?=
 =?utf-8?B?MkpDSGUvM1Y3ZjBGeTJLK093Q3dybHVYdE1ES29NWjBjT2tNTWhYNjlnVjBh?=
 =?utf-8?B?RlNRMkRJWE9uUlRHZ2NmU1NLZzVUVGRzbFpMdHl4VGp1R1pVZjZXNUVDUDFk?=
 =?utf-8?B?bkJ4ZjY2STh1bjlPOTZ3UHRkU0pJeVo2WW50WFFZdUVlUFZwWUtqUjhwenBa?=
 =?utf-8?B?cmFrbWVpYXhwT2oxLy85cmYzSStUeEhGYjl4T0xyU1Awb2tTR0FSSjRFU2RN?=
 =?utf-8?B?VXk1Z28xQ3l1ZmVGdXRoQ1dqRTk3NXQ1TklIK1lZYkV3bXhuSXFLRWpHSmhE?=
 =?utf-8?B?bWkxUXR4K3BPeko5MXU0aHZjTFkwTnV1M1JhOEt4eXR4ZXlYdjZZU0IrTHFN?=
 =?utf-8?B?SjQ1Uk1ObUZHMU84dTQ1QkdqTU1EQWYyeGRabWhRN0Y0MjYrMmIvdm5uSnhH?=
 =?utf-8?B?Q293ZFZuN3NVaitWdnorbEtLZjhZelNCN3pkWTVYNXljU05LQndyRWk2WjMv?=
 =?utf-8?B?VHJWTjFFd2MzK1FPaXVzamwvRHlWS1hnZklENUZHczlzUUFEczVqR1RyT2Fq?=
 =?utf-8?B?QkRiMlRmZTE1SEUrSE5KeDNJT1g2Vzkrd0svVkdXYWJxbm9HYmp4WWt2OXcx?=
 =?utf-8?B?b2laWnhwNFFTaXRtQXNEVnYvN0daeVNjS2piNzlKY0xWb1BsYkhEK3BPUVQ4?=
 =?utf-8?B?VnBUaEI3dzJEZms0dUFVRU1HdCtPOU83MGcwQWhURWFLQlFmQW5VV0lub0lI?=
 =?utf-8?B?ZGxPazhZMHdnb3F5MEdTa2NJWEl1dkNFVUJycjRUUXN3YVBuY09kQU1jTjlS?=
 =?utf-8?B?UUpwRGQ3eHJXdCsrWXdiWjlIREZFelFwL00yRGhiaHJsRVRidGlvbUtuUEdU?=
 =?utf-8?B?ZHF3MW01bEVIODU1eVJpZUo5QStZMEFOcDByY2NsNzBUYnN5VUdCVThtNnVX?=
 =?utf-8?B?ZUpBYnNaQkRLR3BrZGtYQ2szd0hXclZkcmFaSUFjRlRtNjNPOEh0SHU5czc0?=
 =?utf-8?B?SUh6cTFReG1VKy9DRGw5R0Z3RnhFaFRFSXVPU2wwZkdlVHJISXJXaDhRSWdy?=
 =?utf-8?B?c0JmRnh1ZGtoYzJtNTdMVFJtRXpnUUZFMDJ0STd5R1dsc1lwc2lHVVEyWG9W?=
 =?utf-8?B?dFl6TDdwZjRSUS8welJiWnpBQ1JKY0l6Mno3Rm5PNzJrVGJWakxkRUlENUYz?=
 =?utf-8?B?UFIveW5weWV1ZWthNmsrRlE4Ykd5RG83TU1TVVcza2dIZ3VZd1p4cHhYd2RM?=
 =?utf-8?B?bGpvMzNnVEFaTlhzVG9tbGRJZjN3UXBXaHNlQVRBSk5BTmF0aGwzd3pOT1Zt?=
 =?utf-8?B?bE1CTFRMdzl1UVR3RDlaNXRiR1hRREFJZ0pHZkd5eU81cWdkUlRPVkZsK1BH?=
 =?utf-8?B?Uk9GODAwMk4xTDZNZGpxTnVyQkRTcXBJVnZOVGRmUGJYdFIzSmVURjdQaW1a?=
 =?utf-8?B?azJTK1luNm1PWmJVTE5zZ2lkUXFrb0VCRVEzeERYQTBCSnkweHF6dU5QS1Vz?=
 =?utf-8?B?OGRld2wyNXRkUGhFRWxtbHBJR3l5cmdRNzRGK1ZCSDZJbXZkQ2NaN3BNUmtl?=
 =?utf-8?B?d0FQSmNyc0ZMZ3RIcHdMT1VLTGVRSHg0WTc1dms5K1VsMXNzMitiVEYwT3l4?=
 =?utf-8?B?MU1XNFN2VHF2dFFUQWFydTRoYkIyYXE5SXBPQ3BWS2czb2MwNUZCdUlXN1Ji?=
 =?utf-8?B?cFk1bnJFb3BndHpiYmVlMXNuQ291bDFueGI0VlduRmxtb3oyeTRmVzJUT2J6?=
 =?utf-8?B?bkEvMlN1Yk5iSVhBT3NrczZKWkpBZDJ1dXdsME02dmZrekVjZW5sY3c5NWVD?=
 =?utf-8?B?U2lWbU40NHRpTFJSMXA0VWMyTFVPTThnVkZUaVJ0c0p0MitzRU1jNzhPWHRs?=
 =?utf-8?Q?6DGGvjd6QHO4LIiBBB13CDEUcqqT/XsOT1XuwkrSO8=3D?=
Content-ID: <F2AC2F163197A741A9594DEA1FA167F2@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37369114-bdd6-4182-7147-08d9ef8fece0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 07:59:28.1879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MD9jMpmktkVU9DJGGdo4xX5D59TS9ODY6eev3oJLdcEoW3AEDsqZYDf8BJoeYgQ/F4atEdrDtBI/6AIZO6H2MMAqw2OHz/E+EDqfI9K1Sf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2P264MB0798
Cc: Mel Gorman <mgorman@techsingularity.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Eric Ren <renzhengeek@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
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

DQoNCkxlIDExLzAyLzIwMjIgw6AgMTc6NDEsIFppIFlhbiBhIMOpY3JpdMKgOg0KPiBGcm9tOiBa
aSBZYW4gPHppeUBudmlkaWEuY29tPg0KPiANCj4gYWxsb2NfY29udGlnX3JhbmdlKCkgd29ya2Vk
IGF0IE1BWF9PUkRFUi0xIGdyYW51bGFyaXR5IHRvIGF2b2lkIG1lcmdpbmcNCj4gcGFnZWJsb2Nr
cyB3aXRoIGRpZmZlcmVudCBtaWdyYXRldHlwZXMuIEl0IG1pZ2h0IHVubmVjZXNzYXJpbHkgY29u
dmVydA0KPiBleHRyYSBwYWdlYmxvY2tzIGF0IHRoZSBiZWdpbm5pbmcgYW5kIGF0IHRoZSBlbmQg
b2YgdGhlIHJhbmdlLiBDaGFuZ2UNCj4gYWxsb2NfY29udGlnX3JhbmdlKCkgdG8gd29yayBhdCBw
YWdlYmxvY2sgZ3JhbnVsYXJpdHkuDQo+IA0KPiBTcGVjaWFsIGhhbmRsaW5nIGlzIG5lZWRlZCBm
b3IgZnJlZSBwYWdlcyBhbmQgaW4tdXNlIHBhZ2VzIGFjcm9zcyB0aGUNCj4gYm91bmRhcmllcyBv
ZiB0aGUgcmFuZ2Ugc3BlY2lmaWVkIGFsbG9jX2NvbnRpZ19yYW5nZSgpLiBCZWNhdXNlIHRoZXNl
DQo+IHBhcnRpYWxseSBpc29sYXRlZCBwYWdlcyBjYXVzZXMgZnJlZSBwYWdlIGFjY291bnRpbmcg
aXNzdWVzLiBUaGUgZnJlZQ0KPiBwYWdlcyB3aWxsIGJlIHNwbGl0IGFuZCBmcmVlZCBpbnRvIHNl
cGFyYXRlIG1pZ3JhdGV0eXBlIGxpc3RzOyB0aGUNCj4gaW4tdXNlIHBhZ2VzIHdpbGwgYmUgbWln
cmF0ZWQgdGhlbiB0aGUgZnJlZWQgcGFnZXMgd2lsbCBiZSBoYW5kbGVkLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4NCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51
eC9wYWdlLWlzb2xhdGlvbi5oIHwgICAyICstDQo+ICAgbW0vaW50ZXJuYWwuaCAgICAgICAgICAg
ICAgICAgIHwgICAzICsNCj4gICBtbS9tZW1vcnlfaG90cGx1Zy5jICAgICAgICAgICAgfCAgIDMg
Ky0NCj4gICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgfCAyMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgbW0vcGFnZV9pc29sYXRpb24uYyAgICAgICAgICAg
IHwgIDMzICsrKystDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9ucygrKSwgNjUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wYWdlLWlzb2xh
dGlvbi5oIGIvaW5jbHVkZS9saW51eC9wYWdlLWlzb2xhdGlvbi5oDQo+IGluZGV4IDRlZjdiZTZk
ZWY4My4uNzhmZjk0MGNjMTY5IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BhZ2UtaXNv
bGF0aW9uLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wYWdlLWlzb2xhdGlvbi5oDQo+IEBAIC01
NCw3ICs1NCw3IEBAIGludCBtb3ZlX2ZyZWVwYWdlc19ibG9jayhzdHJ1Y3Qgem9uZSAqem9uZSwg
c3RydWN0IHBhZ2UgKnBhZ2UsDQo+ICAgICovDQo+ICAgaW50DQo+ICAgc3RhcnRfaXNvbGF0ZV9w
YWdlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCB1bnNpZ25lZCBsb25nIGVuZF9wZm4s
DQo+IC0JCQkgdW5zaWduZWQgbWlncmF0ZXR5cGUsIGludCBmbGFncyk7DQo+ICsJCQkgdW5zaWdu
ZWQgbWlncmF0ZXR5cGUsIGludCBmbGFncywgZ2ZwX3QgZ2ZwX2ZsYWdzKTsNCj4gICANCj4gICAv
Kg0KPiAgICAqIENoYW5nZXMgTUlHUkFURV9JU09MQVRFIHRvIE1JR1JBVEVfTU9WQUJMRS4NCj4g
ZGlmZiAtLWdpdCBhL21tL2ludGVybmFsLmggYi9tbS9pbnRlcm5hbC5oDQo+IGluZGV4IDBkMjQw
ZTg3NjgzMS4uNTA5Y2JkYzI1OTkyIDEwMDY0NA0KPiAtLS0gYS9tbS9pbnRlcm5hbC5oDQo+ICsr
KyBiL21tL2ludGVybmFsLmgNCj4gQEAgLTMxOSw2ICszMTksOSBAQCBpc29sYXRlX2ZyZWVwYWdl
c19yYW5nZShzdHJ1Y3QgY29tcGFjdF9jb250cm9sICpjYywNCj4gICBpbnQNCj4gICBpc29sYXRl
X21pZ3JhdGVwYWdlc19yYW5nZShzdHJ1Y3QgY29tcGFjdF9jb250cm9sICpjYywNCj4gICAJCQkg
ICB1bnNpZ25lZCBsb25nIGxvd19wZm4sIHVuc2lnbmVkIGxvbmcgZW5kX3Bmbik7DQo+ICsNCj4g
K2ludA0KPiAraXNvbGF0ZV9zaW5nbGVfcGFnZWJsb2NrKHVuc2lnbmVkIGxvbmcgYm91bmRhcnlf
cGZuLCBnZnBfdCBnZnBfZmxhZ3MsIGludCBpc29sYXRlX2JlZm9yZV9ib3VuZGFyeSk7DQo+ICAg
I2VuZGlmDQo+ICAgaW50IGZpbmRfc3VpdGFibGVfZmFsbGJhY2soc3RydWN0IGZyZWVfYXJlYSAq
YXJlYSwgdW5zaWduZWQgaW50IG9yZGVyLA0KPiAgIAkJCWludCBtaWdyYXRldHlwZSwgYm9vbCBv
bmx5X3N0ZWFsYWJsZSwgYm9vbCAqY2FuX3N0ZWFsKTsNCj4gZGlmZiAtLWdpdCBhL21tL21lbW9y
eV9ob3RwbHVnLmMgYi9tbS9tZW1vcnlfaG90cGx1Zy5jDQo+IGluZGV4IGNlNjgwOTg4MzJhYS4u
ODI0MDZkMmYzZTQ2IDEwMDY0NA0KPiAtLS0gYS9tbS9tZW1vcnlfaG90cGx1Zy5jDQo+ICsrKyBi
L21tL21lbW9yeV9ob3RwbHVnLmMNCj4gQEAgLTE4NjMsNyArMTg2Myw4IEBAIGludCBfX3JlZiBv
ZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCB1bnNpZ25lZCBsb25nIG5yX3Bh
Z2VzLA0KPiAgIAkvKiBzZXQgYWJvdmUgcmFuZ2UgYXMgaXNvbGF0ZWQgKi8NCj4gICAJcmV0ID0g
c3RhcnRfaXNvbGF0ZV9wYWdlX3JhbmdlKHN0YXJ0X3BmbiwgZW5kX3BmbiwNCj4gICAJCQkJICAg
ICAgIE1JR1JBVEVfTU9WQUJMRSwNCj4gLQkJCQkgICAgICAgTUVNT1JZX09GRkxJTkUgfCBSRVBP
UlRfRkFJTFVSRSk7DQo+ICsJCQkJICAgICAgIE1FTU9SWV9PRkZMSU5FIHwgUkVQT1JUX0ZBSUxV
UkUsDQo+ICsJCQkJICAgICAgIEdGUF9VU0VSIHwgX19HRlBfTU9WQUJMRSB8IF9fR0ZQX1JFVFJZ
X01BWUZBSUwpOw0KPiAgIAlpZiAocmV0KSB7DQo+ICAgCQlyZWFzb24gPSAiZmFpbHVyZSB0byBp
c29sYXRlIHJhbmdlIjsNCj4gICAJCWdvdG8gZmFpbGVkX3JlbW92YWxfcGNwbGlzdHNfZGlzYWJs
ZWQ7DQo+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMNCj4g
aW5kZXggNjJlZjc4ZjNkNzcxLi43YTRmYTIxYWVhNWMgMTAwNjQ0DQo+IC0tLSBhL21tL3BhZ2Vf
YWxsb2MuYw0KPiArKysgYi9tbS9wYWdlX2FsbG9jLmMNCj4gQEAgLTg5ODUsNyArODk4NSw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBhbGxvY19jb250aWdfZHVtcF9wYWdlcyhzdHJ1Y3QgbGlzdF9o
ZWFkICpwYWdlX2xpc3QpDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgLyogW3N0YXJ0LCBlbmQpIG11
c3QgYmVsb25nIHRvIGEgc2luZ2xlIHpvbmUuICovDQo+IC1zdGF0aWMgaW50IF9fYWxsb2NfY29u
dGlnX21pZ3JhdGVfcmFuZ2Uoc3RydWN0IGNvbXBhY3RfY29udHJvbCAqY2MsDQo+ICtpbnQgX19h
bGxvY19jb250aWdfbWlncmF0ZV9yYW5nZShzdHJ1Y3QgY29tcGFjdF9jb250cm9sICpjYywNCj4g
ICAJCQkJCXVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiAgIHsNCj4g
ICAJLyogVGhpcyBmdW5jdGlvbiBpcyBiYXNlZCBvbiBjb21wYWN0X3pvbmUoKSBmcm9tIGNvbXBh
Y3Rpb24uYy4gKi8NCj4gQEAgLTkwNDMsNiArOTA0MywxNjcgQEAgc3RhdGljIGludCBfX2FsbG9j
X2NvbnRpZ19taWdyYXRlX3JhbmdlKHN0cnVjdCBjb21wYWN0X2NvbnRyb2wgKmNjLA0KPiAgIAly
ZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICsvKioNCj4gKyAqIHNwbGl0X2ZyZWVfcGFnZSgpIC0t
IHNwbGl0IGEgZnJlZSBwYWdlIGF0IHNwbGl0X3Bmbl9vZmZzZXQNCj4gKyAqIEBmcmVlX3BhZ2U6
CQl0aGUgb3JpZ2luYWwgZnJlZSBwYWdlDQo+ICsgKiBAb3JkZXI6CQl0aGUgb3JkZXIgb2YgdGhl
IHBhZ2UNCj4gKyAqIEBzcGxpdF9wZm5fb2Zmc2V0OglzcGxpdCBvZmZzZXQgd2l0aGluIHRoZSBw
YWdlDQo+ICsgKg0KPiArICogSXQgaXMgdXNlZCB3aGVuIHRoZSBmcmVlIHBhZ2UgY3Jvc3NlcyB0
d28gcGFnZWJsb2NrcyB3aXRoIGRpZmZlcmVudCBtaWdyYXRldHlwZXMNCj4gKyAqIGF0IHNwbGl0
X3Bmbl9vZmZzZXQgd2l0aGluIHRoZSBwYWdlLiBUaGUgc3BsaXQgZnJlZSBwYWdlIHdpbGwgYmUg
cHV0IGludG8NCj4gKyAqIHNlcGFyYXRlIG1pZ3JhdGV0eXBlIGxpc3RzIGFmdGVyd2FyZHMuIE90
aGVyd2lzZSwgdGhlIGZ1bmN0aW9uIGFjaGlldmVzDQo+ICsgKiBub3RoaW5nLg0KPiArICovDQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc3BsaXRfZnJlZV9wYWdlKHN0cnVjdCBwYWdlICpmcmVlX3Bh
Z2UsDQo+ICsJCQkJaW50IG9yZGVyLCB1bnNpZ25lZCBsb25nIHNwbGl0X3Bmbl9vZmZzZXQpDQo+
ICt7DQo+ICsJc3RydWN0IHpvbmUgKnpvbmUgPSBwYWdlX3pvbmUoZnJlZV9wYWdlKTsNCj4gKwl1
bnNpZ25lZCBsb25nIGZyZWVfcGFnZV9wZm4gPSBwYWdlX3RvX3BmbihmcmVlX3BhZ2UpOw0KPiAr
CXVuc2lnbmVkIGxvbmcgcGZuOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsJaW50IGZy
ZWVfcGFnZV9vcmRlcjsNCj4gKw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKCZ6b25lLT5sb2NrLCBm
bGFncyk7DQo+ICsJZGVsX3BhZ2VfZnJvbV9mcmVlX2xpc3QoZnJlZV9wYWdlLCB6b25lLCBvcmRl
cik7DQo+ICsJZm9yIChwZm4gPSBmcmVlX3BhZ2VfcGZuOw0KPiArCSAgICAgcGZuIDwgZnJlZV9w
YWdlX3BmbiArICgxVUwgPDwgb3JkZXIpOykgew0KPiArCQlpbnQgbXQgPSBnZXRfcGZuYmxvY2tf
bWlncmF0ZXR5cGUocGZuX3RvX3BhZ2UocGZuKSwgcGZuKTsNCj4gKw0KPiArCQlmcmVlX3BhZ2Vf
b3JkZXIgPSBvcmRlcl9iYXNlXzIoc3BsaXRfcGZuX29mZnNldCk7DQo+ICsJCV9fZnJlZV9vbmVf
cGFnZShwZm5fdG9fcGFnZShwZm4pLCBwZm4sIHpvbmUsIGZyZWVfcGFnZV9vcmRlciwNCj4gKwkJ
CQltdCwgRlBJX05PTkUpOw0KPiArCQlwZm4gKz0gMVVMIDw8IGZyZWVfcGFnZV9vcmRlcjsNCj4g
KwkJc3BsaXRfcGZuX29mZnNldCAtPSAoMVVMIDw8IGZyZWVfcGFnZV9vcmRlcik7DQo+ICsJCS8q
IHdlIGhhdmUgZG9uZSB0aGUgZmlyc3QgcGFydCwgbm93IHN3aXRjaCB0byBzZWNvbmQgcGFydCAq
Lw0KPiArCQlpZiAoc3BsaXRfcGZuX29mZnNldCA9PSAwKQ0KPiArCQkJc3BsaXRfcGZuX29mZnNl
dCA9ICgxVUwgPDwgb3JkZXIpIC0gKHBmbiAtIGZyZWVfcGFnZV9wZm4pOw0KPiArCX0NCj4gKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZ6b25lLT5sb2NrLCBmbGFncyk7DQo+ICt9DQo+ICsNCj4g
Ky8qKg0KPiArICogaXNvbGF0ZV9zaW5nbGVfcGFnZWJsb2NrKCkgLS0gdHJpZXMgdG8gaXNvbGF0
ZSBhIHBhZ2VibG9jayB0aGF0IG1pZ2h0IGJlDQo+ICsgKiB3aXRoaW4gYSBmcmVlIG9yIGluLXVz
ZSBwYWdlLg0KPiArICogQGJvdW5kYXJ5X3BmbjoJCXBhZ2VibG9jay1hbGlnbmVkIHBmbiB0aGF0
IGEgcGFnZSBtaWdodCBjcm9zcw0KPiArICogQGdmcF9mbGFnczoJCQlHRlAgZmxhZ3MgdXNlZCBm
b3IgbWlncmF0aW5nIHBhZ2VzDQo+ICsgKiBAaXNvbGF0ZV9iZWZvcmVfYm91bmRhcnk6CWlzb2xh
dGUgdGhlIHBhZ2VibG9jayBiZWZvcmUgKDEpIG9yIGFmdGVyICgwKQ0KPiArICoJCQkJdGhlIGJv
dW5kYXJ5X3Bmbg0KPiArICoNCj4gKyAqIEZyZWUgYW5kIGluLXVzZSBwYWdlcyBjYW4gYmUgYXMg
YmlnIGFzIE1BWF9PUkRFUi0xIGFuZCBjb250YWluIG1vcmUgdGhhbiBvbmUNCj4gKyAqIHBhZ2Vi
bG9jay4gV2hlbiBub3QgYWxsIHBhZ2VibG9ja3Mgd2l0aGluIGEgcGFnZSBhcmUgaXNvbGF0ZWQg
YXQgdGhlIHNhbWUNCj4gKyAqIHRpbWUsIGZyZWUgcGFnZSBhY2NvdW50aW5nIGNhbiBnbyB3cm9u
Zy4gRm9yIGV4YW1wbGUsIGluIHRoZSBjYXNlIG9mDQo+ICsgKiBNQVhfT1JERVItMSA9IHBhZ2Vi
bG9ja19vcmRlciArIDEsIGEgTUFYX09SREVSLTEgcGFnZSBoYXMgdHdvIHBhZ2VsYm9ja3MuDQo+
ICsgKiBbICAgICAgICBNQVhfT1JERVItMSAgICAgICAgICBdDQo+ICsgKiBbICBwYWdlYmxvY2sw
ICB8ICBwYWdlYmxvY2sxICBdDQo+ICsgKiBXaGVuIGVpdGhlciBwYWdlYmxvY2sgaXMgaXNvbGF0
ZWQsIGlmIGl0IGlzIGEgZnJlZSBwYWdlLCB0aGUgcGFnZSBpcyBub3QNCj4gKyAqIHNwbGl0IGlu
dG8gc2VwYXJhdGUgbWlncmF0ZXR5cGUgbGlzdHMsIHdoaWNoIGlzIHN1cHBvc2VkIHRvOyBpZiBp
dCBpcyBhbg0KPiArICogaW4tdXNlIHBhZ2UgYW5kIGZyZWVkIGxhdGVyLCBfX2ZyZWVfb25lX3Bh
Z2UoKSBkb2VzIG5vdCBzcGxpdCB0aGUgZnJlZSBwYWdlDQo+ICsgKiBlaXRoZXIuIFRoZSBmdW5j
dGlvbiBoYW5kbGVzIHRoaXMgYnkgc3BsaXR0aW5nIHRoZSBmcmVlIHBhZ2Ugb3IgbWlncmF0aW5n
DQo+ICsgKiB0aGUgaW4tdXNlIHBhZ2UgdGhlbiBzcGxpdHRpbmcgdGhlIGZyZWUgcGFnZS4NCj4g
KyAqLw0KPiAraW50IGlzb2xhdGVfc2luZ2xlX3BhZ2VibG9jayh1bnNpZ25lZCBsb25nIGJvdW5k
YXJ5X3BmbiwgZ2ZwX3QgZ2ZwX2ZsYWdzLA0KPiArCQkJaW50IGlzb2xhdGVfYmVmb3JlX2JvdW5k
YXJ5KQ0KDQpEbyB5b3UgbmVlZCBzdWNoIGJpZyBwYXJhbSBuYW1lID8NCg0KU2VlIA0KaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRt
bD9oaWdobGlnaHQ9c3R5bGUjbmFtaW5nDQoNCmlzb2xhdGVfYmVmb3JlX2JvdW5kYXJ5IGNvdWxk
IHByb2JhYmx5IGJlIHNob3J0ZXIuDQoNCkFuZCBzaG91bGQgYmUgYSBib29sIGJ5IHRoZSB3YXku
DQoNCj4gK3sNCj4gKwl1bnNpZ25lZCBjaGFyIHNhdmVkX210Ow0KPiArCS8qDQo+ICsJICogc2Nh
biBhdCBtYXgoTUFYX09SREVSX05SX1BBR0VTLCBwYWdlYmxvY2tfbnJfcGFnZXMpIGFsaWduZWQg
cmFuZ2UgdG8NCj4gKwkgKiBhdm9pZCBpc29sYXRlIHBhZ2VibG9ja3MgYmVsb25naW5nIHRvIGEg
YmlnZ2VyIGZyZWUgb3IgaW4tdXNlIHBhZ2UNCj4gKwkgKi8NCj4gKwl1bnNpZ25lZCBsb25nIHN0
YXJ0X3BmbiA9IHBmbl9tYXhfYWxpZ25fZG93bihib3VuZGFyeV9wZm4pOw0KPiArCXVuc2lnbmVk
IGxvbmcgaXNvbGF0ZWRfcGFnZWJsb2NrX3BmbjsNCg0KVmFyaWFibGUgbmFtZSB0b28gbG9uZy4N
Cg0KPiArCXVuc2lnbmVkIGxvbmcgcGZuOw0KPiArDQo+ICsJVk1fQlVHX09OKCFJU19BTElHTkVE
KGJvdW5kYXJ5X3BmbiwgcGFnZWJsb2NrX25yX3BhZ2VzKSk7DQo+ICsNCj4gKwlpZiAoaXNvbGF0
ZV9iZWZvcmVfYm91bmRhcnkpDQo+ICsJCWlzb2xhdGVkX3BhZ2VibG9ja19wZm4gPSBib3VuZGFy
eV9wZm4gLSBwYWdlYmxvY2tfbnJfcGFnZXM7DQo+ICsJZWxzZQ0KPiArCQlpc29sYXRlZF9wYWdl
YmxvY2tfcGZuID0gYm91bmRhcnlfcGZuOw0KPiArDQo+ICsJc2F2ZWRfbXQgPSBnZXRfcGFnZWJs
b2NrX21pZ3JhdGV0eXBlKHBmbl90b19wYWdlKGlzb2xhdGVkX3BhZ2VibG9ja19wZm4pKTsNCj4g
KwlzZXRfcGFnZWJsb2NrX21pZ3JhdGV0eXBlKHBmbl90b19wYWdlKGlzb2xhdGVkX3BhZ2VibG9j
a19wZm4pLCBNSUdSQVRFX0lTT0xBVEUpOw0KPiArDQo+ICsJZm9yIChwZm4gPSBzdGFydF9wZm47
IHBmbiA8IGJvdW5kYXJ5X3BmbjspIHsNCg0KVGhpcyBsb29wIGlzIGEgYml0IGxvbmcgYSBkZWVw
LiBJc24ndCB0aGVyZSBhIHdheSB0byBwdXQgd2hhdCdzIGluICJpZiANCihQYWdlSHVnZShwYWdl
KSB8fCBQYWdlVHJhbnNDb21wb3VuZChwYWdlKSkiIGludG8gYSBzdWItZnVuY3Rpb24gPw0KDQpT
ZWUgDQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL2NvZGlu
Zy1zdHlsZS5odG1sP2hpZ2hsaWdodD1zdHlsZSNmdW5jdGlvbnMNCg0KPiArCQlzdHJ1Y3QgcGFn
ZSAqcGFnZSA9IHBmbl90b19wYWdlKHBmbik7DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogc3RhcnRf
cGZuIGlzIG1heChNQVhfT1JERVJfTlJfUEFHRVMsIHBhZ2VibG9ja19ucl9wYWdlcykNCj4gKwkJ
ICogYWxpZ25lZCwgaWYgdGhlcmUgaXMgYW55IGZyZWUgcGFnZXMgaW4gW3N0YXJ0X3BmbiwgYm91
bmRhcnlfcGZuKSwNCj4gKwkJICogaXRzIGhlYWQgcGFnZSB3aWxsIGFsd2F5cyBiZSBpbiB0aGUg
cmFuZ2UuDQo+ICsJCSAqLw0KPiArCQlpZiAoUGFnZUJ1ZGR5KHBhZ2UpKSB7DQo+ICsJCQlpbnQg
b3JkZXIgPSBidWRkeV9vcmRlcihwYWdlKTsNCj4gKw0KPiArCQkJaWYgKHBmbiArICgxVUwgPDwg
b3JkZXIpID4gYm91bmRhcnlfcGZuKQ0KPiArCQkJCXNwbGl0X2ZyZWVfcGFnZShwYWdlLCBvcmRl
ciwgYm91bmRhcnlfcGZuIC0gcGZuKTsNCj4gKwkJCXBmbiArPSAoMVVMIDw8IG9yZGVyKTsNCj4g
KwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+ICsJCS8qDQo+ICsJCSAqIG1pZ3JhdGUgY29tcG91bmQg
cGFnZXMgdGhlbiBsZXQgdGhlIGZyZWUgcGFnZSBoYW5kbGluZyBjb2RlDQo+ICsJCSAqIGFib3Zl
IGRvIHRoZSByZXN0DQo+ICsJCSAqLw0KPiArCQlpZiAoUGFnZUh1Z2UocGFnZSkgfHwgUGFnZVRy
YW5zQ29tcG91bmQocGFnZSkpIHsNCj4gKwkJCXVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSBjb21w
b3VuZF9ucihwYWdlKTsNCj4gKwkJCWludCBvcmRlciA9IGNvbXBvdW5kX29yZGVyKHBhZ2UpOw0K
PiArCQkJc3RydWN0IHBhZ2UgKmhlYWQgPSBjb21wb3VuZF9oZWFkKHBhZ2UpOw0KPiArCQkJdW5z
aWduZWQgbG9uZyBoZWFkX3BmbiA9IHBhZ2VfdG9fcGZuKGhlYWQpOw0KPiArDQo+ICsJCQlpZiAo
aGVhZF9wZm4gKyBucl9wYWdlcyA+PSBib3VuZGFyeV9wZm4pIHsNCj4gKwkJCQlpbnQgcmV0Ow0K
PiArCQkJCXN0cnVjdCBjb21wYWN0X2NvbnRyb2wgY2MgPSB7DQo+ICsJCQkJCS5ucl9taWdyYXRl
cGFnZXMgPSAwLA0KPiArCQkJCQkub3JkZXIgPSAtMSwNCj4gKwkJCQkJLnpvbmUgPSBwYWdlX3pv
bmUocGZuX3RvX3BhZ2UoaGVhZF9wZm4pKSwNCj4gKwkJCQkJLm1vZGUgPSBNSUdSQVRFX1NZTkMs
DQo+ICsJCQkJCS5pZ25vcmVfc2tpcF9oaW50ID0gdHJ1ZSwNCj4gKwkJCQkJLm5vX3NldF9za2lw
X2hpbnQgPSB0cnVlLA0KPiArCQkJCQkuZ2ZwX21hc2sgPSBjdXJyZW50X2dmcF9jb250ZXh0KGdm
cF9mbGFncyksDQo+ICsJCQkJCS5hbGxvY19jb250aWcgPSB0cnVlLA0KPiArCQkJCX07DQo+ICsN
Cj4gKwkJCQlJTklUX0xJU1RfSEVBRCgmY2MubWlncmF0ZXBhZ2VzKTsNCj4gKw0KPiArCQkJCXJl
dCA9IF9fYWxsb2NfY29udGlnX21pZ3JhdGVfcmFuZ2UoJmNjLCBoZWFkX3BmbiwNCj4gKwkJCQkJ
CQloZWFkX3BmbiArIG5yX3BhZ2VzKTsNCj4gKw0KPiArCQkJCWlmIChyZXQpIHsNCj4gKwkJCQkJ
LyogcmVzdG9yZSB0aGUgb3JpZ2luYWwgbWlncmF0ZXR5cGUgKi8NCj4gKwkJCQkJc2V0X3BhZ2Vi
bG9ja19taWdyYXRldHlwZSgNCj4gKwkJCQkJCXBmbl90b19wYWdlKGlzb2xhdGVkX3BhZ2VibG9j
a19wZm4pLA0KPiArCQkJCQkJc2F2ZWRfbXQpOw0KPiArCQkJCQlyZXR1cm4gLUVCVVNZOw0KPiAr
CQkJCX0NCj4gKwkJCQkvKg0KPiArCQkJCSAqIHJlc2V0IHBmbiwgbGV0IHRoZSBmcmVlIHBhZ2Ug
aGFuZGxpbmcgY29kZQ0KPiArCQkJCSAqIGFib3ZlIHNwbGl0IHRoZSBmcmVlIHBhZ2UgdG8gdGhl
IHJpZ2h0DQo+ICsJCQkJICogbWlncmF0ZXR5cGUgbGlzdC4NCj4gKwkJCQkgKg0KPiArCQkJCSAq
IGhlYWRfcGZuIGlzIG5vdCB1c2VkIGhlcmUgYXMgYSBodWdldGxiIHBhZ2UNCj4gKwkJCQkgKiBv
cmRlciBjYW4gYmUgYmlnZ2VyIHRoYW4gTUFYX09SREVSLTEsIGJ1dA0KPiArCQkJCSAqIGFmdGVy
IGl0IGlzIGZyZWVkLCB0aGUgZnJlZSBwYWdlIG9yZGVyIGlzIG5vdC4NCj4gKwkJCQkgKiBVc2Ug
cGZuIHdpdGhpbiB0aGUgcmFuZ2UgdG8gZmluZCB0aGUgaGVhZCBvZg0KPiArCQkJCSAqIHRoZSBm
cmVlIHBhZ2UgYW5kIHJlc2V0IG9yZGVyIHRvIDAgaWYgYSBodWdldGxiDQo+ICsJCQkJICogcGFn
ZSB3aXRoID5NQVhfT1JERVItMSBvcmRlciBpcyBlbmNvdW50ZXJlZC4NCj4gKwkJCQkgKi8NCj4g
KwkJCQlpZiAob3JkZXIgPiBNQVhfT1JERVItMSkNCj4gKwkJCQkJb3JkZXIgPSAwOw0KPiArCQkJ
CXdoaWxlICghUGFnZUJ1ZGR5KHBmbl90b19wYWdlKHBmbikpKSB7DQo+ICsJCQkJCW9yZGVyKys7
DQo+ICsJCQkJCXBmbiAmPSB+MFVMIDw8IG9yZGVyOw0KPiArCQkJCX0NCj4gKwkJCQljb250aW51
ZTsNCj4gKwkJCX0NCj4gKwkJCXBmbiArPSBucl9wYWdlczsNCj4gKwkJCWNvbnRpbnVlOw0KPiAr
CQl9DQo+ICsNCj4gKwkJcGZuKys7DQo+ICsJfQ0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+
ICsNCj4gICAvKioNCj4gICAgKiBhbGxvY19jb250aWdfcmFuZ2UoKSAtLSB0cmllcyB0byBhbGxv
Y2F0ZSBnaXZlbiByYW5nZSBvZiBwYWdlcw0KPiAgICAqIEBzdGFydDoJc3RhcnQgUEZOIHRvIGFs
bG9jYXRlDQo+IEBAIC05MDY3LDggKzkyMjgsOSBAQCBzdGF0aWMgaW50IF9fYWxsb2NfY29udGln
X21pZ3JhdGVfcmFuZ2Uoc3RydWN0IGNvbXBhY3RfY29udHJvbCAqY2MsDQo+ICAgaW50IGFsbG9j
X2NvbnRpZ19yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwNCj4g
ICAJCSAgICAgICB1bnNpZ25lZCBtaWdyYXRldHlwZSwgZ2ZwX3QgZ2ZwX21hc2spDQo+ICAgew0K
PiAtCXVuc2lnbmVkIGxvbmcgb3V0ZXJfc3RhcnQsIG91dGVyX2VuZDsNCj4gLQl1bnNpZ25lZCBp
bnQgb3JkZXI7DQo+ICsJdW5zaWduZWQgbG9uZyBvdXRlcl9lbmQ7DQo+ICsJdW5zaWduZWQgbG9u
ZyBhbGxvY19zdGFydCA9IEFMSUdOX0RPV04oc3RhcnQsIHBhZ2VibG9ja19ucl9wYWdlcyk7DQo+
ICsJdW5zaWduZWQgbG9uZyBhbGxvY19lbmQgPSBBTElHTihlbmQsIHBhZ2VibG9ja19ucl9wYWdl
cyk7DQo+ICAgCWludCByZXQgPSAwOw0KPiAgIA0KPiAgIAlzdHJ1Y3QgY29tcGFjdF9jb250cm9s
IGNjID0gew0KPiBAQCAtOTA4NywxNCArOTI0OSwxMSBAQCBpbnQgYWxsb2NfY29udGlnX3Jhbmdl
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLA0KPiAgIAkgKiBXaGF0IHdl
IGRvIGhlcmUgaXMgd2UgbWFyayBhbGwgcGFnZWJsb2NrcyBpbiByYW5nZSBhcw0KPiAgIAkgKiBN
SUdSQVRFX0lTT0xBVEUuICBCZWNhdXNlIHBhZ2VibG9jayBhbmQgbWF4IG9yZGVyIHBhZ2VzIG1h
eQ0KPiAgIAkgKiBoYXZlIGRpZmZlcmVudCBzaXplcywgYW5kIGR1ZSB0byB0aGUgd2F5IHBhZ2Ug
YWxsb2NhdG9yDQo+IC0JICogd29yaywgd2UgYWxpZ24gdGhlIHJhbmdlIHRvIGJpZ2dlc3Qgb2Yg
dGhlIHR3byBwYWdlcyBzbw0KPiAtCSAqIHRoYXQgcGFnZSBhbGxvY2F0b3Igd29uJ3QgdHJ5IHRv
IG1lcmdlIGJ1ZGRpZXMgZnJvbQ0KPiAtCSAqIGRpZmZlcmVudCBwYWdlYmxvY2tzIGFuZCBjaGFu
Z2UgTUlHUkFURV9JU09MQVRFIHRvIHNvbWUNCj4gLQkgKiBvdGhlciBtaWdyYXRpb24gdHlwZS4N
Cj4gKwkgKiB3b3JrLCBzdGFydF9pc29sYXRlX3BhZ2VfcmFuZ2UoKSBoYXMgc3BlY2lhbCBoYW5k
bGluZ3MgZm9yIHRoaXMuDQo+ICAgCSAqDQo+ICAgCSAqIE9uY2UgdGhlIHBhZ2VibG9ja3MgYXJl
IG1hcmtlZCBhcyBNSUdSQVRFX0lTT0xBVEUsIHdlDQo+ICAgCSAqIG1pZ3JhdGUgdGhlIHBhZ2Vz
IGZyb20gYW4gdW5hbGlnbmVkIHJhbmdlIChpZS4gcGFnZXMgdGhhdA0KPiAtCSAqIHdlIGFyZSBp
bnRlcmVzdGVkIGluKS4gIFRoaXMgd2lsbCBwdXQgYWxsIHRoZSBwYWdlcyBpbg0KPiArCSAqIHdl
IGFyZSBpbnRlcmVzdGVkIGluKS4gVGhpcyB3aWxsIHB1dCBhbGwgdGhlIHBhZ2VzIGluDQo+ICAg
CSAqIHJhbmdlIGJhY2sgdG8gcGFnZSBhbGxvY2F0b3IgYXMgTUlHUkFURV9JU09MQVRFLg0KPiAg
IAkgKg0KPiAgIAkgKiBXaGVuIHRoaXMgaXMgZG9uZSwgd2UgdGFrZSB0aGUgcGFnZXMgaW4gcmFu
Z2UgZnJvbSBwYWdlDQo+IEBAIC05MTA3LDkgKzkyNjYsOSBAQCBpbnQgYWxsb2NfY29udGlnX3Jh
bmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLA0KPiAgIAkgKiBwdXQg
YmFjayB0byBwYWdlIGFsbG9jYXRvciBzbyB0aGF0IGJ1ZGR5IGNhbiB1c2UgdGhlbS4NCj4gICAJ
ICovDQo+ICAgDQo+IC0JcmV0ID0gc3RhcnRfaXNvbGF0ZV9wYWdlX3JhbmdlKHN0YXJ0LCBlbmQs
IG1pZ3JhdGV0eXBlLCAwKTsNCj4gKwlyZXQgPSBzdGFydF9pc29sYXRlX3BhZ2VfcmFuZ2Uoc3Rh
cnQsIGVuZCwgbWlncmF0ZXR5cGUsIDAsIGdmcF9tYXNrKTsNCj4gICAJaWYgKHJldCkNCj4gLQkJ
cmV0dXJuIHJldDsNCj4gKwkJZ290byBkb25lOw0KPiAgIA0KPiAgIAlkcmFpbl9hbGxfcGFnZXMo
Y2Muem9uZSk7DQo+ICAgDQo+IEBAIC05MTI4LDY4ICs5Mjg3LDI4IEBAIGludCBhbGxvY19jb250
aWdfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsDQo+ICAgCQln
b3RvIGRvbmU7DQo+ICAgCXJldCA9IDA7DQo+ICAgDQo+IC0JLyoNCj4gLQkgKiBQYWdlcyBmcm9t
IFtzdGFydCwgZW5kKSBhcmUgd2l0aGluIGEgTUFYX09SREVSX05SX1BBR0VTDQo+IC0JICogYWxp
Z25lZCBibG9ja3MgdGhhdCBhcmUgbWFya2VkIGFzIE1JR1JBVEVfSVNPTEFURS4gIFdoYXQncw0K
PiAtCSAqIG1vcmUsIGFsbCBwYWdlcyBpbiBbc3RhcnQsIGVuZCkgYXJlIGZyZWUgaW4gcGFnZSBh
bGxvY2F0b3IuDQo+IC0JICogV2hhdCB3ZSBhcmUgZ29pbmcgdG8gZG8gaXMgdG8gYWxsb2NhdGUg
YWxsIHBhZ2VzIGZyb20NCj4gLQkgKiBbc3RhcnQsIGVuZCkgKHRoYXQgaXMgcmVtb3ZlIHRoZW0g
ZnJvbSBwYWdlIGFsbG9jYXRvcikuDQo+IC0JICoNCj4gLQkgKiBUaGUgb25seSBwcm9ibGVtIGlz
IHRoYXQgcGFnZXMgYXQgdGhlIGJlZ2lubmluZyBhbmQgYXQgdGhlDQo+IC0JICogZW5kIG9mIGlu
dGVyZXN0aW5nIHJhbmdlIG1heSBiZSBub3QgYWxpZ25lZCB3aXRoIHBhZ2VzIHRoYXQNCj4gLQkg
KiBwYWdlIGFsbG9jYXRvciBob2xkcywgaWUuIHRoZXkgY2FuIGJlIHBhcnQgb2YgaGlnaGVyIG9y
ZGVyDQo+IC0JICogcGFnZXMuICBCZWNhdXNlIG9mIHRoaXMsIHdlIHJlc2VydmUgdGhlIGJpZ2dl
ciByYW5nZSBhbmQNCj4gLQkgKiBvbmNlIHRoaXMgaXMgZG9uZSBmcmVlIHRoZSBwYWdlcyB3ZSBh
cmUgbm90IGludGVyZXN0ZWQgaW4uDQo+IC0JICoNCj4gLQkgKiBXZSBkb24ndCBoYXZlIHRvIGhv
bGQgem9uZS0+bG9jayBoZXJlIGJlY2F1c2UgdGhlIHBhZ2VzIGFyZQ0KPiAtCSAqIGlzb2xhdGVk
IHRodXMgdGhleSB3b24ndCBnZXQgcmVtb3ZlZCBmcm9tIGJ1ZGR5Lg0KPiAtCSAqLw0KPiAtDQo+
IC0Jb3JkZXIgPSAwOw0KPiAtCW91dGVyX3N0YXJ0ID0gc3RhcnQ7DQo+IC0Jd2hpbGUgKCFQYWdl
QnVkZHkocGZuX3RvX3BhZ2Uob3V0ZXJfc3RhcnQpKSkgew0KPiAtCQlpZiAoKytvcmRlciA+PSBN
QVhfT1JERVIpIHsNCj4gLQkJCW91dGVyX3N0YXJ0ID0gc3RhcnQ7DQo+IC0JCQlicmVhazsNCj4g
LQkJfQ0KPiAtCQlvdXRlcl9zdGFydCAmPSB+MFVMIDw8IG9yZGVyOw0KPiAtCX0NCj4gLQ0KPiAt
CWlmIChvdXRlcl9zdGFydCAhPSBzdGFydCkgew0KPiAtCQlvcmRlciA9IGJ1ZGR5X29yZGVyKHBm
bl90b19wYWdlKG91dGVyX3N0YXJ0KSk7DQo+IC0NCj4gLQkJLyoNCj4gLQkJICogb3V0ZXJfc3Rh
cnQgcGFnZSBjb3VsZCBiZSBzbWFsbCBvcmRlciBidWRkeSBwYWdlIGFuZA0KPiAtCQkgKiBpdCBk
b2Vzbid0IGluY2x1ZGUgc3RhcnQgcGFnZS4gQWRqdXN0IG91dGVyX3N0YXJ0DQo+IC0JCSAqIGlu
IHRoaXMgY2FzZSB0byByZXBvcnQgZmFpbGVkIHBhZ2UgcHJvcGVybHkNCj4gLQkJICogb24gdHJh
Y2Vwb2ludCBpbiB0ZXN0X3BhZ2VzX2lzb2xhdGVkKCkNCj4gLQkJICovDQo+IC0JCWlmIChvdXRl
cl9zdGFydCArICgxVUwgPDwgb3JkZXIpIDw9IHN0YXJ0KQ0KPiAtCQkJb3V0ZXJfc3RhcnQgPSBz
dGFydDsNCj4gLQl9DQo+IC0NCj4gICAJLyogTWFrZSBzdXJlIHRoZSByYW5nZSBpcyByZWFsbHkg
aXNvbGF0ZWQuICovDQo+IC0JaWYgKHRlc3RfcGFnZXNfaXNvbGF0ZWQob3V0ZXJfc3RhcnQsIGVu
ZCwgMCkpIHsNCj4gKwlpZiAodGVzdF9wYWdlc19pc29sYXRlZChhbGxvY19zdGFydCwgYWxsb2Nf
ZW5kLCAwKSkgew0KPiAgIAkJcmV0ID0gLUVCVVNZOw0KPiAgIAkJZ290byBkb25lOw0KPiAgIAl9
DQo+ICAgDQo+ICAgCS8qIEdyYWIgaXNvbGF0ZWQgcGFnZXMgZnJvbSBmcmVlbGlzdHMuICovDQo+
IC0Jb3V0ZXJfZW5kID0gaXNvbGF0ZV9mcmVlcGFnZXNfcmFuZ2UoJmNjLCBvdXRlcl9zdGFydCwg
ZW5kKTsNCj4gKwlvdXRlcl9lbmQgPSBpc29sYXRlX2ZyZWVwYWdlc19yYW5nZSgmY2MsIGFsbG9j
X3N0YXJ0LCBhbGxvY19lbmQpOw0KPiAgIAlpZiAoIW91dGVyX2VuZCkgew0KPiAgIAkJcmV0ID0g
LUVCVVNZOw0KPiAgIAkJZ290byBkb25lOw0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qIEZyZWUgaGVh
ZCBhbmQgdGFpbCAoaWYgYW55KSAqLw0KPiAtCWlmIChzdGFydCAhPSBvdXRlcl9zdGFydCkNCj4g
LQkJZnJlZV9jb250aWdfcmFuZ2Uob3V0ZXJfc3RhcnQsIHN0YXJ0IC0gb3V0ZXJfc3RhcnQpOw0K
PiAtCWlmIChlbmQgIT0gb3V0ZXJfZW5kKQ0KPiAtCQlmcmVlX2NvbnRpZ19yYW5nZShlbmQsIG91
dGVyX2VuZCAtIGVuZCk7DQo+ICsJaWYgKHN0YXJ0ICE9IGFsbG9jX3N0YXJ0KQ0KPiArCQlmcmVl
X2NvbnRpZ19yYW5nZShhbGxvY19zdGFydCwgc3RhcnQgLSBhbGxvY19zdGFydCk7DQo+ICsJaWYg
KGVuZCAhPSBhbGxvY19lbmQpDQo+ICsJCWZyZWVfY29udGlnX3JhbmdlKGVuZCwgYWxsb2NfZW5k
IC0gZW5kKTsNCj4gICANCj4gICBkb25lOg0KPiAtCXVuZG9faXNvbGF0ZV9wYWdlX3JhbmdlKHBm
bl9tYXhfYWxpZ25fZG93bihzdGFydCksDQo+IC0JCQkJcGZuX21heF9hbGlnbl91cChlbmQpLCBt
aWdyYXRldHlwZSk7DQo+ICsJdW5kb19pc29sYXRlX3BhZ2VfcmFuZ2UoYWxsb2Nfc3RhcnQsDQo+
ICsJCQkJYWxsb2NfZW5kLCBtaWdyYXRldHlwZSk7DQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0K
PiAgIEVYUE9SVF9TWU1CT0woYWxsb2NfY29udGlnX3JhbmdlKTsNCj4gZGlmZiAtLWdpdCBhL21t
L3BhZ2VfaXNvbGF0aW9uLmMgYi9tbS9wYWdlX2lzb2xhdGlvbi5jDQo+IGluZGV4IDY0ZDA5M2Fi
ODNlYy4uMDI1NmQ1ZTEwMzJjIDEwMDY0NA0KPiAtLS0gYS9tbS9wYWdlX2lzb2xhdGlvbi5jDQo+
ICsrKyBiL21tL3BhZ2VfaXNvbGF0aW9uLmMNCj4gQEAgLTI4NSw2ICsyODUsOCBAQCBfX2ZpcnN0
X3ZhbGlkX3BhZ2UodW5zaWduZWQgbG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpDQo+
ICAgICoJCQkJCSBhbmQgUGFnZU9mZmxpbmUoKSBwYWdlcy4NCj4gICAgKgkJCVJFUE9SVF9GQUlM
VVJFIC0gcmVwb3J0IGRldGFpbHMgYWJvdXQgdGhlIGZhaWx1cmUgdG8NCj4gICAgKgkJCWlzb2xh
dGUgdGhlIHJhbmdlDQo+ICsgKiBAZ2ZwX2ZsYWdzOgkJR0ZQIGZsYWdzIHVzZWQgZm9yIG1pZ3Jh
dGluZyBwYWdlcyB0aGF0IHNpdCBhY3Jvc3MgdGhlDQo+ICsgKgkJCXJhbmdlIGJvdW5kYXJpZXMu
DQo+ICAgICoNCj4gICAgKiBNYWtpbmcgcGFnZS1hbGxvY2F0aW9uLXR5cGUgdG8gYmUgTUlHUkFU
RV9JU09MQVRFIG1lYW5zIGZyZWUgcGFnZXMgaW4NCj4gICAgKiB0aGUgcmFuZ2Ugd2lsbCBuZXZl
ciBiZSBhbGxvY2F0ZWQuIEFueSBmcmVlIHBhZ2VzIGFuZCBwYWdlcyBmcmVlZCBpbiB0aGUNCj4g
QEAgLTI5Myw2ICsyOTUsMTAgQEAgX19maXJzdF92YWxpZF9wYWdlKHVuc2lnbmVkIGxvbmcgcGZu
LCB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQ0KPiAgICAqIHBhZ2VzIGluIHRoZSByYW5nZSBmaW5h
bGx5LCB0aGUgY2FsbGVyIGhhdmUgdG8gZnJlZSBhbGwgcGFnZXMgaW4gdGhlIHJhbmdlLg0KPiAg
ICAqIHRlc3RfcGFnZV9pc29sYXRlZCgpIGNhbiBiZSB1c2VkIGZvciB0ZXN0IGl0Lg0KPiAgICAq
DQo+ICsgKiBUaGUgZnVuY3Rpb24gZmlyc3QgdHJpZXMgdG8gaXNvbGF0ZSB0aGUgcGFnZWJsb2Nr
cyBhdCB0aGUgYmVnaW5uaW5nIGFuZCBlbmQNCj4gKyAqIG9mIHRoZSByYW5nZSwgc2luY2UgdGhl
cmUgbWlnaHQgYmUgcGFnZXMgYWNyb3NzIHRoZSByYW5nZSBib3VuZGFyaWVzLg0KPiArICogQWZ0
ZXJ3YXJkcywgaXQgaXNvbGF0ZXMgdGhlIHJlc3Qgb2YgdGhlIHJhbmdlLg0KPiArICoNCj4gICAg
KiBUaGVyZSBpcyBubyBoaWdoIGxldmVsIHN5bmNocm9uaXphdGlvbiBtZWNoYW5pc20gdGhhdCBw
cmV2ZW50cyB0d28gdGhyZWFkcw0KPiAgICAqIGZyb20gdHJ5aW5nIHRvIGlzb2xhdGUgb3Zlcmxh
cHBpbmcgcmFuZ2VzLiBJZiB0aGlzIGhhcHBlbnMsIG9uZSB0aHJlYWQNCj4gICAgKiB3aWxsIG5v
dGljZSBwYWdlYmxvY2tzIGluIHRoZSBvdmVybGFwcGluZyByYW5nZSBhbHJlYWR5IHNldCB0byBp
c29sYXRlLg0KPiBAQCAtMzEzLDIxICszMTksMzggQEAgX19maXJzdF92YWxpZF9wYWdlKHVuc2ln
bmVkIGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQ0KPiAgICAqIFJldHVybjogMCBv
biBzdWNjZXNzIGFuZCAtRUJVU1kgaWYgYW55IHBhcnQgb2YgcmFuZ2UgY2Fubm90IGJlIGlzb2xh
dGVkLg0KPiAgICAqLw0KPiAgIGludCBzdGFydF9pc29sYXRlX3BhZ2VfcmFuZ2UodW5zaWduZWQg
bG9uZyBzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcgZW5kX3BmbiwNCj4gLQkJCSAgICAgdW5zaWdu
ZWQgbWlncmF0ZXR5cGUsIGludCBmbGFncykNCj4gKwkJCSAgICAgdW5zaWduZWQgbWlncmF0ZXR5
cGUsIGludCBmbGFncywgZ2ZwX3QgZ2ZwX2ZsYWdzKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9u
ZyBwZm47DQo+ICAgCXN0cnVjdCBwYWdlICpwYWdlOw0KPiArCS8qIGlzb2xhdGlvbiBpcyBkb25l
IGF0IHBhZ2UgYmxvY2sgZ3JhbnVsYXJpdHkgKi8NCj4gKwl1bnNpZ25lZCBsb25nIGlzb2xhdGVf
c3RhcnQgPSBBTElHTl9ET1dOKHN0YXJ0X3BmbiwgcGFnZWJsb2NrX25yX3BhZ2VzKTsNCj4gKwl1
bnNpZ25lZCBsb25nIGlzb2xhdGVfZW5kID0gQUxJR04oZW5kX3BmbiwgcGFnZWJsb2NrX25yX3Bh
Z2VzKTsNCj4gKwlpbnQgcmV0Ow0KPiAgIA0KPiAtCXVuc2lnbmVkIGxvbmcgaXNvbGF0ZV9zdGFy
dCA9IHBmbl9tYXhfYWxpZ25fZG93bihzdGFydF9wZm4pOw0KPiAtCXVuc2lnbmVkIGxvbmcgaXNv
bGF0ZV9lbmQgPSBwZm5fbWF4X2FsaWduX3VwKGVuZF9wZm4pOw0KPiArCS8qIGlzb2xhdGUgW2lz
b2xhdGVfc3RhcnQsIGlzb2xhdGVfc3RhcnQgKyBwYWdlYmxvY2tfbnJfcGFnZXNdIHBhZ2VibG9j
ayAqLw0KPiArCXJldCA9IGlzb2xhdGVfc2luZ2xlX3BhZ2VibG9jayhpc29sYXRlX3N0YXJ0LCBn
ZnBfZmxhZ3MsIDApOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkv
KiBpc29sYXRlIFtpc29sYXRlX2VuZCAtIHBhZ2VibG9ja19ucl9wYWdlcywgaXNvbGF0ZV9lbmRd
IHBhZ2VibG9jayAqLw0KPiArCXJldCA9IGlzb2xhdGVfc2luZ2xlX3BhZ2VibG9jayhpc29sYXRl
X2VuZCwgZ2ZwX2ZsYWdzLCAxKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCXVuc2V0X21pZ3JhdGV0
eXBlX2lzb2xhdGUocGZuX3RvX3BhZ2UoaXNvbGF0ZV9zdGFydCksIG1pZ3JhdGV0eXBlKTsNCj4g
KwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICAgDQo+IC0JZm9yIChwZm4gPSBpc29sYXRlX3N0YXJ0
Ow0KPiAtCSAgICAgcGZuIDwgaXNvbGF0ZV9lbmQ7DQo+ICsJLyogc2tpcCBpc29sYXRlZCBwYWdl
YmxvY2tzIGF0IHRoZSBiZWdpbm5pbmcgYW5kIGVuZCAqLw0KPiArCWZvciAocGZuID0gaXNvbGF0
ZV9zdGFydCArIHBhZ2VibG9ja19ucl9wYWdlczsNCj4gKwkgICAgIHBmbiA8IGlzb2xhdGVfZW5k
IC0gcGFnZWJsb2NrX25yX3BhZ2VzOw0KPiAgIAkgICAgIHBmbiArPSBwYWdlYmxvY2tfbnJfcGFn
ZXMpIHsNCj4gICAJCXBhZ2UgPSBfX2ZpcnN0X3ZhbGlkX3BhZ2UocGZuLCBwYWdlYmxvY2tfbnJf
cGFnZXMpOw0KPiAgIAkJaWYgKHBhZ2UgJiYgc2V0X21pZ3JhdGV0eXBlX2lzb2xhdGUocGFnZSwg
bWlncmF0ZXR5cGUsIGZsYWdzLA0KPiAgIAkJCQkJc3RhcnRfcGZuLCBlbmRfcGZuKSkgew0KPiAg
IAkJCXVuZG9faXNvbGF0ZV9wYWdlX3JhbmdlKGlzb2xhdGVfc3RhcnQsIHBmbiwgbWlncmF0ZXR5
cGUpOw0KPiArCQkJdW5zZXRfbWlncmF0ZXR5cGVfaXNvbGF0ZSgNCj4gKwkJCQlwZm5fdG9fcGFn
ZShpc29sYXRlX2VuZCAtIHBhZ2VibG9ja19ucl9wYWdlcyksDQo+ICsJCQkJbWlncmF0ZXR5cGUp
Ow0KPiAgIAkJCXJldHVybiAtRUJVU1k7DQo+ICAgCQl9DQo+ICAgCX0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
