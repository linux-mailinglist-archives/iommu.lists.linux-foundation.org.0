Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C055BF85
	for <lists.iommu@lfdr.de>; Tue, 28 Jun 2022 10:40:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F4D60D76;
	Tue, 28 Jun 2022 08:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F4D60D76
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jS0ysas9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JeZRLvgaTHTi; Tue, 28 Jun 2022 08:40:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9A64D60D61;
	Tue, 28 Jun 2022 08:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A64D60D61
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69F7CC007E;
	Tue, 28 Jun 2022 08:40:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53393C002D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 08:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DBE8408ED
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 08:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBE8408ED
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=jS0ysas9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Drsyb5Iu9vXZ for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 08:40:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BCF7408EB
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BCF7408EB
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656405635; x=1687941635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vIrh23fwc+A6GJmBGy3A7Hytj4GuWLrqOctchdNuVdY=;
 b=jS0ysas9DVMNmKFKZy47EyNW/towwMxkBrpMyyOE5W1jQnF/8fGoAkCj
 +bC72hTIahVf339Pd2N8nJTAOfRJRoyTaPY3UO5JjNdPfisncXGAtrpZr
 3rrQrZyQbgHP/tjCPdxSIRafPNArQoAg0qKYC0ZZ8kd9YZPO2xXur+li/
 eKOKEcfnbCfrisXW/fDx6ZA07br/96WyzeWxqINsCav/VbSqs4Y8Vvim8
 6+X0BTTwEUd1bjvEvgoKq6U1yPr8Sh+RbDwYbfyuxJKMy6+abxd6LDBGW
 M1LMRqH7ZKyV25KVNi+B+dfc2kUVTWbEzeWMFpgvwX6dK0mfeplbeGxsR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="279222672"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="279222672"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 01:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="767095222"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 28 Jun 2022 01:40:34 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 01:40:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 01:40:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 01:40:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 01:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHKRDsYs6Ay7HUmZZO/kqad0tjcsVhcQHJJ46h6ojRwEc3RAboRuYjtF0VLFGjBaxfdSVdG/6zcp97Rp152TBy3w2JRHrSzh5LsDHDEqXkat24Pi55LvtgP+QyGSBEviaC4HD0Bx2dhOwXQ4mtIewU+eejwZY0yUWSJHay+wm9iLr8e+iZx1yXen3RKJM/ePSVnThscKmlZ3oVW/amvfMYcTZOJaNrbSTYPd4mIwBcYL1oFbA9gOjZNCfpdlYCBNr3aCs9y5TnZEX3RDF0uSYbLyOp6Io89vE5i90cx3aXagNb8ZS4RJb3vYvb4vPGrIkVfbsGE8KB6kPWP9Cemi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIrh23fwc+A6GJmBGy3A7Hytj4GuWLrqOctchdNuVdY=;
 b=S6rX5yjUB6D0E2aaWDb3HbTWP/6bu2J6MdhtbjThxLK/X/6Q11cNcKizn/pIsh8yKDKD0kOgYA6dAHdAp+Z1G7/cvdKs6yMX//sEtA9z2AVPxe8+ik+lXQXvmmmILRm/DgKF8i81RQ47bTamTSO8KQGfuye1+OEGlNEvWAxRb8xjioYlH3N8S5f/Hvv2cpyPZ/KXx1gnnsYX5yEhe0bRWURhIsGjs8d+pqw1MuMq96flfmVBEuyMbJ8cMwDzSLlftVC2DkjTyuija28eYAdkGou/AowtExnFjhw+lN8eq9U0V2V6MWGzOT30It16oJOJ/JrQ4LTvERTgwC7CEFHoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 08:40:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 08:40:32 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.com>, "Jiang, Dave" <dave.jiang@intel.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: RE: [PATCH v9 11/11] iommu: Rename iommu-sva-lib.{c,h}
Thread-Topic: [PATCH v9 11/11] iommu: Rename iommu-sva-lib.{c,h}
Thread-Index: AQHYhX4J7A3caPf9kEinyHwrYlaqza1kil9Q
Date: Tue, 28 Jun 2022 08:40:32 +0000
Message-ID: <BN9PR11MB5276C15E0C2BCDB5E2C1ADA68CB89@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220621144353.17547-1-baolu.lu@linux.intel.com>
 <20220621144353.17547-12-baolu.lu@linux.intel.com>
In-Reply-To: <20220621144353.17547-12-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c476951a-ffa4-4055-ae05-08da58e1dcb8
x-ms-traffictypediagnostic: SJ1PR11MB6153:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5rRNxzqColtvMsj/UDwvG+9fwZtPnrEve+buks6/MabPm8QuZ/N+YJwnE8MELku/XIJ9VstIAWtippyT5Ba9kteiw7GMQc7tkkdwF7K/6johWMtdiR012mu9uTH8dUwTD5Ti8uB1eXhKulReLpLO/dRjhDw8CkyXOZ8GO2ctfwNLsutRo3kuoY5QdTGFEY+fnfR52rwqwf2bboQ0bv6BAoVuDLv84H1msZwf63mXVFWMxLtAVFIXhv11c1/CUmhb1VoInwq4wKI9j12wIGLVfmHqf+Oez4dzlwWMFha7rp39GcpxrnYPeKazEo49GHkDldr9eiShVkNwKLmKgKlEDh4iDHeZYNyfhwd7NRth1HA61nAN1DjS+uaSE4q59OXRmiCaHZPGQIfY5DjUo14Pf72szcGJ0Cuno2rIWDTfvM/d5QZFGfzebXu0pgydYTJBkRXGgMRs/p6IMsim6tpLfu9Lz+ZC+ilDvnVgJoaIOe/KvWAKAMnzQO5ERsehtLphWFMKTRwLF5n2iLQyXPdLYLTbbIhwEQGVluXTP87Nr3s4abQB5xuHUGE/0SUj59zD+lVN4fTjh9sZyTAjAMAgKQONRstpgUsT9BqoCwWnHhDvrQT3lcV4u4OdnH0bM35m8xP2YF3zx3OimsnG/3np6dn5PaBg1JUl8od0zExGeU2cIc34ZTMkETm0bcW7C826IFeQEx3l8jZ8V/Ae4u2RojjfAlFque0PL23IcFneICHbhScqcTmMckK5SmkkB+/zAIThl3r9FYO6UVhG0iItfnNualf63hyukWmCvxuRKQ3y8MeooPj5/cn7jwfV4o7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(66446008)(52536014)(2906002)(8676002)(54906003)(4326008)(64756008)(66946007)(33656002)(38100700002)(66556008)(66476007)(38070700005)(110136005)(8936002)(316002)(7416002)(5660300002)(82960400001)(7696005)(26005)(6506007)(76116006)(921005)(9686003)(122000001)(71200400001)(41300700001)(478600001)(186003)(558084003)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8qbc+xzFFGaWWj/+Q9baHcNCvP+sCJDTc2zIL7OJtkgFc0n1MEWz27Z+PXsH?=
 =?us-ascii?Q?Pl1DaDM6/X77mo82JR0sqbIX5hkRYTBYYqkbaX1K8RBsoDINdykd8LAVrrZU?=
 =?us-ascii?Q?GsBOHRCJ+5AfNDQjAHpKfqEDzqsDcN+RwnLkpHZSlWwphfi85oyIsXlf+8lj?=
 =?us-ascii?Q?M8rcWhpMIEHn/X9w2jqL4sQWQXgn4UbZ5ZiftAdhNRIhGc+2Nkf87z99h8zq?=
 =?us-ascii?Q?4Diu2jbJbgSJEz6CDkD9NeTdNf04wyiOmOUkoJcbl+5v4Bi2Q2vlXb4p9adf?=
 =?us-ascii?Q?0ux+II2xj/dUIxgcJin0oakdR8HubeGMa4s6sMRu92/XFsFOBVJ8GN8o5GQE?=
 =?us-ascii?Q?CGaQGZN8vq1ctmVi4I0lkiutNzmJkk+KfqhkVkPqysdtXMnoNBj9vv3R+p8o?=
 =?us-ascii?Q?1dgPHfVpdToHUhdrapuiLSJ+qWfHzGfMJQdQKyDgHOW8aj6emS3Lop6ZV1hU?=
 =?us-ascii?Q?8TPHfXzBxVPL1oW7CLq8bOR5Cr8AJW4tVM/tdSz8Z3S/ZL5F3vFBEOC6K3jx?=
 =?us-ascii?Q?hwe1LTiV/ubzpkyv8UwK9e3hDwSAfQSienzLx3w5Pfm5FKcznE7Dz9+WTgtG?=
 =?us-ascii?Q?ATJapDI5WW63Mv9f3u1PzBUoEwKBwXIjSbH4yDyt9gUiks4bNDStg/u7QERC?=
 =?us-ascii?Q?29GxegFQMyOO768Ld3NWvB40ux1/n9M9PHZs+yPA+p3+Rqtzore+y6WFQbMe?=
 =?us-ascii?Q?6TQVm9v6AorClEruudtntVoerm3/s6si6c48wApCCoAVhpsinvwfE8BjqHKR?=
 =?us-ascii?Q?eqUNQrxZabiIqY9rlU4G1YOulBQNkYglf1RD6d2rv1Dkrw0rybAtK2nQRbg6?=
 =?us-ascii?Q?xydb9tIBtqhKW58y0PHjsu0exSH31N2DRC3vIJdPCIJuzO41ybrYBz/TZ2vo?=
 =?us-ascii?Q?/Oojy+71rrekLmKTDuI5Tt/EhHRJmQomU6JW0qJWr3f61RqLSuJjXOpSIpMI?=
 =?us-ascii?Q?8901/f29OXOs9KxZTaHxI9ObysB2L7BzLemMjDzsVYCnYbe9uZH7nfHA6lo9?=
 =?us-ascii?Q?35PpK+8qkKk4gz8NmFDV+2PTclLzMYpTj8elZwFB4tNh7B+4w9hg6Rfp465O?=
 =?us-ascii?Q?BPqXq/T4ROi9SZWaLipW7nrbJLNlvkC4PlPvEH0md2j9FO4OVRXaMp/urrZY?=
 =?us-ascii?Q?yhkaRxm2z9i9Dxdkcd4N5HR1mOJpuhj+kZ2CMdP/uLjHeK/LSnTkoijDbTv9?=
 =?us-ascii?Q?IQ+4gMEgQo7txupNtNpiSnEYTpn38+2aTkt9yYoqTMaV837YW6PT2S3Qu6vE?=
 =?us-ascii?Q?3Peg8BcMKQiOxexdn8eLHWPo1ECRBegp1tCUdAou31frYmI/ER/WSZSp8p3v?=
 =?us-ascii?Q?6hMXR9ojOfMFTRVVlaWvO5ZBaE/E9Pjys3U1ufuxXIsHr2okNML/O0VeIsBu?=
 =?us-ascii?Q?MpI7N0apxFBJ6Iq1eRVGNvVWHxTh0Zq+D+7DjLLJnjgfEg9QlZ67EEy4VLyt?=
 =?us-ascii?Q?X413SQQv1pYOKbsbiEjCmbkIt/ahdmvms12MlYxxG0ibvXxeuDXjBd2H0K6f?=
 =?us-ascii?Q?Dhf4XGYkk9wzMLiqOW8s3nEzkdGyh0n2FeH3jDN8HdlQHVO4HmRqnD9ovu1V?=
 =?us-ascii?Q?SlewLFvr7HeixSUsK6dc6GRCjeRZ4y6T4oAagNVd?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c476951a-ffa4-4055-ae05-08da58e1dcb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 08:40:32.0167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCyI2AL98o112y25XVwntuFh4BN452ytoNCV7wRUGhiDk8TlKcKnDchb3lyaraPMa7Z3AbBsqD7P0Yy+ubnCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
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
> Rename iommu-sva-lib.c[h] to iommu-sva.c[h] as it contains all code
> for SVA implementation in iommu core.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
