Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10E4C66B6
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 10:59:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D50DD40438;
	Mon, 28 Feb 2022 09:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT57E9epXqT5; Mon, 28 Feb 2022 09:59:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 72FCD40180;
	Mon, 28 Feb 2022 09:59:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F634C007B;
	Mon, 28 Feb 2022 09:59:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DBD1C001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2678060648
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmhpOD-V2YHw for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 09:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35665605E0
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646042350; x=1677578350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rssf/T50lK+5WlSwF5DHTyrsSEqOzMnCfT+cvXn8RuQ=;
 b=Z8Ksjbrfp7nYsmp1Cst6v80S10GMBN3WJ97mzH/CG+MYOBbLJMxuJz4z
 WQLxIjrskH9I5kejflQfRgVx3SgodL2WIQl5y3frnMViZZlU1pdrfliRb
 8vJpTNm5Scy94UQi25LFfc/z2eyY1GwHe3s5DIGkrn+DevP40/3BjFUi/
 C8qdqFiOA9kJMTPaq7l5GQd8/wyB5DrvbYdQw0697zhGM7rZ/EnT9Nu82
 VAfs1E/Bf/vWRBzh1pgDn1dNP4TRw6WrGY3nseXn9csWJpJj1+B+ABijy
 g2IYRVvFiR+hCevBZJ6QccTudvwTW0oUT+AZgmI7qYoD6Xif9aFj4o5jX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="250430860"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="250430860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 01:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="593172490"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 01:58:54 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 01:58:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 01:58:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 01:58:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcJx5FF8jprHFoav+7aWkSSfvZnqQNzOcmifoGOBzQwxD5d+/6V7Ldbe9EMzRhnxvvRBwxgLb/EOFwxQo0rLOmDnccWHZEJ7Z80FRQ5mz9Q5x//YwKdWErASh15sCnNVtCaDuMcezI453ms2w13hJK1Uw7+Jt7V2vxE3gxgZvgdGjczArGSYRNbq+0AC0hoXDJWWElDJo7WbgwwHtsxQSgCy8WigVDir5kO/689a7l/f/mv0c+QlJ9RWCg9wKc7tmLiygJGWCbhc1bUBTiDmIjnKBJp6J0UILTM7ZvJKi5GKwt8ISQvurpIBxlSlIyIJBJJFRqRMJtZX5Y+dG2aBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xH7k5fczxvuUPmS2epSNcdk42GQsVU4Nn/Vw/gS/N0=;
 b=aaYTxrpWPaK1m1yjCmFNQdwH4HWfuVHxWvTsJz+jX3fkjlAVAdigDfUX4uPZb36WH46vfjyEsMy6gCpgw52hB7xU9Ve55KiRC6PZxgEtxnIN4Bwz5gkVNg9fe13XHrPjZIipCO21boXaqTrBZi4E+oxiJmCd7jsPjo3gP7tMjikn04scCdOOv9ZTQO2Y5AI+Bvltl3roE2oyW4hzANXZ/p1h87KXnBKOj1x7SSPUTkhxoLQXxnhhArUXLQ6E+4Axrp+mIKzIYoN1iD3ovfFBsU4ZFWsujyYRQ6/U99HmCjRxwlksh7sGMze0r7XDYNBuSHW4WjHJ3cHc5mJed4Xvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by DM6PR11MB2666.namprd11.prod.outlook.com (2603:10b6:5:c9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 09:58:51 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::e435:95a9:4a0a:8e67]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::e435:95a9:4a0a:8e67%8]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 09:58:51 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH V2] iommu/vt-d: Add RPLS to quirk list to skip TE disabling
Thread-Topic: [PATCH V2] iommu/vt-d: Add RPLS to quirk list to skip TE
 disabling
Thread-Index: AQHYKghOUzRlwYg4tEibIVSDXrxQsKyovw7g
Date: Mon, 28 Feb 2022 09:58:51 +0000
Message-ID: <PH7PR11MB58197AFE77EC6CCD3FDD1D31DF019@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20220225051317.152960-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20220225051317.152960-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
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
x-ms-office365-filtering-correlation-id: 8fe2322f-89b9-46c7-5868-08d9faa0ec06
x-ms-traffictypediagnostic: DM6PR11MB2666:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB26669EDFA9263F149644A6FFDF019@DM6PR11MB2666.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPM8JBAwN1f5Zh/7plqf7Kx4SwfvsLxgEDTPfc1sUJi+TiI3jKAMECuHczlzZhBPNJpNZmEtDq/UD9LTQj6gatj2p7HUYjmAb1yZB+8DopVtCQjZWIp8aiFX3OzHYsnAEaOe78P8L1k3BlLbPNFrZR7bJj6hNYiaR5Dg3+o6cQPfkcXTVdhQPHPG+8VUqajV5IFIHnlERKEL8rDr3YmAT8c14+LPwW8UMpZk98VRtsqGGngnPdwQTkGzLvPzFBqgG60Pd1kjHTQTRNJ33vUxfzFG0JZlhNWAd+SfSOgmWUtudyyiAGUZFJVOkuJUu62wzEFJxlxQ0/Uqzy1BH2nE/aNwJ1UJEQ3D9AYzeKAeV1ToCQ1hEhp+OtcmX8mso6DOsP0aDnOJiBoHbIaa+/dEQcJxBxyCh1McDVU3CxuVcOsx3HpOMCN7ICywWxgvnd17H4lv1qzeELgGfABYj9RSb516U2ot9IH9oXB6iWXUjFfU9/xG6KekOFOh37cAc5glBS+nD2KYFFw8+YWYK5QaPN5VtH7cZfy8J+gq2hbNMsrGrg5/wwxO4oagHrQoAfSj7WDQ0uA+Xsiq0ZDygpyY3tICSI878AUA9oKMlRm1Ki+b5n+HKAB8H2XP9rXPtD3TlvZ3BuuR944C6LseytPsOw5LRykiKDbbJicHVw0Z5Gso603EKO727eNWet5Yk6RN3NwdPHAFyqClAc4ENzFs/3TIebeY7SvwNjilLI83X0RLX1TipAZ3rBEPD5rNmqd+krMagrogwUQfxDeHLkOOXmEWUKrhb9xm+q739tXykz4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(5660300002)(4326008)(86362001)(76116006)(66946007)(64756008)(66446008)(66476007)(8676002)(316002)(66556008)(54906003)(6916009)(26005)(52536014)(38070700005)(55016003)(8936002)(9686003)(6506007)(7696005)(53546011)(38100700002)(71200400001)(2906002)(83380400001)(82960400001)(966005)(122000001)(508600001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wMWmlqz5u90nnydlBoRrCct3IKO5lMWToyOeCuhDJHFvodTL1yFYpsiu6ZWp?=
 =?us-ascii?Q?8sjUu8KJTVL/6/nPRt/3Hhqlb6XZS0adR41DTAO7+Ng8t8J20Pa3lB+ZdFKh?=
 =?us-ascii?Q?NZpzDVdsrskpjDK/aBEGxf+t09Dhg1XoymTWpEjnKyjkvPGKvGrGtjBqj68G?=
 =?us-ascii?Q?nSLlb149rT/baMNVCmF1GEZXu8VuUKcjwUBvPYez8Y7jnwmy8ukTGwK8ANLX?=
 =?us-ascii?Q?8QYnFGVbf4IloJlk+7lpeei54hFyzGbXs0QoyjUYFmRTy+xRvG8JErBH5dBM?=
 =?us-ascii?Q?GOT/rjjqcCtzAKUtOXQZYWYJ1ftkNLjpbLiCtX+a+S/Vey3e9hCzaDC/Uys+?=
 =?us-ascii?Q?6Uk3jjJNJ6lwJ7nvuuydt1x0JfdHE3MaMJdFzhN6DDRZ7B2Octa5ntl0lSOF?=
 =?us-ascii?Q?gd1vVV6IbmIE2jZcWX4aWgaHZPcFlfu8E68CISbr2grHQgC5JRWrvg6Wqpyu?=
 =?us-ascii?Q?a+XV7Iv1sFm3UXLU2hA1vKO6+JF9GlUnrbcRFZsQlyfGOt8MWHQkGKqlTueF?=
 =?us-ascii?Q?C+l//KX1uvCX7L2yVJFWpQZF+M68N4ApLTT+WUqIO3gQIuy7PWOyJEaghkaL?=
 =?us-ascii?Q?eumcoq4UJKKxj33/lz9hQvJpm0KiLlZi0PckCQ26Ufq3Ne0QmtwIIxF009zw?=
 =?us-ascii?Q?mq8ZnnmEtWgbd3x6bX5JQP9VgIgAVkf3a/REln6tv91XdFFbd9mtBUbp20eY?=
 =?us-ascii?Q?50iz0uLmwJmSbZ5KrJMr67lyRtvU+ozyv1aAFvUGWjn/yTHv7FvjDWMSkgeG?=
 =?us-ascii?Q?yVkJ5Qw84CbEuR19uKg1s2ew0S0Qp91PXXJ1HEkvxcdRlz2oTAe6Q5kI24ba?=
 =?us-ascii?Q?N1bmQFcd15vUnMuIDZ5A+s8lHlajL/pphe5ygq4XLTBi0t8yOCJLEIOtTxOY?=
 =?us-ascii?Q?tcYyIBWSt1HWpBE2NHmhe7L+3jc3OvW+UUGAy3/AvVbOq3Gd0mUo6ROkLcZP?=
 =?us-ascii?Q?VB4THjqFJ47zv+VxKxSlqXAwlp1VpyDS/F74naeHf2mUSBClWld09HrAUAq2?=
 =?us-ascii?Q?15DaCXg5d54Mh/rSrAk6vOl8YleoMAgHi3yk9qhVcirqfmXFiedRUjteZ0ac?=
 =?us-ascii?Q?NQrBwLfzsLo1sujf6xhRHZi5i7zJTA442Qg7hEl5dp4OlBA5/dMrU7r8jM7r?=
 =?us-ascii?Q?gP4XHlgo0+5qTE6e1uy2Hm/gxTKVOQdhnCxMYtdNfgkJZ55Mj/FMHwNWhIiV?=
 =?us-ascii?Q?Z6bqPlfTflwLBCVjP1V3G4KuLKn4G8TNneTOpGk6RZCkZR9Ss9pbtF1ltAot?=
 =?us-ascii?Q?75EsPx4BqvZaJeL5YfkAnIKCoABJEGS9qp8YVE2+dSVkIjHmnodSxhTvKVVM?=
 =?us-ascii?Q?RsupMi87Zfs8EISmEoSEXPOhNA1JrrkIbb5TrsvV9h/wOUjyAb2hd6uQ/Ru6?=
 =?us-ascii?Q?/3FcusdyXJLujpfVj2s6+eQPKwmE+FuXy4UnTWriYTlRBSKlHjmmgwZbGeVV?=
 =?us-ascii?Q?LQIF7fk+E2G0g72FuPtNCuQt+7RBkDFRIoh+BQXB36gVasIH7sAW6lxKFqdD?=
 =?us-ascii?Q?a53d4EHbFDaDeOjc9/C0xYSf6Eme06yqB1R7BtJmW1ipO2+NIIKvbPEDC5FY?=
 =?us-ascii?Q?fwaQ8+GSVv7hP7q9LzjfhvJRUdM9PqmwsIxVMYVGloqsS09IdqyzM0euYHf9?=
 =?us-ascii?Q?nBcgF+qpGFYPtm/O9q9gJMdQpWd3lkg3fH3rnZvpnw/J7jVnUGnrbxKUdB1m?=
 =?us-ascii?Q?ajG4wuJn/Uj14amhRlxAkPFcUasdQ9C7cfuYGWg1OeQd4JdzhN8gJWgKiyiq?=
 =?us-ascii?Q?QQEqueTDX1V1KFNYEniR+aocM4wR3YOoiiGe4hRHmF17Bazn6vUvXGcghyPK?=
x-ms-exchange-antispam-messagedata-1: BnwFi1WxwyAW3Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe2322f-89b9-46c7-5868-08d9faa0ec06
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 09:58:51.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcM8RzWdx0w0fi5fUI/nN/XeSN17EwVIc7dX9LJ5bG9hW7AC9MPVcH25EktX2VDu7pNStun4H6ypy/rFM35+ghWhFtlSk98jUOFvP6SixQkAAMl/k/pTsR6p4OuQ8pSI58i+yQdRAmAOAEKLQLI7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2666
X-OriginatorOrg: intel.com
Cc: "Talla, RavitejaX Goud" <ravitejax.goud.talla@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
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

Hi Rodrigo,

Looks like "Lu Baolu" has acked patch here https://lore.kernel.org/linux-iommu/20220223062957.31797-1-tejaskumarx.surendrakumar.upadhyay@intel.com/T/#u . Can you please push it in drm-intel?

Thanks,
Tejas

> -----Original Message-----
> From: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Sent: 25 February 2022 10:43
> To: iommu@lists.linux-foundation.org
> Cc: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>; Talla, RavitejaX Goud
> <ravitejax.goud.talla@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> stable@vger.kernel.org
> Subject: [PATCH V2] iommu/vt-d: Add RPLS to quirk list to skip TE disabling
> 
> The VT-d spec requires (10.4.4 Global Command Register, TE
> field) that:
> 
> Hardware implementations supporting DMA draining must drain any in-flight
> DMA read/write requests queued within the Root-Complex before
> completing the translation enable command and reflecting the status of the
> command through the TES field in the Global Status register.
> 
> Unfortunately, some integrated graphic devices fail to do so after some kind
> of power state transition. As the result, the system might stuck in
> iommu_disable_translati on(), waiting for the completion of TE transition.
> 
> This adds RPLS to a quirk list for those devices and skips TE disabling if the
> qurik hits.
> 
> Fixes: b1012ca8dc4f9 "iommu/vt-d: Skip TE disabling on quirky gfx dedicated
> iommu"
> Tested-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Tejas Upadhyay
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 92fea3fbbb11..be9487516617 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5743,7 +5743,7 @@ static void quirk_igfx_skip_te_disable(struct
> pci_dev *dev)
>  	ver = (dev->device >> 8) & 0xff;
>  	if (ver != 0x45 && ver != 0x46 && ver != 0x4c &&
>  	    ver != 0x4e && ver != 0x8a && ver != 0x98 &&
> -	    ver != 0x9a)
> +	    ver != 0x9a && ver != 0xa7)
>  		return;
> 
>  	if (risky_device(dev))
> --
> 2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
