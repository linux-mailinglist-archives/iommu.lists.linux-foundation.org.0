Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 777BB514378
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 09:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F15084004;
	Fri, 29 Apr 2022 07:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlRYDMImVlWf; Fri, 29 Apr 2022 07:54:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 11E3783FFA;
	Fri, 29 Apr 2022 07:54:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBBDCC007C;
	Fri, 29 Apr 2022 07:54:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53A97C002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 07:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 502C64091E
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 07:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPfbcq0xpVD0 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 07:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60F6F40004
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 07:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651218860; x=1682754860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ze6d5zqeil6eGdqRdcP7G15akCWKlDQncaOLeBZV4VQ=;
 b=mCzZUpf8UNMjPoehltAQJlUBrKx1RXcTrb1HaeRX0A0bHPuPaa387anP
 E0x6iIEfRC8H24oG9zWmq3K8b6aIqWAVzCuBTZ5cnJIHqQvdiMmC2Nt7D
 5dISNCxod51bFGcKJFR0LwfVSTGt+DC3uU16QUpVmfrVZlW561TYYkVT+
 OteiERtJgcMii1C3G7BY+OHVZkT/PvvFJXBt+LztyviiSYV1xER08OLDa
 p9yrHgPvGPIIcTbf/0/tr2ZbVpf73UzXnD0FXEHJaPNDU9U+Fh95a2uT2
 k7v2u7tVRC3NmwKQHFiC1OlDc2u1K5iu0bdVyiIk4UIC+qa59uc4LdA78 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="352998564"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="352998564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 00:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="534364168"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2022 00:54:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 00:54:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 00:54:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 00:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rv6724NKsUW2rzBpK7wk31LIp4kicRVCdep0AEJbKmyuOJdBzPU2f8/vbUjHSYf4xVrqv89Ru541PK8lUlBOrBSDdjiU9UJXgYGf7BQqHT/oi+74UJfXablenTO4SoORKFvbEzlX8u4pVkuRR0A2eyRaYfohjhQBTysoiu8L323TlUxF5me9gR5I6KsYlYH3Ywrste4ipgmwDjwy/NyZvPJpyHFYVYyZiHrGvoiO2ORSp/9+jPujqaEIxQJbLeW69vC+k96NRR4Yl3pSiT34wVSqggDkWUGJrYRRkuH5EAxWOh0MznQKVPhzu2qnRa85tMAdaJWFjd0pvl0Jo083SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=467jZdvi+39uQEk2JZIeeTsalPOEJB8oaqE+5hIi/VU=;
 b=fIgsEg5DbE9FouE5YhkMbaDEXlc3lE8439LQYo6t0+yfIYbfyY6ahI66w8eKX4lHuN1Af/S+/TQuRXIhLdmbnnOIU0qqntMuLrqsPpcxLVhwGA4ut+Ol4rRSy4NkOWl7GRWZbBE1c6I7eYCMBO1XYAAbI65CpK7GPlwhZrg2BNaSwKGSGCYPivVggC9KtyItUX9bjInKaR+bi7aub2cvd8fGT6FoH+IhfusljiFGZLCuLRjchorDl6qElTp2e2azzXei6d93A2TfEVGzGP3Qzx3Eu9mvCipBicuFLwqICK64DaBlzbv/GMjcwwqpUOLCnkterjyJZaQfiAnl5bzw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 07:54:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 07:54:09 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Martins, Joao" <joao.m.martins@oracle.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH RFC 01/19] iommu: Add iommu_domain ops for dirty tracking
Thread-Topic: [PATCH RFC 01/19] iommu: Add iommu_domain ops for dirty tracking
Thread-Index: AQHYW0SBddBMaWdJy0ea6VnH/ggNiK0GeQsQ
Date: Fri, 29 Apr 2022 07:54:09 +0000
Message-ID: <BN9PR11MB527684203C6344FF46B4163A8CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-2-joao.m.martins@oracle.com>
In-Reply-To: <20220428210933.3583-2-joao.m.martins@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cecc7c9d-ed6c-44e4-5b54-08da29b5712c
x-ms-traffictypediagnostic: DM6PR11MB4721:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB4721459F30F6CC32991E5EBB8CFC9@DM6PR11MB4721.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N+Pc6V5J43CF87jNy+PeiPhwhwsrGN05CAEcgSfRr8RXOWy/yb9GPuKoU1JEaAB0n8qXhCmmoRYO9pXLPktRyIKiAonHyaiJMUjLyaj4DkWQ02DSJHaazFWvGt8r8g41zPRaRG+US5f4mLR69uLg8dx4Ji50zH6AVmNaUjZnCBFpyTcmeuN/+CQwdHeStJ+hZdoAXAJ32bibHqJfSIWeg1HNIHPyqWZ2HcWpNMsS8W5e2XJbZC2KUvi5TsA4jd9UcH9ljqaxTDm/3PdRkfafNFWANdBvEgKJjf1TFmSQJ6nJ0cf8k/4E6LtYGP+iwG4SLAhOyvCr9BjM3Bq8XH1/auY7j9/TPpHWwx8+UAZ3RY2Nw0skJw6LsZgiJXmsVs6X6zuj5zY7BuXvIrGpcZ/8cjzdacbnOV4Hbu07CDEbzbGFfC44Z4VghAeIL+TYHYOX27vbV5WJKSw6qTgZXqKzUWPFQVoqA6qGDbyVWXKRxM3fAQTpetXs4489xWLo3BouKQoJsHfGdeU5rrzVNSzz1IHRAnKGAZZH+HrFpUFUa526p4fC9cm5jHsnABpm0DDZcERSOznJW8oyICO6bXHPShvg9Ivt8cDYXbsYuqZ5SYxMTLfVtLBquu8fJKo4/MgJ5wlbqujLjRNu8VaZXABgyZJ9/ykjwNXESOBAaYbC8+K8QHDE4+6JgIveHudqXq5UCg3EO8iGkhpZUXOf2Nw436nqwJ8X2DVLzLys2CBCokY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(186003)(2906002)(9686003)(38100700002)(122000001)(6506007)(26005)(33656002)(7696005)(82960400001)(7416002)(8936002)(52536014)(83380400001)(110136005)(55016003)(8676002)(508600001)(71200400001)(4326008)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(86362001)(54906003)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P4zSUTuR4323WcPy4G02EFUlZh47sMD+dhHjKM631I2prUu8Iksu+HtvFA1a?=
 =?us-ascii?Q?UmMt5U6xSj9+RvdYBSEWc6x8ihKEOUWo+FWeX1iFLPEqWZ6wVO9hxBrUEiLE?=
 =?us-ascii?Q?PL+X8/UWv1PXR7HaPSmaOpEgis9XjY2zgtkHIXHc97oa1xrpWu9oGEpK7rbZ?=
 =?us-ascii?Q?0nGnJ4mXnYvPxvYqaVXD5ZLYKpRPjG2ON7Zej/oM1b/03dFPSyfMk3dF+jkw?=
 =?us-ascii?Q?XEgCiIs5UnDFjlqFSWcHiB4HBhJ1tFyc2MAjVU2SMu1fUTc6K73Xt3kI5Jgr?=
 =?us-ascii?Q?7xdOH4ZcQfNqonqNxPxk7eVOqO8s/RXD/TY3WY7N1SOnspZheMXHXS4hRlTY?=
 =?us-ascii?Q?M/VZ0QyRMnxmD3zgaZsyUXTFe27Yos8vnW9Y0tevqgmGQAiVmtFBeXYLhT3F?=
 =?us-ascii?Q?Jcz9cROg9m13WNWfzgC+CrlzeXUJ9XDRrU7RKwbIzJaOFtSxPdDgq3ZMsTXo?=
 =?us-ascii?Q?GB/3LvjpaXLaNe2Vmqc5kpacip9m2C9OFyU8CWAr+Ya2bYNbmS8a8oXOhFFf?=
 =?us-ascii?Q?E93U3L5YXAEBktArGNloOr6eoQV8ww9O1nlGS6k/s4fLpRPXzMzVLx5TXCEC?=
 =?us-ascii?Q?eq4WBI9ooyWATzrvvGotAdWQ6IuewF5PIDQDXTDtXFlRjUoaXA9hKh0DflXq?=
 =?us-ascii?Q?oHGz6ly/RZyQIR2hnn3synsDuDzYvKJgiszbYwd7xFovRLgDPgsfvJk26FEf?=
 =?us-ascii?Q?Hgp7+C0jjXfHFEhWQRpjkRcSnOgUMPW9+6cFqRtD/gVL6WWUDP6JyUJSiQ7p?=
 =?us-ascii?Q?5r98caOUo+5vqTSIHlSIjhcP1Z4ZEJ1uANvqKO7Y1dKjKU/yhHJlkFaFPtZi?=
 =?us-ascii?Q?GhmMQJz3i+2oVsWA9/VYpfsiwsk2RDtpEjZHl1yFYjfm3K3n5RKn2NpEskxQ?=
 =?us-ascii?Q?8LaOu6ua5HNR+Qs0ZkHmrXAVQFQHvYhyeScxoFmFhkO9vXU0xxHblQE23UMT?=
 =?us-ascii?Q?MyDafo6jgDTM8WdB0XJ1OnhbFQY6KOpQZsbfa2P1COP9S9kt3koOvxL1vYwc?=
 =?us-ascii?Q?3rdqYoYWtm5ZOIrQowtjEoUTCHUj4vi+mhoxrcDIJV++pBipm6Vtw+G90xdy?=
 =?us-ascii?Q?cfh2QEu0+yRAOdMFy36saEj41wqieBZjxSkd9TUvcAn8OBrBA1XZ+Tn85QE9?=
 =?us-ascii?Q?uLR71uBAS/5C39J8gpsQUvsgn1mAJ+uHY16HfOUa87JcGaoyI2HrxLD1x/pX?=
 =?us-ascii?Q?3veLMx6KCi6pUD7fpBJJXjzBOypJdcHFZ9Y0MA8cWLDhgu7UqC1fNHxjEWK8?=
 =?us-ascii?Q?9rYElfkKnbNic/xoVGB2ks7JeTbvED240acqnzYPQ3xMCWZIIWs2cs1Sm+e2?=
 =?us-ascii?Q?WDBTD+0xMREzpSQW2e6fefDcXIl/1X8kN7fWGt+DV4SlViUryL8oSgP5wAzo?=
 =?us-ascii?Q?9wrR6HG304YW8v+M4tzce94pCxH8DT0Nr7u0IAAhBHWj2a6p3edbsQbvrctd?=
 =?us-ascii?Q?s8inevSMTax97Yo/NwuRUQkCLl1wMd/K1OGspM3gpANQD+WWHAoBUPP8y64C?=
 =?us-ascii?Q?wrOCJl8y01LowR9ZeO/roY+k9fwTz5p0VYZk2sps6Sv96odG21teEjJAfg7a?=
 =?us-ascii?Q?b22OgJgtdlzdFovw6qbKwOCv4KAiYJ5kHaIkFtx3XlFm7PNoyFqM9h+WbQXi?=
 =?us-ascii?Q?xsvVnDNKGu3DAnItZ76wlJHdlsFzk+tp1LprRx1GpKxlt/F2r8YVco1sGFxx?=
 =?us-ascii?Q?ATAfEmnokbWdd5Hca/Ww5QoX963m0lyye4tDPrKh1XcG/M4JYpN2iV1em//o?=
 =?us-ascii?Q?4RkkoIXIRA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cecc7c9d-ed6c-44e4-5b54-08da29b5712c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 07:54:09.0741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzX3Yb437a03WL0PKeUYYrvgokX5pAa9lJI7vdcfHpBzKqWJDeHmhByjEWz1KxdIG9jvr84q0a53zZ3WqMnozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Cornelia
 Huck <cohuck@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 "Martins, Joao" <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

> From: Joao Martins <joao.m.martins@oracle.com>
> Sent: Friday, April 29, 2022 5:09 AM
> 
> Add to iommu domain operations a set of callbacks to
> perform dirty tracking, particulary to start and stop
> tracking and finally to test and clear the dirty data.

to be consistent with other context, s/test/read/

> 
> Drivers are expected to dynamically change its hw protection
> domain bits to toggle the tracking and flush some form of

'hw protection domain bits' sounds a bit weird. what about
just using 'translation structures'?

> control state structure that stands in the IOVA translation
> path.
> 
> For reading and clearing dirty data, in all IOMMUs a transition
> from any of the PTE access bits (Access, Dirty) implies flushing
> the IOTLB to invalidate any stale data in the IOTLB as to whether
> or not the IOMMU should update the said PTEs. The iommu core APIs
> introduce a new structure for storing the dirties, albeit vendor
> IOMMUs implementing .read_and_clear_dirty() just use

s/vendor IOMMUs/iommu drivers/

btw according to past history in iommu mailing list sounds like
'vendor' is not a term welcomed in the kernel, while there are
many occurrences in this series.

[...]
> Although, The ARM SMMUv3 case is a tad different that its x86
> counterparts. Rather than changing *only* the IOMMU domain device entry
> to
> enable dirty tracking (and having a dedicated bit for dirtyness in IOPTE)
> ARM instead uses a dirty-bit modifier which is separately enabled, and
> changes the *existing* meaning of access bits (for ro/rw), to the point
> that marking access bit read-only but with dirty-bit-modifier enabled
> doesn't trigger an perm io page fault.
> 
> In pratice this means that changing iommu context isn't enough
> and in fact mostly useless IIUC (and can be always enabled). Dirtying
> is only really enabled when the DBM pte bit is enabled (with the
> CD.HD bit as a prereq).
> 
> To capture this h/w construct an iommu core API is added which enables
> dirty tracking on an IOVA range rather than a device/context entry.
> iommufd picks one or the other, and IOMMUFD core will favour
> device-context op followed by IOVA-range alternative.

Above doesn't convince me on the necessity of introducing two ops
here. Even for ARM it can accept a per-domain op and then walk the
page table to manipulate any modifier for existing mappings. It
doesn't matter whether it sets one bit in the context entry or multiple
bits in the page table.

[...]
> +

Miss comment for this function.

> +unsigned int iommu_dirty_bitmap_record(struct iommu_dirty_bitmap
> *dirty,
> +				       unsigned long iova, unsigned long length)
> +{
> +	unsigned long nbits, offset, start_offset, idx, size, *kaddr;
> +
> +	nbits = max(1UL, length >> dirty->pgshift);
> +	offset = (iova - dirty->iova) >> dirty->pgshift;
> +	idx = offset / (PAGE_SIZE * BITS_PER_BYTE);
> +	offset = offset % (PAGE_SIZE * BITS_PER_BYTE);
> +	start_offset = dirty->start_offset;

could you elaborate the purpose of dirty->start_offset? Why dirty->iova
doesn't start at offset 0 of the bitmap?

> +
> +	while (nbits > 0) {
> +		kaddr = kmap(dirty->pages[idx]) + start_offset;
> +		size = min(PAGE_SIZE * BITS_PER_BYTE - offset, nbits);
> +		bitmap_set(kaddr, offset, size);
> +		kunmap(dirty->pages[idx]);

what about the overhead of kmap/kunmap when it's done for every
dirtied page (as done in patch 18)?

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
