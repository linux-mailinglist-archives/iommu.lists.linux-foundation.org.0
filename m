Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD03560A99
	for <lists.iommu@lfdr.de>; Wed, 29 Jun 2022 21:47:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC2D408C1;
	Wed, 29 Jun 2022 19:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC2D408C1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kbSpzWzR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcIfgBJFLiC9; Wed, 29 Jun 2022 19:47:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2AB405BB;
	Wed, 29 Jun 2022 19:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2AB405BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F934C0036;
	Wed, 29 Jun 2022 19:47:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AD02C0011;
 Wed, 29 Jun 2022 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B50060C23;
 Wed, 29 Jun 2022 19:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B50060C23
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=kbSpzWzR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrJVq9CHDBp3; Wed, 29 Jun 2022 19:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CE4605A7
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13CE4605A7;
 Wed, 29 Jun 2022 19:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0PJX5RBvOQJXizsm7XXk5ibev9vGSpfBPSn4WdyVa5ghrFuCQFae5qTXcaCWk6xS50Ef/p/HkBXOBmsVjA7GSq0W2eq+KIuffcDoaZoYolI1NDr0MvrSTY053ipmO2PVyyaaQXT4tavqhKI9CHxoCfkCFGy1kOcBBhGf6n9MtJ35ko4u5+I5Ax4ujWkOxP2zwAK7PD70e+7Qkjg0pPHFXmnMGt6NqUdYsNVr1EQLipy5WBUC7Hn0pt3XBrNzCLDZrPmLyXF0lsq+nfhUqZ5qepSUqM2y9ZuOorMdihawoNmQC/FMYyD5SO3kuu1KkcN3SYX8phA+obprcgkMPlQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t2tMU26BQlyqKCQrdW0JpcVFyJO+mK2EE2oPATlIlA=;
 b=jpTRnHFVFndMxq3v3N/DsLcCopksASQG2tSes+XRlcpr3NnnfzOmb6ARuSVY9cqWty9YxbYZLjlUNDIb3fjuGcpXqA8rs/QTcVC+at7FX8scfWeM0owd1Rv9bWAlOeBQAdLcPg76BIHX1Lm2aqbErpTuH+foXu0ybORfWxub6Ynj1vC8FTN5WxuuY61N9xEpF01IqOLXZAxHxd2gIRiGQBUeNK41aompUfEUYfS1nRlQS7BbdjadblK0joCyscNYO4f6zPBw9Pyt5QRgDjDbuWnJJxd5zNlZ6AVCuB44s74ojp9iQFAufp49AubKBO+hVh2beXmWSHg+TGTjAijR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=rosenzweig.io smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4t2tMU26BQlyqKCQrdW0JpcVFyJO+mK2EE2oPATlIlA=;
 b=kbSpzWzRS1YUALOvepkAP54VOl8DFy3BXMyZtvElr0/sgXBKuvsoovdvw/j7z29Xy+8+zNA+uGQYhodL2XVyI/k4D33mMLIxVZcaQgU4SLywxUt8qaAE6D7UOxG0834eE3JdNBZm6kevU3BXtq1ZZSbCH4bSjRSXp0SvgJRCM0gMqwHd96XA+jrHf46f7zrbcfupeajYgYobAVhrbTvQvzSMqjx6tgaVqvsxapPmh5R4roDsl93Fv0LZc93VithZBkTENvMgwrkCzuGlAro2zxj3BQOrCLWE3ZQKDuFyEQ6JE5jO3Q5sw43iYRuHskEmbwN/+/FJ0a7wg7foxqnOAg==
Received: from DS7PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:3b5::30)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 19:47:35 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::74) by DS7PR03CA0055.outlook.office365.com
 (2603:10b6:5:3b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 19:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 19:47:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 29 Jun 2022 19:47:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 29 Jun
 2022 12:47:33 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 29 Jun 2022 12:47:31 -0700
Date: Wed, 29 Jun 2022 12:47:30 -0700
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
Message-ID: <YrysUpY4mdzA0h76@Asurada-Nvidia>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
 <20220624181943.GV4147@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624181943.GV4147@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d217259-e4d1-4143-1a2e-08da5a0836ac
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tial0svSqsOBWr4UrH8SCwFIjyQnY3PhwdCieiCRyW+x6vi6nufunUUzfl8XQu8vEaRhJjGBAe4pGe+ZKAfR+B3ov2ln3fdvF0zUhQDAoDJZAm1CfwEJ2JURkCkbc2Q478avagu2XGxhl64JAxb8w+lDpT8aK3PHZ/LfhjAQoqrimWhE2UhfvN24fwDp23yFkeRn+H/kaZ79l4vS2s8AbT/vCOT6O3Jvk0Y6HEcDPlc0VC6l3C/01Q3BPHx0oPlI9KDRXO4pMSE5pvnkF8RmYHIfIISfgUWB7nsuhuzHWuBojcb6rsblTsRxNH0Fp1lK17/I1anKUpXUNmyOKW9OIHIg6Evd4yVFb5DvzvcQ7xaMbss+QpYJQv6oOxwC2QmSNsH3x7ybT5PNdcUMxSMpFf4zX6htMZ77H6It2PS0ueapWuyq+3vJ4+5Vvc0gB2Dxly6eOldTjlwgi/Q6YcJlwHTiIyOpua7KNiNJVOCZn9jas+cQTv46a0febV9sve/Z4MeylJc2s4MbOkEL367bIRjRTbdXy7qmC/y8a8Cn4dagtC3VPlg34Nnm4aD6dWo+5U36sBQOe8N1UVpIdYcZu8eZJ4WIEdJA0ok2GiIdHvicgQbnlGX56hNp4gCurZw+0FZ3KS9CcnYyVuWGMg7oi7o3i4b/FV+KaivcYLJXFieb2yCtFDXk0UOIkhe4saVqE0wh44G0seXU9OKYk+fij1dEt11l7/CKpaRSkWBojSOF+IOwWIih6hk4tDde2pb/MaCPEwtaJFvcdYb2jrqQXLv8ADvPXts+hOQmbXpusmZeVStCPYWHCV9iSMXicf0t5CiYmppSKIA/rg0RSoztiw==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(8676002)(70206006)(70586007)(4326008)(9686003)(36860700001)(7416002)(41300700001)(478600001)(26005)(86362001)(40480700001)(82740400003)(40460700003)(6916009)(186003)(81166007)(55016003)(8936002)(356005)(47076005)(82310400005)(33716001)(2906002)(336012)(54906003)(316002)(426003)(7406005)(5660300002)(83380400001)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 19:47:34.8739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d217259-e4d1-4143-1a2e-08da5a0836ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
Cc: "marcan@marcan.st" <marcan@marcan.st>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
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

On Fri, Jun 24, 2022 at 03:19:43PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 24, 2022 at 06:35:49PM +0800, Yong Wu wrote:
> 
> > > > It's not used in VFIO context. "return 0" just satisfy the iommu
> > > > framework to go ahead. and yes, here we only allow the shared
> > > > "mapping-domain" (All the devices share a domain created
> > > > internally).
> 
> What part of the iommu framework is trying to attach a domain and
> wants to see success when the domain was not actually attached ?
> 
> > > What prevent this driver from being used in VFIO context?
> > 
> > Nothing prevent this. Just I didn't test.
> 
> This is why it is wrong to return success here.

Hi Yong, would you or someone you know be able to confirm whether
this "return 0" is still a must or not?

Considering that it's an old 32-bit platform for MTK, if it would
take time to do so, I'd like to drop the change in MTK driver and
note in commit log for you or other MTK folks to change in future.

Thanks
Nic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
