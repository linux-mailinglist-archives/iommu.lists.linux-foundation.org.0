Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF204136E0
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 18:01:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F6F40400;
	Tue, 21 Sep 2021 16:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccWuson3ZBCc; Tue, 21 Sep 2021 16:01:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96702403FF;
	Tue, 21 Sep 2021 16:01:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF42C001E;
	Tue, 21 Sep 2021 16:01:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5AFBC000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2CC1400EB
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxab74T1R2rY for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 16:01:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA864403F8
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYUTLfib/yzknwnI+4/0bg/73Xeo+Y0bd9PwjMxeW9HyUT22gaS5L/5kb3JtYid+XomSlnerSwml9nO87jDOMNJAeC64p3KJWWjPFKEynpixRMXGaqOytmVYclYm09he+x7W6zjoiyJRXSdBNWuI/GPHIzQJg8Qhc+Nep/BZvnDdH+uvpxj0/6S+4SEuf1r/zNFdeop+1YOvU0ISq8683DPLyt3Ipemf0oce9n7P8NDdc4PsllauZ2nCucn5XCEyhLaAU0ulgSHVl6Xg0E3NY/YNTTdsPa8zfBkSNHe3DkqMydtaPVO7XTcqaS66ECNTDorAyp6Z7T3QQo6LPUyzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4KCg8xZvRSPwOAsK6g3o5r1M7Me2ABMEwv9BdnK8zZ4=;
 b=fFX2v0HVOYF1MRc9DQRwYkMb3KMCbJJQHQTCum4Q1bFbicRQeSbsv+Qwz3nK68+dlTkwec7D7JO07Z8gIhkqv/dTMx7uk5XFZzxbZEtdEyaebdbIrRkBF3DVx4uZCJnKQofz3CsaOVe4mPaEEQ1KKgspZtOY1GNZfoanX6//vrN3ROoRqMZv2U5F+zCkfVrZu6OQjhXY5NLYT2Omh/Ky2a8bq/Sd0R6BZpwfoXKXxwEI5muFqYsXCMcLoh9lTUrqYYF98og8faR4scWNU8DpjpnfcgC/lmi/w1Dnxtku0CIcWIU0xAF20B/hReSK2AitkPkGoI14zU49grSxZg4VIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KCg8xZvRSPwOAsK6g3o5r1M7Me2ABMEwv9BdnK8zZ4=;
 b=a9occCHF2VgAJmnVa612Xu4Vy8lyvt3HycHLeJSgWV073QVX1C0MZlo0qM3kO3atj8/mlyPIGND9vBvZs0uxwjsntz7VSGCAf7wlTxKaSILs/3JVjL6DufbVlsIN+W4i35fZh+8YAGogCp3/JQ9CIGNx98lDpNZJCqGiPARCFxg3UtwBOv5ut90ubM66rwtXa5TZXv/v+66ud6KAr+oWBPVPuwsLDAs7aOTJkw7D4bdYqazBn0cOoO+DKHFhLun0kDbHDGoKdUuwkXoVwEjLwDI0x8+5xb5Z4KFrN9ash52EMu3haTt2/JRvT1efl7AXYo3z1kSs7IO4CWIZDjXMdA==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 16:01:10 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 16:01:10 +0000
Date: Tue, 21 Sep 2021 13:01:08 -0300
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC 03/20] vfio: Add vfio_[un]register_device()
Message-ID: <20210921160108.GO327412@nvidia.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-4-yi.l.liu@intel.com>
Content-Disposition: inline
In-Reply-To: <20210919063848.1476776-4-yi.l.liu@intel.com>
X-ClientProxiedBy: BL0PR02CA0074.namprd02.prod.outlook.com
 (2603:10b6:208:51::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0074.namprd02.prod.outlook.com (2603:10b6:208:51::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 16:01:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSiCi-003VOb-24; Tue, 21 Sep 2021 13:01:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fcdc693-925b-48d2-66b6-08d97d1906f8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB515773B99C90C20FD2E2D34FC2A19@BL1PR12MB5157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0xI5jCip69jlEILGCdrQ8t7aiwIx+BrJt1c+6RSXZuubtvxes7i2ARY/W0C+wZq1J5FD5TBySS0fcZEsPV7HqiQQ/S22Cqct6xYTJ+ZCde8sCgAzYDUAWPkXwlRw7Bh/l/2tpFR+c19cRQLHViXqpc1FMC5KGwmq5760syNsep0nzmiY8OtkjburcBFes7rXlSbzbgDnuEai2MT7PQbfVwjKXwUd/vXO/xmIPdH1uTfn8eLv9S0AVudEPgytnrY8X/mYprnytrZ8UktAODz1Cr3aVFfkll79+LzBCKwt+bhm5V+KexD3am4M9JmdCA1DWb3froEDDAJqGminZ0XKz821VnqJF6HbtGPqvw5JzwHkyQfG0NjB94Y6+6oxLY7hw0PVcShrB1kaZkghxIee8RhW1vFwbgeJi98GwSfb+j7XfTATi+6Qh3XKXQSL1swDlQC8WYKcWuji9kgHz302kwn+INr4mhShppa5ZxDTjmapYoaQjToNp0hcfJmMXKDp/C1Zg0dXgpC+lJvBQaahxGP7egFXLxlJihc6IwRyTaqwMoA0fBBdlku49ispdwEhsikAwK7U/q6D7Ry4l6z81RZp1mNOikaLydcofiPHVAupvaU6WaKyF+XrvqmWirqRQ5XJANDejW9+4DmJTONmhVqWrrm3qNb19TNS1Hg+haijgbQKoZavvGG0LOgAJQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(508600001)(8936002)(426003)(66476007)(83380400001)(33656002)(66946007)(36756003)(8676002)(86362001)(66556008)(2616005)(6916009)(4326008)(2906002)(107886003)(5660300002)(186003)(7416002)(26005)(9746002)(9786002)(316002)(38100700002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIYu8EQVSFT6HxhCSlW0OcqpVw/TJKGJY7KIqcqrNCBXQTiohctCZFzfaPLZ?=
 =?us-ascii?Q?S3gWYRWJfXqSOd5Bu1RRyMTJczSl/KjkSEexdhX1iW9gLp5+yeYBZkbtv1uU?=
 =?us-ascii?Q?1fBvZWfDzncwXhAP4QyzzFOgtoOvhlD9YfRKPEdF94thAw9u8cRlM/IH+46D?=
 =?us-ascii?Q?lziyB7hXW4Fj13LrapMRiK/m9iKhvGZ2wsMKNdPUgtV1H/lGTmYioS06m9Gl?=
 =?us-ascii?Q?1SzUpOOzaTRgF6guSm7lYI206MApiavR1MNju0H49vgJVEwQWyJ0KajBGLTl?=
 =?us-ascii?Q?i80Y8LXskROm3L2YY64/F6xIbHJF30Tav8twOwUP3OOstcTS8IrDj30g1NUh?=
 =?us-ascii?Q?wveOtEM5HpYzEWqcUnO6aLZhLXn2a3f5WBpVrG82cJ7XhF/6BiMrdlQEXiAz?=
 =?us-ascii?Q?UPvAbrNCfDRr0LkpI3on25V84aNacONmBhgjxf7W4O9QvcBDAuV3hN1vPUTu?=
 =?us-ascii?Q?HvN4KIeU9Ru/qTC52IvGlfEJoBlfSPYKCPWKamxfguK/n0cmyDitZD0Vcdm8?=
 =?us-ascii?Q?OrEGv7g6NlUCo7oymCUKyPCp/HZC6TDGsOAH1vzr4z3GiW5T8IpYPFNPdVDI?=
 =?us-ascii?Q?IBvuX7/ipoGDZSKMCpdqRkGRq1Ihcm8Nactsbr9ePVWTZNRoYfH3DsZNjhCw?=
 =?us-ascii?Q?EJDe0/LWMttKMz5MO2ojKj64jNu4hnn3QWttNewNmvp8NPtpJPADLBURduqA?=
 =?us-ascii?Q?ve+6zt8juh01CpjIbAIEkDGAYBssxs1C1DlPne/4Yrc/iOB0vQLNnpjuerdb?=
 =?us-ascii?Q?Z74jI6x3OXhmeF0swKufn8bT1iT6QN6LfPcfKmlfGjVul/RWpovYchAYEnh8?=
 =?us-ascii?Q?YEjODOX9Cm8qI356cfz7Fr3kZB5UAaa6RvCtl+bSFPGEQMQfIuq5y3mdn6Ue?=
 =?us-ascii?Q?6CvtTRgpMoBNA/iwh2FKX3byuVi4fMIPjoX41/huu6wz/K+oV03mjFEmCLsn?=
 =?us-ascii?Q?BTFys1N8nSBgkoyOdOPGxtDT2cOD4IvxXIoMEHLx4eid3RiUU42nlnWEd8C9?=
 =?us-ascii?Q?GboOBawEaujKJSeaFW0ssd2Ye8ihuibRRpT/VKOKj+aDTf9Zuhb954xZyVc9?=
 =?us-ascii?Q?2CwjPDdFpYxJ/36tiH9pNDGoJX33tWk3EYgNqhvDZ18O83DUl9vSQZ1yOAgB?=
 =?us-ascii?Q?SaSVBuTRPl2TN7v3HP5w7O5EIelMK2qxqBYXXiiaOOz0GbOK+Oy9k6Wu65LI?=
 =?us-ascii?Q?Go2UkzeV2Q75TIb7LwAx0J/+x8DXdHIkAmzT9S8xAxSSDlx7mtWf6rMNXt54?=
 =?us-ascii?Q?q7/e2gqEE/Cp5Utq8MeJZ/w2oA7HVaY2KIjU3X/4ICvtNNVQeXNSCbJH0p4L?=
 =?us-ascii?Q?mH3qkqHO6lrkf9BWkFQHgq2i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcdc693-925b-48d2-66b6-08d97d1906f8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 16:01:09.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65MI4CsnxXef+BXfqH1jNZfHh7NU6lyVQvVHnvek7m3Hn8HpoCvhoOLByGbcjEv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5157
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

On Sun, Sep 19, 2021 at 02:38:31PM +0800, Liu Yi L wrote:
> With /dev/vfio/devices introduced, now a vfio device driver has three
> options to expose its device to userspace:
> 
> a)  only legacy group interface, for devices which haven't been moved to
>     iommufd (e.g. platform devices, sw mdev, etc.);
> 
> b)  both legacy group interface and new device-centric interface, for
>     devices which supports iommufd but also wants to keep backward
>     compatibility (e.g. pci devices in this RFC);
> 
> c)  only new device-centric interface, for new devices which don't carry
>     backward compatibility burden (e.g. hw mdev/subdev with pasid);

We shouldn't have 'b'? Where does it come from?

> This patch introduces vfio_[un]register_device() helpers for the device
> drivers to specify the device exposure policy to vfio core. Hence the
> existing vfio_[un]register_group_dev() become the wrapper of the new
> helper functions. The new device-centric interface is described as
> 'nongroup' to differentiate from existing 'group' stuff.

Detect what the driver supports based on the ops it declares. There
should be a function provided through the ops for the driver to bind
to the iommufd.

>  One open about how to organize the device nodes under /dev/vfio/devices/.
> This RFC adopts a simple policy by keeping a flat layout with mixed devname
> from all kinds of devices. The prerequisite of this model is that devnames
> from different bus types are unique formats:

This isn't reliable, the devname should just be vfio0, vfio1, etc

The userspace can learn the correct major/minor by inspecting the
sysfs.

This whole concept should disappear into the prior patch that adds the
struct device in the first place, and I think most of the code here
can be deleted once the struct device is used properly.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
