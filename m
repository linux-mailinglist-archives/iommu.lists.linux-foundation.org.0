Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822D4DD78F
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 10:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51700827B5;
	Fri, 18 Mar 2022 09:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBy6Gki4Trqj; Fri, 18 Mar 2022 09:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 56C5F827AA;
	Fri, 18 Mar 2022 09:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24DD0C0012;
	Fri, 18 Mar 2022 09:59:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 967C1C0012
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D0B403AE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 09:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qd-JLymoJYRK for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 09:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FCA40354
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647597562; x=1679133562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qS7MMXlwAz7zhf2AltuIo6fMh6CoyB2HWgEQhGNWQVo=;
 b=hRpVy1HaUuYT/iwsC5FsO5pQcE/RsNt2v/JkF+fIfe0HJA7ML1bxKpXi
 2Rtxj4vfIuQmjPkU0xgQhELM9o6P6kgB3opq2Me4Gr0qChNwcw0kqP5a/
 uTyLs0GCeaGK66pRjhwRk0+wrQ73tDVfk59HFCnSLal8KodcrmBvSDpZP
 N+ijgp+1zq7dnntdvZEEo3+365rDwZMIC3BXJmkAPDyirrK7d2g9WNb18
 Ux3USsTyw5uPQ3IWE2dz7Btrffv76Q2n+kpWVQ8py3HfTziVhPrFzMOIW
 /RflHKPefEnytbmn0r2PSGjtKQR4NqLSxuonym/bG6RsIAN6y44dCwQx2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257054202"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="257054202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 02:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="541768128"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 18 Mar 2022 02:59:20 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 02:59:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 02:59:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 02:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL248h9WjFkNxyAPWwidFWNyVdQufpHeYrNiVD5irrGSfQdIajAmsenU2fFwTkhISC/vzjHRrYglRNDVGBvPvo5nKU1bn8LgvXy69c6qBtmapG9aYlWKBlgAMU29FHtAPKLVTWHndvj3YH0WDI34IrKPKR/cJLWnfEcKctyoNGCnP6loHDoRcKMkl8odOsu0FnH5/X+gTth4PU/jhbMuUlN37l7pyC6CVuv6E+4rtXdhuasReukOUoXkuf6D+/hYRvQjQmH4DUMBz7bg0Ne5SQO6x3cJgEiFAGvKoSUXIAqfm0TMi2h6s3zZkzikg4O17onnu/JMSg4Hn9lFTf2qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hDjg7eLH4WEwgRo3p/k4MdaqydZuf4td2C2shD6hqc=;
 b=kE1w9k/2/DUn1ulOzqCHrm1w45i1RJmfY6rJrzz45ERupoyPBFrT0COrWG+qiQuZCk9PAw4UykqxmF9VcT0Zi7MmKgZa5H5KRK80hNydu2C8zuBxqMAA53mIK+I+Zph7OeTIPALq6hj/s6DF66zCSFAWGOHxcFNDShv61glBksmSMgivJPgkwNhcysgaDRIdM4yISNSmOv7idNrdkwZBLx6D5Q7G2+m5kGNHyEcoqoxP90agQoPnGIzekCZW67JuwsIHZOYgT4hggpNAn+gxI8fMxetfJ7yNwvbWkPchXvuYlN66OubHuMUh4FzQc0R1pfocFXcvzh1+xRqnl4xVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM8PR11MB5733.namprd11.prod.outlook.com (2603:10b6:8:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 09:59:18 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 09:59:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: David Stevens <stevensd@chromium.org>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: RE: [PATCH] iommu/vt-d: check alignment before using psi
Thread-Topic: [PATCH] iommu/vt-d: check alignment before using psi
Thread-Index: AQHYOPPjcTDtc68ZN06cXe2QXXS0/qzE60kw
Date: Fri, 18 Mar 2022 09:59:18 +0000
Message-ID: <BN9PR11MB5276C9478D22DB9E12CFEF708C139@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220316050711.1855533-1-stevensd@google.com>
In-Reply-To: <20220316050711.1855533-1-stevensd@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd2f002d-ef0b-4a9c-b53a-08da08c5f807
x-ms-traffictypediagnostic: DM8PR11MB5733:EE_
x-microsoft-antispam-prvs: <DM8PR11MB5733C5558E85D2F67BB021648C139@DM8PR11MB5733.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QNoKWKhgXKNv6UVxHyGFV8plO3cQExJK5volZfNJYsNLroRdHzzeTlxUdzlZLT2ItOTeB7XvWIws4jZm+MzL43Nvo/zAiatx1gHD+nUYWqPSMy8lRXR2C/KoLQLygjnpDgNqxgC55zXRuDs4t8JTNqWS6c6m65OU1adcWMnp1L+PwZPCi9jrOru118xGJyLl7ugl87a3rFO/N52nKazBBOgjLzRLEXudEs0GEAOeayOEf0vba+a4AVfT1oTv5wAs1iYMyo4BVmYjy/pca4SM+PnibAozT33xG3pYOKRKV0H8+i4VwjVeY5ZdJdkLU2tV4fno5I7j5//0Z4IGFXuJCqxqxH+GcvPbk/NCubuCXIEjhKAAGJdUow58YXFM309en6EVVXCt63WTS49g5U/0LntjYqmjzzaniG7X0u5i75DEZVm6gjaRjvIODY9udmuU1/CFsn960ZKboBENvJ3QgRYNHiwyb5idYrP24TLCAcvjfjvYyM/K9ZwO+yLMV/BxUutFUbaDW46qyv3yutJI/JKB86ORzUUqcJMcZOiqHgQLxD9YZT66KYPkwlfyJbjc4n0pfXes83/dy2RMWZyYSqC92uBfdyEhnYaIvkJeMIDrZuBEf7Cgf7UWJ6aLE8gYUgc2wjPbK9aXKuDeAIAW65rBOdlhimldRzR/2JzF0GWHHNAbj+RUeAj19GiX+1NURFkoiaX/rSaW7EZDC3Khcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(55016003)(316002)(33656002)(110136005)(9686003)(54906003)(83380400001)(26005)(186003)(38100700002)(86362001)(5660300002)(38070700005)(508600001)(64756008)(8676002)(66446008)(4326008)(66556008)(66946007)(76116006)(66476007)(8936002)(122000001)(71200400001)(82960400001)(7696005)(52536014)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mUgIVdTS16qTtMwVxQF4ZU+xhQQ6Tz37rRnJ+yyt/boFWYH+24opwASlhHAp?=
 =?us-ascii?Q?eHAx/Aew+0jpo9Rys6crTFlEOtujLNNDy91vqR3oQyeU7wyfaZwyy3VEeAy4?=
 =?us-ascii?Q?GvGpvZ7XaeVUW88Z+JZsNw3KNclu04ypV7MH+2K0Qh68S7AsGR1OsdiZbvnE?=
 =?us-ascii?Q?IvCT/2vTMb0Bpilnk4n0HTY1HU4RkXclo1U0EnfUUQaACt4K7thtsBea6Gu6?=
 =?us-ascii?Q?5Tj8j9XrThKS+/pCdCAx7AEaeVZxvCKNcuRa25XzVb/5apl9LJf1mo5cdeJu?=
 =?us-ascii?Q?8MotWds6WecYQbOHp0B57vKFc9IjXqmJNYpMd29bXJi4pi17xqJHg3rIYj3X?=
 =?us-ascii?Q?wI+GMhMoj026b3p/VY/Lflbvj3cTs+1y46Zkp3RvUU02MzOInCDTMro2mnca?=
 =?us-ascii?Q?tph/9wo5OwBzA87SVeeT2z5S2zC8DmkJlxCUXKcx966P1v5xD1XFhWzISEg2?=
 =?us-ascii?Q?nOSA4iFVsU9QAjNQqCZRuGXkfNq0dwGQXIi13HuXcGTuGNpriPvLVKlM1oKx?=
 =?us-ascii?Q?5mRTDS4grVZJIaUpNaqHiuquA70sgcVkKIJvKmmVXSN0trmHqLufCJKmvGyP?=
 =?us-ascii?Q?XCDEcEjHCUSHls3PiJdDSJYaqSQwbs5/+12p/fvCyLTzP9eqUxavM/pk7yLk?=
 =?us-ascii?Q?hNpR+novTQohN1nrlBvAbB1H2S3fgHeNrVOK106omR2Fy0/QzNqnaYDTr1Ch?=
 =?us-ascii?Q?480ZvxhoWPhxf88TfCzHSTaY21U83oG+TjDRtJrAD5xBq2sy5scJRfi8TJD1?=
 =?us-ascii?Q?PD+CcYHeVuVXz4kWMhOR1156evtdoIN8o8Syp6gFv7hvG+Ps3xKW6bd2ARU9?=
 =?us-ascii?Q?HZu0AsqCvwXjEFKUeY5ntV/m22LtowdexdzG2HcRODYlys+/DTNsTRHhnvcH?=
 =?us-ascii?Q?UlYcDjf5uNMlZ7I/HxfHjJLcrkGA5KmMRqtop9CiBQlp5AWF3I0mYLDd19/P?=
 =?us-ascii?Q?fq9rogYWsQqoHO5jr3vNvOlyVw7iuTEB5cXNNQDH8EWZP4nX7o6uaWaEUlG6?=
 =?us-ascii?Q?EcMv8l87qyVExEFEaUwzbfvSvVc+V3BRIfSLYWjPaMHoHmphIGhWXhvPcSql?=
 =?us-ascii?Q?UpsK90dB6cZ9jrbYHDXuxobEJHSjHUvFXeHe5SotnlMYd6xnSIWFtpJ9ws/y?=
 =?us-ascii?Q?55WCp/6oDZt7hB4qv+ux1HxdQ1g8LXNumg9dicGdciKovE2b+5JfU7UjLxuw?=
 =?us-ascii?Q?61ACmKctASoWjS01wzJezbPRRqAaWCm5SlY41JuFgxOcE/CIBd9x7hs3sSLv?=
 =?us-ascii?Q?CzRVCrO6JUiwMuZFseySeZbLqbmWJQhtLi4TV+LhdT6Wk11mcG2qgVTiajCn?=
 =?us-ascii?Q?J0cdpOETUJTj6bVoh7DFBl6oacmwtPqClNUq2agd8bFNGDJ9DYP6ftGijFjR?=
 =?us-ascii?Q?3magV5g6pwr7hZ+Bm9eDxz7j68uX4ckN7m9MaD1fkCSDCxaewH+lAD7sH47s?=
 =?us-ascii?Q?eQhHpqYqCITUtfCqewo0Q6Ohst1Z9rSx?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2f002d-ef0b-4a9c-b53a-08da08c5f807
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 09:59:18.8087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHmhMGsM6I9IL7kSzCNoMq/LKZrVKjCKYHjrIDHZ4ps+tREdABnYrhQMiQy8vZsXoQV6WMkwOwBHXLfDvOFxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5733
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

> From: David Stevens <stevensd@chromium.org>
> Sent: Wednesday, March 16, 2022 1:07 PM
> 
> From: David Stevens <stevensd@chromium.org>
> 
> Fall back to domain selective flush if the target address is not aligned
> to the mask being used for invalidation. This is necessary because page

using domain selective flush is a bit conservative. What about trying
mask+1 first?

> selective invalidation masks out the lower order bits of the target
> address based on the mask value, so if a non-aligned address is targeted
> for psi, then mappings at the end of [pfn, pfn+pages) may not properly
> be flushed from the iotlb.
> 
> This is not normally an issue because iova.c always allocates iovas that
> are aligned to their size. However, iovas which come from other sources
> (e.g. userspace via VFIO) may not be aligned.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/iommu/intel/iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 5b196cfe9ed2..c122686e0a5c 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -1735,7 +1735,8 @@ static void iommu_flush_iotlb_psi(struct
> intel_iommu *iommu,
>  		 * and the base address is naturally aligned to the size.
>  		 */
>  		if (!cap_pgsel_inv(iommu->cap) ||
> -		    mask > cap_max_amask_val(iommu->cap))
> +		    mask > cap_max_amask_val(iommu->cap) ||
> +		    unlikely(((1 << mask) - 1) & pfn))
>  			iommu->flush.flush_iotlb(iommu, did, 0, 0,
> 
> 	DMA_TLB_DSI_FLUSH);
>  		else
> --
> 2.35.1.723.g4982287a31-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
