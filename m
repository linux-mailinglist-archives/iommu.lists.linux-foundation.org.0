Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D44DDB93
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 15:23:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F10E48480A;
	Fri, 18 Mar 2022 14:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK1z03EpXP7A; Fri, 18 Mar 2022 14:23:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DAB1F84824;
	Fri, 18 Mar 2022 14:22:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB7F1C000B;
	Fri, 18 Mar 2022 14:22:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6808DC000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 14:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D2140C18
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 14:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7aFgBswcuOZ for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 14:22:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::616])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B78B40510
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 14:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL7H8ebI+gJ2Dt1cD/+hvIFJdGKVWp8oHD+49x7Js3cflVyN214cBuvkorXYR2QwClgmIp+eFDw/EC6PnSytaTV8E2dsCugu8BgXqINsS/bkFyRJpofv3bQscDLkqhiz8M8Y0mmFA7ukGOBXg8Van6G/0HUWzFQ6kNdkd0sVlcRDHXNvULk83u3mw2i7W/6CAdMPorsAHJRTL6jHBPpltgvV3KRFuPbAna+9pl0ok4Ahr07rM1ZJm+PiZBxNahHFj/NhnsWkmX+nch1/7Usvki0fdeHvChFYeESzTMVVfsVDTVxxSBlCeQMb3SFgtLa5qwkYkmmH9/hBtsk1cKhYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/axPrQCzaT9Gz3pOreq4ZDwOeNj9Bc7ZmJuhi1Q2Zvg=;
 b=Byq+TLzXwBSjnLbHw+bq3HOKizGPz9kC33FIK0zw+2S22+L6ccDl/0FGHHrClHdokBOwCHoViAHNJlvoZZlzVHBaOI3R8gTYTHtEb2NFAFRikTu8Mw3tgF+WQ7ZZibRapGe3wFxRfJEw7tAjVn1QQWfH0m+cImWTVv9Ozg6xG1icS1q5dZ5Nv5YkUugxa9cv3SM7s8LpiAoBNITofvvxF30QqoM17Ix3gyYSmiNB6K8VqsZ3Mtqhmh26QCrW1R7LAGjrBVOmQrvVTcrHT6Y2S7B3R9iyRPxZY641/3Xly3+gnKqzd8KZdN2WEhAFzi1H7Xmbh4KHXyuTph1XcP1y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/axPrQCzaT9Gz3pOreq4ZDwOeNj9Bc7ZmJuhi1Q2Zvg=;
 b=WSIKTGvsmqip0K89Va7YW1Ge/41z6lIraE4oULlooSh0Ec8aoM+RM4N2b+vdFqBvYbD0AZoi/38krU43rWCubNPxETjw+U4NJGfmhVNmFSRWz1UkbyMSlF5qVDSRrURQStUYhD1Dkb3R0NurnWLwTJy77ZXiSyXNoUB3+rNqX/4=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by CH2PR12MB4873.namprd12.prod.outlook.com (2603:10b6:610:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 14:22:51 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 14:22:51 +0000
To: Robin Murphy <robin.murphy@arm.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>
Subject: RE: [PATCH] thunderbolt: Make iommu_dma_protection more accurate
Thread-Topic: [PATCH] thunderbolt: Make iommu_dma_protection more accurate
Thread-Index: AQHYOhp64mDBz0dixEuTVKpvZlnwUazDzQWAgAA7e0CAAPynAIAABoAAgAAXSwCAAAwSAIAAAsCQ
Date: Fri, 18 Mar 2022 14:22:50 +0000
Message-ID: <BL1PR12MB5157ADF73BE48772C1F6C0E0E2139@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <2d01fa50c2650c730b0244929097737918e302e7.1647533152.git.robin.murphy@arm.com>
 <BL1PR12MB515783C0F998169D49D92A55E2129@BL1PR12MB5157.namprd12.prod.outlook.com>
 <BL1PR12MB51573F55B3C2B3922BAAA7F1E2129@BL1PR12MB5157.namprd12.prod.outlook.com>
 <YjRvMk1kcbMwJvx+@lahna> <65207fdf-c4ab-5165-dbda-8ab55b51adb7@arm.com>
 <YjSCWaq7Ej/2iJPp@lahna> <78fc0426-c22a-ec62-f92b-0019bea5947e@arm.com>
In-Reply-To: <78fc0426-c22a-ec62-f92b-0019bea5947e@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-18T14:18:13Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=15d3eae3-9dcf-4778-8d0c-c51d28eb5282;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-18T14:22:48Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 97757c3a-2235-4b88-977c-015be33bcf39
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 186cde2e-698b-4e58-604c-08da08eac8d7
x-ms-traffictypediagnostic: CH2PR12MB4873:EE_
x-microsoft-antispam-prvs: <CH2PR12MB487383997621120921E8A348E2139@CH2PR12MB4873.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e/5gr9ZFVDuIw5dI8gcShXSJDyeI8ty89NfVTSC9vMxha5rCCK+CfSR7R6WkmuzCSygfI33zbqF65OMvNS8G35L4wp5hFQXjODYCMKmMAxHqDc22KDnVEKHVjKQE4cjGqwggCeIOur/FpmgxG2WOZZQZ11p+2w2dTK7DyFC9e/N8MVI/b/SnCvUKg1F/Lm+UDfNq4J2F/ygb1qlkE8vzYKjLip6tVjpHqYCUGL0SFsyMnzfdtIpf7xsg/1ojIMt23sYzHTbO/xBCikdVwEMYXXGsievexY1P6wbfjyjgN1pZ+Yo3UvYO1RbxsmVyk2GvoaDR03wZ5gDimjiwAwv+iN/kuxzgSQAMaVnHDY0vPSUJzhjGpZOG4vw2cQqVBQe+PohgVtNlf5KzE8Mr2hHRk8lwkw3OYaIQkWcv7q2+GSuDU2mbdnfUxU2mrp0cmxncH1FRwigdloZWiTjZrgCAtJAfWQJ049lzADv2Nw2vokHUWAwF19tHdUN7x9/JkuL8q4X14fzlmAlZXjnhO+BWnDHO8I6qs8FTHyQ+PDM9hsGgOw5CUwB85ZPsu1uh6RiiBBBwhfMxx9NRg+10iiIiw6QAypOVbzsnOD+EeqCfB8chVja0YuRS+6bi935X4EqsDnxVYyr/FzghJP9WCaXp46QxEjnAtXF4puymj9/i91U11AmvlupuZI0fy/tlc5kK+w2u5oX/v9uCAHeIfqSPjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(316002)(71200400001)(55016003)(54906003)(45080400002)(33656002)(2906002)(508600001)(83380400001)(6506007)(4326008)(5660300002)(38070700005)(7696005)(53546011)(8676002)(64756008)(66446008)(66946007)(66556008)(66476007)(76116006)(122000001)(186003)(38100700002)(26005)(52536014)(9686003)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjNkc1pFSlVJY0U5K3ZLVXR2NlJMNWJZR0Y2WGQvUzNTbzNNcmViejFjdW9P?=
 =?utf-8?B?NGpIS3VBMmd4elZaT252TDdKWDlsaThZTFFxVHlyYjZsZ1YxbkIzZWs2VG9q?=
 =?utf-8?B?NnloUUFPWUxPa01SOGo3SWZBcm0xV25Pb09EQXF4Y3BUVXM2ZXJFVlBKQ01i?=
 =?utf-8?B?NG1IYTNTQ04xQUQ5UC8rV2ZSVDNLcGNWOUxzdDJacVBBSzRLV1k5Unh2ZVlE?=
 =?utf-8?B?eFZtMnV2M0xrQjFKR2ZUZ21ZSzBhcnZYTXZqS2kwMkVQRUI3dTQvelRKTS9z?=
 =?utf-8?B?dEt0SVJGL29pT2xqNFgrUVNlbkhlWnMrK3pjamFoRm9xTDh2N1VXQ3dJaGlG?=
 =?utf-8?B?cGxGWERDVmJXR2RmUnd6ejEwenl1TnJ0UEpKN0pDRHB5TURHQm90azRVeFFn?=
 =?utf-8?B?dXh3SWxEUzJkLzBVdEhZa0ptOUFzTkhldzJ2Vjg3U2s2Z1RUMG5qSitYSzdu?=
 =?utf-8?B?YTR1dmswRjdZWUxOa2ZQbldHWGVaekFUN1pYRUsxWGJXLzg3MWRxVmQrNjBr?=
 =?utf-8?B?cVVLTjlSYm94ZmEraHZDa0tjWnA0cjlvY3lDb1crcVJ3L2ZNdmhnUGM4KzlS?=
 =?utf-8?B?a1RZa0RucmdFZGhZdjVnUDNKcmN3blVWTW02OXFMcXNocldnZWJxTGVhcGxS?=
 =?utf-8?B?SUoyM1ZYL3ptUVp4UmtHU09YMEliQXp5aXNHbWVLLzI5MUZ2T1dzMEw3TFJX?=
 =?utf-8?B?Vmk5dXIrQXh4U2duOXVVUS9RSjBiclE4R0d1RGVEc3lKdmNQU1hScE5lSzlH?=
 =?utf-8?B?UVh2b09zY09JbmF1ZEZWYnlrMXF5c3NyaktrWm9RdVJwQ05KMEU3a3pmTzlY?=
 =?utf-8?B?ZEZEU0FBZnVnMHc3OFBoSzBNcGVFWGlzNjBxd0FoRUFHQ0JwNUJlZmMrU1Vm?=
 =?utf-8?B?TGlaREtlU3hFL2x6Ri9hOTJTaWpmTHAycjFxWklaZlF5MEE4bUx5YkxKbExR?=
 =?utf-8?B?aDVPVHcySWc0a28rKytsN01QV2pTaEJROU96UGxLb2JSZ1pNMnpYcUNyN3F5?=
 =?utf-8?B?VkdYRGJ5OTcrTFlqbmdRdjhrRmVsTGNkSXJQNTRsemozVG0yVGhwTVJsQ05J?=
 =?utf-8?B?YUUxWG13UnZpL2h1TDIraWV0bVIrMmhzR0J4bVhxUzQvSUxiWFVITG5sU014?=
 =?utf-8?B?Wk9DR0RidXcrQWxmSUJPMHNaR3F5ckFBbHRyaDJOTVlBeU1majJBTkpsNVFk?=
 =?utf-8?B?NW9vdGJsMTI3RU5LSDF6akFwaXF0ZDlib1FjV0kwanV6enQ2bExKOTFrT1Fj?=
 =?utf-8?B?TS9RdjkwV29SQ0xPU0UrZ3NCbDBXeTdXZWlpNDQzM3daWU85c2hqTmRESUNw?=
 =?utf-8?B?cVIzM1AwcWRuT0lRVklxdm1rN1JBUlorK0E4WnZyejhkckg2RVNjU3BYd1FX?=
 =?utf-8?B?ampVTWlTdXRoSyttbFlVOWNxbnIyR3RWNUNSVG9RYTRYNUREMS9BS3BzMXdr?=
 =?utf-8?B?cTNENkl2eGYveG1Nck1MR1p2NkRYYWpKRjBEM3B2RFdHTjgxR1JzRUdGd3Fh?=
 =?utf-8?B?akxpN1dOZ1RRVWs1V1BBRS9qWXErYVFGM2dHcnhpMm5YMjlDK0d1V2QrQVhG?=
 =?utf-8?B?WnpmVDVOYWhUT0Y4UGFTNTF1MTVtTFRwNU9JeHZadXVzcFhTZmM0SU02b2dP?=
 =?utf-8?B?NTluUG1yaUFwenBEU25OMURMMStsc1pJMGluL2tTMERVVGhrMFovd2pkaTRZ?=
 =?utf-8?B?NlRaUkpRNVRTK2hyZkF1SDlpd2QzaDMvdTV5djcwSnFMUGhEVEpFQytxOGJj?=
 =?utf-8?B?ck54OTFnSFNwZ2RPbm5yUnIrT1ZBTUkvZFVJYmZHRDFBdW1TNmYvQzFjdjd0?=
 =?utf-8?B?VzcyTXhCTjZnTHhoYk9jZGNuSjEyN2JhZlhxczhkc2xtbGJwNmtHR1EvZTdU?=
 =?utf-8?B?T2M5U0Z1U1RQVjF5RkcxYmhHZys1R3dqUUZ1aE5wOHpRY0ZPN0pwdk1wbFZh?=
 =?utf-8?Q?OmcrXZfhp8RJfVobwJksrzoCHT13O3nP?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186cde2e-698b-4e58-604c-08da08eac8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 14:22:50.9711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o21v2QUq/xrT/YJXCxfavZFuuVcht5VbpnI03HK/Zvjiq9yH+AGAhE8SUKitWDBuIXr/zrVrE7WqrHi/qvc39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4873
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "andreas.noever@gmail.com" <andreas.noever@gmail.com>
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
From: "Limonciello, Mario via iommu" <iommu@lists.linux-foundation.org>
Reply-To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

[Public]

> -----Original Message-----
> From: Robin Murphy <robin.murphy@arm.com>
> Sent: Friday, March 18, 2022 09:08
> To: mika.westerberg@linux.intel.com
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>;
> andreas.noever@gmail.com; michael.jamet@intel.com;
> YehezkelShB@gmail.com; linux-usb@vger.kernel.org; linux-
> kernel@vger.kernel.org; iommu@lists.linux-foundation.org; linux-
> pci@vger.kernel.org
> Subject: Re: [PATCH] thunderbolt: Make iommu_dma_protection more
> accurate
> 
> On 2022-03-18 13:25, mika.westerberg@linux.intel.com wrote:
> > Hi Robin,
> >
> > On Fri, Mar 18, 2022 at 12:01:42PM +0000, Robin Murphy wrote:
> >>> This adds quite a lot code and complexity, and honestly I would like to
> >>> keep it as simple as possible (and this is not enough because we need to
> >>> make sure the DMAR bit is there so that none of the possible connected
> >>> devices were able to overwrite our memory already).
> >>
> >> Shall we forget the standalone sibling check and just make the
> >> pdev->untrusted check directly in tb_acpi_add_link() then?
> >
> > I think we should leave tb_acpi_add_link() untouched if possible ;-)
> > This is because it is used to add the device links from firmware
> > description that we need for proper power management of the tunneled
> > devices. It has little to do with the identification of the external
> > facing DMA-capable PCIe ports.
> >
> > Furthermore these links only exists in USB4 software connection manager
> > systems so we do not have those in the existing Thunderbolt 3/4 systems
> > that use firmware based connection manager (pretty much all out there).
> >
> >> On reflection I guess the DMAR bit makes iommu_dma_protection
> >> functionally dependent on ACPI already, so we don't actually lose
> >> anything (and anyone can come back and revisit firmware-agnostic
> >> methods later if a need appears).
> >
> > I agree.
> 
> OK, so do we have any realistic options for identifying the correct PCI
> devices, if USB4 PCIe adapters might be anywhere relative to their
> associated NHI? Short of maintaining a list of known IDs, the only
> thought I have left is that if we walk the whole PCI segment looking
> specifically for hotplug-capable Gen1 ports, any system modern enough to
> have Thunderbolt is *probably* not going to have any real PCIe Gen1
> hotplug slots, so maybe false negatives might be tolerable, but it still
> feels like a bit of a sketchy heuristic.
> 
> I suppose we could just look to see if any device anywhere is marked as
> external-facing, and hope that if firmware's done that much then it's
> done everything right. That's still at least slightly better than what
> we have today, but AFAICS still carries significant risk of a false
> positive for an add-in card that firmware didn't recognise.
> 
> I'm satisfied that we've come round to the right conclusion on the DMAR
> opt-in - I'm in the middle or writing up patches for that now - but even
> Microsoft's spec gives that as a separate requirement from the flagging
> of external ports, with both being necessary for Kernel DMA Protection.
> 
> Robin.

The thunderbolt driver already has a good idea whether it's using software
CM or firmware CM.  How about if we use that to make a decision?

If running firmware CM presumably that is a fixed quantity of machines that will
dwindle over time as OEMs release new HW with SW CM designs. So maybe
leave things "as is" for those - opt in bit is sufficient for this check.

And then if running software CM then make it mandatory that any created links
are set untrusted AND some pre-boot bits are set to get iommu dma protection
set.  We effectively end up with the same requirements as Microsoft has in
their spec for new hardware then, and don't break any old hardware that
doesn't have the links made and relies on firmware for the CM.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
