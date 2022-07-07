Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69356971F
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 03:02:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 101FB404CD;
	Thu,  7 Jul 2022 01:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101FB404CD
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzxEqFSz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFfBq_7JHRUc; Thu,  7 Jul 2022 01:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 00AD240193;
	Thu,  7 Jul 2022 01:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AD240193
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C77EBC0077;
	Thu,  7 Jul 2022 01:02:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E739AC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 01:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B14734016C
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 01:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14734016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS3mM5aRKbxK for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 01:02:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6303240104
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6303240104
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657155764; x=1688691764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OZZ7yoPkd+k2zdVtC3ja1qh+0RRFaR/NqGYSVMVDJpc=;
 b=jzxEqFSzfwQcoZGoFVE1AH9cha5XTCNXvtKgC6A6YBES0L79fKUkS4KL
 jrfpnJs6i2CP0kd/zG/mttJ7EjMw41FpDky99GIDm0Z+PE8Cjxn4FSi2K
 IPEu2v2dQIIUJFHLXSD2k2I6iz4TTDxkdOt+MdSBeZyxILhxJS3ptgEXX
 KSeQP35DEUICH/3axpqG/WBbbWSqBkodt5obdR8fnooDkguqHd2D284Ml
 2Jth21OI+EOikNq1idMAYZ005+/r7NO8Egy525I6Dks9Xd/lkdehOx3JT
 5U8avEv+barKMeEdhiMgKX3Fl7U8HTTNnvZFFPGVSgwkb/01F14X/tZZg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272694208"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="272694208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 18:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="683131883"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2022 18:02:43 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 18:02:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 18:02:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 18:02:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 18:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6UxSePnyhH15VDc5ZVmbPS4SKmvZ4ASxvizNxjduvfI+S4nUhdqSsKfxs/jVUW0lc3ruXgR0Luh/mswbLcGAtnap56BzL7NhEyVxqZr2fxY9984wYM6zVjNn52P2IlI7BzpdS56+tTBzb+fDDfVGFDgTuDCWMHuLEuaCZDlI6C70yLN9uIEDRKtkilK8pB/45RKbfgUMVaLJps49m6dxX9hf8VDNNwmh9HRz9ZMGsaTFZ9WM3MTnzQ018aHk3IguCmOrSHfpaBOqU/CuuyFVsQ9kNECWlHjGQbqJozrgDVOszkMaQcZAa5rA9iN04PJqzOXrewq5hb7ViKHo/g54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZZ7yoPkd+k2zdVtC3ja1qh+0RRFaR/NqGYSVMVDJpc=;
 b=VRWGjuUoQEG9j72VDk9LWec64bDtKF4zjeGDHcG+ZQajNgr2cLXFbO1ouIDCHtYSfvkT6cDNlpaUjUeIvY+cqt/X1Y436u5ANliPJ7Zodz0trV/ETrWs1TMF9Um5PummkQpNFz1KaafqrWifr3iKM4SQXYSz69GHO9dhuDZtjv7/G6bw8lLwlacFyxKtS2J217XCuuy7EMFvjuPc5H7meIyVOa+M19AFEHNuWQ8FmDV9gLwUUrJdUAGvy+QcMN4EJ9F+fckc5Vj7PD9AfrRdidw/nPLxTI9Dzh9iNgroMXBx9awyGwNPzpBkWjC0/z5/K3K+NmPmP8034pM/52vEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR11MB1669.namprd11.prod.outlook.com (2603:10b6:910:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 01:02:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 01:02:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>
Subject: RE: [PATCH v3 02/11] iommu/vt-d: Remove clearing translation data in
 disable_dmar_iommu()
Thread-Topic: [PATCH v3 02/11] iommu/vt-d: Remove clearing translation data in
 disable_dmar_iommu()
Thread-Index: AQHYi40eeQ+35kloMUmgddwM45tICa1pKOZAgALsXYCABg4TYA==
Date: Thu, 7 Jul 2022 01:02:40 +0000
Message-ID: <BN9PR11MB52768365158783B097E7B30B8C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220629074725.2331441-1-baolu.lu@linux.intel.com>
 <20220629074725.2331441-3-baolu.lu@linux.intel.com>
 <BN9PR11MB5276A0E52DB09F5D338CEB998CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <c38b7123-f76d-d4b6-f36e-a385d5ea0cf5@linux.intel.com>
In-Reply-To: <c38b7123-f76d-d4b6-f36e-a385d5ea0cf5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2365a87c-f7a9-4edc-dc49-08da5fb46429
x-ms-traffictypediagnostic: CY4PR11MB1669:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mEH6Z4xIbLLj6aL6OrJ/K+IwhoMKV94wG8+fmuRMWjEKSb9KofwLuYh22N4ZTOVKqrqyyqjGx4Y1y0stCzMk+wDirvqREZHgO0EXT4xOWYU85spTXhVb0rQZbVPyymiJumjvNrN4SQMOptp78Oykiq8Sjv+2tJp+oCiGpEtEbH1+3F0wPwEsvyFPg5sSJhJuW6J0e8Je4c+OhXp7J31iPr/b/3dgsoRzlBuClR9tG5XQX6i92RLBAnQhooNf+eczw37Gsd2rTlwDfsrwMH/zIg3s21Bc/7XnNYQKNr3S93jsZSZ9KPmSJYNbZlwOuCVnIQvDZWWpdLL/pilSth3X1K294/GzJjKsEY8Q8NDLygTEsGG34/YOi9eSrY7jZ6nnmoTZLD0//CB8MXdODcJNWyw3blAyJUnac2f0BfwlOHwCWi31LtLVyUpEdS8GIG5mRPlPw0LGNVhAQkZJvRBNVjrqz1BwDE7wucV+phCsKkj8R8jXDeica6z6IlG6Knzy0GDrOZm2ql4AKkjUio83DzcsJhOX+OfXdBweoNAzonepQHfP9er0CG5Cq9dt+z6SLLNgL2zvzFt5ryN34vQuLOX6LSIE6THRwFP7zqxAafF31W7df5YUhW7PMhb1vT6PDRrb0UvkRMrPHt8G7YBqpqVTFQ0zo/eKXGAmPiQGoFeuwFz96Cnx2WZYqwPxVVxMh+7aN+Jg0xUPPlee2ErP6aIgzMVyw2XpknqVg2ariWqZIMldqv/a6+E1/JKX+H3OIbkpgUJwyxMJL1iVqulGT6RV+R4Uz42oPen4dmkOtqa5bEMDhiIs32SEJ+e8GtiPXOAVzeDuYACiXqVz1f+yJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(396003)(39860400002)(376002)(45080400002)(9686003)(38100700002)(54906003)(966005)(110136005)(316002)(186003)(55016003)(66446008)(71200400001)(64756008)(76116006)(4326008)(66946007)(53546011)(86362001)(38070700005)(8676002)(33656002)(83380400001)(26005)(52536014)(5660300002)(6506007)(122000001)(7696005)(8936002)(478600001)(82960400001)(41300700001)(2906002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODBSSTNwOWtoQWlqbWZtSzNKdEtkUXY0YWZ5bFozbGorK3BnbCtqb1Yvb0R6?=
 =?utf-8?B?QzhBbUVBN2ZmMk9oZ0RpTWk4V21UOUVzcGhOZktnZG81WjVwMHIyc2lDbmlP?=
 =?utf-8?B?eFBSNzQyVFFvOWJQT2VFd3ZDeVhRbVFNMlB0c09WKzE2bmdncU1UL3hML3lK?=
 =?utf-8?B?ejF0Ny9rejBJSExaU1B6VTViK0pXU1piVEp1aTJWSTUzQWQvWC93c1BncTlE?=
 =?utf-8?B?QTBjQWJobmJCUW1HcGQyQ0I1SkE4SGJIZlFRN1V4aWI0ZzBKcTVNZ05KNzJz?=
 =?utf-8?B?ZkJpanJUeng3SWNnUWNOOUJGb3h4aEJGZkVmaUhiSlNMd3Q3a2Fhd05DdkVo?=
 =?utf-8?B?TE8xN21JK0k4ZU1pYjdPZXBZYnRqUWVYNG54Uko3cHdjU1BTRDBuckFJSVZw?=
 =?utf-8?B?WjRjT0l5QVNjNGF4cW9FQUZPTGFkNUI2MFZsV0UvTkVNK2YrOWVQVzB6bVoy?=
 =?utf-8?B?VzVYUjJnWEM5RU92Y0pnbnBtYnZkRTJIOU1xZDJpWWxQNGtsRE02anQ4ZU5R?=
 =?utf-8?B?UEZreXlqWlU5dmdVQmYvRUZMcks1anRIQ2ZRTUR6T1BJZHF5SFZWeTZ4bElY?=
 =?utf-8?B?cU9pYlMxS3N0M25uSk5FcHY2L3M4dzFxNTRmZGpjT2ZIQzlXSCtZOWtwK0lJ?=
 =?utf-8?B?eGpCbEdnTTdjNmQyR3RwNC9paWJEUitydDNHcnIzZTQ1R0RJTG5OTGZ3ZTd1?=
 =?utf-8?B?aFpCeGNmL1N5cm9BN1IrdnBYdHBlSGRabXA2aTZhZ294eXZrMnh6WTQyUXRO?=
 =?utf-8?B?bWRqVE9xTFZwbWtNWTIzdVo0Z0dsZmowdDhtNVdNd0RDNkNpWThVeXV4UzNm?=
 =?utf-8?B?OGRWaWdSODNGejFhN3JEc1ZxSkdTOHFGVnczcjhwUnFnd2tGN0w3SVVKUzRM?=
 =?utf-8?B?VTNHamhGYTIydnh1VUlUMHBzQUpoMFlHWFJPQnBFeGhHWlFYYmhOdWhJZDIx?=
 =?utf-8?B?N1kxNG02UEdWMTNGdEJBRk5icWVwNGlGVkZVSzFWRExmTGJybGZER0s5a1h3?=
 =?utf-8?B?aFduRWJ6UUI2UU0rUTd2NXZUTTRDYTNjRmgzU2x4S3hybSt1clV3cDF2bzJq?=
 =?utf-8?B?UHViN0d3bjI1UkdWenhBVmlVcXFLT2NIM3FBTnAvd3BTZGNCS2xEbTI3L0lZ?=
 =?utf-8?B?bk9sWTJSTmUreEFhNGFaYVlvekQrVE9OdUI3ZHp0U3ZVMEFPV2FFcUk5dkt2?=
 =?utf-8?B?aXJQak5XNGVvWHZWeXp2N3V1RUVVb2JQTnlMMjZJZ25GMks1TkdqS1ozV293?=
 =?utf-8?B?UjRNT0U3cEtpMDRhb2dYSWVSNzFCMi9aV3dWR05oQTRzd1VkcHhCNGExelpY?=
 =?utf-8?B?TXFQcHFucnl6Vkc5eEEvWFlrS0QrTThLdVNZc1JNamtwMy9xNmN2R0xIbTlX?=
 =?utf-8?B?eUdHSy9QOFZnZXgwSzYxeXFESWJRNUJUYkl4TVhPMzlqVVFjM1ErVHpkYVh4?=
 =?utf-8?B?K3VCbklKTTV3NGt5ZmUxVGxjd0NlN3FJdm9GQTlSZ3UwMW5FOEgvdEt3a0E2?=
 =?utf-8?B?cWdFbDRJaThZakVXenljVXRiZktRTG5RcWMzTTdjR0JjUGs5MTRpRkFtMnpl?=
 =?utf-8?B?RjhZbTdkQ2R0R2p2Q0R3UkNxMGsycW9ya1pVUS9MWm9FN2dhTmkwczYrZ2Zl?=
 =?utf-8?B?ejVtYnkydHlMNnRCRktzeTl5bjRNNTVrRCsyNFoyTnkrS2RxQjEwOWZTOGwy?=
 =?utf-8?B?eFVNYTM4REdDbmk2dUwrUGVZM29abk1DWW10bnBkdnhQWlFGMzhMU0dvdmJH?=
 =?utf-8?B?RTJwcytJVDhucmVSMFpFVzRRS0R6NWJDR2xYMGRlZTdTMkdKeEc3RlFmM1Rh?=
 =?utf-8?B?a1k3YmdFNkF3MnRRcTJBWkRSWFowMmJvTEhnK21xUjErWHRNQnA5bDZObXNH?=
 =?utf-8?B?Yk4vNERjQ0lRcWgzM3RjVUtFU3JsNVMvdGl0YkV3Zzc1T2NISjlHc2Z3MVNx?=
 =?utf-8?B?Z1MvOW9CNHp1YnFVcGVYTHR6NEVSY1hlY05KblVxaXBkK29xdDFtTEZaNG9D?=
 =?utf-8?B?cHlPc3ViRC9rL29VcmkxWml1bjFhTm9heXVGd2l2dWVqVEpEK0JtcGRDS2hV?=
 =?utf-8?B?a2w1KzZnRHBtYXhwTk16Q1h6T3YyTW9iU1k0OFFvUjQ1VndqN3FvR0NiVm83?=
 =?utf-8?Q?8CRoiLARxR0QZVcHkbjR6mAC2?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2365a87c-f7a9-4edc-dc49-08da5fb46429
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 01:02:40.5251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ql/ggGTd/eq5rV4iMD1kwBAsQiIFg1XxzmFMuP+P2JpBgUR7fduEUjjpT8yX3CEpwbx6ay7I29Oc1W8i7aHtcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1669
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>
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

> From: Baolu Lu <baolu.lu@linux.intel.com>
> Sent: Sunday, July 3, 2022 12:34 PM
> 
> On 2022/7/1 15:58, Tian, Kevin wrote:
> >> From: Lu Baolu <baolu.lu@linux.intel.com> Sent: Wednesday, June 29,
> >> 2022 3:47 PM
> >>
> >> The disable_dmar_iommu() is called when IOMMU initialization fails
> >> or the IOMMU is hot-removed from the system. In both cases, there
> >> is no need to clear the IOMMU translation data structures for
> >> devices.
> >>
> >> On the initialization path, the device probing only happens after
> >> the IOMMU is initialized successfully, hence there're no
> >> translation data structures.
> >>
> >> On the hot-remove path, there is no real use case where the IOMMU
> >> is hot-removed, but the devices that it manages are still alive in
> >> the system. The translation data structures were torn down during
> >> device release, hence there's no need to repeat it in IOMMU
> >> hot-remove path either. This removes the unnecessary code and only
> >> leaves a check.
> >>
> >> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> >
> > You probably overlooked my last comment on kexec:
> >
> >
> https://lore.kernel.org/lkml/BL1PR11MB52711A71AD9F11B7AE42694C8CAC9
> @BL1PR11MB5271.namprd11.prod.outlook.com/
> >
> >  I think my question is still not answered.
> 
> Sorry! I did overlook that comment. I can see your points now, though it
> seems to be irrelevant to the problems that this series tries to solve.
> 
> The failure path of copying table still needs some improvement. At least
> the pages allocated for root/context tables should be freed in the
> failure path. Even worse, the software occupied a bit of page table
> entry which is feasible for the old ECS, but not work for the new
> scalable mode anymore.
> 
> All these problems deserve a separate series. We could address your
> concerns there. Does this work for you?

Yes, this makes sense to me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
