Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D303561506
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 10:28:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D53F40861;
	Thu, 30 Jun 2022 08:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D53F40861
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ANV6NK+l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fioMnczmE-Ze; Thu, 30 Jun 2022 08:28:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8AD5C40888;
	Thu, 30 Jun 2022 08:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD5C40888
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E3B1C0036;
	Thu, 30 Jun 2022 08:28:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 744C7C0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 495E184541
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 495E184541
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=ANV6NK+l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vgxH1d9TN9w for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 08:28:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9BA584533
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9BA584533
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656577691; x=1688113691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0KRUeUjncrDU49EbT4UwQ+v1KMLxyluRdH4ZHnM2YUY=;
 b=ANV6NK+lhsWlx2CsSXW7+aOFBVAsATJiyAl78LQPuwGsmmSmADPbxVLy
 2qGGWIQ1xED9p0dwTpxnkRxq2VhIfo+Ttww9zqCXQjF5ZEMbNNPF9gfc/
 DHVT9qeImyoX4dXTQ7mtASGEcfZf0DT5uLACsVWBqn8KXjqZHK3Ap++/d
 3sCaPq938DMRBqdfbx3YCksHR2GSKUTQHx4rmFOgvmC0HAMDzhGY5cUJI
 GLZ31TaGzVVDZuw6ryd4Z6M/BKi0srUnUIW06g/kqB5fXHb8d/eWk7r6W
 sXpn3p+IFCaJ/Ep10GwwhSHXO8Zin2i36amPGfbAa70aRS8zryzFQVMS8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282318124"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="282318124"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 01:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="733545919"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2022 01:28:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 01:28:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 01:28:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 01:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccx9yQmU++xayhEySS0NbP8FlOO146PXab/MYa1JYERu6LN0RyUwQPCKwiDCdpv8b1CG7vjWx2M5XhKyoCUV8zodOZ6GQmdf4nGWFN9zCUf3Ce2Xi2/rj+KK6EPgr6Yu7puwth5mJjTdV+IRBg2eFQUd4gg1AOddG2RvFgirmsgagidIm28qu5BF/bNOASQMr1g2Ofhcha/eFvSHsvH7mM/dKkrafk3YoZVE2P69gThxdfjRqWSxRi5xDbFsDL+c6GhFIpNyU7rZgvG299of+SmTyAVMvFYWyAFpPzZd7YiAJfxuYH5YtjV+F02lBcSzNmt6/XnKGfGTFTuK0VEMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29E8Kck1EMP5v61S20bzXcYt9w/eYVZlmhuX9Ewsz00=;
 b=czh2YJVY/OVlWWQH2i90qlIFtx+4AZdk+P0rhDRD1IK2BYqD0981rDGK7bPvtHrc6ClsmkYqOibwz8f894ygrJyPa6QwSmCqfZgbgToqM/5xsbbc48Grs2H66jKGTQsdibQcGQV6Votig4npSU7UmOtNrXXOHSm4dcta47LURyNj/LYHIM4KgPj6lfCrIYk52L5Oy4jdOAE0MFogDpVm51YseDRvRi85dGgoZtEvquIs9lwcX6vl7Yd6FrFkRhmt80/ePJMNxg4Cidbikb1gcddEEw+f2I+Uykr46DJKDd9FSYldun3/q8Da93DOwKXthSNmB2WJYqN0wfEn2YEaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB3413.namprd11.prod.outlook.com (2603:10b6:a03:8c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 08:28:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.025; Thu, 30 Jun 2022
 08:28:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Steve
 Wahl <steve.wahl@hpe.com>
Subject: RE: [PATCH v1 3/6] iommu/vt-d: Refactor iommu information of each
 domain
Thread-Topic: [PATCH v1 3/6] iommu/vt-d: Refactor iommu information of each
 domain
Thread-Index: AQHYiJMH8ZE5Hw6eJEajUkexzkMKiK1no95w
Date: Thu, 30 Jun 2022 08:28:07 +0000
Message-ID: <BN9PR11MB5276A78546BD2B38068385E18CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
 <20220625125204.2199437-4-baolu.lu@linux.intel.com>
In-Reply-To: <20220625125204.2199437-4-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49762fb1-90a4-409e-6b25-08da5a727608
x-ms-traffictypediagnostic: BYAPR11MB3413:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmzqp69YCOqXLGjlyKAA28VTwwkPRAptq2+v/DY0WAqj/112gsVTnpZ+3adCIC+9XPKyq7XhtXRHuDaX86OtuGRbqJgeFpgbM3ZbxtCvckhGyaoM06R/RuCbmIiar2mt0Jqdnc53Vy+Um8+wrT45iPrQ3g8cZ2GxdRsg9TbR8DjlnbJTLj8k6CxV2olE2LPHGrt+aLtyfHKHVBM/24PWustIFhKvOpDN/TQWfumkSEI7wvuNzzynJzc1NaoyfPeECXPUsVBOzyMBcPBQYLA8ERhhuCcSDMmbBXku4PFk5CfRXEE28zwZJWtUFl3YzqNFoacaPOitWRRgYrEuVGUMpWE3EstfaK3hyte8IRRrkuPejR9vbh/yB5Lb6UqefBCRKFUx00hlWBQLrkVz1WhZtLjBcJMGEALvu4Bueoel/mzH8dSXMNnXtbrnScuYXc2jTqP6zhq0bYwzo9sd0yEgBniuZue5uv+BfRG0FWc4mdrUL3xGHLM5qzskn77W++wwgfKrlMScaUmz7PK/1sbxMIVTKIzj4wDspPw/1UmJKiL2H/fyadg7ge4r/rYol8VbBc4U/NBvBuGgNkcz4/YgAEpkC9/1BfJQkNXhieVEmU6rARo+aGqHO79geo3w36T16KlFIqvakrznKiKm9nWhr9A88RXzj7oHN2Z6CvRm/QTvVF6Od4PTSWT02vYtCTkj7gtMSxrRFpauAwU6DACTdSDS5z+zYF+Fl7lSIWh39ey203uDPmBcyZCuLHIJtjJQwUKOMXYsxc28KG5b/fgVoD9qL5Y+zxbz8pe5e/uk93ke5dpUa/M/Vwh5h4dtQdCZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(136003)(366004)(7696005)(33656002)(7416002)(2906002)(5660300002)(55016003)(52536014)(54906003)(38070700005)(186003)(64756008)(122000001)(66446008)(8676002)(66946007)(8936002)(26005)(66476007)(38100700002)(9686003)(76116006)(41300700001)(316002)(83380400001)(6506007)(86362001)(110136005)(71200400001)(4326008)(82960400001)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QLXz5rf83UjuG3Uzloj8hAP8qX84oRbIYu6dV0EGn0iKgl1FXv2v5xZs7QI9?=
 =?us-ascii?Q?kL+OzniIV6IMJnFb+7GFUS0ZalgJSA2Zo70+lBR1QHUXLdAHW3F2N0TesOqq?=
 =?us-ascii?Q?meMs59m69ZEe1FH2EGElGFAHJQbi/MXDSs2hjPmmGehUZlSHiMErLqd4hU9c?=
 =?us-ascii?Q?ijtgXqcjnr3QsmbYg3vp/2Kx/OjyxUCqPTcBMYgKh7AsKEV4UCrL5vF4rXw1?=
 =?us-ascii?Q?U+EppNtDEj79iKJDiRYgjIohoowrNMnxnBwEGZ+BosHI2JOI6rq53h1Jyalj?=
 =?us-ascii?Q?j7KU0rAByHrSqzQD8njEreD4SL3zmtYS1KNFGk94LpsItFeb8XJ9HznNlBen?=
 =?us-ascii?Q?DcULLdDwtP2KSiOuPs3k+Ixok+I56UdfBhHJx5QHubQfzHsq/RRBWoK9erA/?=
 =?us-ascii?Q?tSaGFsz33Q6nQ6cGuMxakOTSIfjyoK4U1puvAZZOgSFMJ4BzrdH1yjBWpnkN?=
 =?us-ascii?Q?goCWVjdjlJJOj8JLLH0KtoYFFXrsf9/8IZbK+Ci20dU3h7QZKhDDamLyEzgS?=
 =?us-ascii?Q?ecW2KEmoJf3oIpPfKv/At+JJfUte+h7TDIwyfRSSFxHNqEJonWLpt3anNcjR?=
 =?us-ascii?Q?Ya6y2siUNme7biyass5vkYr5yzxSHNokdsm0T9Sfu2bgV3M88gU+bGpXukVI?=
 =?us-ascii?Q?PWYiciYgSZZiZtAnF8SNM6bj+lGV2RGm1Bpn8BZGJSc/tn5lxd01T9nzC2ms?=
 =?us-ascii?Q?mKPH8ljb86lF+rRdySYcXb05FuLkkjLWMqTLFVTWP2Aze1I+MqlTZ/fA8tiX?=
 =?us-ascii?Q?6DM9rE1lTm4mn/yDOJrpAEWg2MnXlrYGeLHk+lf6lF295BPJaft4+zCCfiOi?=
 =?us-ascii?Q?kkEfrKts0/RUwedVqpRyXt8So/0PaUgD9uSWlTpN/pbatWWF9iGVopYyCY5n?=
 =?us-ascii?Q?khlEOmNhVRQ7n16I/eFxmp+3JwIHtMU0yytExGSX8i3NrVQ3/aVKQ3KrUzZk?=
 =?us-ascii?Q?t+xJ8D1ajXnRV/BSA7yol453v884yUy1ek+PrrrDsv7FFLqIQknm1YIsLolK?=
 =?us-ascii?Q?kKhZ9lKCN4/7nlv5ZeQDCi8woRrnSzOdziOXTd+eWmQh1c2xmZJ30BFnCFHB?=
 =?us-ascii?Q?o9ftowV7CnGrvJmWQ0OHVmOON6dea0BqKFb6Zm/XDITsoMNp/AirU8OI6xHN?=
 =?us-ascii?Q?9aSsEzT4QCfB9re2GBnPSLccCgXkzK+g5nyAWrkEltBKT6CVG0GP8k8HKnR5?=
 =?us-ascii?Q?KoUjdQHLHqYuqtfRkTA1dRIrScApltBPY2pLAAeo1tlRZwBo4uekhZQR282u?=
 =?us-ascii?Q?nsiXF98wt92y0SclEo1VsNhA1NSmBawYf5SLumWcwX5pK1aKWQhVA1PgI/Xy?=
 =?us-ascii?Q?pKg2adz5r/nRQ0oFAyHhTISnRZes7x+grObYZn3dccDdG27K5z+Wm2QE8LpN?=
 =?us-ascii?Q?OIq6AvSCPb7r7NhMyG8yRx82nWjy6MGILGnnmO3cukJXOb65Kmm/esL8Ou+I?=
 =?us-ascii?Q?nVndQvWtp/n0kUMtuZjXeEcHoenDvR+/lxSdy1VYhLNTM53kAGtwmpYI4ieZ?=
 =?us-ascii?Q?i6GNafWiE4fr75WKCPsVHX8dzoO/LD5WVvLhzft5Z0rew1z86oojE1k3rpzM?=
 =?us-ascii?Q?C0/rpOnBDY+4CJ17d9uLlQY71kYaLgMIVjzofoy5?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49762fb1-90a4-409e-6b25-08da5a727608
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 08:28:07.8912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: usoBBwulCT9mO+bCwST9uyj85bsxGMVhNGMPRMrGkODghR57pJAK0EhQCHf3OyS7lZ10qJxydfgaw+0CCopd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3413
X-OriginatorOrg: intel.com
Cc: Dimitri Sivanich <sivanich@hpe.com>, "Anderson,
 Russ" <russ.anderson@hpe.com>, Mike Travis <mike.travis@hpe.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 David Woodhouse <dwmw2@infradead.org>
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
> Sent: Saturday, June 25, 2022 8:52 PM
> 
> +struct iommu_domain_info {
> +	struct intel_iommu *iommu;
> +	unsigned int refcnt;
> +	u16 did;
> +};
> +
>  struct dmar_domain {
>  	int	nid;			/* node id */
> -
> -	unsigned int iommu_refcnt[DMAR_UNITS_SUPPORTED];
> -					/* Refcount of devices per iommu */
> -
> -
> -	u16		iommu_did[DMAR_UNITS_SUPPORTED];
> -					/* Domain ids per IOMMU. Use u16
> since
> -					 * domain ids are 16 bit wide
> according
> -					 * to VT-d spec, section 9.3 */

It'd make sense to keep the comments when moving above fields.

> +	spin_lock(&iommu->lock);
> +	curr = xa_load(&domain->iommu_array, iommu->seq_id);
> +	if (curr) {
> +		curr->refcnt++;
> +		kfree(info);
> +		goto success;

Not a fan of adding a label for success. Just putting two lines (unlock+
return) here is clearer.

> +	ret = xa_err(xa_store(&domain->iommu_array, iommu->seq_id,
> +			      info, GFP_ATOMIC));

check xa_err in separate line.

> 
>  static void domain_detach_iommu(struct dmar_domain *domain,
>  				struct intel_iommu *iommu)
>  {
> -	int num;
> +	struct iommu_domain_info *info;
> 
>  	spin_lock(&iommu->lock);
> -	domain->iommu_refcnt[iommu->seq_id] -= 1;
> -	if (domain->iommu_refcnt[iommu->seq_id] == 0) {
> -		num = domain->iommu_did[iommu->seq_id];
> -		clear_bit(num, iommu->domain_ids);
> +	info = xa_load(&domain->iommu_array, iommu->seq_id);
> +	if (--info->refcnt == 0) {
> +		clear_bit(info->did, iommu->domain_ids);
> +		xa_erase(&domain->iommu_array, iommu->seq_id);
>  		domain_update_iommu_cap(domain);
> -		domain->iommu_did[iommu->seq_id] = 0;
> +		kfree(info);

domain->nid may still point to the node of the removed iommu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
