Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7E42B8AD
	for <lists.iommu@lfdr.de>; Wed, 13 Oct 2021 09:15:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CBE940473;
	Wed, 13 Oct 2021 07:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8I_NV-r2xP3z; Wed, 13 Oct 2021 07:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E65C4403CA;
	Wed, 13 Oct 2021 07:15:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2815C001E;
	Wed, 13 Oct 2021 07:15:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02F30C000D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 07:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E023981BC0
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 07:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Mk1RP5Vpaqa for <iommu@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 07:15:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4694A8101D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 07:15:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="208167513"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="208167513"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 00:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="715467995"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2021 00:14:59 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 00:14:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 00:14:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 00:14:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 00:14:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kADTAgs9eHgfHccwrXkLO43UbQ5YsuJL46nkk7YJk1wIwenhsh0kRHtEnI4DBKEWSICHeEe2bRUXriTwKhJJJ2HYdW/HZDVvyScjKkJoCPXxy1KOPqMgtSj9GVkLJuBPsVlW3HtMF3Zo8+dGoTbRIGsEWo6SZJwH9LIFnK1sM/FYZMguMw/ADsC5jvhGT4noTfI93PlXhetVSYKwUMZ0AKDb4UfsnfDFaHkeUNkVxKguufpcVTFBLXS2CURKk6PesRn2uAB4L0b05gcocpB7zG5G/ZTQW+332OpyIJKqHnaIH+iCH65fyhd10d8t8EvHOOo1spkNOKkfS7U/ayy/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2a1YuFccPDuGmCBrG2gmTcDOxxiL8TzfYmyNT8564zA=;
 b=W9TspkZBSNgTGskWfT+FmidYweBNNnTa8B0PEUPQzfJa8Si27JcAP0ed2gwtBKbulSMP5AomMPLDkSrWqW3oHHCFRupoBqJP0BYXC9RN/b5OM5bvX4k8ixEnHthuQUUbYpGBXprjC6cdfb59Vitx7Cl8eddV2icmq7iv0wlZQKbOO92ut11LHIm1oDvA/1mZWY1MA7mjmKDcZqFSkvRNZA0Et0q5XKCGR7HOK3U5iMnQcTTuwLvmNmQXU7v+RcTGwdA4Olufdex5/IMC/ONAuorUwp6CwduXyjoQFLIoRwVRELU9yNhImGtVb9C6QrRIvWKf159MsinrvHon+g/bDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2a1YuFccPDuGmCBrG2gmTcDOxxiL8TzfYmyNT8564zA=;
 b=ZCTznsNvyXx2Hg8g8r0oT4AXpOlAMvii18lG+OcWVXtRNvWBlNj7gS4xuV5MG2GitV8y0ATUbtGMt/bq3fIbxgDtIrdE429idFlq1P2GD+btfZkxnCs45dnhXkbP+7pl/CsNJt4hglV3/aZnS5wjwvz0IqdJcPdM6XRsgacJ2zI=
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3842.namprd11.prod.outlook.com (2603:10b6:408:82::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 07:14:54 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 07:14:54 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, Jason Gunthorpe
 <jgg@nvidia.com>
Subject: RE: [RFC 11/20] iommu/iommufd: Add IOMMU_IOASID_ALLOC/FREE
Thread-Topic: [RFC 11/20] iommu/iommufd: Add IOMMU_IOASID_ALLOC/FREE
Thread-Index: AQHXrSGPLoYXtOF3o0iA7Cse+/LM66uuxm8AgA72WACAAGbxgIAPTQiAgAAu7ICAAPgygIAAlZ0AgAF6T2A=
Date: Wed, 13 Oct 2021 07:14:54 +0000
Message-ID: <BN9PR11MB5433C0D532DA55D4584216A08CB79@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-12-yi.l.liu@intel.com>
 <20210921174438.GW327412@nvidia.com> <YVanJqG2pt6g+ROL@yekko>
 <20211001122225.GK964074@nvidia.com> <YWPTWdHhoI4k0Ksc@yekko>
 <YWP6tblC2+/2RQtN@myrica> <20211011233817.GS2744544@nvidia.com>
 <YWVIagFiOtXTGMQ+@myrica>
In-Reply-To: <YWVIagFiOtXTGMQ+@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e8011f1-f3ba-4428-7982-08d98e1927f5
x-ms-traffictypediagnostic: BN8PR11MB3842:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB38428E39A8183C15F6592B908CB79@BN8PR11MB3842.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lmSQvsOw5VP8PWZACp/Z2XQEEAEvymxhxsDWgq8PhWpaKcZUN87BdpmsZy0Hh+tOLcDuVZxqr1ili+yDq/+q220GdbHyoWs0qqf/nj+xOEJYv9iCAsNgtoSym5Ux4xCH7NcJQrijIIg+RPRX6xKk+tf6iJXlNrEVfBP1oyw0n6wId1dgKESUspb6EABDmw6WcnhIj5Y+hhsEzjVkbUMaL3SCAAzwmoO4k20G8bUA78PwrOrA9+t6BdJiktxTKervLEJejHrEPz+5wjTD4NAib6rZrz21WSULVvCf7nNQcDg2DOp/MOOBkbkZ9HergAncrqebDTTPpfrF7vOYIWKtBl1XwLDRWGDK5oups4yrCb5B6uenK2dP4VJdZ6BSI+sl8NJQRGbPBld6cbrqM0yXGjowul7o8sOVh3ObOtIdj3JbOToxjTkIGowx4bcbv8BMK+nLkBJs2n1/VrWKNs2uv47AOxzJYFYqqVecCoBPABDuqbsgHbDa46HIsb6lEtiOBabc/OBErRMRkNUthmRE45LHpa2FU2N/ZbsUKaR/ndeP3bosNQSkRV4NcGiBN3mOQ2pz4YgOd3K4r17Ovf6muFVlBumImjuRLk9Yk0kz93U3umqaDD/evZskwrMYQphdSvAvIw/0hV/rEpN6a3skI1ylNFt5kICQJluiPCi93zdzamwMLGMj5TuZQQ3paZqm8FIW4gpjkYo5l3bCE2I96Lh9p1Mi7lGvnMg3P3+MWQ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(71200400001)(52536014)(9686003)(8936002)(5660300002)(4326008)(82960400001)(26005)(7696005)(186003)(110136005)(54906003)(55016002)(83380400001)(7416002)(76116006)(508600001)(64756008)(8676002)(38100700002)(122000001)(33656002)(6506007)(2906002)(38070700005)(86362001)(66476007)(66446008)(66556008)(66946007)(84603001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?whm1gUAE2WbytMwW/qR0lNMjxIiKb60GJULJaWoKKmvQT5EgMiHD5trQWqQm?=
 =?us-ascii?Q?lSPhrAUrtWuJIXDmEZvj2cNiV3Rndfjn97GK0AtoSGIzP5fCmzMUmeL6I9Do?=
 =?us-ascii?Q?LSIk9UIDg6lelceDYOER3qJxmK9woCJMrp0epScrGJfPMrX7oY7hr5RS12Dc?=
 =?us-ascii?Q?j5fjfPCJX0MpxDjYeGbACADaYbgyfN0M9XKGO+PpHdCD/xc3N5yn2SczSC50?=
 =?us-ascii?Q?57+OMSmHRW29YiKXGJXUrgnYlqmeG7Zw2fAHytXBLSW8pqMH19fFQvruRm5h?=
 =?us-ascii?Q?eiA5T8ceVyyofsYHgf9WtYK1CUxUkKZCyMU97S/M4eS+ko4mjE0vr7CUOkvB?=
 =?us-ascii?Q?avSbZyACcbA5iaXZrSv7LJZtitx1pVAk/rZZhO0R5HQzCiHOX0Ah8LZntTC0?=
 =?us-ascii?Q?gL2WhHs54nXG+sNk9qAOkwoqtpiY3fz7OwfM3z6PcTdt74MX6hDVbkBwSz8d?=
 =?us-ascii?Q?oDSleb0kPB8cSnIkSTFAWN8jUZ8x7Dp3IkgZbvb8t+JnS7fimrzx8S66YMS6?=
 =?us-ascii?Q?0COyZv80NQWrKGUJuTublGb8bkzia4lpfp5ylLYe232jEoOx4cUGnakYX/BR?=
 =?us-ascii?Q?66zs7wZB5gUAkG4/nWBEPT7gRjG0cb5ZRXDteXBw7X4buLUeTZc8sCF1RPxk?=
 =?us-ascii?Q?qQuLSQGa2Tsk3VsC0nttD+jg9L+AOqZxNOhKHHSJ5pGOm/dvfoFdYXr3rdZN?=
 =?us-ascii?Q?lm1WhkUFwEnfdOxoxNRGxTf+sNOeNTRPaHhUHyEZwBBPTgJ1XfSsz2XcAyM7?=
 =?us-ascii?Q?4UhO202j4W3Wi4nRJwr/pWajDt/kHXm4ZhUgoJQ0NyVyncrO2HhXxYucTbb8?=
 =?us-ascii?Q?dr6o9PYhv6hnSqX1LmLSpYQXN4Zk0DFn35pd0CizqfQFJsMDKXzEgExWIGtK?=
 =?us-ascii?Q?RXT1bLyr8P/Zs3LkdO7L12iCY+80sLoOtCEuVRj2EqHCExR6z3Dt3fl1cYJG?=
 =?us-ascii?Q?CWLbsEoRykiOQHSqQ4g3KP36h6XzeKt8GlfI+cxtDDNmfeyqsfHLF3Avvghz?=
 =?us-ascii?Q?bviiZcdS8T/HHtOc7klTv7emDnS7oSVUDEUXT1KZM0pi5MIP5g4OL2o+z0Vm?=
 =?us-ascii?Q?IsUf6IsG+2YlbWv9z26gUgMjtGV+R/rcRazfKIpu6RP6ZqvmhJrhEkEQ4sFu?=
 =?us-ascii?Q?g1leNTjmaHm6Pf/LEsIl/vugDY80lqpPEMq4TAYPuUcbwmUJZaCqqBIEyCKE?=
 =?us-ascii?Q?aRFMf96nddRCdrA6b7cyXX4qjkoGmm3fVFwe0akcWK+SUq2lJKov+Q/q+sx0?=
 =?us-ascii?Q?6JIwbVvi+g1mdZ6lWHecoj34/a7Xj9QKLONjKos1C7LRrb1ZpbMbETp3heUZ?=
 =?us-ascii?Q?nOmvR7MU5cSKHk/3oVxzAyp6?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8011f1-f3ba-4428-7982-08d98e1927f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 07:14:54.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mhnui/T1d8E4rWegezub3UQQQVmc1/ElVYjIjXCZF4DJDFVmWIo0y0gFRm8Rxewgixf3bO1L9GcOvuSJF21/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3842
X-OriginatorOrg: intel.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "hch@lst.de" <hch@lst.de>,
 "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "parav@mellanox.com" <parav@mellanox.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "lkml@metux.net" <lkml@metux.net>, David Gibson <david@gibson.dropbear.id.au>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Tian,
 Jun J" <jun.j.tian@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Tuesday, October 12, 2021 4:34 PM
> 
> On Mon, Oct 11, 2021 at 08:38:17PM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 11, 2021 at 09:49:57AM +0100, Jean-Philippe Brucker wrote:
> >
> > > Seems like we don't need the negotiation part?  The host kernel
> > > communicates available IOVA ranges to userspace including holes (patch
> > > 17), and userspace can check that the ranges it needs are within the IOVA
> > > space boundaries. That part is necessary for DPDK as well since it needs
> > > to know about holes in the IOVA space where DMA wouldn't work as
> expected
> > > (MSI doorbells for example).
> >
> > I haven't looked super closely at DPDK, but the other simple VFIO app
> > I am aware of struggled to properly implement this semantic (Indeed it
> > wasn't even clear to the author this was even needed).
> >
> > It requires interval tree logic inside the application which is not a
> > trivial algorithm to implement in C.
> >
> > I do wonder if the "simple" interface should have an option more like
> > the DMA API where userspace just asks to DMA map some user memory
> and
> > gets back the dma_addr_t to use. Kernel manages the allocation
> > space/etc.
> 
> Agreed, it's tempting to use IOVA = VA but the two spaces aren't
> necessarily compatible. An extension that plugs into the IOVA allocator
> could be useful to userspace drivers.
> 

Make sense. We can have a flag in IOMMUFD_MAP_DMA to tell whether
the user provides vaddr or expects the kernel to allocate and return.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
