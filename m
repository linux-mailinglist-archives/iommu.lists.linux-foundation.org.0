Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6D525A74
	for <lists.iommu@lfdr.de>; Fri, 13 May 2022 05:59:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA64560B25;
	Fri, 13 May 2022 03:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQPF6Znzt5Du; Fri, 13 May 2022 03:59:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 060C160B4D;
	Fri, 13 May 2022 03:59:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE606C0081;
	Fri, 13 May 2022 03:59:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9801AC002D
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 03:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 856A7405AA
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 03:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjMpW8RauTad for <iommu@lists.linux-foundation.org>;
 Fri, 13 May 2022 03:59:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DB0E40141
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 03:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIjsiR/MrdPeyWg6VkRaQT8ruEt3C6RGxHccxNRSuL8dZto9ATyIUcmp8G85NBod/DaWHNe9f75A03unHGlef0B6kzifkcZJlmyWxJc7L7NiXZeMXpXifacNSmm+SAluNY+dQFpHbsBNY/rg42X1gQI7VuQP3ftzW27WqpML1XsQ0cBT0T4CBzKan54cMJpogmC6Kbif5NvlWUXptNzWmNhh4SUO/FIGCdgdCACrUPhQbZY7etOvPCmVCbu25UXWfb3wGT9Dhn2jyKRlg/yRZh7LBnJQt/69HMhWgvC2RHBhZJLexm13oH8WtGL36ygs3FXPWI4HstxhznnsKC+cVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TzbrdRij8brRYiVqlrFh+4FgBMF+cKMYJexVYxCrUQ=;
 b=I4ktWSemdAgBNiGFkn+KrzJ5biFpM7/hxThhBbBr/8ckCvG/OoRbA0Ds3ipkEr3i8WMvwK9hb8Z2wreY7B3ZjzhpzKF/FGg5crx070CLbuLc+r6oDD8S23Ct85NzBEsmGeyGoU6dulUtIWKeyS3l9iVmkCPuIefo+K6IfFgZp+b/AMTM/mIIAuiYYZPIToWwt/ITKk4YWf+N+sxRMgmhlkx+pKfw5EY/ndcMMkWTT/NsbI3eF6sOZ7KFJg9IX7aW9Kfag9FN9dtI1EvTS2Y8/JNDpDgSVPOpR3s15uHEKqabd/YAL/R3JmmONAvHEc9jeCXchH3r4nkqKM8vhWYFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TzbrdRij8brRYiVqlrFh+4FgBMF+cKMYJexVYxCrUQ=;
 b=QiJKPw6aNO9OU+IPi0QRaRM6kOefA2nJYLBXaO9lIQrN59chFGpdHKwQcZ3wUCHvfxgSx65sqG50n6TrIzWgWiqJli/JHVOiLlzeAPkYjBBOj0neIeH46KaQuxPr3ls2xZakuYFPYnSoyN4sAJtzGBbLfLoF4LhfVlJU6IyFt/dWgiYB+HNRypFDt1b5lq/YcI4FKjRJD7k6Bgpp4wLe7nivf6DEzA/pXWLiWMefsW8XIZ3y9oXpExlpBPOGauT3G+lDb3ea/OgQkiyBnnEXRbcl5l/5mBblFqJUVuUP8nhxjGqJdZaeuwFiBh2eY9ezPvdAbjNixNSu2zfcusK1oQ==
Received: from MW2PR16CA0071.namprd16.prod.outlook.com (2603:10b6:907:1::48)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 03:59:32 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::9e) by MW2PR16CA0071.outlook.office365.com
 (2603:10b6:907:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Fri, 13 May 2022 03:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 03:59:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 13 May 2022 03:59:31 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 20:59:30 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Thu, 12 May 2022 20:59:29 -0700
Date: Thu, 12 May 2022 20:59:28 -0700
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: Try info->iommu in device_to_iommu()
Message-ID: <Yn3XoLa0h/IbQMMM@Asurada-Nvidia>
References: <20220513003233.4442-1-nicolinc@nvidia.com>
 <6da2adf4-6717-b562-5ee3-7e28447aa65b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6da2adf4-6717-b562-5ee3-7e28447aa65b@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d155da44-7aeb-45ad-ce7d-08da3494fc51
X-MS-TrafficTypeDiagnostic: BY5PR12MB4033:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB40338F4C6169DF8E62564CB3ABCA9@BY5PR12MB4033.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sfNpbBUqNEllMjNCxnMxgVGsnzaKY0ZV8YAyDpMOyKGSadCJWgb+F1ELb3sNfw3W5KjIIe6YMe9x0ecTYbr2apZM7IaDBFYY76j6X32JoLjwWwFOgXdDDyZFnauSvNDW3uPMpuVc2PF8icMUGgLR/RRHnGn6hw6nBiq6swKuOmBw43e4Fsyp8YGHI1aAmmPtV4kSb65O+aLerTJrMk5YpBc33tXY/UiA0M0oRqIiftdMOFxSNARehMBOgRCMGSGs6ZX0eQy/JAiFKn1SmjHbrcNonfd22PpdFbfGdBNpDPhFs8KLMp6QWzRus8PCHrAq6BzXAYPcW2nf41pfBIDYY5vP+48PhIaJf7NkZkTFn3fD9/w9TiA4lCUWtCPWAukRVSag38i1bqgereXmfL1GNAqwj+ZOXslOrPF7FMLceSAW2/SNiXyOKHRp5T2AHQTeK+wwkzZJ9a+TnC06BL1RPSUJE51XHS/YuvCu7wizSoDbfBDofUTUR+jg0MmfxEP7UlJsgrkdCVseSM2ba3hDlIoHmD11/32Qz05efx5OluQIkJ1grhAMFBujrGKVyqb1u+H8oS9MVj9pqxjOkBejqygP2bigVchry9M0F+bQbt277lxTvsS07dHhGLytzc0ZVq9IUMavX6hRP8gVV5NYJVh+6seH8j0cZITDa1+wto3Xanb5TK/xQRGZD9gkqjxxs3YBlLc3oDQKGbQ+3wncw==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(5660300002)(6916009)(26005)(86362001)(81166007)(4326008)(82310400005)(70206006)(70586007)(53546011)(356005)(316002)(9686003)(47076005)(336012)(426003)(54906003)(83380400001)(55016003)(33716001)(8936002)(8676002)(508600001)(40460700003)(2906002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 03:59:31.8120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d155da44-7aeb-45ad-ce7d-08da3494fc51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jgg@nvidia.com, will@kernel.org
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

On Fri, May 13, 2022 at 11:32:11AM +0800, Baolu Lu wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 2022/5/13 08:32, Nicolin Chen wrote:
> > Local boot test and VFIO sanity test show that info->iommu can be
> > used in device_to_iommu() as a fast path. So this patch adds it.
> > 
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >   drivers/iommu/intel/iommu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 2990f80c5e08..412fca5ab9cd 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -777,6 +777,7 @@ static bool iommu_is_dummy(struct intel_iommu *iommu, struct device *dev)
> >   struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn)
> >   {
> >       struct dmar_drhd_unit *drhd = NULL;
> > +     struct device_domain_info *info;
> >       struct pci_dev *pdev = NULL;
> >       struct intel_iommu *iommu;
> >       struct device *tmp;
> > @@ -786,6 +787,10 @@ struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn)
> >       if (!dev)
> >               return NULL;
> > 
> > +     info = dev_iommu_priv_get(dev);
> > +     if (info)
> > +             return info->iommu;
> 
> device_to_iommu() also returns device source id (@bus, @devfn).
> 
> Perhaps, we can make device_to_iommu() only for probe_device() where the
> per-device info data is not initialized yet. After probe_device(), iommu
> and sid are retrieved through other helpers by looking up the device
> info directly?

That should work I think. I was just not sure when the priv
could be unset. But it seems that you have cleaned up those
places other than probe/release_device() in recent version :)

Nic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
