Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF752E204
	for <lists.iommu@lfdr.de>; Fri, 20 May 2022 03:34:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BFC284580;
	Fri, 20 May 2022 01:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLw_MAigf-9o; Fri, 20 May 2022 01:34:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6F8EC8457F;
	Fri, 20 May 2022 01:34:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3121AC0081;
	Fri, 20 May 2022 01:34:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B20BC002D
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 01:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF0641928
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 01:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4tCBHdUOyTM for <iommu@lists.linux-foundation.org>;
 Fri, 20 May 2022 01:34:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B029E4190D
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 01:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653010441; x=1684546441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bu8/FO47LXKe4NmtW85HaVtm8RWUbdoaG+/tSQ0Girg=;
 b=Wy9Bv38Xg5ooq5xBcnf6MNYKnIc2O30khqCZo2Q8Ib8CxBig56KHcBUR
 kqotVixtctGprxIF54X4/zw1RYHek59KYrSpqWzantO3FBjd2zXrPImYZ
 W8fWHXw8GZiuJY6KLiTJPq02/+BwzpzZ6p4Zj5KAgo0V2KV1BGbQaT9T+
 lB8KsG3VYLdL1okg6RkiIveuyaXPR5kTma9pUHhykx726qrtHW8BFpuRd
 C47Hn2ULMHOrqPruKwAAOEDoHSfk/uoM9cx0wDeMLX1KrioJujeFwbHQU
 TSsXukebkcLU6SVFaVoo3bRzaWD2XHV5MJhI0/Z7RxrI27gR8FZEGlL2e w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="270032791"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="270032791"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 18:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="674366884"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2022 18:34:00 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 18:33:59 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 18:33:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 18:33:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 18:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1t62HcqvenkHQHWbAih5Vtpa9iJq/qjmchg3kSbdd/Xhu03hLYLD9kjzdDh5r9j2DqNS1t9FInKNtJK5fz0+lV6vLa+2zxHLVW/tnNoO9YH1hEra474Y6+YHpYri6SqYMjvq/6LP84WgowSTK/SwLscV/QF8Xs2oG6LELdj+cQlaGzy/tffEhk7JtI7zAesK3biEvcCoNJbilcVwKXH+wV0leeMi/5Ta9ads3kKWXC//F7kn4TtLGeKQ6d9vLQhTr1CVjdtPCUpEudMXQL3/Vz49aLjECIhP6gKg2HdYh1o82ZbeW8kYOlapUPDLnxlpCET9hKPl/XJXC3n5l4OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkRoSzvpw0rkXsvZ6uiYR4Iq7tegaZsId4NOlB2C5RU=;
 b=LyXr/R790CC3kOmn6vhdauqqXoM/tkjNuC1o4LTeRyu+yCHX6u6NU1w1GFmifYoJUCdIE3rMCUHaW2JEuuy7zCQHbeqEtK1GNZyU+arMM91FJlJlaDxhhmVuSxhu1cruf8E7QKrtGYI1dbFIdm3HBmXfAE7LL5wdHLLYg1cA+pmdDBve0WT2cTtYcEawtNYYAy/9YUKDQ5dEmFrbdGp25fYULRh/fO0DzmFQ+5o4bdL/ep8s+IRYoS1IyymxXy1GSI+OuS62kKD5c8ER6zZc4Nv+LULHqM9pXyIFJaoijGfaC0a2GfNVRXNdseD/susrHuAoSJa2123Pdvv7sSdUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL0PR11MB2883.namprd11.prod.outlook.com (2603:10b6:208:7b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 01:33:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 01:33:56 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Robin Murphy
 <robin.murphy@arm.com>
Subject: RE: [PATCH] vfio: Do not manipulate iommu dma_owner for fake iommu
 groups
Thread-Topic: [PATCH] vfio: Do not manipulate iommu dma_owner for fake iommu
 groups
Thread-Index: AQHYa6JvbLTChJN5eka3kwgnix4ex60m+vGQ
Date: Fri, 20 May 2022 01:33:56 +0000
Message-ID: <BN9PR11MB5276C2370E371B99E5A428C78CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-9cfc47edbcd4+13546-vfio_dma_owner_fix_jgg@nvidia.com>
In-Reply-To: <0-v1-9cfc47edbcd4+13546-vfio_dma_owner_fix_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eefaa163-6040-4d04-e98b-08da3a00ceb5
x-ms-traffictypediagnostic: BL0PR11MB2883:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB288362D3D4E2E048BFE1A45A8CD39@BL0PR11MB2883.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7rbX27DeRFRqR3vrdoZaP+OgM8uklPssDEn95wLu6dYejxm6m6Mqz0c42vpx4YYlUumCZxCDTRYckntqyPd77u3HsXHMK2YUAYTIRUX2l04RdgJo1btFuiqaiKD7xVWVe8qFl36TMivcyDPozMZS7JkPiNJ0nzzE3DkKDyYl89SnA9OFMYXde/yGPct3fSpJ7nG1NWZB5pw4y/pdy8zOer8u8G2ECol+PajeJ9GKCh15AhwAXGMjT6i7fDmEv5ax3XW4qT7GS1uDOEtfK9zAAEWGqS7odq+YI1V4zVsU6N22sXn47Q01MvAj/rRg0FG1n897AYWMUXKdQImvCxW/EEMGMsq8UuYLukyrw1k2/2U5g8oVg0RdpqGSEGURmizk4YRZbXyjnFh95sokL+SGQ4hI0vdx8Q3Ql4PG3IUliSaPcv8wi9i1DFt54Sk386dOmt4lsECzgBFQzBiZl7N7WoEjAGidyAI9SoIvK2LiZrzQFE0cyGL6dsN4DKgt5iwbys5CqnwSBHm5V+pnN8CIFtK61AYc+XQ+UW3wK0783Nm1mhHhVfsTrrl5KFTGU9Q4Rh7GAYa8MX2nGJAy3IPk0vFBLo1aF/aqGs7cQ06uwQ/7hoUQoBIKPnghn/Vhz/ZVJrkmalzUWKNRrMOdANmLJftMuSAotoiiuExWywP7hcBmrZJS6ci9kPmv17aFKBzBxnpX3u8I3zot20xw+0caPH/K3s+L9OwGIxIUN8Z4eEE33blfZrTYHXVhskMyBAKk21izDMmtxeUunmTHxL30Zrg1Sb0NmRM5r0fo41sU6OY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(83380400001)(82960400001)(38070700005)(55016003)(122000001)(38100700002)(7696005)(6506007)(66446008)(66476007)(9686003)(66556008)(64756008)(110136005)(54906003)(71200400001)(76116006)(66946007)(966005)(508600001)(316002)(2906002)(5660300002)(8676002)(26005)(8936002)(52536014)(86362001)(4326008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y3/vlvOA55cjQUHYzN/hSYdP16H9zj7YH5ih6yb9knfREzhDSiYj2kGqtZEc?=
 =?us-ascii?Q?Q39nTB33UCsAb7+jbENh9z7NeT5O2mGpawykC0qjYCLntzRZSe0NhFCrwMcl?=
 =?us-ascii?Q?BM1nfk43mRPejHbMvB1C24YJaVtwoZ8+VkvqvffCcf5cwktmNZiKaIzyd97U?=
 =?us-ascii?Q?OUnIvi+D+ml6TEuDdC2w9Ef6mNIFSYCOoHaU1YniyykWjrMFvPfxOvyKxh+Z?=
 =?us-ascii?Q?TjMSvsJW2sJm4g2bQEQOPhURyR3pfP2VWYSA/gcKQbJWvhfjq2Hs2pDd9MuP?=
 =?us-ascii?Q?2yQgwNxK3P6+VParKyTIFKAb9pWBTEMbY4Uot+0lWTAbKxzuRW2FwXHGfkfT?=
 =?us-ascii?Q?Bpzvhh7e8B1e3r3lL0+6UgQWYm8K5oFIrDoRZ7Vgn3AdnEj+dwi9w1VHko3c?=
 =?us-ascii?Q?7zItdYbbWkEkDwhZfQtTmQWJBbiu0w0v9MECyChonsrODL9C2djW6cNNOIdp?=
 =?us-ascii?Q?Vv+JNhEDOyqRN6/Kwv0okz+Ylt0XaML5HJbG1vZvxTgUxvLBgxFmZvB6lypf?=
 =?us-ascii?Q?YhOQD5GcISRBZInDUWk3V2cOU99gmlx1hrGD/CvnSbVfaIRRR86+O9oG8V94?=
 =?us-ascii?Q?QApeaCfpqL74bCtgqX85wg/d4ppNMBQ8JPGefa7KtSxkSPyMu6dtfAmN/pMu?=
 =?us-ascii?Q?qNz3Q983JbpvHuP81lYR9ze632GTYCVoeg0jGoP0lTGKxgu0781bUvebNEKb?=
 =?us-ascii?Q?3hGYpKt2ldzFm+/fykmIaTv5M7go/WYdpSMXiGeg5Z+JgzaIFaZjWYf0NSW9?=
 =?us-ascii?Q?EsgVQRWcQijcM9MdS5tLLESRYNx2ftd8YPP4AK0I5SA7OGovJYAPAo/SQE94?=
 =?us-ascii?Q?xUCVU86NSTP9QFUDOf8Mg0O5+N9uKHniU/7VLelaNkFsYUsuLH8GDt34KvdM?=
 =?us-ascii?Q?TLXSdfAFmxOhfcxqgK8d0+IFK3JG1vQZZpFmI0C8QHcfStyZQszJA+pkJo97?=
 =?us-ascii?Q?MwEQfnWth6b248ZFZavC5v3jdQd3XBFivhn2n+1SIU9H2R+ANcuarQXWSbKI?=
 =?us-ascii?Q?zWXiQBg+80LQ5djMXLQpRyswqny2j5MgkDkvGVv0RUll2UBaZDoBfibxRiVf?=
 =?us-ascii?Q?1gXd1JTR+zsJHGRmH9cG0X0lFRBsXklZQ8h8cwpgrofJmEMjNgoIuFakHRV+?=
 =?us-ascii?Q?UrUrDQB73XjjLOwLXdNb2tOSTK0zzTzdU5xo8ADxbIiz3aNMvCSh1zEw4Ba5?=
 =?us-ascii?Q?kU0Ldh2yskehK09vQ+BIlAdSRXSC91JSJLXGfTh3LC4HIkikynj8UO7QcF2O?=
 =?us-ascii?Q?8lyeBDpLvafzcPFOiKpbAVRq5HMd/IPC7tz2WF5VlvqXEf3N9WYAUZ+5dUDn?=
 =?us-ascii?Q?zMuVuY3EdBmdMQc2u9xUtihtrGBPOdaoS7LIchp3VD8PkdBvi8sX+rmGqEQW?=
 =?us-ascii?Q?2eV/nstCpd/lImJ1mVbp7wEN8NotF97WCLG6fgCiRwfnJrk59c8EUY0EbAgS?=
 =?us-ascii?Q?LScfE2uinCOwLeYAUol6dUgECq9BggfMCZx0IACZ77j7844IyuYJMy5AASEQ?=
 =?us-ascii?Q?uvNjMUjV8uR14lNnbAWmMNFjpYXUlQ+WPCoMt/zaSYw2df2fVKdukrEhoo6Q?=
 =?us-ascii?Q?sTFbl+z58VmZ8PAf5X595aG/d3Ysd4DSSRZ/t5eM2aPjtW8dXaX37TBvZPk5?=
 =?us-ascii?Q?dBqE5vg+BKCf2tyUXdkbi++2hJj5ODCOjcag3/lJ9xqLGRWLmhA1k8MnDWoa?=
 =?us-ascii?Q?8wuODk+4XmhyAtNe4KG65DQTDLS6ENEKW3j3/DoH6U/BUrkmi0UQcNEtl2FO?=
 =?us-ascii?Q?mm/HlAOtSg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefaa163-6040-4d04-e98b-08da3a00ceb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 01:33:56.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKZAvqdwCNjjEJuTmmoQt2YdIuZEGDE90htGHcGmNROo4I8D5CSVDsaS8Srg2jzyTFja8zfORfcDW/HFl46B5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2883
X-OriginatorOrg: intel.com
Cc: Eric Farman <farman@linux.ibm.com>, "Rodel, Jorg" <jroedel@suse.de>
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, May 20, 2022 1:04 AM
> 
> Since asserting dma ownership now causes the group to have its DMA
> blocked
> the iommu layer requires a working iommu. This means the dma_owner APIs
> cannot be used on the fake groups that VFIO creates. Test for this and
> avoid calling them.
> 
> Otherwise asserting dma ownership will fail for VFIO mdev devices as a
> BLOCKING iommu_domain cannot be allocated due to the NULL iommu ops.
> 
> Fixes: 0286300e6045 ("iommu: iommu_group_claim_dma_owner() must
> always assign a domain")
> Reported-by: Eric Farman <farman@linux.ibm.com>
> Tested-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/vfio/vfio.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> Sort of a v2 from here:
> 
> https://lore.kernel.org/all/20220518191446.GU1343366@nvidia.com/
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index cfcff7764403fc..f5ed03897210c3 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -927,7 +927,8 @@ static void __vfio_group_unset_container(struct
> vfio_group *group)
>  		driver->ops->detach_group(container->iommu_data,
>  					  group->iommu_group);
> 
> -	iommu_group_release_dma_owner(group->iommu_group);
> +	if (group->type == VFIO_IOMMU)
> +		iommu_group_release_dma_owner(group->iommu_group);
> 
>  	group->container = NULL;
>  	group->container_users = 0;
> @@ -1001,9 +1002,11 @@ static int vfio_group_set_container(struct
> vfio_group *group, int container_fd)
>  		goto unlock_out;
>  	}
> 
> -	ret = iommu_group_claim_dma_owner(group->iommu_group, f.file);
> -	if (ret)
> -		goto unlock_out;
> +	if (group->type == VFIO_IOMMU) {
> +		ret = iommu_group_claim_dma_owner(group-
> >iommu_group, f.file);
> +		if (ret)
> +			goto unlock_out;
> +	}
> 
>  	driver = container->iommu_driver;
>  	if (driver) {
> @@ -1011,7 +1014,9 @@ static int vfio_group_set_container(struct
> vfio_group *group, int container_fd)
>  						group->iommu_group,
>  						group->type);
>  		if (ret) {
> -			iommu_group_release_dma_owner(group-
> >iommu_group);
> +			if (group->type == VFIO_IOMMU)
> +				iommu_group_release_dma_owner(
> +					group->iommu_group);
>  			goto unlock_out;
>  		}
>  	}
> 
> base-commit: 7ab5e10eda02da1d9562ffde562c51055d368e9c
> --
> 2.36.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
