Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEE539AF4
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 03:50:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD8C74015F;
	Wed,  1 Jun 2022 01:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNOxAMKpSK8S; Wed,  1 Jun 2022 01:50:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B6AF840503;
	Wed,  1 Jun 2022 01:50:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96253C0081;
	Wed,  1 Jun 2022 01:50:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C16C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 01:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3E54173B
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 01:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBfzLZaew35V for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 01:50:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6D6D41738
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654048237; x=1685584237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+St/H0vKOBvOa4Ja1r8WJEtgAhk8M1VZibX2bBfCOcA=;
 b=D1og8UwClfzGjrc3ecQSmO+OtrsprxLhlEMHEnfq+Zj/I82fPgVaYORh
 3AewinSHy8oa3BJhk18piBOmN0wzWWVV80WK+7ieg1e/sB03UYVgcyKHo
 ijUqh61sp+z6nQAbuVfMPiZOqWVURMDgwQuF66XmEO1wxjai8PTIDTrCZ
 PeREROvfeq46UO8PYuCp9Okc32rMny4PTORhDii77j2bybLQ7L9foeWEv
 aok+xC7ayBvOSES+8/8pseML/2nlmh1P3SE0LNLtjlViALZ/L+wttKGkZ
 DYoKKeyDgM7UJBdpG2VJA/NkObisOC4lXh02q7W0hEWevXhxB3WA5/Xxq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263077398"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263077398"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 18:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="706842608"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 31 May 2022 18:50:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 18:50:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 18:50:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 31 May 2022 18:50:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 31 May 2022 18:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX1xGSdcN+eBTrg7T14rw5rSMtayzvIehO4xMH4yTG8xoH85gOiTXwZOnXIKCruggX2UIjVdWlqiwqiA80zB7u2N2F48oyl3qjHeJ4Zlmh+3eq/Ag+H6V+W/SwEBkjgsqJf0mgmF2XRdxwVwfM1uYcgLoVPdjQLFe8w9P8D4KE1MRtsepvJBOEdZHRF2Z7APoeoHccY3NDNYVvfUFcLviZYkK5tWykPu9RntfZJOgR2vkQOPGah4QRK2tHDrovdlkyK+BRFYBrHUdnd95fVxogOkJ2rkfOVZ98XYdjuzcqlyfpSkWL6HAjKqLo6r3/ts/js37CsEwhOKuFU718bmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+St/H0vKOBvOa4Ja1r8WJEtgAhk8M1VZibX2bBfCOcA=;
 b=EAsG25EBQoHqBOD3sAwhpGpQU7mIKKq858T7bU/n5xNDSJ3hPkVx7JyPfNKOHQo8ASdEQ9pL45/pLD70z/miInQMPoPtuzsIk4rLQcvJi6bOQl2fyOKD8T/+E9tUCcphkbiexNNenkeFlx+ujnPNkNyhX18pGfOa3EVTxeO2AklWsR1XMFHoc3DIAucBgs9Y2oFnQSAY3KSJcDnjUILkRkNKCYCzxA+cqpduShK+ax+xHIfuUXqxUQKUqNyTh0NKXvVQZHHjUF38NNTOKVeJSOTK24qq4piyWVSxkgyZxiiPd0uFEuqyEV3mpSQ8v4/P4YXzYWvFCkdctxuewuR2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL0PR11MB3508.namprd11.prod.outlook.com (2603:10b6:208:73::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 01:50:33 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 01:50:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v4 1/6] iommu: Add a per domain PASID for DMA API
Thread-Topic: [PATCH v4 1/6] iommu: Add a per domain PASID for DMA API
Thread-Index: AQHYauOU3vbab87feU2/ab0rn4lTF60uFLMAgAAYR4CACT0vgIABWQJggAA/qgCAAE95gIAAGs0AgAAbfgCAAFOycA==
Date: Wed, 1 Jun 2022 01:50:33 +0000
Message-ID: <BN9PR11MB5276D8B0B6D51EA32A9CA50B8CDF9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220518182120.1136715-1-jacob.jun.pan@linux.intel.com>
 <20220518182120.1136715-2-jacob.jun.pan@linux.intel.com>
 <20220524135034.GU1343366@nvidia.com>	<20220524081727.19c2dd6d@jacob-builder>
 <20220530122247.GY1343366@nvidia.com>
 <BN9PR11MB52768105FC4FB959298F8A188CDC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <628aa885-dd12-8bcd-bfc6-446345bf69ed@linux.intel.com>
 <20220531102955.6618b540@jacob-builder>	<20220531190550.GK1343366@nvidia.com>
 <20220531134414.37a62c88@jacob-builder>
In-Reply-To: <20220531134414.37a62c88@jacob-builder>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d04dad-0024-4984-8853-08da43711db4
x-ms-traffictypediagnostic: BL0PR11MB3508:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB3508AF6CB5056DEA36B550298CDF9@BL0PR11MB3508.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z8SGAkKQdSlQ2IdzHFhVdkyiobWlaP0VXLr2Gn+kiQPtUt4Aj+LmdUHFT/eOJAY1YjzT52/1S9/7nlOUtIiiVIpIh1CvlOEBHiGnxMc5895D02FJ4uOp3A8DY2LRYfBP8vvKP5ZabgXrOB+p+PQpxG8xTwtZpvnzhj/7Ei9hNQTFExK5T6B/GoiA74UvkaXLz1slxUN53jquPRETHa10Esvwi9tSlSRL/m517fSb9UibNprd+4DC0Lm4o9xUv5NuryhHRQFbxyuJR79MnXxJN1KuKKmcbbEPFvQgDU4xOEPf91JtnDEqMCbQ4NrBfIbIHsvk7CoFsYvbJ3E9Al6rzLAN15iSzvclsUvDhLUy2xFprpiiRQvRBArajr08+LJIk0z+mvB5p4yNYce7Ak3VgViwraFdfZeNHW6ZrfQSFkDrbX7NfNajwTcaYTK/L4AR5Mg9/kqyRSrFrZSnfgyu/mUgP/LaW7DykM2AOeOOvJSgEyybkVZiqu/BQJYcxXd2FF5PDRg0+QzkYFtXSJjDlf/2Ew++DPxtyFb0717GZgmFZ5xn3YQCvSc50mPOzHtGgBSspuQMWhtU1tcmS//7W/9aJiOtfYuHvIoNA0dIRnqoJZqhOED86sy5DlIQ0PZJt8BD9iJAvEycN//vRc46s39QO0TRUceoL87YoUff6CUVOeVQZXEBtlOhDormEZ8Jb63mIcaEFouqJwAukTEx4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52536014)(7416002)(5660300002)(2906002)(38100700002)(186003)(8936002)(122000001)(316002)(9686003)(38070700005)(7696005)(6506007)(26005)(71200400001)(54906003)(4326008)(64756008)(76116006)(8676002)(66946007)(66446008)(66476007)(110136005)(66556008)(55016003)(33656002)(86362001)(508600001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I/fRtgXzBe2RAtN1vxwZUmZnXcK/+8Vnw4oaA30fPvHxEcyBJqiAfeaEVbuk?=
 =?us-ascii?Q?jeJL9IS0a2Nvu2JRNWA+EA6zW5+3qFZyctnXSIvvFw/iVq/6z9GzV47Dc3pL?=
 =?us-ascii?Q?nt3AcuJLty1ZZTTwwtTYvYqsN3w0Vo80vPSi8zsdpIiDRBKYSTkz30vVzCUO?=
 =?us-ascii?Q?3C/PH1bF+D4Hk2alF04U5F3iiacbXAMU6TW1yLAcNuMtpiSnjG4Nd8nZ3SO4?=
 =?us-ascii?Q?8kl92C+mUOe+PnQmtfkA+OnS1T5mveUjmFRYdr9xi8H9CLIhSE1pLpxmxcQ1?=
 =?us-ascii?Q?9t3p4pyGShrQLwD08ZOlw0rvhiIDQ9Oj96DxwOCJu7kUSsP8OGRMvBXGvIql?=
 =?us-ascii?Q?MQWuT0HjOgbxoYOMBzKu++bO/G7A1gkmKrnbYJbh+FIIGIGOo3/Fs93JDMEB?=
 =?us-ascii?Q?1HjljSXcWikKY/eDzR/oioSRTKC1N81r81ndUZNtdsi7ZFkrRfOFxxgHq7/B?=
 =?us-ascii?Q?wcHOIGjTUDLW5qX89H+x7qrIrLLYicsxoJsglZCydAjTThrxWxVGMSKHNyts?=
 =?us-ascii?Q?pLhJjm1I7m0oMZDoLEbZXzYSp/MwMruph3boZ72RhQXxoBliuWAbsw/Kcfnh?=
 =?us-ascii?Q?gNuKORcRabZc9CNsuNvrEpOu4FWvaD+krhZEP8GZ4DkcMWZzTXxUyJzKkGfq?=
 =?us-ascii?Q?2jotDWxbQ/jrWYxgyeyQRiGAeecwVj3qMKD8qmOik34q3MjOxKPepETxksKX?=
 =?us-ascii?Q?WEKA9X93GNodqmsVnZslg5lmLxaFCGC9aQfnpjXCUT88KaurhME1eHF7jUzE?=
 =?us-ascii?Q?3nBqzTHmuNFKPCzx2GWT6PrpklJNWoDTj6us0+5ElUXu53E/IrKAz+yiyL2o?=
 =?us-ascii?Q?tA81dayHcqXWYTdr5XWcU/vvNXf041vvhRD0xLoJa4lg3TT38P85tmDAcBc8?=
 =?us-ascii?Q?uvOq5khcyIE/5ruSu3W2Tb9bpFAvu2lhLzGoPGeS4mA8pNHPQN5W5sRWlk4G?=
 =?us-ascii?Q?OKNUBOweemOpEx8EcUsKknQ/0HlIATw8A+laMSICYJCYyXZkS4Qj9Eo6qE2o?=
 =?us-ascii?Q?ZGzptWiTjae/EaIxqcxCuM+hAHOSLor4FZX99GrKtzqY70ht7fd4IC53dV7F?=
 =?us-ascii?Q?y0yyj89MCPOXirAA7BqJGRMcr1/zQaXc/AAm4cDCsWp9fPXiyyi1MvKJTxnf?=
 =?us-ascii?Q?TgKCJFnyoDZqVPZMGgdv0e7PQ+04hDJL8e+6WCd3UGAEKjAHSoc+dcc7hV28?=
 =?us-ascii?Q?vga5qs8OvjP3fDg7zB6DDaoLzOwAnvGLJAU9fHJ1BfNgnefob+6jXGqBnw2a?=
 =?us-ascii?Q?JcfMjv22yB0eaZolu+MBxfspN5YoVB4daRrWF6gX3RXe0dpp+A/A5HjZs5GD?=
 =?us-ascii?Q?xvYb/VC070IJRJ8pjtcykCydyVCq0GwUrr0qqAEqNYcrVKCMUrxFJ3+VAAkJ?=
 =?us-ascii?Q?vdVBiMTRCMl4lgDXWxQkavqohMHgrUWyci6gGevp84J2B7OyvVo9TGu2aTjJ?=
 =?us-ascii?Q?GMMpu5WjBC9I5QKBGeJfmFi58DvJ+7yqRfhDwWmdLMij+l14znatr0ZhKOqn?=
 =?us-ascii?Q?1z14YvQRPC9NzPdf46I4mAVpjYDLZw4+u1eW0TOHgxHLvwYMei03n8LoFzyR?=
 =?us-ascii?Q?W/dzY+mQHPEauiikIC0f0+ptwzWkQDNlJHz0GZgW2+lAOekRtcGI76anJQjD?=
 =?us-ascii?Q?P5cMWcssK5BqeDSaHhjsvnlaxbvwkAjfEE0eK+cIbj8vRbhwBLigUs3B4K54?=
 =?us-ascii?Q?s1BcouaISglImBZr3MiLm7HsArx+NUzulhm7LAQsxvMVePyT9AtV/isgPhRJ?=
 =?us-ascii?Q?MaN9wxbuCg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d04dad-0024-4984-8853-08da43711db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 01:50:33.4613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDkwwuP1yV4s7cRkRp3BAA8/zDzuc1vd2K5BOctNCtDqRmt6ttUX6vTeksKIYKeXheP1KhccoxqmeFubtXtkTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3508
X-OriginatorOrg: intel.com
Cc: "vkoul@kernel.org" <vkoul@kernel.org>, "Jiang, Dave" <dave.jiang@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, "will@kernel.org" <will@kernel.org>,
 Jean-Philippe
 Brucker <jean-philippe@linaro.com>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
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

> From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Sent: Wednesday, June 1, 2022 4:44 AM
> 
> Hi Jason,
> 
> On Tue, 31 May 2022 16:05:50 -0300, Jason Gunthorpe <jgg@nvidia.com>
> wrote:
> 
> > On Tue, May 31, 2022 at 10:29:55AM -0700, Jacob Pan wrote:
> >
> > > The reason why I store PASID at IOMMU domain is for IOTLB flush within
> > > the domain. Device driver is not aware of domain level IOTLB flush. We
> > > also have iova_cookie for each domain which essentially is for
> > > RIDPASID.
> >
> > You need to make the PASID stuff work generically.
> >
> > The domain needs to hold a list of all the places it needs to flush
> > and that list needs to be maintained during attach/detach.
> >
> > A single PASID on the domain is obviously never going to work
> > generically.
> >
> I agree, I did it this way really meant to be part of iommu_domain's
> iommu_dma_cookie, not meant to be global. But for the lack of common
> storage between identity domain and dma domain, I put it here as global.
> 
> Then should we also extract RIDPASID to become part of the generic API?
> i.e. set pasid, flush IOTLB etc. Right? RIDPASID is not in group's
> pasid_array today.
> 

RIDPASID is just an alias to RID in the PASID table (similar to pasid#0
on other platforms). it's reserved and not exposed outside the 
intel-iommu driver. So I don't think it should be managed via the
generic iommu API. But probably you can generalize it with other
pasids within intel-iommu driver if doing so can simplify the logic
there.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
