Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48C539FDD
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 10:53:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CA360D67;
	Wed,  1 Jun 2022 08:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgJd5RV8PSaO; Wed,  1 Jun 2022 08:53:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F35260AEA;
	Wed,  1 Jun 2022 08:53:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6A8EC007E;
	Wed,  1 Jun 2022 08:53:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52D79C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 08:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 410CC826D5
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 08:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPppRDeZtaON for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 08:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0716582512
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654073599; x=1685609599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LKvBeJ2aflJAlCYYauhBwmhY0lYB7EyVZ/ol+ZWZ8QQ=;
 b=VEhuf9erhRFS+IB0HFgYGhyUwLs4P4iJLxdutRJkwTAvrFWEnLLtEUlu
 tH703wDGlY0MZxH7/mmHHPI4XLy8InVSFHUpuapU6Ss6+pBPNQ7WB+2/2
 3ypZhDURXg0dDWqHu0xDCn19WfxKO8cnAHXokL0UJpl2Ct+zITFQa7U8P
 I3UgaaV1VEXN2rpCehXEi1jP5cU1kBIi+zqiccBOLsBljn2naCUHfQDEz
 Dyp3pG6w1OiwvJbEU74lrLHTvXhapoC58WcLbzf/QbndlUwknPwNGa4Db
 Ewz3i8B4ra3FU4BHeYXMZ/n5O3c/VB9cKTNwK5QRQFsJwuWpUM7vaeYrC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263158920"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263158920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 01:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="612235280"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2022 01:53:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 01:53:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 01:53:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 01:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4v4rbK60J/qdPlPeMLtXnUw1Dx4CmxxnKgCYN/4MZiRrO41dIzZlFqJQq++OVOnaj6o7JN0uXE9SuQ0fJPO4ew1vpAg09tDiUWt3Rv+KVge31qg+S5CHTFTs7KMN56oQSR261Da08GOaO2uwO+uiczvEo1L+kezAFmIvXHAMryPuqJN9xlSBrFk88BPx3jeDCQlHQ94SP4HGdd4ZplHw03XWaMcFMtLFw/N1056nKBfEN63xBbN2C1DQcW1HjMhcO0ZUAOrINY0utpwRUZzN32P3PkC4f7c6XlP+NNwq+WkMP+0wwoFrxX0Ww9AzBLfHyPKT3MXRdtD7BBli2Lezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2CzD+i8zxqTDqrboHLGlwMfA4JLIFskJqZCHVramxo=;
 b=T9lpA4gedgO05donq1Nxgf7smddy8a76zrlFJKPSI6PnV1p8alf4fMrWQsj76MHLYLXbVXOf7w5FkW0YZQAlMqXH9lGKoKJuvHlIAD/geFb+T5B3oBcU35MdTKO65i5J09Ys9Pw/XQQhqcJz3+ZgdkPCQ5rw00fPFN0JuVQjnB2+AAY7edrvi9fjXeZgN8eWWSzCzMXAhGDGGZo+LHR3tTgTU+2Wb5rVjBvVaaTg23ESDCBPef1A/J19T8RoY49/IvOQ82zipQhw53URnFRV/KxtJvTemVk8sBnSkaxG+dVT6975WSW/TdKOM+gvU7Ij4unLkVWMGvQZ+0wUy9cpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2368.namprd11.prod.outlook.com (2603:10b6:300:7a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 08:53:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 08:53:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 "Martins, Joao" <joao.m.martins@oracle.com>
Subject: RE: [PATCH 01/12] iommu/vt-d: Use iommu_get_domain_for_dev() in
 debugfs
Thread-Topic: [PATCH 01/12] iommu/vt-d: Use iommu_get_domain_for_dev() in
 debugfs
Thread-Index: AQHYcZPDpuO7U1UHvkyjRowkLEJ3VK0y0XwAgAKBYgCAAgeFAIAA+BQAgACqFgCAABDjAIAAC6eAgAACQACAAAN8AIAADXoAgAAFnQCAAB2GAIAADDEAgAAqSwCAAB41gIAAoRYA
Date: Wed, 1 Jun 2022 08:53:14 +0000
Message-ID: <BN9PR11MB5276CCB7D5158C028AD40FF88CDF9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220531131052.GD1343366@nvidia.com>
 <60318d83-e22f-f922-436f-6c31bce24d59@linux.intel.com>
 <20220531145301.GE1343366@nvidia.com>
 <a7d6d830-cb06-e0d7-0688-028f9af900e5@arm.com>
 <20220531151332.GF1343366@nvidia.com>
 <b66a2e3b-9adc-5150-fe00-d68b141b1c28@arm.com>
 <20220531162152.GH1343366@nvidia.com>
 <10f16c13-c50d-892c-a20d-979b2135c953@arm.com>
 <20220531185110.GJ1343366@nvidia.com>
 <56bbbad7-bcba-a440-692b-64e50b4eddf8@arm.com>
 <20220531231039.GO1343366@nvidia.com>
In-Reply-To: <20220531231039.GO1343366@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b9e6fc8-4dfc-4902-0272-08da43ac29eb
x-ms-traffictypediagnostic: MWHPR1101MB2368:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2368173C36145FF9F2232F468CDF9@MWHPR1101MB2368.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bB9PC2on31ZXNH8JTS+GLnSdmzdy7AxT/zS68X01qO96C/4v63gGsRC/+fMQWSPre+6sLmZTPpFzIxPybshkt/XaamzlIJsXtL52lhlQneBDx8R6raQl0T6JWDEzOAk/zCAkDYqvkM0NzE/lxjMUbE1btdPW+4tB8aBcKwVAy27jZwVYt8b2+hKqolPTEoPKuAJrH9fajGsayTDoTNTA1hp294HA8nK3VJLUGRpQkQMIZUwLGhpookzl7dyRz1XvGkoDNRGgNMYLv1tEVQUdG6EPKYUyaXaTL5/oHFBRqTbHQe5BIHKEFiatX3hN24Z1dkl8FpmWOay5yR0W/aBWDXJdTAk+TFD5CsAhmTEZswUE2M9XD1+BWzZ8x2za/jf/IRBRoFkCrd10QbGaP1i6qk4C8r1RVAwX9Eb/AEEsokn/i1E4Rs+47620JMvA5OHAVjXBe7AxiyvD5nyp6xW+0f2TNdvlIWlAloizkyq8/6VA6N6JbCoMfjm5PzEsZlFO32NiKF2wnZaV7q0ojpukICjn2iC12FpqUg1jtVo7qSlzVdILqQiy7WAvfhtKFqilb24siltEcBmR87IFxulnOjhsFpLr99ChiTilqSR3nb2edaevfrbPm4zhOVOsDFeSOMapfdLR8lXWmgBMNxDY5XqGOw3VbnKJKPbIgS4xrlJXJFWAXQcMeAceletEdoS72CIPKYR05o31d46F/+ED+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(5660300002)(66476007)(8676002)(66446008)(66556008)(76116006)(64756008)(38100700002)(8936002)(4326008)(52536014)(66946007)(186003)(508600001)(71200400001)(33656002)(7696005)(26005)(9686003)(110136005)(54906003)(6506007)(316002)(2906002)(82960400001)(83380400001)(55016003)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L+I/nJtI59JMrNY0FwqnVnhBsvhppeedAvxi7CemtNtAz0yVn0hj/kooxlXX?=
 =?us-ascii?Q?pIVOtLTX6ltFJPlrzf8wKIOlonG2Fei1g0DNCRGlV9DmqduyoHOvNGFqLkvf?=
 =?us-ascii?Q?qkmoXr2O8y8x7r5ovVRC6uDD7K/Y9x0rxScXZBwz7kTw2fiui+/Ou/Og4T03?=
 =?us-ascii?Q?YIwu6Y0jOQfuWYjgxjs7KY4bLIm5LmAZUc9GG3GyBOgwQrlAz1uvH3V77T2w?=
 =?us-ascii?Q?5fFRtb7IJNOSicAJpetGQNIXs91e7kZvwWOGHikJtg5L3waY2JdaYdb+Pd3h?=
 =?us-ascii?Q?pORt6P7PG7ApCJZm3oHCo1fYAsJNOAILisvTm5GI/8XI/rHLUq7JGjEv7dR8?=
 =?us-ascii?Q?ZBMbLFFjW1s3IbX7xBpSJmJ0W9VIi7JQg4GRPxoB8AyHB3HmR/bY1mhKD9x+?=
 =?us-ascii?Q?bbOZnP6XiTSiu+mkVAMaVhBMIXtwbhDmd331nyuVjWSgtmhZ0Hc9yO2SZO7q?=
 =?us-ascii?Q?W8zUxxDnys/wamEnzsEL1ojGF8gBRsbK9E0lLsEjoR08qL7Dv5CevK2EgssS?=
 =?us-ascii?Q?N5N6IgWI1ZOEYLA/BT7YAQLSWpszeUCEhVOJvUtAu/Q9+8JiQQKtRiR+q+Ke?=
 =?us-ascii?Q?AgviWfwT7n7ewmzxn8sFmxINJU0lzhMskPzpIagIXGnUetRlMYcEomYR0Gt5?=
 =?us-ascii?Q?Ev4lX+ms7m5NQU6hUvqp1O/pRwq89mukny6nn5RzMm4z1fbeWrbHFiyGula/?=
 =?us-ascii?Q?9hXRg0g1Mkm6qjUtBzGSUAwuP9o+jor8E8gq0UF9wqdbnOF4lNfmdyoTkg2Y?=
 =?us-ascii?Q?BqmEl7nM2Lix+VPbFz2qdQBGOhYswrr/u1Z81hYwU22xFZuT9O8bcKmkhZAW?=
 =?us-ascii?Q?hCYetvTrJ/SO1cKSFBNpOEEa4jAGqTWTR5zB1StaTj+Cw/qAgmtNpM+EHuy9?=
 =?us-ascii?Q?wjoMtS9Wt7Zreuvlm5SMPACV2Sx0SzabAUbN9QXu1RC4CApFak5prg8ttdXK?=
 =?us-ascii?Q?SbVYFsZJaiI1JVAKaFSG+CrcPUmapEdilP0D6cb66ay+qvDJlodCDAwxYoe+?=
 =?us-ascii?Q?3idVTkMDL7GicCiLmBK6rDL0cCH6nbN4sC07cMjE+hTbF6OiNdyfRs6qLcs0?=
 =?us-ascii?Q?SNPpbX6V8zkjbvMMykup3r/ETbpEJYugrOk1qkEOHoBi/0qJng9CYDrMEMhJ?=
 =?us-ascii?Q?tvCz6MiWptLmoOT1Qn+rqT7ce/z/BBCXkyaIkc4rsWxMMLNWETiGs6C7XgF+?=
 =?us-ascii?Q?tq60qZWY7EWcejFuzIZfEBowR7pT5YP91vZZEwqegWM9lhnk/dR18ha6ZY+a?=
 =?us-ascii?Q?47Y6ieJYIn6pp+9BIdDUcnKQK+5rmi8H3gT8bLDadzCqBUF7URL9i/0Zk1OA?=
 =?us-ascii?Q?auel3CphAF/c0XAm+/AVTns0CXdzA1oZIkF95eyKFOfsWiKLkHvglHcVZBc6?=
 =?us-ascii?Q?V3vUVFp5vs9mtyBgV0dRJ/NBZCTI85gV2kfsZzOjH7AL1av6+xSt4DFFJEmW?=
 =?us-ascii?Q?b69WqJU8lHiUGi9CweDo4h9JZ+dHJMdYkoJ1Raa1LJhwlGRJ1zXWtLzA4R9B?=
 =?us-ascii?Q?wDLix9tHL0u2HMt2iM7jWH88P4/xSt0UiLe1au1NARabNPQW44ONip7BVgEn?=
 =?us-ascii?Q?Yr8qdhnAiotyka/LyDgNDKZhPl8u8+8iS5nzSkPxxYXBzBNGiVIWGZNU8gs2?=
 =?us-ascii?Q?+XQ/H6IZjv6hwADtQjMFCzqljZkPcEhGfiJ6YetLBwwE1WxaNndhPPyhw1F/?=
 =?us-ascii?Q?Df+RxcZ2lm7iyCLXVO/LpkJJoMFdUyf5d7kXQLW1ugjMXW9jgJPX5J4dQ1Zd?=
 =?us-ascii?Q?KNwWFNJ2lQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9e6fc8-4dfc-4902-0272-08da43ac29eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 08:53:14.2425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvzXQwlM38c20A349oQjk637elIOYGVUHO4Y0orJDLV4StWD+3FpM+Cw72uq2kdOBKdKkpJ9pukFkJqJjebnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2368
X-OriginatorOrg: intel.com
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Will Deacon <will@kernel.org>
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, June 1, 2022 7:11 AM
> 
> On Tue, May 31, 2022 at 10:22:32PM +0100, Robin Murphy wrote:
> 
> > There are only 3 instances where we'll free a table while the domain is
> > live. The first is the one legitimate race condition, where two map requests
> > targeting relatively nearby PTEs both go to fill in an intermediate level of
> > table; whoever loses that race frees the table they allocated, but it was
> > never visible to anyone else so that's definitely fine. The second is if
> > we're mapping a block entry, and find that there's already a table entry
> > there, wherein we assume the table must be empty, clear the entry,
> > invalidate any walk caches, install the block entry, then free the orphaned
> > table; since we're mapping the entire IOVA range covered by that table,
> > there should be no other operations on that IOVA range attempting to walk
> > the table at the same time, so it's fine.
> 
> I saw these two in the Intel driver
> 
> > The third is effectively the inverse, if we get a block-sized unmap
> > but find a table entry rather than a block at that point (on the
> > assumption that it's de-facto allowed for a single unmap to cover
> > multiple adjacent mappings as long as it does so exactly); similarly
> > we assume that the table must be full, and no other operations
> > should be racing because we're unmapping its whole IOVA range, so we
> > remove the table entry, invalidate, and free as before.
> 
> Not sure I noticed this one though
> 
> This all it all makes sense though.

Intel driver also does this. See dma_pte_clear_level():

		/* If range covers entire pagetable, free it */
		if (start_pfn <= level_pfn &&
		     last_pfn >= level_pfn + level_size(level) - 1) {
			...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
