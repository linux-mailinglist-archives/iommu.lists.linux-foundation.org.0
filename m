Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F0550057
	for <lists.iommu@lfdr.de>; Sat, 18 Jun 2022 01:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85DA860C0F;
	Fri, 17 Jun 2022 23:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85DA860C0F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N6EY401Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1NaH5gYVEBZ; Fri, 17 Jun 2022 23:07:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E706B60C28;
	Fri, 17 Jun 2022 23:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E706B60C28
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9927C0081;
	Fri, 17 Jun 2022 23:07:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16BE8C002D;
 Fri, 17 Jun 2022 23:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B57E5813DA;
 Fri, 17 Jun 2022 23:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57E5813DA
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=N6EY401Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uz86eptdJXQi; Fri, 17 Jun 2022 23:07:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11FB081325
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::626])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11FB081325;
 Fri, 17 Jun 2022 23:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2u1DuZRSJtYp1iYwBrTRinuMfGzrZL9LEraKsC9XGIevLrpfG7FQa/DXfJgh3WYPBVpZkg8R1HKgauL+oE4ogIyiBDhczlJCBgi6rdZofHqVq97NxK1OkjFbqtdH2PM9AV+bBz9iSBhD5QztoAir5etC0Y7/2dHgNSLmnUxUcCjDIA3ivTglW1mBeOq6fVPsq3vpVc2zFtxIVmL2cAUoh8pBSWpDWbvAffn7LYzheSoWU9OAOYbX006hjw/NDtEUJjbYLT+IrO1jXqv0S5NQXAm3ejlunludt5iyiEYOf0VlarrOrLIfB9Pnn+Tu5y1VW38OhECWw8ooQZmJ5HRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLqILRQ8qtWCoOCdvWIzsW3EHWsqOopa7YG7IislUhQ=;
 b=niPg26Two2vNEDuiElaBDjx2COtJriFJvOLp0uIaCL2rlrGuSIbk2D0RpUE+6zazMA9GLSRh63swn/pKktvHhbYegMcDBBnLMmUw4tUVK63ibN2bjkW2Ohdm2qhJn+pj9gGdWvviqAGjsxi9eUuufP3cDkShr8v31Y33M0BdMA9wgBXwIWlfGP5/WtS0hBmuZnObllDRHaxVAEE2IJTC7Ui4TbSgr/onHuTCdWgg3sVXtJIyeOIU2BD0VlOpOxtcavuZ2WBe2G15s6ie0HXAmxAySHhytd2lMbLmSRVb4FnDloC0I/MLquZQ2PG794nIyuDm5ChPL4rGz0VKraEpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=svenpeter.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLqILRQ8qtWCoOCdvWIzsW3EHWsqOopa7YG7IislUhQ=;
 b=N6EY401QARm2CcqK/sz57/2L26KKb/UTfFojb0OqFFGZlk91ppipJDvblWmndJTRNljY7KYyrCEUHecgPYftA+GfEzuIUdD/G8Kz1JZJXHLXRxag8Unz6uModf8jbkXih9IwSk6783gbFmemug8gheFy6xRrZneH4X3SfLFzQ45YLRx1bJxVFTCqYrUIyIiHCCo4R3FHN+CJz0nX8HAErQ7mPqQr2i1zpcBgPE3I0yHhqAbx+rylIV+4uIsfTZTuXhgWhGJCdp9yK8UFkei07eKnDqLux8t/BDXUP+YfBxUHy9Bp7fJVd6qIjyuKqqYb+QWv/HFhsT4Cf6xLYDETEQ==
Received: from DM3PR14CA0132.namprd14.prod.outlook.com (2603:10b6:0:53::16) by
 PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 17 Jun
 2022 23:07:24 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::e) by DM3PR14CA0132.outlook.office365.com
 (2603:10b6:0:53::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Fri, 17 Jun 2022 23:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 23:07:24 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 17 Jun 2022 23:07:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 17 Jun 2022 16:07:23 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Fri, 17 Jun 2022 16:07:21 -0700
Date: Fri, 17 Jun 2022 16:07:20 -0700
To: "robin.murphy@arm.com" <robin.murphy@arm.com>, "Tian, Kevin"
 <kevin.tian@intel.com>
Subject: Re: [PATCH v2 5/5] vfio/iommu_type1: Simplify group attachment
Message-ID: <Yq0JKBiQfTkWh4nq@Asurada-Nvidia>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-6-nicolinc@nvidia.com>
 <BL1PR11MB52710E360B50DDA99C9A65D18CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
 <YquxcH2S1fM+llOf@Asurada-Nvidia>
 <BN9PR11MB5276C7BFA77C2C176491B56A8CAF9@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276C7BFA77C2C176491B56A8CAF9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74598408-44ba-43b6-c24e-08da50b62411
X-MS-TrafficTypeDiagnostic: PH7PR12MB5975:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59753098F671ED317266ADB0ABAF9@PH7PR12MB5975.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHBGjZj+43wUi5J064DSf+xSBM6gqkjXjw8pjRCTikmQ0UCv2CXBfRvisL+HhxpcTIwK8PXxKGXgE/ZuzSWbkzp4x5hui4L6zvMDZRjzjZFGyMk+u+xJ8vltErWCFCVE9ebu04/ciUDkBXLKmJCB8goEkXpXweUQQNg0SHHJ9qkTgrWFyW3NXwV404h6oDEcqhvhiGcxXaiXa3t3aFumJpW7q1czcoI6SXVvlcQQYaaToCuw19VxliBJpeXWrDZ8MUiEA2eXvtaQ4Rz8SQTCIKqNCWGtK3JcnFtdgh4EK4u8eGHOH5WOhy/VbMn+H39kdAkiJLCfI/fPa4QMoCPo5LwurP7xRPueUyTkMz7eFn7HcWAvTILnB46iS5doggpgQJDJ1SbLUboryP45zO9+AfaleuFQkV0v8LePFu8R0sQM/LATxb7UQEG7f0kmJx7O9fo2m4LdoAidvd4ilWbred2r2QrIHQ8aQ8ZAMdAClFqJ37TU2ObVmjywLDERUTqZOVSPzQ7cMts+cnhhd1NssKLcm5LcUj6qr0FxcxvVtjYfYI6ewoK0KuBjtLJec/M6WGKiPnjSI1Zz6zMruIcLCkM0E0X6HYSIb9qVMNgEFYd/tvj6ct4ogXfUfAT//zeK+iv43TL0e7uSxV7Bx//70Boqvi8z6AkehopmXex2d+aoaXnl4MhV/IWyrhljnSOZPrGD3p41hX4WpPF1DxrwPQ==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(4326008)(26005)(70586007)(86362001)(7416002)(82310400005)(33716001)(316002)(2906002)(40460700003)(9686003)(83380400001)(7406005)(8676002)(5660300002)(47076005)(498600001)(8936002)(186003)(55016003)(70206006)(426003)(81166007)(110136005)(356005)(54906003)(36860700001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 23:07:24.4666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74598408-44ba-43b6-c24e-08da50b62411
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "isaacm@codeaurora.org" <isaacm@codeaurora.org>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
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
From: Nicolin Chen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Nicolin Chen <nicolinc@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Jun 17, 2022 at 02:53:13AM +0000, Tian, Kevin wrote:
> > > ...
> > > > -     if (resv_msi) {
> > > > +     if (resv_msi && !domain->msi_cookie) {
> > > >               ret = iommu_get_msi_cookie(domain->domain,
> > > > resv_msi_base);
> > > >               if (ret && ret != -ENODEV)
> > > >                       goto out_detach;
> > > > +             domain->msi_cookie = true;
> > > >       }
> > >
> > > why not moving to alloc_attach_domain() then no need for the new
> > > domain field? It's required only when a new domain is allocated.
> >
> > When reusing an existing domain that doesn't have an msi_cookie,
> > we can do iommu_get_msi_cookie() if resv_msi is found. So it is
> > not limited to a new domain.
> 
> Looks msi_cookie requirement is per platform (currently only
> for smmu. see arm_smmu_get_resv_regions()). If there is
> no mixed case then above check is not required.

Do you mean "reusing existing domain" for the "mixed case"?

> But let's hear whether Robin has a different thought here.

Yea, sure.

> > > > -                     iommu_domain_free(domain->domain);
> > > > -                     list_del(&domain->next);
> > > > -                     kfree(domain);
> > > > -                     vfio_iommu_aper_expand(iommu, &iova_copy);
> > >
> > > Previously the aperture is adjusted when a domain is freed...
> > >
> > > > -                     vfio_update_pgsize_bitmap(iommu);
> > > > -             }
> > > > -             /*
> > > > -              * Removal of a group without dirty tracking may allow
> > > > -              * the iommu scope to be promoted.
> > > > -              */
> > > > -             if (!group->pinned_page_dirty_scope) {
> > > > -                     iommu->num_non_pinned_groups--;
> > > > -                     if (iommu->dirty_page_tracking)
> > > > -                             vfio_iommu_populate_bitmap_full(iommu);
> > > > -             }
> > > > +             vfio_iommu_detach_destroy_domain(domain, iommu,
> > > > group);
> > > >               kfree(group);
> > > >               break;
> > > >       }
> > > >
> > > > +     vfio_iommu_aper_expand(iommu, &iova_copy);
> > >
> > > but now it's done for every group detach. The aperture is decided
> > > by domain geometry which is not affected by attached groups.
> >
> > Yea, I've noticed this part. Actually Jason did this change for
> > simplicity, and I think it'd be safe to do so?
> 
> Perhaps detach_destroy() can return a Boolean to indicate whether
> a domain is destroyed.

It could be a solution but doesn't feel that common for a clean
function to have a return value indicating a special case. Maybe
passing in "&domain" so that we can check if it's NULL after?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
