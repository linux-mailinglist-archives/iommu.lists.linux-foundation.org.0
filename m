Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53A4AF2C7
	for <lists.iommu@lfdr.de>; Wed,  9 Feb 2022 14:31:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2F58293D;
	Wed,  9 Feb 2022 13:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MLwwA27_Wdu; Wed,  9 Feb 2022 13:31:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 64AEC828F8;
	Wed,  9 Feb 2022 13:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF16C000B;
	Wed,  9 Feb 2022 13:31:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06D96C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0389B4157D
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHeJBl-TD4Zd for <iommu@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 13:31:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::606])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5256441511
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMLwv2BgVNu0rC7nAFJk9GivEFBbTG2cj/UEq8Q8lfcBgqr43mOKEVakQ9MGWGmoz9K98Hcn+Ul6ros3PGlbgYfaii9R//VitmEUqUdNndTaK7hC3tOe/W2aXlm3j++GwL6tfmWgEYBi5Ty0nYfvTceGlBV7hF7mmmFl+jowTB1zWDFKfRynSQa2LSByxWUV8/+TMpmbsTFvbjAMoc0zkc2ZDVplVOk2i6axEjyIOP7Ny24CrzlxtVs6gLCqe+k8oSl2hn4VbZDleLr8DTmggyTguV+PX4uJmySW16RQnfSSiIkoXf7qWtTxP581C4jQ/rrQ/e3RRiV6hCuiPXNPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3OIrGqTgYnAbs5pbqHY7Q7D5/jVMfAnt8wDwuRmphg=;
 b=bVRlFodLaQTNDU3ZyPSSr3GsIHIvYdMY92YuftfUjucnKcOBaHfoaevWQh+TchzHL3tsbnOzpEf/ocxWBqBspL+6LWwDDxNdXaHc+IPqtkWDQYmffcFdx1dXjT24NPm86RXYnm85fkLZGxNW6PhWHlzBFLS6UgecAc+FeNSR10o5LzyDjII3IQS3Y3liKGHQQL9QULFzYzqiiGyNnRZwvSIlma53soqL7M0PdhemYqVKXhxgBFQ2mENYSJv06s55u4gTchLV2igdTneqwgXsct5aRSoj2BZf3mNoS2I45wE4hhUGeUUIZE2pNanZGBptWXNI8zrBFofAQ7InseT+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3OIrGqTgYnAbs5pbqHY7Q7D5/jVMfAnt8wDwuRmphg=;
 b=LEJuoTvf/s64A9/wne0saSQUlHv6zKeOzhd6A3P+Zsxe0tXWf70JvetAmGv33JqyuoNZ/DCDeJ26p9++srVlS7+9n6MPAaRCT5OF7UvsZzIXAmAEyR6pkyMw0oH/TCgunIFHYZ0vNtcbc0wdcO5ttpWE9MlTlCA3ZVMNGngG2Bz+3ijxOW8S8zPw3xPPd7GJGswancry87HmEk0UI8vLEdlPpX+89T3nRYfQJpBjB9ArM/jcIL6krSKPnhR2d2E7P8P4FIfsov9bl4gmGdTYZCyrIxOq80v+m7bzMOyIpjEy/uKehQf1ZaCG+FS3q6+w6pRwYADzioQeN/Zo88D3vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 13:31:10 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 13:31:10 +0000
Date: Wed, 9 Feb 2022 09:31:08 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 05/10] iommu: Remove apply_resv_region
Message-ID: <20220209133108.GW4160@nvidia.com>
References: <20220208012559.1121729-1-baolu.lu@linux.intel.com>
 <20220208012559.1121729-6-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220208012559.1121729-6-baolu.lu@linux.intel.com>
X-ClientProxiedBy: BL1PR13CA0248.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::13) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5e0f7c-c7ce-4c8f-3bf3-08d9ebd06f17
X-MS-TrafficTypeDiagnostic: DM4PR12MB5916:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB591605B36110E0533101768FC22E9@DM4PR12MB5916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGQoBeJrzmIRfhUKXGMqTLXAUWzNMSrTeQSK9341mMjzZF1dFF6oMxp42kn9RHR0XErZi15qdteZ8aQRU4sADz+nCegW05fefkpChuFBMtjJoo7fzxT+Z3Qo7wO3Ty9J00YBC4G00BNySAnltJxGgEbcLQ3c8kdCyREZWstIXo4z8IUjBGUcJIytr53ATcwvn887EIEYOt5AnaHajoq5LfEBoeEd1HRzorVqtkM1rlWC9XHWWfbxBYVz9/dnsREXASfWXk7gWcnR5FyLofe7gYKT7NEpjPECmf+4uREN7RYpcYAB1EfyxM2XzTEKxcjDwUgi+seplzaeZ/Xp4mgxyaMsVUKTBgsZQULnUc3hLpfFap5QTG1LM6Efe0/cM5zGp2p8Aoel7gRAbH0ov0O3pPQabbrqlIz1yXlnDoQk1jqhZP1h755baY4oR8JCwJRoNy2LfsoWJ8hKbmdgc4SKaEZ4qAC7p9GrL7T05bSy7EuwAfL0cYu/KHL6kh+wMU+wJwfawtP5C3Ja5ZbNvY3x7FpdWKNnMaZVkqp1UeJQGPfRdJ3C60SKfWQrp1uw1MwPTueKhLdHuF7tVGZCAXHqCA5q1XPjw0uRRMpSUK6ZXM50lqtxe+KEelJu7NukVpkhf0NzrwmH5N0H+FnRO+0htw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(316002)(508600001)(6486002)(6916009)(33656002)(6506007)(36756003)(6512007)(8676002)(2616005)(7416002)(8936002)(4326008)(1076003)(66946007)(186003)(26005)(2906002)(5660300002)(66476007)(86362001)(83380400001)(66556008)(4744005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QAVf6r7gJqfxgNjyfv2caKD8yiTP5CtBcctTSnBHCbITn+HfHRUZ/wgHbAh?=
 =?us-ascii?Q?tLVYKiHWlOL98Yu0BdI7RAuwpJJ3DD/dl86VLVPowOrqmU6qq3COvK3BZJ89?=
 =?us-ascii?Q?ynqhxlyX6tGKV4YrVQg8MKThwFDDfPAKbsvVW1MVwrUQjf34I7Nqul4MCtGt?=
 =?us-ascii?Q?zaiyO0aV4WOHDyrxQbt3AnfIdbwwmHuLAUbHhpdQ9euvlHGKj3ziUIHo3GuS?=
 =?us-ascii?Q?nDZnw+9RcwIFuPz1SHajK6E0PoFHqhwjwIV2v9Zo5d0Soho/C7rKyWipWpFE?=
 =?us-ascii?Q?fccDPBhUl1yY9IPiFCmI27GLcfhVBzXpK8OwDsP7Yn+jtuJMcq9ORNsEipeC?=
 =?us-ascii?Q?TGHwKKZGS+z/FcXf6SEtFZjYWWWAutKiIQDe9dDrCfWS09mupmiz1jECSJKW?=
 =?us-ascii?Q?XeIM3nZ3TqOq00tEl6kwNjgGFGKnLfntsLTIZ++/CRxn6HlkBqpXUVSKieAv?=
 =?us-ascii?Q?Xgi+2mcL1zqkpVGatwR4a+M5QgECQi1y7nhwWNNPtydbBUg+M2g4PKqvN/At?=
 =?us-ascii?Q?zpX+aybWGz5dhHO+GJhRTbxqtASfyKx/h1LbRjxtTdctTtfxnB2G7dq9WvbH?=
 =?us-ascii?Q?NOii+Mc1ay2T/ZMLfpdbcfCgo7YAi3U7DpUY1QBLba3lUnDyevEdoJeqANWT?=
 =?us-ascii?Q?GL901i1tCcB9E0usMDQ5adUmmoHly6oN6b1vxV+yMzWCAOUeBH2yNxs/tpvx?=
 =?us-ascii?Q?cYHb1uUpIOngdBg1szITYuGhwc3DtwCpkKkC5WWBw3vWHuiB2AKuw8lt0kxC?=
 =?us-ascii?Q?JhLh7I9AeOGcWGtjmkQpfD6wSqhwI11IZqIYfQTJN9pzgEq98v/OZajJpgVN?=
 =?us-ascii?Q?V/6PX1TKsWocB/cpLG/kzZ6thkqNgRuMPx+JxDkrgZnh4b7gA3eEQvRbLGV/?=
 =?us-ascii?Q?CVm4/iIIqtqj7NnFRjrDE5ZMaZaFrXAgB1J3/XLdXo7BRBlrfDxiR1s34L9n?=
 =?us-ascii?Q?06lvPjU5VmkIRf+Pvf95JBaxS3EvCjlNnfzJBMs+aOFvFW6VqTxJNgn8OQaQ?=
 =?us-ascii?Q?YV/jIeCn/SJqXWqKCRsbcIFEy7fAW1cfqa06ZlBWtjGYtkj8jbbA5IgxEOD7?=
 =?us-ascii?Q?V/mpV3O3lTr/x5zFNxJGTjX14Luy2ZZEmz4r3NH7yxutF0MCxaG4sxC8QSdi?=
 =?us-ascii?Q?J1aJHA2EshnWWree7CrbCuI6eV11haBCpwmMOIsjmli2ArkS8adiHGTmbOdX?=
 =?us-ascii?Q?RTyfx72ChTHJppTs+UR8Na3jWzqCf0QctHBDukh8Xbr72GY6eM6bxGNlXMZH?=
 =?us-ascii?Q?UJUZoNNlZ0+bhre+fxfoqMgkZxvL0HgxFj8e3NL9uPodvhglQ7epfX/6JPHx?=
 =?us-ascii?Q?v1zimzrzKHj6gpv8S8sBcaJZ6ltw4jPixHTSB5ao6WAWD1qUnTzF9shEmh8x?=
 =?us-ascii?Q?xn/sZhIXBtrPaGRn5cjnjqTq7hE+GHXIoThDr/UXvI6BmgTvDYITXVS4Q0mX?=
 =?us-ascii?Q?xeijWZpt6FXfILoLJ9NJHsRDNgTj2wCMdLysgcvbzdJUn8RK8nJajaUDUkjn?=
 =?us-ascii?Q?SXwB4vFx7tzZPA8ythaZ2/2UhdrQDqJRDcpj5IDfAorPdDt3NfIz3Jc7eKXX?=
 =?us-ascii?Q?7hW7hcIiEXA62iRIstQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e0f7c-c7ce-4c8f-3bf3-08d9ebd06f17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:31:10.0560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk6yLW9kDkbw96y894KO+UMo1RycZnn1iSGq/QJe3/TbXVnZ8gP9zlfcs+B2OaIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Jacob jun Pan <jacob.jun.pan@intel.com>
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

On Tue, Feb 08, 2022 at 09:25:54AM +0800, Lu Baolu wrote:
> The apply_resv_region callback in iommu_ops was introduced to reserve an
> IOVA range in the given DMA domain when the IOMMU driver manages the IOVA
> by itself. As all drivers converted to use dma-iommu in the core, there's
> no driver using this anymore. Remove it to avoid dead code.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h | 4 ----
>  drivers/iommu/iommu.c | 3 ---
>  2 files changed, 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
