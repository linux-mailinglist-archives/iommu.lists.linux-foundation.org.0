Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F24ECAB8
	for <lists.iommu@lfdr.de>; Wed, 30 Mar 2022 19:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BA5401D5;
	Wed, 30 Mar 2022 17:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjJnsLWpD_rm; Wed, 30 Mar 2022 17:33:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3A75A40168;
	Wed, 30 Mar 2022 17:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ADB5C0082;
	Wed, 30 Mar 2022 17:33:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B106BC0012
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9719D40168
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgyppEe-aMqn for <iommu@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 17:33:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48B9F4015D
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+OqmnNgzo39wGTAD3Px37xU4crtcq/+7X73VXFpLs6TWXuDPq1oDFLdbuhzPK1n0lsHnmUutoLcqCRZ7nY83USv2uPCFY1UFpgU82jrHHz2nI/IS5aCVIkZPXK3V5M8f8hHKeWiaSDQakaHkLUngEsb6Pwd2aKNU6yXrrWLqyUPms6+/zBecCtM3+8KZ+QB8LJf14x3j1R8GO79LY5oGAYfwAOw+cXve936oOwiOAM3On4xu4pC8aS0henBWEIQYZTMP/Aj2m+bYu3ol4yCbJDV7gvPwQSq9/X8Tfzh7BNG+CNnLQN/+Jl5f+OWSucv7G9U6bY2xUJpQn5lDOmrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNPo6km0DigoVON72TTyEvKUKhZm3OvmrALL6xn5Vok=;
 b=Eh/SDoLoqZ2wds6FwaP9uFFiCG6yb1NRERPhMJQO8XV71VWl/wZsE49XUZu2qn8jkb1e33YIJitcMmYkl7H0TDpJ/R6aedUZSzdYUCPDnnDM/CtIbivjDSblvyVddnVQUEGbgtWuLf7y3JyDZrAz/YGdLUP1H3m1Ry9xoPwgShHeyBDVCz9Q+8kRnXvSdq0WkvEEQQYa0+FGxYOm97+S1x4gJ3aFzF/6Sj8dedq6e6eDq0EsrzaKpPoW0Oqk1yd9uazOGGRlGcskNWPVFVhKlxbRi+UBRqb4g1qG+AXoec2y36MWO60R39+LGV2HRHGtmdnr4R05+vcTShoo4KuGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNPo6km0DigoVON72TTyEvKUKhZm3OvmrALL6xn5Vok=;
 b=MFfKnJVVzazKw+wDlzHoOygN3jEMiYSkTFZyOlYeKjmKleNYd/QN2PNUmFaAHeIwHgVO9dDfESd7qqXGHQEp0/c/vHWG1htCeS5c4Nuc1ZsNaQCil8tL98+HqrYNMKeCK9EuPS0riAk1SLdP+5N2p3MfwTdhcPGNrJonJJCOJAO3xDl4fhELVj74c65DOJPaw4FL23YyfCtyjP36dfN80gTiDdwpdggEVIhPdOOXYKD3nGYuHXz2J1Xs7h2+YAD3jYWZ/mneUT9pI6gXcwlmAk/r10g7ENLtiyk8PzietcYQwIcvS8wWVrYgax1R2lV6deFadMaRneuOOZa/uR7eJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR1201MB0216.namprd12.prod.outlook.com (2603:10b6:910:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Wed, 30 Mar
 2022 17:33:24 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c%6]) with mapi id 15.20.5102.027; Wed, 30 Mar 2022
 17:33:24 +0000
Date: Wed, 30 Mar 2022 14:33:23 -0300
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v4 8/9] iommu: Remove unused argument in is_attach_deferred
Message-ID: <20220330173323.GA2120790@nvidia.com>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
 <20220216025249.3459465-9-baolu.lu@linux.intel.com>
 <YkRiawC2T9g+CHSJ@atomide.com>
 <20220330142340.GA2111031@nvidia.com>
 <YkSRKZcJO0q3v5WL@atomide.com>
Content-Disposition: inline
In-Reply-To: <YkSRKZcJO0q3v5WL@atomide.com>
X-ClientProxiedBy: BL0PR0102CA0027.prod.exchangelabs.com
 (2603:10b6:207:18::40) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16ad6700-2475-4ab4-2cfd-08da12736478
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0216:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0216EF9A6113E2B1B0B502A5C21F9@CY4PR1201MB0216.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1eEfL35KrYQia38PSqmVcarySsiGNqYj+GHPhyQ8FseOo3IoBH0Gm5MFpxyYH5I2MHy7kkAhFBtILnPMbpKWTBeRIHAGxO6EFqJ9xI7lGT4YO/l4lvtOPVcjIH4ofHMw41Mn9CHV/PRcD8Ad/VARCvALxdxITB20O4BJdrd0EKHLTbol2J8D830F03EuofmYo+JrCJcMpx2JFfM1IaE68ovfpDyPc+nuJH5nrPyyNMDWIxR33ss2pagic9p4GsDiUjcVeOMSvaIV8uD+LGciTHrDVvdRqBD069FuChTMYS6edbywVtoEr76Sk5kwX7sdwhhbp8NPnMZY1kYYndxYtto7oBYPulW6EdJvCgngtSc6/sPRW5nm/8CXPr1AAXbyrQyp6N/IY2Vk6IEzVm4nUn00ZcH80dJ/qPk8D7JJ4pRr/NB57WeNXHIIozD3oNH6Y5ADQ/+1js/K3n5/MtspMWKrpw6BrRpGQUYAGaeOBRj4ACslY0dwcThW8r9kdA4kH7gFA+sZDtGOVEFbej58AOo1Bm7oUJFIGhl//GF4kvAisHk2GAWtxC1uCnWrrR7P0sy3YjEEmbc7igfDt+baM+mFcCdR1DxX4fiGMisHGPZh0iFCqmvsBZ6mwLYit5ZQWgfV3K90pT245IQnLOT2ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6512007)(33656002)(83380400001)(86362001)(38100700002)(508600001)(2616005)(36756003)(5660300002)(316002)(7416002)(6916009)(54906003)(4326008)(8676002)(8936002)(186003)(26005)(6506007)(6486002)(1076003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?az5X5R4FdEXABSTFo6AnFfnD17ARTwkvatL4FG1XSkUHGltiKA9COg9rwx4h?=
 =?us-ascii?Q?KkFDL6kWlm8qH+ZxhO+ezS5EhaJUFIUGzCn+2LMJwF1+ILtLCQdk7wywlw+9?=
 =?us-ascii?Q?3wkpHol1HjvnyZePUur2vpQcaT1jCuEdCl3AjtLyZTwfXhaW5lPxXJ5aYS4n?=
 =?us-ascii?Q?psADcy2O4Y+BeootJo00UdXaS0JpXOn7MJbHgtXpTc7buhP6UZOoBO6hZgRH?=
 =?us-ascii?Q?R+kBrbAajePWhykRJmG+jEgNVk21odW28r6jd1hU3y49dCeJI6yngaRRRJ13?=
 =?us-ascii?Q?pC03p5Hk8jgA5A8jGHrMyo3xzg/aFcIPYSCplU5lAo66jgWYx6SlOIm+IzII?=
 =?us-ascii?Q?twvlOBLd4aISbtP9ok81kSODwYrujfPxtApBmn585e+3OzzHqIkygpF8XWLK?=
 =?us-ascii?Q?7Z1UtB4159xYFe3aI/97HxYHjOUcGvibWSTHphXxMUXYixb6leeUh+KVi9Qu?=
 =?us-ascii?Q?ht+k9OnOKeAjErWN1v+GntdjMtG9be8i7R6q7NmoonTNtxkvgZDAJonXK1YJ?=
 =?us-ascii?Q?O73q3bXJ2WBFkekwAchjBJjZxUnYmMtdSy8AiUd6+HYHPkzrz0nCVX4Jcrb0?=
 =?us-ascii?Q?SKxxzqW3/SX0lcgvHfKQCCahDS/TlTqg7BrqVG3rWLI0jAuDHoT9433NCAIs?=
 =?us-ascii?Q?34aei4n0rijMAQgto6iM58jwO0//E/SWfWyykAsnP5F381gY7T7vOy/Gnmh5?=
 =?us-ascii?Q?p8NMa0zdPw6R3+k3Xi8A57j3aIsExaD0oYM8gDV/62qf9lvT7C1F7qfHGxBr?=
 =?us-ascii?Q?K/ZeN6k0IVQhL5y1fFESg/r3DKu/pOXbhILKV0YjQrHY7U33fUXRFVTfT48f?=
 =?us-ascii?Q?oEC7UMnTvXXh5e+qW2Err+1NBezP4AbGYW4OZSi0XBT9aWCOLrtr0cL90MD0?=
 =?us-ascii?Q?V67bkWpGXBb7gw2hi6Ja023DjOXz18CUIF1pfNbmRg98LMONDw/3WIX0GByd?=
 =?us-ascii?Q?nnvcD42uaUTpT9UwDolD1q9AkpfAw2wWiyijbjMVRla1UWLagJ+yn8F/PaQL?=
 =?us-ascii?Q?0hKT1OgDUUi8t6yq0rAzDCqUXeNefC+XbVqcbcwd9Dxy5Pk/gD1lpKhprZhc?=
 =?us-ascii?Q?g9ESR5K4v6EHnluWJHxRNSNxBxZ1U3nZzWY1KBALOBHqzcXSygkntFlgfdRw?=
 =?us-ascii?Q?eUUmnV2k+tDRYyfMKEgU+1Tw7Qj3w2njUmMxW4P+XznCPr0JrX1XapJ2eq6A?=
 =?us-ascii?Q?z2+N31Xpfr9FeIXZ5J9nvhQdXaEZlSAD+diMGtXq3/YNc7IMAwM3yYvbKfjr?=
 =?us-ascii?Q?rsQwfiXIqRBppzbXzKq830plKWu5dnZtgGltoU5pNMW6n0NCzCf+XY+q2c6m?=
 =?us-ascii?Q?hz/1VLKpHT7DZ3ZB7rrdyqSnthddpr0H8yQRfoTNxuzYQ0guFZI1L6hHMp/R?=
 =?us-ascii?Q?FQD43ZrbSAIr53gOQU9xiv0WANxYub/SmX1CpDPpGrGMLbHdv4etRWfVLseU?=
 =?us-ascii?Q?jiQnaJUrto6U35lxK02RA13Q+es93vNrhCxi3bQ2aL8LVA/oX9C2N8nHFIZr?=
 =?us-ascii?Q?bT6+Z7AGhi69VOGIWUmGy5dQJvCL7i+vyAyafqz7YEHl2DcADeqU9i4dMqNk?=
 =?us-ascii?Q?dcEC40s15QagEadaGLI23SkWNVjc3II8g4G9hPr0KK6beASew62Uhg3heuje?=
 =?us-ascii?Q?4wR/3NBLmuIwo039s79Q84Q9AIGayxI5qi8xyDTcdagyddWfLhoo6spJO9qo?=
 =?us-ascii?Q?PPi4TyMZRpy4FgsCti7iXb3fDEDjNGjSCFGGU22ZUX4NxeXdav7Hg36oPIz2?=
 =?us-ascii?Q?Vbv83lZaVQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ad6700-2475-4ab4-2cfd-08da12736478
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 17:33:24.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh+n73HOsf38Ri9qNKi5M4p7vShHqO+Gg8MkwNPuhqe9+dJ+9/TdOSjLEtgmbZOh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0216
Cc: regressions@lists.linux.dev, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Mar 30, 2022 at 08:19:37PM +0300, Tony Lindgren wrote:

> > > __iommu_probe_device from probe_iommu_group+0x2c/0x38
> > > probe_iommu_group from bus_for_each_dev+0x74/0xbc
> > > bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> > > bus_iommu_probe from bus_set_iommu+0x80/0xc8
> > > bus_set_iommu from omap_iommu_init+0x88/0xcc
> > > omap_iommu_init from do_one_initcall+0x44/0x24c
> > > 
> > > Any ideas for a fix?
> > > 
> > > It would be good to fix this quickly so we don't end up with a broken
> > > v5.18-rc1..
> > > 
> > > For reference, this is mainline commit 41bb23e70b50 ("iommu: Remove unused
> > > argument in is_attach_deferred").
> > 
> > Are you confident in the bisection? I don't see how that commit could
> > NULL deref..
> 
> Oops sorry you're right, the breaking commit is a different patch, it's
> 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") instead. I must
> have picked the wrong commit while testing.

That makes alot more sense
 
> > Can you find the code that is the NULL deref?
> 
> I can debug a bit more tomorrow.

Looks like omap's omap_iommu_probe_device() is buggy, it returns 0 on
error paths:

	num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
						     sizeof(phandle));
	if (num_iommus < 0)
		return 0;

This function needs to return an errno -ENODEV

Otherwise it causes a NULL dev->iommu->iommu_dev and dev_iommu_ops() will
crash.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
