Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C88486704
	for <lists.iommu@lfdr.de>; Thu,  6 Jan 2022 16:46:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075028126C;
	Thu,  6 Jan 2022 15:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoRpOYxMr6Xb; Thu,  6 Jan 2022 15:46:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0663580DA5;
	Thu,  6 Jan 2022 15:46:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C94A4C006E;
	Thu,  6 Jan 2022 15:46:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CC07C001E
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 15:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B554295C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 15:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cu_K_IcW67TK for <iommu@lists.linux-foundation.org>;
 Thu,  6 Jan 2022 15:46:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB27B4295B
 for <iommu@lists.linux-foundation.org>; Thu,  6 Jan 2022 15:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS685DgaCEZf8KJypa5yYgCVH6t2efTr8aWTUQofKwd4ZwEDfWXimBAYjP2GRbEOxN1gj5vx3LOmvw++3dSvjEYhmOq+dRkB56BTLG8vuh0xus+b8JwtEL11wAHAAc7wivTl0bHgX2f3VNgjUvJRw8QxJwV8qCS0YPcZSMa5AZKrfG+5L4UFqPe312/nFn4Yba95WF80lrB8k7PHoJa+9e0BBOMzgubUDgFbA90LtHgibIily748OJJSXvDqAYammyrkPn+66mjMfstMD3t2Ad1cw7vpJiCuhU7J/4ffCLSzlk1Z1meO8ENwb0MZPZeDVLmNgXZXYt6M0HxbKAGiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2Vb9In5MqzI8+JU2yjUYDuP73Nr//hfKa8NH5aWmyc=;
 b=eKTrSjXWFquxCGpJJR0I1MjJovOmvyP92ecZedNwrs3YDRx5AYQK/TrfALtPCnpW9Tbwoe4OnhrqzaVLWGPxT5VTkKX+VSIMZJshbHlTieRL8ns9YJfBsO0osrdzn0nUmFD3oxLjygovWbkrwtI/h8xjuupr1MikzPYW+hsViKK7oF64Ym1Py5P6zJn/vhIKH8t3lBcitMBsZR2AD74PpCb7/mV/Hfy1IV0mxCbqxh9FAPUZDhm8D5G0c9yWdgzxISrbt2mZU8t5HpuyCtW15dRcuYzf2yt0lqJsN/CkO9IJ8por4Wh7ko8fS0v2IWeYBfgSyrU0Xd3FGl9ZVFmEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2Vb9In5MqzI8+JU2yjUYDuP73Nr//hfKa8NH5aWmyc=;
 b=QmVE9mxv1fWU6djdrTjqAoyCqSzfVu3GyM/7oqXEU2yEhPwyPSUU/Fe3o6ok6Xs3GUEWZvYDsCQ7Ori9U9r0xpNg4axgbG9sPJFCbO3pWOPEzCC3w7AVgwaZCOOx+/+yHTC6b6MOW83DUHR/sXz5yEJ0+OKrA36VHQyU3nBECMkReNYD4AV8UF7PXNOaP59D82ubkv4tZurPs9O8LE/0ewD347SSx3llT/Ej4kEYSPgMirqUKrnGGh39507IEnkjH9BxrXPJFAepeOW/8eO2wDIG2W3O/3CA5JS2R6Nld76CIPqXsc/xrJxRGSnsj2CAagLJmWuADEBTRuOw/PgEjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5335.namprd12.prod.outlook.com (2603:10b6:208:317::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 15:46:37 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af%5]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 15:46:37 +0000
Date: Thu, 6 Jan 2022 11:46:35 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 01/14] iommu: Add dma ownership management interfaces
Message-ID: <20220106154635.GG2328285@nvidia.com>
References: <YdQcgFhIMYvUwABV@infradead.org> <20220104164100.GA101735@bhelgaas>
 <20220104192348.GK2328285@nvidia.com>
 <9486face-0778-b8d0-6989-94c2e876446b@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <9486face-0778-b8d0-6989-94c2e876446b@linux.intel.com>
X-ClientProxiedBy: CH2PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:610:4c::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c0ed50-8564-4aba-5b20-08d9d12bb947
X-MS-TrafficTypeDiagnostic: BL1PR12MB5335:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5335DCF94BE471225E85409DC24C9@BL1PR12MB5335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LV3XZY+hU9KilSDBivNLIVZzdFLkbDFOmXYaVQK3ecWEKJyBKHqwvKfK+kRv+9tuXbxTA1I4rzRWakAYfguSgClRw7tzL4/hF/fr6rBCbltmcpPtR11C2Qv8dmxUeJmTm3XIYLzx9+8CPjlHtD+q0TAkmYaMurhAfoxPbRUAyoGiE00WtHqjOK0UM1rtV74d9VHnjB4FIewZ9bfpYGcUjsiHeCC+ZkSy3YszByAEzE5eD/Fanfug65mTlORzCSAuIIVOfB3x02Q//wUmEuLBsJUu4WU1gwNJ0KCfFSbSdLM79TtJ3Lo9vAwT1hEfDEO7GYdz+OIAfdSkGag5cun/H9e7KWy6XF3rVs8HdWwEhxa8Ig3kDnMIPfIFwgVsOAGKkZISvMkDDK9vqGu1IOkv0XOD3pGc3KF7d+wmJViLsIctv4TBb4paXAwQZN16mmRYNjh3KW4mqfPyB2lPZOtr3Pw6knG5f3mkv+626PBysYFxzraH15mJ5ECtkHdnR44iJW7BeYo4FUorBXrjEx6BxgSScCOzh7nv3KKrh+L5W9QsIlAB8OYaRBPlf58HGb7cHhlHbXbODMEg/VmaKwJQTPD1j8+sXamEcUPd93uOayaeDlKoWwWwK/5+9hR+01/yyXsdil3QsYS/lj//nHUqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(66476007)(83380400001)(38100700002)(316002)(6916009)(2616005)(6512007)(1076003)(6486002)(8936002)(508600001)(8676002)(53546011)(6506007)(26005)(186003)(33656002)(36756003)(5660300002)(4326008)(2906002)(86362001)(54906003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lT4KlXRUX2iAnj1SvP+X1X5i1rLB1Id0qwnbzfzLjtvGQgUeAjC2YEUov6hj?=
 =?us-ascii?Q?JZFYgI7DBa7wwOnr8ULoXUWzd+6ICB9LHUBK9KNurPNMKU0KIxWeZwRrruwL?=
 =?us-ascii?Q?92+jEg/S1jOrAMJUwXVpip+stHn7lvoRUTMsEQWXHcv/Nr+OFMP7MLX2/f5v?=
 =?us-ascii?Q?ILBdRm9uA70uEw80PGTLRb7oy/QnWW/+67uvs5SrODt8vSKLojANHjtCfkwE?=
 =?us-ascii?Q?HlGeDRtmpVWkXS1hBIjWtHHGUlXyFV9DQ02M35BeyTBtfTJ/jHtJ5PM/qotQ?=
 =?us-ascii?Q?IOyPBwyl4/ZYmNSX5eOcPewG8CWZWsQjQ0SoaQmqjhLu9pnI2vUolpsg9lMa?=
 =?us-ascii?Q?77rT2+kbkKA6dJ0SjKRf+7O/83U5+X8Sa2O+/I5Aab876Ajfnh17CDPWwK3r?=
 =?us-ascii?Q?jHz6Lt1MdNfk6eGJcQpVT0qq9ysyXesBa4XS4LJx92Z2vQ0yZyw0vq38k1QX?=
 =?us-ascii?Q?J5C7zKr6O3XENp3K0tgPJWSfCk+CdGwPy6vlOczPAjBS10Orxx0q1THn5DQH?=
 =?us-ascii?Q?SsK9b3bAotNUD97QKMvTozygseJLS3pt7/aYO1R68rN8vb5cDmsdLL04M/+P?=
 =?us-ascii?Q?hnpfRxvM0x13Nx2fVyOErZ5lmWpXdScQs7Uk4S5gZtqAiXvjNJojaULufeeI?=
 =?us-ascii?Q?jXlnNf/mFwttQX8mF5pWtnBkzh4KlFfOvz7NwWlxiDvmyNHoJpcBSPgay2zo?=
 =?us-ascii?Q?+IqbaYC0pu7jUfGjYw6uKyX6R2It3tFMn90qM2bhU07F/5Pev68tK4clEPn6?=
 =?us-ascii?Q?Jtb8U1vy2ufngySqbTDfocVWO8phCJRSVjDXudao9T3xEqklfpk9ryHxyD+H?=
 =?us-ascii?Q?hnH9GhpmOXms569pX0c2JokaJZF2HCshmS4iFgloIvCfUdF16J6DSmPpyrcf?=
 =?us-ascii?Q?J4B10YXU8/kec+B3tGvMIG5NWIOvM2mRiRL5sgAlMHftlBN7qpeiZz+Bv6TW?=
 =?us-ascii?Q?6wsenxsKUUTGVKHNhlj6uaQv8jx3m5NXRnXj/BGFekxqVkuwcYWKanL/Xjv/?=
 =?us-ascii?Q?0aDNoDocbmb8xWk1Dx47SvAKxbVzgrOfwGnYz3E7JIl803k5OwVGRfWvNQeU?=
 =?us-ascii?Q?J0gPY9nxuW9UvC1Rrxwe7/HcQjlld/VAPVT8g3CZBSchxhjul/nRM4+juwWS?=
 =?us-ascii?Q?Npx8JDH4U0du4pRQg/VeVXmdG3ypdUBQqgAzPJA5K3v5AOzmSOZOpm9Ky7uD?=
 =?us-ascii?Q?BxWMYzAOjQeiWx3Cz2OsdYTgNuNaPXNkmIyx4W3tx0+IMSlCSuYJ0sJ8wZB6?=
 =?us-ascii?Q?JIb++lf9A1PlR3yRRDXZyXFGUk8VfTr1ZI40kDisSu1tcjGqEmLxfn/lq+yQ?=
 =?us-ascii?Q?FNfCfEsdL6EQUyCp0rug4OMCYoyhsQuDKftgyaop9KkKOInoNpxv/hyF3c9v?=
 =?us-ascii?Q?FFGIxKS6NEdEzE/GInpzQgIN4PUv9QCb2l3Q587R4tahV2oPueJzFGlNfipJ?=
 =?us-ascii?Q?k+7ncH6AqGVeocRIGdO0ZJgF4AgufVNSrwzIHcJp5TFZwvDKK56mN7xAGdt+?=
 =?us-ascii?Q?haBRKMcNXoz6iI0GsrS7zApLRbZE0uU63JwDpcXJTJoP4CL78gzuF1D1vpVK?=
 =?us-ascii?Q?QrwHRezt/yx40PbvKlk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c0ed50-8564-4aba-5b20-08d9d12bb947
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 15:46:37.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+NkjPADbb2WlLeh/23x8l+WmRXTx0E73GJgGLDLgyfcNmUi4wMNCseqh4b7qMCj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5335
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jan 06, 2022 at 11:54:06AM +0800, Lu Baolu wrote:
> On 1/5/22 3:23 AM, Jason Gunthorpe wrote:
> > > > > The device driver oriented interfaces are,
> > > > > 
> > > > > 	int iommu_device_use_dma_api(struct device *dev);
> > > > > 	void iommu_device_unuse_dma_api(struct device *dev);
> > > Nit, do we care whether it uses the actual DMA API?  Or is it just
> > > that iommu_device_use_dma_api() tells us the driver may program the
> > > device to do DMA?
> > As the main purpose, yes this is all about the DMA API because it
> > asserts the group domain is the DMA API's domain.
> > 
> > There is a secondary purpose that has to do with the user/kernel
> > attack you mentioned above. Maintaining the DMA API domain also
> > prevents VFIO from allowing userspace to operate any device in the
> > group which blocks P2P attacks to MMIO of other devices.
> > 
> > This is why, even if the driver doesn't use DMA, it should still do a
> > iommu_device_use_dma_api(), except in the special cases where we don't
> > care about P2P attacks (eg pci-stub, bridges, etc).
> > 
> 
> By the way, use_dma_api seems hard to read. How about
> 
> 	iommu_device_use_default_dma()?

You could just say "use default domain"

IMHO the way the iommu subsystem has its own wonky language is a
little troublesome. In the rest of the kernel we call this the DMA
API, while the iommu subsystem calls the domain that the DMA API uses
the 'default domain' not the 'DMA API' domain.

Still, it is probably better to align to the iommu language - just be
sure to put in the function comment that this API 'allows the driver
to use the DMA API eg dma_map_sg()'

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
