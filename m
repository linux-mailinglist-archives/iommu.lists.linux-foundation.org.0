Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E786E4E5DD6
	for <lists.iommu@lfdr.de>; Thu, 24 Mar 2022 05:29:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616B5415CF;
	Thu, 24 Mar 2022 04:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8GteEROfgIO; Thu, 24 Mar 2022 04:29:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 781324151E;
	Thu, 24 Mar 2022 04:29:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E686C000B;
	Thu, 24 Mar 2022 04:29:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D37DC000B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 04:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0601060B77
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 04:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id An0yKU6W8Hke for <iommu@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 04:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18E12607F2
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648096158; x=1679632158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T602Qy6Yi6mg7Y/J2BhGCl9WOE2nWUHY55jMRCZzQJA=;
 b=fiW/xvIHrt/4xuSEJ8XIWH+D/VN5sdR0qinTWlTzSLDPcs/brRvofiBh
 mcp3x17mvKjjiF74kvzcNLU8QJZoOCJ2sGTxf7ayi0eXgVqOofHzT67+e
 4xS5Tb1NDI1talIiT2raJ1I5/1v1AbUQQsU8y4t+R0dXHZ0RdpBGupY55
 y+6tK5Da4U1XZEDtPK6xlLX2MixfwwqZyGvdZT76cdwzkX5OfawR4NV2f
 Y17z/cLYUhtodcK2ERUzalBqr1mDfF9Y97UpIc/nYHbL+SidBHShw77JL
 3eYcPBNYW1HgZEpN8FHNr9QBHnk3yrFhpEJw8ENGMB987vglJoeowli/5 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="255849456"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="255849456"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 21:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="647726843"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2022 21:29:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 23 Mar 2022 21:29:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 23 Mar 2022 21:29:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 23 Mar 2022 21:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsNpsIyUV4ttKPuY1HmsHrWE80HjAo78EOcn01/0rSQOCGgp9TVUXsVbZ9vhFlt4rfuGdSoHTmlPruOPmUS8dgd9EKUobBTunOiv/jkQKp/ooSZffdo+j9PGNCGZTXuTuK3u561Hz2JXYGSKxMgxu1HTwGeYlTKLm7w2Qbswg8JIrLMKhxNX7YKRlk5DKKpe3ilzjU8CQugzLEdq3N9K9NsqusY2yK6aVh4/OsBtZuHsN01/AnacvVHsdPB442cifrkG4B/KD40HD8vttmSeCpO48iqXFUoA3+UcvXMVJewYeUwNE1tWKjWGHjSF9x2hiUvs9mP/aRk2yDKu0Lxaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T602Qy6Yi6mg7Y/J2BhGCl9WOE2nWUHY55jMRCZzQJA=;
 b=dqq70pjETYu4YghVS+EdYOIx0ovl8vMgghgw8ADhlUg4e5Wnv1esbKGXGHeNbYdFOXpJCzBZdLV+sutzhb+taSh7H3BihLJIF5Gi6z7wn1c/np9vL9Lcf9Q7ran1/NXyCuLefxdvnsZ5uCMbqLmyKANnYerfLjbj93Iqtduh9CuUBagNRO76CyyPHKeN/XbZKN8CzG0a7kFRc5vBMtZI/c1KDk8ZDfSYIzxN4bSyM6/B4BQBizc871IFA0Vc8SLrMVbRi8g4teQZstrQqnJTTrpVpIGh2fhytBpf+qLLYGPEoAjLbgjh6p7gx6K21PqIoyRHD5WDRdQXP1InbYxoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR11MB1845.namprd11.prod.outlook.com (2603:10b6:903:128::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 04:29:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 04:29:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH RFC 04/12] kernel/user: Allow user::locked_vm to be usable
 for iommufd
Thread-Topic: [PATCH RFC 04/12] kernel/user: Allow user::locked_vm to be
 usable for iommufd
Thread-Index: AQHYOu2DSsSjQi9eMEu6J1ns8GLP6azLfE8AgAAIMYCAAAjbgIAADNiAgAI1J0CAAAhSgIAAAkLwgAAF7YCAAAOIEIAAC3KAgAAIBoA=
Date: Thu, 24 Mar 2022 04:29:14 +0000
Message-ID: <BN9PR11MB5276FB52D63497FC67CB7ABE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <808a871b3918dc067031085de3e8af6b49c6ef89.camel@linux.ibm.com>
 <20220322145741.GH11336@nvidia.com>
 <20220322092923.5bc79861.alex.williamson@redhat.com>
 <20220322161521.GJ11336@nvidia.com>
 <BN9PR11MB5276BED72D82280C0A4C6F0C8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEutpbOc_+5n3SDuNDyHn19jSH4ukSM9i0SUgWmXDydxnA@mail.gmail.com>
 <BN9PR11MB5276E3566D633CEE245004D08C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEvTmCFqAsc4z=2OXOdr7X--0BSDpH06kCiAP5MHBjaZtg@mail.gmail.com>
 <BN9PR11MB5276ECF1F1C7D0A80DA086D18C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtpWemw6tj=suxNjvSHuixyzhMJBYmqdbhQkinuWNADCQ@mail.gmail.com>
In-Reply-To: <CACGkMEtpWemw6tj=suxNjvSHuixyzhMJBYmqdbhQkinuWNADCQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f889dec-217a-4a10-8a66-08da0d4ed9f4
x-ms-traffictypediagnostic: CY4PR11MB1845:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB184508798FFF84EA5B1B8E7F8C199@CY4PR11MB1845.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abc8y0WtKnz3VMRor3Sv32lHyihFGg7QOh6/isqPXxLwSo5K3eTHeqq2DCrr5ittWDxgHrxfNbAf0Ae1wRjOHeNyXcXfeomIAHBATSlEJjvwN78MQv1UfPPIB1LfyTAwyAaM5UcpVjgx+eehXMlQ/DH7X1DvLAM3P1E5eAr7P1kfglUOkF5RZZ8dj/bW4ov4JWlHUYsj41xiDhSdx17uh0CLF0ynHk3RUQFVZtqftZeRQVbooQXH7AxpZqifrNS7QchLfQy7uK6GJlK+kPHmN7ZBzedegTyNhUzG0OTSuvHuygdZdYzBFfPvVVv9d5yDaaVO877Skai7lHDRIy6wqQLAXjIMGC+aEeDsDFAEdvoWa+SF+fyhUh9FNzUPwVY35/g0Ed4QSZEqm+r/nHj3JBjjZr92BsjpdT0FXJuwCGNab1xJ1x09cj9/x79y7+mDPz2Az8fem+uKXsC9FO1k+biOCvMmRyibC6QN833dIKBJxHu4q+HLh5fz45MaKiumpCSKWB1oF5nZ1N/qSzVnKfWyarutoJNvkJLYuTg/F0G3fhOanWloEdokXLYOLZqkEEwwk0vg5nVyPicodIloVx2mGeuAuJfh0Pp4LHi2Rk2O6e3iXiNdUmPZjdSGBJ0uwfnCtiBJ9Xk988bhjnxmP+iZ6LMSKndZ8xoNziKsFT71fOnJ6kCMqyzY7geLekwCM40N/QHiSqA9D6ZIF7E+GAUfYsErg/egzljoI+2vz3MO/oK5GtBRtw6S77bgpUm6pkBztlcqIhRdYI8xV2g42j53BgkpcQ8VJhZKSd5vowg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(8676002)(64756008)(6506007)(966005)(7696005)(66446008)(2906002)(6916009)(186003)(71200400001)(508600001)(26005)(33656002)(55016003)(66476007)(5660300002)(76116006)(316002)(66946007)(8936002)(7416002)(52536014)(4326008)(82960400001)(54906003)(38100700002)(9686003)(122000001)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEMzaWlENkh0cWVOZkIwM0U1R2FTUnlNd21sN2o5OTFrTUxyc3lrM25RMjRQ?=
 =?utf-8?B?M3RISnFxWlRQQ1JuR2xwYW5teVcyYkhGSnpIQnFIbTBQeW5nMU9PdTBCR1lv?=
 =?utf-8?B?N3hBRHBWcVBIemdYWVVzd29McFhKK1JnWlpQbGZTQlJaODl4N0ZHamlma3da?=
 =?utf-8?B?Q1ZzQXBlMkljSEFkWkNwQlFjRWZhOVRuSjFFQmR6R2NSOUtyOXVqU251WEp3?=
 =?utf-8?B?NnI3SzlmT0ZiS0dxdFl6aDdKWDAzSUxOc1hIbUUzL0l2am5XQUtJY3F0enB6?=
 =?utf-8?B?UkhPVVZIMjBVUkhvbzhNaFhNc1M2a2lJQVFTbXUrUG8vWjZmdHhweE5zKzdT?=
 =?utf-8?B?MlFwZDU4SjdHTWdtNmcyendaU0dwS0laN21XQkZLellCVEVUTDZkcXFqSEtx?=
 =?utf-8?B?V05FS0M5STVPMi9YY2NOVmdHRWdydE45RDZpUWF1Z04wdXBTeEN4WW1nclpr?=
 =?utf-8?B?R1EyMWd1SWZyUWZjOHMrNUxRbU8rZTUwV05XbXNPS0hUSmV5RFkwcWJRekxq?=
 =?utf-8?B?YXJ3MXdnS0ZKZVFxQzY4RXltWkR0citDT1Y0U2V6Y0Fkei9nRkVBVy8zRUVC?=
 =?utf-8?B?amh6N0R0dXFUM3dMOTVNQ2t5UDVTZmVHV0EzRW9yTktlbm51N2xJRERQL0c3?=
 =?utf-8?B?ajREK21GRHhnL3RUVmlsNDRaTjJQSHhtekZFRWpxdTExMHZZeWVPZlFtb3da?=
 =?utf-8?B?aGpqTC8yTTZuVWtOd09FaWs0U3RBdFlaQUJvQVNMb1RuTFNCMGxMTzl1b0pj?=
 =?utf-8?B?QWwwUFJIampvVWFPaVA4a01VU1crRDg5YklsM3R5dXFjdVlZbk1wN3BoRlAz?=
 =?utf-8?B?ZU4rL3I0bldsa2pqWURxL2p5U3lQWTJuTU1kMDZLTE5PdUZYdWFlRDM4M2ZS?=
 =?utf-8?B?NTJHSGNQRng5ZjhZQlVzZ0xVMC80Rll0VC94Zm55QWdUYTV1SndBTjNJL0pG?=
 =?utf-8?B?b2M5L0xCRnovWm5ZdWp3eVRjZy9PZDhaR0luV3A3aE5kblBpVDRmcVhwKzZO?=
 =?utf-8?B?VUcrRW05TVpweUhIN0ZKNHNGejFORi9EMXJBVVRmMGw2N0pSWGQ1T1VKVUl6?=
 =?utf-8?B?N3I4WFYrMXZFMDVUdEtnbk9wd2NHSnFzUy9vVDh4VW5yTXRlSk1aVG9xZGIw?=
 =?utf-8?B?TVd1NDczY2w0dFNmQzdBRmVKN0hsaXJKWTY1MjVaWklHUGZ0SWowaGNZVHVo?=
 =?utf-8?B?dFdRYkFsNGJKd0YyMEhJVmJPeklIM2ZIclVpek5TdklUL2pkalp6VStYTlIx?=
 =?utf-8?B?MzZSM2QySXZKa056MUlsRStnU2tnU3QwSEZtem5oZkJneU1rd25XS3RhVGF1?=
 =?utf-8?B?QmRrTDczOFY5NXo0WkJxb2treGsrbE14L2lhNWVSSzF6TzRIS20zRlB4RkRw?=
 =?utf-8?B?RW1aQk5ONWFyRGZFOU5YTThBekJ4OHVIQlJUV3c4OGk3NVBxdXBTQUVUUkpa?=
 =?utf-8?B?eHlzQ000U0V0RFE2cUVLR1QrUlRWeHJXb296V0h4ZHlYODBERmRVdWdUQ3A2?=
 =?utf-8?B?VEFOcDhDeXFZeE45SHNUSmIyQWdGL2xQZGhCRWFzQnpnQS9jTzJ5K010Ym5q?=
 =?utf-8?B?dWFEeUxtOXpTTmllOS82MGN2alVrQzlwOVZ4UjhpcHZsQXFUWFJOcHYxY0Ur?=
 =?utf-8?B?NDlmR2hEZC9zOHRDWFVkODI2L0pHNXJXdDVsL1A2SjRVRW51NUVJU1RoYzBX?=
 =?utf-8?B?Yzl4U01lSEtkSVBwQTZTdHBaOUZGb0JlSnlQOUVIeVcvMVFmNElQS3FuQ0Uy?=
 =?utf-8?B?ME9Sa2EvU284NVBPamNmWDBpODRqSFN1UGRTN0NIYStTcVRaMmJ3MFBGbUNq?=
 =?utf-8?B?ckNBNnRxNUJGL0JSRjcyZVgrMGE1SmVtK3ZXVTBDRysyMkVVSGZoeDhXRWo0?=
 =?utf-8?B?azZTOEp4MkNJOUx4bFVlb0VCVjVxeGg1cWNpM0FVQkRHdkFYa1FURGJoMzFr?=
 =?utf-8?Q?35vi6WIKGHoKXKgzeWE6m44j78V6eBtf?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f889dec-217a-4a10-8a66-08da0d4ed9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 04:29:14.0232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/1Rv9IthQBQs7KaG6Iogfv5CqDTUC9+89nWNVpAi4Q5pxn7r2Uj9PMpQ+HYo8GcOwzFyYzKtMEpL03yWt2mbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1845
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Martins, Joao" <joao.m.martins@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>
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

> From: Jason Wang <jasowang@redhat.com>
> Sent: Thursday, March 24, 2022 11:51 AM
> 
> > >
> >
> > In the end vfio type1 will be replaced by iommufd compat layer. With
> > that goal in mind iommufd has to inherit type1 behaviors.
> 
> So the compatibility should be provided by the compat layer instead of
> the core iommufd.
> 
> And I wonder what happens if iommufd is used by other subsystems like
> vDPA. Does it mean vDPA needs to inherit type1 behaviours? If yes, do
> we need a per subsystem new uAPI to expose this capability? If yes,
> why can't VFIO have such an API then we don't even need the compat
> layer at all?
> 

No, compat layer is just for vfio. other subsystems including vdpa is
expected to use iommu uAPI directly, except having their own
bind_iommufd and attach_ioas uAPIs to build the connection between
device and iommufd/ioas.

And having a compat layer for vfio is just for transition purpose. Yi has
demonstrated how vfio can follow what other subsystems are
expected to do here:

https://github.com/luxis1999/iommufd/commits/iommufd-v5.17-rc6
(specifically commits related to "cover-letter: Adapting vfio-pci to iommufd")

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
