Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C04F9058
	for <lists.iommu@lfdr.de>; Fri,  8 Apr 2022 10:05:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76FCC41CFF;
	Fri,  8 Apr 2022 08:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVxHCr35308w; Fri,  8 Apr 2022 08:05:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5B2FA41D29;
	Fri,  8 Apr 2022 08:05:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1941EC0084;
	Fri,  8 Apr 2022 08:05:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B31BEC0084
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 08:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C9F60B44
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 08:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MO-uF4W4hmkN for <iommu@lists.linux-foundation.org>;
 Fri,  8 Apr 2022 08:05:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50BA360AD0
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649405141; x=1680941141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9+cW0PKeK+K9t/TyqbQgjwV7r3KYNlCgobmNERTNf7o=;
 b=DFGAXkn4gQdHafsQEsmXSBeXQSuFUOpnYDvjtoUnciun5cn4OrYsdO37
 sn5nL7C8wbkcf5qrZ+imIyQv6ReBkI1P9XZFkhtuMOfwGI1XK5bchXi/G
 6oCnOOdfldKRQypxn8Bq1gmJXhCWPWjVvvHeB0mrbmv//awMJD8gcRp37
 zBXQIwbzyrRPDm3yIZ6YYSGUoCiGx6nygWqu5TAOJmHmR/GDLIBZepBHi
 el3GyEj7hmZecyq1qI+oH75/B22+HTEqE9xjc++GRGEoq/YKZ39QZbx9a
 6//MFbrqcVzNhJbgPvjneWPN2Dk9sURRmdAmNOTxX9JSDLmqTRHgysTpo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="347980470"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="347980470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571406025"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2022 01:05:40 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 01:05:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 01:05:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 01:05:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 01:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn1XNlVFJ5EcwZCht1Q6a1JjIZ9k1CUIxVC/h23ueHldspIDEQL9xd5yYdyTIwwuL91RXZqMott+IIKKygrqy8UrOFhUEMa6uaUSgwf3kcJP4hllaa49+ISGenfEuXV9F3TRyTh2MkOpvKsO6AOVbooQvdAuGVLaEaBQ4yNxQCF1fyuZeo4L9pDBLxiZxSDE86/3v8sdQDIB0Nh5LhjtLKLBqiVFKW8i52RMBI1J8BBJp6U2eClIVlv0cYJfTiJrbxKdFCT0zDK+sY0jDqMT4sZQkRGRQfZnaNegw6yjwHazZw4pZJQ9w29bbVJxEEkPdcvbU4C2aflAc6/qXMc1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKsSKXxQ6CQNFvDhFfiyichszm9mFf7kMNHl8LALVX4=;
 b=BVGK5L3CAtu1bCzPsrohaupTXD+223AM1V0MEyPzm2/rfwdddmMkfygd/1v2yYpb/23Pi/9vFcdKlmfR6gwUckQBpIz38EUQlg1MCl7eXzdLF8L+JIHJxeIU5nnhYft7Uxsdn3qIwkk0icblxPuwztInqr5co3x3Mpwin56XhDEp1UDTdmhBiJnsx79Xc89gHHtPFwi/041OlODAQzgMJkWfq8elbK3x9dlsTKL9lNTl4iMb0zgmX9kOXydA42R4ho3hkRTexPHnvbv2+dqZCIFooCseY6wY1oLSgpNyPihO3cIEDAE3o1Gsfx92O+fyv8wM/443KUOi3Ts95lU9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3852.namprd11.prod.outlook.com (2603:10b6:5:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 08:05:38 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%9]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 08:05:38 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Lu Baolu <baolu.lu@linux.intel.com>, "Cornelia
 Huck" <cohuck@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Joerg
 Roedel" <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon
 <will@kernel.org>
Subject: RE: [PATCH v2 1/4] iommu: Introduce the domain op
 enforce_cache_coherency()
Thread-Topic: [PATCH v2 1/4] iommu: Introduce the domain op
 enforce_cache_coherency()
Thread-Index: AQHYSpOEGT6KYihBE0KVKKuEEItfF6zlp8Vw
Date: Fri, 8 Apr 2022 08:05:38 +0000
Message-ID: <BN9PR11MB5276FBFE9D5BC5039BA571A58CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-f090ae795824+6ad-intel_no_snoop_jgg@nvidia.com>
 <1-v2-f090ae795824+6ad-intel_no_snoop_jgg@nvidia.com>
In-Reply-To: <1-v2-f090ae795824+6ad-intel_no_snoop_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65dc8866-5bbd-48a3-c2b6-08da1936914b
x-ms-traffictypediagnostic: DM6PR11MB3852:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3852F1BEB62A53D57BA109AB8CE99@DM6PR11MB3852.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ac7PvI2tYbGOCZ2Ls2CaK+z/apHjbkMtKu1T0JqHaUEUsQ2AbbAPyUcHUKBUn17KCu11vWR+Tc4sEJuERhC0w4PQZGgXNQjWcVsX8dDvYQyqAFn0x+OXVBszDkirPlsXA9AYDqVBPSQu85W9k+RXuLi2vBllpuCVTO4SZ5miBCgs/A1y5EW1VpMEgRNg7mgtSUfA7wxWr2xhgGEzJKImMJ0VaF17pN6c/m62tBpMV6PVWGLDxjdOR4DqOl0NU6Y7LrmuFmZck7N5bdhYSnzdqB7O1N+dUoo4XIv0asUIHtqu/0sfJavuqc9MuW2I0wJ5+PuEL7hHwLuqaFck7jTtY/wu9q3NiZZj4lM+8+1jT18fyb/hy5UvOustQ1AZ29x8UI/yjAjAMlrETsDiMMDF8TQyxNBQGzs61pXK7FICP33MR5mqt6rVqp96hWRWqi7+NYXDKJwGRRwDPy9MPVVTROJYBZzAnpLZKCTB5vZe/V2Oeiy777ZUINpSmleFvOOuKWNlU+6CkZvcd+6AXsePB9Ej+VUHdatfaZuL6oahg1J6iJ24XoLoSDblLcubFClhMNqjhNRkA7PDxua9d4XA7BuyvFL2UPDfiQGYQgc5qC3uIvLeUKYhPo4uKf0SRX2S1nBzmgD+G3k5coeHFVbu3cOYNXkz1w5m+D+zDfHeryR7TxDcpDXoz1TNMlbtlLMP8fudjvIpnMrBLtSx/FT05jQS6UKE8zHDFZyxzSkdG/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(921005)(38070700005)(316002)(122000001)(82960400001)(5660300002)(86362001)(9686003)(7416002)(8676002)(8936002)(4326008)(38100700002)(110136005)(71200400001)(66946007)(76116006)(66476007)(66556008)(66446008)(64756008)(54906003)(55016003)(26005)(508600001)(186003)(2906002)(52536014)(83380400001)(33656002)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TAKxbw9vS5NFguzKL8DTlk7k9lc7SB/Jqh+rq7dG0j9OL/d8TU3EZgcbEGD0?=
 =?us-ascii?Q?C7XT10cdnUGs/0+6ePvAZP2tpSeEp4XaiAVb9J7417YfP8ziZeRMREUESjaI?=
 =?us-ascii?Q?wzk80n8BVrXRQXrJIeLi1QG3Zb/lOiguCwTTsp74uAS8frDZETtSKNMXTD6U?=
 =?us-ascii?Q?dAbM4zbcXF0k57MJ+7iSK41LgIBctVRON2xUYWZ8wZzLYPmeRVTiGSs7J3Zw?=
 =?us-ascii?Q?nMFeWabuF2Y8W4Rm+sQsn+KGC2ShI+rntlN4c/afiA0LnAvMQOhYIcN7+j3z?=
 =?us-ascii?Q?VlPaLzb/0LMF8IH5EiPyfFRcN6YFY5aA9JC4h7Gv5NA0OHoiIwT8QVkH/9VO?=
 =?us-ascii?Q?Sp36nyM6FeOFVVzeOLZx1UtJuiqBeVMXG+p5VjACs/3w9Coarfx9NBdn7BrH?=
 =?us-ascii?Q?wD1cHElaxF59Di6qSLShH8F6B1Ve8L3EYsW63pidcKcxmLT8rVA+nVntp97r?=
 =?us-ascii?Q?rJB2wRQJUst3ePcuCHXqUgTnps7apkWx7j7NcCwhsBSlWRvCnr1XiHQV0yMR?=
 =?us-ascii?Q?mzVGqnwpvK6TyZVqpt2kHoLq82JCeUGjPxdNP8uuFMygtT1WhrSd1MY0FKyK?=
 =?us-ascii?Q?Fh5ZInVvKdZYHMKccyjJFY4Rf/LJsWGIWpjap5sEi9oX/joH8e3J2nRETbNX?=
 =?us-ascii?Q?0WBac4B4ErNjh6RT5TXo1wOvK5C94ydqNteirE+JmdnEuHyAGxQVbdRg0PYe?=
 =?us-ascii?Q?zv5ZdGKPowHkK8pYDFu0q9Talqz6pfxjJaiF5+F1LBokFeY9fsWk6Y/40w03?=
 =?us-ascii?Q?X4FZLLe4Lw6VlcuICqglNY8KEtgmFqVnsf/M/Ekbfqpa5JB9errraJFrI0Oi?=
 =?us-ascii?Q?nJ1PBN9zmBBT6WEj7SNFDs2PxNuP7MDrY1iABz08a3+5UapOvS6QfjsFTONm?=
 =?us-ascii?Q?wikmLIMwd6Z815dGQH3Xd7g9NIsE949DVBclLyLmR6niz3fEdggNN5tosfnB?=
 =?us-ascii?Q?FCRloJmyiEN7q86YblyuK9NLUZwxWJEFDdJlrfwxkWFcbYxcE2mvOJA1VbZf?=
 =?us-ascii?Q?YFCzeNHspTks/Didkfrnx0/ws68TyIpODQ90vK9D1VkKSs/99z3JG4mWwFk+?=
 =?us-ascii?Q?ScaV1C0yqhnD9FqG6Pyl1JgPYeDgVt2ycDuPHuoAEuUa1fG23jEEYTb0YqS5?=
 =?us-ascii?Q?REGcI2h15p7TFf68wSDajJjkiELTvujUAI+KwbMHNN+muGgtoTmesXLS/bVb?=
 =?us-ascii?Q?8Gc8gEwAqpxAOs8DflHx9b5xxYEYeM3zH/dMoy3Y9sQcXnCslkuAGMWrUH82?=
 =?us-ascii?Q?POS/XQNFl4o3c+AOl6oBxk3JV+R8Mv7erLJTOONRSJk/Q6XnBvEkzA5B7Xzs?=
 =?us-ascii?Q?Bwr0jfu2KqXMghXfwTUBFdF87NilhjmQC9B9l2aZmryrxnSLV49hPSj36xvD?=
 =?us-ascii?Q?XCsodYwzwQz1YpE2Fg/tmefOoiBpWjL7cb54DqWDGQO+PvkKt8u4/YQ5AMdQ?=
 =?us-ascii?Q?Gweq6gFqnGCvokaX+0DcF9bhRlwBnNh4SdETA2CbsWPjeSioKgqoTL3pDNTl?=
 =?us-ascii?Q?L4cy20CtKppO4egdrDIdHL99cuGoQEz5LZmaOBJ/E8auq7pWxKBKApRZw/Tu?=
 =?us-ascii?Q?10MShhKFxSGltUh9qdYaR0K9TfTt8gmCggG0sLRXGtZt2tLVHJGKWkrwaLHv?=
 =?us-ascii?Q?U11N5eVzBT/hfvbatyIneyd0665oQUxApKag3dpX6hPzuTda5Apnv+mThTVn?=
 =?us-ascii?Q?dmearahBgFO8uL0HSkDaqBPFNEG8qxONYYOpx4PHW8dk+Ge0pdQDf6Kbu5OB?=
 =?us-ascii?Q?+1bbOZ3jFw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dc8866-5bbd-48a3-c2b6-08da1936914b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 08:05:38.1686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZHk12ym4S28nGpbD5cO37ZhogxAaZZN75Lao+FR7T4XdTcWItNeQHsJ/yhXr0pzS7D+q9TslZI0Hl0iJCYOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3852
X-OriginatorOrg: intel.com
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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
> Sent: Thursday, April 7, 2022 11:24 PM
> 
> This new mechanism will replace using IOMMU_CAP_CACHE_COHERENCY
> and
> IOMMU_CACHE to control the no-snoop blocking behavior of the IOMMU.
> 
> Currently only Intel and AMD IOMMUs are known to support this
> feature. They both implement it as an IOPTE bit, that when set, will cause
> PCIe TLPs to that IOVA with the no-snoop bit set to be treated as though
> the no-snoop bit was clear.
> 
> The new API is triggered by calling enforce_cache_coherency() before
> mapping any IOVA to the domain which globally switches on no-snoop
> blocking. This allows other implementations that might block no-snoop
> globally and outside the IOPTE - AMD also documents such a HW capability.
> 
> Leave AMD out of sync with Intel and have it block no-snoop even for
> in-kernel users. This can be trivially resolved in a follow up patch.
> 
> Only VFIO will call this new API.

I still didn't see the point of mandating a caller for a new API (and as
you pointed out iommufd will call it too).

[...]
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index 2f9891cb3d0014..1f930c0c225d94 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -540,6 +540,7 @@ struct dmar_domain {
>  	u8 has_iotlb_device: 1;
>  	u8 iommu_coherency: 1;		/* indicate coherency of
> iommu access */
>  	u8 iommu_snooping: 1;		/* indicate snooping control
> feature */
> +	u8 enforce_no_snoop : 1;        /* Create IOPTEs with snoop control */

it reads like no_snoop is the result of the enforcement... Probably
force_snooping better matches the intention here.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
