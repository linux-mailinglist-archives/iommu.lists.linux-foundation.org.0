Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634E561515
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 10:30:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD8F41B60;
	Thu, 30 Jun 2022 08:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AD8F41B60
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMu1Gtt2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LA7KRKTr2and; Thu, 30 Jun 2022 08:29:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1FCDA41B97;
	Thu, 30 Jun 2022 08:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCDA41B97
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF798C0011;
	Thu, 30 Jun 2022 08:29:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 234EAC0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E667341B97
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E667341B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LT7MG6RQSIoO for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 08:29:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF49341B60
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF49341B60
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656577795; x=1688113795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tf5FJYcVhSZ64Hgi69WtbXmPLNX2PQlr/xut/J8NP0c=;
 b=mMu1Gtt2BQyMpuP5nr2Lhdqz0k+Vx8Xzr3Poooivr3MemsEviO951jP7
 yucS9xSI4XfR2flPhcrIm3VVUZmUYwcFbUtllJYm45GdZZ2x3F4eBfxCI
 AY0siJgJVYRh/7n+E68JSoNrcqqFMwjW56yjpKfhhP7fqOFm+fjXw8cHf
 cPYt0E4kOH9MxHihHna7SRmYH7Oj0PXAhoIw4FCzJUEG41WQKqXxrCyCC
 Z1NWCLgccIUYOAnvCgwjer7lDW9VuMqyOOWu7noYKWs77Ntj8IrXOxGGi
 fXq0rZ4+iom0TkTMu4QNkmyUztMCPA0W6ynujUdqcFyMjW2+yGESEYp83 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="271053142"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="271053142"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 01:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="565768372"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 30 Jun 2022 01:29:53 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 01:29:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 01:29:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 01:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ/WxUSGAVy7Jy4pPwV0AWgkMaRpz0m+ZKvvGG8AdWiFkOLZ/i3vuudfOMdfpRbyasAe8U+FyRLJxZQVEfniOYckMoXCKulgjdP62u5Zf6LUQb4i9WeuWBDA+xObl30Fqxkm+e0cWHcSqOGiU3Rmh0l39q+/vWsBdGcxgcBuYEFCS/r3dc830XwXAk9mvV/8lceX2docV4AGBmGCR8lJcDVDRxxGwfXoytKN/U1nLbW1iypE1O7uETBXMhp+sA6UQc13T4lPsvAn+MoN9T458jUMrA/ooW6UHQn55xEFimHfipiSpMCfyTLAb0q+r9n3iv/pi5SbPRsg2unbgMsrIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf5FJYcVhSZ64Hgi69WtbXmPLNX2PQlr/xut/J8NP0c=;
 b=io7CekFRMpkBRLEAFrCHPx9qYGk56OvTjk3INeYo5jx07RAZkxsVhYhDXGyAXbrx2WH4myMgphFrb/2vMV5HrmwemqIBaaIxIzvRCJMNMqb+Wkrjmt5wBVwsg72N3ws8Swy+rmhSGQcfB72UuM4xTuha7YWXHPNhJtS1o0Vf0xCRiDb84KeO85Vqyy2o4UEEEXuC8rNL9Q/R7W8/j4SoEXJqEt60Ks/GJK+UTqO4LY99GGMFGbDCnLEp60TgVtews9DNtWncPY72N+azeptZBcndhYoRc6i7uw+PuDLn/2pJikaV4uOzVPI4cN8+vetlNqFGwuA745xuOs/RZbE6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB3413.namprd11.prod.outlook.com (2603:10b6:a03:8c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 08:29:45 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.025; Thu, 30 Jun 2022
 08:29:45 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Steve
 Wahl <steve.wahl@hpe.com>
Subject: RE: [PATCH v1 5/6] iommu/vt-d: Remove global g_iommus array
Thread-Topic: [PATCH v1 5/6] iommu/vt-d: Remove global g_iommus array
Thread-Index: AQHYiJMLbEan5IpEykiriMcRyEQqKK1npdxQ
Date: Thu, 30 Jun 2022 08:29:45 +0000
Message-ID: <BN9PR11MB527684E417F3A2C8D94BA9B68CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
 <20220625125204.2199437-6-baolu.lu@linux.intel.com>
In-Reply-To: <20220625125204.2199437-6-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dc68036-32e6-4c75-52f3-08da5a72b03c
x-ms-traffictypediagnostic: BYAPR11MB3413:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3AdGy2/9U+g+7yBaXNE16WTjNAazM9Zgc3uF9BoTdNGVOBA6nEcf8AomqEnAvefQx88kdFkh7kLRPwW0kcr1F/NHLW8mlNvOaiMDTbYS2dHnHZuRXGWHJBUZqx1Yvd/PPrzVfNTTPf4fiErowdnLW141V0wme9gm+WuL4VYnu8x4Q3lTGf/QVCvqinuajtvl/WQHFy40m6W3DB3B7L7PlwYtFHjzYIJKg8dAAPOz0fx4/AOfLZ0BKZGvtbTBQjV9uMgLG//XJ143cIcA793JxgwHbw6NrN5hMlFkzRUN8xWzu8Hmw6bW7SfbwwPovsTd3QgB1ppw3F3UcHlldkpbi9qoj6IcSRgGaHRHg7rr6PRHv7ZE5c2GIuqZ3peM3wQvV3dsVhyHKESAZu6Nt4Sgxn1ri/X+IkS43BnIfOSw/jhNsrQjXFzZxtl/+cKvoqCV98DJRzwDm6xdaxd2czoXMSAoyZruJeacGSyfn7Fut0xWr/t6/iSaix9AXl+0soA/ZjBQ2My5X/gjV9F4+4hhsOcGGiGX22ImO73WdZPJR2cd/tDVAeyVWwL8Oo0HuqUxbH1LhB+wZlLzxzskKyti6LToFCJf9ZpAiykzra2P8RkEW2QocISFIqWRkgYHcIkglyiXlj/yvxErKKIuB/vXQWGTOmMFGpOZS4baGmomT/lZj6HGc9KRv5NEMRnUqAwV0gTaw2CBAWZRLHsVXygfyjlmUVwwB9BFyF2usyqDOKVCsFuA0BQFZCRtxTgcicNwvimxfOtI2GBZSUD7F9tRzOC7/QnYNEt9g9pdOzqENc2gjopQ3EOuHuofNX/L86hd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(136003)(366004)(7696005)(33656002)(7416002)(2906002)(5660300002)(55016003)(52536014)(54906003)(38070700005)(186003)(64756008)(122000001)(66446008)(8676002)(66946007)(8936002)(26005)(66476007)(38100700002)(9686003)(76116006)(41300700001)(316002)(6506007)(86362001)(110136005)(71200400001)(558084003)(4326008)(82960400001)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JYtY8CK3aXiI5WD5NRTKMdBLyCOatDj5JZDStkxLU3U78jPki1WkeYkoB3SE?=
 =?us-ascii?Q?Ju9UJS2quJmCc51ng+UBJsUd1JfQMQWhbNhXf2V1TufTCP0sx1q9+kqM3Whv?=
 =?us-ascii?Q?AHUFFY+yzPZNW+fq3uAC2Vsb0/6KT5yrMaItVk9kgRhSLkx3PaVTLQMioiyM?=
 =?us-ascii?Q?cpE3dgIfykEBVJG7K0qVig25JAQbJWeIHHiL/vggw+lPADMxpeEhyvycjPCm?=
 =?us-ascii?Q?qLcjyoCSisX+u0ldrC9UC6uEYstyVpS+3pqtV4GD7qrmvAbN/KQyExkOwCMQ?=
 =?us-ascii?Q?ZhRbVj1OHI4QuUEVyP3EC/9WZIl/C+2XEw2geFSOuF8J/FWp0vTHqYW8a4IN?=
 =?us-ascii?Q?KZOgcFnTkzoDYHtbjOI/eyO0dukQM8A0WcHNB/CejPvzCfC53ShohMDEM39r?=
 =?us-ascii?Q?I+cQ++0Dsl07vPqm3IA+r847QjJwQWlF1CffECE1GrQ+xGf29N7IbOB3c34j?=
 =?us-ascii?Q?K4i6tY8fUreBSo54NBhzlr2lLLUej6P9SihCXToOkuOJSwVaBKNIZKmQ/Oiq?=
 =?us-ascii?Q?BM2nwEJoxuBPH1ooMFzOEqMeyNn9HCybTpykQe7iZ5+7AX8aSudxI4GiuIGu?=
 =?us-ascii?Q?2Ivg0WafIuSw39G1b4fkCtBAPdhyJbyu17s1abO2b1fe68N800XigN3paYop?=
 =?us-ascii?Q?ekDJg5yMEtjKG0/2fdVTLRqHdSYXmDKSvX7YVbqcIA6s59quwc38PbwCqQLA?=
 =?us-ascii?Q?7mxIpTVc6ioCUVHekUeaK0O7iuqexjsIXaqRwMAJHeD9zdohpqbDQVXoRMLM?=
 =?us-ascii?Q?0grjyNcc9HIKFYFIpL3spnM3ViCVSJSvFHtNDy0AN/uqp7kWX0r7o/uP4Dl/?=
 =?us-ascii?Q?K8v3PoFhfpOG14zh8x3nHLU8RLa70RQaJn0sHda3WEN6L/3MVhFo4IxmLs+F?=
 =?us-ascii?Q?f/cU+xMWHE/OfGjPXUFRuSnj93887Z+VExd4ezsQRKGkl2P77jI14vrH/ydC?=
 =?us-ascii?Q?nsoi8LiauQ/rZ6gwOM272fPS8VRBMKYXvpTvrX2zV0Grbd0HbF8oTW89T7Fn?=
 =?us-ascii?Q?Dk6iHrqp448n1oZ0U+30EJqv4+KY5IUc9vmGUNYwAcv4wwnFoHEvKWUUSspq?=
 =?us-ascii?Q?+RLJ+YaZVWQGDvEEtEvVMwNLGo5wGeVfOuWTQvdEPgNzrCOf2nbscJvkaiiR?=
 =?us-ascii?Q?wKi4nJVivSux/fh+111Dzl8SPa48gTz85wNy3qBXqWOkhyFNUQMSKNOD6Yn4?=
 =?us-ascii?Q?I7Ka0Kx1UbjtaEa/lfLiLB90iOgpS81FZ0ZWaj0vzkOJI7euGQ0wuJFsL1eT?=
 =?us-ascii?Q?9bALFOJYVaieA6aOG/ZLKYiurJhCAZT3R9o0V6A+6/3J1OzPzA7nPDrKiqqO?=
 =?us-ascii?Q?zWJFF2zKRhWsMWlaOjDuJV6NCI8hz0Hw1NDofGkZskAxLDxiNUDhpIv4MkYi?=
 =?us-ascii?Q?Ns7lEhatLwErbL316Vz6kG3xRlF2tcbbXgkkFMZ+JfhE9jLP7wcaXkUvw8+D?=
 =?us-ascii?Q?6pxSm1OsF1Mu4aeA3/uKbzA2H5JVb24ngpksKqQ+3wEgzQixCWpCM3VeWo++?=
 =?us-ascii?Q?8fFXCnoahdVHf7p3mLL11LjTqQDvWPkISOfWYxH4T5il+bou3U0Azmd95hPE?=
 =?us-ascii?Q?P2IdEVB2vBS7pZuYFgoWi0D92Wc59Q6XXzE7Zwcf?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc68036-32e6-4c75-52f3-08da5a72b03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 08:29:45.5549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nkut1nlBQhSMOon/SkZ8bm4QwLLxsGlkqkndjzqFpdZDrdVNlubBl221IETs8II2DGdTiwY/skFEiX5qaDl0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3413
X-OriginatorOrg: intel.com
Cc: Dimitri Sivanich <sivanich@hpe.com>, "Anderson,
 Russ" <russ.anderson@hpe.com>, Mike Travis <mike.travis@hpe.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
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

> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Saturday, June 25, 2022 8:52 PM
> 
> The g_iommus is not used anywhere. Remove it to avoid dead code.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
