Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7A4138F7
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 19:44:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65324057C;
	Tue, 21 Sep 2021 17:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmxjMoveFSyu; Tue, 21 Sep 2021 17:44:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 323CD4053F;
	Tue, 21 Sep 2021 17:44:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 122F8C001E;
	Tue, 21 Sep 2021 17:44:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97DE8C000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79F324057C
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2ZmIAAnWhXH for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 17:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4D74053F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVY7iorAheveUduDLPN9uEZwknorkf6Eu3ehKZd1jg5eVeRKbCkSocIO8I+EV8ByhAhKpgpFST1GXQuixJKxeyCZWN46JZ4HiHl8Ot16vwrG4XbBGSoWHdA8VFqt4dkERF1m629oaQyJYSc3Euqiyy1+Xn2nS//4NW/Ps6gsKqCIc5K8JJLGRjO/7Kn8bmbVNJjIveaJ2f+hghMPkiMlr9MG2Czy4rKJ9enzGNyckA7f0sd/ZLkgmXErb2ZNodrFl9MyzwRSTV5mLnHb7sPdFrD90UeS9vHFgemgR+pzLQsFwkND/UbsyLMJIlfoc8wM+L+1xa64/6kXmWxu2h3TVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=mpvTgkPWW9/7ALFmDuqobETccHm85ScQnyKr3eW8uQ8=;
 b=Oa/7cg+yFYkDX/J6TWykc5C4dnlrmvBMC8XSMCdqUdUP4lvYs9YG2wLdLmJgKgMxeJtPnefbM5RDVj/eOosjPk/SAJjMgMJUWUpuzMYueSJpdm7IzWsmGziYjGjqGi/fAZpdFsogLgSx71d7hHyqjdlC7LHMMW+zA8U5P2kbUISMkqd20XKyg4I0KVBFbcRKT+p4GxAq+B8h8z1d5Txk1lcj7JvTs0145Veiy31V3PiPe+UfITQmnEG1do8pfDDSLbUkNoNYfNkWMxtoU3ADDzKXjmwuf1hU/ahtrLq5mr159d7mvxqtNk7Hsi5UBR2heio6BrEi4CrFrppHk2WblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpvTgkPWW9/7ALFmDuqobETccHm85ScQnyKr3eW8uQ8=;
 b=V+a8mj/YB838cJsxTCfxg00gy8RA4Z9HXz//5m3sIY17hGobKCMlzFrHz3L0047+gO8rm1os9+gPevUcEetLBxf+Xmm/EqM5yEucSIG6cGMT+V7R40jFU4O5WVS8SIHOqgm5J5y7B4DXaxGfchlSBmqhW0LHsvt7u3kbELi09bxHtl6h8xawbZVemZPh+7M0hUARkY1cRIGIospzdHGdCe8AcqKJ1i8exbF3zKAsZzeuikgNnmYilar+gcEkXMWfDu62MLGWQPhcsWZL5ZC5L/m0XD5JFtK7SE3vwBbbjDX2fa3W6fXihVSsHiJvVXbNnPSMKJ6lNZr2jvXIEXr1Xg==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5303.namprd12.prod.outlook.com (2603:10b6:208:317::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 17:44:39 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 17:44:39 +0000
Date: Tue, 21 Sep 2021 14:44:38 -0300
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC 11/20] iommu/iommufd: Add IOMMU_IOASID_ALLOC/FREE
Message-ID: <20210921174438.GW327412@nvidia.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-12-yi.l.liu@intel.com>
Content-Disposition: inline
In-Reply-To: <20210919063848.1476776-12-yi.l.liu@intel.com>
X-ClientProxiedBy: MN2PR12CA0022.namprd12.prod.outlook.com
 (2603:10b6:208:a8::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:208:a8::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 17:44:39 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSjos-003X2i-MJ; Tue, 21 Sep 2021 14:44:38 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 437b6f8e-ff70-496f-71bb-08d97d277c63
X-MS-TrafficTypeDiagnostic: BL1PR12MB5303:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53034E4AA483ADCAECDC7C30C2A19@BL1PR12MB5303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYfN+Pg43rQC383RbaTg2aQ3Sd/YqIO5CvyGlvilsXjyDI3YfjAEyrQAT6mTM/PKU9ordtVhHneSeKrihN41JmtA50F2BGmUzNDU+zuR0D/vBzKK1+OQBJ5rbHbr79NKY9Rxm8NDpSKa1Ybk6GcTYRIYKJf8wMSMaPDVRi/UC1mjUZqenrcJH7oMa8yhyUl1rynPXEhsPn/EJ3LEEe63ptLMh8Ggs1dfeFkWxw2gnhYvcKeO5FYct1qHEHeanW/kZtk98oKUIu4mvwwrKiNnG5ln8zysxhr+TsTWtngCDPFj3yB0AT4sqgPb97LZVmFK/F3nB+zEkIMNqb1B5hoUeai/5g2XXqyIQeByuTlwNCmd7FXy1NDrP8gqPIOQoDTdOcDwe6Srjh7GfMfeBdcM9mDaklw6N4e2ucLqty8YsqZRllzn6vW9jKjoORODm9rwj1ZN9/3mueBMCuF8XS+rLCI/ite3YsJ1tUp7MLi+djHBsUe1OiSSpweylWE81za42bRrWGWTvzb0Dhy7tWWm/jIntwE8fuP702KW1mbKxdjRXW+kIfoRMOfV55A1MkpQqcQ+HZ/jbj4eIdqld7DkE3imnkz8y9VvD0Ug617t+kiuWvy8jFqwoZf6OKEymDh+5TGgBgh+vAAA/cvAnqagFzCcD48g+Hjj4TSUxqQ3K6ZFGHFBxqb/sdcjOQoayDYgIz1r8Vr+OM97OBZuFuO9YftYJAzxXKxwQldXD4qOxoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6916009)(186003)(33656002)(83380400001)(86362001)(8676002)(9746002)(2906002)(36756003)(66476007)(66556008)(4326008)(2616005)(66946007)(9786002)(426003)(508600001)(1076003)(38100700002)(26005)(107886003)(316002)(8936002)(7416002)(27376004)(84603001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ODcqI36tS0FVjupGscPem6SzTLUQlMNFfA7u81BB1hT/E8QxdXBg7eGnp4r3?=
 =?us-ascii?Q?XnVWucAeKinhkeRUsqByfdw3/drbCXQDFfCAPn+vmeAfXZqyaZGTMc0uHhtL?=
 =?us-ascii?Q?DUfbpA2CBrFGn1C721o+URM3cyhrhtlwm6R4vQvv//dLnRn8ULJC2Xn+4oCN?=
 =?us-ascii?Q?yLmZk+AlLUzqZXJUIVVonkzdNrWK+owE6Ry2evuoGiBeuBwO+5Fn1qnDFTWg?=
 =?us-ascii?Q?S2FlMmr3/7lCuTxYFji/xXMpm0LPmv3w2InlAN1tLiChnv27/AIs/2KYWf8P?=
 =?us-ascii?Q?XlexSgmbMQHchBKvLPliqJxyg9hNTJU6qqju8VAsovI8/BzrZLyYqcJzjYPH?=
 =?us-ascii?Q?6cyzV+KoIGY/L+2vfavuSqf5zRgrNMmmQQ5Op9I7qfNwbfdospIEoXMAmmKd?=
 =?us-ascii?Q?8DCvS163VKu12j4V+wD+tcbgg79EoMxVsLSQb0rrt5q1zJVtKOR4WmnAEg1i?=
 =?us-ascii?Q?J1qByJBD/Di9+P+6gynEoRBrq86pgiBeO1iS2Y/eocnd+j06W3BI7/3dTdul?=
 =?us-ascii?Q?1XjfzRGmapdoK606usaa84vNTry3bVGmaYVfdr5TjSU8f0jIexnIvVmwKFhY?=
 =?us-ascii?Q?b31FC/Kcf3u9l6LwDQy0AqDy6zAmvPKFXRlFvsVArcYuf2A5rZTzCvM0RVxS?=
 =?us-ascii?Q?b4v4jkZjWEYyjJz5aMse57+2K5CFOVBpwrALEAlZKRSwMrOfwVxXIgHfwTXz?=
 =?us-ascii?Q?TtBAwDZkJRJkUzbY8diyDVnq1dC3WWMBQvYYkqbBwGp5Kck/L+GpNNKvMszT?=
 =?us-ascii?Q?urlKu3Ot9d7+/cDxIDQi8omnrWyR9FRGtYqppWe7TRfCHwqzSuLB1shMsMM2?=
 =?us-ascii?Q?ggNg6ncbikOpn9uYWKjOvr9XU6KPV+Pxo5ne4mm3CdMXGqSzEhqV4cKFkGm7?=
 =?us-ascii?Q?M142VJrNBsHBJuxTkgQxwqYMCF6ioDbIp+iFeHJbnTCiQIWubdpXTjj1+2n/?=
 =?us-ascii?Q?zx9G0ieKBmL/p3sh9j42gpEb2ws3mE8DQ/vURHk+vG/8fgFQORUnRO/LowMB?=
 =?us-ascii?Q?9t88oMZaEaC7BX+ZyHHJpqjeQxbAwczjImaRhTXvqkrKGAwdURSqForv5aqb?=
 =?us-ascii?Q?3F8Ew+QiXYDzJjtIlKJS+1bS2uGDGFYGhaa6L7XivygkYEqhtZs/zw2j2fV6?=
 =?us-ascii?Q?e3sXfJ3FKPPq+N5em5WgpA/fLbcH8EHyftcz/gUuHn2oxnj09sCBY8rQ2z4n?=
 =?us-ascii?Q?mjO0o1ntSFmBD72+7WMzrvsi1aj+4OCu1Jm+BRGI/e9s+vXlwjFo8yX4AYCT?=
 =?us-ascii?Q?vn1x6WWyg8oMEykVbxc/E2Wqy+J2dOcno8Yl1D4fVcavDd5UqDWE6Ctlknup?=
 =?us-ascii?Q?YHLOnBTARKGOitGnW3chYcEc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b6f8e-ff70-496f-71bb-08d97d277c63
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:44:39.6621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxiHgtY5UDp3RtxsXwn5NZWjKYxrWfp6jTE7fUOcqLg4Hm1sI0SADHF3/p9EuVH5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5303
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, kevin.tian@intel.com, parav@mellanox.com,
 alex.williamson@redhat.com, lkml@metux.net, david@gibson.dropbear.id.au,
 dwmw2@infradead.org, jun.j.tian@intel.com, linux-kernel@vger.kernel.org,
 lushenming@huawei.com, iommu@lists.linux-foundation.org, pbonzini@redhat.com,
 robin.murphy@arm.com
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

On Sun, Sep 19, 2021 at 02:38:39PM +0800, Liu Yi L wrote:
> This patch adds IOASID allocation/free interface per iommufd. When
> allocating an IOASID, userspace is expected to specify the type and
> format information for the target I/O page table.
> 
> This RFC supports only one type (IOMMU_IOASID_TYPE_KERNEL_TYPE1V2),
> implying a kernel-managed I/O page table with vfio type1v2 mapping
> semantics. For this type the user should specify the addr_width of
> the I/O address space and whether the I/O page table is created in
> an iommu enfore_snoop format. enforce_snoop must be true at this point,
> as the false setting requires additional contract with KVM on handling
> WBINVD emulation, which can be added later.
> 
> Userspace is expected to call IOMMU_CHECK_EXTENSION (see next patch)
> for what formats can be specified when allocating an IOASID.
> 
> Open:
> - Devices on PPC platform currently use a different iommu driver in vfio.
>   Per previous discussion they can also use vfio type1v2 as long as there
>   is a way to claim a specific iova range from a system-wide address space.
>   This requirement doesn't sound PPC specific, as addr_width for pci devices
>   can be also represented by a range [0, 2^addr_width-1]. This RFC hasn't
>   adopted this design yet. We hope to have formal alignment in v1 discussion
>   and then decide how to incorporate it in v2.

I think the request was to include a start/end IO address hint when
creating the ios. When the kernel creates it then it can return the
actual geometry including any holes via a query.

> - Currently ioasid term has already been used in the kernel (drivers/iommu/
>   ioasid.c) to represent the hardware I/O address space ID in the wire. It
>   covers both PCI PASID (Process Address Space ID) and ARM SSID (Sub-Stream
>   ID). We need find a way to resolve the naming conflict between the hardware
>   ID and software handle. One option is to rename the existing ioasid to be
>   pasid or ssid, given their full names still sound generic. Appreciate more
>   thoughts on this open!

ioas works well here I think. Use ioas_id to refer to the xarray
index.

> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>  drivers/iommu/iommufd/iommufd.c | 120 ++++++++++++++++++++++++++++++++
>  include/linux/iommufd.h         |   3 +
>  include/uapi/linux/iommu.h      |  54 ++++++++++++++
>  3 files changed, 177 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd.c b/drivers/iommu/iommufd/iommufd.c
> index 641f199f2d41..4839f128b24a 100644
> +++ b/drivers/iommu/iommufd/iommufd.c
> @@ -24,6 +24,7 @@
>  struct iommufd_ctx {
>  	refcount_t refs;
>  	struct mutex lock;
> +	struct xarray ioasid_xa; /* xarray of ioasids */
>  	struct xarray device_xa; /* xarray of bound devices */
>  };
>  
> @@ -42,6 +43,16 @@ struct iommufd_device {
>  	u64 dev_cookie;
>  };
>  
> +/* Represent an I/O address space */
> +struct iommufd_ioas {
> +	int ioasid;

xarray id's should consistently be u32s everywhere.

Many of the same prior comments repeated here

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
