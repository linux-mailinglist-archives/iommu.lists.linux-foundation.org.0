Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 993034F60C4
	for <lists.iommu@lfdr.de>; Wed,  6 Apr 2022 16:14:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1E38247F;
	Wed,  6 Apr 2022 14:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KqlsG5fxwYd; Wed,  6 Apr 2022 14:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5AEFE81D5A;
	Wed,  6 Apr 2022 14:14:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26AA8C0082;
	Wed,  6 Apr 2022 14:14:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD19C0012;
 Wed,  6 Apr 2022 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB8D40424;
 Wed,  6 Apr 2022 14:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjPSWsexzkAl; Wed,  6 Apr 2022 14:14:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2615840272;
 Wed,  6 Apr 2022 14:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/Ikwh92qNofHP7L+l5QnXYursY1vUmfiQpgndguCYcZyMkMivJMFo3mqFM/EqNtP8IBe3LdA9pNo5EVBAvem8ps9afawwRFTFUtrw5uYuvrEK5mNj2Ju/nctWKjhFste1+9i7HkFHNoXblR2BBed8qStTV5WxaRqGYLfawX92aSQIaMI+wX+H0GByx6wLxB2kaaiK72WsV84PFTm2G7+d18rlNZjvADOa1msxlXKkoJvZL3m42xIFv6dzrPg7lFB/HRid3IlSW8rBh2tTl546WBceG4mIZ6lcFJS/mJ84zMm7anZo3SSmatV1c7v7rr/jBkPrfoeXjWbL0bPXDfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nFOd6kvZfWQ8L2LZ6hSbXvacIIRBmMXCNZjVDyiX3E=;
 b=PgV0NMgo3GW24xmLydKbk/fixpQM9+IVZiI9V8A0acjPnFqFZUjcYIabZM6dF9YfJF/O3sYupw8PS+neBgnZRlBqJeQfMzA772U3pVPLVbGSTZb2/xDazwX1im+blKhKh7Ck0B/9pofPO3/8XMsiPJHuvhQfwD48vwCiAyp0aZZSSs4om8sjzQkjQeuNFCG/kmgLQlc/a1Zm9Z4pvxms3xgVp/r1fCz3jYkI3GUY0iUX9g6PXaktlNM6EEOFUTHgYO+N/9wgBh/X1HTfRhUcvHcO7lg1hL099ngbHqS1S0n0zJyjfWsi9BpBDJcijEtXIne9UUsJBqQi0Xf98dn75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nFOd6kvZfWQ8L2LZ6hSbXvacIIRBmMXCNZjVDyiX3E=;
 b=FTqLZqXiDTFVzYlXnGYNSBvbpGRVQsHYrL+04sLAmZR72aCTnpg4dxq/vZn4aFagSqZZBe7UwQH2n5XZ/GsBun3ylrDwVy1Thm5kfhLcVSporOWB/b2AlCBQeF2CIUqKVzPZ3Kyn7sDN7LVR+5y0LAxkr0Xh30JVaH8Hq7+9NcCMlykM2HpLSOVQ/kEcQJNvqEBVjwX/s/zltTk6rgA7u7n0cVXzCbf18lGTCMRbt8ZrkSWgMHUAeZPFPr8sfJ6HgjA+eKIIiqnbM2zovfuijBtQWN8ZGt5fiOhJKaLVQlkfxGMO9O4p8dp5fgpPy9xHnfYG9vP7zL8Usd7/WMtifg==
Received: from BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 by BN8PR12MB2915.namprd12.prod.outlook.com (2603:10b6:408:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 14:14:50 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:14:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 14:14:49 +0000
Date: Wed, 6 Apr 2022 11:14:46 -0300
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] iommu: Replace uses of IOMMU_CAP_CACHE_COHERENCY
 with dev_is_dma_coherent()
Message-ID: <20220406141446.GE2120790@nvidia.com>
References: <0-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
 <1-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
 <20220406053039.GA10580@lst.de>
 <20220406120730.GA2120790@nvidia.com>
 <20220406135150.GA21532@lst.de>
Content-Disposition: inline
In-Reply-To: <20220406135150.GA21532@lst.de>
X-ClientProxiedBy: YT3PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2d136b0-2734-46d9-7b8d-08da17d7cf30
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:EE_|BN8PR12MB2915:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2515B0E4677F4F57EDA6AB7EC2E79@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lz1aTkMbXgJSvGH1j+rtzBqT/MJjDtKJV+be8/O66rqSzKuC7d/5utCTncWE7rBP1TiMxTZyx+GJ3X7/4ftZg0JGzsSPu78l0JHDyZyzqBUCI1/ZoIqAXPAjlkGPP1dnmknwdrdNXLsblFx2K8o9UuGIsE2tvZ5qroLoV91zI7kFViMpT0c8RX3l721mlEtTpAoR95az0xs93Uwh6CSVHM7rp/WmwkfQePqzBdn0xEup+k8aKCbujRAfyoZQAKoYPykZAvFVC8XoDEpU6asXs0DGhvmNuihlRHacUMlXM3SccIWSdHYsY5UFvv7dPdCDCRVHFFUUhdm/4+CIAotuz5dgEKLRn/v7HObEWED22xmAwSAqs305Ecs3pzJ2M/JtXtN5pNy+exInyrlDKyllxI4LQ5MPPqKAkWt53eAtSpnbtX2/KdgjmNA+yj1FwqzxU1MrxiLKstPcB3rUL/vgZsRvGYUIjV9eEr2p2QQmbiUvY1EYOB/aCLdXcrAYCI5hBCjnX6dmPAsDiUPRBu12bNHcqrTDYmd33MHM6nCpY48mcmdAIMa/KrMsSTWybi4pRo2+8Y6OjlNsDH2h24apZNO1rS7pytzRnnd5raxvZQCvSnJAkHB7ba520JExiIH9tvlgPBGZNaMU0dbUaRTPNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2515.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(5660300002)(36756003)(316002)(38100700002)(33656002)(8676002)(6916009)(6506007)(6486002)(54906003)(8936002)(508600001)(66476007)(66946007)(66556008)(7416002)(6666004)(4744005)(6512007)(2906002)(86362001)(1076003)(26005)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLnlpnxsUqan9UEgjynVzdmhVAn8QkJ9O9ARXmpeVpvDj6VD9GG8XKaGhIxe?=
 =?us-ascii?Q?fDssF7Y6YA8SfAnk1Dn3EUl9IZil7n1v32nfJ9g0RastjqWkAUqiq94/j9vF?=
 =?us-ascii?Q?5IPqZ6Ny12sXX6M4MCgIV7/ozmIyQfxKBKfaQI2pUGHsoEArF2trcePFXhHQ?=
 =?us-ascii?Q?UIKap/PotQ/oq+qaISumiYXNGJMPXNtH1aTwYwg7REyvj/LPclqe46VprjAE?=
 =?us-ascii?Q?uZKw74IDEA2JMPfPvSyboQvcaas+3DoNK9ccGdAAF4BeKJEKFUJbYtSbJ5Kv?=
 =?us-ascii?Q?l6WqH09YIhacTfoEcL1jB7UZ1HNIMYn5Keo4vRELANYDmTdsyWN0t0xAak7p?=
 =?us-ascii?Q?OX1HC84ISwIdiDCRCO4PLEhpFFr5/dC63safBngOt+89H2whlR6ekTmyKb8W?=
 =?us-ascii?Q?NHXwlqXYAeAXLTu96k3cfG98KL095Pdaw0l02/3FekBaldpGks7HIeK14U6h?=
 =?us-ascii?Q?PouqnVYNdAIYtUqtTI1Qb2aDBsYdLXDoUqcP8kzpquFiLti2vUhpT3KtRNtF?=
 =?us-ascii?Q?3Kww6dCDBwc0fYs3i5Qq37SMzl7Ng6OM8/yrcbpNGXvC7I5gLzbQL/s+myq2?=
 =?us-ascii?Q?pyvKGMssTUfPQfgyaPIwhqZ+FzKAez7EEtH5b/+DDyGDZKWMaIUL7LO8+aWY?=
 =?us-ascii?Q?esiSDwwRjX9xgbcGFBz/Mvlk0RMGkgwCpfH6xtqdNjxtZ8jja79OmP9FqFoD?=
 =?us-ascii?Q?N5JTCCrb/XYNXq31Em4NKKizgHDdh/szBDHDUPhA78zmebXhjzmUGdmDzkGu?=
 =?us-ascii?Q?1v4vAYcfZ+sl1Nm5fdnZwTnfXmy9K9jU9epOduuyJ88CAKMhTEvPAD3BH22n?=
 =?us-ascii?Q?G4l40HcQKmk/f8sNwVuNk9a5uLP/bFFmJk6rkMS+kgav+LMtcl1btyi3BNXE?=
 =?us-ascii?Q?sJURRr1uj0eMOP895xYCkfoVhZTUdVXZHUBOY0XRzSovAZlFqW8bJOiJbuHq?=
 =?us-ascii?Q?jxotU4EE+zvcEojPC1udC8K9UDV7/rNNJRsTayhPcOLcakmlet4awhdXixps?=
 =?us-ascii?Q?So1d1dApWR/gG6eDuKWB0ng+I35ijFV6qNqEWHwMqnte8ncaTkxMcszu5zrV?=
 =?us-ascii?Q?4rjDDv+UKOmvRPXUr+Xyrflp4uFPvKBt5LpnUNPlydpKyU0Y18v3X2RzQIp5?=
 =?us-ascii?Q?KFtRWqxS2odsDZyZs4Ul5oSLQS/fVht0b2o7hybWutk3Q6k29cGOQruInpUT?=
 =?us-ascii?Q?xyIFi3qDFI/NA5jOysBE17oWilspM6HQyH+mqeIGXswOV52olVJxWSVSeJiy?=
 =?us-ascii?Q?2IKAiyyo1d+qRIuolRE8uAICVB38RXjysNo1PuQRjGQu/EYbXncaYSLu/qfl?=
 =?us-ascii?Q?6lPbl+7ZQPMSvh1UpX83iM/23DsI57XrXxYKTF18wdE6jQqpdi9DOst+dzzh?=
 =?us-ascii?Q?92vUGMvAi8dpU75o9BuyzAdB9cMn75D/8HxxskxTy4EJhsb7iIY7JNJ27mJl?=
 =?us-ascii?Q?ewxrcCSv4sbUe239UgJ+sEv8m2D65JJuPWTQl9o07i7OR2dvJ1OdFIWa49M1?=
 =?us-ascii?Q?aFgLyLXPpOFZ9BCZW4BFMwKlMNQoEcHzkOadRA1VMdW6CMDJwwBJhwad8v9g?=
 =?us-ascii?Q?kj47yvESOGlGVump1x6LTtKylpKWi2OOV08uCbNSN8MOlToKVu26EvUJWLUn?=
 =?us-ascii?Q?x/jU8SgX/o4DLbwtDOoF4f8tUeVagxJQnro7mTw1/mmVD+v10YPME0tZHQ0J?=
 =?us-ascii?Q?c8wP2BdZIfsewjrTIZQQY+G+cYSe6Hebgnd0U+s1jsZlTY0srF6y19Rzl0bI?=
 =?us-ascii?Q?MwNISoRQuQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d136b0-2734-46d9-7b8d-08da17d7cf30
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:14:48.8906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WT3gEKi5Z8Enxhe2Q3JgepepysGA7pADQn8lyN4bOW2oPW8LVAjzo+ZjfEy9/Vg9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2915
Cc: Nelson Escobar <neescoba@cisco.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 linux-arm-msm@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, iommu@lists.linux-foundation.org,
 Christian Benvenuti <benve@cisco.com>, Robin Murphy <robin.murphy@arm.com>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Apr 06, 2022 at 03:51:50PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 06, 2022 at 09:07:30AM -0300, Jason Gunthorpe wrote:
> > Didn't see it
> > 
> > I'll move dev_is_dma_coherent to device.h along with
> > device_iommu_mapped() and others then
> 
> No.  It it is internal for a reason.  It also doesn't actually work
> outside of the dma core.  E.g. for non-swiotlb ARM configs it will
> not actually work.

Really? It is the only condition that dma_info_to_prot() tests to
decide of IOMMU_CACHE is used or not, so you are saying that there is
a condition where a device can be attached to an iommu_domain and
dev_is_dma_coherent() returns the wrong information? How does
dma-iommu.c safely use it then?

In any case I still need to do something about the places checking
IOMMU_CAP_CACHE_COHERENCY and thinking that means IOMMU_CACHE
works. Any idea?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
