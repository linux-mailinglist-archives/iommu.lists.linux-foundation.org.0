Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA9553C56
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 23:08:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48AA8402B;
	Tue, 21 Jun 2022 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48AA8402B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RdM18ZKL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USho9R-QeL51; Tue, 21 Jun 2022 21:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E59BA8401D;
	Tue, 21 Jun 2022 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E59BA8401D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF810C0081;
	Tue, 21 Jun 2022 21:08:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1765C002D;
 Tue, 21 Jun 2022 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B506A4059C;
 Tue, 21 Jun 2022 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B506A4059C
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=RdM18ZKL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXEc0RRdL_xL; Tue, 21 Jun 2022 21:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB844023B
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB844023B;
 Tue, 21 Jun 2022 21:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZdXE1OJzBaUYlWF6NbMVt0TwWrbxS3mzOOWXZrEyEAXoHax+XVJtUK0AucL4rrbEAfsK/CPUJt+a/ZVtpuqqRs8pZgoNk01BTfQksKYqoz9v3AU1f8N3Nz+2GK0FLSahgyIZy5cPXe3ZxqPM5Zt4mgLV7W/RzKR5D9G9jIK50m+uiJy0Fg5spR/NM+wtsmqaEVE10u4yfrpKE8emdyVz/aNFqYbXOnz6gFkfO0BEzvvyuo8b62KUxnCswMB/WSv1w5glx5X5+uzE0VtCHOIJZfnaPWhj5JF2NDJ7IJWNrgIB8p9Hc+TvUNqJZlz35qyaWU67DeXePo5MSLwWWW5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN2rjHI7mae8Dk8au2O2opi72iO/joSCgRpCxMnXvhI=;
 b=Ko8Wvmuv8sXGmpbDKVIFKUXug38k7W8jjTeCFGPi2DAiGMUX/Pb/BiHMpVsoDo8HQJRrFv/RIkzYTvIzvAJMTf2Me6O437lDYkbxBM1s38KwOP/cNe+J0MrTaMO4Hn5+aXO7G95gVRlRb817z3Qje4xAa009ejVxuRekjMN4kLY55uXQ+5i1Uil9K2kHBuWzXrxUve9p+9O5mWkd3lS+iVag/tv6ZnpFEcbuc9WPpk7NsI1wj+GSZvMnZeSEpiZetmiqirVUJWcl/vsUn1kkHbWxlKOYrGdj/GktS/BM5zQSE7MM26M4CJKM4KLM7zHfFY2yQ/oCwHEGIgCQlgDOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN2rjHI7mae8Dk8au2O2opi72iO/joSCgRpCxMnXvhI=;
 b=RdM18ZKL/YFzY2wSIpWBZg3bwhM//xU6WMblFKeRFYlGM+yu9olWMiFF0PdbaLWvhsN4jgUy2knfh9TCxdy7d7K+z2SDCEv2Mk+nxLxtClxFe9KcOTahypm99nEJxI7jZqA9NFM0BFd5cRra7SkVUwCvUSxtqjXfpRoxh/wST3kAYEDvxr9fd0MhX1EA5ylWcAn93u9g6cH2Wd3tgg5FWRhYfwYPXckrEZkRWXeGqRFC7r+/0wn5xKWHPJd0sH7QMpKdA9HQE6G3BvwntlSfllD55DTfrOoDbvxp1849gVO0uEicyRFMMu9u5hG0MPgy8hSYhKF6C6T0RyUErm692w==
Received: from BN6PR16CA0014.namprd16.prod.outlook.com (2603:10b6:404:f5::24)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 21 Jun
 2022 21:08:35 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::bd) by BN6PR16CA0014.outlook.office365.com
 (2603:10b6:404:f5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Tue, 21 Jun 2022 21:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 21 Jun 2022 21:08:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Tue, 21 Jun 2022 21:08:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 14:08:34 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Tue, 21 Jun 2022 14:08:31 -0700
Date: Tue, 21 Jun 2022 14:08:29 -0700
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 5/5] vfio/iommu_type1: Simplify group attachment
Message-ID: <YrIzTX2Vg/iJ95hM@Asurada-Nvidia>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-6-nicolinc@nvidia.com>
 <BL1PR11MB52710E360B50DDA99C9A65D18CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
 <YquxcH2S1fM+llOf@Asurada-Nvidia>
 <BN9PR11MB5276C7BFA77C2C176491B56A8CAF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <55e352d5-3fea-7e46-0530-b41d323b6fcf@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55e352d5-3fea-7e46-0530-b41d323b6fcf@arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ac24fe-ad8d-49f4-dc15-08da53ca3455
X-MS-TrafficTypeDiagnostic: PH7PR12MB5976:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59763051D992F16AF8F05BD6ABB39@PH7PR12MB5976.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fl9OyWh50jzl4t+AuMzoHMYy9C3TFAwRDDPSgk4pLciNlWeqOPXQR6GdNkxh3SxcHy+t++zthderbcYcU+Hwq29AiqGvXQAXmU+HZkbgbp5K3MGf8NLym6BVfeEJtOlSYexF7RVbD8jIUigPBl6+2kXFJT2n6P8V2SBY0iCHOj29DYTFcQkB9XoKqWjaiUfLfdBvItjYKZTZyLxSfiB74P6LDqY1HcOD5Y+ITeGsejfVmKlVl+EXRm0U+aIYnd8Dpsp9lmLTg56kJbmEjLFAdFV5Z2ahl4HTM6uFxLxJEU28RJgzc+k59j2676oCgx8rMlS3cLsHE5EfINhbrNt9UgbsbFuk5ebJMrokYbehcP39/aUmWwP2Ldlbc+1GyXVt36XSRdtKV1PIU/31ErYuAStdT8Hzw4xZc42WkZE1oosYaums+9EUKtOdl9KON3kvy5SOFej0aylW2cxUI035DuKXXKpK0KcCk/Z7af4uhB2aVqS1HPdI7wCPpM6oNxTY+zcbyG5HJoPM4TTMmJOLnBU2BJwaZ8G4kvruD3Afyx0gRX/7IcpV/ED5TOYO/i6F0tJEYqZuXzyBhg1kGGWIG57NXn8DZZJwI4ttQcKJ+Zztk0O7yHk9/JMnB2i7E7zA+Iu3MolPU7YfY/Y6Tc6ynT8FW4q2GA5XSCjNNLlbRoa1mPGtB+5LeDiO+szo7/I7JNO7m/MJ9ogR8wkhW1l8OZOmb2U6GktScpmBy4awXHXH3KqJ3H8HUXBfNPKUNNQG
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(40470700004)(41300700001)(26005)(82310400005)(47076005)(53546011)(54906003)(6916009)(36860700001)(186003)(83380400001)(5660300002)(356005)(2906002)(81166007)(478600001)(426003)(8676002)(40480700001)(86362001)(70206006)(8936002)(70586007)(9686003)(316002)(336012)(7416002)(40460700003)(33716001)(4326008)(82740400003)(7406005)(55016003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 21:08:35.1169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ac24fe-ad8d-49f4-dc15-08da53ca3455
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976
Cc: "marcan@marcan.st" <marcan@marcan.st>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
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
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Mon, Jun 20, 2022 at 11:11:01AM +0100, Robin Murphy wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 2022-06-17 03:53, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Friday, June 17, 2022 6:41 AM
> > > 
> > > > ...
> > > > > -     if (resv_msi) {
> > > > > +     if (resv_msi && !domain->msi_cookie) {
> > > > >                ret = iommu_get_msi_cookie(domain->domain,
> > > > > resv_msi_base);
> > > > >                if (ret && ret != -ENODEV)
> > > > >                        goto out_detach;
> > > > > +             domain->msi_cookie = true;
> > > > >        }
> > > > 
> > > > why not moving to alloc_attach_domain() then no need for the new
> > > > domain field? It's required only when a new domain is allocated.
> > > 
> > > When reusing an existing domain that doesn't have an msi_cookie,
> > > we can do iommu_get_msi_cookie() if resv_msi is found. So it is
> > > not limited to a new domain.
> > 
> > Looks msi_cookie requirement is per platform (currently only
> > for smmu. see arm_smmu_get_resv_regions()). If there is
> > no mixed case then above check is not required.
> > 
> > But let's hear whether Robin has a different thought here.
> 
> Yes, the cookie should logically be tied to the lifetime of the domain
> itself. In the relevant context, "an existing domain that doesn't have
> an msi_cookie" should never exist.

Thanks for the explanation. I will move the iommu_get_msi_cookie()
into alloc_attach_domain(), as Kevin suggested.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
