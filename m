Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78246FB49
	for <lists.iommu@lfdr.de>; Fri, 10 Dec 2021 08:29:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C381161399;
	Fri, 10 Dec 2021 07:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzKo_8d1z2rz; Fri, 10 Dec 2021 07:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 87CE261397;
	Fri, 10 Dec 2021 07:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E71BDC0039;
	Fri, 10 Dec 2021 07:29:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BD06C0012
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 07:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E444A401D5
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 07:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com header.b="NLJWk5uW";
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.b="DBiQGY8N"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GWnGWhue9Wb for <iommu@lists.linux-foundation.org>;
 Fri, 10 Dec 2021 07:29:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 815CE40190
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639121346; x=1670657346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0g4UFSZu+F1AdGcSGLaDjoe631tmNrx+bVeI5RrOqw4=;
 b=NLJWk5uWQ/isNvs1naLSa1COiDyeAkzvoJcDHX4N7Xbk5Mrnqox55ecR
 uDngjK567E3Xy6btk4VACGo25bROg0ACxBd4wkgiTDxgRflqYXJEv9FYe
 GGH0x3fGMDH5bOL6jGyg7caS/tsKXbFiGrCyM7BQKRO/z30eqRJreIgZ3
 neM2r9ymwhLaNONcUKU+9PGEoQiaJKQwPCE0Sa44VatDwq/G0CcuEGPxl
 FdOINunyrO6JjTvDfYf8RT81sFeGYnsaEbSs6gii3+PIb2EZ/GvRQy/eK
 3h6kr0KEh3eoTTphEvt5u1YfhssFlRBEd8xEWnGuDMltVa+eL++/lryBe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225163302"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="225163302"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 23:29:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="503828825"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 09 Dec 2021 23:29:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 23:29:04 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 23:29:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 23:29:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 23:29:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gckaPVBlv45Kh9SEYN2anHfV2kGmWySa58dT5BSdmPjThsnZv/xJJZnmaUhZ2uzrPAAsw5dMjaRxpX3tcRFZoyQhfnbIMb8ZMpKiZW2gC0j9O5JdTLkVhKgbAIqmxqeDDIT5thiiuLYVNOBha9+ueEqjsz34f2+XBFbffSh/dFN2O+2ptz0pN7LcGMOT8M8NJuz3BqZYToXF6N37q1O3pwOzJTclcn0UMehKxxb4RMyf1Z8szOWlNO65Szf98DoXJjIpEw3To81NE5GV26d0h1fwNsMYEA2cFaGOtn6ypULsQLEvS21/WfXPgNtiqW9hLKBrO3NztrJnL4imWNT1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZz6ReOUMIdtowR5X+JPAtVTUL4ZDJIxHx7N6iOt7zI=;
 b=Gwwx/p4Q3WZVCrmDMCPfXqmPEbPETuwRsWaIeWWaS9E2ZzbMJCw8U/FP66uV/eWWs4mU6DMxUsO2fXXJOSPwzHjcuiEeWs7R4gRhbwvgwUc3/uSq8okVowqfE/9rKIYM2RP1slSVIBtzaAA0+fMC7djcvl2KpTW6E4qmX/EojVzS0LpJc7OyJ10FeMF5D8QXRE88AR9C2m6FGjapw+PUhQrMSWbsSfzGGUyQyW4g9BLV9eKKSo9bmecRFrOXMM7UR5S3Wwli5mTPmqAeIgEDFsBBW2beotdlU2n8dGanI39fR2VFTyExKAnUMuL9OwYBUoZNWSDe4DAX3bUX5Fo81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZz6ReOUMIdtowR5X+JPAtVTUL4ZDJIxHx7N6iOt7zI=;
 b=DBiQGY8NfSkxwc0ngwzb82z9uone+GsJh1xaTOAkZaD/cQOxtcrU5+pvB874CHp1Xu8KyeczfHE7dxTKSYj8QAUcuQJcQwEr37jAPUnCUopqjdxXyQgFejmElcoe8I4MemIKdbumcReKRTQBs87HauZNGpUUnNeiAPdKDCc35n0=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN8PR11MB3713.namprd11.prod.outlook.com (2603:10b6:408:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 07:29:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4755.016; Fri, 10 Dec 2021
 07:29:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Topic: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Index: AQHX4y1VNaiO68omHEet2J9DWrVARKwa1YEAgAAp0QCAABreAIAAIi2AgAE8MoCAAAd1gIAACyoAgAAPcQCAADDDAIAAp1uAgABn9QCAACTxgIAAAdGAgAAbd4CAAA94gIAABpSAgAt9SoCAADlJAIAAgb+AgABGMACAAAc8gIAAE+oAgAAmHACAAFJ4oA==
Date: Fri, 10 Dec 2021 07:29:01 +0000
Message-ID: <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <8c2262ba-173e-0007-bc4c-94ec54b2847d@intel.com>
 <87pmqg88xq.ffs@tglx> <df00b87e-00dc-d998-8b64-46b16dba46eb@intel.com>
 <87k0go8432.ffs@tglx> <f4cc305b-a329-6d27-9fca-b74ebc9fa0c1@intel.com>
 <878rx480fk.ffs@tglx>
 <BN9PR11MB52765F2EF8420C60FD5945D18C709@BN9PR11MB5276.namprd11.prod.outlook.com>
 <87sfv2yy19.ffs@tglx> <20211209162129.GS6385@nvidia.com>
 <878rwtzfh1.ffs@tglx> <20211209205835.GZ6385@nvidia.com>
 <8735n1zaz3.ffs@tglx> <87sfv1xq3b.ffs@tglx>
In-Reply-To: <87sfv1xq3b.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06de6b41-6cd5-4ebc-66f4-08d9bbaebd10
x-ms-traffictypediagnostic: BN8PR11MB3713:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB3713E5F51F5AD3469C56A3A28C719@BN8PR11MB3713.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CaY8cfLO2Cg2Eo/IqNXqq6Xb3uNK1u4Xh7fMKyOZ6GzdhUa4r6/aLEm9Ts6LQoVegopTx4MFTGpsXzdisBn70AX1Bbyofz9giMLbZ8UgcPEMtWOvUoAJ7olFFoSYSFpWQeBpLPCSi6O8cVvOAHsBoZe1icqLwDq7f9e52YhNMj5TfdU3Vlzi8BBe7Ge2hAJQjyoQ3Pa5jfy3nEeNoIJoKZPUympqgjLVD3vD/C8/Nwjhz+cOtEUEFoO2K3K7RkaFWXu47vf1nUglg6gZDpJ5+QPFpLvbVY1Lo77M3sj/tnjxCbv4J+u5p95S9+PMQ8B8MAMA6Bs/tC4IFfR/Fh10ckspCnzw4m3YdGX1a22QyA38gNBgcXV/gytF566DvMydMXDRSeg1KEcGl1rrAjBpOivxOcMFvhUWxX0lUtajh+koHVZIqaG4TY4k/jnPB/WcmrGXnoUDF6szVJ4rWcEeoJQhKpwXvONfCFu2sgSbvecySv6QfR6C/1g5Oqn4zpxbh3NyHaY2SlX2sMM+qkl0tYGOse8UGjMaFhbqxzomjbiGuxMBDSBanUDw5zkvNcNRmparZymZeOWkEw6yAMl/+ZObTPFi4MRouaqOMq6egijIMeCLaRkUhGarNryXAJZPMsPxGm0Dc7dOqJjkmxKRvaBPMIMovPtlhdq7mhKWzPr6YvqTEnrG0t9AynFSjPtm6qk6NUojwwEeXSeKUqp5Dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(64756008)(508600001)(38100700002)(55016003)(7416002)(86362001)(38070700005)(6506007)(54906003)(82960400001)(66556008)(316002)(9686003)(4326008)(8676002)(8936002)(5660300002)(2906002)(52536014)(26005)(76116006)(122000001)(33656002)(7696005)(186003)(66476007)(110136005)(66946007)(71200400001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8oELUMSs+btzOK39w91n49HbC7r7n59aYVdZIa+zI1ucIB8tTIoHg/PgyVOK?=
 =?us-ascii?Q?juBiw1az5VMZSbTaaKRJ3RNntcrb4aAgLE4WbgRknNJEqTHIiYm8rDapH+N5?=
 =?us-ascii?Q?ogHQFg74V+Q30I0r4LfoMxm2dOiolgd9h40axuotMpww1qQUTv89adeRBqBr?=
 =?us-ascii?Q?FDJBbCmoXzlf5Xy0N6OleKat0Z0rgpbO27hCRftB2YE6g85sk5ouhR9K32fV?=
 =?us-ascii?Q?qivAeDWOBGl8bW1dRtK695csIJLbThS4z+zsJ7s+DPFqr2Mr9kFqlZ+YBwqN?=
 =?us-ascii?Q?Tq1atqAs+OTmCBalbBHmn48Xrk6f3SAo7PMPPXVWOoCMcakiDJOx2bHHEPRS?=
 =?us-ascii?Q?bzmIMQbKewqvprFcNjetFchIiNOlgGZNRiFuQncKLr1+QSJ0q/k1hqoqNxjT?=
 =?us-ascii?Q?ysi41t92cK0esUXR8m+9cIwbaqFXB3RgOFxL5jaY1fSp8a4jNenbq7pkShGR?=
 =?us-ascii?Q?ElZdq+uBjsFoBG7xND7E2grtT5YrsKx32F0uNglo17lHYjFWzK/d4oRE+uQy?=
 =?us-ascii?Q?Fa/li43nnTs2iwstqfOWo0yG4Q6gKL/Xqzsn6TT27FKUMgSrJ1wkDLOFJFXo?=
 =?us-ascii?Q?ANI1sESnW8rje5S/zQgrNpPBsP0As81JcMexUy0TZWEyP86rYobWw/ZPtn7S?=
 =?us-ascii?Q?Vz95X5S/K/6fbLY/V/kuFWjZO9sjCOruDn7NEDfO25WXQXagkTQyI1KuShpv?=
 =?us-ascii?Q?npmiw4b4omgC8cdP4WLC9McOJTSHGvO0zcmcDeICdR9LHilqSyFjBUB3dlU/?=
 =?us-ascii?Q?6iVLp1G7P+I1xX/EIgOATsCq6xo1OqJwlYL42S8T4zOhfID8NiWIxCD58wE+?=
 =?us-ascii?Q?KSq31GVyhaH6i7ZdZQhpfhOnOcu+mPe6/k6Z0n7D8TrG4hEIoEYT9KgODDOS?=
 =?us-ascii?Q?xwxc0h9L2mXlHpsl8PIPhO6TQNCPWRcbxzyTt4VgmNv97iWuL7ePfPPfQ3A8?=
 =?us-ascii?Q?KHhx1HyJI/q98SfCNRWq/B8EZmUq9QNPbQicm0Mha+i7wHElVHy61J9pTRdU?=
 =?us-ascii?Q?4nXB4Hptv1T7MVXRW+e0IBa9xAqbR7cInZ7MnP/nYjWFm9HhnBHkop4AUy1P?=
 =?us-ascii?Q?1kV+pPqSjqzq1WAZdrLJa/uwl0erzI4CsH/JEp+iO9L7IOUidS/fulqvRi0k?=
 =?us-ascii?Q?GBd0diQVE4HwgBgxIFCRo51ayRVCGpAMakzSdiFTcT0GU2BXeR4gIBTrUjJ3?=
 =?us-ascii?Q?K+C02zlcz+ewaOoZeT4Ukmd5zIUxv3KzN0cVmOfdUst5TgoDUcEVaiDbpHK9?=
 =?us-ascii?Q?bexmseazEahHhFbvIoB/qGnvEM9PEh8g15g0NTBpoR2FwDmt+WpKXtjK4Cd9?=
 =?us-ascii?Q?2rYmGxxiLppfIGBQ3LJnNXr1VDTOlXvu56p1JBOodbc4OxvHHvoPjq0+q5tf?=
 =?us-ascii?Q?qP0qJgbycmv1NJsli0C/8S9ueNE7cS2IQI9mFBjzlwyySsiEoQYLXhh53sLd?=
 =?us-ascii?Q?mxIdxMKG6GPRq39/7w30CkwSVXh2TyxcfPWlFnkBqvh5I716QNuWlfMgoWwl?=
 =?us-ascii?Q?SKFf7oOETi+GPhlz0265M/H0xaZFQalG2nZ+3hsB19Xa/HBME5c6l7AYV7um?=
 =?us-ascii?Q?tft0Xmwh3lu1kghYWJ9fF8HsrOH1l7GWlFhoZr+bombknYwAzSl3MVMJSmIB?=
 =?us-ascii?Q?vTwmdpC7b+BUQjGKVV0T8hM=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06de6b41-6cd5-4ebc-66f4-08d9bbaebd10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 07:29:01.8117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGIEnQr7Gl2niEsXbvaFzRJwVraWfZSf8B/dTG0sAbyy3ddtvQQZrb4sW0gXsm9E1BYgXBg/20cOtaNePwuiTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3713
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
> Sent: Friday, December 10, 2021 8:26 AM
> 
> On Thu, Dec 09 2021 at 23:09, Thomas Gleixner wrote:
> > On Thu, Dec 09 2021 at 16:58, Jason Gunthorpe wrote:
> >> Okay, I think I get it. Would be nice to have someone from intel
> >> familiar with the vIOMMU protocols and qemu code remark what the
> >> hypervisor side can look like.
> >>
> >> There is a bit more work here, we'd have to change VFIO to somehow
> >> entirely disconnect the kernel IRQ logic from the MSI table and
> >> directly pass control of it to the guest after the hypervisor IOMMU IR
> >> secures it. ie directly mmap the msi-x table into the guest
> >
> > That makes everything consistent and a clear cut on all levels, right?
> 
> Let me give a bit more rationale here, why I think this is the right
> thing to do. There are several problems with IMS both on the host and on
> the guest side:
> 
>   1) Contrary to MSI/MSI-X the address/data pair is not completely
>      managed by the core. It's handed off to driver writers in the
>      hope they get it right.
> 
>   2) Without interrupt remapping there is a fundamental issue on x86
>      for the affinity setting case, as there is no guarantee that
>      the magic protocol which we came up with (see msi_set_affinity()
>      in the x86 code) is correctly implemented at the driver level or
>      that the update is truly atomic so that the problem does not
>      arise. My interrest in chasing these things is exactly zero.
> 
>      With interrupt remapping the affinity change happens at the IRTE
>      level and not at the device level. It's a one time setup for the
>      device.

This is a good rationale for making IMS depend on IR on native.

> 
>      Just for the record:
> 
>      The ATH11 thing does not have that problem by pure luck because
>      multi-vector MSI is not supported on X86 unless interrupt
>      remapping is enabled.
> 
>      The switchtec NTB thing will fall apart w/o remapping AFAICT.
> 
>   3) With remapping the message for the device is constructed at
>      allocation time. It does not change after that because the affinity
>      change happens at the remapping level, which eliminates #2 above.
> 
>      That has another advantage for IMS because it does not require any
>      synchronization with the queue or whatever is involved. The next
>      interrupt after the change at the remapping level ends up on the
>      new target.

Yes

> 
>   4) For the guest side we agreed that we need an hypercall because the
>      host can't trap the write to the MSI[-X] entry anymore.

To be accurate I'd like to not call it "can't trap". The host still traps the 
MSI/MSI-X entry if the hypercall is not used. This is for current guest 
OS which doesn't have this hypercall mechanism. For future new guest
OS which will support this machinery then a handshake process from
such guest will disable the trap for MSI-X and map it for direct guest
access in the fly.

MSI has to be always trapped although the guest has acquired the right 
data/addr pair via the hypercall, since it's a PCI config capability.

> 
>      Aside of the fact that this creates a special case for IMS which is
>      undesirable in my opinion, it's not really obvious where the
>      hypercall should be placed to work for all scenarios so that it can
>      also solve the existing issue of silent failures.
> 
>   5) It's not possible for the kernel to reliably detect whether it is
>      running on bare metal or not. Yes we talked about heuristics, but
>      that's something I really want to avoid.

How would the hypercall mechanism avoid such heuristics?

> 
> When looking at the above I came to the conclusion that the consistent
> way is to make IMS depend on IR both on the host and the guest as this
> solves all of the above in one go.
> 
> How would that work? With IR the irqdomain hierarchy looks like this:
> 
>                    |--IO/APIC
>                    |--MSI
>     vector -- IR --|--MIX-X
>                    |--IMS
> 
> There are several context where this matters:
> 
>   1) Allocation of an interrupt, e.g. pci_alloc_irq_vectors().
> 
>   2) Activation of an interrupt which happens during allocation and/or
>      at request_irq() time
> 
>   3) Interrupt affinity setting
> 
> #1 Allocation
> 
>    That allocates an IRTE, which can fail
> 
> #2 Activation
> 
>    That's the step where actually a CPU vector is allocated, where the
>    IRTE is updated and where the device message is composed to target
>    the IRTE.
> 
>    On X86 activation is happening twice:
> 
>    1) During allocation it allocates a special CPU vector which is
>       handed out to all allocated interrupts. That's called reservation
>       mode. This was introduced to prevent vector exhaustion for two
>       cases:
> 
>        - Devices allocating tons of MSI-X vectors without using
>          them. That obviously needs to be fixed at the device driver
>          level, but due to the fact that post probe() allocation is not
>          supported, that's not always possible
> 
>        - CPU hotunplug
> 
>          All vectors targeting the outgoing CPU need to be migrated to a
>          new target CPU, which can result in exhaustion of the vector
>          space.
> 
>          Reservation mode avoids that because it just uses a unique
>          vector for all interrupts which are allocated but not
>          requested.
> 
>     2) On request_irq()
> 
>        As the vector assigned during allocation is just a place holder
>        to make the MSI hardware happy it needs to be replaced by a
>        real vector.
> 
>    Both can fail and the error is propagated through the call chain
> 
> #3 Changing the interrupt affinity
> 
>    This obviously needs to allocate a new target CPU vector and update
>    the IRTE.
> 
>    Allocating a new target CPU vector can fail.
> 
> When looking at it from the host side, then the host needs to do the
> same things:
> 
>   1) Allocate an IRTE for #1
> 
>   2) Update the IRTE for #2 and #3
> 
> But that does not necessarily mean that we need two hypercalls. We can
> get away with one in the code which updates the IRTE and that would be
> the point where the host side has to allocate the backing host
> interrupt, which would replace that allocate on unmask mechanism which
> is used today.
> 
> It might look awkward on first sight that an IRTE update can fail, but
> it's not that awkward when put into context:
> 
>   The first update happens during activation and activation can fail for
>   various reasons.
> 
> The charm is that his works for everything from INTx to IMS because all
> of them go through the same procedure, except that INTx (IO/APIC) does
> not support the reservation mode dance.
> 
> Thoughts?
> 

Above sounds the right direction to me. and here is more thought 
down the road.

First let's look at how the interrupt is delivered to the guest today.

With IR the physical interrupt is first delivered to the host, then 
converted into a virtual interrupt and finally injected to the guest.
Let's put posted interrupt aside since it's an optional platform capability.

    HW interrupt
        vfio_msihandler(): ->irqfd
            kvm_arch_set_irq_inatomic()
                kvm_set_msi_irq()
                kvm_irq_delivery_to_apic_fast()

Virtual interrupt injection is based on the virtual routing information 
registered by Qemu, via KVM_SET_GSI_ROUTING(gsi, routing_info). 

GSI is later associated to irqfd via KVM_IRQFD(irqfd, gsi). 

Qemu composes the virtual routing information based on trapping
of various interrupt storages (INTx, MSI, MSI-X, etc.). When IR is 
enabled in the vIOMMU, the routing info is composed by combining
the storage entry and vIRTE entry.

Now adding the new hypercall machinery to above flow, obviously
we also want the hypercall to carry the virtual routing information 
(vIRTE) to the host beside acquiring data/addr pair from the host. 
Without trap this information is now hidden from Qemu.

Then Qemu needs to find out the GSI number for the vIRTE handle. 
Again Qemu doesn't have such information since it doesn't know 
which MSI[-X] entry points to this handle due to no trap.

This implies that we may also need carry device ID, #msi entry, etc. 
in the hypercall, so Qemu can associate the virtual routing info
to the right [irqfd, gsi].

In your model the hypercall is raised by IR domain. Do you see
any problem of finding those information within IR domain?

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
