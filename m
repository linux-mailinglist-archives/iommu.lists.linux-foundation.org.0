Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A426754A9D9
	for <lists.iommu@lfdr.de>; Tue, 14 Jun 2022 08:56:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F69D40610;
	Tue, 14 Jun 2022 06:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqsrefLUEuA0; Tue, 14 Jun 2022 06:56:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8B0FE405A4;
	Tue, 14 Jun 2022 06:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F11DC002D;
	Tue, 14 Jun 2022 06:56:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4956C002D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 06:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B09BB60C08
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 06:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNcMH_XlxamX for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 06:56:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06954607F9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655189774; x=1686725774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6RU0x+/MOAc5GNoin4RwWsgKT/+QvbROyKabidDMcGY=;
 b=cUTgCMzpyLsjt9S3QXGhpkiwy92Ca7cnXOPJgLYoK1p1FZPNMEZ57a0C
 j87lmbqzHyiFtZVZU5hdpUI2hkJpOj2qAahIIB0dIArixPvnmezNKeY5o
 3/iwJKOLlsT2owqX8Ufo8zGCdb5lNfQP01T6b753mmFKELEcQmtFgnWKX
 VmFhznT5nT4IHuKE4VQSOdKwL/J522xIzD4N9k5SYbxxrqkVIfiK9x/AF
 JMAWBeDgNJXXjDNMQqpkX64a7xctIMQsVER1FMlwFfgCOtjdvgFj/XiRD
 5i4L+ZPYB+m5g8CZWYBipTtK4q92yHfU0ZY7yO5wc40fqB0Psma8T+WEY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342494718"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="342494718"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 23:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="569785202"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2022 23:56:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 23:56:12 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 23:56:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 23:56:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 23:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCCb90cLMwVmVVV2Vi0lD51ysDzYnOsWIRB+2eYootcAhcbmnPyDdl+JNc9xTInKigQ9B8d/tf1Z5W9UfvAoJktPj5bpUxzkIQzG1V+gRlhMR7o5IQOil/c8XFxGhC4Qc0eiaqiJ0/tcGGNZI/s7JxNrIRajEhmX5W7mibd6AvDB2S+3h9we7bw7Wtq7lFfn9RIzvafS0CfWJlwoBUE+j2zUGD+ujK9mzXK+cMJg0wnTkcrzfXAreD6zSHIqfRGWtm9FqNCNW2mGYn6M1CxKLJMHhfgNLNvI/tUWLVTqjxryyU+7nWjWaR0aa19Zp8PC1xPRB5tybh3uHK4Yi6QKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RU0x+/MOAc5GNoin4RwWsgKT/+QvbROyKabidDMcGY=;
 b=W9fokkheX4bn/VSW6efkplHBeT5+Z4GSH8V8jGU3R6E87QtZR+nqgf0Mib4agoHd33bh2Ry3Zi8KMY0//gqWinkb1Vlo8yPYGYly7SH7BgJ39o1oftSPQWxYKjPcUhFJUlj7SVpeZZFl5A7GRjm5VgAElWSSeylSJ/YE36Vl+4HdaXhrcN7wS9ekSVX7LArboDxoVrmj7zP97vLEGES4BctnV5MZYJqcS6a+4uMlD0OHqTl+LM6yi1Hq4k5jxcvQdHN/LN/xcHYeNYg/901NFsnj4eS7z8+4WusIQmH/1s91QqyySvs75fsO/f/121VlyUgsIwf5Yz73wkEHJM762Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 06:56:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:56:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Raj, 
 Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@infradead.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>
Subject: RE: [PATCH v2 08/12] iommu/vt-d: Replace spin_lock_irqsave() with
 spin_lock()
Thread-Topic: [PATCH v2 08/12] iommu/vt-d: Replace spin_lock_irqsave() with
 spin_lock()
Thread-Index: AQHYf5pKX3ap8ChLk0yV3oljD5jF4q1OeDTA
Date: Tue, 14 Jun 2022 06:56:04 +0000
Message-ID: <BN9PR11MB52767A524767B4A69257E0508CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220614025137.1632762-1-baolu.lu@linux.intel.com>
 <20220614025137.1632762-9-baolu.lu@linux.intel.com>
In-Reply-To: <20220614025137.1632762-9-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c44aaf1b-bc92-4542-212e-08da4dd2f355
x-ms-traffictypediagnostic: CH0PR11MB5562:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB556271B36239709B7D66C9D38CAA9@CH0PR11MB5562.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j1s7y+KkSbyD13OGlR/dXy/3omlxvlqySiwV6QhpiSsDKWltWsJ+2dhIg1XaJXrBnjSKj5U0vk8uG7X5XUzBYpBM5/bq0YWCJ2zk03mFpEyT235bbeJXmYxQuQzkt9roQsmwmOgdHgDLFi/V5a3nwqsyvttkqf3VqkRwnwJLFBlMp/5PLVy7yu0RDE10H5o9KBw3X5ElPE4qC0TyFh5fk8gslZFsS+D3vxnspSyntpmbPwd1ZqfTZOtByvTuhN0PyVpgJ0MJ55pTT91fRo17eWmXd2tf4sfzNrGW6KPl8ESbdCh1aOJS/LqWQWppUXigraigoOPR11kaC9vxrm6vfYMfIi42avzcBuSfLynODHPojGXb2vdGKIZ8q59wwDxm+U7jInXAAHLJHYB7EohJHTpn21JKUYUqbhgcFR6ed8otKvnR2+KJEd63bmkqig2+NPtkD5A36GducFM0saZgsybexQhgN95ScUz9TA8m4DBanIXiJhyXvrxUVCralFcby2/6GkQsLzRWhB4KitUMcsP4kYjqlGavVS8XpKxgzLdan+eEPJJxX0mAs0rHNRphTwB4f5pvmHVpPnakJ0PvvbTqZd5mW8Iof//euHyK+LLiYom/QB9G1bQxbtGlRtM2SO9cn2eEW6+2Vb6GFQAZ/Ck8ciR0SlfPUnKWOrEPBR6JB6LyhSisby1zXk4/Zhzz7+fbiydF8VkA3xZl6unOeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(316002)(54906003)(26005)(38100700002)(4744005)(66446008)(508600001)(6506007)(5660300002)(71200400001)(86362001)(110136005)(7696005)(33656002)(8936002)(122000001)(82960400001)(55016003)(9686003)(83380400001)(38070700005)(76116006)(4326008)(66556008)(66476007)(64756008)(52536014)(8676002)(186003)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dMVteptM2b8SQNM5IA9ZM7QeoUDmnediYRDtTyL3hut+Ugleu80b9jCKlxkG?=
 =?us-ascii?Q?fPv9Ui/0LFObUlSead1pAjTfr0Fa39irwWeTcwePdOBd5wW1g7mvOtqCu7Fx?=
 =?us-ascii?Q?wa/MPA0yuOMJX8mExlTbwCB19czG7NHD8SKbXlKwBfu0LrWeGXX0CBjixD0r?=
 =?us-ascii?Q?WpHIN+bY7KANOaSYYE+ynW1yAIUqs02a3+KdHLMBUyLM8lpwTo7OEIWTxjBN?=
 =?us-ascii?Q?niFzBx+O6RlBOAWAmpX226gd5/q0a92v6xPG978pCMMEjgnm36vDQyNi1GHe?=
 =?us-ascii?Q?/QrxozHNwyq+mPWU4cknzPrFtT7VRDN5Cl6qTnhvhV+OU9Q3hwLqKdKxNEsW?=
 =?us-ascii?Q?8GD6xSfq/nid+aFsm4qrw63DBiyUXPL55fbnfAu1xELOAe7OH2IkdMTRhbMo?=
 =?us-ascii?Q?UpozHbVze2BEzSPr+kZuwYDx5m+ENeJzoq+RHQfakB1SwVcY2wl1skYTemKC?=
 =?us-ascii?Q?lIecgp86RI2GzxaZDgx+5JsQTQD+SAC6UHH5w8CsyTg6O9kqtokJZgqKsYGU?=
 =?us-ascii?Q?cG0YDAn9QuIrc2wNJPQZOErZ6kJsrik5sz29KWPwj8KpxhgHRUE3GLwoeW0z?=
 =?us-ascii?Q?Vgiy5J8OP7cMS3QtlA/yIVT1llux+ORkDtdfJU27rn9ops1VVwcYjhE0RQAN?=
 =?us-ascii?Q?ZF5GApzoLqbTfKbGBW7yKaQW08ACEI9ODooZSfQDRL3f7ByPFy+1X0Esf7bs?=
 =?us-ascii?Q?QeIjfUs0P6m5USzEh+SrRUAanors3cO/N2vAXxebQ9Yic9Yt7C5owLc0CDwW?=
 =?us-ascii?Q?EYaIQj/wJjRYswAMK3II1e6au7Njg33h6FiVrLkLIY/E+L92pNP+iYHNOBrR?=
 =?us-ascii?Q?cfC9wondSJcmJEteAu/lx7xIbxniN67+JH7isGI2nKFTWrAHJGNQCCyHbkK3?=
 =?us-ascii?Q?HLzjZbBeYmf4vfbYHozo6cNmjqffMEoXd5GysNsYcFq8vjU/v+xQJCUu6uBB?=
 =?us-ascii?Q?Y529wlhkvpZshcxXNi67Pq5+A3Avg/1oXI1pW2r1lUffuY8qybyc8ft+68Xs?=
 =?us-ascii?Q?8netyvZfoptJ3eZD9fe7WD8//Q6ioDVvd5zDziTny8pmSsBn2M99gEWty6jR?=
 =?us-ascii?Q?GdhoEDpUuprH38Y7sxr6VcglPMEL8PrVUrX45+VoIeLOPSogtkM6FJY3qXoq?=
 =?us-ascii?Q?AjkbScz7k0KE88g7xYgplX86yduODwxch/DBbm4Yt/iUJmhlvVmvRXX8KOGv?=
 =?us-ascii?Q?AcwqQhM53ZKkOqGLiDDwYh/DlyCTGB3VpVmfUpr/Yi1xSKNu3Zk5Rc+1tWiH?=
 =?us-ascii?Q?uRtyIKDwHZOucm3wLPCn9rlE3j9KuFUVfKfb8IPwFS6wdfHfYzMT7u+jEAgv?=
 =?us-ascii?Q?96kPHLAUiyU9cxnSW7/ii/nDb0GNZLBI+ENY8YCaM9GhhI+0OxdmMikHFcsR?=
 =?us-ascii?Q?ZzqWaYblrmq0UMiaFP3hvJ99BGMIAKX6I2HTKylig61fbDQmhbhDLp3RHVG5?=
 =?us-ascii?Q?eD6g/hSIF/PYvQCkz1lTvfpEEBwC8yaeJ4HDa97LEX/HuPVjTmmHE1NoEGBb?=
 =?us-ascii?Q?YK9m98D+VM4wUjEJVIodOJcQaaqcm7itBuOn89jUUmrLy7z0MAxJ11d3zJiY?=
 =?us-ascii?Q?JiD48g6Bl9ACIzB0CjLz12lWyp3yZTDBU+jZja0u9z5swdgLAVkw6/aMPgvz?=
 =?us-ascii?Q?CBdBixfXijW3Hb+ViMt/5qsEJF20V9VXYQC1SAs1iUUji3BIUKZrntvlr0Ay?=
 =?us-ascii?Q?c3HEyi4PemlbUmSkRdCYgmhoPqbMEmxdB8cjZ2ID5lIHssMXh9ICx15iMhHe?=
 =?us-ascii?Q?DdcwnbjJoA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44aaf1b-bc92-4542-212e-08da4dd2f355
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 06:56:04.6947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8fyFPjOTuBQbac50SSExS9JxJX1URZjSeFrDGhtAgEhIrpujKFok2fg6j6TS7e/sCFT8aW5BXB5WnRCwmtZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
X-OriginatorOrg: intel.com
Cc: Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Robin Murphy <robin.murphy@arm.com>
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
> Sent: Tuesday, June 14, 2022 10:52 AM
> 
> The iommu->lock is used to protect changes in root/context/pasid tables
> and domain ID allocation. There's no use case to change these resources
> in any interrupt context. Hence there's no need to disable interrupts
> when helding the spinlock.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

with this as one-place to changing irqsave for all previous patches:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
