Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E254DB3C
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 09:08:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6280C84003;
	Thu, 16 Jun 2022 07:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gxbjBsPf-bq; Thu, 16 Jun 2022 07:08:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 546D483FFD;
	Thu, 16 Jun 2022 07:08:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28102C002D;
	Thu, 16 Jun 2022 07:08:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B8D5C002D;
 Thu, 16 Jun 2022 07:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4961D610F9;
 Thu, 16 Jun 2022 07:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tp78Vkcmwhzi; Thu, 16 Jun 2022 07:08:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 513136108B;
 Thu, 16 Jun 2022 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655363295; x=1686899295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UXuGf8aiYEHvq8TG1B3SPdsJ7KrdO2AQU8Aqtd7i/ns=;
 b=EOj+5NFl2RX7IJN3jyD7KZqG5JkAZIxbnavl3EuI4ALaDjz7UaHunpO9
 VXsNbPvx1UPJVWcjZpimIORxKXnLivTIn9RwelFhTttgvach/q9CxqJF3
 poD+PCa9gac4NGcNFKWTrmdyk7MQCSK6slEX6nkcHieHuceIkf7UURpkQ
 0J8uZeoVH8tihuUAfneHwZX9NvD86y1e7ba7mGSslUAPOpGJm+oGcvPru
 9LXlLjNV7Q/LlFp4TW7VqO2KCgakSoGnt2b8MN4dU6UrJv6/sHc3aw9uy
 RFpCDT+WKYSGPS06oCIpTKjwMnWYGPLHSPpSZM3+/dDInt6vQrencfrnm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259647701"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="259647701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="912040866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2022 00:08:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 00:08:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 00:08:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 16 Jun 2022 00:08:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 16 Jun 2022 00:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNAP8+domOPKxBJ4QELOtRizy4c24NKXmfMBz8MHisr9HQoB79rtNi2Xbe/sJHAid023+aIHmaoPIvmAvQ8LgvOw8ZGGEhMRQSRr+zrCnOzit33LOpfIBsRQ6yW/MZqV/Rv0fOJ2oco8qajqEYhovq6cvJ/zLJ1WpzmzRP/NLGWrl+9vZ88Blbc34k5qMnORqWIf7AhFfiOET3UpTXKnAEbwhvwlJ+7YnECh85easACUfYBncokuJnkdwDvTYjF9tG3Shp08/vUKqlUKBwazrJ1k6zXatkmAeJRI52JSoQxpkJw9/MoefH8FOUQ59n/NdKLGrH6UeiJq0CzscDAPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Qn7KeKMFd+BaxI/33ypzN2GkVATVsJMxaD4eLYNElw=;
 b=N7qaFa6zdEUAK2ApGCxjLjMAsHMjeOrgJ5iU6SY7RF8ybvY3vnW7fDOeo/PAUC8+6X3Hgw320BW0tFlfH+wbk8c03Z/KHKbiycHVFnPCu37zHpMxsFGRzMpY68LhQHfpYeIed7z8rmYNFnqaI7sRq3hLaCFVY7eqNbCxjaY2x8lm8rBp8jqP09xevRPhpmkRInxW8QvGaw4jW2xetxX90/7gL+5bb8h/kKVKzMBOBWSwBZdcBgWstgo66PhlUv3zDcz9UEZEtuTr8qFBlWH4ob9QwuCUPgvUnngapLvCbVhtj3o1D/jndpCRZoASVzOw1L7CHxA2elL2Dy1iN0IslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by MN2PR11MB4494.namprd11.prod.outlook.com (2603:10b6:208:194::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 07:08:10 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4847:321e:a45e:2b69]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4847:321e:a45e:2b69%6]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 07:08:10 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "marcan@marcan.st" <marcan@marcan.st>,
 "sven@svenpeter.dev" <sven@svenpeter.dev>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "orsonzhai@gmail.com"
 <orsonzhai@gmail.com>, "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v2 5/5] vfio/iommu_type1: Simplify group attachment
Thread-Topic: [PATCH v2 5/5] vfio/iommu_type1: Simplify group attachment
Thread-Index: AQHYgRSKHdu8hpsyN0qjOVzlAFzvDq1RlxsA
Date: Thu, 16 Jun 2022 07:08:10 +0000
Message-ID: <BL1PR11MB52710E360B50DDA99C9A65D18CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-6-nicolinc@nvidia.com>
In-Reply-To: <20220616000304.23890-6-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1274b422-2fb1-4cf6-b2ae-08da4f66f8d1
x-ms-traffictypediagnostic: MN2PR11MB4494:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4494FDF554777EEFC611FF6B8CAC9@MN2PR11MB4494.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aCC/EDEw07wUEIuTxxpxm7Gkav126ifNEvw12h7cHnwn9D9rA1Ks207ZjzKtwqqdvgLiNL7HnOujyRT/c+jlR2MEz+4nZgbvT533yzHraMsgCLl4POsALB6NiTjjfyY6R4u9ckHwcpfE1fl/BZPUz6BsDNjmYVRmZAKVq8hym1gg8wncwhFd5eCskF6EadvMnT640B369VKiP9dbOXa5oFKfprH+sA6VSW9GGVjnj8bBXMvN4zCGEt70H3wffBgDaEeSP0DbUk2PFQnU3uF+aYk3Xd8a9VwsshLXiz7Fk5d5za6Vrf1HbuJR/jH9sv4rtis9XD+piOof+FNsbz/1fxjnMkp3iUnNcDX/CWvsC/A+RABdSq84ApTfaSuaNdbaPUKegLJisUEivwoL98H5SJ6OpPhN3yyMNcy+U/XybhzRVQi74cja2osMHSXAUKryyv03KH4gb2w/Q290lEDPlAtwtXbHmfUlYT6UF8/ojnBJ3LlFjD8oM/Clca7psD6f5Jq13qeYR85RYV0E+6R7hf6Wk+OTZiYkLih2m6tyvoAscf8sNSIVfhuzp6y6T0SwRVQXKGpbHlD/9wHqD6+Sp8HDO/xYEUY9aDk9tDQ5x0c4gDhYbj/HimMEiLOxX/hjhwmEYYuc5afNxDUKwkg35Ft2mVeDNIupS2pSeVfUaOU6FCjldfI44+opJAn3GCncB9b9Zh21CMQnJNN1iMUiX16159+jLC29ZKH9RpfpCfg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(71200400001)(82960400001)(33656002)(86362001)(38100700002)(316002)(921005)(66556008)(76116006)(8676002)(38070700005)(4326008)(64756008)(66476007)(66446008)(66946007)(122000001)(54906003)(6506007)(26005)(9686003)(7696005)(52536014)(110136005)(508600001)(7406005)(8936002)(186003)(2906002)(7416002)(5660300002)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L9fefZ9gJ6c68+/kMGNd2gOHB/Ryet3AQJGRUY7OOczRMBjof/2O8wZlG7M/?=
 =?us-ascii?Q?trVqTEVWUmsg0Eeti8NAKpLIHVzqYwcJJheNT2q8bnFJ6dk9e3mTQk0f9Iu6?=
 =?us-ascii?Q?K6ikjARIFUcll5LBY30ZQdnlUIzVE6S+Jx8YNom72mFbeGJqerOlh5kAoKqJ?=
 =?us-ascii?Q?qdNRU0dmWAzMoWxEOE6+2CrKXh2WFakhYSeQHEdUEW1T/3O97D6dlj8gDntx?=
 =?us-ascii?Q?X+K19XXSkj9V/qvwB7mHBrzknHnqemy2ygPRgYLB2/wMY53Vf4jiLozMhR08?=
 =?us-ascii?Q?22ins0H5M4Hq4H90heh7vgAY+hcEp0fRvKJwwVHPvTheyQVdQ8juaFoo6f3U?=
 =?us-ascii?Q?F5Wd2qffShLXf+Rh162h8M6nqbjMlENWFi8/218GuOPNDdahfxUalcHQ9uy6?=
 =?us-ascii?Q?Vo8UcPR/GLQxTT4deIq08rNq0hkPLDGZzr/o7rrBm8q0Yn2FRJkGqbk/T3qW?=
 =?us-ascii?Q?CnyVlhq3ncu5E3QLt6mqdUZkisHvaxH0YZd8DdIExxKuu7RZBjMkOR+zxLAG?=
 =?us-ascii?Q?ElN+IVpgCf0Vc6mybD/D7Qt8kH2zCnqRLKHaGCAX2anbPr7VASLjCniRys9E?=
 =?us-ascii?Q?2gACzf0ulY8yD/JpL1K+b5aGkG9Pulp/wVpaw4s+ZkZk1NVA7qviGHm8ljGA?=
 =?us-ascii?Q?1FKzEMz4G5/zkGuM7Fkj5hWysPuJ/ZcGy5Fk4XjB1MziHBXrwr8QWrFTv4sb?=
 =?us-ascii?Q?q1aFWepLEdlJTup1cvkVkAquTciU47Ucf12cVe+WdjB7k3DRP5OnO+FGSrMx?=
 =?us-ascii?Q?rO1iEUXupnhlHzmxz360dvoaiRzWUA4ihNV2joUbicyyerfgHnJuaxUdhDjq?=
 =?us-ascii?Q?FWoFx3sylS5Gw5IEpNyJYkLj/BQf7wDwFBIJiRAgPdkkmSm9VjDG8i41jGzo?=
 =?us-ascii?Q?2bJ/pDBczIXwGnMgKRkFh8VQ3hUOaZ9pCJRW/FacWGhEnKIAz8JcEZqrlru2?=
 =?us-ascii?Q?yhlRtvwHhbYbf2dlgx7p2s0q8crRER81ntjtdwSL/OnHlVWRqjRZSSQIc7JW?=
 =?us-ascii?Q?sznehBeFo4MOYMpIopOOkvj065G1+/1vEkTnBQOHNqbaNBEtW8uGa5ntd2Ev?=
 =?us-ascii?Q?3dO8McRBKeebOeGAHDJvZZG8qMDlUYnn5ws0ZghjOvZFHXze2d0vwALS5s/Y?=
 =?us-ascii?Q?VY1vXDvQJ4HdgEdt/oeJ7aesi0kpFU4Bg4eZsbj6x6IPNH/lKJMujvbFxHa6?=
 =?us-ascii?Q?kMfBMUmbRRzonfUKKdC2IpTB4r7/1JdpCcjEGchIqTUTc2kVwdjCTXFZT/vR?=
 =?us-ascii?Q?KsHVYx+K9U4mlTnfgSogndAJW7mPz0tj6fouLqOvvv6HmicxHBmtijLuwuPo?=
 =?us-ascii?Q?/O4i9rTEo1mpWtFfox28HeSSGvRMptWUZjemZBNvU4mnkHXpTJTrnBuQ0SVX?=
 =?us-ascii?Q?V8a47htd+sDTEvTshjNbGJZcfiLfWEca/3ee2IhSgV4E1HWTRkGTyvJ4sBjL?=
 =?us-ascii?Q?njYLgGTps2Or/sJZiJQ0NKlY+wfn2KlrzEJ43FNWQdCHnYANywrP6N77aFNO?=
 =?us-ascii?Q?eXIHzk3N3bRE5RSWj7BkgM9hGen/jyS9RNsfYCVqrHxwClRM3N49yW/6wgMT?=
 =?us-ascii?Q?409K1uxYj+HIBF+tOiW0XTrAXuA5C2Mo/FeZlaDLQ9W8NQH7XiP6FEvRQX0E?=
 =?us-ascii?Q?ETp8+DkvjjtFHQy91SzeGqfUcpicw/Mmlow6T0mTGwSFcHaD/drC1xyQYurp?=
 =?us-ascii?Q?W/VOQoI2ebOCAN4MYq+a4GPz7tdB94ttdaB5793X+MazekY4yvxDIOLvMNxn?=
 =?us-ascii?Q?lAxph7UyoQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1274b422-2fb1-4cf6-b2ae-08da4f66f8d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 07:08:10.5941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pgIASoA9/LtUWOSHRAzUEFdlV4uiXzBUJRTv9bJtl3qyR7FZKA9GV1N/ItvsojMGY5sU9oqpUtunUPvF0dwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4494
X-OriginatorOrg: intel.com
Cc: "isaacm@codeaurora.org" <isaacm@codeaurora.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>
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

> From: Nicolin Chen
> Sent: Thursday, June 16, 2022 8:03 AM
> 
> Un-inline the domain specific logic from the attach/detach_group ops into
> two paired functions vfio_iommu_alloc_attach_domain() and
> vfio_iommu_detach_destroy_domain() that strictly deal with creating and
> destroying struct vfio_domains.
> 
> Add the logic to check for EMEDIUMTYPE return code of
> iommu_attach_group()
> and avoid the extra domain allocations and attach/detach sequences of the
> old code. This allows properly detecting an actual attach error, like
> -ENOMEM, vs treating all attach errors as an incompatible domain.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 298 +++++++++++++++++---------------
>  1 file changed, 163 insertions(+), 135 deletions(-)
> 

...
> +static struct vfio_domain *
> +vfio_iommu_alloc_attach_domain(struct bus_type *bus, struct vfio_iommu
> *iommu,
> +			       struct vfio_iommu_group *group)
> +{
> +	struct iommu_domain *new_domain;
> +	struct vfio_domain *domain;
> +	int ret = 0;
> +
> +	/* Try to match an existing compatible domain */
> +	list_for_each_entry (domain, &iommu->domain_list, next) {
> +		ret = iommu_attach_group(domain->domain, group-
> >iommu_group);
> +		if (ret == -EMEDIUMTYPE)
> +			continue;

Probably good to add one line comment here for what EMEDIUMTYPE
represents. It's not a widely-used retry type like EAGAIN. A comment
can save the time of digging out the fact by jumping to iommu file.

...
> -	if (resv_msi) {
> +	if (resv_msi && !domain->msi_cookie) {
>  		ret = iommu_get_msi_cookie(domain->domain,
> resv_msi_base);
>  		if (ret && ret != -ENODEV)
>  			goto out_detach;
> +		domain->msi_cookie = true;
>  	}

why not moving to alloc_attach_domain() then no need for the new
domain field? It's required only when a new domain is allocated.

...
> -		if (list_empty(&domain->group_list)) {
> -			if (list_is_singular(&iommu->domain_list)) {
> -				if (list_empty(&iommu-
> >emulated_iommu_groups)) {
> -					WARN_ON(iommu->notifier.head);
> -
> 	vfio_iommu_unmap_unpin_all(iommu);
> -				} else {
> -
> 	vfio_iommu_unmap_unpin_reaccount(iommu);
> -				}
> -			}
> -			iommu_domain_free(domain->domain);
> -			list_del(&domain->next);
> -			kfree(domain);
> -			vfio_iommu_aper_expand(iommu, &iova_copy);

Previously the aperture is adjusted when a domain is freed...

> -			vfio_update_pgsize_bitmap(iommu);
> -		}
> -		/*
> -		 * Removal of a group without dirty tracking may allow
> -		 * the iommu scope to be promoted.
> -		 */
> -		if (!group->pinned_page_dirty_scope) {
> -			iommu->num_non_pinned_groups--;
> -			if (iommu->dirty_page_tracking)
> -				vfio_iommu_populate_bitmap_full(iommu);
> -		}
> +		vfio_iommu_detach_destroy_domain(domain, iommu,
> group);
>  		kfree(group);
>  		break;
>  	}
> 
> +	vfio_iommu_aper_expand(iommu, &iova_copy);

but now it's done for every group detach. The aperture is decided
by domain geometry which is not affected by attached groups.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
