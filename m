Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6A504CEB
	for <lists.iommu@lfdr.de>; Mon, 18 Apr 2022 09:00:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF4A83EF0;
	Mon, 18 Apr 2022 07:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsxxlzWUHg2W; Mon, 18 Apr 2022 07:00:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8520983EF1;
	Mon, 18 Apr 2022 07:00:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6854FC0088;
	Mon, 18 Apr 2022 07:00:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81020C002C
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 07:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 546FC83EF1
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 07:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFq0bgbJuGz3 for <iommu@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 07:00:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A794983EF0
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 07:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650265232; x=1681801232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aEAp8kfntAzEx/isoyNK0QO+EOy9RlvHzxV0B46Jn9E=;
 b=QURaD3yCDiuiMTZMEXudzByU/qo8Nf1hnKAAH1KcILIVpkiPRmxGQCfi
 kLk5hhKHnoUenlozRT5fxLPGA4TZaqqmSQR4NODvvJQ8hYsaS57azdCM2
 p82mFETKWRLSSDjq0AUlbvclKKCCgLXoM3GYzWKL+KZPfaIiftDg2XTZ5
 gPxTuiJ95KQwciELP/uVRWjMqRf/IcmSYasulUKqnkOG9J77f71W5JHCX
 MPez6eOZBPtq/gfMjyff4zJ1ZUF/72CUgyhT4/4ekTN9/Yow5naR1n/Xl
 bH7+bil1tZy3EW0McPRLXnG+Mx3+Jjbo+ZVqfzD8BW5hx+wBxIQhSWVPG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="263640899"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; d="scan'208";a="263640899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 00:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; d="scan'208";a="657155513"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2022 00:00:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Apr 2022 00:00:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Apr 2022 00:00:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Apr 2022 00:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkwLvOY0pldbhKhwL3MCsxSYxi6B45pDMiWEStfkWAFbdy5JtaUwT4uoGQCv6wXKIGXimtzwxloO9w6tmuHxSF1FYdu42ZJwQZoBlSq7n6iZV2rKwC/+VvA1fV92tfB7o2tx7+4wZMV9CU6HlPo/+SpkUAn1aYEtZzMUtDxyoM/maZRFSdoXdIRU7W6kuaTUcIQMZL6RC47BJ2gRyFlgqEOS4Lng91/yHi7xlIa3LjXusx68gD6ejvB7HqX37lYH5gMzJ7CyN4DBfNpC8tqHsL34zsUsHwsKSla+Gq6hi8lPeDEGU2ctw6yWIgL314xz1ZrhzxYNQfsN5n0cQVhANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqUJHGJgbZPyJpi8DgM5XMZrvkBb7Zv+M6OIgQZ7OP8=;
 b=crEEp88uhuTo+zcBHSAYix7HUjyEC2vlWdVMpj/V7ODSeWX4k/yL03oG/XGcHuaAEJ3QTHyE3URpi7iKJhgWn8qHOic+jd0CnlYJq1btUjY5NEGP465JnBzbVU7vS3geay/3+szh+3CXcjyszbkl9RCIKZCgrIFoDXqj8/S6cq71lKROJ+xdRsaGi+HLl4MFdG9ZK1ZLU4wUmu5TPyPNqdPQAExUvy7N1UhJvaKrrXiDxjpduDdpWR9zKXxrZMm+Nbod4uTyJwLaFUdPrGwr2JGRXIzu7VgbEWLEsmc/N2TXogOOHn9faD7pi2NrMecMe/JYyEdMKr4bSB1ctHtiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2127.namprd11.prod.outlook.com (2603:10b6:301:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 07:00:29 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 07:00:29 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "Pan, Jacob jun"
 <jacob.jun.pan@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>, "Liu, Yi L"
 <yi.l.liu@intel.com>
Subject: RE: [PATCH 3/3] iommu/vt-d: Size Page Request Queue to avoid overflow
 condition
Thread-Topic: [PATCH 3/3] iommu/vt-d: Size Page Request Queue to avoid
 overflow condition
Thread-Index: AQHYUY422toPVQ3zkUqA6Ie6xPKyzaz1QE7w
Date: Mon, 18 Apr 2022 07:00:29 +0000
Message-ID: <BN9PR11MB5276BC4D5F9B133C84630CBA8CF39@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220416123049.879969-1-baolu.lu@linux.intel.com>
 <20220416123049.879969-4-baolu.lu@linux.intel.com>
In-Reply-To: <20220416123049.879969-4-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8da863b4-4cb9-49d6-39dd-08da21091f7d
x-ms-traffictypediagnostic: MWHPR1101MB2127:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB21276686C0920D6AD85D05388CF39@MWHPR1101MB2127.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: exS8dGazZxTWBb6CaZHyMw0ZIbuotThcmxmicD0iHD6vp9dnQ9hLBja6ZmV3788SbiWR8BsTifv1/Blr7x/Be4JO9QIdJi0Xa5kRYrgRrCU6ZwJvQZ/qZomoJMRYraBIvrV0VfZnDRC2xd7XWHJP6WnWxd6zVV/hUDvoA0wzXYGxyaydAEnoPDVMq1/iKwV4WDMjqD26/LI8ENpMjZFAdp9cGMFRfBZHR0FhIQsiPznyul6nO6FkwejwtgYlFFC7yg7F1larvK7cfyNVuB21Q894sl3krvGVSdZUGC3/zlXI2QZzQmDfF3lcncHXIKAY/v9kwP0PdSqOitNY5WTAXYNUobYmdlFFpsHVcvLkyRUyaxdHpRXPYkoTTNRqGIAUHXa6BjmCYntbZ2Rvhrk5Pw/RqaHSy5roBo0RpkpuyCp60nusAbr18PdzjumDw9UL3lUheehr2UBC1OxdcbRf6SKEA47dNynVLbBVIzUJGklmvBgO0pkLy+VdS8wMUyzZLcE1JOGp25B+2Cyqpo5lLsNvFHFYZXVAW8RMwkawHhqarWm35itVtBOO3WkhTToxIKHT3wAdOAoMXfpwnD9Z3EM1TovqgnMQN4bwCvI5BVf9WJaSdiJ5kASaxQcZI69X7YWI9ORiacvLMPqIp0OzT9T6dEoX0EB1lb6KNNiYAaJCt7e5Jn44JhVwlIiuz0cYERJzG94vdMu4dmAYV87ESw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(71200400001)(64756008)(26005)(508600001)(8676002)(4326008)(55016003)(66446008)(110136005)(54906003)(86362001)(33656002)(6506007)(7696005)(9686003)(6636002)(316002)(186003)(83380400001)(2906002)(66476007)(82960400001)(122000001)(52536014)(5660300002)(66556008)(66946007)(8936002)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5wm+qgcb43Nc7w0nCLqXeyhWJE4sgiwvOrYBHJ+vdDqXB6aNAe4ioAVcG128?=
 =?us-ascii?Q?nxpaDDmhW8Sgtz9If1DoKvyWM7ZLXxqOxmjp8kS9s/HnTMv/ybVK/E/o34f4?=
 =?us-ascii?Q?6h7ZH+j7V0cZ/2J+pKUwYPmH4TyQqn+pGQXIuO0i8o8wltL2KJ9XAb6nniJO?=
 =?us-ascii?Q?YHxyDB8r5R9sanJkM8PNfvceEKPRxGybfpT5kRCJXcnXjRRWRoZ8Ni83y34r?=
 =?us-ascii?Q?sEygjpYRG0YkvN+Iw7oaqabmFH9WDw6kpfPtb5vOv0G79MNvrFOyDF89Qz9B?=
 =?us-ascii?Q?1oOon0Edy1Ok7JvQjKtfRaaMaf1s3H7aGWWatWOZugSNX0X3OmLns5wsF1nf?=
 =?us-ascii?Q?LbXnktEQPLJoDqiqikOvWzxKcNoVTcmutCDBY5CYjNJsv+NwF0pR0f818PQ6?=
 =?us-ascii?Q?E8xEb052qOwaIIwAZZbYVmHTycnaCHD0NyPgL6ZN3h8/CKS4Dp8RKj2/TuWI?=
 =?us-ascii?Q?KjPw0x51LvnHUlICLCwyFjkoWIRoT/syFAclBD+0ar2/uYakRihM65+XOV5q?=
 =?us-ascii?Q?gRujYp+XjOra+1wUwTaSWnaZF++I/zWdYWhqJ1V3TcoptA2VSP1VTs3fBqN1?=
 =?us-ascii?Q?XQB7M3INZiB0xRASoT3fNN+aO8LHRx+hU9sx8ZvcqlNLZUWSHpQrYM6e+4ga?=
 =?us-ascii?Q?Yv2+7E+0w74sD3/Cy27VaO+m0AIi6zIb3YAg/1yJS8q7a14qoWjWWIDPiC7n?=
 =?us-ascii?Q?TCXTtA5V6adQ72xWzPA9N9oPaWJJdEL+RTc8URgam5Z0LK+ZqBVuFppAXYRe?=
 =?us-ascii?Q?UFRN17hl/b8hT1ZoYjbKQLpXXmYcgdcJEw/eM5/wKIVFclAhpNd41saO7yLR?=
 =?us-ascii?Q?juM0JC5MlNG5GEmO+ivDKyVyuEyFJnUFXeOZktT5mJzxou74OBVpy5OfXHbC?=
 =?us-ascii?Q?e+WC+/z45c8vUfXMsk8VIjjsoKuu593mFk+PbzvXdvBT3hjnhc6OVMJWH8Mj?=
 =?us-ascii?Q?RkFqdCc/Ky9PwIEs09ZOI4IgeFVXeqTT7/4qcp1LSF3PMp14ssJafshcSv85?=
 =?us-ascii?Q?UtbnvbgkyJSyn2V6yYL98uZSTfJAgnDFmLp/qsMqIbIdjYL4QDE/x5RTFOrR?=
 =?us-ascii?Q?oYHSRST6FnqaPFEFJXvq24IgbWh6EWSyRE8hXZM0SbxHR3eKj/0tbvG9uS5u?=
 =?us-ascii?Q?5dixAy/9EsbXYjG/SCscZhNOTamFgiO1ShYOi4kRzRy6zPsPVhsL3RwVlyP8?=
 =?us-ascii?Q?QEvwQ0f1tZh5NyYq0SlwltOoBZuLpFoHUT6N9ZPEmUfbrRshn/287dJKmUQ3?=
 =?us-ascii?Q?Pa3oERRpKrxhfEmOL2rYzbXVZ8ML3VKd/UquNylX9B6N5j3+dyS5fL4QyuYa?=
 =?us-ascii?Q?XCJIiI2OqDKMwQzTdwgsrS27FCbG6bW+pbGmufeQUnskzsM6SBPZOr2hzm7y?=
 =?us-ascii?Q?kQ5JbHBjxRZZ1x0oC5GgOWnLXjJ6ZUrBgbQbLWQ/3iLqM899EKb16NRrX+IM?=
 =?us-ascii?Q?NImicZon56ZGNUjpDoWq12gYwgkJzrrbnjKywwJ2zX7A27DflsNSw/k///R8?=
 =?us-ascii?Q?TrXrK6CHoRvHFn9BW7s+6wA7z6Gmiydf15DSCv+5B0CkSnjSuAFZT6l85Wtr?=
 =?us-ascii?Q?eocXJH75NdsDuSR96mRupm5tyTueO/8HIlYPCVcQqTzC1puVdp1Bs7OSoPFQ?=
 =?us-ascii?Q?ORGhge92tMEbE4CLCpR2XpgqrSKHOhXJEwlwvRQDHilxaDgtco87j1Vbzzl4?=
 =?us-ascii?Q?1/BloSOt8O3KVSenGaU5PaPelGu1vpqNzIWhm+8l67WBP3YWTuXqfipvlmz0?=
 =?us-ascii?Q?c42l+FWy9A=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da863b4-4cb9-49d6-39dd-08da21091f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 07:00:29.2444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+3IHQqDCSnhZmakW2ioi7fSv75qF4Afxr0x7N2f2raTyHLNhvquwjJnNzo/CsfVRCMxBzgghxAP0OZTLe32zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2127
X-OriginatorOrg: intel.com
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
> Sent: Saturday, April 16, 2022 8:31 PM
> 
> PRQ overflow may cause I/O throughput congestion, resulting in unnecessary
> degradation of IO performance. Appropriately increasing the length of PRQ
> can greatly reduce the occurrence of PRQ overflow. The count of maximum
> page requests that can be generated in parallel by a PCIe device is
> statically defined in the Outstanding Page Request Capacity field of the
> PCIe ATS configure space.
> 
> The new lenght of PRQ is calculated by summing up the value of Outstanding
> Page Request Capacity register across all devices where Page Requests are
> supported on the real PR-capable platfrom (Intel Sapphire Rapids). The
> result is round to the nearest higher power of 2.

The actual requirement is usage and platform specific. What about
doubling the default size and also provide an option for admin to
tune?

> 
> The PRQ length is also double sized as the VT-d IOMMU driver only updates
> the Page Request Queue Head Register (PQH_REG) after processing the
> entire
> queue.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/intel-svm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
> index b3b125b332aa..207ef06ba3e1 100644
> --- a/include/linux/intel-svm.h
> +++ b/include/linux/intel-svm.h
> @@ -9,7 +9,7 @@
>  #define __INTEL_SVM_H__
> 
>  /* Page Request Queue depth */
> -#define PRQ_ORDER	2
> +#define PRQ_ORDER	4
>  #define PRQ_RING_MASK	((0x1000 << PRQ_ORDER) - 0x20)
>  #define PRQ_DEPTH	((0x1000 << PRQ_ORDER) >> 5)
> 
> --
> 2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
