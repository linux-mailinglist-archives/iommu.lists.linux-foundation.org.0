Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 485984E6C70
	for <lists.iommu@lfdr.de>; Fri, 25 Mar 2022 03:15:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEA1A401CC;
	Fri, 25 Mar 2022 02:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kQ04rVckHY5; Fri, 25 Mar 2022 02:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CA07840102;
	Fri, 25 Mar 2022 02:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F58FC0082;
	Fri, 25 Mar 2022 02:15:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33429C000B
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 02:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19C3D41CDD
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 02:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F0zlVwWL4EY for <iommu@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 02:15:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AA4B41CD5
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 02:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648174553; x=1679710553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=adbhdo2VMSJqYoXEPossRs4HmFEjaXYdxs/Ci/Xz93Q=;
 b=PDmjUjYmTsBlP62Vs7oWZY+RbD4lKB+d+p04xuWwz22NAMZQpoG+nI5R
 vtzdoi8BowUFsRUCkwCEpnHyrK6BcleiISyteStMWkzVoIkC7RVG5guqv
 gdKTMiVIfCyQTUIWcablxscxdH2c88O7LVi6pw3JrBdAtGWzLzTwxJRoV
 q/8RjHOwPRMVn8zEuwn70O7j28PmJoJceP01R5uVqeJdscsYDblsbURjy
 26ORQ/DH3ypKHKf8Id7/QkTmhAiU9dR7lY0Iiligy1+6mUDv1fBmphr7g
 lfoON2qhtLg1ouuIlncp8WDtx9swLf+8EecuP1VBuPo15So6yUYNpmU3n g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="257361367"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="257361367"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 19:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="650079052"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 19:15:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 19:15:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 19:15:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 19:15:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 19:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz/aP8L2HY/efpnUuIhGn20Omuj2i9o9TdbGTxL+R+wkA2H6SofWm8Uw8GP9xoduGiHVucXyfUN02WYIWkIwk9lLFN0cFyHg7X8lHtpGlmIeoOLOjPBie2mL2fediYBfCCZ16xklrGhSK2W5jtHkPH5OPaU5nh+nSEHfYel/+250noLlKE1H6cTSR+KOCWtcx1PeGsYM/57I/knyg/k0Tx8ib2bfa8Iin72cLzIaYBHbK96mlv8Q4dyDJ9do1V4l/1GtGUjsxNkDN9e4RengkTMT7xeihfleBDhxJ+z+wwX6X9I94oFeglwfezzw6TjhUXHWmuC6UVLWTq8I2NttbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adbhdo2VMSJqYoXEPossRs4HmFEjaXYdxs/Ci/Xz93Q=;
 b=l1A5P8ZdPeWpRfnHklM4s/IYg/uNulh5FrRH/Z52dW6LxsPMcTULqnSly0/bEeBhNOhkidQjw65qhKUNT5su2hc5dkGjwrRkCBU32Rr3g3zdi/gMoZGMU0lBjQtKVSacEVKA1u98X1QEY17FJYs2YR02N39Ez7p4Kzo94cC5r9IJ4vvg9p2izNYSvxqYyhPwYoxPVwNhHnyLq8RmHeBWTTzSTfNwa7tzVmO/J/eqmte3kkT8lhJgcKk206fZj5kpC4EA9ruYmU0eZWndoElZk01fIdX2POxKVtUEdVZizCB/VfaKzEMkh33eCe6aoiuLcJwJNG4BkUQWWrxm9Akjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL0PR11MB3057.namprd11.prod.outlook.com (2603:10b6:208:76::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 25 Mar
 2022 02:15:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 02:15:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH RFC 08/12] iommufd: IOCTLs for the io_pagetable
Thread-Topic: [PATCH RFC 08/12] iommufd: IOCTLs for the io_pagetable
Thread-Index: AQHYOu2GUDY5OA7cJEqND2xJuT5HJqzNXYEAgAAGtoCAAAhqAIAACEAAgAAnNgCAAIPcQIAAdUoAgADP8YA=
Date: Fri, 25 Mar 2022 02:15:46 +0000
Message-ID: <BN9PR11MB5276AD62538C8F87C76466EC8C1A9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <8-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <20220323131038.3b5cb95b.alex.williamson@redhat.com>
 <20220323193439.GS11336@nvidia.com>
 <20220323140446.097fd8cc.alex.williamson@redhat.com>
 <20220323203418.GT11336@nvidia.com> <20220323225438.GA1228113@nvidia.com>
 <BN9PR11MB5276EB80AFCC3003955A46248C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220324134622.GB1184709@nvidia.com>
In-Reply-To: <20220324134622.GB1184709@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f732dd4d-f668-4e1d-bffc-08da0e055fcc
x-ms-traffictypediagnostic: BL0PR11MB3057:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB3057B73A0B95CF26C3A426188C1A9@BL0PR11MB3057.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pp9Wlo05t1uGZyLn7IH/u7k5KAhfnM5XG+GkbY8M4f3SdN+n18IOdHcpz8GdDae8keCOEFumd9dbt3n3IfiNd+q82LbJrk91x0YuqkEZHIRlOWWqkd+N5nQQVILSbFRXr0eeF6JT++7Tgc9uVr5nFTHtb6s23Qlr0E/FUMvdNcCSrn2wppKEt72P3f0fsLs96LCijYYbE7TRQj/7QZRmMDEGdIn0NB9ffHwqvGh9mSmWRzatgAVn3HlASqwuVclbv7NFYI10JlXvVFuaHyv15BsSMSgJC9PyMBJ92HvOrX4lLrophmI3+cjTCa2KUS9Pl/hnFNmdK+LGfCSDTlgkZOsCjMnfNyLdnzFU/wMVHv9yr+Gn1XPy5hL8tDwjheyNT/lir9XZd/YrnWYNU3+fc4iqU3jTdURyQcIl4fQP70XyEx8BTFvI45z0gK4LAgdUIMdVoxHZlSnSJ52H0mabTeBs/rBq7cNPx1r0pFEpouTFYNP1T/94lQ5QA+GWqZz8gsDdFeBE3q5xuZo+gOACRrcjsQQK9bERBIPhBZropKTgD/zEs84LkGxXb9ThZrUcxVVcOFiMGYd6SbdKJmHcbj4O7caAT84tiPX7mE7TmX4wo8irRe0mNDmOw3svJBMNK8Qu+diGEcCR8RNe0qYIbMtEWV3Vffc1jrrb6F6vyHwKMS86BaymseXgAS8+rWXgA3UXasME2sW705RoTO1stGbIuufsRvLY9MSEXwLNNMpOdn378No6ejoJn1HMk2t2BEWhcyc8uPGGbo6aoKYUkZOVfOdfXDyLj0pnW+Flfuw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(966005)(9686003)(5660300002)(6506007)(7696005)(186003)(33656002)(86362001)(66556008)(26005)(55016003)(2906002)(66946007)(38070700005)(7416002)(8936002)(76116006)(508600001)(64756008)(38100700002)(316002)(122000001)(6916009)(54906003)(52536014)(82960400001)(66446008)(4326008)(66476007)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ygg05TbopIcjYS4lDM+8NkMtTQIyInwxcgBQMty1KJLsfeT6ursQaVJ+8F0h?=
 =?us-ascii?Q?g+7MvE4HSacAl3fbT6+vRszsZn8JXfIOEOWobnn+T2ymEYFo6lZjyWcl8wQp?=
 =?us-ascii?Q?kynfUKN6rYPUx3WTsBlBw07Dw12bm0mJ0lQeOIw9JUUfmbZJro4gm9RnDmSZ?=
 =?us-ascii?Q?NNAd/mDc6bmiUolvEgFgXEBr09k00yg8tsvjShPOrAepgi6bcBiw6xRdFLxn?=
 =?us-ascii?Q?mwY2OawXe4e0HmCcFaVxt2XsFUqHmbhBXkXrYQ1b9eEZfyzlKosfADemlDGk?=
 =?us-ascii?Q?dQe0Q3YUyRdjSaVA3z+d4TqUYZ2gZtqgjMQ5oszsLDketP6e44wbbATldAZw?=
 =?us-ascii?Q?dFz7eQYEPMwZ0Ay5htu4i7jIss4xJiYCbTL+/Fjd3TJhogX7hmGRxTgz+tji?=
 =?us-ascii?Q?M9MjCwWzgfIly/dWeUfEL1C602JmoRLqb1yjDlvNDaBGmjhROmctvBKi3n/P?=
 =?us-ascii?Q?HbFCKfcPuxCs4VEP3Fs/fM0QJy+4IUVi4cCORv7Y4uHdQx/hQV+zylO9PkJf?=
 =?us-ascii?Q?vA0V0HWqoYKFdrFia0ZU3db1iMM2F1DhhhYxlFhDeAAAS+imS5Ciymv+GTrk?=
 =?us-ascii?Q?xV7O21RQs4fm5PkpopqDJrtV6B7PU90xdfbvQJaWKMT5Rk7QDn/6wtVEV09k?=
 =?us-ascii?Q?G0NbotQfQogo1+JwrhApB3csczGg8M0uLV/v38xepNj92iW6ZjcsqJt7sPMX?=
 =?us-ascii?Q?e7O4gAnxVC0CE/bX4iTgZWvconZDgS96oMdxW0BT9BSEvvSlRUqKqRIKXqkz?=
 =?us-ascii?Q?4alvBfzSzsX3vz0pBSmYVaBO89lffjRiDsDVqzkCR1Nwz6o81C/THXo6DNbA?=
 =?us-ascii?Q?9Cwhcn+VZNrOb0iRExQIaL96xz+IqXxMe3s0NZQRI6IM9XChz+v7smwp+Eot?=
 =?us-ascii?Q?fHgNJSiDGHUJc+4LATk9fCNLbS2PISl4wpjrt9/cv9KtG1kdRZaS3A76nFs+?=
 =?us-ascii?Q?GWwI4Yt4Y9NvqVtphWN3C0+uCCk52mJt9iBdeli+dxR5/dzsu8zmIFwnjLtE?=
 =?us-ascii?Q?Dxld/AnvtFIyM66alUBo2CURao6qiHJV/XiI4shQR/tlwwTUvceY0IM0/cBt?=
 =?us-ascii?Q?qH1pzXbN4OR/ur1Xf+rtVLEoRzLx+ZOcZIpYyK3Ttbug4NmSD5dSODJ2h2Y/?=
 =?us-ascii?Q?ghdLIAku9St9S5VKtm+PazAiIVGlNo6mvvZ8hGF2up+vuIWDJTfHHTkqd99p?=
 =?us-ascii?Q?UUvEs8aLR8fsHyopBJ14hydzC+Kxf9ClB0LQc9lQSOmYXiVGvFjSoCsTQDt3?=
 =?us-ascii?Q?6qZGQKRD4tJI7Zt6dP5D3KXbznWHyZRpgyP3omYrXMcQhmo9Zc6M0Pzy986Q?=
 =?us-ascii?Q?GNUW+mumbJvdj5JAG9XHNjVeVdn9wz55e1zarwPhEC5e+oEp0qRqXJBln1D3?=
 =?us-ascii?Q?JCFpPHuOnH3Bu116OpLHNcCXqd6i8Kc3eUIsfik89NTSMOmsXIWxXLhi1MbG?=
 =?us-ascii?Q?PxsZ9VvNYupe+yJVh8wDGRPNlmihn2Fn?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f732dd4d-f668-4e1d-bffc-08da0e055fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 02:15:47.0132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WE9WreaJe3HYvSJtztuSzNw25gT6qTsu8i47mcBscqaZ4tD1zAK18MVUY0AN0kL++ufW9t+inOzUGjnWA8GpxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3057
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Martins,
 Joao" <joao.m.martins@oracle.com>, David Gibson <david@gibson.dropbear.id.au>
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
> Sent: Thursday, March 24, 2022 9:46 PM
> 
> On Thu, Mar 24, 2022 at 07:25:03AM +0000, Tian, Kevin wrote:
> 
> > Based on that here is a quick tweak of the force-snoop part (not compiled).
> 
> I liked your previous idea better, that IOMMU_CAP_CACHE_COHERENCY
> started out OK but got weird. So lets fix it back to the way it was.
> 
> How about this:
> 
> https://github.com/jgunthorpe/linux/commits/intel_no_snoop
> 
> b11c19a4b34c2a iommu: Move the Intel no-snoop control off of
> IOMMU_CACHE
> 5263947f9d5f36 vfio: Require that device support DMA cache coherence
> eab4b381c64a30 iommu: Restore IOMMU_CAP_CACHE_COHERENCY to its
> original meaning
> 2752e12bed48f6 iommu: Replace uses of IOMMU_CAP_CACHE_COHERENCY
> with dev_is_dma_coherent()
> 
> If you like it could you take it from here?
> 

this looks good to me except that the 2nd patch (eab4b381) should be
the last one otherwise it affects bisect. and in that case the subject 
would be simply about removing the capability instead of restoring...

let me find a box to verify it.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
