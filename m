Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B45614C3
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 10:22:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C56340A9A;
	Thu, 30 Jun 2022 08:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C56340A9A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jkI6l/1j
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNQ9iSNeqMDb; Thu, 30 Jun 2022 08:22:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6899240A42;
	Thu, 30 Jun 2022 08:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6899240A42
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 215FEC0036;
	Thu, 30 Jun 2022 08:22:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD64C0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3210340A42
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3210340A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNJqMFSGI8Xq for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 08:22:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 641F7408E6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 641F7408E6
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656577329; x=1688113329;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i3mXjm1B/7Yl4jg7ckrWQq+9iIpP4aA1enuPIrThxFA=;
 b=jkI6l/1jpTSrRhOfmiOvHT/C071SP7OJWxOjl+L+e8UcRwM1UEVEH+9C
 6GYMadoDVJicEnSbHgBl683f8g7uD20FfFfE+CuGlm69Ppk5cRkJWnkji
 sBZ5W5L7N0F447wTX+ZCX5TNzM+OgDjf63i7WvqHOIX9I6bddIPBSzof1
 GgYaYPgeroEsTSbfQfyFQ15ed+qmQ9n2tsjWM/HK4XU6Ldo5mQjCkvXqx
 dwe+Cjt8xYrEeYkjw0ilXFaI7Ekkz9Ea/DOxN0A2SYjUin84vlfynTP7/
 tUnVGt4PsywZqdp4mmGVIZHxQAhFf5eMHU03oOz0BG7Cmn9RSQVCl7gsn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="346274392"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="346274392"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 01:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="917959055"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2022 01:21:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 01:21:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 01:21:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 01:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtUp9Lbiq4ZSByOyV435yNg4aD9ODYonua7OkgbBrGR7wkBtqsTZt2rXWB/oRStNRtT5lcg6hfw8QTCk6p7ymf/rxWG5xTCRcNzzl84kyj1i52tYf/YthXhfI7vrBX0CvW11L05+nQm1Jw4ymHAzuDTJ9NHKUsts59RPPAxhGiqwogfN46EME/NLjkKxwjEmSUpIBk40SzEpm38HgXBnZOz+U0o7Ijnr8ePHB4ygU1hK7vqWD0Eg4TzXYNXdCfpccWgyy628EFcptXEJrI5ZpXb8Ac6pPwU3vjPOcFoPKZK9zvwR3AR3qfRacUumHatu9o5REonkKZ7Ug1qHEK8UJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99AoyB3a2TfgHoMPyZ//VcH8h/wr5P5h0ysL/8mc/2A=;
 b=k/dH3xjh5ylfQP/B6YiYYYZSRfrexPrgUMfROsRlCy1z5ZKcZEJr276orgehuK5oBfBQfibXMAl70zAblqXjYuRXHy62LNKtupc7rzkbHSflHbygatuY8v2eTk5577Dlr8i34t/TTsrqlH0hUHZ3KqyL/3wReuOYKu0CAceuGl2mVIx/3UTgzaLfbjFbjxAjisvIz6L8z9btnNMQ7/U92S74H4jjo4/9vVuqgi4vEWEr3Wb8EJgVougqkG4U6gqspdNSlAdOIpVxWV/JpfFdk4UoKz9Zl/sAlNL5MKB5iBJ6L5rYHlyHt6ic3oTEJu+P3PZ5qiVoY2Y1J6g9LfAcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by BL0PR11MB3188.namprd11.prod.outlook.com (2603:10b6:208:61::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 08:21:51 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4847:321e:a45e:2b69]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4847:321e:a45e:2b69%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:21:51 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Steve
 Wahl <steve.wahl@hpe.com>
Subject: RE: [PATCH v1 2/6] iommu/vt-d: Use IDA interface to manage iommu
 sequence id
Thread-Topic: [PATCH v1 2/6] iommu/vt-d: Use IDA interface to manage iommu
 sequence id
Thread-Index: AQHYiJMGN1OR022yIkeWkE/hSwC7cq1nozqA
Date: Thu, 30 Jun 2022 08:21:51 +0000
Message-ID: <BL1PR11MB5271C0143C8EA440BDAF45828CBA9@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
 <20220625125204.2199437-3-baolu.lu@linux.intel.com>
In-Reply-To: <20220625125204.2199437-3-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3e89614-c4ef-48af-dce9-08da5a719570
x-ms-traffictypediagnostic: BL0PR11MB3188:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v5FxgzDl0YKtyQJibSB/DN0Nn9jgpmPwV7RdNqGtra+TE0Ac2J24n0O+LJliJ/WZk5OM8cFe45FRBDXJ7LOnZl5TivNhTFhB2GxY2+nFk350NDhIRxUsKcBTdpOjel2t6f/+4M5Hkilb3WKzxVkiLoUowDwAmnVkm1PA8HdTYJjtea9ko6fmcR5MwVPDfcl6N0PMX0Jr65L8GgF7UPAoMsTAPu2q2Xy2qTb9oAVpAhahPekI+1TZFxhlOLH6T1bNFp1YwSTxJRaujISBjVQjMWtsOuf5291uHQ5/XVybZzmx4fcPvehr8tRenX9xF7LSFdB+2a1TWuNfGrOAOodF+pomb7wf51zhzuIEGq1wVxAZZQhGOpgBAWs463qvYrH8bFv/wO6/dXIqF+wNcwLjFwivJnwPjDhNky6q9MItFqJ79OUhEEG0JCEbRF/Oonbty1ZjmTSELEhceZ4QrY5Dp5/p+Kyp+SelXpuGVLY6yaD3RyJsZ3xOmAxAEN1eowYbWpIF0scCkUh1bW/UvQw2g9MwPINrGEPrz2/toadtOMxwDnUN5sCsY9FI9+P2dByFkJLsYOL+6iAgANhDXI7LWRllD9yFKI1kfzFdCqZXC/5NKmuMUzHvSeRM3EG4RoaSmjHA0cjocVtM67VayyYxBkzZTvaI/vQzNBt8Yvwr5HUJ8lqn7ricT+x/GVYalRgyeG1t3BZPg+cLmOrTizG4l4SljOrCswSNJ7UES29CRM/iL360MvYPq+Wn8Ir+6Fj09tx+C1tKwjWVPkILH1IUssnDmAN9DPhCHtDEJEeZnrbnNn2odKHKA+hoUFIA7Vzr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(396003)(39860400002)(346002)(8676002)(64756008)(8936002)(5660300002)(122000001)(52536014)(4326008)(76116006)(71200400001)(66556008)(66476007)(33656002)(26005)(66946007)(66446008)(82960400001)(478600001)(9686003)(316002)(6506007)(55016003)(86362001)(54906003)(110136005)(7416002)(186003)(2906002)(4744005)(38100700002)(41300700001)(38070700005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9beFgUWAr9tGk0Cfo73BTZ3lCqJrFAhzXxymOqMRgYFBk6LLK6C9jjYH1CWd?=
 =?us-ascii?Q?Zlq26L0GjwOsVY9GZQ8YEc1rZerpQDjK6EPsrhg3m2g6ijZ2MRQ5FReY/xM+?=
 =?us-ascii?Q?wyhASV2of/GFovKgfb7e7jraA9Zoka+OJYL0aMuzZ5dYBpOdfG7B9kk6kMrx?=
 =?us-ascii?Q?NnjYkJ0uBfi/TQ8jB8eu1R8NMMZVafWdEAoifF09R2Vj2ShGxXeiNkTL4ZRn?=
 =?us-ascii?Q?ZtH7XWmo3LZ/Ym99sOFmI/HHdIATJW+qKUHGZeVAGUQKTln6sW/kXoY6EvHD?=
 =?us-ascii?Q?KtA5IIlYOKINafGrL49d84tx/pBHH317d532qHZMUfWdz7r3KENzHWfxRp92?=
 =?us-ascii?Q?srx9gUEcX/Dcqkaxg95LauMwROITqKbKUNvWuMAL3ffT/7R5aP1ftOpWcDhi?=
 =?us-ascii?Q?2n4Hux7UD97I25Q7S2+v7uOBOC5dkybNCUVvyisNvVj089Ul0ULJeig5bmEE?=
 =?us-ascii?Q?L7699aJpNE7sYkvqNQMmnBscLKRP+iHwp1SkxohmExPJwq6NnV1BA9a8cT3R?=
 =?us-ascii?Q?rYaFuzqxaOwhjHtwgLzQ5slbKX0X4YG14y7ZzXSTg49I/TPArqfUmrTH+6iI?=
 =?us-ascii?Q?wsqa3xf9T+uaIT55oJMI/ReCREJ7rQ73EcFKgCtuHeP7114fIZMT8asqt1uZ?=
 =?us-ascii?Q?ZDAfCBS4pVjCga8mCVs0vzINLX1+Nz96oOX5gIk5XOeOFMNMCsg2+YymMYNG?=
 =?us-ascii?Q?+KYkUQT7InbWzUO/ayF8D0bCG6BxaYRBFXKCw8O+MrK5yIp9Y+WSyidTbAVU?=
 =?us-ascii?Q?7IeTUvBTBIrAIKTzO5YTlezIwg2ODyHiJcwosC6GmegjokJWQhbXgm3TR94j?=
 =?us-ascii?Q?ImZczCmmVL4Fjjy4QPgiHVJxTskP4pG7SGiG/QNl71Nfp6yGxtY2G0yZ5KDN?=
 =?us-ascii?Q?NZ1L4oCeSpUS/72Nfde9bszHC/cqV/M1F17Z0cRKn1zhfy9r/7urA+kCGhGN?=
 =?us-ascii?Q?3bkM+EbhRZYYDJ3ASoHJYHuTg1PCzUP7UrnCxWs/+5p81SoLYDwdIc2OrfH1?=
 =?us-ascii?Q?qyrMlH+qPDRzvleFvmX2UuXzkpruyJYcNrErbQ5WxSghgWnYSy/blOQI/iPn?=
 =?us-ascii?Q?1UUtlrhIJvS5vwXCaZSm4Q7v3ziWEiGV4dVMUKomTz9Zv9dFAY1odNsL+/Am?=
 =?us-ascii?Q?rhcI5pGU6g/IAa3tN3F95L+W2sphgfO/nMSkJ8l8L3dzHZSOzwwhkd3Murz/?=
 =?us-ascii?Q?ZbCpcie+d5zkAvHA0rcxxS7wsrubpLD9TcCCvRn93xylXLIZx9g+EGrJt+J1?=
 =?us-ascii?Q?G/9bnXgKtA+ed3m8x49PswhPot0NHC6OzGjbVfkDRYm5bxBoLNcKecgLyq22?=
 =?us-ascii?Q?B0a7vAtecQSNHiMgc4OhSGARjJiK8xuzNXjRb18CYoGuSKWfIi3S93Q5NOya?=
 =?us-ascii?Q?hg7IAvDD+GY3qE14WSWaKjjc0MK9WPa8uzV2yTcETMSeYOr/7iO4Od6BBWIZ?=
 =?us-ascii?Q?XLm9UcidtIFEFBF/wmK2uVWCbXEuMVg98Tt5lwAJNr4C7MoVivViR2ZUSgVb?=
 =?us-ascii?Q?4OLgx/9w3d4yC44czKjyULsBFuHFlFNIr6E4uFqp8PphFD6xsKs/g7p59YGP?=
 =?us-ascii?Q?syEPFK6KxxX/gsWiUzdWC2iDPR12MRRm1jFWgwhi?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e89614-c4ef-48af-dce9-08da5a719570
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 08:21:51.0727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzvT9E6Cc7ZSgm9ej+vErcqNAvcxr6WMzMktV+fP4XWjSsRRB0+jxFeVVZLeImyKRTiWlEsykK9Q7+isk/hUfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3188
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
> @@ -1062,11 +1040,14 @@ static int alloc_iommu(struct dmar_drhd_unit
> *drhd)
>  	if (!iommu)
>  		return -ENOMEM;
> 
> -	if (dmar_alloc_seq_id(iommu) < 0) {
> +	iommu->seq_id = ida_alloc_range(&dmar_seq_ids, 0,
> +					DMAR_UNITS_SUPPORTED,

should be "DMAR_UNITS_SUPPORTED - 1"

> GFP_KERNEL);
> +	if (iommu->seq_id < 0) {
>  		pr_err("Failed to allocate seq_id\n");
>  		err = -ENOSPC;
>  		goto error;
>  	}

ida_alloc_range() returns error code already. No need to change it.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
