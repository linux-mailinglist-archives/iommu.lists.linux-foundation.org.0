Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7C255B878
	for <lists.iommu@lfdr.de>; Mon, 27 Jun 2022 10:06:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241A3415D2;
	Mon, 27 Jun 2022 08:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241A3415D2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GEQC8lW0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKzZWKwgcndZ; Mon, 27 Jun 2022 08:06:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9E97A415CB;
	Mon, 27 Jun 2022 08:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E97A415CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 610CAC007E;
	Mon, 27 Jun 2022 08:06:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9BBDC002D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B53AE82F9B
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53AE82F9B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=GEQC8lW0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gt0vdRXmQ09z for <iommu@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 08:06:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A1282F57
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2A1282F57
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656317197; x=1687853197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eefIFfYBVHBgp/SBALlxzmC1s/ceKY5qcd5IL1LFYvU=;
 b=GEQC8lW0aDfHzq4DmwdheL5EHkxGyHz1aw1AftS6eRzdFXlLA5jjB110
 zRODdbtpQTjNV6wB6sqc6ksQv8wWNKKMsxfGuVsR3V96bWcr/ogTcBruq
 AMpEsJwG0mBes3xItZJut1nAxqpTfFXeQ4uNA0w8G4WcRyc/XsjKeoFLy
 HRq3oAwwUizoKTfhywGVovcaHv1/5aevpQcNFI+n7aKCiGiU+0iwCPDxL
 mz+UJlPMeU+PMpRyK8oSwXRakUeqpCzb2V76Hf2ly643pfoWyH7qfhgO1
 zWc2rO1bbztZfsu7VyAphVWTgoYzSFs6ILW0SLOJWnax6QTMNyxUMsNkh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="278935499"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="278935499"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 01:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="732220649"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2022 01:06:37 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 01:06:36 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 01:06:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 01:06:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 01:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nF+AQdiZFgKrBW6IeGnQwg/+61mNhTDB0pEVyG/z5kRVO+Jn6QceKIsqxIhKV8kpI2VLss4RK6h6dtgZ8zGDSIkn+rhmiYXaOv50byGB3zi0gB5hTTxD6EqjJ9tUjyPodWk78o6f2LVHvLBvYWLiujxngRdLrIxR8Ib1TD7m3+OckqxsJtK/j8GSDbi/CVyhq9xZfpgW7HUDr6CP+rYp6w/7Fb6I2wRCxwZREvC3xfNUxtZg/m23oOKtG+n/cYNDe7AEutqsFXFomstP3eDPpPwJXK0cby97qcmRjEysDbEdTtIQwnGKuvIlH9rd/t40Osput0SrZ4chlKrr8nQocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBvVdTKMuwlm4V2oNWJf1qaJY0g+Cmqi0D7YCBpuS5M=;
 b=JWUzlFgaD3hpDsRqay8DqCiwdbPvHFM9wGTpah8wt6LNgpEF9jKgMloVtf5MPQ6TzMlRw/4A6qNxgkTq7hgSlLkM/I8GGyFmJsGS9fKB0PiQATpZu+k5CnlwucSzemZaTIPS44Q0EOElyinDfK26SFC+e6UrnbEthXG7rCQrEbsJ41fz+s8OwvImBfEPBL+gMJdzAUBUotQDaA/j+1CEp7jOvouVAZEf8wMeu5AjuGN8dGD83dtUOYOT8ariIxA/wNBuhFK0DgIWZmrccTspT3Xnd7hE0G/QjlSx+XWI5TqZ61EEqcsOs0uQufTl1Sh/Eak23zfwqLfJzndFn2v8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 08:06:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 08:06:34 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.com>, "Jiang, Dave" <dave.jiang@intel.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: RE: [PATCH v9 02/11] iommu: Add max_pasids field in struct dev_iommu
Thread-Topic: [PATCH v9 02/11] iommu: Add max_pasids field in struct dev_iommu
Thread-Index: AQHYhX334m2WGiMpwkWfRgRqZJXLeK1i7krQ
Date: Mon, 27 Jun 2022 08:06:34 +0000
Message-ID: <BN9PR11MB52767A1082CA73133FCC169D8CB99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220621144353.17547-1-baolu.lu@linux.intel.com>
 <20220621144353.17547-3-baolu.lu@linux.intel.com>
In-Reply-To: <20220621144353.17547-3-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd1a561d-0f26-4a0a-1434-08da5813f3f4
x-ms-traffictypediagnostic: PH0PR11MB5078:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q0j0C9IjzIqFygBg3mMI3VGdkluYt/D9mKXuwEIQJj1rypOBJ+MQhRqq9p+ml5511/Cu0B/H3Fzgx0Do4ZAgD+QS2fVGvd/lACsxpA/TUUBsA/bEkUmZ/83q0FnJNSGsbMQhz1tX8XavKXVPYzSC7pA9vBtirG5mYiHLMo3GdbCWxbFGL9/aVMXCf3XsSI/ZJVunIBN89g784ztlzpgc8X0aYmoht4UptZrzym3cgiPMe98OL8V6m2XAJNowqm9EJs/vpyQMWAzbos47rFElkEwaPqHENkrENsQoCe2O9OOIZ6z3l8c6VG3bslTAlvMJAuj43B4NWt0k/zbmdKDekSrMjPY1FNbP3qhWDw6l0UF3hvKc0Pl54roHoT/3UuFhLRuf4UhAx1/V/8zCCxky2sP253zYEb+nVtxqjb1uTGHV3DosyLO/ymAomaaZCmpfw0TIMQl3+KojJJOWaLKesPngxF4eUz1/oSV2O7jPnBbetzeeyKQaOdkLGp6pWKOkpMJ7uzSVHQz1syAp+tix9cNMc9rpOhurD/RaIkzcwV0Q+YsZTMiV57Gf1OmgMC8OiyGkIeOOQ0U44pluM8q0B/m5jTAXu+bV28F6JlhjHl7vItiZq/Apo+6tT7lkV6py/XwxrazL+84u6EqrhIAWWZxymJZfvGOFnLxoGi5Tr8TzCenQ5sqknPc+pf/qSktCm8Ft6uzHJZmELi4jICToFPSNJHuCCJf3APXL6aJ7K6jyvOfYddrPNOtvL7RNa6wXtWBtCL96it0Axm2oZrnnM3xwbCIv47ClOTZEENz7Zxmb2lMpQxKAywbzx1+e/282
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(39860400002)(366004)(396003)(66556008)(66476007)(52536014)(8676002)(4326008)(478600001)(71200400001)(64756008)(66446008)(38070700005)(9686003)(26005)(86362001)(66946007)(82960400001)(76116006)(7696005)(921005)(6506007)(33656002)(41300700001)(2906002)(55016003)(8936002)(122000001)(38100700002)(186003)(110136005)(54906003)(7416002)(316002)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zGrgq5L1vWTYDWrLoE40i8q2oeVRSZcqKxkvUyr+Fr5ByFqA8hZ2zPTaZly3?=
 =?us-ascii?Q?Zy916GRlcPXvHqJMm7wIoNHImrbPHGemnf+N8KoRfKA9csBAbQLsdKQuTQ8y?=
 =?us-ascii?Q?wKmipHj6ULYzDwoxkK/xl0ufz35iaHT/GlW/ScSU77+Fhmrtwlx8cdpc2cAy?=
 =?us-ascii?Q?dIVaPJuZ2YQIBRAd6YL60cTJjUrbMSrICvOy7IpoytwDwLl/aAD8xwanpo/X?=
 =?us-ascii?Q?WTqSirjS0O6W3FEjW1PvhE9wyi1I3m9LRmjwGylGXwN/j6Lsa5IA/dlG0W+a?=
 =?us-ascii?Q?FW6Rj3FsRYoDjmRt2lrVgZ/0mdf9ZKqXopKjusRrfFXaeTKrw6f+iTh3wML8?=
 =?us-ascii?Q?HbhIhHb9vS/jJwOhqSIx6rSVxA0ts5pipHRSQ56QYyaa45hIjpyXCbKp2V3B?=
 =?us-ascii?Q?faV4U1Mz4UCMIKGywQSoEjNbl8Pokc3rIBw7g1NvJtlySB1c5OZsbjR8oSfP?=
 =?us-ascii?Q?ABdX3g4bm5D8/ZobNlzcV3Z1iiWEH6WWpzwH7yjFHJzVaq+5xc9251JzMXPZ?=
 =?us-ascii?Q?5MlM4DHjPF6JBowf84WlCgX5ht/5ui2OJQ0xYUDCTDoBDAttI2AEW6KYw2j/?=
 =?us-ascii?Q?r/q6ethCMbcubcEQ4v1yk2w1mVMIFsUuUtrMLmNn8xUEGrdq3nNWnSQFmhUk?=
 =?us-ascii?Q?yIMpMtaB3k+lQWBmOgRRWiwCBHXWk1fELaqsEizn33kvWG0D36baY6Legzn2?=
 =?us-ascii?Q?Pkooy/u8VwCP9W5/MOCD00o70vN0GJ6Vv8EKl3pNm4iimtZ8Fzh7DpCx/i0V?=
 =?us-ascii?Q?BFjLy08dZnTEZkHpGD7d3YqxNP9wXxUwhM9SOt/jYCjPtXN2PHUlz5I7u0cE?=
 =?us-ascii?Q?q4MNeuDMJjZ/ys7+JPnDJzoVjawRJiy5MFWTM8Ny22qHVh6KZjBPCC/aJmE8?=
 =?us-ascii?Q?488TomydbLeqBFaSdHbjlGaF6ChRb1oz4SB0JKKd01iQXWXoIjQnUL3j5i1t?=
 =?us-ascii?Q?cMVq4fLjjRhKZRIG0xOOgRG+Gqul9N4756C+3p6yhIPkYBM/8xlUGp5bCwTy?=
 =?us-ascii?Q?j+g1hLAseiCm+FSLpfjriV6XAmTY1SbixViuMzHlAH6qXZy++NDyzBq/SA6G?=
 =?us-ascii?Q?+j/O6pPg3DD9p5+rMzN1EG6aCHDBoEyLGO727+69ZsUtDmCpkFGHBKdtlQvh?=
 =?us-ascii?Q?xo5zzbJ4RlYcEkZBWEYybjUeKeAcrGyAEAji5BnfOWSbQHg+vpKD7Wz+ij5o?=
 =?us-ascii?Q?7jM6CCrSkjekze+2b3P5F9/2WlbrDaR21VNu76LtTu2VQxGVfbmxqv/W68uZ?=
 =?us-ascii?Q?/lnbSc7aMV/NMxcGzPck+6cVVDwaAAbjHAtOuHBKd3rBkBRYyZ65R/PUd1+t?=
 =?us-ascii?Q?fcTKTCjrnSu/woyGa9NeoM++DzSjPzH4z2Lt/F16cBjS6+L0OgBu/IHqkUZz?=
 =?us-ascii?Q?HTI9pJv1Ea92Hgt23gRRr6qe46x5OlNJOj0QmAokkBu+tEhAU6ZE8YYgfVbO?=
 =?us-ascii?Q?Wt+XdqP9K26nt++yoZKPkPaZ/eSKA8Z5n7Vvvxew67FUVVMy3SvaNbhU+7UG?=
 =?us-ascii?Q?HTFbVHHbx0NrlNgp/I7HLHVWeOaZJMirpmXvtHpOccJ8oonrNYt3ElxHk3Yp?=
 =?us-ascii?Q?klOovd2SIruOz7kJtsAJoTRdAmYVzgP5UJsWZZUa?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1a561d-0f26-4a0a-1434-08da5813f3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 08:06:34.6203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0/K56FJoDKIxzDIuWuUtWiZ0McSkd2z5z0R+ZCDXHT2zc/FAs1Rpt024eseZ97xJ0HxpKDeS7XyqJk1cZKtxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com
Cc: "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>
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
> Sent: Tuesday, June 21, 2022 10:44 PM
> 
> Use this field to save the number of PASIDs that a device is able to
> consume. It is a generic attribute of a device and lifting it into the
> per-device dev_iommu struct could help to avoid the boilerplate code
> in various IOMMU drivers.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  2 ++
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 03fbb1b71536..d50afb2c9a09 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -364,6 +364,7 @@ struct iommu_fault_param {
>   * @fwspec:	 IOMMU fwspec data
>   * @iommu_dev:	 IOMMU device this device is linked to
>   * @priv:	 IOMMU Driver private data
> + * @max_pasids:  number of PASIDs device can consume

... PASIDs *this* device can consume

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
