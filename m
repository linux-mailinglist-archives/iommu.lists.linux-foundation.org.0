Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2F562D65
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 10:06:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C5684576;
	Fri,  1 Jul 2022 08:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C5684576
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JpyJtqXk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMUgIfLM9RhA; Fri,  1 Jul 2022 08:06:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8E99D84574;
	Fri,  1 Jul 2022 08:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E99D84574
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B8DEC007C;
	Fri,  1 Jul 2022 08:06:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA7C7C002D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80DD084574
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DD084574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vkj6CCCJeMrV for <iommu@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 08:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468CD8456F
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 468CD8456F
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656662800; x=1688198800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PgqO/kSHUNUzD9WbLN/2kdpCk6L0U4VVL9yVj2tymns=;
 b=JpyJtqXkSsdu7MlhNlZ9SDKguItuNcvPiYBzXOH4t/OMiwOL6w+iumcB
 cCH3/4PX+G0Y0fbc6EoHHjyy+v6B54zVh2ijnrSIs3yppMILzQahcgNsm
 XyT5Kr425mgyHPd3C4MOFZScscPlu88BPM7u7xepLc2AE7kr+h5wQT29P
 qMG4b0FrUrp17daZ7HoTiExyCVWq/omdvK+hiZFV1wLcpn6/dryCnkYTI
 21FCEZ+zqkpvh4fDg9vECWIkDfTlxYUF0IZTXU6yq0S2eFTHLCj8NMAdA
 5VqT4lml4OgnvG2R6a0v4zvQOt4VJtT7wSLEtMvmX9me5CreT97tYXZ1B Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="280134137"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="280134137"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="837945236"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jul 2022 01:06:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 01:06:38 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 01:06:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 01:06:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 01:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdzUM7HP3mEjaHQ59WgXfyvLmdbMfyRH+HhPSDvXPm5BM3lButcQxRIRBqFS3FLP5BoIY+Q/Q26+pYgBWdXrWDI14rtz9axy2Y5p4pYZ6YvOqblfr4JNHr7FdWCuXLNm9nmm82BWr11XEXiOC7vePTFo6+rJHoDPSFIMKmHpeHiv8gyN9eDxMRo3E4zHQaIDsUh+FshRUuObyhKHQXq1k4fzaj2Tg7bH7EBp14gz5UqO5PrQwg/FQpgS77Ww42Dn/B5r77eygSV1Tuz5IKg+sI0CsvjIZtewAqiQP0GFj+RVdnVew+6JJBXD7JLKemCX1hVO/J1CmvJ1qpS3GjUCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgqO/kSHUNUzD9WbLN/2kdpCk6L0U4VVL9yVj2tymns=;
 b=TV69B5QUo31tpqPPL3FkYmVYJxhV5TPQUXoGINngaQk4TNg6jqj/WhLDNSHBolfO5EflByfoZsJ6j/FzFH4/hCzWlQnukOiwSANpYda3DMrZYcMNevfApQNSOA+EktFkxeE6jlH6ThOGECQY91sEwyHftG5h1S8ze9h+xf/K6qq+1e7mGB47G3fAPKxfUTqaWCfpJblu8yJXNbe2vkTef0P5ansxbEj6V1MyZAu70788piCbAnkvcmKZBhf9HghzUG1IgQ2CiwXEvjRmxzEf3CJW6Da1+bkcpFpu1AV0JTrFp3Sp4hvdVUQlBacXrZI2LdFEqjGTXP0Sc7g4wU21og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:06:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:06:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>
Subject: RE: [PATCH v3 06/11] iommu/vt-d: Acquiring lock in domain ID
 allocation helpers
Thread-Topic: [PATCH v3 06/11] iommu/vt-d: Acquiring lock in domain ID
 allocation helpers
Thread-Index: AQHYi40kMCLoWHsfxkeiFuU66SLXkK1pK8kw
Date: Fri, 1 Jul 2022 08:06:36 +0000
Message-ID: <BN9PR11MB52769D0280441350E1F8DAC68CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220629074725.2331441-1-baolu.lu@linux.intel.com>
 <20220629074725.2331441-7-baolu.lu@linux.intel.com>
In-Reply-To: <20220629074725.2331441-7-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c1f1ac6-951f-4b87-28e0-08da5b389e96
x-ms-traffictypediagnostic: SJ0PR11MB5816:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4pm2AUbcZL20zxyT+RB8hgt7S323b5P72F82rRrd7b8d/cy/p1VtLvQWbnoMYbcjU3MTUzMCtNHWLvNstrBN9g96FdDYCsNbjOtcFUvE78YRAZb9LGVN4fCy3EW7NobvRU71R+hGEjljgo5a4YS36tuDpDkjacd+z1syHdlW7xGhIvJ2vKWVNRJjGkaTPPp03tctDw/9Rzp6PZyWgZh4Ij1Y/Iaw0vPQGR5+mRJqQ2tEwfAfHOi4crKBP450NHMosX2gH7f4/57y2gisVcpe1P/caZ9ofKrOFIiE9WRbGogQN7cb2yUaLmvTAcSv2UAhj3f+tVl+LYE1FHn0AgENDCaZ1c61QVUWFvbF2Stu7NdC7ZwMifIOItkUOJdVrRg/D/DNh40SJB4o/lIYcZQst/WcaX9ErwF3Ln8/zIoeJf2bHiT/g3S/RvG9As4+SHCDEmEA5CuueCGx4LjqFKCEdBO+5cGZJwhb9wN36X5nVeiYFBQTpzJTQvLt9yGEUZKO/MY2iqx9vDi2zlTplq3PeHvqTFTPNFNiuFjW4zD1/6k/xbWtDsjhuzDA/mBspGUH9024uDlpJ6wEehrvw5JFk+dYO5NuDrhn29qbxXdp/qfrC2YFE9ScviWwHYDkFvNpzsbxyKyCH14+PPi9Sshdx0fFhKGQtQ+nb6LrpVilbkr/j84Fr6gpxO2HGm00q47tDs3sNSjMwpBnM0YMz9HNo7REEEY4+gLsdG++v7qqy6yowMfcSkX+V8ETOuqmKQt+VNaFBRRGjXLlPGzfADY5B2NRdmsQLqrt/dRoPR9PfmCy3TEF/mSUeQHvg0OCf8A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(366004)(376002)(136003)(39860400002)(38070700005)(38100700002)(7696005)(82960400001)(54906003)(66446008)(64756008)(66476007)(110136005)(122000001)(76116006)(66556008)(4326008)(316002)(66946007)(8676002)(2906002)(478600001)(33656002)(71200400001)(9686003)(186003)(41300700001)(52536014)(26005)(55016003)(86362001)(8936002)(83380400001)(4744005)(6506007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D7zbhrwj5+aq3//PhxIhNv5Ax6LHoqInXfuATN99XlXtPbv7ChUkYdsMOmfS?=
 =?us-ascii?Q?Rb8C8O6PrDLJaWJSbc8JhTs0EbmMhX3gB4VHJYq/7JgGFxI6UO04rmAn393h?=
 =?us-ascii?Q?AVm40I2k/45D8eSqhXKfXqfaIQST7+w/46VzFVO7+vrUjYZIdk1T+rW2qlGw?=
 =?us-ascii?Q?N6hPFUqMyVdMrkhZSNIP81XOeu50ZgrzcsxirJDIphcyIvgaHe5IzHFneCwM?=
 =?us-ascii?Q?5mBOfK8Up9xX+A5SQpK3BMHalA421Ow3YjesEJmWrRCl4Gk85r/c4tGHl2BC?=
 =?us-ascii?Q?QHPBrLIOpOJpdSaHmm6BM9VAMmmW+5Vy2gymEh4WkHPai97fF7cZ/Umuv1bN?=
 =?us-ascii?Q?tqy0hpMSpVUPl+Rj2WKM4MwZ9MmdI8Dr6ddlnTxnC1KDl296p43o27Uv6YWd?=
 =?us-ascii?Q?A5VluTAAh7Ho1Z4nrpkTCAUrnka2ckyC1L7hecfPGLUH0CnDAG0sFKuQJwY7?=
 =?us-ascii?Q?CTIeB8mfg/rsfxyzROfiAvbTEwd1OICiPZhfxAfoZc9k61MdjulxwGCfbmgo?=
 =?us-ascii?Q?VZI5Y2sz6eKrKJIGhiW5SWyWvcYuaYhchENOpBcsMVcbw9AjgElDtvUe4B7Y?=
 =?us-ascii?Q?vpvOJDHdN0Q1bjM6Pyi0TqPYZxfztmQeAovnT8pP/nbTAmUFdBeyGRkbupLn?=
 =?us-ascii?Q?YnDo3t0rYK13p2ZlvUnRQhA+Vq1z6NCMuo7vjTm8388s37y3CCPHEkdJtO+V?=
 =?us-ascii?Q?t+OZn9/rJ8fvwre/yPJbEOu/acMRmpaeCJU9C6waDfgaR5Y1inx2jcQunzvf?=
 =?us-ascii?Q?SFSJhLC1Uoj4XdNUhEgvc6H3GtC3dfzRgxeu5X7XXnbXV6c3q39ZgErhpvV6?=
 =?us-ascii?Q?+DAHicWzuKDkRhyxlVLJezmQq/QFDDN12lmy+G1RijXiPBv6p9Lzp1Uu/d2f?=
 =?us-ascii?Q?m57YSb4dztgzFwp9Uk+LxJLeUquMqtMMkxQex3U9Mdgr0RbTbVF6ISK7Y4nx?=
 =?us-ascii?Q?mNZpzA1LQ5wa00nVtEHyGTI8neDi8MTVKCpEAbE9hcK1/2VVxA6bDvZcNdHa?=
 =?us-ascii?Q?WpEoGpPRG2pjJspM+wnftbxRgz+TTovd3Rlh54zUW1ruELR9AwUBjEHrhHFx?=
 =?us-ascii?Q?61m8xIIT//BIcKaUx82/JkkTWbuDQoqnNTKoGE/fUxxaEPvIFDakwFbk3eLN?=
 =?us-ascii?Q?dyTFJNHQHhGkSc1VgBdS4VwAynxRt6AqkpTef20a+l9VOMuvwQN7ddvUycNo?=
 =?us-ascii?Q?DpQyHxEuiE6bCCtvMSq9qO/JHnw4HVQDOCkznoqwCzWbTJdCfTEIK2MSlLq2?=
 =?us-ascii?Q?cov7w2qfsS36QMqsRIDj6zyKNARfvCfPvNAF9WpoLDqH5SDGnvCfKFzl0/Ni?=
 =?us-ascii?Q?zYZk3YeY3URUquILoa3iL6pxaKx5GZm5jBum8iOUGsPq9o0/LzrBdsXHiWmD?=
 =?us-ascii?Q?bnZBK8EVUbFLJBJK7vLSwWSw+XSnTiDKQtwGEd159F3DJ12GbeU2d7XSOXIA?=
 =?us-ascii?Q?SnOP6Sc1vS3/aFZ0lUuJ/pP98kUHvWPeWJE+N3GUWRM2jQEicO6h+tQbZG+6?=
 =?us-ascii?Q?oWE0lkyCaygEy5X6FREVGGt/UQJfptI5EL4pJIh6grJg7WgvuC0hUwPBR1y5?=
 =?us-ascii?Q?uKtlnvLR0J6b8ALc0Dghfp/So/9SFVtCRqRU9eSv?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1f1ac6-951f-4b87-28e0-08da5b389e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 08:06:36.2815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ztppvxp/jB9XpaMTLakMk0oEpQMMPIdvwl0KU3VcHuD9t0xAai0sQJb+5gMD5Ozb5lRiH2SVGLe4//qNiVnKkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>
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

> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Wednesday, June 29, 2022 3:47 PM
> 
> The iommu->lock is used to protect the per-IOMMU domain ID resource.
> Moving the lock into the ID alloc/free helpers makes the code more
> compact. At the same time, the device_domain_lock is irrelevant to
> the domain ID resource, remove its assertion as well.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
