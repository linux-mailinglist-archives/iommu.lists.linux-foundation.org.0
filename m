Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8965561FA3
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 17:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC4B4243D;
	Thu, 30 Jun 2022 15:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC4B4243D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O1Ug71V9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9JrB_0mjzXu; Thu, 30 Jun 2022 15:47:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EF2BD4243B;
	Thu, 30 Jun 2022 15:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF2BD4243B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B58AFC0036;
	Thu, 30 Jun 2022 15:47:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD55DC0011;
 Thu, 30 Jun 2022 15:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 847276131D;
 Thu, 30 Jun 2022 15:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847276131D
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=O1Ug71V9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1pob4aXPGBA; Thu, 30 Jun 2022 15:47:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BCC60B52
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39BCC60B52;
 Thu, 30 Jun 2022 15:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReX1jEWdxSuhhdHFwKM5fJ819sOidh9Q8lNGsrdfYUikMfgC1UAxy6+/WrKxKbNffwwM8OWjtWL8p+sDVuRwcT2PUGiOeWqTJzqjLK2T4klf+sB75cyadQKkAiU3Vnag72W7GeshXW8/UbSJSVoFkRSYGnqXYiuke2j5qirNMrHqV9mxHYryoHZI05hDgnoguz1PIoHDos0xy9eu46SiBnxcFwiOt+gOuFeI3Ax6x6Sz17bmWYkHAuJbrMKRZFG3nF7qdXsmBtXdNi1/pLejtEJ3EKEDCEEerfLgLf8aT9HE/+eMlm5uvoQsKUjP34gPt+lKhSAH6p+W+IDcYrCzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4knE7NeF9O6915bdQE3we2jAiLyReDkbEGYh2hFkeQ=;
 b=R06mzZxPAHkWxJoTf7gvEkjooRXViwNSqpmz1oimlu5CxtNT9w3fd7ujvGxCRvWYe+YBeiZuDCTwbfX1YGd15HWBLx4s0hE+CTPQP1sy1Kf3sDwt6uVUadKGup+uWGJRiZczS61y+y1ivdnlIUjMtTxYfxOW7nAd2FO4mIaKMedueUmCSaR4x2GtnrdTpXfWpvANjG0hHu4LUEt8Tgc98Ztdck0qpVwJMFzXiD0PyyhNX2CssnkJklIMZCAurCNOr25+aJfRMJVpKJTR6i4URaHwn+XnU+LJ0mNdCEIJAmiQzZyBGU4hLJDc4mH9igDxGCce7pN1XgLxmQYqslzmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4knE7NeF9O6915bdQE3we2jAiLyReDkbEGYh2hFkeQ=;
 b=O1Ug71V9rgsxHepgOKd8t/W+cEagFwcuNULRw2bTqt/zUpT99pwQ5Bv5lZROi4U+RmL8SMnwsW869dfiKqPpqGYYK7XuUAksfIlHU8HAAloY7+jTDkib8Iw5N+YfXrwB1vNoPbXv0FIpXFqEgfn2tGdacJ3/3zMOWN8E7bfV3fv/R/a9NYi5D8Xd4lZhs9TSDzYADekQEGOy5mvIbUmuTw/dF7L2xAoNLuwBq2fzP8eoi70LY6iytkBWcfjAsiKL482FQIGR9CfJJZYjUQf3oPkm2TbBmJ87AJTmGH6+dpUNjhrGlun0NATmpMobvI1tfsG3QjMWjaHySuJDLV1Zyw==
Received: from BN9PR03CA0506.namprd03.prod.outlook.com (2603:10b6:408:130::31)
 by BN8PR12MB3346.namprd12.prod.outlook.com (2603:10b6:408:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 15:47:45 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::88) by BN9PR03CA0506.outlook.office365.com
 (2603:10b6:408:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 15:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 15:47:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 30 Jun 2022 15:47:43 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 30 Jun 2022 08:47:43 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Thu, 30 Jun 2022 08:47:42 -0700
Date: Thu, 30 Jun 2022 08:47:40 -0700
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
Message-ID: <Yr3FnN/BllcvsxsP@Asurada-Nvidia>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
 <20220624181943.GV4147@nvidia.com>
 <YrysUpY4mdzA0h76@Asurada-Nvidia>
 <e5799215-8b55-90a8-7ca4-35f85ffb5969@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5799215-8b55-90a8-7ca4-35f85ffb5969@arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fd1f73c-83d4-4701-644f-08da5aafdfe6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3346:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjvVuvFYoRTG0cMSO5JzRPRiPXKqRcZbftAunG7tZ9oc1+EMEb+53QtAeRhl2/3LVChXAd5q3z0bQyouNOZSQxitSyC/t9UC24HBTx5aEddqiOjkZopXI0dP9UgNjCH7ZI3/5/PUnFK4Xh/NczZC+S9405mjDH+lJx+QzkjIqW9MGgP7baMje8/juDdR8Wq10huYrWZiJL2quWx8PGfkwS8hza4wL//PYRHmMIIoBO6Add0ZcaU+MUWZG1KnrR+V570rPgDLAlWNlaJwckDIJ3dpkn+hpNDLoNavMCpQiXKyHudzAlm1a6PD428HdrVqB9kEp2xF8W8BKqIDLJva1QSUAElShSFtPeo0x0AFX8AZCsIoOsACnH76p6GGTfjf9gbLXwthmzHFlY9P9lqU69qFAPGXMsqtFxkXXQf4A/tuQZhs2CyBL/XcdOKxQ0MHdrUvlMrr68lBhEmfvV00/sMxX7+heAYNbxI7YVIjupb0czv/C7m+Pz7p71DmMvnDUWUTmC4YKFsS1BK77N+FNox4b0KbuU+XUqwxx+3Tp7OdEuirOxxC9vOeTl9wyEQOd68lVWZ39QJCh0D6PjYUfOiOupRCxyJx0+B6TAQUqPMr/eIGAysjb8HLZmNBS+CpeUL2uStJrbl9fTYKoZB7o6KYqrk5D8ffOIsSS9zzJH2wHzXX6XaAr6//uIR+w3TWbMyjaRJkFwi4jxd6OG5twGmqSPU1mwUE0IuAHsswFN6Y7ZSIOp8kzGmSdRPHr0LtvF/13pE109fWpymdS0VRz8Oxkq/7izc/S6rvptPp0IO/PLwG3rKmto3nPsaEXwsEsICUcr2dWCcEguK+YWry9DCFapjkhdIGg/7pGDqoKNg=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(40470700004)(46966006)(7406005)(7416002)(8936002)(5660300002)(478600001)(2906002)(6916009)(54906003)(53546011)(82740400003)(81166007)(40460700003)(41300700001)(86362001)(8676002)(70206006)(4326008)(316002)(70586007)(356005)(26005)(336012)(186003)(426003)(82310400005)(47076005)(9686003)(40480700001)(55016003)(33716001)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 15:47:44.6978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd1f73c-83d4-4701-644f-08da5aafdfe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3346
Cc: "marcan@marcan.st" <marcan@marcan.st>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
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

On Thu, Jun 30, 2022 at 09:21:42AM +0100, Robin Murphy wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 2022-06-29 20:47, Nicolin Chen wrote:
> > On Fri, Jun 24, 2022 at 03:19:43PM -0300, Jason Gunthorpe wrote:
> > > On Fri, Jun 24, 2022 at 06:35:49PM +0800, Yong Wu wrote:
> > > 
> > > > > > It's not used in VFIO context. "return 0" just satisfy the iommu
> > > > > > framework to go ahead. and yes, here we only allow the shared
> > > > > > "mapping-domain" (All the devices share a domain created
> > > > > > internally).
> > > 
> > > What part of the iommu framework is trying to attach a domain and
> > > wants to see success when the domain was not actually attached ?
> > > 
> > > > > What prevent this driver from being used in VFIO context?
> > > > 
> > > > Nothing prevent this. Just I didn't test.
> > > 
> > > This is why it is wrong to return success here.
> > 
> > Hi Yong, would you or someone you know be able to confirm whether
> > this "return 0" is still a must or not?
> 
> From memory, it is unfortunately required, due to this driver being in
> the rare position of having to support multiple devices in a single
> address space on 32-bit ARM. Since the old ARM DMA code doesn't
> understand groups, the driver sets up its own canonical
> dma_iommu_mapping to act like a default domain, but then has to politely
> say "yeah OK" to arm_setup_iommu_dma_ops() for each device so that they
> do all end up with the right DMA ops rather than dying in screaming
> failure (the ARM code's per-device mappings then get leaked, but we
> can't really do any better).
> 
> The whole mess disappears in the proper default domain conversion, but
> in the meantime, it's still safe to assume that nobody's doing VFIO with
> embedded display/video codec/etc. blocks that don't even have reset drivers.

Thanks for the input! I'll just respin it by dropping mtk_v1 diff.

Nic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
