Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B12037F5
	for <lists.iommu@lfdr.de>; Mon, 22 Jun 2020 15:27:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F36186DAF;
	Mon, 22 Jun 2020 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iC55Jr2FiWkP; Mon, 22 Jun 2020 13:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AED586D8D;
	Mon, 22 Jun 2020 13:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2DC8C08A2;
	Mon, 22 Jun 2020 13:27:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6377AC016F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 13:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D1A68808F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 13:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-cYh7zcg7rM for <iommu@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 13:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0ABF588012
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 13:27:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDEEC50pPC6iLJGCZZjRBGhq44xviGVSiKBtu4DTt3FjVFtmI2S5wKcG0G73yipzIX6oDU7KZoUbdip3yQiAfhDDwLy7vSD1dw3Basszfmuf9hnoHd6GYQvzrZuRCdvKsN6OwcjPRbTiTF0+Ry+hrXHnlSTyL6wRmdpNbPa+VGBfygso8BxXoUVRQq9L7QuJ2KUgP04NwLwR58lfOhbvjBugPEFppL7owoOCrWpReuY3EtLot63/iOZC7L84IJc9CvcYKNN7W/R86mnkjiOevreFyTCB5rKuVvzATMflehFxiJW7Xs4OJUOuLkZ8FZ7Qc4WBMobSN2kutIvDhaWfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRYQoZ5H1TPJjWCVT8S5DZS5cjDSG05Tkg8JhBfpSaI=;
 b=LJhDT5KdhFxIBHNmqEVJI67KljrCWUGm4YRBGC40sgbeXR6zm4x/iVvHbi3cxZuOZyIjslhC74rJo9KC8Rud2Ks8vvoAZWyAd35gLJHiaTWXoX220NKBZDIEGfej1Z+PiImoREvDUNjGq7Q/WT4xOzvptk6qaSM5Vur8WCjzgpnKBjKy1f7ueoA2is7Oh0idSkCV/EUrv67JaBR65VUHLTFCBCe9ua1UTFkAlrTVdt5lCRyolCbRBkut0nmJwEReM8hT69OJKPLEfoyFtlOUqXZQPa1HljT8/2hKAHXXuxBx4jEUDn7Qhu2fUDG5mdmmtIeoPsCSB7GonUjCguimEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRYQoZ5H1TPJjWCVT8S5DZS5cjDSG05Tkg8JhBfpSaI=;
 b=taZqGJIhg5TuCs+QwikL85oeuajB+bNzvl3lfLC08pYXkYtjzdv6Uhfslq8EiXx82g1mCsooHctlQD0pyENGf8DnxDpGwyduMB0EDfVnB4JP5w28OqGcPQ7eX5uoDBvLGL56ae40YPOZvVfilNyYNjR19u+G0CMYcSBYm9NYmEE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4577.namprd12.prod.outlook.com (2603:10b6:5:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 13:27:48 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:27:48 +0000
Subject: Re: [PATCH v7 04/36] drm: amdgpu: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103655eucas1p28ea4bf59428550217c8962666d6f077b@eucas1p2.samsung.com>
 <20200619103636.11974-5-m.szyprowski@samsung.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bfbdf1ee-c970-d862-cc81-4712c34b7685@amd.com>
Date: Mon, 22 Jun 2020 15:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200619103636.11974-5-m.szyprowski@samsung.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::37) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0132.eurprd06.prod.outlook.com (2603:10a6:208:ab::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 13:27:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fcc1676-6187-43cc-1b50-08d816b00e42
X-MS-TrafficTypeDiagnostic: DM6PR12MB4577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45777D224B535FCBC3BEB6C683970@DM6PR12MB4577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNl3O9rzf6HMUcZUHlQaBbBLbE3tAfhoinQ2lEp/pYx4nGlAgMhsbZ0diWyE6FkWjbIaeDoNpRsnP/hsdVmsoNkpyseBQ4df79mEYmKfG+oze03JUo7KwidpoOYv5AwUbic/+4ciHUQgObM417ZKLmnFA6QgBF9CzhW98gHOOHVlx2w3w/iHOfJd1FdMzP5shkPnKNOto1xUEaaLXFEmRK6k7yNyaoo9K1miidKaoTrOvIBWPTYR83RjKx74lrc2q/pE9kZ/Au+3bHjF19vfCmPi/LWSDDP1lvPEDZUkveowJe8iacys1aSdlzSm8FXRE5/Ujxb9IYFzOCYwxt3VlaKAKGDFrtq9eBkGze87QJf+zZsGmfLimysttst2SK8s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(54906003)(52116002)(478600001)(6486002)(36756003)(16526019)(186003)(7416002)(316002)(2616005)(2906002)(31696002)(86362001)(6666004)(31686004)(66476007)(4326008)(83380400001)(66946007)(8936002)(8676002)(5660300002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: i7pPeDmDKemDS0xqLiBqG4KEj5Hf/UubSHYecnB4kTaelcDXJKeup58XOrbWLf2zQAqgJG4U23FTLHTqqPAT6HvpKAS31yJ+BLlosIWwI9NeLL5Hk0IZQbt3QPnCF/mqhK5gBWm3AaAmdxCcCQ81qKmxKh33IWwzMMEk2118apwp09ZaTnhC2z+ifQsnT7FjIayQSzS2chsTZknLVL5l9AWRBaLsqeYzW7aesaFtkJbtp8Ws8FY2WzW0/l+BYtE1yYG3cEoD3c7Hn+DOxHkgVvnCdCb8g5a1YSowvLjvOzt+rWPIU+vOl1OIoybrWyzBbM2HjzkuXs9gcLirNjN0eB8/RPQojBJIg5d/3GMqrWuPoIOaR4DyzgGHLJIpf7ZGxuCfka7BlCgDADe0xaCWlJI/1Sqbi+mEEJpccygwwngaZXGdhevH6Wp5JRVdWohb8RXC6hrUZpx5ZJw3EQ9ITx3ubG1BBsbVjFCkkTLzGvFfw2XW5CPKb4FVcVmtepMB1FP659YR94ZCrGVuRhg/8DWs/Un7sh5S67t34OB3tfCxCHACYMFdHnsW5PSg6kyk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcc1676-6187-43cc-1b50-08d816b00e42
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:27:48.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9fpi1OOFRn6KwrPuzeWvO1lvcJajrPO5QgZWjoG/Y/b2k1Dhe2BoA8mZM6Lm5SA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4577
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

QW0gMTkuMDYuMjAgdW0gMTI6MzYgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+IFRoZSBEb2N1
bWVudGF0aW9uL0RNQS1BUEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IHRoZSBkbWFfbWFwX3NnKCkg
ZnVuY3Rpb24KPiByZXR1cm5zIHRoZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmllcyBpbiB0
aGUgRE1BIGFkZHJlc3Mgc3BhY2UuCj4gSG93ZXZlciB0aGUgc3Vic2VxdWVudCBjYWxscyB0byB0
aGUgZG1hX3N5bmNfc2dfZm9yX3tkZXZpY2UsY3B1fSgpIGFuZAo+IGRtYV91bm1hcF9zZyBtdXN0
IGJlIGNhbGxlZCB3aXRoIHRoZSBvcmlnaW5hbCBudW1iZXIgb2YgdGhlIGVudHJpZXMKPiBwYXNz
ZWQgdG8gdGhlIGRtYV9tYXBfc2coKS4KPgo+IHN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBz
dHJ1Y3R1cmUgdXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCj4gbWVtb3J5IGJ1
ZmZlciwgdXNlZCBjb21tb25seSBpbiB0aGUgRFJNIGFuZCBncmFwaGljcyBzdWJzeXN0ZW1zLiBJ
dAo+IGNvbnNpc3RzIG9mIGEgc2NhdHRlcmxpc3Qgd2l0aCBtZW1vcnkgcGFnZXMgYW5kIERNQSBh
ZGRyZXNzZXMgKHNnbCBlbnRyeSksCj4gYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJs
aXN0IGVudHJpZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKPiBhbmQgRE1BIG1hcHBl
ZCBwYWdlcyAobmVudHMgZW50cnkpLgo+Cj4gSXQgdHVybmVkIG91dCB0aGF0IGl0IHdhcyBhIGNv
bW1vbiBtaXN0YWtlIHRvIG1pc3VzZSBuZW50cyBhbmQgb3JpZ19uZW50cwo+IGVudHJpZXMsIGNh
bGxpbmcgRE1BLW1hcHBpbmcgZnVuY3Rpb25zIHdpdGggYSB3cm9uZyBudW1iZXIgb2YgZW50cmll
cyBvcgo+IGlnbm9yaW5nIHRoZSBudW1iZXIgb2YgbWFwcGVkIGVudHJpZXMgcmV0dXJuZWQgYnkg
dGhlIGRtYV9tYXBfc2coKQo+IGZ1bmN0aW9uLgo+Cj4gVG8gYXZvaWQgc3VjaCBpc3N1ZXMsIGxl
dHMgdXNlIGEgY29tbW9uIGRtYS1tYXBwaW5nIHdyYXBwZXJzIG9wZXJhdGluZwo+IGRpcmVjdGx5
IG9uIHRoZSBzdHJ1Y3Qgc2dfdGFibGUgb2JqZWN0cyBhbmQgdXNlIHNjYXR0ZXJsaXN0IHBhZ2UK
PiBpdGVyYXRvcnMgd2hlcmUgcG9zc2libGUuIFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJl
ZmVyZW5jZXMgdG8gdGhlCj4gbmVudHMgYW5kIG9yaWdfbmVudHMgZW50cmllcywgbWFraW5nIHRo
ZSBjb2RlIHJvYnVzdCwgZWFzaWVyIHRvIGZvbGxvdwo+IGFuZCBjb3B5L3Bhc3RlIHNhZmUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCkFueSBvYmplY3Rpb24gdGhhdCB3ZSBwaWNrIHRoaXMgb25lIGFuZCB0aGUgcmFkZW9u
IHVwIGludG8gb3VyIGJyYW5jaGVzIApmb3IgdXBzdHJlYW1pbmc/CgpUaGF0IHNob3VsZCBhYm91
dCBjbGFzaGVzIHdpdGggb3RoZXIgZHJpdmVyIGNoYW5nZXMuCgpUaGFua3MsCkNocmlzdGlhbi4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jICB8
IDYgKysrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAg
ICB8IDkgKysrLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJh
bV9tZ3IuYyB8IDggKysrKy0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kbWFfYnVmLmMKPiBpbmRleCA0M2Q4ZWQ3ZGJkMDAuLjUxOWNlNDQyN2ZjZSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+IEBAIC0zMDcsOCAr
MzA3LDggQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqYW1kZ3B1X2RtYV9idWZfbWFwKHN0cnVj
dCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKPiAgIAkJaWYgKElTX0VSUihzZ3QpKQo+ICAg
CQkJcmV0dXJuIHNndDsKPiAgIAo+IC0JCWlmICghZG1hX21hcF9zZ19hdHRycyhhdHRhY2gtPmRl
diwgc2d0LT5zZ2wsIHNndC0+bmVudHMsIGRpciwKPiAtCQkJCSAgICAgIERNQV9BVFRSX1NLSVBf
Q1BVX1NZTkMpKQo+ICsJCWlmIChkbWFfbWFwX3NndGFibGUoYXR0YWNoLT5kZXYsIHNndCwgZGly
LAo+ICsJCQkJICAgIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpKQo+ICAgCQkJZ290byBlcnJvcl9m
cmVlOwo+ICAgCQlicmVhazsKPiAgIAo+IEBAIC0zNDksNyArMzQ5LDcgQEAgc3RhdGljIHZvaWQg
YW1kZ3B1X2RtYV9idWZfdW5tYXAoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAo+
ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8u
YmRldik7Cj4gICAKPiAgIAlpZiAoc2d0LT5zZ2wtPnBhZ2VfbGluaykgewo+IC0JCWRtYV91bm1h
cF9zZyhhdHRhY2gtPmRldiwgc2d0LT5zZ2wsIHNndC0+bmVudHMsIGRpcik7Cj4gKwkJZG1hX3Vu
bWFwX3NndGFibGUoYXR0YWNoLT5kZXYsIHNndCwgZGlyLCAwKTsKPiAgIAkJc2dfZnJlZV90YWJs
ZShzZ3QpOwo+ICAgCQlrZnJlZShzZ3QpOwo+ICAgCX0gZWxzZSB7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDUxMjlhOTk2ZTk0MS4uOTdmYjczZTVhNmFl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC0xMDI1
LDcgKzEwMjUsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fdHRfcGluX3VzZXJwdHIoc3RydWN0
IHR0bV90dCAqdHRtKQo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1k
Z3B1X3R0bV9hZGV2KHR0bS0+YmRldik7Cj4gICAJc3RydWN0IGFtZGdwdV90dG1fdHQgKmd0dCA9
ICh2b2lkICopdHRtOwo+IC0JdW5zaWduZWQgbmVudHM7Cj4gICAJaW50IHI7Cj4gICAKPiAgIAlp
bnQgd3JpdGUgPSAhKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1JFQURPTkxZ
KTsKPiBAQCAtMTA0MCw5ICsxMDM5LDggQEAgc3RhdGljIGludCBhbWRncHVfdHRtX3R0X3Bpbl91
c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKPiAgIAkJZ290byByZWxlYXNlX3NnOwo+ICAgCj4g
ICAJLyogTWFwIFNHIHRvIGRldmljZSAqLwo+IC0JciA9IC1FTk9NRU07Cj4gLQluZW50cyA9IGRt
YV9tYXBfc2coYWRldi0+ZGV2LCB0dG0tPnNnLT5zZ2wsIHR0bS0+c2ctPm5lbnRzLCBkaXJlY3Rp
b24pOwo+IC0JaWYgKG5lbnRzID09IDApCj4gKwlyID0gZG1hX21hcF9zZ3RhYmxlKGFkZXYtPmRl
diwgdHRtLT5zZywgZGlyZWN0aW9uLCAwKTsKPiArCWlmIChyKQo+ICAgCQlnb3RvIHJlbGVhc2Vf
c2c7Cj4gICAKPiAgIAkvKiBjb252ZXJ0IFNHIHRvIGxpbmVhciBhcnJheSBvZiBwYWdlcyBhbmQg
ZG1hIGFkZHJlc3NlcyAqLwo+IEBAIC0xMDczLDggKzEwNzEsNyBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfdHRtX3R0X3VucGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQo+ICAgCQlyZXR1cm47
Cj4gICAKPiAgIAkvKiB1bm1hcCB0aGUgcGFnZXMgbWFwcGVkIHRvIHRoZSBkZXZpY2UgKi8KPiAt
CWRtYV91bm1hcF9zZyhhZGV2LT5kZXYsIHR0bS0+c2ctPnNnbCwgdHRtLT5zZy0+bmVudHMsIGRp
cmVjdGlvbik7Cj4gLQo+ICsJZG1hX3VubWFwX3NndGFibGUoYWRldi0+ZGV2LCB0dG0tPnNnLCBk
aXJlY3Rpb24sIDApOwo+ICAgCXNnX2ZyZWVfdGFibGUodHRtLT5zZyk7Cj4gICAKPiAgICNpZiBJ
U19FTkFCTEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBpbmRleCBkMzk5ZTU4OTMxNzAuLmMyODFh
YTEzZjVlYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dnJhbV9tZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFt
X21nci5jCj4gQEAgLTQ3NywxMSArNDc3LDExIEBAIGludCBhbWRncHVfdnJhbV9tZ3JfYWxsb2Nf
c2d0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCWlmIChyKQo+ICAgCQlnb3RvIGVy
cm9yX2ZyZWU7Cj4gICAKPiAtCWZvcl9lYWNoX3NnKCgqc2d0KS0+c2dsLCBzZywgbnVtX2VudHJp
ZXMsIGkpCj4gKwlmb3JfZWFjaF9zZ3RhYmxlX3NnKCgqc2d0KSwgc2csIGkpCj4gICAJCXNnLT5s
ZW5ndGggPSAwOwo+ICAgCj4gICAJbm9kZSA9IG1lbS0+bW1fbm9kZTsKPiAtCWZvcl9lYWNoX3Nn
KCgqc2d0KS0+c2dsLCBzZywgbnVtX2VudHJpZXMsIGkpIHsKPiArCWZvcl9lYWNoX3NndGFibGVf
c2coKCpzZ3QpLCBzZywgaSkgewo+ICAgCQlwaHlzX2FkZHJfdCBwaHlzID0gKG5vZGUtPnN0YXJ0
IDw8IFBBR0VfU0hJRlQpICsKPiAgIAkJCWFkZXYtPmdtYy5hcGVyX2Jhc2U7Cj4gICAJCXNpemVf
dCBzaXplID0gbm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUOwo+IEBAIC01MDEsNyArNTAxLDcgQEAg
aW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Cj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIGVycm9yX3VubWFwOgo+IC0JZm9yX2VhY2hfc2coKCpz
Z3QpLT5zZ2wsIHNnLCBudW1fZW50cmllcywgaSkgewo+ICsJZm9yX2VhY2hfc2d0YWJsZV9zZygo
KnNndCksIHNnLCBpKSB7Cj4gICAJCWlmICghc2ctPmxlbmd0aCkKPiAgIAkJCWNvbnRpbnVlOwo+
ICAgCj4gQEAgLTUzMiw3ICs1MzIsNyBAQCB2b2lkIGFtZGdwdV92cmFtX21ncl9mcmVlX3NndChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+
ICAgCWludCBpOwo+ICAgCj4gLQlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIHNndC0+bmVudHMs
IGkpCj4gKwlmb3JfZWFjaF9zZ3RhYmxlX3NnKHNndCwgc2csIGkpCj4gICAJCWRtYV91bm1hcF9y
ZXNvdXJjZShkZXYsIHNnLT5kbWFfYWRkcmVzcywKPiAgIAkJCQkgICBzZy0+bGVuZ3RoLCBkaXIs
Cj4gICAJCQkJICAgRE1BX0FUVFJfU0tJUF9DUFVfU1lOQyk7CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
