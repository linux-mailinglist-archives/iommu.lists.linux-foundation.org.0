Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70C559B2C
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 16:14:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57472425D4;
	Fri, 24 Jun 2022 14:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57472425D4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TAoK2TQu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnXa_-SKtU5g; Fri, 24 Jun 2022 14:14:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2CF3D425DF;
	Fri, 24 Jun 2022 14:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF3D425DF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D4F0C0081;
	Fri, 24 Jun 2022 14:14:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B156EC002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 791F66147B
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791F66147B
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=TAoK2TQu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBiT3i_tLgV0 for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 14:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C618D61470
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C618D61470
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:14:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP6/i9Mmxy86HvLjMmKDz/ui7ji0hENQBFQjMZCbus+xVwGMVK67cbd3t9VrMKRz2Q1rQE6wuTE5lNxsqgNepUBQ3wBXrVcVrFsTV8/Fpnco3pAOGGUoQxp2rF5yL5E3/HBAon5jZg+0ijwuhS1aOv38qdcvDooLA+ZCwywlQGJjHP858wREVKlSI/ZPx30oykx/PiEo4YSVo6Z5KSVRFbHhHl+O+WqFC1NUpJiGQYq6KUBxwg2ItmATK4LoIG7sh6pOAmzkoMGNPpDMj2OFN7+OZ2TB8WvQYvQA7WawCTkIGlszbqbC/SpncOxDdNzYvMEkfbhFLOBOhw+LH+HwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6m+COAtBKRutvAJjUxkbnYWEgjmjmFUhOLFXq2RG5Q=;
 b=inQjL4jBXcOh3F5qUPp9lRHK5gb45OJDRkEFsyZ2qOaLCigX9VVB06ACKxF+R4hIN7zKYDKQE8OFdtR9HNAMipU6Tk4LYmHbfxpugfQu3mXbtzOwJegu1geZlN5Xl0uODCQHGDMMMYxaccubCCA2z3atKymK//8LmB5jNsK5YYIiHZkjdtABVQ9prcH+rZ5DgKpM1I1B4LJyOopjoszkf2embLnjbzFPm0eSoTOGRJ1Pi3rr+VpZJebxx9zcedod58AVAPbfQNI+0GsUfrI6i0cnMsDaTlU61p1F1Swe5NocNXyNwmBNrtmOQEE6L6I/61NHJbCIZvAOnFfSGaDI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6m+COAtBKRutvAJjUxkbnYWEgjmjmFUhOLFXq2RG5Q=;
 b=TAoK2TQuSzPbwKhO58lJXo6dD3oYr9r61ZnhlA7XpAyErRQu1TdKu5ZgcVMfTq8GcAN2Z96yb1ElG7uocvqY3N3zLqkRKKvYbK+xabUNRBf2qGv8qvF/7j8LEUL8XvIzN6zhjqlqxz9eK9CzOa3dX3uAF5pG2IgWivu1/cZE6pnpCumwdGlB1f7RqsoqmKPrTPcdEfslILnpCZvw/09riUfqRJt+XDY/LmFwJe0vduI+E5rXdiOTtIHjMciboTBofOEN2m5X+caT3HwGXylqV0dgGa1FI6Cqt/T3YkBnZwhjuzEl5qz4cetXgf6VvWX6aXEl656ShxO5lN95A7thGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 14:14:10 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 14:14:10 +0000
Date: Fri, 24 Jun 2022 11:14:09 -0300
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] vfio/type1: Simplify bus_type determination
Message-ID: <20220624141409.GR4147@nvidia.com>
References: <07c69a27fa5bf9724ea8c9fcfe3ff2e8b68f6bf0.1654697988.git.robin.murphy@arm.com>
 <20220610000343.GD1343366@nvidia.com>
 <4bc34090-249a-c505-3d90-f75a7fe7c17d@arm.com>
Content-Disposition: inline
In-Reply-To: <4bc34090-249a-c505-3d90-f75a7fe7c17d@arm.com>
X-ClientProxiedBy: MN2PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:208:23b::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09cb8452-125e-4aeb-c93f-08da55ebcea9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cat3jvAfLfoa3XoGaBjoeXw0ryynUU8IgG/8TiXhM3roCyJROLq+hL83sZWu5I8mO9kE+aD1AxMUjq95whfKt7SDXemqzzN/2CQXDfpNimFcf3c0py9us1rBM+x8B5z4HzSlaC0igPEpCrHtp9DFYa/U6LQDhN0jOGOmxJLbzAyxQBU/7tM6S01pLAnCZA3Gi3wMfKp55sB4Ac7dStYVZ0drgZKu6evrIhUfaGbrG7+K+v8MeCYM6afCtc1uGTasaIQwSN8M/vFXhOwV6yjHEfUWNqWmF6CnsRZlv79Tuj6bJnIGBuc2Rr/KEW7qbP5NbsdXoUmPTpTQ95uEgjZZtkuWsU1GzLgJtREd+TF1mV2p5lrYIeLwzPTUm0/J6gVidqc8KeNWejd7tpzcqHPsoS1ZWZMg/CwI0YCCMUT8qjPys/MffSbKTfc1kvDb2YOv6KQpx7nxom6nW7x40mfmICAyzLY81EM1qrUxH27J04MtZx+Pao4SKpxHWz5dBMlkNpNo5SFEsicNxDD3OJUzmmJpSiDm+SJWOpGs+35N2oj5tShVXJTaZZ+rLjouGPtahm4GNhup9Dmhz38MMo+628SbFa/2rTSTxyDfns9fpmfVfQstFOR7fA8CRNJFO0iFoVcLDEQCc++VpJYEh360xOesaKvhlAqY9N5wMihJFK5QgdNcNlOIq0rFEwpVlV5yrrdzi5O16qqNGd39+uZfVFz4W+VT6S5lrd2EscAtSE+h0O9KTTSIwpouKNHevkE+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(4326008)(8936002)(33656002)(8676002)(66556008)(66946007)(66476007)(316002)(6916009)(6486002)(38100700002)(86362001)(1076003)(36756003)(186003)(6512007)(26005)(478600001)(6506007)(41300700001)(4744005)(2616005)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndNm/pZtNfICcOcVMtE1JiplmDZ/FVinMrb/Imx9+B1WIn41HDrUEeuJAEIN?=
 =?us-ascii?Q?reAmZrwhdnfqEstGU9cBecGPd073t/eAqqwGyREhpFOVMwYskAV/qFbpV+2q?=
 =?us-ascii?Q?0Fb0TeI+nSmPQ5AWNdkT+9H0YyIPog+4kWrqCf9fse639rrjAN1hS3mWxo30?=
 =?us-ascii?Q?c092hM+AHoevHl8B/+XPhW5MxcDbMQqPnESpfpDiN9JC9r4/GhJu/ZKxz5qK?=
 =?us-ascii?Q?JrpBUXlg0ULGc4wLQPtJ3Vd4RFrqP+jd1FT4KeMI5VQtLCysND7fIPFwmIfk?=
 =?us-ascii?Q?PCJJXmi3t7ZtiltKbNE88evblcsoxR1XW02YzjvQWN+3U67wXTctvGV4wCsQ?=
 =?us-ascii?Q?Ab1nxFu0iCmXuaw7p9mrBed+KoZSPZiZRmu/radScEwDIqVt6sVGAdY6jxFl?=
 =?us-ascii?Q?2Oi/i5v34PnUWlS9kf/kykW7BW4eMKWqvBUcmFkbZqwPxVds7PxbCoXBItSi?=
 =?us-ascii?Q?VhrGe12nCxwxxdunDgm/QhbS550G4h6uiOYQ2+WbiRg6MqZNB6oxZhSr8pgY?=
 =?us-ascii?Q?eCa/yFk1ckCiFp9UMYL0KjCqaZvSmih7pA94Iz7tX3Uqs+P5/Z/efYHak2eZ?=
 =?us-ascii?Q?X9uzbQA6PdoghixRb34/4ymvG9R6S/z031kjcjkri4XhqYqAaxUKekcMlN+g?=
 =?us-ascii?Q?x6iksms02ky1aElzzcgs/OnztxKm5l5LVj3nsRC4zJnuYZRLD+aKSRdOP5LS?=
 =?us-ascii?Q?oErz32KzrF6VUf1yuSEyYiO1h1Yf+07OOju5dA9uXkZVCZ4Q8wPykH+Ijp4R?=
 =?us-ascii?Q?IHEB+ZsSXE1cVv6znvXKU3mfPOSpHDrZ1tKchYoNwlxc+40/HCqy0FEAx9md?=
 =?us-ascii?Q?UxzvixBnj72ejhp7AkmwLFnCeKTTvhfqEPbT7JaiJnsw5tHcH2lRtsOuNx7x?=
 =?us-ascii?Q?3etplBbazvtC8Zcg9nvlWFhuHb9LEafk2bGltMfHvjbQijqhakA8jZjAEiNF?=
 =?us-ascii?Q?7CXVc9nchAW6inwvPF19ixwRUzaeJ6xpgWJLPa3iJyx+8s8vmFTf79LRLBMB?=
 =?us-ascii?Q?4N4/dh5H83g60zy8nD8TvJMLfJCq07KLhsIPK0oS5Sa7eVzWFndyDY1b+HP8?=
 =?us-ascii?Q?1FZK62TBgxIyAG3/VmYBCCHG75re5HVM4iSgoiM77sa+RCx9jc+NNWmMkQjy?=
 =?us-ascii?Q?uRxrl5q5PQmI5/H7PUeCyuM1WI4lujDPwiaBX1WkktMrFQutVTVyBJAFrVCZ?=
 =?us-ascii?Q?28yaN3j2ZCMmWRgDgtqgcBZebEWFIgsPdsDIY/q/b+Si0xCYm/the88AWNOA?=
 =?us-ascii?Q?pl4TD+AfJqG0JePvbkS/IRKeIeUY+M0vFrh1a2OnKfkrMrqBGVKjSIM5TtHF?=
 =?us-ascii?Q?Rk/J+Qhj/drU+tXIP7GjENH18124/NxW+B8W2iHUEBrVpY57hibgAsdbh2EK?=
 =?us-ascii?Q?tcKTthej8ZoYEoF7Dr5KuOlLIdpoE+pgDGhIoWVK+tsIY9Sh9JJj9nQGg7CN?=
 =?us-ascii?Q?BVB7OD5lDcyCtz64RHqJADZGfLE41bmYDGUlFrqKOjaxmHVFCl6q4ZQYoCXq?=
 =?us-ascii?Q?H6VTOhDk3Sy3jVRyO5H6isNtZSQWz4Ml6ftafbYk+xsvL+cBzc610xnOQacM?=
 =?us-ascii?Q?ihVC1Dq8TuQ8keqMyf4rmPNVA38oEGNu2Ud2DjZk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cb8452-125e-4aeb-c93f-08da55ebcea9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 14:14:10.4097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkCJBwju9Ky9UKrRiyMJsgeK0x/fI0tIQLHHZ0MC8iCfEAteCsCMnz0AWd10pVDc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
Cc: iommu@lists.linux-foundation.org, cohuck@redhat.com,
 alex.williamson@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
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

On Tue, Jun 21, 2022 at 08:09:20PM +0100, Robin Murphy wrote:

> Quick consensus then: does anyone have a particular preference between
> changing the .attach_group signature vs. adding a helper based on
> vfio_group_get_from_iommu() for type1 to call from within its callback? They
> seem about equal (but opposite) in terms of the simplicity vs. impact
> tradeoff to me, so I can't quite decide conclusively...

Ah, I've been away and only just saw this..

Given Alex's remarks and the need to re-get the vfio_group in the
helper, it may be very slightly nicer to pass in the vfio_device as an
argument. But either works for me.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
