Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2F46E08C
	for <lists.iommu@lfdr.de>; Thu,  9 Dec 2021 02:56:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C4460750;
	Thu,  9 Dec 2021 01:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uONPwiNO0Die; Thu,  9 Dec 2021 01:56:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1C56C6074A;
	Thu,  9 Dec 2021 01:56:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE0CEC0012;
	Thu,  9 Dec 2021 01:56:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDE69C0012
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 01:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1FCB40642
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 01:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpuWJSR3Tclm for <iommu@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 01:56:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1084540495
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 01:56:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225256335"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="225256335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="516454448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2021 17:56:46 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 8 Dec 2021 17:56:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 8 Dec 2021 17:56:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 8 Dec 2021 17:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6RVj+NBS1gBKkhpkslNG1wzIUugpB+KLQxO7ZiZQ29TBhNxwgWG2jzaOeANExcWUq7YrdRd+hCKL/10cpFmPmuSLBv/pejiViUkXt+Z/fy4abHabTWVTcT7DCgz6Ada+FFYVbBpRcykxkTBT7d9F+1Cau2hpGNf3nZXEVjYOavSlyQ3y1jRbg6H8P9yppawa5XNLyRKw5jbvDRW/RVX3oEUCH+26F75dM8pEpBu8OTTjhtDdnc5abBUiDsEvMqE2ThCDl2umDenmQq7eUuWYscUvFS4Kv8N1QzVo0MxOYF6TxIwB18ke8wO2tBz7wJuhR1G5y3hAiXGPaq0KS5Hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1KIjXgRREmjap8j5FhMY6R2Cf27LXmn9ueC8mVBD9c=;
 b=RpETeBsrCOrN0QBj6wBLidX2Ae3pMz4J89X0wx4pcde3KyyobWl73RR8huPXlzNZ5CYoAw2C+z3OfUUaV8+235SIbUy4aRomOGtFnOnXAEKWPV0DZFspCa391GJxy5qr1DpNR9tYA/+IRiBygo1N8WkMab3q/IOXGxvYChjQaxfQA9o2y7NDPTQAwOJ3kKFOJIxA1cIfYpIYpfbOVQ4CcrMRjwNM0bO7pTuZoYmn9weY4Y2unCFSH0hurIlfiTOmohp+/HBjKCs8sdq4175w+ATPz7Uqv3p6WJqQ7iudK6g5Sakuv3XXYnvccTTCAagUql1lkf1Bbsw2bwsANEnmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1KIjXgRREmjap8j5FhMY6R2Cf27LXmn9ueC8mVBD9c=;
 b=c3UZt4saODvMOHt7Ob/8MC77Te+LEnjO/JcXLbBW1UaBe3N3vepED2ynZvrMmWkW46s27Sk0AD1/WYu4UiWh8IHZ55R/GrkJMvwnkV8G0jSF98VuaV2xZSXQ/t0XCz+US7fTq6vhBQ+s57O9VrRbjehwy42mt0oI7iaQRTfG60o=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1489.namprd11.prod.outlook.com (2603:10b6:405:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Thu, 9 Dec
 2021 01:56:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4755.016; Thu, 9 Dec 2021
 01:56:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>
Subject: RE: [PATCH 2/4] iommu: Add PASID support for DMA mapping API users
Thread-Topic: [PATCH 2/4] iommu: Add PASID support for DMA mapping API users
Thread-Index: AQHX67q0UnEyPcLAH0q1jKWtvfT+gqwn3/wAgAERQ4CAAHVD0A==
Date: Thu, 9 Dec 2021 01:56:37 +0000
Message-ID: <BN9PR11MB5276676474FA6A35016B6BB88C709@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <1638884834-83028-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1638884834-83028-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <16408193-c8bc-3046-b32f-9274bf0b415c@linux.intel.com>
 <20211208104939.732fa5b9@jacob-builder>
In-Reply-To: <20211208104939.732fa5b9@jacob-builder>
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
x-ms-office365-filtering-correlation-id: b41fbb28-0dd6-4fd9-4081-08d9bab7230b
x-ms-traffictypediagnostic: BN6PR11MB1489:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <BN6PR11MB1489F5667C060C801E31B6B28C709@BN6PR11MB1489.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 08bkWv6e0GNcBP+Lq+DM8Qhc7cXemL7egfaIYpRZ0jYmqN4feU14Rm1I4G1CqZYOdKtPjZvaN6hCRNMriDED/VEXTi5PJeNp+of5vFLhd6cwqYqLIQekaUFWI/4+olXRkeUB1yjxVXlGT0fTZICxmwwHisMfM1auXyTKX3Jl6ZjRA38p32SGocFnLdcXT1H0+8usUPbqtMw6ncUYkwhipc4YfQ3OVz/5fSUJ4iaUBVIqJpoRFQ1zyCO0LmyTpYs42zS+sDiVUljau8zuiC05YrUEQ8WRLCjcfECdL8prR8E66XIhqQ6+rEKGpqHqSGh33Grx3U94NSmaZENg+NbgbZ0q8VXzTsAcXnoVvQSpBzghXtih4cgDYbsswRp6vwhvZKfVDg79Xb/Qshjr29hnPPJtK78xSF1oJmCrUDXRFvaGB+RhFfqfbPME3WVNPaCcfVsPqOKs07z4fERGymphsStBc3l/g4Zfj2mMx6fhFGPCSKjV4QUL0lJCF3qDnGYTBuZ1aQDTS0Wg9WEN6LccXFWlL+MAWSvttCt6QGdKZa/gGC1jRpuyNzFfRt3QnK4mHFnaneqFvJ0fxRfTAAe5L6lzH/NGgPKsuLkqpYk9DAiLtIShHViQbARDRqADkDPnfcSVyXfxEiNyvp6QXdYnS86Jj7x2n3obo8dIhP3LfloHG1C48LpQMGzUdYCtqmgL6KoEZ+O5SxomyICX/NmkX2VHSoiKscaghkNjv4h3VX+Y6Ih/HcasyLBJnystTKaoZ547D9ugChWFInHl99NBbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(4326008)(9686003)(52536014)(6506007)(4744005)(26005)(5660300002)(64756008)(66946007)(66476007)(8936002)(38100700002)(66446008)(33656002)(86362001)(38070700005)(83380400001)(76116006)(54906003)(2906002)(110136005)(66556008)(186003)(8676002)(55016003)(316002)(82960400001)(71200400001)(508600001)(122000001)(7416002)(26730200005)(19860200003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YCSb5p0cZ6H9PC4IWFrqbm3kXB7kmPQ8U6ruLrzA404Akm79i9vXvuo/ReRx?=
 =?us-ascii?Q?ct0WSn+YuJ67cILzU8II2rd5sCX2PjqbM+BqTPMIaN77B73tXlCBn3Zg5Nyr?=
 =?us-ascii?Q?30VI2wQmznqWoAIa514ES93c/EUkMu/jP9F01oA5V6NH+zEN/xt++NodIXBO?=
 =?us-ascii?Q?WZufoU5meNP6tt2Q8yWo1eluTQyoX9SNtXFiQatN0Cx8MS+gDzhXwfDjtlPX?=
 =?us-ascii?Q?ubCh9Gk6KsCSheIpozr3sbeXFS4GJbzTFTEac0xa+RXHRFgDuNejYJRlmmbj?=
 =?us-ascii?Q?dSNJ/xGP6NvaveET3B4FGZ90w/EMVNquSbSUqVDX+tmakGcLuUBw+ua72Evl?=
 =?us-ascii?Q?+IyARkf6ULR7B7iSD8fdIBnr+EfW3F9AtXcOopM80Ir2wYBeGWqqD/kdv+SF?=
 =?us-ascii?Q?efTIwmxktkpRJP3pJDBylprM9m501SNHOewgDjg+6LktuQQxslb0fWMBcfR3?=
 =?us-ascii?Q?q6IseUNBPUrpDg7f3HGBZU4LBVG1u1bE8r72RUuFZRG50jhREsrqHfantlMF?=
 =?us-ascii?Q?3n9L4CWfKpchmOv4nLhFg7IRTooyX4phBIT8VMTbpCOCa8fe6JCJccaRD4gk?=
 =?us-ascii?Q?MEaRBWrwS7T/rF/4+7RwXtA+db+9/IffBm3T4RfyaPnf4LNmeAD7oEBSMJg3?=
 =?us-ascii?Q?DlxEICkKHLV0TGa6W1wU+GWW+UhhRD0jygIeyJ5h7zAPEyJ7q5VQSDKNUTYB?=
 =?us-ascii?Q?aWI/VEtSgdMd6zXAsf7vAkKfEE+kc2DUwJwIbO1iMlBC1zbCvwLs6K+/T/kI?=
 =?us-ascii?Q?g+1rpfo2Mcc/dQ12jjIMNlIsYQB7BZLizoaimlep9M/NDzaWLGn7eVxfoKIc?=
 =?us-ascii?Q?kZCt7tDUSSVg8AZHnGC9YZf42R79hWGS/gSpXgKV0Ju5ZXUkP2awHns3EQcD?=
 =?us-ascii?Q?pgAaJqH1ovoTwpZ4Jw6N4+gusz8K2bn0RKPBmLC2hQtwdvIWxYNTRn1ngY0K?=
 =?us-ascii?Q?ahw1wT8xdinXnLH1Jv8xPfkrTfDHgUf78LgubWlEkEksAMat0G4kj2nV6L+I?=
 =?us-ascii?Q?Uf6d1qcdWi+Ki/c4Qs+HfbKBhxSFWWzmNBmt3fxOCFkSNlQXwJvrNkDz47Nd?=
 =?us-ascii?Q?0r3pRO/eOWWlmHFbA8M/lTMxwa0VScZRvBppCPMEMp/aOUF2LJvmBN32pLxT?=
 =?us-ascii?Q?vJI35ZdZRzaeZLPwYHrI6UBRJ4BdKmMCXO0q5tf2WtQHlrA0bo+t30Fw9WVv?=
 =?us-ascii?Q?yhNe2jUXmbba1J3GxXj3L6ZArpDNa7oqn/pHV7BLiRxAE6zxcVpA43GyI3Od?=
 =?us-ascii?Q?9VyqF45A1+gGrAOM5iD/ylZNRANKnbGWSdUha9KeKUjCDzJUDrkEwNghWbTi?=
 =?us-ascii?Q?z0Jpe6EdBvo2sIpOdHpQBoA8AFMP2JH5tQCoUuR9rrVz6KYqblonZ/fAUIfZ?=
 =?us-ascii?Q?C+UhXnsYY5HlD5FqvdUzjd/wl7MAiibKn/+DTgJ7kx3AfgPf1dnm0mR0bf6I?=
 =?us-ascii?Q?nAnADs1A7EyERU+O+WRpAsEQ5YHBbeNEaG43qRT/I+CwJwZYwVBJrLFAyQ07?=
 =?us-ascii?Q?1JJflW2h58qah+Or8PKjyh6cGV+dv32E1woS5VQ2EfF0CQ+fr86VGO2ghal/?=
 =?us-ascii?Q?wh4b7oSsn75Sok/mKRWrZRgYj6lxHdSYzregNsUS/MfSKGYlNyOplWBzGw1j?=
 =?us-ascii?Q?ybTRIrM6iFhpWAIRBKCMw1E=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41fbb28-0dd6-4fd9-4081-08d9bab7230b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 01:56:37.7087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UagS4MzAKelHfNqc1QsIrXQ/NeGMC4IxD06xAkL09IcN8YoyIl/9VOKiim44bgDYqcmS9MKx/0tygjx0OsCwzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1489
X-OriginatorOrg: intel.com
Cc: "Luck, Tony" <tony.luck@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Barry Song <21cnbao@gmail.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, "Zanussi, 
 Tom" <tom.zanussi@intel.com>
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
> Sent: Thursday, December 9, 2021 2:50 AM
> 
> > Can a device issue DMA requests with PASID even there's no system
> IOMMU
> > or the system IOMMU is disabled?
> >
> Good point.
> If IOMMU is not enabled, device cannot issue DMA requests with PASID. This
> API will not be available. Forgot to add dummy functions to the header.
> 

PASID is a PCI thing, not defined by IOMMU.

I think the key is physically if IOMMU is disabled, how will root complex
handle a PCI memory request including a PASID TLP prefix? Does it block 
such request due to no IOMMU to consume PASID or simply ignore PASID
and continue routing the request to the memory controller?

If block, then having an iommu interface makes sense.

If ignore, possibly a DMA API call makes more sense instead, implying that
this extension can be used even when iommu is disabled.

I think that is what Baolu wants to point out.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
