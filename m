Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7C48661D
	for <lists.iommu@lfdr.de>; Thu,  6 Jan 2022 15:33:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50E96FBFA;
	Thu,  6 Jan 2022 14:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3aI6gpBvZE3; Thu,  6 Jan 2022 14:33:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A72756FB82;
	Thu,  6 Jan 2022 14:33:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BA4BC001E;
	Thu,  6 Jan 2022 14:33:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31DDDC001E
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 14:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CB0F81A30
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 14:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUWHEg2upzNE for <iommu@lists.linux-foundation.org>;
 Thu,  6 Jan 2022 14:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABCF981570
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 14:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myUrSXXkI3aC4Edx8d2eRZU+BuA7bFTa9Hjhh+2TbTv4Q+u7wcXNvsfTt/hCjtxA18OEf5qlUvGw3CRLzPzKJ6A8flP15xC46knq7PTt/T/u4ghKh86Kltwdge3+yCzolbx5lVYSbTbdYf92B308I1/UF5Ui18IjTSR7VHhwSU/5kxQjErsfGT0T1k10KH94ZjMf1OYbb4CUsN5YlWWProUXghr5EPOD+ZP2Ei0ERvuijfQyuzFgj7qUO43IVUxXxUDsFB52b4hs7q4xuIisjzOPq57fcDfc8UMoLd1XrQ32KRtrBJXCusnM1+e84EYf8T3JF5+VK1K74oH+if0MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHxCmI8jTjeg6+fhOiuhdFJgFeW45Y3InVFyBiQpEvg=;
 b=c4SrUDQ4VX0oppFB2JN2BE89zP42kvEDUFVem0ApZsEui+v2TE3HBdjKDzmBcvh3Dtp0xrQzykfeMFuHNXsoYSznoIu7aSOJAH720uCDbpEhmrKgLvdP5PDfsZrmXt+03uBW8XpPeQvHvdnTd3rrVospxBQ/As6oFicg+zgdPw8phxmDGuAAf6RiMugB5ZzwuxT0yk2uV79Pe9Re+gP40T7Vr4VKTESjhLWOdGu+fSLaIjxXJHsBcMwsxSaSk9AJ6galsegkqtRswKcbTw/+fp0EIeMOfUBq7HuKDd62qd2JrJp1Pvy/yJv6zV98DB3nau6ZmTOeps8RuFUa97122g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHxCmI8jTjeg6+fhOiuhdFJgFeW45Y3InVFyBiQpEvg=;
 b=k5VgF4x9xFfjH+Cb/6S/EiakM2aYvJOw3aAEmiQfOKrAh4+d9taSKDfDCEmEaCsRNiZJIa2LpqOAFX0hZmLicqn41KXEtMN/D8AanhkmKTuRPBtELD6uIAe3Frsn5rpPNo7hSn7ToulDtSO6ulJvkdcNv3anuGLOukf3RqYhN2BOu6OCGVLkLcJRyJVWOwPQPmmmWJTqRLYqzNbIK8YQFvjs33VWhFTX1wiOZ8vcwBMefcMH+S/idFuJIAdBOfmtm5ZakQVL5VVn6h3ufSY1DncHVgs9imbIOXFMVqNBsQN9SVHaHfYihITEp2zyWEgA9V15QtIPb/LA03BPudUufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 14:33:48 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af%5]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 14:33:48 +0000
Date: Thu, 6 Jan 2022 10:33:45 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 5/8] iommu/amd: Use iommu_attach/detach_device()
Message-ID: <20220106143345.GC2328285@nvidia.com>
References: <20220106022053.2406748-1-baolu.lu@linux.intel.com>
 <20220106022053.2406748-6-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220106022053.2406748-6-baolu.lu@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:180::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ddb3386-d0a3-4710-81fa-08d9d1218cff
X-MS-TrafficTypeDiagnostic: BL1PR12MB5361:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB536140221A3214DFF11DCE5DC24C9@BL1PR12MB5361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJ2fHasLfDWflXlo4WCpLS2sGbsEsiIADjls92GbOK7p0BMmVXf8UPupSgXOgtvlHh2AjSsPDvjOv9GOqYHsaKlvYkw5DnBDGkZCvo39wUyW2m2IL76BmIJ6G65wINJ75a4RGdI/iSOPPZ+CHQPfNbMONf37JZkXkbOlYm09Iii+r6bAuwUWdd3XUixMVL7heW5P57VbzrRDn6Nfhlyc4AJwiyftJDL6nenR9zB2lWPqniIWXx8qpOMjDrykwtKaEWIkfMTEbRXR5RPhiZK8ILrIlkW4ydaHyZX+dVTbbMoPBsjYi1wVt29sLXKna3j4vnQ0gmn0hCMgnWUlIdNpt8aAlXZ0fdYK/1uP9oMUL938s4H5bpPjVx7qckRJCKPf8mWbyhEoJK3ZJS3Asv5153stE3hjOw2gX/4mskOpTSNReGQWfhzDQDhZCcNpm49EXReeABxvgIKlUiAiGKIXZ6IcGpv3e0QsGGKMT8lXF/L/TMIiP0OOMADQMk9VaDamFvLEnEQMLV+JWpS7ZwMVUd7C9itrmQYCyWAoXWTo4jgIbH+B4Z4NMXowOnt2VRfmvTNqLmAmmoW9eMVM6mb5HNbRg28reKPeZDw9C6yNT9i2OaUl2R5I4IuBmj5yMKHeCPBOzSy8tf1fs7gYVy8UBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(38100700002)(33656002)(6512007)(8676002)(26005)(86362001)(6486002)(316002)(66556008)(66476007)(8936002)(7416002)(6666004)(54906003)(508600001)(36756003)(66946007)(83380400001)(4326008)(6916009)(5660300002)(2616005)(1076003)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NpUuKpsl3cTNefstmlUetmgI/g4OT34PbITmxibRUAnYXsCrR9Mj6LK1OgKx?=
 =?us-ascii?Q?5TrlylD7njBf3A0/ug/tzyr6Rqms+H15wTbxN86/XMu/0AvnRqOX+LBU2YxO?=
 =?us-ascii?Q?5IhblVpgQHahMT2DwGNl91VTpY4IFMPUWpX3fGj+pOBiCHripYXJhqYnct07?=
 =?us-ascii?Q?pgWC7sxevpZ1pkZkGmed5OEwoTUMuIZD/5yMFRbFasynx1aO5LtMPzYjk60O?=
 =?us-ascii?Q?ax83EqiqaNS7SD9eIApB0okIgdqYyqVZ6HrgWcGBhJnAV00oNqetuVDS8x8O?=
 =?us-ascii?Q?o3jzXIbvUlGr6UygG7gySnYb2zsCHsRcStnT2hq8lXiwMF2wbuxkZZrLDe5K?=
 =?us-ascii?Q?em1/5Cb1lL0FzmzBaouWP2HxJ/aziWg+e/WayL3ntVGB4DlEXy8LjM6XqdBX?=
 =?us-ascii?Q?NOkgFDFHNgDdV7SCvzQDgNWHsP34Yqd7JMAd9CAY2IRrwH6t3ANuxY6YGmuW?=
 =?us-ascii?Q?iUJKSAXmAN8Go5pjZWNchiQicHt5hFYvGt2vgLS68OO08WbsKIITTzXjkAoQ?=
 =?us-ascii?Q?5Kvo6bOcE9PPWRX47jYedrTztfxl3oD5LGp5BZxYRGlDLQdLoYDfvi7T3iF0?=
 =?us-ascii?Q?XjJRKTp3K8l1MkKH3RFwD+cRwDpCo2pEvrTiGn1Tuunc6Hwb1RByqWRN1mwc?=
 =?us-ascii?Q?N8hdLnxAUubJV8sL4tSMME6KfF7syQcy4BHo5FiDMOHCnFtflE4e9gxVSbhe?=
 =?us-ascii?Q?jNt5SU+eQnnhmjMSv8tN1VZra/lOD5AN63aNxzeoSLmYcjAgETHG3zcr/lc8?=
 =?us-ascii?Q?aq1bdW75vvb6vlACb1ia8GT37RmVCypRb5PZplLTyxvexMjLtW+ueRnWPrum?=
 =?us-ascii?Q?YyZ4Abdl6OMBxXS9sXzLBh+RJNLmzeD5s6X+ZL650eTs0u7i+P0peFTUWvbM?=
 =?us-ascii?Q?LVXmAAiMU+9CPWHayj93JR4+D82SocJO8cQ0RwnDwa05uTI3ljjZg/309SDN?=
 =?us-ascii?Q?Y1SZmZGEtDrjSfU+WLT3gwqV1SRQADNb1xAV1NpQyWwdow6o/HyrJIi8wSYO?=
 =?us-ascii?Q?ORL7kraftf+rFTxISVFGe+fAAsFlA7bm082yGecQcsY70kHBUUfiBCecQmTo?=
 =?us-ascii?Q?bsdGSJ/tG/5WfqdBItJo5ItN2pZl9hU60LNlcSm9htauy3czOB/du8RIXlVA?=
 =?us-ascii?Q?q8VrsNbouMBL3Q3DRZrwc7rBgqyIhkmYy28X7SqsZNumlpa/a4PsmTH5Uw70?=
 =?us-ascii?Q?UsNn56CHDonKV/WjaNizko33s4LtCo1flNA7IF6AL4q/nHFYacM6JscPWVNk?=
 =?us-ascii?Q?Nt+9D37vUTtGlAATCaV3ANSupwJ8Y+cQroiNGt3QUzNOjuU0IZcuUIZBS21N?=
 =?us-ascii?Q?zMBzttprn1upmv2SHnHuGgyL9BYnkDsADlzY0sNiH/Vh2wBdDxOFj0PmsXhm?=
 =?us-ascii?Q?B8rNUpq0VzC/Zc9XKHzxq3Bn04dNKPwL7aDAlFWZSkcNRv8XYx9GdYYLVZn+?=
 =?us-ascii?Q?fpiWVjwcjYDx2rzhrkWJK3pqgckXkGy8o1LGx0JhHl/CTfxOqS5H7H88m7RR?=
 =?us-ascii?Q?IWKdQJx0YuSZgT0SKVkBw6jGWzxS3a4AGei8pM+sVgIUeEg+KJXpv+pjuQ8o?=
 =?us-ascii?Q?fi6aq1T7+acXFBfIdzY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb3386-d0a3-4710-81fa-08d9d1218cff
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 14:33:48.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sksqKbXm9VKThLfOg0GJVVXomSjkHEeDMbm3cY0E5pKvpApUD/MaaOF7uMewXdik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5361
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jan 06, 2022 at 10:20:50AM +0800, Lu Baolu wrote:
> The individual device driver should use iommu_attach/detach_device()
> for domain attachment/detachment.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>  drivers/iommu/amd/iommu_v2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
> index 58da08cc3d01..7d9d0fe89064 100644
> +++ b/drivers/iommu/amd/iommu_v2.c
> @@ -133,7 +133,7 @@ static void free_device_state(struct device_state *dev_state)
>  	if (WARN_ON(!group))
>  		return;
>  
> -	iommu_detach_group(dev_state->domain, group);
> +	iommu_detach_device(dev_state->domain, &dev_state->pdev->dev);
>  
>  	iommu_group_put(group);

This is the only user of the group in the function all the
group_get/put should be deleted too.

Joerg said in commit 55c99a4dc50f ("iommu/amd: Use
iommu_attach_group()") that the device API doesn't work here because
there are multi-device groups?

But I'm not sure how this can work with multi-device groups - this
seems to assigns a domain setup for direct map, so perhaps this only
works if all devices are setup for direct map?

> @@ -791,7 +791,7 @@ int amd_iommu_init_device(struct pci_dev *pdev, int pasids)
>  		goto out_free_domain;
>  	}
>  
> -	ret = iommu_attach_group(dev_state->domain, group);
> +	ret = iommu_attach_device(dev_state->domain, &pdev->dev);
>  	if (ret != 0)
>  		goto out_drop_group;

Same comment here

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
