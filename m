Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6D54BBF9
	for <lists.iommu@lfdr.de>; Tue, 14 Jun 2022 22:45:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03C960E4A;
	Tue, 14 Jun 2022 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zhqnqUXtcHj; Tue, 14 Jun 2022 20:45:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DA1CC607D1;
	Tue, 14 Jun 2022 20:45:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E5CAC002D;
	Tue, 14 Jun 2022 20:45:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD616C002D;
 Tue, 14 Jun 2022 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9750C81A24;
 Tue, 14 Jun 2022 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuGb4oKICU5h; Tue, 14 Jun 2022 20:45:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82EE281A15;
 Tue, 14 Jun 2022 20:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ3bF63yYGUN6eohvnWDP9oKyS+9TiW3ayXA/a22grBqOH2hJwisWr8dg6vL6FouhZIJxnde5LqjRSaB0B+B6jBVGsQk36B93Y7xZpZs+lo13PR26x+v0opZkLXS5oaJN5Qfqj7ancj27L3sTu9l27UYeoUv4RDgI8FjYffqcgUDp5V/qg9/U2iH1q2hqf2FXYMLLk3zd5kohvDblI1mhnW5/Zoso9i+mYdgxPpaLq99t7uaJCD0z+zSDITiw4ywtOfDCKZ9sjhwxtl6lt7Dm2tZfMxBdtDDkok9al6DA7ljsRd0uGbx6pYuf9js6DZSCCbD3myNMfIA0bqVbabvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+wdnHzm5/tFJI64HWledeJrntDDTEnQRGQb3TjHaak=;
 b=OqjzX1hhs8nf4EaE+2jE3pmO2Kjv2Mpr0fX4ctxEq4KLBSW0RYxjDnmzTvipUuAhUik3AAYgXsEQ9KKGf8RZgjwoViD4bZ+IrVBJp6v6s1KcottmCIVrRKvabPKML4QZ32oDBXoewriLTn8etvY8/CjbYtPNfIRmzBO78If3Lk65ZZUY+El2wr7LiYLrddG9srRMYGmbc2D6BqCYpYBAoNtR3jdIPEfACZrGqt3eHOPoTaVW3yy5O9+9//T3tuI2ozbvEZgzOk8c0XEx4ZSevYhwo98Qyr3cIaSJAv1K7NBIZAnl3WMPqEUq87YW2fpRPkfLISpEQUG3DqjD5psJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+wdnHzm5/tFJI64HWledeJrntDDTEnQRGQb3TjHaak=;
 b=XfpsHHlhP6RjgRnv2YvQYPgMseZ6o6stX8nOOrlRUvybxcMS0kC7GSuFMym2nIlbXTp7Odm9I5U5Pf3N/Y2WkCxg89a5nmpO9fvfNZnGmnygKuB/JgY2xtYkaauV+jQq0mCRmEzTu9Mw225ue7e9JSF9FC1xZkmQsaZ12oLvnqlPkb77jV0aKtAGged9X2LvbdBlHCNgh624YBjemTB/kCW9nwo5NuB9PgBKzoc81Lw7L3ZFP3iaf855HfB0+bmqlcx/gJwTpcgGazzT9HTEPQPP29lEZR/+LiMa2HOJF1T/T9Z4/taJufU6An6tgBiu7beCFIpJBgw8Q/Wxz4iHPw==
Received: from BN0PR04CA0144.namprd04.prod.outlook.com (2603:10b6:408:ed::29)
 by BN6PR1201MB0113.namprd12.prod.outlook.com (2603:10b6:405:55::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 20:45:23 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::87) by BN0PR04CA0144.outlook.office365.com
 (2603:10b6:408:ed::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17 via Frontend
 Transport; Tue, 14 Jun 2022 20:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 20:45:23 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 14 Jun 2022 20:45:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 14 Jun
 2022 13:45:22 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Tue, 14 Jun 2022 13:45:19 -0700
Date: Tue, 14 Jun 2022 13:45:18 -0700
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 3/5] vfio/iommu_type1: Prefer to reuse domains vs match
 enforced cache coherency
Message-ID: <YqjzXpzuBa4ATf9o@Asurada-Nvidia>
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <20220606061927.26049-4-nicolinc@nvidia.com>
 <BN9PR11MB5276DC98E75B1906A76F7ADC8CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220608111724.GL1343366@nvidia.com>
 <DM4PR11MB52781590FB8FB197579DEE848CA49@DM4PR11MB5278.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR11MB52781590FB8FB197579DEE848CA49@DM4PR11MB5278.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c57380c9-1dd6-4d7d-4096-08da4e46ce09
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0113:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0113233C3B5CAF3FE03B6129ABAA9@BN6PR1201MB0113.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01Lo7EEKLCy2OIC9zTeh6zz/WeBLpYGCF/uXe2ghKhndvNCltYjbF+9OT7LjgeEp0EGOYX5nuh8iNeJdBU9ltcgjgxnXDpq2V4ci2ZGnH/qdqBYJAvHqdOHKYZnlUsuyIwMc5/ZbSNSlzit+njn0WYai4x8rr0ZEmgKxr9lbMKggl+67Z3iwkRyy0mB0dp8SfaBVMh1XZDS8flTgxtRw9ggZO3cGg1XUhhsXl9VK5HMTXN8sAFQn3IJgkOd8SZ8F75KGwXFAp8byCM4c6ZzPY0ocQ+1DYLkWW7xxoqtllkzXftPyL/EON92SQXB0iomv5sJSfASJa52ZEdJ9ZCVP8emmMOA0am7u7MWVpExc6P/LjBm1bgZANxlx1mptyq0XjhB057UHTchHzc333st+7lAC+iGMOew4JEbMYoRP//znW+l8zk9usgbzA+tg55NalrgL7Pwht3H1lcAyo+37W026OIYzHwBTwtw0dS3vbt5YA35V7kyPIZnJri/6mo9tuelWk3JF9QPHOG4EAVfkPPv9nWOOTYs4BGK1uO5sxTULTBgNSVwaSw2R+JzRxKw95KPJE1sUFHwcXvCi6mNojKWSjRSoZgD0KA0/ZAbi09qjpoXRJjk/2PiOSdswHXc9qzUWl36cTtF0LUxCn7pNzSodPa/MLmoZXXZ5fZNnEXHmKdEljxtMKov1+RUJYUOPNVkI2hG8arkjz3tAzGtodg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(7416002)(356005)(36860700001)(7406005)(2906002)(186003)(4744005)(40460700003)(82310400005)(26005)(9686003)(33716001)(70586007)(54906003)(8936002)(86362001)(70206006)(55016003)(508600001)(83380400001)(4326008)(47076005)(8676002)(316002)(426003)(336012)(6916009)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 20:45:23.5861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57380c9-1dd6-4d7d-4096-08da4e46ce09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0113
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

Hi Kevin,

On Wed, Jun 08, 2022 at 11:48:27PM +0000, Tian, Kevin wrote:
> > > > The KVM mechanism for controlling wbinvd is only triggered during
> > > > kvm_vfio_group_add(), meaning it is a one-shot test done once the
> > devices
> > > > are setup.
> > >
> > > It's not one-shot. kvm_vfio_update_coherency() is called in both
> > > group_add() and group_del(). Then the coherency property is
> > > checked dynamically in wbinvd emulation:
> >
> > From the perspective of managing the domains that is still
> > one-shot. It doesn't get updated when individual devices are
> > added/removed to domains.
> 
> It's unchanged per-domain but dynamic per-vm when multiple
> domains are added/removed (i.e. kvm->arch.noncoherent_dma_count).
> It's the latter being checked in the kvm.

I am going to send a v2, yet not quite getting the point here.
Meanwhile, Jason is on leave.

What, in your opinion, would be an accurate description here?

Thanks
Nic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
