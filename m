Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 99571471293
	for <lists.iommu@lfdr.de>; Sat, 11 Dec 2021 08:44:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489DC61C74;
	Sat, 11 Dec 2021 07:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4JFQ-nisONO; Sat, 11 Dec 2021 07:44:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4935F61C51;
	Sat, 11 Dec 2021 07:44:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1BF6C0039;
	Sat, 11 Dec 2021 07:44:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40945C0012
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 07:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169C64234A
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 07:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com header.b="WkmINJx6";
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.b="mFr6Jzym"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzGwl3CwqQHU for <iommu@lists.linux-foundation.org>;
 Sat, 11 Dec 2021 07:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FE6A4018B
 for <iommu@lists.linux-foundation.org>; Sat, 11 Dec 2021 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639208656; x=1670744656;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+U+M/t34gs4XiG9BzsE67FPme1KuHfpHtXvv77ZAu7s=;
 b=WkmINJx65JgckNCoqxHj+Fbtf1qphUGJcIXN60SEgZjflx4++WvAgKqW
 LNXYFrIFnGyy5FkQ5XdVTlpy0Si5kFLpqgA0+NeMi8KYZgY38TKrCdVi5
 rKhsSNXslSML6WtHS2mu2OXjtY7Rt0RuRoFGt7bmSXgaWBzv6PmulMK4U
 Ym0P1UtF2xRYNh9rvNn/RPsIidu0RGqwt5u1/CQGQX55TQAY/Bbhb+Qol
 sR0UCWwFKwZ0aKucY0hqcm1OFhl46P6ZAyOLtmXpxFHOXVtkyZ+3GORXW
 1O0rTFHKw9apfRcfpZeKav0Dt3f6YTYwp8p36Rtjngs9KIVsRNAiix6/t A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="236032382"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="236032382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 23:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="504254512"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 23:44:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 23:44:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 23:44:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 23:44:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 23:44:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfNhdZ8Nr85Re4AoeMgDY2TupG4X98K7az+anHnFyfzQVBetoyhCERzXPWfuIRpP1BL0Sb9Pfc1K8eEBwCftq5L/lsuab0OpZrKTNqfnahgeZOmOibFUBnJfXS9DUYKQpDc49MqP4gHhd856o2aI4eAoIYkw3/DeksXW9YJW08ORDIsQHiESCnuD/d69u8XSvMXOnQErzzXxvfwMv1IQ3jDSG3ucxofz8mKS3Y4vFGmhvwUR1oyHp8XXnKL4/zBM3F0jMUbsmnUg9TWoS8qBXU5ezUr3mKabOuIgiZLLRlEBBaXbehMSNCKzDQ0pJ5ZTxApsXtfCbEAQorOndjHozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRz0+4hlFdl4Wcdri0A6i6wAexwPsRVVdqscg0voZ7o=;
 b=Kcje5fL07PI/Y+PS6IhhSTLoMGsw+1S24MvZaD6D04mTLj6y6ZaRe7hZMuLh0uloBylhbw37p42EIR41tm6T2pzI1J1u94djjM1JjkgAKKH9Ts475IIMU6e4ugOpOzXbhXKut5/pf5lb/pIjADjANwEImxq6oHbR7IWhjE/ZMeFcDCEOy76eVqi5bkX/z21MGW6HrRQQMch0x1Hgdrr2Hakewb8oXMxTupKxJRrzVgKovH2jxr1OCoYFNNCRAH9oqYlQstTLvlQd5lI9piopHxJ1GMo9iPZLtz9F7CmDmoR9Z/jSQZKnHWb7DZ+b4p7jBJFRxwKlWXWg/7esxFl/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRz0+4hlFdl4Wcdri0A6i6wAexwPsRVVdqscg0voZ7o=;
 b=mFr6Jzymzq7FPNsCQ7OEP0FlDinRvVXByYn8EkaPGyJLCgwmYoileN/PNxyVUH6jAKidVyQe269gTgo3+u5dFwPSBT4Fjf3xDcaJF+niUgjRPD5jx26HphB4K87dHNoXj+PgA7vU5yT4Mb1LoPEk+oCgMvAhm3PUdTMORRJ1bYE=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5355.namprd11.prod.outlook.com (2603:10b6:408:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Sat, 11 Dec
 2021 07:44:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4755.016; Sat, 11 Dec 2021
 07:44:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Topic: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Index: AQHX4y1VNaiO68omHEet2J9DWrVARKwa1YEAgAAp0QCAABreAIAAIi2AgAE8MoCAAAd1gIAACyoAgAAPcQCAADDDAIAAp1uAgABn9QCAACTxgIAAAdGAgAAbd4CAAA94gIAABpSAgAt9SoCAADlJAIAAgb+AgABGMACAAAc8gIAAE+oAgAAmHACAAFJ4oIAAem8AgABqWwCAANPscA==
Date: Sat, 11 Dec 2021 07:44:08 +0000
Message-ID: <BN9PR11MB527625E8A9BB854F3C0D19AE8C729@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <f4cc305b-a329-6d27-9fca-b74ebc9fa0c1@intel.com>
 <878rx480fk.ffs@tglx>
 <BN9PR11MB52765F2EF8420C60FD5945D18C709@BN9PR11MB5276.namprd11.prod.outlook.com>
 <87sfv2yy19.ffs@tglx> <20211209162129.GS6385@nvidia.com>
 <878rwtzfh1.ffs@tglx> <20211209205835.GZ6385@nvidia.com>
 <8735n1zaz3.ffs@tglx> <87sfv1xq3b.ffs@tglx>
 <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20211210123938.GF6385@nvidia.com> <87fsr0xp31.ffs@tglx>
In-Reply-To: <87fsr0xp31.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d342c0f-91c8-497d-eb9d-08d9bc7a03d3
x-ms-traffictypediagnostic: BN9PR11MB5355:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB535539BFA5AD2307F2F3699C8C729@BN9PR11MB5355.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qSL1ts4TgTQGodemLLYCmn7LwTX0rQw0AjagUtK/B/dCTxFmIMwfWGDZHapgI3Dj9gaVfGoBuTnY5KHfitEOOG4Z1pwfuBoWjA5ddYSKrXcQb63Y2M0hLELMOECsvQ9P25UoUqdR8GnL0lT0YqRB0bHOaWeef+y3vjo0Ew/JIicnVgYP9StoVGVZiZMuSu7BpYwo0YfIWwEnnTbvFJBmzmLX1GuP5SSn9bsy8sXZm0wUCqZf4NbIR6dIz/O3rPXXGJC70kKzyiPZxzWDVG+IrAqb4FeN6Uk0ywAqYn60p1RCjefFkDTi/aimhkKteVBcUQyZdoo3NQ3eBcPiRmEE+x36OEmizNGCBs0pFMAV+fA6ndq65GpylB4TxQM1P81EedbHkOeR5s2Uy8TPUdZH+ESK3rZ2x7a0tV+GoGAv6jOnYtseLeniMfZEeHkHJIXEOlVrFY98pDvxu6+ZBwMPJM7bNgivkbgTTr3tWv5FiEl0xskx9xC9BSo/irpjN/cWiwVOWzrZ/YZXImJyl/1NCs+SQjfJwTnEV9FRJ3qE2PkbPx0J/XlqMzOmz5oKgHUXYA9OLM/2xzAUIqH8PM1fWlPHBIyVKfUlEXmMMSdUYIrQkFJzaEbjUgG9TeXOk1pSlFiMVasXZKmnXbcr/ESsgVvprGptB/3WOR6v5N0SBZayF9MBTiHXQ1t7hbh8XfMlTeTvHgzti91p3pQtsMjQZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4744005)(86362001)(2906002)(8936002)(5660300002)(55016003)(54906003)(82960400001)(316002)(110136005)(66446008)(7696005)(7416002)(26005)(64756008)(66556008)(83380400001)(9686003)(76116006)(4326008)(66946007)(71200400001)(508600001)(66476007)(6506007)(8676002)(122000001)(33656002)(38100700002)(186003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PslPlkTQDjU02BGCe/Eq0aMCXKc0S9/DhHx72OkBFzdkkGmaplHUUmlRfJVe?=
 =?us-ascii?Q?A4rk6YfsR6WD+O/rLAAlU7ksHOpLzGSxmvVp7vQgJeWTPyBbwm9Zr2GcjzKe?=
 =?us-ascii?Q?fMhIncYpeyxHca6K35UzX3SFQfgJpXdVeCxw+2ZvPHjXe/1lkhSheP/8qmae?=
 =?us-ascii?Q?jHPkW6+qAQjWO09BsyKMar2yglqvqb4L19cBpztszFOQ526prlFoJ0ejkChB?=
 =?us-ascii?Q?sJeAJ/UT4akLJjU4DRI5Q9BoXgiAXqYf6u/3brrZrQ2KApliAh3SMIEpxm6F?=
 =?us-ascii?Q?76mc5gedVaygayqIVkzMgBoZ25qPMalVn+xnREfD34ipny9TsmHmcb0pK4Kx?=
 =?us-ascii?Q?WIdU7oE1IaS0G3NPQ482fIw7g/NF9KBe6nNzWRe3Bh+JNanhQG+ktmjuXRFr?=
 =?us-ascii?Q?OLzdXBCyWMF7HSS7KhM/YOo3DjpGbyLIRgcPjtj4ceXzfS06tJWp8fOvsgyJ?=
 =?us-ascii?Q?AJbpj2ZwBnfMF3x96jEVddYhGZLAYPQF9v03JcA4XpS6QexdaC2aRJ+SGa0D?=
 =?us-ascii?Q?9Bugk2qH7PCIcF6PjxUfieBIx8eJudLvk54FDiCcs7j+tgxMmsrKu1X6JnlS?=
 =?us-ascii?Q?7alXwRXAC2DrzRdsniCVBiCG5toKNeABFEgTtOs44IL5jShflP2K0XacmLr7?=
 =?us-ascii?Q?OxSXrV/yf1KOLbSlYqWaWUP00MB02YR9dZvzao4z7OIeXuDZnzfWIIAsNQGE?=
 =?us-ascii?Q?IYFK4l67387UlwBDB9yExsNnPSvSJSoiVgh++4kMFaPtYIDbnQbJIS8PpBo7?=
 =?us-ascii?Q?aiJiwBTQM68qQJGIxOheswVtRpjV0QD0UIeENisevP5O8MyJT9UH5il4BI6x?=
 =?us-ascii?Q?cnygsNRNqjD7FA0T4gXxMaYyUnN/Hsoxpqm0CWHCFlO8oirHvnOimSg9DD2E?=
 =?us-ascii?Q?Hid18qsKolU6EPBvBIQhQ/RO9kqzzmg6UNnjJHEcPuRclSj4VLeg9uLnOcu0?=
 =?us-ascii?Q?sUT0VuwG3BrxQglmIRwieVmUeudDTY6SpzfyhlDtuh1pPFV/alnVVTMcjN1j?=
 =?us-ascii?Q?Y/iaxzwVgOtPiWFSNDThdohhDsiIX8ZJlX6bXSlnKA7nDJtIRXs34vN5TNIX?=
 =?us-ascii?Q?1hn99n5cuTGzXTcu25CNeOjqii9gtrDFQrm96W910dhJfxYyHPs3xwAFeNrX?=
 =?us-ascii?Q?z5lLvz1w7ymSS2R2XqsAISC+htX0ivvMewQIzZrtLeYDXbpgmEc4DUV0/3my?=
 =?us-ascii?Q?bWbvVIxqSMXWnDEf0MBFcb7yPJW+UhGbcPGQHHfqXk0ULAz+VNlxKy9ZsuO4?=
 =?us-ascii?Q?N73V9Tq9JpI0aR3Vk6FkSlNP8GXvMW8Cv16lobov/sQuPrRpFs4HtB4qZdET?=
 =?us-ascii?Q?rce+lLIxVeijOELbSQP1SCQ1lmskl+OTX/hWWHqMzKhOMKOdarb2iTF7g0Z6?=
 =?us-ascii?Q?guD/6763Bc1A63I0pB09BovTshqUL6utkqV3dX3HqNaP1ESr++vTVDbh/j8o?=
 =?us-ascii?Q?p97x9V9nMDYAnT3FS0e0QBX9PH2LJedfcH6VSA7YUrdlLgs3DQ0XoBQlgSOI?=
 =?us-ascii?Q?cgaeWlgx/yZA81zJeCeGD98dbWp3Nahd3th0KP3foDac2tDT1j4xFhOIVU1j?=
 =?us-ascii?Q?hG/nJSwV1kquV4T3Y779s3ci0b20FidPfkW6IEXoW8sd9WjljYLwcbCBZkT3?=
 =?us-ascii?Q?Jw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d342c0f-91c8-497d-eb9d-08d9bc7a03d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2021 07:44:08.4284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBVRhi4LfD/tQW8kiAxsEiyO4iK8narL/YKH0zkxNSVxodHoN+vbToDR0NxUqsP0hdeYfnB5mQxljrkPeAM22A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5355
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
> Sent: Saturday, December 11, 2021 3:00 AM
> 
> Jason,
> 
> On Fri, Dec 10 2021 at 08:39, Jason Gunthorpe wrote:
> 
> > On Fri, Dec 10, 2021 at 07:29:01AM +0000, Tian, Kevin wrote:
> >> >   5) It's not possible for the kernel to reliably detect whether it is
> >> >      running on bare metal or not. Yes we talked about heuristics, but
> >> >      that's something I really want to avoid.
> >>
> >> How would the hypercall mechanism avoid such heuristics?
> >
> > It is clever, we don't have an vIOMMU that supplies vIR today, so by
> > definition all guests are excluded and only bare metal works.
> 
> Dammit. Now you spilled the beans. :)
> 

Unfortunately we do have that today. Qemu supports IR for
both AMD and Intel vIOMMU.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
