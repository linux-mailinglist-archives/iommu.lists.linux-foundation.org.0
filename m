Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3D5143A1
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 10:07:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D12060AEA;
	Fri, 29 Apr 2022 08:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3_R4ThCOYi7; Fri, 29 Apr 2022 08:07:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0740C607B5;
	Fri, 29 Apr 2022 08:07:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEAB8C007C;
	Fri, 29 Apr 2022 08:07:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D435C002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 08:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDFA340917
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 08:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZhxqb5yYdIj for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 08:07:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29D0340004
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651219646; x=1682755646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBsjW1trXXPGr/ERUYz/qNNMBouCP2bs5iqFJvcUjBU=;
 b=gRiMGbaCQ64ak+uTnLK/gZHEUZ0uOBjdswcsbx+h05GSFC3vyMx3YdOQ
 JJBjrCJnEaVIr1G+ZS386plJkyPnEYbat9JjuGaYrwj1QIqxz1oyvVogj
 BlsoQh9aIjF1pekoUK3nJojHQpz77Ylb7ysLMw9OqLxJo73xhrC3wHc7G
 bWTKv1hVC2h0TCr6k8122/m53hb2BnjJ8Ur9mstSg309f+9QPfSpFHyx2
 wEiCiU3aO7IiLBOw+7cIwVLtttdNT7VyYGBORbz2kk1H60PPKaR8KfSOZ
 /I2zErcnE2UlssnaeHxpxbPKt95JWoTiio3J8fFlq+zTYYTk1JI1H1FMw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291739855"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="291739855"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 01:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="809014086"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2022 01:07:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 01:07:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 01:07:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 01:07:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 01:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nmm72NmZHyp4i4JaYY3CAuTyeGqgEzLggzpFfAszldJKmE4QqDbPuY0O/AvzN26h78ejK7fBZNHnxWRIOJOZkwdO981feC+jb0QJigneSKtAfZoVBPIGceDwUHVj0hgMqtzverEFbpi8AUOg5gwD/rsAyYQ7LyWOwQhQLVuzJa6eWnLFu3sdh9d5vcdW3HMjckOhf1d2a04RX0YaHEN5H+bEkwD4Xyn/BzB+7APSp4v3dvVPUyGSw9WC9BQs/dbGJvXGtHbT152mQJmB0H3OhTqwwA6zByQ9DxL5f6IzxepU1iyFVdWRHeb9P6uKbgKCkp0US/GaAt2GfeM6bHR+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xyqt8T5+GZocVURJKLKV+yDSkvKWYZk2eq4OX7Z5YM=;
 b=SZhnVCWA0ZKgIUMsxGg14zTxk/nUT2ho3NuqLaC8A73qOudZ5+e6utPawxTN7DfTGaSPfX9/uKk9vXEs+iRaDfAnBPAp0TJgFv4M+U8mBWFhbqs+qSfN18wRJx12M3hjHSLrQzak1i921YYjuJUjAsECEu20VCXwrm2LwSb4Mq822ej01bFWCFHKeur2iOgRcLQIft02MggWnjgXXCWKeN7gtbe9SrQE3gNAuDHyKpmQfacTNqcyj+yHf9tQZlf2HWmwyM3dklqHHD/6RAwsKpxnTCy9ZO7Z8lKQR1tZXNTl9kEaL5LpyhVprnXYRACOP7P3uMD/4SMid55NTuojdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB2998.namprd11.prod.outlook.com (2603:10b6:a03:84::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Fri, 29 Apr
 2022 08:07:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 08:07:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Martins, Joao" <joao.m.martins@oracle.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH RFC 02/19] iommufd: Dirty tracking for io_pagetable
Thread-Topic: [PATCH RFC 02/19] iommufd: Dirty tracking for io_pagetable
Thread-Index: AQHYW0R/9NKTv/Vcr0O7a9+AyfJdLq0GhjGA
Date: Fri, 29 Apr 2022 08:07:14 +0000
Message-ID: <BN9PR11MB5276338CA4ABF4934BF851358CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-3-joao.m.martins@oracle.com>
In-Reply-To: <20220428210933.3583-3-joao.m.martins@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e1038a5-1262-4b5c-5901-08da29b7457b
x-ms-traffictypediagnostic: BYAPR11MB2998:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB299847C3BDCC8C25FEEE8E9C8CFC9@BYAPR11MB2998.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i5nDENrhJsr7qvCi3CslKCrn2vxEvYa8f7G1JCsdPUC2Bm3Mj+cKBRgUIigVu34XHw1wuWICFimObRgErQ16Sxy4Pr7cfbKELGEWpI1RAmhwtcjc0j2qZ1biWih/olH7JkYlH1qc6DPDASM9Svdom+KuQb0gPpOeIa8DYeCzaztSKk6MKgsg8nMpePUAfnW81+sHt0rO1KQ0CTkXx+xCq1k6ehFS1ziRW0MTIaUwtPkkm51h5oga4CT2XCiUAI42dFGFDX1qu4C1DeYIB2zHYLjvgCwO2BSHfMWuQIt63nWJBn8nhCRpov7Gn+WuWXEj0XLz5Qy2zbTbAn9xLsXZc+tw5jFmJ3z5EeUOMnYsN8c8Vy9j3TEVTFE6Na5BTHcz2+SHVpqwBOTCFCTUlLeDuLYMkNDAlJjDSj1Ei/R2Ppfu0EEe9O756sMoDyI/HdzpNZnyvddQmJQK5YApQGt6hI+6TVHoPCba2pqcjiCibkFdSd9qXeFJFdv+fH7DbmiFTXEvhbpWXEbSTo8Uy59qBOnfDXIPGZrlALhTaQ66/1FKWNVEIlV6HyzncZxoxu7EkLiWrIKaDIw+zrFetucergm8VY9d2GvuxS5rmq+lUqBQoxdlwQ54VmgxbEbLmVs3o32GQ6LpIC301f5vsIBmnslnsFv5w3XCko1jECyj7NOOcqxkgSfZy0cgZSlhAS7wXC+BVzL3/fXH8KL8YualV/Ku8IjAH6mcMWRFtLG7ELs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(86362001)(26005)(66446008)(76116006)(83380400001)(66946007)(8676002)(508600001)(66556008)(6506007)(66476007)(64756008)(4326008)(71200400001)(55016003)(38070700005)(38100700002)(316002)(9686003)(110136005)(122000001)(54906003)(82960400001)(2906002)(7416002)(8936002)(5660300002)(52536014)(33656002)(186003)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4eOvT3iXjg7Uf9+7LZE2x47/LerAGl5i4Z5DHF/FxHpp7TU8uszeoMvXM7KU?=
 =?us-ascii?Q?MS3BIPUBY5whVic9KWlCwTeVgkySW0UY2elNmGuGArdqly6nESKP0bs3iB5F?=
 =?us-ascii?Q?NcKDc3TQea6DMNFDzP0aN954MqbroisVBXQptUeq21zpsScXTmEH57UF/QM8?=
 =?us-ascii?Q?HIJPFhW50NMY6moggQLrbZy9j59KqJlmutuiF3ThLgf1r8JVVgoj9x7UrqT1?=
 =?us-ascii?Q?X1jUaj0XgzJ1IFN4k28U5xIAJTrIe1gtbxVGKx3Bc14ay2J8ZSUQQMTWMQP3?=
 =?us-ascii?Q?hkZoEdKo23E/Fv1Bgr+nIZUbeVXR5ozuZVIzbgYnElM6qAEpcHCNDhnev/JF?=
 =?us-ascii?Q?ceeLOlJbUdbspIKoX2byUgKmTF6sBjXaxzurFmXQuMivr+qCMk4v5hCrBVs5?=
 =?us-ascii?Q?DuN3TXJ+udK9GspMfbiwwDYycKe8F6UkmVIaxNhxYkHlE1kQlXi4vtTLSHiG?=
 =?us-ascii?Q?z1WwVZTi2mgdNbH6kPLx6c0qjsHTr57E5evRKiwfeuXy2FjXmPce5+EU9YDl?=
 =?us-ascii?Q?MR2WzPeAaORyqZo6qWwoULKZTsmuwNH/m+hY+lN8LkrxmSMlBRhJMCini+sT?=
 =?us-ascii?Q?edYk0oziiJ0sJt6C4LCI2qp0Rdx+SEqUyBlgLptADlNPVEVaTTKsPTDxgFTh?=
 =?us-ascii?Q?FKY4WzqXJl6OVuELe3OM+YfnqBdjXCfA7/jzVBRDMA7oA9x5BVVQ2mtg4bBK?=
 =?us-ascii?Q?G2H2vr02653qk9NdTU/K5rpUUllPFi6XUqUjqFEIbbpshhLfzaTMBVK571Aq?=
 =?us-ascii?Q?lFuJkJlxrE5iW3Txczdm0fDzQuUvxOJom57gOUBjxsvrYvMo1TBKnTciQZMU?=
 =?us-ascii?Q?87g2PniOD181uAcbmj/Fl4mzRVvc1BM0b2ELIx+I7OosnxLZOQi2zLMv5Hwf?=
 =?us-ascii?Q?hCX9zK/6WvcZqJp3kT0aOT0So2pPs5Ppy2yftqUW8GaVqQVKb/K0S7m4llPX?=
 =?us-ascii?Q?/kqAwIXQFiP3TjBKuNPb/hjJmTxSTXlbvTa0LqxRUg8TrvuqESOESCvQiuy9?=
 =?us-ascii?Q?Y1SXpaHoQ4EyJNMP/C/LkPHyNzrWis8NgHZJU+KZCotBdOWn977A8YO9rMEm?=
 =?us-ascii?Q?dKfTFfdbJ2T2SGYs7+w492s2cE3Yulyf4AMfJEm6NnXnNH/9+gHpcyx1ud4b?=
 =?us-ascii?Q?jmMnGXfujZK8vgHXmyVf1LmOjQFbb9TMakb6+5dsSe8n5//PZsQeAO9TH3oQ?=
 =?us-ascii?Q?T6lsCdC3PgF2fgBVhxV/pHNHj7J9++Rty8P5pYQQqTv5oBAeKxfTTvt6Qglr?=
 =?us-ascii?Q?49qW38PAF+WJtQzCEkJ+shDnOnqDkOmlxXMQZGZVxSmlpoQmJVmpe4BXRVXv?=
 =?us-ascii?Q?RrC/CQOKNaimWxcaiBi6JZbk7Kl6whcw2jOkL2ymZNcFaUEykThphA9Veo+H?=
 =?us-ascii?Q?YLzOQrny3uod2bafgvKcshwMzrdO5X7vRiCRXWr4v4JjpjXGlncE4dOIeUkQ?=
 =?us-ascii?Q?xjjAMtAGcUkfiAcNsxU9UZoaUBXxZ5QLLUn4YRz9EQp9UWuyh2vs9xWsMqL9?=
 =?us-ascii?Q?VyhDuYBvsKFvP8xRYdKYHu/jUi2w+MEQwAsTxiblj+l1Qz3WSG/VH9cGemSa?=
 =?us-ascii?Q?dch4jIogxRJGCmMwXB6ouK/vpdF2AY1yFfPDsAV3lqA4sc0VVzKRUVv9+f1d?=
 =?us-ascii?Q?DJRuCFwrpkwVB71jHk3h1S8A/M3Echb9BJbwrdeHz945PfdQgXYkvcBqIsSG?=
 =?us-ascii?Q?gQ2/rV6Rzf8HssOsiUCPbLKCFDGiDcjrlhYCQ+5AmWV6GA0pMITy0fpyJWPX?=
 =?us-ascii?Q?6ottSVQ7oA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1038a5-1262-4b5c-5901-08da29b7457b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 08:07:14.7499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfVeiA4WxI02WUka21Xh9zGxAiSW2aPj/Sk+c9TRC2UWKW+MWQPFOpeWYhFnqrYLyXmIQIH0rXLOhSPeP62VUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2998
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Cornelia
 Huck <cohuck@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 "Martins, Joao" <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

> From: Joao Martins <joao.m.martins@oracle.com>
> Sent: Friday, April 29, 2022 5:09 AM
> 
> +static int __set_dirty_tracking_range_locked(struct iommu_domain
> *domain,

suppose anything using iommu_domain as the first argument should
be put in the iommu layer. Here it's more reasonable to use iopt
as the first argument or simply merge with the next function.

> +					     struct io_pagetable *iopt,
> +					     bool enable)
> +{
> +	const struct iommu_domain_ops *ops = domain->ops;
> +	struct iommu_iotlb_gather gather;
> +	struct iopt_area *area;
> +	int ret = -EOPNOTSUPP;
> +	unsigned long iova;
> +	size_t size;
> +
> +	iommu_iotlb_gather_init(&gather);
> +
> +	for (area = iopt_area_iter_first(iopt, 0, ULONG_MAX); area;
> +	     area = iopt_area_iter_next(area, 0, ULONG_MAX)) {

how is this different from leaving iommu driver to walk the page table
and the poke the modifier bit for all present PTEs? As commented in last
patch this may allow removing the range op completely.

> +		iova = iopt_area_iova(area);
> +		size = iopt_area_last_iova(area) - iova;
> +
> +		if (ops->set_dirty_tracking_range) {
> +			ret = ops->set_dirty_tracking_range(domain, iova,
> +							    size, &gather,
> +							    enable);
> +			if (ret < 0)
> +				break;
> +		}
> +	}
> +
> +	iommu_iotlb_sync(domain, &gather);
> +
> +	return ret;
> +}
> +
> +static int iommu_set_dirty_tracking(struct iommu_domain *domain,
> +				    struct io_pagetable *iopt, bool enable)

similarly rename to __iopt_set_dirty_tracking() and use iopt as the
leading argument.

> +{
> +	const struct iommu_domain_ops *ops = domain->ops;
> +	int ret = -EOPNOTSUPP;
> +
> +	if (ops->set_dirty_tracking)
> +		ret = ops->set_dirty_tracking(domain, enable);
> +	else if (ops->set_dirty_tracking_range)
> +		ret = __set_dirty_tracking_range_locked(domain, iopt,
> +							enable);
> +
> +	return ret;
> +}
> +
> +int iopt_set_dirty_tracking(struct io_pagetable *iopt,
> +			    struct iommu_domain *domain, bool enable)
> +{
> +	struct iommu_domain *dom;
> +	unsigned long index;
> +	int ret = -EOPNOTSUPP;
> +
> +	down_write(&iopt->iova_rwsem);
> +	if (!domain) {
> +		down_write(&iopt->domains_rwsem);
> +		xa_for_each(&iopt->domains, index, dom) {
> +			ret = iommu_set_dirty_tracking(dom, iopt, enable);
> +			if (ret < 0)
> +				break;
> +		}
> +		up_write(&iopt->domains_rwsem);
> +	} else {
> +		ret = iommu_set_dirty_tracking(domain, iopt, enable);
> +	}
> +
> +	up_write(&iopt->iova_rwsem);
> +	return ret;
> +}
> +
>  struct iopt_pages *iopt_get_pages(struct io_pagetable *iopt, unsigned long
> iova,
>  				  unsigned long *start_byte,
>  				  unsigned long length)
> diff --git a/drivers/iommu/iommufd/iommufd_private.h
> b/drivers/iommu/iommufd/iommufd_private.h
> index f55654278ac4..d00ef3b785c5 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -49,6 +49,9 @@ int iopt_unmap_iova(struct io_pagetable *iopt,
> unsigned long iova,
>  		    unsigned long length);
>  int iopt_unmap_all(struct io_pagetable *iopt);
> 
> +int iopt_set_dirty_tracking(struct io_pagetable *iopt,
> +			    struct iommu_domain *domain, bool enable);
> +
>  int iopt_access_pages(struct io_pagetable *iopt, unsigned long iova,
>  		      unsigned long npages, struct page **out_pages, bool
> write);
>  void iopt_unaccess_pages(struct io_pagetable *iopt, unsigned long iova,
> --
> 2.17.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
