Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6939DC1A
	for <lists.iommu@lfdr.de>; Mon,  7 Jun 2021 14:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA25605B3;
	Mon,  7 Jun 2021 12:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vbo3iRFGtqCF; Mon,  7 Jun 2021 12:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F0060687;
	Mon,  7 Jun 2021 12:20:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAB2C0001;
	Mon,  7 Jun 2021 12:20:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21D3DC0001
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2243402CD
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv9zIhZK604o for <iommu@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 12:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65CBC40312
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:19:52 +0000 (UTC)
IronPort-SDR: toLOtg0Uvb+imq7VmEUJ8MFjlWk/zuJdLkmrjnJh/AG11lltGcHvNTyoNTfDTr9KFOmkevkfSQ
 W3WjqXiTErHg==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="184292642"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="184292642"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 05:19:51 -0700
IronPort-SDR: eOCnaVVGR7FeUiN2W6fojq+naEYCY/vVONh+mCzaxEh9J2a6G3EGO30/Q6sRukqMABeaplo8DQ
 OEx1k+2vdEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="637253581"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2021 05:19:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 05:19:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 7 Jun 2021 05:19:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 7 Jun 2021 05:19:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAplvsHUjE7tlznTMWUjcHvLj2o791DM+S/MvdiOY8Ixi6w+5XYfVr+BBwZEpvIoNE0H/5sp7M1etjVjzdTfMYplFU96KJ1xlEU3R+25xjeKBCXtJeI/+wb5ivQrlDEV+tT7n2tozssBgsnSpOYHNJIM+/EQgJnWOYhQ2LXFPBSpUNqPhA8F9mDUMk0ee/QVzL9UBZjWMZZit9H1wrP4+QvxciKjbdgWUlso1mkQxUqGwLl6qK6tdfq7BnR6SmxiolKZaqsGQLnd/6tzBx5JZxSGs7gQULKq3OugyvMcG/4pJEkv5DxiZV+C5CwkzX7R5KaujIpiz7Pu6LfzxNA3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6ZfuZ2lZD6oCE/bbZYulNuFiPMiQn3C4d/7p5RtIMs=;
 b=WywOnlyL8HTZRt3SI5N/A8OOlJ5icIxVd9t57+ESG9Aq0JHJsIZBHLEj2eG491hGb0EaqfniHpoJbY9Uml+tUrGxkd6ErROFgzT8vdTW+dz4eusobZGNRQKw+5NGHcGGPO1MJzkkeAi166XW/nQRHg0AgX6rH6Yv/zJjh9OCd6nwYINx54te88M7CBZLQ0RLM843EGNBILBGS9A73hVayHbufLvU8XdWy69Oh0/9RbnvaeOh0zQ3S7lSUW6CkyrE+oJwyP7EEccpVO8QpmiB2Fj0FqpFik0HXxBDCO9sIDHWXZbvRPhxHnoEdNDFVoenQe37jJgVOz1QbAlkH6KwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6ZfuZ2lZD6oCE/bbZYulNuFiPMiQn3C4d/7p5RtIMs=;
 b=eqEn2odtLMI/WuRS2qqnH0sONOtZPXJy3QX+LW2bjGDxECwC2gMntvuszTA2DZRLB4lGQNjpzlt/ua91EtC2s8l7zM3r79AnmMndYStYquWQqIKYYYNsfSF0sOc35XD0wJvylQYwDZAwKBPQcEs+wi6aBo4Udgy8a2naQY132z4=
Received: from BN6PR11MB4068.namprd11.prod.outlook.com (2603:10b6:405:7c::31)
 by BN8PR11MB3762.namprd11.prod.outlook.com (2603:10b6:408:8d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 12:19:48 +0000
Received: from BN6PR11MB4068.namprd11.prod.outlook.com
 ([fe80::c464:6273:645c:4547]) by BN6PR11MB4068.namprd11.prod.outlook.com
 ([fe80::c464:6273:645c:4547%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 12:19:47 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Shenming Lu <lushenming@huawei.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>
Subject: RE: [RFC] /dev/ioasid uAPI proposal
Thread-Topic: [RFC] /dev/ioasid uAPI proposal
Thread-Index: AddSzQ970oLnVHLeQca/ysPD8zMJZwD0femAAAFbDAAABGFQgAAK/L6AAAqTPoAAF6VNAABOidYAABAzlwAArEzDMA==
Date: Mon, 7 Jun 2021 12:19:46 +0000
Message-ID: <BN6PR11MB4068FDFFF36C1F15046E0A0EC3389@BN6PR11MB4068.namprd11.prod.outlook.com>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <c9c066ae-2a25-0799-51a7-0ca47fff41a1@huawei.com>
 <aa1624bf-e472-2b66-1d20-54ca23c19fd2@linux.intel.com>
 <ed4f6e57-4847-3ed2-75de-cea80b2fbdb8@huawei.com>
 <01fe5034-42c8-6923-32f1-e287cc36bccc@linux.intel.com>
 <20210601173323.GN1002214@nvidia.com>
 <23a482f9-b88a-da98-3800-f3fd9ea85fbd@huawei.com>
 <20210603111914.653c4f61@jacob-builder>
 <eebe5926-efa0-8bab-e8d4-bd327669637f@huawei.com>
In-Reply-To: <eebe5926-efa0-8bab-e8d4-bd327669637f@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95ce0223-0074-42e6-79bd-08d929ae8a8f
x-ms-traffictypediagnostic: BN8PR11MB3762:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB376222B766AEC6C62A42B8A3C3389@BN8PR11MB3762.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Kz3c7b10aM7jAZsO7opm4YNmazmC1jtmqDLQU1sAM3NtZBaXuZROrwgdD1g3Qn5AkAmX3wGxIjYtPFgvLE6+nsMM6V59stbv8zD2KvbWzxau0bnU4D/ChIHHe60z/dFL9RwdFk2WHi3mYC9E9xfdoe5F76VlDKwdedn92hjmNF+/6CHBNB7z8ARRRZVK4ImGFUV/js+qRuALswo7VdbcKuzP316P8sqc8SsBeR//dwS89P1H2RLVzvFJdrSyTrhHTGhXyPl3Dm9tcfxXDGoiSd+EFX23OOZuSycRUEjDmWqYXJrtoqMuH04+eU7cENPx4r3zdCqW6gtXEkIpWOIwR5pu8TKRExsKYT/Bz7QTufDmBIlAYGp4m4wdQ4sg2cNB7xn1/fEekAC0c0DYszVBTk0DbDZJScWYJ41vuyzYyaO6BUxLJlT73jHgrkGPYcOUrDmYMzuNYxBUG8B1DH7vjQNBIRbOeHgc4Res9V/7WR5VFA2rEDD7EOVHS2AL3+61vxL8WDz1hdb/+x8LexzsKcqxgfL78NYyewilbQ23WW6Y6chRjPr6a3hdbDySdzKj96nUM4pMxhYqJv7H1DOqz59jw+M/uw/BIDsSR9TUfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4068.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(346002)(396003)(376002)(2906002)(7696005)(55016002)(5660300002)(66446008)(76116006)(66556008)(66946007)(478600001)(66476007)(54906003)(110136005)(122000001)(52536014)(64756008)(9686003)(26005)(53546011)(6506007)(7416002)(4326008)(186003)(71200400001)(86362001)(8676002)(8936002)(38100700002)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aFloYjhScEt0QnhmY1gwdW45Rk93UytCdCs0WmVRNkRrRS9SL3ExdlJNS2Jx?=
 =?utf-8?B?NGZiMmNpVlk3aWxYUXRsZUdqWmRaM3VKMCt4MWJPdzdES2dDNGNwZHBzbVJz?=
 =?utf-8?B?TW9rVFozTEwyN2lETURhcTQrRTZqenNzVkJxRTBwOTB1QTBkeXJuaG44MDhI?=
 =?utf-8?B?WDVNWjNBZzZjRzc5Y0hJRUs3cEgyeUJGQjhoYmVmZ1BxNDFZZnRRRDNTL2Vt?=
 =?utf-8?B?WFVQbkNjQ0JkVHl6ZUpKTWhFdEZ5Rmowdk9oLzAvUlZpYWlmdDl5aUZSVktq?=
 =?utf-8?B?cFVRdUxlcko5NGh0cWRDaXZ3M05EQXdaSnNsNjZRL09tQlBXME5mWG84dk5y?=
 =?utf-8?B?VGRZTjJnN2gvalBrRmkvbERsTWxCREVIK0FpUUxzVnhlSmdBUDAwc3hPYmxX?=
 =?utf-8?B?eGFSWFlIcGpNWThiR2pVRHp6ck5Iekp3MDdXTkZLcXJHVEl4NGZQK01ySGIw?=
 =?utf-8?B?bFhtd2xCNm1TeUM2aWpteWFRSmdibVA2TlVVZVdEOTNhZ0J3WDZURGRBVWxO?=
 =?utf-8?B?QTBwdXA5R1RBcjUxd00vWk0zSnBjNlRPQ1hjNjlrQ2lFYUVnUm9BbGRHNFdy?=
 =?utf-8?B?VU1RbFRSQkZmQ3ZVNlAyM0l1a2hMWlJ0MjhmU3JOSGtqMjJlYVVtWlhSdFhi?=
 =?utf-8?B?TTBWRVIxc3o2a245TEU2ZmM2Y0g1S2pITDBSYmZhd0x5TnpHQnA4WU8vL3dv?=
 =?utf-8?B?NTVKS0tIdnBhK1B0VkFoTlZsWG9lRUhpNVZuOU5FZkhUVnVoUEwvQlo2VThV?=
 =?utf-8?B?RkFwMFRMd2NuWUN0NjhsclNRaDdKMGR5SjVjMGEyS01YZ1ZGWVdGL2ZsVWlm?=
 =?utf-8?B?Y1NHR2pmRzRLRjhzcGZjbEtjYytYRlFTMERGZ3FsUHFZMnllcXVmUXpMYlZp?=
 =?utf-8?B?Q04zMnZ2OHUyVTZRUVZuUG5ZQnRldUV6VURpS1ZIdkRGVm1kRjRkZ3hSeStx?=
 =?utf-8?B?QWt2Nmc5c1BtTmRVS0FsR0liZHFRdnAzVWUyekp5MWNGNkpTMDZuWEpFcktK?=
 =?utf-8?B?Z1V5cmsvTFo0cHNPMHl1cDc1Nmw3Rm04VDZXTlhOZEsvZ1M0ckhya2Z3MlNO?=
 =?utf-8?B?cVlRK0tZbkJOeUdWNUY3dXN6ZTJ3a0FmOHI2OUdyVlR6YSttQTl0a2wvbkhS?=
 =?utf-8?B?ZGMrVkhFVUN1cFhJb3ZoajNpQ1RQMTR0TVgzKy9xRzVGT0hOOUdtQnZMaXRn?=
 =?utf-8?B?VkVud3ZRT3J5bHFneDZTenZVdG1hUDM3RzllNEtWTGJ1M3g0bXFzQ24vVzBR?=
 =?utf-8?B?d0dsZDJjeEFpTDVsaUxBYVlGbmhOQnFhYXBUbS9aOXpRbHlnbkkzTjNvRmdG?=
 =?utf-8?B?YTVidHZxa01NdkJMSGR2b2FHNDhEaEMzSDZHR3doam5RNnBudEVkcGpZcjVJ?=
 =?utf-8?B?elVSVEZrVTBDbURNVkpDS1dPSGErZ3VNZFhRMFQvMjZmcWhPNCtYYVdaRDJy?=
 =?utf-8?B?OEJKN28zRkdReDV2bHhWZ3l1dzhXSVNDb2xmNy9xYXVTWUtBT252Tkwxam90?=
 =?utf-8?B?Tm1Ebmp3UHZ2ODdxNEN2SDhSU281aTlYNlE2OXVpQ3NWOXg1bkk4M1IxblZT?=
 =?utf-8?B?d082RUhnOVNnZzNBME5ET25ybUp6M2p6cnhvS1luTHF4YlpwWGsxdStZd0Nr?=
 =?utf-8?B?dm5pL0xnUEIvb0VQcDBnWWZ6TlFtU3dMb0F2SVZUVkJSa295V0ZHYXZjQTAv?=
 =?utf-8?B?VVFnam9nTlRDOU0xWTRiNkZ2SE5VelNTNjRSVVJ4SzQwMklUOGpXVFUrTVVa?=
 =?utf-8?Q?reL4klbbP2M+V/O7b3rU0TFB5Fkn9lmvYfaLpNa?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4068.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ce0223-0074-42e6-79bd-08d929ae8a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 12:19:46.7197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ek8g3IonZl1JOr7qpPJxom3SOppnFJKWdnu4QTU5HMXynF8c2M2SOJbJSi8ZKIGrRMtkkVJfdzVdmun6aWl1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3762
X-OriginatorOrg: intel.com
Cc: Jean-Philippe
 Brucker <jean-philippe@linaro.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Alex Williamson
 \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Robin
 Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Gunthorpe <jgg@nvidia.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Jason Wang <jasowang@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Shenming Lu <lushenming@huawei.com>
> Sent: Friday, June 4, 2021 10:03 AM
> 
> On 2021/6/4 2:19, Jacob Pan wrote:
> > Hi Shenming,
> >
> > On Wed, 2 Jun 2021 12:50:26 +0800, Shenming Lu
> <lushenming@huawei.com>
> > wrote:
> >
> >> On 2021/6/2 1:33, Jason Gunthorpe wrote:
> >>> On Tue, Jun 01, 2021 at 08:30:35PM +0800, Lu Baolu wrote:
> >>>
> >>>> The drivers register per page table fault handlers to /dev/ioasid which
> >>>> will then register itself to iommu core to listen and route the per-
> >>>> device I/O page faults.
> >>>
> >>> I'm still confused why drivers need fault handlers at all?
> >>
> >> Essentially it is the userspace that needs the fault handlers,
> >> one case is to deliver the faults to the vIOMMU, and another
> >> case is to enable IOPF on the GPA address space for on-demand
> >> paging, it seems that both could be specified in/through the
> >> IOASID_ALLOC ioctl?
> >>
> > I would think IOASID_BIND_PGTABLE is where fault handler should be
> > registered. There wouldn't be any IO page fault without the binding
> anyway.
> 
> Yeah, I also proposed this before, registering the handler in the
> BIND_PGTABLE
> ioctl does make sense for the guest page faults. :-)
> 
> But how about the page faults from the GPA address space (it's page table is
> mapped through the MAP_DMA ioctl)? From your point of view, it seems
> that we should register the handler for the GPA address space in the (first)
> MAP_DMA ioctl.

under new proposal, I think the page fault handler is also registered
per ioasid object. The difference compared with guest page table case
is there is no need to inject the fault to VM.
 
Regards,
Yi Liu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
