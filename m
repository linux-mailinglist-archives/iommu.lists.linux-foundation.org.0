Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55055E571
	for <lists.iommu@lfdr.de>; Tue, 28 Jun 2022 16:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6161F84007;
	Tue, 28 Jun 2022 14:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6161F84007
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPdeUI/c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bv7GDNfUEZeq; Tue, 28 Jun 2022 14:49:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5339283FE5;
	Tue, 28 Jun 2022 14:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5339283FE5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03EB0C007E;
	Tue, 28 Jun 2022 14:49:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84181C002D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 06:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC2B4155B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 06:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC2B4155B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=JPdeUI/c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWGxhpVl6GYC for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 06:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566BE411C6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 566BE411C6
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jun 2022 06:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656397078; x=1687933078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93orxkzY/N2uwRnrbie6edMYs+oiYtf40xIWlmJQbl4=;
 b=JPdeUI/cpChbCIIAinv6YyBrSw4SOEf/3EjfS1cKPcQeI5GP+cuwiL/4
 aGka3cIJDtv++9NdZRZxMIH47yEvQe4YduRRuZRnwkuZVQi9ULYS6wUWB
 EXusXY7pRnbFDaz1g3k4hIhWcnfCmTUa7VYW4jvE77sawZVzx1+fsJVpi
 g7QhpOmTMY93zt7pf/l9S9lo3iyUmqNl24oDKK0pg+FC5bAUYJrzLI5B8
 +oNrO3p1QWF5JfS697GIRAEfhRja7VmWjjAnFJlPgTut+e8BzeJJMtmIb
 bwMVOf+MmufsgHtoVlw/z5yv375i0chQivYn+L9QVLr45uFO/71trapDX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="262057748"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="262057748"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 23:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="590193122"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 27 Jun 2022 23:17:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 23:17:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 23:17:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 23:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGN+mV8DwoRmUG1BmOWq1vYFc/vA2oK6mczdugviFcQURbL2y/T5AbB+8ZRJ4ICVvVJCgSHYZGU982sQyvg+RxL/RCdgxsnU/dC0Bk8wg/IdiM0r9ZlKs/W9UCtNCtBuEO8b8tXvFpen33GaKF5o2PDZIqsunZnQnex2TEAmVVsqBo2KdhSdC+SJxifRpYpk4P4usx5VA6a3oHxg90aGoG9vuveyVhI+zrQaEZz6Dhctvhn4J3qRAho0qiPQpHd+ZfJhvDKE9lLtaJahHZbhgTFNIbROikucFumHDjfm/9c3vOkVJm99ckFIxezkv0i0xTwZIk7eC7pRyS9PbXjutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93orxkzY/N2uwRnrbie6edMYs+oiYtf40xIWlmJQbl4=;
 b=UrEwX2ozRz8ydkpKMC6QiyMJ+knZWkbTVlpiq6QN9pqFtzCHSaxdNTiXDh0q7MoeYP1WHrZWb3p/XQMX2j0KRhm8dYz3eYb3OGfnk0Np9of3U8sMigx1ZgPrjq50JSs6qFxMkn3ui6bdpyezuwL/HdTA7rgBPnvu/O1k/jxb3rOEtazTRrqa6zOHQKD3qWJkdX6AIAmjygZsCxAtqSLokUHkh8XO4R4/0Z5n8xXsK3IdzUJLtwCMQWKh++0lpssNvC38snNRMDzXLlLeT6G4N0SWCQLCK4HrV4Ugy3p4CCpO+4KZDcNQLv0FbP9aWwRFHzE0NIKJBTJw3Wwn511chg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BYAPR11MB2838.namprd11.prod.outlook.com (2603:10b6:a02:cc::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 06:17:46 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::982:48df:bc5a:e5fa]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::982:48df:bc5a:e5fa%2]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 06:17:46 +0000
From: "Zhu, Tony" <tony.zhu@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>, "Tian, Kevin"
 <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.com>, "Jiang, Dave" <dave.jiang@intel.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: RE: [PATCH v9 06/11] arm-smmu-v3/sva: Add SVA domain support
Thread-Topic: [PATCH v9 06/11] arm-smmu-v3/sva: Add SVA domain support
Thread-Index: AQHYirYyFebp6sXEWkWECVlmWMhhsa1kVz1Q
Date: Tue, 28 Jun 2022 06:17:46 +0000
Message-ID: <BN9PR11MB5433C2F246AE03D1039C1D078AB89@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <20220621144353.17547-1-baolu.lu@linux.intel.com>
 <20220621144353.17547-7-baolu.lu@linux.intel.com>
 <9266198d-33fd-4cc5-fdaa-3ba5571543b1@linaro.org>
 <5f5f7518-415a-ba21-07b0-15f526bbf045@linux.intel.com>
In-Reply-To: <5f5f7518-415a-ba21-07b0-15f526bbf045@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 5fc95606-ce03-4ef7-4ab3-08da58cdeb0f
x-ms-traffictypediagnostic: BYAPR11MB2838:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ciCBtakGymJXr2XrRqNsPpKqpDXTzMkNdUutibzcA3WDi8BcbXmYkTJlMHEfyQqQDBfPLmCmOeiYxmU0HnutplqiqjEnzTBDGKU+zIVJ3WUzEPUKmIii2EWzD3u0qnoK1vXKSpcaBnJg7ZO4bZRT+Wewi9mj7xoyX+VdjFaZS0FloeVSDxmI//Tx2sPrw2J9khZFkgIYaG+p93FpfNuzijvll6KKCJkAAhT/q14PMblUD88kXvz+w1hzmqOqmt7nJA4xQwpisJHmQsSIg7zYh7RGbMg4E5V2wawDx4XLiTfKoQLE3SMiP+Yx69HRcOoNG3GvL+ealk2UIHKcxMF3WPEh3Qc9eZ22a3jebWIUz8ngV06TQT7ukhXph+KlVPFxcCCGxAR5RPUVwvj0dR0YRG9AqCkBbzmOlOY3nYQSvnCz+fZNA1TAaIOf7QsPm5noRF+R7JByxQxFLwkU6eNmYUdKyldR1bOfkZA5yoPZPRrRojUBkBU95G2NwMFSUYx3Og4CWUOYWDyanbI/5V52SdIl9nYDa2l1qhWljhyIavYX3cacYrAL8iHCZ2rEwsaROu0VnEfRrqOlOSpkiinJTDnYNiIo2gf1/cUnguQ1vJ4hfZKObqBUrA7y5W8S9YFxxrlNr55qGZ7nno2DRY306Gy+YlOClZNp5CotYGKPtYvUAZ/PqIu7RAcOismgl/VzNMW+Pl22JnrROOzoL2qk9Pvsa7Y1+Q1dVcUGa33yfFfQuN7uXAHCfAwUFCgEEviPYytrfR7A4jszdIp0R/ygaqabm6z0jiPzl71Mh7oezSRPFv5ikmBx1cJAsGYMJa/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(64756008)(66556008)(66446008)(66476007)(52536014)(66946007)(33656002)(4326008)(8676002)(478600001)(38070700005)(76116006)(9686003)(71200400001)(316002)(26005)(7416002)(5660300002)(41300700001)(55016003)(38100700002)(7696005)(921005)(6506007)(86362001)(110136005)(8936002)(2906002)(186003)(83380400001)(82960400001)(122000001)(53546011)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWpmeWxVeTBYeEdubmExVlkrRnVtQUlmTUdPWnNNVTR5UnRJNWczeE13K1NM?=
 =?utf-8?B?TUdJUmFHaVFXNTRyd0ZYQ2NmdkRJMlRxbDRUVHMyQ2E1YUoyUE5ucEp1NlF5?=
 =?utf-8?B?RERRMWJHRVZrR1VNNFcrLzlVMzU3WlZ0aHRid2Y4VlI1RVl0N0JWQlZmcnpH?=
 =?utf-8?B?WFJQN256RDlIQVVQS3BmNFBmUnpheUwzUlczWVk4ZVdySTlwUnowOFVna0sr?=
 =?utf-8?B?ZlNuMVRSRldWaEZndDE3UjgzSy9wS0hOZHpLVjc2NEVDSGpabGNWenR3TmFP?=
 =?utf-8?B?VHlHL0tqc3FmalY1YTlZM3hudFp5bzM1Vk1FbGNYMG42SFEyTlVPZEpVQzlm?=
 =?utf-8?B?RVF0NjFaWC94QjhNN3dqUzJLY2dIRDRNY0Y5VUFuRmhka3J6S3NwT3JOWEJq?=
 =?utf-8?B?b1JjQ0pDY1VDMExWK05TellCeEs3cGNjTVhWQWxTTGZQMU1YcWJ3Q0tCR0Qx?=
 =?utf-8?B?Z2MzZk1xSlhjUDRaRGszaXhNay9VQjhhWUVPcHhGVmFVY25WbVBHc04zUEh2?=
 =?utf-8?B?L2dxSkoxSHBKUE9PbHQ5MGhPUXdBQ2lvQTBjcXFkWkNrVVgrd3VYb0piUldO?=
 =?utf-8?B?ektnNVI4WEQyQ1hqL2dIczJ1cVptSHJrV0Q1cUVaRyt4UkpNakk2b040OERl?=
 =?utf-8?B?T3JvRTZWS0FVaVhPNHllaXhhV2lYT3dKVklNUWJSZVQvU3lBb0NLdE9xNjlW?=
 =?utf-8?B?d0pFT1NTaGNRY05DWUJ1dEdwNVpoaUU3bndCZ2l5YXdEb2Y4N2FCRDJOa2R0?=
 =?utf-8?B?d2lOOVJ4NllRSms4RFNRdXNwTCtpUFA0K21ieGNncHlmY1J0UllUNEQrMDg0?=
 =?utf-8?B?ZFAvdGFjaXIvdVNGUVV3c3BIOXBrUUc3SmxlWDIrZ3h1NGpFM1MrdWdqQVM0?=
 =?utf-8?B?YnV1ajZ5cUl4Q0FsNERuYUx2MUNyS0Q0MVR6SE9LdEU0ZU55Lzh1OHN2N2Z2?=
 =?utf-8?B?Q0VqSkp1cGgvYStmbVdYUnlyTnpyVUx4bUhPUEowcU9XTm9WWUNSYU95VjBW?=
 =?utf-8?B?TDN0RVEybmZhcWpwRWdwVzNQOTJSTXV3K1J4MmdWQlVpYW5hUUNNNTNDeTc2?=
 =?utf-8?B?NjdzS3cwZlh1NnR4cCtLcFZEUE15VUFVSVNFYlMyZ05YZVh3b01sRDJrWEZk?=
 =?utf-8?B?SndvbHdESE1vU0I0bEphc1AwSHRKTnBxNkU0ajloR0kxaGNPYVN3WEtTOU5l?=
 =?utf-8?B?U09HOVh5T3FZN1Y0NE4xSzA4TmtzS0pKN0d5VWVjcE5MNTV2a0o2bjUwQVF5?=
 =?utf-8?B?UXNKSTNoNGRmMnF3QXJMQkNVaEFmK2QvZXdEalVtTDdDU0puNW9HamlMUXp3?=
 =?utf-8?B?NWZTcVRzcUJtaEtZanNGWitmQlN3aU4xb012eHdGUUY3OVp6Y2p3RFBQYmcw?=
 =?utf-8?B?RW1na0twell5aDQ2cVQ1ZmQ3SmFXYVlZS0l3NE5Qek1uSklIc0ZvUG4zbkE3?=
 =?utf-8?B?eDIrWWpHUlRUN2FtUUpQaXdKVDVkaVkwQmQybXpkY1pjUjF2MWt6U3crTUxy?=
 =?utf-8?B?Tlo0Z29Gell2aldKeFlHTnBRWnljM0lJNGxhVnJzcnJ5K2VmRFVvUGlhZHBF?=
 =?utf-8?B?MjhTZVJoaTBndGxOV05JOFd3UktXQTM2UjJxWVpuS2ZkZ3pIa0dKQ1E1WUlT?=
 =?utf-8?B?WTRKYjRTOWk1bStHV0dDd0ppSHdINklRQkRnYVRzQnNtU283WjhGbkxod2ZI?=
 =?utf-8?B?dVY2VS9BWVR4MFR4VTBlSGgvRFlCcyszN3pGUUNTQ3dpZnFMSW1kOWQrTGVz?=
 =?utf-8?B?NjdvNHJzcjdFNzFERGd5c3NnZGVKUEdKK3RrMzBDeTBZSkxjYWpmY08xS0xV?=
 =?utf-8?B?QkRNWWI1NDk2V1BsZ3ZQYStvRENHeUwrekN5eW1oYnRIS1NGM20vY2ZIWitT?=
 =?utf-8?B?ZGZlVlM2aFVOUVcrSzdoVTk5SWxTa09LTnJyRkpxNXV3eU5JVlV4VVVmeklO?=
 =?utf-8?B?aXF3NEY4aDZ6bktrSHFxd0pRT05ybjF3QVd1NmF3VXcrQVlmTzBmS0dWcHlj?=
 =?utf-8?B?a1h1cWZLVWEvd1AxblFJaFl4T1IxMFNZTnhCTTFOUmlRQnpiT3BpcHowK1Nx?=
 =?utf-8?B?Nk1iYXJ5bGhjZnpXM0RhUlV3ZnAzZ1ExMXArSlVxZm1FUmdwTFcwd0RIWTRX?=
 =?utf-8?Q?/ts5jhj3DiJCX3QvZjERs25bi?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc95606-ce03-4ef7-4ab3-08da58cdeb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 06:17:46.1065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZ/tM8JtCK/apEu6kCFO3szqmGIBCjdYuuDLZWMkVFmjScEg+RdofvKygrf6aTT3KtsPmk6KLK2f4W8kP/e8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2838
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 28 Jun 2022 14:49:26 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SSB0ZXN0ZWQgdGhlIHBhdGNoIGFuZCB3b3JrcyBhcyBleHBlY3QuDQpUZXN0ZWQtYnk6IFRvbnkg
Wmh1IHRvbnkuemh1QGludGVsLmNvbQ0KDQpUb255KHpodSwgeGluemhhbikNCkN1YmU6U0haMS0z
Vy0yNzkNCmlOZXQ6ODgyMS01MDc3DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBCYW9sdSBMdSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEp1
bmUgMjgsIDIwMjIgMjoxMyBQTQ0KVG86IFpoYW5nZmVpIEdhbyA8emhhbmdmZWkuZ2FvQGxpbmFy
by5vcmc+OyBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz47IEphc29uIEd1bnRob3JwZSA8
amdnQG52aWRpYS5jb20+OyBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+OyBU
aWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBSYWosIEFzaG9rIDxhc2hvay5yYWpA
aW50ZWwuY29tPjsgV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz47IFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+OyBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlw
cGVAbGluYXJvLmNvbT47IEppYW5nLCBEYXZlIDxkYXZlLmppYW5nQGludGVsLmNvbT47IFZpbm9k
IEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+OyBaaHUsIFRvbnkgPHRvbnkuemh1QGludGVsLmNvbT4N
CkNjOiBiYW9sdS5sdUBsaW51eC5pbnRlbC5jb207IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciA8amVh
bi1waGlsaXBwZUBsaW5hcm8ub3JnPjsgaW9tbXVAbGlzdHMubGludXguZGV2OyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsgUGFu
LCBKYWNvYiBqdW4gPGphY29iLmp1bi5wYW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRD
SCB2OSAwNi8xMV0gYXJtLXNtbXUtdjMvc3ZhOiBBZGQgU1ZBIGRvbWFpbiBzdXBwb3J0DQoNCk9u
IDIwMjIvNi8yNyAxOTo1MCwgWmhhbmdmZWkgR2FvIHdyb3RlOg0KPiANCj4gDQo+IE9uIDIwMjIv
Ni8yMSDkuIvljYgxMDo0MywgTHUgQmFvbHUgd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3IgU1ZB
IGRvbWFpbiBhbGxvY2F0aW9uIGFuZCBwcm92aWRlIGFuIFNWQS1zcGVjaWZpYyANCj4+IGlvbW11
X2RvbWFpbl9vcHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTHUgQmFvbHUgPGJhb2x1Lmx1QGxp
bnV4LmludGVsLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGpl
YW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gDQo+IFRlc3RlZC1ieTogWmhhbmdmZWkgR2FvIDx6
aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZz4gSGF2ZSB0ZXN0ZWQgdGhlIA0KPiBzZXJpZXMgb24gYWFy
Y2g2NC4NCg0KVG9ueSBoYXMgYmVlbiBoZWxwaW5nIHRvIHZhbGlkYXRlIHRoaXMgc2VyaWVzIG9u
IEludGVsJ3MgcGxhdGZvcm0uDQoNClRvbnksIGNhbiBJIGFkZCB5b3VyIFRlc3QtYnkgYXMgd2Vs
bCBpbiB0aGlzIHNlcmllcz8NCg0KQmVzdCByZWdhcmRzLA0KYmFvbHUNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
