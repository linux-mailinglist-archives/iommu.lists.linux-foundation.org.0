Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A259352676A
	for <lists.iommu@lfdr.de>; Fri, 13 May 2022 18:48:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537A560C13;
	Fri, 13 May 2022 16:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3hTK7ae0Xqg; Fri, 13 May 2022 16:48:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 610C460C05;
	Fri, 13 May 2022 16:48:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31E22C002D;
	Fri, 13 May 2022 16:48:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A369C002D
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 16:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F9E0418D7
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XRf4CpvbZS9 for <iommu@lists.linux-foundation.org>;
 Fri, 13 May 2022 16:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::619])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E3C4415D5
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 16:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deEHGyOFtaUrqhWqCAW/DDY1CWPhMVw8+bFOdJCt/ld+fNhjg+56VGzgjtqJZu2RIoelKHjnYtvtq7rkKUU2egK/v9Yxsi4cw/9K4YS0mpoB9oaOMR8kZtN3QUNRJqRs6PCYZs08njWiacXVZUhUksy3jrD0Ldtat4cTqCh7rq3fFxL0W5PqCs9aYgUcU1Mp1km3BSPyxYKRGrQ9hyntoD2IjCB54rUVRkALJnvRgJPJn0IPWcoSEJYYCeoaAf160lb1o+uElOt6EyoXyQg6RSHgNc4K95C3lIjXeRT7RMXKmROV2xPezIppbw7U8azIKJdgmOnNpW/LUp9QvSzilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sq7w3JNFciEvOMVqx87G1jrT/ZprR1sauFomKPzJRs=;
 b=XgRQY2AhnOY5I4gJ/8U9AP85xyEWOQlZu21hX9rr2T6oZfeO2nIF3ZyUcgH3RlMS9zJh4Stu6jJZ0wjBsakemAaLZ15+lhlQ3Qp/9WEbn3vTg2IyvylWbeHHRSWipTMziRk8B3Aw5wLCvrCCtpp/x6zPvXgK/qACwCPhdca5SoRq/SRg/49al39IxasYEVIppEas/KjD0dVgKLb2LMjCNbMM1pySGKreHCAmULTZYNAz+ne6cfeCNE1Kze1gZ3E9c60yt0AC2+ini/3F2WSWv81gdxJeGKW3TBJy+zJB+PfPYbeFm6isEHPlUeyCqm1oZ9KC0CwtJvs8tDaTiD3McA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sq7w3JNFciEvOMVqx87G1jrT/ZprR1sauFomKPzJRs=;
 b=OjecGIeCzcBdQz6mHsHvt5bckN6QlrfW9DfVi4qcbU74X0AkNyUAzmivO4kdGicrTEMDRv3nnRtDgja1k+0vJq+zba/WrGWiN0rSqb9rY+UYPG0eLZZTwj1UeJNqbVFlx/W3xq89vF5Wez+gEtKpYhvtw3BdrKyD0/oZ3O8DcLF7a8lNHwu3k82i8zRLZeTUJWkxZlWoFbhAvd+zxYsLZjBgy5MW4O+0u57VQ3LoNBaGH9/0ZhhUmyDK3I6eT078Ei00ERpBgwSF60ORdUgmGSqi62p+xB4ldUotQjKNhAJKCnmO8ry5d5EMHEttTt9OoTB+xB7COzmDziWjD9uUQg==
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 16:48:43 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::e) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Fri, 13 May 2022 16:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 16:48:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 13 May 2022 16:48:43 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 09:48:42 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Fri, 13 May 2022 09:48:42 -0700
Date: Fri, 13 May 2022 09:48:40 -0700
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] iommu/vt-d: Try info->iommu in device_to_iommu()
Message-ID: <Yn6L6FFf6icax1Cv@Asurada-Nvidia>
References: <20220513003233.4442-1-nicolinc@nvidia.com>
 <6da2adf4-6717-b562-5ee3-7e28447aa65b@linux.intel.com>
 <20220513115032.GM1343366@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513115032.GM1343366@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ac789d-d9c5-4919-efe2-08da350070bf
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4404522175B3A99ECECAAE43ABCA9@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/7dds2XXQVF9geKckOx5fAt8VZbGZ8rr10ulk978QZbRnONK34rzo+lvo7R88rDNCD+af8c8cXliJuDFaZoLnpCyRJ5Iktv0QEIZoGr0NmZhItq9jgv4Qh4KgQY0NypnVHOGqN4/+x3Rd2hSeTG2CIZCqbdwPE45WPjb1wAr3FZ/tYORJ/iJDrO1rLwTl/pF7R1lOpX6+gCVCof3ZSvVOAg5Gh8fV1F/xrJ8pfEeGGp4Dj2uGA0+aTQQWN84t4+XxPch06k4/1zXOKnwOlZmSVY2RUOkykvkkn1Ygj4urKc7DcMA+G7FUbzv8Gi/a4CzPSXQc9szhqfcrAa6Wtdll6pNJsaFqA5U3wrSUYsv3aSQh+1U/cTWFSgplhiB0/U67J1kBvk0dUHOBrU4u16PbBtyAKjX8XMt9rl0X3JL6O+0xiEQCZZIKWzdotfVxKCOQz7Lz6s69k93+1vOZnKSenjY112IZqMas+A2I2Np45FA5knLVi//mJvvzXlUIm1OVtooP5r2qw88Dnqhuxbdc+p2rkc6yKNZEJiO3hZdrUyNZhNsmmqOtlgSYXEPgbrTy1y25i3JLhrTvOh66sXabv4yVCjmZzBssMV6WsAn4wG2QbUTw88Ej8jnQoP104kLSkp6MsyGv+KhXJqWucGuiF/YWdgfVSgSaECCXHwslz6a0mJ4FaX0CFZ9SRrsvTEsiJ5OLpP+e0jsfTwI2Ba8g==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(2906002)(4744005)(82310400005)(5660300002)(40460700003)(55016003)(33716001)(86362001)(6862004)(336012)(186003)(36860700001)(47076005)(426003)(81166007)(356005)(6636002)(316002)(54906003)(70206006)(4326008)(70586007)(8676002)(26005)(9686003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 16:48:43.3308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ac789d-d9c5-4919-efe2-08da350070bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org
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

On Fri, May 13, 2022 at 08:50:32AM -0300, Jason Gunthorpe wrote:

> > Perhaps, we can make device_to_iommu() only for probe_device() where the
> > per-device info data is not initialized yet. After probe_device(), iommu
> > and sid are retrieved through other helpers by looking up the device
> > info directly?
> 
> This design makes the most sense to me... Nicolin you said there was a
> case where attach was happening before probe though??

I was testing on top of our IOMMUFD dev branch actually, which
is still on 5.17 where priv/info seems to be set at the end of
first ->attach_dev() call. In 5.18, Baolu has already cleaned
away some code. So now, just eyeballing here, it should be set
at driver's ->probe_device() call, so it'd be safe to get info
in attach_dev (and in the new op that we are adding).

I am also rebasing our dev branch to more recent version btw.

Thanks
Nic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
