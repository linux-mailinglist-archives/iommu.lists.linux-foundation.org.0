Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B198A4712B7
	for <lists.iommu@lfdr.de>; Sat, 11 Dec 2021 09:06:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F0E61CC9;
	Sat, 11 Dec 2021 08:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn145v154Nuq; Sat, 11 Dec 2021 08:06:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 082F561CC2;
	Sat, 11 Dec 2021 08:06:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F6E9C0039;
	Sat, 11 Dec 2021 08:06:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C489EC0012
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 08:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6AA61CC2
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 08:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P37iymIMl1Av for <iommu@lists.linux-foundation.org>;
 Sat, 11 Dec 2021 08:06:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0E0761C9A
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639210002; x=1670746002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MutaXoDyrnuDG9K3qm4nrCQ5Zpz/ufOIDif4a1FBlz4=;
 b=jQAe6/GF7nm5n+0pl6MsRv7PAS+jEvc1taoy3YpWkdMcOh37GxMYQ9ZF
 J/hYuKV63RKnkzO9FBssXzTGU9c2PEGiMKRltZ+tgVRi/a4qzwaFZS7O3
 fe9W6sgpo1AUx+SBlZMA5CNDjei2eRqwBxIe1amwXSyWR/qCMU5pYTJSM
 wzjo7r7B40KCkYiwpWW73NTJdOSWswec/12ZMyYmjn1XDGWL5JNbnT0ft
 fNN3c+9ply132Pue1LTpDqKthU7N/pHg0wLcInmW+VMB3rFzVylB/ibbw
 /CGA/cHtfNVwNKZacCbHOVTIGVsS3rfJEJz6rfX2oa4ROc1DQsdHC9hKS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="225380720"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="225380720"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 00:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517080608"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 11 Dec 2021 00:06:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 00:06:39 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 00:06:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 11 Dec 2021 00:06:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 11 Dec 2021 00:06:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7mzjHQKuWhOl0yyKwFoKguL3QQ/xmHqSksGSXxFUWkjJudQ7TQ0R4FycKw7RrjTDiAjDHTznIrZh0o2W6cIIhcbPnphuIpTm3xFrBOWqWtGvxbNxJMOKky/a9/3qg6laqIEiuyYiJBB1SaworAn+g4LdWfYiOYYSRrKC+YWBzJ0b+96BowJfZ3P3ddBQBsd6Us2b4V039dWDt1OsFiU0nF6BdazOo/acgKg10lqfga7wXqvx8dsCe/XggyfIIl5yhH771QTkhAt0WkMr3q3NUPMy+9TmWlBwu3s/8zm674JlOsWMlKtahqef3TQO0DmmBBhxO4/z2DOqZlN4BA9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaQYUrgmkGontwUl3LTo0owEPnGKWHqfRW6shL03ms8=;
 b=ZG/keCEnKqWrdgGWJj2kmUetf5T5/dxmB3akq6B3XFBcK8jdXky8mV4nBryc5icqGIcRuspkLbH7vDtj7xAfWTnjRaP8pcmI/5IbM6tMDNh4fHqc9YmQQC8Ahg/QH0Uyxsc1CC6vEjqwkas4pUDyEJSgLh9PBENjw5v1Zt0zL3oDLRp1wbKbWtMyiNWvuDqy8mrrSjf1koSi1Y2zi7t4s/KsdsMoA+qXFwkdMDbB+Aygq0PUdgno36qE91Wv2RM6CJODQIjDf8/ST2XCW6Faqg4mBF8Fpa9eG2HRnBnnSnzaObkJ9xdZbGkZypNa+KkaBIXnlZ9bGaK+rGBpoiyO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaQYUrgmkGontwUl3LTo0owEPnGKWHqfRW6shL03ms8=;
 b=IC+cqKfvqzkKO4iuHXn5nL+w4nsMsALYhKZAxKHaQL5jI1CDmuZKX02Ffu68x5Ey1406T302j0XUCMSVuXcR2HyI9RWPE2n3GGxeTlZiaR/HrQvjHQBo5KH5Gmxvu3865wYnOMBpaZcVzvxKQemqfbFFI0zu7d6bDKsX0LtsfSQ=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN8PR11MB3572.namprd11.prod.outlook.com (2603:10b6:408:82::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Sat, 11 Dec
 2021 08:06:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4755.016; Sat, 11 Dec 2021
 08:06:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Topic: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Index: AQHX4y1VNaiO68omHEet2J9DWrVARKwa1YEAgAAp0QCAABreAIAAIi2AgAE8MoCAAAd1gIAACyoAgAAPcQCAADDDAIAAp1uAgABn9QCAACTxgIAAAdGAgAAbd4CAAA94gIAABpSAgAt9SoCAADlJAIAAgb+AgABGMACAAAc8gIAAE+oAgAAmHACAAFJ4oIAAcxMAgAFJwrA=
Date: Sat, 11 Dec 2021 08:06:36 +0000
Message-ID: <BN9PR11MB5276AD88A1D1A1AA313E228C8C729@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <8c2262ba-173e-0007-bc4c-94ec54b2847d@intel.com>
 <87pmqg88xq.ffs@tglx> <df00b87e-00dc-d998-8b64-46b16dba46eb@intel.com>
 <87k0go8432.ffs@tglx> <f4cc305b-a329-6d27-9fca-b74ebc9fa0c1@intel.com>
 <878rx480fk.ffs@tglx>
 <BN9PR11MB52765F2EF8420C60FD5945D18C709@BN9PR11MB5276.namprd11.prod.outlook.com>
 <87sfv2yy19.ffs@tglx> <20211209162129.GS6385@nvidia.com>
 <878rwtzfh1.ffs@tglx> <20211209205835.GZ6385@nvidia.com>
 <8735n1zaz3.ffs@tglx> <87sfv1xq3b.ffs@tglx>
 <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
 <87lf0sy7xd.ffs@tglx>
In-Reply-To: <87lf0sy7xd.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b953aac0-9cde-4f96-d012-08d9bc7d276d
x-ms-traffictypediagnostic: BN8PR11MB3572:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB35726B5F88FB0364CC455F5B8C729@BN8PR11MB3572.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Sv0dth5+iq7R2NEox1Mpg8LUkrt+8Jo7aRRR60lJ5hOwuXt7WZ52uO/dvg9OS6cr8v+WtQ5h0Y4hvXV27+TPbdofYVL2danKva/11y+iwe9tb00osR4Qs/SOPQ+8mC9Nhm8L8lhW/7IU6OX8m128rMcN6C8VdGbb6gZh7lsIO9Wh5oXFh5Zhq9xaAP05qy0Dgkd5Q2bE+qrCPF/B7QnUwrttSngLrZHx2voi0OV3L/xFo30ynJhHXsfrB0nSEeI2Z/E8JXOgh8igshC+ZNuR38Iem/KqHzYBT/h21HUAaeGBtw//KV3n1ZM9/2y+cQ0toeKIpFAlHFCFaO4pIEKFVSKhljmUzRRlOSLPXDooLGwxi1G2zbfxaT56dmnZ9Rz1jPqpXB3Ip/6oc6hsWCohSvoBBFfFX2T6SBxsYg91XcwIaokeXP9XDrrMrFU9eE8pHLaSzSw6BMUP9zfznvk0ZP3M0HnrbAhyS+07NgINOUeBTUBTGal0q5yKDJE9hJ/hpkOpTqIS6NScQfnzhElNY6NFW37qClAinB1yfbzlSzBR/ULOJADbXQQJTjQEtu2qbhJWl6LlDGZQJzK5Y3/ovZBu1J58U+g8XycrSmjKjfSBoPCaLrtoEcaopfaU2WbXWGS0MMBfkGtBenmaTL1IcyA4UX3BLz+bSQzyI/emQ/gmldzvXIweDN0bR5Q4qApz2619yQGGZqYHDbCuWTjPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(71200400001)(9686003)(86362001)(52536014)(66556008)(66476007)(64756008)(66446008)(66946007)(76116006)(83380400001)(26005)(82960400001)(7696005)(6506007)(55016003)(38100700002)(508600001)(122000001)(54906003)(38070700005)(7416002)(110136005)(316002)(8676002)(33656002)(4326008)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TsgFBzavXdHiXThggHYvSi/xt+Ng+1jTWFoJQx6uaqQKakuwGDQ567cacjau?=
 =?us-ascii?Q?texhdPW92aWD68jliOwTD3iZGtWsZEXVnSsT2i752vIvEmXn5NsRq9Mym+Mk?=
 =?us-ascii?Q?8ENLN0vKL8A+FO+kDS9ZHjygwWuycV1pYtrp+35XnnweJ7X9zKeLotC6fzM4?=
 =?us-ascii?Q?eXT4jP8DZXMRJ/ztYDsfQI014wFjfKxKbwSBbM7yY0l2SxMI1GkBy9W9Gvlw?=
 =?us-ascii?Q?SDGI6lIf+f3RVl5ar+Q0no+tQZIN7PQO3VfA12aphKmu22ysRWcdWCiXRDqF?=
 =?us-ascii?Q?p1FFp9EdyD8w39es+9fOW+rdl/CBLIb2uBjsSgY8ONVPvL3HrvACgHEJHFoe?=
 =?us-ascii?Q?9APDLpN0LYSR94MXwhFDUlt3lFG3eVmXDiQMNtuoHIMySe5GWnpkor/nF50s?=
 =?us-ascii?Q?w7IvL2iuxTyF8nx3CV3xBuwzQzjyULO9/lugkZYC42eIDxzWu6mZdRJTNgPy?=
 =?us-ascii?Q?wgH6D5CdKa69K6qH/c6NJ+pNE+FPljAWEFJBX9OIfYiGpPh2kxKOvE0QPw9Y?=
 =?us-ascii?Q?19LdzimIG8JswZrj1KjXd9E/XRclNSiRhNaQhxbuoddaB1k6fx9TgIaMNZ7m?=
 =?us-ascii?Q?XU0g8xGwL0kt5aIeUiPFMaWZ7+1qmMTZdUy4tWEQr0AJQnoa2ywCMaxkLohf?=
 =?us-ascii?Q?V4MlL00VCUeFfbWwAIjxianMzt9+c486FtrFecgdhnhez4c8xthcbea0UUEf?=
 =?us-ascii?Q?lKpu9zNcBXh9Z7xd81TI3dowybdVXaRrAo0tT9RroS66nASTV4LcEnNX5KP7?=
 =?us-ascii?Q?XvRUas3cWm4UhYJ6PgEUckA/mjnylYGuQRMY9LeanFzPKx6KZf/VOagLfwVa?=
 =?us-ascii?Q?Mmx9rV1qznI9hspKc9yVdLqiXMPM9zMPzor6ogj/XfPjDEAiQJNDOkenqzQl?=
 =?us-ascii?Q?N0QerGBNIF/C8tl8lzAl1HMG03yp6hnW4LJpDM+sZYXJLgD3aP54oYKrTy7d?=
 =?us-ascii?Q?YG+TsiygdOXnIVyO2oHAw1kqhiQuWSUf6m0MskLl8LVcoPNDOU1BMyZkJG8c?=
 =?us-ascii?Q?NdqB+w3HWumrDf1K76rctPL4+5IeYlj5nCi6RCt+4KEIJURRA8RmFf+DlcEh?=
 =?us-ascii?Q?SpC/fsUdH0R0IgwlDW4+P+wcvzPtXH6nYMvR/DqTqisz2DFOFZl30GkPopli?=
 =?us-ascii?Q?LtRgYCgz9jCUn+sHYhd9G535ehy0oLS6LJpCQnP9DgdJ4yh61gla3pqFbS/s?=
 =?us-ascii?Q?2UyWfcICoJc5zhcIVUSZhbc1SW74EkJgb61GWWk0oi7r2aiEW5Jf7tCn0FUM?=
 =?us-ascii?Q?nekBps9ieHsrlWT3au0QOlCzh8CNGI52F/PjhoQdeV/8UOHvBVjA831EYUXY?=
 =?us-ascii?Q?w+ptO/3RHvBZivegtvECF/CugBVGv5GXDcG+4j9+RKZuM9sJZxh3DgDwAE7F?=
 =?us-ascii?Q?52F7umerPGptF2c3TvgGx+o0/0QIliqZUEso87Is65f0oXxPfUPUTlFT8YPc?=
 =?us-ascii?Q?+kMKcqsgyWHXzS5tvu4j2D5ktNfWWyPP5yJF5tvkTC4iV1efPy1tU88koGPI?=
 =?us-ascii?Q?z3D2JyNkySXpnBnLuU8t6A6OpRXNpTgdw4remPAeYG0vLBUuWT+Gl9+eLCr1?=
 =?us-ascii?Q?9cZL/zIQbPLsAGbrN8hc9hqEQttTdnBqpxEJIAUJqU95Yfx+7fxXMDOmBN8l?=
 =?us-ascii?Q?Qg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b953aac0-9cde-4f96-d012-08d9bc7d276d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2021 08:06:36.4692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ghq/f9EJPdoLe2ekr4h9pOtrW3oDDEK+WqdPDQCC8tWD4nPRZScmflVOX/hPLQxB1fU509Fzut5blRkqdz4O/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3572
X-OriginatorOrg: intel.com
Cc: Allen Hubbe <allenbh@gmail.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zygnier <maz@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Logan Gunthorpe <logang@deltatee.com>, "Dey, Megha" <megha.dey@intel.com>
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

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Friday, December 10, 2021 8:13 PM
> 
> >>   5) It's not possible for the kernel to reliably detect whether it is
> >>      running on bare metal or not. Yes we talked about heuristics, but
> >>      that's something I really want to avoid.
> >
> > How would the hypercall mechanism avoid such heuristics?
> 
> The availability of IR remapping where the irqdomain which is provided
> by the remapping unit signals that it supports this new scheme:
> 
>                     |--IO/APIC
>                     |--MSI
>      vector -- IR --|--MSI-X
>                     |--IMS
> 
> while the current scheme is:
> 
>                     |--IO/APIC
>      vector -- IR --|--PCI/MSI[-X]
> 
> or
> 
>                     |--IO/APIC
>      vector --------|--PCI/MSI[-X]
> 
> So in the new scheme the IR domain will advertise new features which are
> not available on older kernels. The availability of these new features
> is the indicator for the interrupt subsystem and subsequently for PCI
> whether IMS is supported or not.
> 
> Bootup either finds an IR unit or not. In the bare metal case that's the
> usual hardware/firmware detection. In the guest case it's the
> availability of vIR including the required hypercall protocol.

Given we have vIR already, there are three scenarios:

1) Bare metal: IR (no hypercall, for sure)
2) VM: vIR (no hypercall, today)
3) VM: vIR (hypercall, tomorrow)

IMS should be allowed only for 1) and 3).

But how to differentiate 2) from 1) if no guest heuristics?

btw I checked Qemu history to find vIR was introduced in 2016:

commit 1121e0afdcfa0cd40e36bd3acff56a3fac4f70fd
Author: Peter Xu <peterx@redhat.com>
Date:   Thu Jul 14 13:56:13 2016 +0800

    x86-iommu: introduce "intremap" property

    Adding one property for intel-iommu devices to specify whether we should
    support interrupt remapping. By default, IR is disabled. To enable it,
    we should use (take Intel IOMMU as example):

      -device intel_iommu,intremap=on

    This property can be shared by Intel and future AMD IOMMUs.

    Signed-off-by: Peter Xu <peterx@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

> 
> > Then Qemu needs to find out the GSI number for the vIRTE handle.
> > Again Qemu doesn't have such information since it doesn't know
> > which MSI[-X] entry points to this handle due to no trap.
> >
> > This implies that we may also need carry device ID, #msi entry, etc.
> > in the hypercall, so Qemu can associate the virtual routing info
> > to the right [irqfd, gsi].
> >
> > In your model the hypercall is raised by IR domain. Do you see
> > any problem of finding those information within IR domain?
> 
> IR has the following information available:
> 
>    Interrupt type
>     - MSI:   Device, index and number of vectors
>     - MSI-X: Device, index
>     - IMS:   Device, index
> 
>   Target APIC/vector pair
> 
> IMS: The index depends on the storage type:
> 
>      For storage in device memory, e.g. IDXD, it's the array index.
> 
>      For storage in system memory, the index is a software artifact.
> 
> Does that answer your question?
> 

Yes.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
