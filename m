Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5749B89A
	for <lists.iommu@lfdr.de>; Tue, 25 Jan 2022 17:32:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E55440121;
	Tue, 25 Jan 2022 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dLHLfY_OA94; Tue, 25 Jan 2022 16:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2F718400E6;
	Tue, 25 Jan 2022 16:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF414C002F;
	Tue, 25 Jan 2022 16:31:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25BFDC002F;
 Tue, 25 Jan 2022 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0670F813F3;
 Tue, 25 Jan 2022 16:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YgTHq6MEdgj; Tue, 25 Jan 2022 16:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2051.outbound.protection.outlook.com [40.107.100.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0BC48133A;
 Tue, 25 Jan 2022 16:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQGuBsoM6asFPKwAQwYaojjloFkOO3OIzxVmUoBZCOttocs5Y0HDN/McyuQxWj6JmCR3bcFTWrPIvVhFkHlT+x9uyzVlP9lBKwjob35eKeGylSPKeB/amp85JZD+wgQwhPZI4DuDjEANGki9xvv9mSNmsFyXyiFdGAFpr1dGpe4Lsr8S3EMkKe+ZWrgQJVRuQzGIgeT9QkqDcwD28GQGW5SPQ3Z9Slk7MBV1R720HUeQzpI6FZamvUOUpapzkUHrBU56F9+aXJ1c52W9FNVQtnVlSr0uA9tBosyrf3S7qZOdZiKG6Y7fA3UDkNHoyknFPuub6N0qDWkcUY7cDrJzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdCRwY/qwOH/1jk0avsyl7MvE6KEYc3DI+Z4EqwRO1E=;
 b=fjT2hBdYEmJIClWyGeRAmEsuJEZWHqUWIBA7Go12RHy5AopxedVvjoSWIH5HybklVAq9m1JLkV2ScE/zzQ7kl+ikaytBgyhB0S4jduvzdWUU8PAW7i5EsfpPzceF8NFMSRn37hhDi7cHhN/nufg/nLUFWF+bsuHrMUZ1730wAVqa53G3J4AVOlSEmHv6PLv0bksBQM2ga0KciBZ1Qm2TMHVx/BBt1WfzvBRv9tw+TW1Ge1vJ6DqfuslOeGYbVhOdcpBKeI4mEgiEcQ2XK/4F/u3g8bm6T65l/d9bjFQXX3e8LbrdITnxL770z3mkzb2dXK48gx2LvRkhUZ306PMbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdCRwY/qwOH/1jk0avsyl7MvE6KEYc3DI+Z4EqwRO1E=;
 b=J9XOu02wfPBBYMezNZV17scr7Eb1mK2Zz+06tPmVC2WpyuEQq5lsxh7eQ29L839cWJpzFzRfYE1zOW+yLwJzcMiTkYt6V/vTqrsBDKVEVqoZyw/y90khaiMeVdEumCk86AjxQlHB5+GTddyKcUz5jB2utx7r7LqDJKkiUsNsE8LTY7DlQQ7TlxS5DTQMsWS6CHM/cLVPdJcrxBipCLKOqTUZalD+UiU0am9gbrDH1yDZ7FVOXONiAko6A3B4mZ2m801oshdPPNH6M/KdzYIZpOVA/rLInvaN0DUMEDcMeDDvHF0f7rk8siB0HggdMBnoYSvOR2WF+XISrTuhHdqRzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 16:31:50 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 16:31:50 +0000
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
Date: Tue, 25 Jan 2022 11:31:47 -0500
X-Mailer: MailMate (1.14r5861)
Message-ID: <0F470316-5BED-4A81-BFE2-57CBFC550E6E@nvidia.com>
In-Reply-To: <20220125132108.GB5609@linux>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
 <b7c311d4b2cd377cdc4f92bc9ccf6af1@suse.de>
 <6AEF32AC-4E0D-41E0-8850-33B8BD955920@nvidia.com>
 <20220125131943.GA5609@linux> <20220125132108.GB5609@linux>
X-ClientProxiedBy: BL1P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::10) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20917e0a-a961-4871-68e8-08d9e0203022
X-MS-TrafficTypeDiagnostic: DM6PR12MB4122:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB412277E9FA6089F5B6A061C6C25F9@DM6PR12MB4122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fj3dDEDx5neTP7ChritPKvrDnnM7MZPX2sgK5iV//8ovJkkMVVu5UhejdscgyvrrSwOvy3LKKP/dviFwMp6C85MgtViiOY60DMhVRVQEQaunSHrD8mCL2toe0HQmBsd4Qe7tSDAOg/pKGYM7YBeZEeoTmdgZwk041+A8TLa1D4y+lPmKzD0sUlTgDfrjvETHcblBjO+hhtVKJPGJRc2rGDDdA8pXpY6IAm9bzk0SUJzdt8Dlon+A8BFn0i48czFdCzWNmP1FCNukTLQYpIsVphIXr3DnBRrIpxEJGnThve5NpnXxzc9YYqJsF1LRPUT08qnh4a3HKtYBoKwfQWNdLicW+Fk/TLuHC6902zc1VbkuDYMf7B+msa1eAXCWJPksZktxuf8iT0mCGI8hXvZ18OKkHTjdiI/9qCvIITekkIp7FYFBEBdYsdfUk8pA3MhSe9o6B8/zJ0pmnxZs7tYBch5k0mkZJJfIfVVgSnx4R+wWlZHutTet7/eee+ysfGT6wP+x1FUix/qGGK8BQHZVfZha1OfjRzeQZNnwshnaMQXEM2JJ6aR6Orn327w53XLpJ8TSuDWjo+PvbNhg69awW8pgm7OkYrO5U1yuFv7Xmh9R0fMjTHE+3TpYrkuCyKYPb9CBI7KgKnJ7lySpAnRG+BYZOjaZP6KsDkiuN5i+GDWVYmB0kCU4wlZHAwoLdnwP+F/I9xYwWbi10s62+2DmhPijHa25PI5gje3iWwzZfy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(26005)(53546011)(2906002)(235185007)(36756003)(38100700002)(7416002)(316002)(6506007)(21480400003)(86362001)(6486002)(33656002)(508600001)(6666004)(83380400001)(6512007)(66946007)(66556008)(2616005)(8936002)(4326008)(66476007)(8676002)(6916009)(54906003)(186003)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyWjwqXg5DcIhgw7J8vyIKaebc5F4VWfXMy+7yDKV6Ws9mKFpdEq2yVlz/Ai?=
 =?us-ascii?Q?Ardrj2zoe11hxEmRjRaFtkzCFz7oto0ffEy8M52Bk/QPr0UNZCxU4sszbuaC?=
 =?us-ascii?Q?N8dwuQ0IvvXzBQ/Kiy7RQErGC0moOAI7/0ZtXBSUQBB/vEGrmzyiohxgbF1v?=
 =?us-ascii?Q?bO8S2y1tsyKG34ne732RmRW27zW4Z6vVfRIf0oDWZhl65Vjt8tQDsEdVS+J1?=
 =?us-ascii?Q?Szx9cbYEQlYwT58uMMOJ+pCGUkF80UUXxBl7NZsW++WNLLcTD8+jzEa8kMZY?=
 =?us-ascii?Q?KywXkNyIuk4d4iqlJcCJt8z59Pq/fOYqL1XM66jD9rEa21zCWizubOOrDp3V?=
 =?us-ascii?Q?6z9S/DU4/Nwan2WGXJJSueM2y9wJqFo8iVvx3x4C1+6qn5L6VjZBYTYNXdf7?=
 =?us-ascii?Q?ZdQAtdxYEAE0wbAruWNJD2vTxUoBkpp146+iDheOJajZ5xlf7PhWsQULlqt7?=
 =?us-ascii?Q?zafx76dmhvuktBjLPS6Ane0C+l2qux14jNOTzxmao3t8M0hjPYg5TwsoUH22?=
 =?us-ascii?Q?uTcgZ/wOBKjbObEworlOzJVlt3ziK1jMeJ7I+2CBtf7/Y7MoK7zl5LbBpTkR?=
 =?us-ascii?Q?dIYM012cJU7j4JWsgczHnFIp7JAimnwHanAudU0Rp55laBZC8I1u7x3IBPMh?=
 =?us-ascii?Q?AZKxNBSb0DXH/QHAQk0qyB04R0Y4ir8CWIr5GBol51gVZlLqAcCTN1vc+UOo?=
 =?us-ascii?Q?CJEzBs5MNpMtLfugUez43HNpGr0mr9SKJPznXTixKf5TPKr0AhhUFVi/3bbP?=
 =?us-ascii?Q?86HuAYDf6In02RAMhOiLUoKjg7wFTVtiRVT/ryCUAjMDbI1WiP1cUIwiNUre?=
 =?us-ascii?Q?9g2ImMyeYlzmXUmfYxcPNYD77iB7UxPz56CyCIY0MJ5mhSN+gsI9xYYoit7t?=
 =?us-ascii?Q?Iw7MMOCTMBrB+0XmD/IsqDJslCx8HkRYGB1BuOlkEGX0lScI156FWl0yILth?=
 =?us-ascii?Q?YddrFdN/ADWyl3F1wjhMHKYZbObrkcobxdzT2TPAENSScYp7AojN41cT3ApR?=
 =?us-ascii?Q?i/9IIFhLXn4QAGJuK6O3hDqDytqw8pioBFLL0svPeVs6GESz+g0GM9iEOK15?=
 =?us-ascii?Q?/3dFKRH99JbauwIJCDLEn96KRFkxyl4dTnWzM1mXobaJm1MbfifYygwTm9zV?=
 =?us-ascii?Q?FU4b6jpwcCpDoILyaJJwQ0xGtD4sLxzuA58+eY5Itpw+YZNf1SBcOsH8slKh?=
 =?us-ascii?Q?pC9tCTTRmzaIig+YPGqXpN1p/r/VOb5bc34pOd1U0BsQm5baQGt7Z6ZAMMpr?=
 =?us-ascii?Q?zj13Hh2Y6SH0LY3YJjRNwWKbBxLxYTrafXv3o9oLQO/ZoUBQ0k9l16tA67lT?=
 =?us-ascii?Q?WfSbvzK41KvAHnZ6ewT0d/jPQ/7gWdIh3jOJrPnXKHNvuWtquvPaoCPBXgMe?=
 =?us-ascii?Q?RXby2ltM4oHKBXZC+lpcKPv7WbkH0LHpnih1ziRM7i6zUNRH0yDh48YAzM2M?=
 =?us-ascii?Q?jYHzC4bD/pOy8INnuR0HPCDluQ8F0TsTxIsi0fMFKky1ty4Tyun1XSAMhv7h?=
 =?us-ascii?Q?ARP2qHmzLRD8iFi1z2WkMXZ1vMNZYVJ8sQlFQ2xwIwlUAY+DZ0TpL7/uGTAc?=
 =?us-ascii?Q?oBeVLVc7LWpsSrLPFKk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20917e0a-a961-4871-68e8-08d9e0203022
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 16:31:50.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kzIZUhao47dehiVmy1vehWJbD6a/0j8aJYY3EJSaeIeO91AEyUKyvtQklwmHFzy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
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
Content-Type: multipart/mixed; boundary="===============2340205769586727086=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============2340205769586727086==
Content-Type: multipart/signed;
 boundary="=_MailMate_02D44EC6-7A0D-429E-8C5D-30A5308D6165_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_02D44EC6-7A0D-429E-8C5D-30A5308D6165_=
Content-Type: text/plain

On 25 Jan 2022, at 8:21, Oscar Salvador wrote:

> On Tue, Jan 25, 2022 at 02:19:46PM +0100, Oscar Salvador wrote:
>> I know that this has been discussed previously, and the cover-letter already
>> mentions it, but I think it would be great to have some sort of information about
>> the problem in the commit message as well, so people do not have to go and find
>> it somewhere else.
>
> Sorry, the commit already points it out, but I meant to elaborate some more.

You got it right about the issue.

And I will add more text in the commit message and function comments to clarify
the situation.

Thanks for your suggestions.

--
Best Regards,
Yan, Zi

--=_MailMate_02D44EC6-7A0D-429E-8C5D-30A5308D6165_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHwJfMPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKolUP/Rxz3d5dkTf+vh70+ghZ7cALVcsZV3hIRKJS
BgW5fbBB/Tb1frZPW9wvE/KVifOSb9N/ECgKCaCsrdL52avxTj+ZpdJUEIc+rWdK
J4WHGigEo1OAK5+6C+hG4AbGjFfaD4CUnuoKb87XLCyYWT1R/GfPpbuZh5p17tOL
Vc7R1GzeeFQ47y0AZOLSV8diNE9xc5fPYoKIOfWXDZS2RUK9t7tuwWooR3VxGMEa
+TnAH11l8uB6VYF+50cUXpe2lkpWgNsQD3PknOAwCb16LIYtAaLIJ8YESr6OpOtH
F0J7bca6QS7voEKq+Gq1P0u8vHbHXRAUl6FyfLthDvFtYYEQrvqqsMJRcJe2bchS
DPzqkOrF1SUZqTF5IRBYI7YhSGRhlLnkYCv/wXE14t/s0z8HqgDd925hpcrrGw3l
9rsQ34VMAkG13Hwyzb5L21q3tcyug5NC3dA7oAYFMmBLT7Zq0T714EwrVtWrNx6n
XLqnyIVvJm8hNGLHFllay10nrxvYk6GuJPngUCl8rI430iPOyLZTtktF7jpzmsL9
Ym+xZKEafUnGH/4YTRBZ61gV/m0LOHJnUozBVEf7+Qykh3SzR4+b6ax7o3lv34YC
DGsC+2m2FuwMBnzphJT1zq2tFS1WxmEhTBM3e4PFe/GQ1Qm0qdqP+R8mydf9mrFV
JoF8wBK4
=07de
-----END PGP SIGNATURE-----

--=_MailMate_02D44EC6-7A0D-429E-8C5D-30A5308D6165_=--

--===============2340205769586727086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2340205769586727086==--
