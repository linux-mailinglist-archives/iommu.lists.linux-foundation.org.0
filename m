Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729645717C
	for <lists.iommu@lfdr.de>; Fri, 19 Nov 2021 16:15:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0B0410AE;
	Fri, 19 Nov 2021 15:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w4LbuhSjOtJ; Fri, 19 Nov 2021 15:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3AAC0410A6;
	Fri, 19 Nov 2021 15:15:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10D3DC0036;
	Fri, 19 Nov 2021 15:15:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD91C0012;
 Fri, 19 Nov 2021 15:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10CA3826D5;
 Fri, 19 Nov 2021 15:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSzjqrT5pmqV; Fri, 19 Nov 2021 15:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 744FE826AA;
 Fri, 19 Nov 2021 15:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6wc8pEmdItDiZ32yxU7VjzfoVs5EH82eHslRJo8hQs0ZK/WOXMXue66hW5Nl1tzWgZxHXhhc5Fpaw8kqDit+KHazy4Rmn9+pmIvVoex3Y0qfvCH79Bp6zRK0x79oHDuDsx9KZzR09TTxmKLRWQXwUnK4BcVnc5Z9nSEd4k/ulhnGMxviXIS9ocJZAeQzeFcV7qq4no7eaB72Rs/Eyj1hERSOUr7WDtMj2L1cbdVhsK972xfAZHRkh/dVUqKRiyBS8m++/eB4bP+pYuCiAkbd1EiO4PLEPe7UiB2DfhHVSn2zhByQdhUVY8gt/e6FuEe+derb8vyabtBkbP6mpt0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yrSofEBhZpwvpRTMblsOnfvLh8m4n/jxceqL5EzAKI=;
 b=jj5b4o70ZbQwzlOEPnNx62jrrY0cAKG7yGpJfmlssvIe8L+cg3iFh0y5BJDP4Linr0+LmBVoC+pUY6oVRiqEKfRgv+7QPCrtxfx8sncXUPEY78r8oNdbbBqtZfBop0fYn+WCsdBF2tkOpPJsOfaL3IlCk9v8TLPFeeIA6SckMHC5/NJBCHohw4u4ZxRDs6p6c56/X5NUhMXjMO4Jm6LKFPvdVGPGbPG8Wicf0KR/YBDpx6xzsjxiWScOUnwvVB0zjraTFmaF/e7Nl/nsCDqtNreVIffAgv6pbvyMnJX2VL6oin4s05pweIHUtW1mQJ3j/aTaQj83HvBvvshKEChc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yrSofEBhZpwvpRTMblsOnfvLh8m4n/jxceqL5EzAKI=;
 b=i4nEHx6RCWnAgd/g6DXKXWe+WubUXIKs/Y8QuiiyLA3TkhbhY2qY0qkkz/ykyWKZeHp2xKY0NDQadF/WnoHpdQuRWOpx1lFd0QBF12WCz0w86wkKRmJEoKwm9RfjdoemjAX0yMEUuL+TN6IwDuniusizUor8mKRXlsP3Eg4qHTfOjazqFbs2MRGBqKDTcMeTokloVn+qVskeRBReFRRklWWBMrTMA7khX8Tkmn5iDpE1hIAnL2e85skTmV5q/HdU0TP62/35kHwneBOAQPDXLkgdqfEQxX6Lld9WPzoMnJhYTUOivgB07rxbSZX5bPy2ZjbAxuW2JIZpM0Nptxn/2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB4723.namprd12.prod.outlook.com (2603:10b6:208:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 15:15:46 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dc47:e67:877f:f19e%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 15:15:46 +0000
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Fri, 19 Nov 2021 10:15:40 -0500
X-Mailer: MailMate (1.14r5846)
Message-ID: <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
In-Reply-To: <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
X-ClientProxiedBy: BL1PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::18) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.52.6] (216.228.112.21) by
 BL1PR13CA0163.namprd13.prod.outlook.com (2603:10b6:208:2bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.10 via Frontend
 Transport; Fri, 19 Nov 2021 15:15:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33aada4f-22d4-482a-fec5-08d9ab6f760c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4723:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4723ECF4D1A60FC5AAF6EF48C29C9@BL0PR12MB4723.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFOp1oKDQhek/KRP/4IIjnoBf8+5xnNcnq5KGZ5KX6mpe3hrfCP4XcFG/6oegAMGB6rSpGudVSOHi2Qf+1oBC8S0cVhxDjdm5J9+df9rD1MdWcxtPSIZFHSYeEBH3RFZXkDfxLj1VXn5f6EU9pYWgMk4hr80dkWJ7GUGW42THk1aExJFEIMSLGPLFdhedjOMiRl8gwv5CASLsskqs9TnSJFIFIvcV3PSWHFS7DRiU6PjJ2rj2FvcJ6MZSJHlw2SjhyXjvCQJMjJhJfN4CpRB6j/KdzEeGLQ6nb9JXGajscCWIc3eTWJjPj1ZQZ8uDa8JiTk7KVxHtHM/B/ZV5GDqq/PuueVtLWh/ZVxVo3wdj8syQYqFAhFcQ/nX2mG/3EPo33FcjYElSJcs9kAsrLMq34FVoT3AkIZs+JENh6otZ9fy5Dv6VVet5AKxQdjEbJV0dP2aI5Xo7TDXARyIiMiqSsT6c1/Hjv5QMttRqWsscWm5eMCWrNNalWEuAfI4R6QMTxtn8zYw/KHqDiqEF+tF8CTlnAocts4Z396xsvSQsPW8ggo52n+JT1ZkI4pciAy4IsezprXsq2ntcGtuygYxpdt6a4z7O2aLWsyzSM7Jqz4WeU0wEEf5sacO6QaIlQFiqhg1F0YeoD8+em0rqP3sx5+XSxK3vouZqeLhI6604VimudFDeUPEdewD60tTCDso8l/XJJEfjQhIxTy+XSQ4N26OVfeAH9lkSMjFoRkK9rWyXlEAg6QVDo8mP9QZnkkuj32tFseJgjPaWnaYevjuJbYpe20PQmXcqSrairOlxQzL4+VXHpqXbqbCvQw1UjUp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(8676002)(33656002)(36756003)(186003)(8936002)(16576012)(6486002)(53546011)(83380400001)(86362001)(4326008)(235185007)(26005)(7416002)(21480400003)(5660300002)(956004)(2616005)(66476007)(66946007)(66556008)(38100700002)(508600001)(2906002)(6916009)(966005)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KW8jf38VYQsoOOI4y+wJwhLmKhRDXsictcr2qGKwfzX/rA7Zn9Dnpq/hxV9O?=
 =?us-ascii?Q?HmQ6u7QOR6IrhG7nI7cQ9UlBGNsRoiEP56vlVFPac1uY5dSJt/qIi/mGYQR5?=
 =?us-ascii?Q?n3LD/4kXJvhKl9QiQQjD0Leoay4MXYb1YfBZrguoSF4sU1WJAx6OEfXqjBC3?=
 =?us-ascii?Q?0Zk48ty+kNL4B/1w8oDX/Que8VG0D/+E9lh5FCH1Er10B6j53pEXHfIMvJIc?=
 =?us-ascii?Q?MHEmbedbmrwjHr/jYUh3QR6B6kff3D9idCcp64F9/xx5IUhVTLpVl4Uuk7qM?=
 =?us-ascii?Q?FGK4sW7qwUqTKR8XwUyAPeymkU1Kh6jXEUEHxzPXrAP5gce/Tnq9a23gGkf6?=
 =?us-ascii?Q?ryL6V5qIVrfkVWW2Nu0k1dyvKusYku0t7XFu9c9qF2pjy77FA0hOoMmjxpxZ?=
 =?us-ascii?Q?p9B+rxgD83KWynqlDs+f1Qm0MlNWzbCwpJr54NZ4TGgIumexmEroC5SGFB9l?=
 =?us-ascii?Q?DusudiCNARKafNzbjS/UoRcjC2ZEGeuD+CTy0QUf12a60IWbqezmpDbRsGiV?=
 =?us-ascii?Q?E1juBL+uJI10INCsXa2JwZ/r/TbfBbtbqO6p0uem3ejE5f+loyYVZUbMaUAm?=
 =?us-ascii?Q?8J50QBQiBHTenL+kRx2oB7rOIpmFRxxR2H9rT4txfqm/376X7E07A9fUy4i6?=
 =?us-ascii?Q?Jh3GDMrYKV8wiBCn7yeoUf/czx2XBDxdikw5N2C4rJNYOxHn6TCHDfLZT3aT?=
 =?us-ascii?Q?fzNmitiTbkaToQIROXsUfgRccry566seNlHxxetTxwGGF1Ntb8PtK9oKTZN5?=
 =?us-ascii?Q?LPTeA5182fkIb+yBVX26f8yB2JY31tsQret4DlaFIE/2PC3825sMgls2CMKG?=
 =?us-ascii?Q?3ktVAPZ0TK0gT9WUfiLxPLzhfM8ynS5SoG+Z+QB4ZE96YvHMfSjhf4KZPFa2?=
 =?us-ascii?Q?2G6etjBGTn7M0LpnjDt3X6f/RGp5WFxqsyFyz0sRXS8Kv85OJDNWVJipWXTT?=
 =?us-ascii?Q?5HnL063/eqkkfWXZFAyLe9Kip/Y87rhv/ZeOmBvU7L4kiVISwYBK6IcF8bSB?=
 =?us-ascii?Q?xH14qjfV1x6nVNK3h9VXO/wpOkxAT1cmi3X0VSPayPLpTMxInic5AyL1tmxR?=
 =?us-ascii?Q?jhtulbgxTq4/eNDhn5YRHW+ITX48tXY3pziHc0IdbROnkk1ulcX3BATXHpRm?=
 =?us-ascii?Q?aljyxqp28xZuXM2ypl32Wbsa3FNqjKtNpVT99NMJula3kcgDCUBC4HPz6GDr?=
 =?us-ascii?Q?QlVQNd0MryRPDg2Rv53MR96K9WtyMCAQcQec0qzomW8f3VRz9dgEPEUOSqyK?=
 =?us-ascii?Q?8Dcnqvl1TCoZVrN6eCzPt7RIkDXJORNQznajcHrFSjo3N+6i7rVOY4300b24?=
 =?us-ascii?Q?sveCmYo1atHGm47CaG8GvhjSWAZBgxqMUc4vZ88rbOYygRxKVEJkq9jFg1DM?=
 =?us-ascii?Q?Fcr+a9RFh5rsZEQ15eJz+KufcxkoE4r3X2HpHHRFnozEuZ7eZFvapozmJyyi?=
 =?us-ascii?Q?DefkSjVmYiJ6bhxr8dxc6cJKCqrbDc6zv/RWz/cC6Z3IvcmbaXqKqRYEcgNk?=
 =?us-ascii?Q?/xdm8DICMzKljl4YWkMWAxoFw+x1iXQ3X/uiinSoz2JuWGSi9J/wYcwZYYkN?=
 =?us-ascii?Q?tEvTgPBA7s6U66Zscv4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aada4f-22d4-482a-fec5-08d9ab6f760c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 15:15:46.4246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYgRkmpelLMeOjeQ2W03tnpTmE8ZrX6BzqwjuHnZELNx+bkIIrn9tHjWnH2KAw+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4723
Cc: David Hildenbrand <david@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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
From: Zi Yan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Zi Yan <ziy@nvidia.com>
Content-Type: multipart/mixed; boundary="===============4587498103578305479=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============4587498103578305479==
Content-Type: multipart/signed;
 boundary="=_MailMate_BA5FD4CA-F731-40C8-83B1-99F88B116305_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_BA5FD4CA-F731-40C8-83B1-99F88B116305_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 19 Nov 2021, at 7:33, Vlastimil Babka wrote:

> On 11/15/21 20:37, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi David,
>>
>> You suggested to make alloc_contig_range() deal with pageblock_order i=
nstead of
>> MAX_ORDER - 1 and get rid of MAX_ORDER - 1 dependency in virtio_mem[1]=
=2E This
>> patchset is my attempt to achieve that. Please take a look and let me =
know if
>> I am doing it correctly or not.
>>
>> From what my understanding, cma required alignment of
>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was intr=
oduced,
>> __free_one_page() does not prevent merging two different pageblocks, w=
hen
>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() impleme=
ntation
>> does prevent that.
>
> But it does prevent that only for isolated pageblock, not CMA, and yout=

> patchset doesn't seem to expand that to CMA? Or am I missing something.=


Yeah, you are right. Originally, I thought preventing merging isolated pa=
geblock
with other types of pageblocks is sufficient, since MIGRATE_CMA is always=

converted from MIGRATE_ISOLATE. But that is not true. I will rework the c=
ode.
Thanks for pointing this out.

>
>
>> It should be OK to just align cma to pageblock_order.
>> alloc_contig_range() relies on MIGRATE_CMA to get free pages, so it ca=
n use
>> pageblock_order as alignment too.
>>
>> In terms of virtio_mem, if I understand correctly, it relies on
>> alloc_contig_range() to obtain contiguous free pages and offlines them=
 to reduce
>> guest memory size. As the result of alloc_contig_range() alignment cha=
nge,
>> virtio_mem should be able to just align PFNs to pageblock_order.
>>
>> Thanks.
>>
>>
>> [1] https://lore.kernel.org/linux-mm/28b57903-fae6-47ac-7e1b-a1dd41421=
349@redhat.com/
>>
>> Zi Yan (3):
>>   mm: cma: alloc_contig_range: use pageblock_order as the single
>>     alignment.
>>   drivers: virtio_mem: use pageblock size as the minimum virtio_mem
>>     size.
>>   arch: powerpc: adjust fadump alignment to be pageblock aligned.
>>
>>  arch/powerpc/include/asm/fadump-internal.h |  4 +---
>>  drivers/virtio/virtio_mem.c                |  6 ++----
>>  include/linux/mmzone.h                     |  5 +----
>>  kernel/dma/contiguous.c                    |  2 +-
>>  mm/cma.c                                   |  6 ++----
>>  mm/page_alloc.c                            | 12 +++++-------
>>  6 files changed, 12 insertions(+), 23 deletions(-)
>>

--
Best Regards,
Yan, Zi

--=_MailMate_BA5FD4CA-F731-40C8-83B1-99F88B116305_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGXv5wPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKS3cQAJbGbGltVBvoNnb/0RXwKwZzE00JvWWtccV7
Qm1DDgUeldrjtz4UYMx3+vbuvTDYo8B5bOg8NUdU0dVkkYOx92BG6EsmIcljCyY2
UQfGeQWWrUtNEHFHzVufj9aDlONMB6G+i2j2nRm7W0Go79Txyt9m4B5QXGjwWICm
mT9KgJTp0GFyAV8gYkPfbPC3Fw7d/V+JpqX4SbpMKZoaNhzWUfZpxy36TVKM4LOY
6vWmp5mXj6+t2Z3zNoD+ICC/qTBuG614VvZMbYVWHwwAxLzZBjDjfX6vYSOOioaW
Ar2h8B6SUq4uGVzqf5mTae+9KEtU6xYFX4b4JMSnSDEOilNKH8dlfvIA+o03R9Ze
E/xcGubjA+ChKTBTCiyuZsCpW2SVbQ62Qsin+xmaSOmg5XsU78GtHfCDxawJRulB
CDYrL9e2Nji5nOMV15pvR72BTYWpTMAh1COXuxqhb3mIZIXAYGm6Lqqh3SL0tipQ
G1Zv2hHMbyGqJziUCG6EFk7LsgK7REp9wSI1rMOG1vpjx51HQQAEwdrAvhBhxNHD
ZN/2zzzNRQ/WD86NCx0HhAL808yQ9eqaRCawPfcmX1FEroaWh6eFZcb0sWVADoLM
AoSlysCa2q241fRcvOt0pRbVc8+kmM/RlXNYrG3tAHEeOJ26O3Oteo08+753x6M/
7OQ8H/l5
=W9bu
-----END PGP SIGNATURE-----

--=_MailMate_BA5FD4CA-F731-40C8-83B1-99F88B116305_=--

--===============4587498103578305479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4587498103578305479==--
