Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACC413973
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 20:04:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A67C40613;
	Tue, 21 Sep 2021 18:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74Y8SzOl424Q; Tue, 21 Sep 2021 18:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9DC0C40611;
	Tue, 21 Sep 2021 18:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 725C8C001E;
	Tue, 21 Sep 2021 18:04:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78BD4C000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 18:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D3F8105B
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 18:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2VreutL2lEM for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 18:04:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F6181025
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 18:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGfrP2PU8IFpXSQtXPnBKwu6c2o060bZBAYQGQZ2GPoxby9Lj7oKOrfW9HoTScaDI/XhsCPyoWE36u+EUDuGWi1GlGSbMqUT9nSYW7maXC/AG2mXcADBTPM3DJBRijHRN4bswOI17kTaAVij+tRVz8C7cH1pAMjMFfRcETEyQwkDG+k0yDnVpTvPu1XONsMIoIfSTRFWZM0d2zuv4TJp6CKWCXsIK01WsZSnnvNwfCAnrfzB5Mpkx1hQ6gIXJ7HndIdF8t3drLzcAMo6TkT33r7IsVJCZuYfp45vrTBCLAeIcp4uARmApjJUIP+V85A4m/3Vj9O1HjarIzMKGULubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lTkQWGEIZdKeW8GIaLbIdfR91KQa46wv/mQV1MHCWn0=;
 b=YDR8cA9nEGhVY09DMTtgECCGPlARddbcTyOSpFUAbIqY0Du12Q0LRNWFFmwTjI1gHoTS4v2dKCIvDMqS83fhubRxpR/WwajVYKN1ax7lHnedQILzJ5Q18+QCuMB+Z94zBlwEAIv+yymrUHr43YAb7cePupbqg5SYKU0OCYumvbfvqcX0/mC/72MBGAo/7QbiMwQ8OzUzwEQmzcrwBY4Wfww53kaZj240XhVALsHHN16duQSjMuXrzadzDgFFS6IJnt3+Hpzg5+U/vmCxeJhLk74hmaTm+/ndSvGNCxuHColP1R1InzAXFkXFRGFA0Hm6nV1/4WPzjPNkEEtIL4loxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTkQWGEIZdKeW8GIaLbIdfR91KQa46wv/mQV1MHCWn0=;
 b=fnlgybI1S+l2LdgE7GudGnxCGxNtTi6wl6ToyhZDwIFsjVLeDEPLZ8GxnovKtLDp0L1cNUQYGvS3zwvTcCPYBoXrQKv6wHfGbyZH/YBhtPPikzHa6DxcuYA5EI1OTzWvoiDzB0CmNt6PNzun7gwxDzrSs4rDpFC8z71xyFiuTCkEocA6+46l4H1t942OHLq5/lLy3aAxPZXTwYzo/RNqJKpucviEQEg3n7UO5BVWxNeNdpoqyWkLJ4rhgPMQ/2g4lj/vSlSYP9xnWGCaUidD2BC5wL+M5xyhyzeSUsAuFHZdoTr+6WYYBlH7nMRIkyNMPN+HxTESRPZNcbY+vjNGag==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 18:04:18 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 18:04:18 +0000
Date: Tue, 21 Sep 2021 15:04:17 -0300
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC 15/20] vfio/pci: Add VFIO_DEVICE_[DE]ATTACH_IOASID
Message-ID: <20210921180417.GZ327412@nvidia.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-16-yi.l.liu@intel.com>
Content-Disposition: inline
In-Reply-To: <20210919063848.1476776-16-yi.l.liu@intel.com>
X-ClientProxiedBy: BL0PR02CA0123.namprd02.prod.outlook.com
 (2603:10b6:208:35::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0123.namprd02.prod.outlook.com (2603:10b6:208:35::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 18:04:18 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSk7t-003XKS-8E; Tue, 21 Sep 2021 15:04:17 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b754d0-f2b7-493d-3013-08d97d2a3b02
X-MS-TrafficTypeDiagnostic: BL1PR12MB5239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52391C985AB0F83D9531FD09C2A19@BL1PR12MB5239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVbTHnD3b0qxoNbnNfx0WTIQvTmR3j6NNLV15x0KFlItcxTiNWh3nJZJqmm3qWLpd2B8Gf0KY/1Hi8jacH6QxrIUPac3/jvOVN/uVd2Izhpff//WZxkawHXp3TQg/jNlCQJ7YX/qAvusCwlamBuaB0Gj63pSnxPBzBq5eaNWoECa9JosD2jbiRD8Bl8VKe2Ntels3PEH7zYfjb7LBwYgpE3/SE/1LEum5j0v702XIcXFVEvFrNQD3Nr4scMcSwmwphdPJOl3dL/sU41OKmAzFMvwdDNLstuxLbSUlAy1Rtw+5Yl5M8IlOYhF33ecHjkmpHSg8pdPx/vfObDj1XPhPerIgoLoqdAwgCDNHsJZW/5pJkE+oq98WyfzVqTr4T4iceustTQ4EeyQYUjnsmqMHMaReDVRUhDtDJl7h56G2pkGV6WVXWpjc1II1Tq4wn2dvxTkXiqHrOs+weXtQruescn5EzokRAq6US66T2fApBNvVhMiVPJ6B4V8w5X8Gi/p0uEq0xsFto7iNqO/Qw80mEQJboL4jpym+W/VhdHVvwpapr3ZCiZbmyb1CkNh6n4bsk628BYPQrXsTD3wdnXWNom+4RjNw53aPufik9solMn3LYjHJd7kRCQv+PhxkLzwHT6cly1GFIZqeGioOsZJCzgY1HfL7bjifR5Ty+XQfTwHoZ1whM9zCez4GxJPlNIj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(7416002)(26005)(107886003)(426003)(4326008)(508600001)(2616005)(86362001)(66556008)(9746002)(9786002)(36756003)(33656002)(186003)(66476007)(6916009)(1076003)(5660300002)(8676002)(66946007)(316002)(38100700002)(8936002)(2906002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oLzMr4fJnwf5cjPhJ98PSzbm4ftyraQAJ+NabmQOvbLNkr14YPtIyeigThG7?=
 =?us-ascii?Q?j8IB2aLLfyq4X0zBGh26Zcg4kSDz9fUR5VFHa62pwrMNSO7fn2km+pfCr3Ie?=
 =?us-ascii?Q?tNWPU0oXZW9ctt8+a76pi/MCqRtJRyxC8fkhzCW+Vy2WUkFiUI0KF9GKXqv2?=
 =?us-ascii?Q?uaLkALn6BryoUDQaxn1zx1XeQ/nbkY0VIYborXuTZEW/joiO7mKuWyc8NXZJ?=
 =?us-ascii?Q?4n+qhQXRX6NpTMfgXVBqiMJE/t9j0AYVfU0E6KQDwCuyJzXBC8hdBFvhGjGm?=
 =?us-ascii?Q?quj2waTN3lvuxIPvgDJiqc8iXAuypiYuB7oSu0/JEZ/SE+HGCHD0fX09dqDC?=
 =?us-ascii?Q?ytSEgIPwrKrgEb5Vn01fnvtlhKBPMCxXv9dECbOwE8nYzJ8AUA2Lt01Th454?=
 =?us-ascii?Q?LKEEU+2btPb8KEFLc+tVZQ8p30lkDABSRjfxcWfMjVvfZIrielxRlg7xXyuO?=
 =?us-ascii?Q?fwBTZmTfOme4+xmZKST7jMnnE8KYMBZl1l1l8TrT5L6Nys3U2Q66LO8kyWyX?=
 =?us-ascii?Q?5GUwnP7Z8spjEbGf/GJ301o33xZpQamfqXmK1ZZcm4hD6w9sig8EWjeEjkK/?=
 =?us-ascii?Q?t3rvbTGrVrnsrFgKiQOfcZw94be8nLdaCq2ex7E0t4ifTGYsUYj01ws4osfe?=
 =?us-ascii?Q?ZW3OdX3WkXoio2TaV+TrBrfXBoey1VuO0qLr6nhfeGti5AHZGW/zJ8ef0eO5?=
 =?us-ascii?Q?B8WjoqMTNAI/ZhsluWoXfJkZeGma7GvEQnlEysk/tv2duxwbkEQ/LkEEVbkG?=
 =?us-ascii?Q?e3VKxMZ++1tlOMs/HA23WJDurfAvGHdjiW2FgQmwvD1JqBTq4lRKKG2CboWD?=
 =?us-ascii?Q?XHb94/tXgZPTzVMoaVBKIVWV6/CliuaBYvVCrOpaZ3EXbxScllJ1gQKq7YRO?=
 =?us-ascii?Q?s9iFi2X0s7sBZdpd3v2fynIxTHZVmxEjbnHNZOB2uMfnVn1FY9EuHDa8fvsP?=
 =?us-ascii?Q?hdpbjK7bnbyf4my6CQp136H9b+ZQzmjGHWjofOVogTHdJu21NiDXkezuJOyv?=
 =?us-ascii?Q?Trz05iuJ1O60UQOC7XCSMbn+UyjhzgbKjSxCtY+keSBQfVYBpXcg8SXgAJQ5?=
 =?us-ascii?Q?tyNTtg4r9T6h6geu648xyRZbog2lSQgon+2NsOHhdMY/qHUDyrKOI6Js+PdY?=
 =?us-ascii?Q?GMmD4O+FHPEnuoTu+Fh6WCBbwvCtnFBtQdFZQnlo+ljuytCaChWsngk5R3fs?=
 =?us-ascii?Q?9lFeEKAmM24YqK49xwHecwfBg9WmTVzY4d9B4q0t7IZGbpNRaX3oT0GcPO94?=
 =?us-ascii?Q?oBE4b+pM9Lak3QM61vO+yYn6B1yd5tx2OSMfDqs8ypSyjPrWgQZS/a83C4qa?=
 =?us-ascii?Q?CxHPxWA5sN/P99qRJwcv+og6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b754d0-f2b7-493d-3013-08d97d2a3b02
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 18:04:18.4670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A9jl4po/dS2QZf+jd07Pr4KM0xZcgXzZ9GkjpOkEFtz81J7WpPmQvJ8d+1XmaNl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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

On Sun, Sep 19, 2021 at 02:38:43PM +0800, Liu Yi L wrote:
> This patch adds interface for userspace to attach device to specified
> IOASID.
> 
> Note:
> One device can only be attached to one IOASID in this version. This is
> on par with what vfio provides today. In the future this restriction can
> be relaxed when multiple I/O address spaces are supported per device

?? In VFIO the container is the IOS and the container can be shared
with multiple devices. This needs to start at about the same
functionality.

> +	} else if (cmd == VFIO_DEVICE_ATTACH_IOASID) {

This should be in the core code, right? There is nothing PCI specific
here.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
