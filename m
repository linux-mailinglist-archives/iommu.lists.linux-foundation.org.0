Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C54DD4F1
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 08:01:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D9484376;
	Fri, 18 Mar 2022 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzjQbJd4peCn; Fri, 18 Mar 2022 07:01:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 59AE18436E;
	Fri, 18 Mar 2022 07:01:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A850C000B;
	Fri, 18 Mar 2022 07:01:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04728C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 07:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD96340527
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 07:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1L3oTTlkIeE for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 07:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D57F40291
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647586894; x=1679122894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkldM5yNB06X56hT1FpUgxj9oHh0DDZc4KxhrSG2R2M=;
 b=AodTt8cLEXrgCLqsKZA8kj7ficNp+rzZSWR9bjEtVhZvlwCM7Y55nfqn
 pIFuO+KmLDukJLGJ85MEOdEI0da5atZVDVZd7/UYinWuYiEp3AV+50YJA
 Sh7a/nBhNX0bZI7bEocT7YlVKw1k42EKEhkodVM8cDJKLrL0RHdFD3ViM
 Iua7nUjth/aO9Yt2YRCgvvx6o/kZADQuIoHZA77V072jfF6vLq4P3ZoNi
 vCMMYg3tSARQgPkOZNylEUgDbm1z89Dlx+0T8NokXceJrv5V1xAfhU/6x
 GGKfk+FQYbTnq5aAk0/5t2CZA6sVTqft3KgasP+5y6Bi3qs2BdcG7fFAa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="239236993"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="239236993"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 00:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="513727184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 18 Mar 2022 00:01:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 00:01:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 00:01:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 00:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XonYn6Dqv75hSIXDBIyh9/PQaw2oAGa8EbBsLgg1JTg2Sbji9ehjzar2vepAms+Qb52tffdzJNQAOGVPBrFmOMhufoBgr7KV1dfIyfovLPoIdkpUWvLJI0468FL+JFvuVjtGegJMrTrebwYHEqvzop6t6LEHsGTLbX0xedbOnc8kpXhsv90p+MELP2SztJ2gLIOmdOgmQuX6JbfeHjFIlfmOjmuYHz0vEjJPV2WRGc8V9XHqw2rfGIbVpM18A0wk3SV20GG5FxX4YqZVBCmk8wQB0wdM5+Zfxf7aMlRTgT9sbTcLKyZKSRVh4fxb1noVDvgY4hBkLSQo6s6O56VMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkldM5yNB06X56hT1FpUgxj9oHh0DDZc4KxhrSG2R2M=;
 b=CONGsEKBZZaFQmFiwFQFXVnJStUNicErptDU5lSSWFWOgLKsDB6Xx2V6Yiknz8sjiceZRPqR7kdmeK6boCasJC+2986Em4CjfTFTGWKL2vVva9VGFcGgEQiyAe5MKoLJy0Lt2+qvNZMHa/TF0TW7b7KIzVsFOOGBP3A+4fNlJ+GoALVEje7zUxY7xv/16reJMdrwfiFa4geA1g5gYbNX33aVLUNGNEJoGspm7X7aYWJTeO4VVcTXB51UC+wgDO1v2ccpRfMZpAy4+UiyCuPX+IqFfQFxwDMBfaFTWAhkADF+FSI+EnJMWJlG0GTh7gDJSWd2CE98cw1EvXqSJQ407g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2158.namprd11.prod.outlook.com (2603:10b6:301:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 07:01:20 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 07:01:20 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: RE: [PATCH v4 15/32] vfio: introduce KVM-owned IOMMU type
Thread-Topic: [PATCH v4 15/32] vfio: introduce KVM-owned IOMMU type
Thread-Index: AQHYN9xrQVYDc2PUskGgAyzdZ+WZ86y/fBmAgAAHrYCAAO/BAIAAFiEAgAQxgwA=
Date: Fri, 18 Mar 2022 07:01:19 +0000
Message-ID: <BN9PR11MB52762F1B395D27B1F82BBF0F8C139@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
 <20220314194451.58266-16-mjrosato@linux.ibm.com>
 <20220314165033.6d2291a5.alex.williamson@redhat.com>
 <20220314231801.GN11336@nvidia.com>
 <9618afae-2a91-6e4e-e8c3-cb83e2f5c3d9@linux.ibm.com>
 <20220315145520.GZ11336@nvidia.com>
In-Reply-To: <20220315145520.GZ11336@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b5e9a6c-5810-4883-fb35-08da08ad1aea
x-ms-traffictypediagnostic: MWHPR1101MB2158:EE_
x-microsoft-antispam-prvs: <MWHPR1101MB2158C2B2DB3EF58C0A7B55BF8C139@MWHPR1101MB2158.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1btx1PYqwUxGI5wRl9km8on4o3Jac7xZu5Iz3NhJmFf40NZRZ6TxrGV4636qYp1H6ufLcd9y1RrSwvlVltY14oh2M3chjrshQQS0CK2jx+9k+yJQehuWGM+gS2wmW86bMom89mkPr5TYajb7B2tohsSBjHfBuYoki1w3Bkix96+5SdlU+mVuhoNxwAoCaOfSjjaycI8KtWA9d72kBSSmb7bbtvsk0EttAFyfP4CBHCzix89QIBG+hIPdscCSu4d5w7AEbR0fPX+TsB4uzQ42NRMyx+9OzIDmcckfsbe0u+vduG60qTJvPl4qFttG1/U7wfM71eQ9dNN1HgYtwfjlYt/KkUd3P1Mag+ezBjOD9A8yGJR9wHM9qSjq4qE+IbiOMAjqHukMdazejO55nPLdB1QdiXF9nXi3JK5OMr/f0JLdl3dNEm+dtqpamzECkUcQ1cxMq9M2DNzctOhdEiCaERIJCGE2he6rNYKyYPxg5+MJGUJU5e2ZB3itMXGmdwD38Ur4ARqeUZh0IEIOpj9R6gW5Max+wu/4PcN2WBzj6vg/A+vsqynf9NzuxCSRS7GcM/Vt4HaTGPYyRxZMHKLQnzXfhKougMNh4OOWzgmh43MNIJFVBtGZa/J5UlEnei4Gb5ouqf1FU0tuiLAXKcoTAAyEzeDjOIsONwmYJo/Bgk1hu7tOLuxd9MxjiV757MTqEwtCK3vv4uiMOovNRCmVYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(71200400001)(9686003)(4744005)(7406005)(7416002)(8936002)(26005)(54906003)(186003)(110136005)(316002)(6506007)(7696005)(33656002)(76116006)(66446008)(66946007)(66556008)(4326008)(2906002)(8676002)(82960400001)(64756008)(66476007)(122000001)(38100700002)(86362001)(52536014)(5660300002)(55016003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KoPcFD2XHfeLvtT7/+TjsdWY1zHmMtvc3YWB1sKHu32AM6yes5EFylcHVKhu?=
 =?us-ascii?Q?KdLd9A4bhq/9WuD47rzSxQhTW4mNaNWOL6Nfn8jNRBOeCAcEXEIBvxf6Aey6?=
 =?us-ascii?Q?SBKsbaJSEa97fQ9hoLwpqjG9YTmAKR2CFBtL+WJ7R3qf2kH4d2KmJ05yeP5F?=
 =?us-ascii?Q?pOteh/xEFpCFEl5Mt+dl5+clikqfyhO8ExLyHfrQBzBlIO30w9XgyINMxuRQ?=
 =?us-ascii?Q?Qb4z1syZvpjEECw4+RhPtAJR/w8NG+16HIzjb6lBj0dV3+tDZ6UR2+GvKSgV?=
 =?us-ascii?Q?hGT3Gc5Dp9iYJ9WE7l1z6Auc5pTf8RWnNKdNX2gK2/9RY6o/DNEf2v9CnmUc?=
 =?us-ascii?Q?0GCe3KVcUppdSc9BGHHKhz8OjB/+Y/lF1YVtGxO43RpZdJJ1IZtiLQPBkNf3?=
 =?us-ascii?Q?e5vn+DQQEBd5zGT46fYvuZqy9WGqE2gMLqtiDEampx3Y6S5pEWEIfxlOp9hZ?=
 =?us-ascii?Q?B+AawPMoT7IzAKOBLVDvcuLo5a553XwdcCk91QEyX+wTwPQwj0NJUT0jRq5f?=
 =?us-ascii?Q?hJIRG37FFE8ZVwxiuISNrjJdhjM/s4NPwTxkAQUBYqA6+WgM/tZXDRF+vRTI?=
 =?us-ascii?Q?Bv+Phc+ONpgprFuvyyGsaTxlimL7vTXafM487qv8JhsmGfw1eZgUmSFxsCGp?=
 =?us-ascii?Q?enXhn0Z+BGJcyrYLe2zC7bt9ltlqm7XwJqOgBRkaldZA6V6qWvM5OA0k52fY?=
 =?us-ascii?Q?3qoenMgb4gGs8mzz7ovIuqJgCWwBVmIFVPtG8AfLa7WJdWE9B8aLcheScYtB?=
 =?us-ascii?Q?8LePbOK1yS3cwuHLun+FrMezZN2ksLglawKM+8FXoaHMXicrUT9mv/eC7nkl?=
 =?us-ascii?Q?Ve3Tt7OdDSG556WHhV/LZSO1VcypjZuksm5z0hROI+HbTFzl+oZhp8g2vse8?=
 =?us-ascii?Q?sbbpLkGNmWUAimDfA2t0dDILT3NS8YKVA7lQ4XPgkZZCcEnhdmu6LnLCpbVM?=
 =?us-ascii?Q?9J2WZf/49Gq+0e8QmfLvie4X26uDVF1IgT1W0oMzWTW29Ma5Rsp6OSQIkLPI?=
 =?us-ascii?Q?+mQ+UC6aQRGTfMXvDg36IJpHUSKWy2B759n/jv10e1KFY74CgZw822Jbbs+p?=
 =?us-ascii?Q?T1iOp6MUmzx3YyNEMdIEo0QMNDDjmGa/k/x/Hluz7P0qRsK7+mvHanfpnEgl?=
 =?us-ascii?Q?4349x0hEuFY0AlaBt0QToaOvk8nYd0HGmU/2BP0uAE7Z3mQ8T0iYU6mKCZOJ?=
 =?us-ascii?Q?dDNXu47Y9+uM6IRTGltgrLjou6ct7hTEpVnqvHZD1iYkBpn2wCrtfeZFNVf6?=
 =?us-ascii?Q?Ijn7wTkMSGNam8mPr55esZ3vmlQSeudMkfnfcaMVJcz7GMsiHxxYG+K/iufD?=
 =?us-ascii?Q?lHbbEh6sNfA+cK/+2pvfmxMtlOa48qOv4rp3foFkwvzjtB2q8yg9gkZ1eO4h?=
 =?us-ascii?Q?Clnnd43CKuT1hb3sNkPdbY8TlA7GpzYcpZC+BCDE+aJwZd5ZAiDXS+YCr9Fx?=
 =?us-ascii?Q?BKGfqMYPYNOJYlp9h+EKcspkC6NkE2Ez?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5e9a6c-5810-4883-fb35-08da08ad1aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 07:01:19.8586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3+RH+4QOIPlg1JjYHNkMJO8zvXufCZpsvPUVVmW8jkxmLNmbllC+TMG5umjUhOxptt0Kv0MUX8uadlokdZYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2158
X-OriginatorOrg: intel.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "david@redhat.com" <david@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "schnelle@linux.ibm.com" <schnelle@linux.ibm.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
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
> Sent: Tuesday, March 15, 2022 10:55 PM
> 
> The first level iommu_domain has the 'type1' map and unmap and pins
> the pages. This is the 1:1 map with the GPA and ends up pinning all
> guest memory because the point is you don't want to take a memory pin
> on your performance path
> 
> The second level iommu_domain points to a single IO page table in GPA
> and is created/destroyed whenever the guest traps to the hypervisor to
> manipulate the anchor (ie the GPA of the guest IO page table).
> 

Can we use consistent terms as used in iommufd and hardware, i.e.
with first-level/stage-1 referring to the child (GIOVA->GPA) which is
further nested on second-level/stage-2 as the parent (GPA->HPA)?

Otherwise all other explanations are agreed.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
