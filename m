Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A884750A5D8
	for <lists.iommu@lfdr.de>; Thu, 21 Apr 2022 18:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AEFF819C8;
	Thu, 21 Apr 2022 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XLu51yA2lxe; Thu, 21 Apr 2022 16:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3290981A64;
	Thu, 21 Apr 2022 16:34:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04368C0085;
	Thu, 21 Apr 2022 16:34:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17A2BC002C
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5F56409D6
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-psxyd7KxKp for <iommu@lists.linux-foundation.org>;
 Thu, 21 Apr 2022 16:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0172E4015D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 16:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2mlKMCpav+3ML7AiWPfH0w6syeMp3Ee36YSgCIrky3pHVSsqkoB989IFqyVbuI25knLHa3Z5E4glI4oxNxAetcQxZfa5+pPt9LxG0h8p3EE2uNXBD1Bz5wO0dOORTyQDzhSYfoJXEnN0fw5kLZrzrXBE/21EVRpMA8A31yuMndJYs3WuHBiKxKs351psn7Lc+9BYz+NRcoiGPX8QNkTZLyLUuTaJsW+hYak6D5+w+sLRiEjbr3s89oyMI4NWiI9xCowiL4QeQRe8ma23cW85BgUBCPN+eaffXB4cKZrNykj9z2LvMOmDArX1IC5GSht05sPRxWR7wbcahS3NMTfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txa/wG9kATxloG0YdkFKCp/AlGoGeyM3qyDMV93C97Y=;
 b=GT2+4wNZ+/k/DRJwpCO9SgjNaK9g2cgiEgY1qutT8FJciSr3+MNQsDL6RhUSvWDIJZKVmQdQD/+RkBl/7OPkhwvALw13hpkM/UeoiGpSc6W4QHO6zm9uA4akAsxGeO0oEGxqFRK98LNte2oi5cx5FN1GJo1qsyKryrie7jJjB/a0YCND9U1eL0BRlFGBy2pFJJ+m1X5seJG4zpbvUJdybfSI80y40oOJ9nbZuxMt/VqJOgj6rbTZZWCvAASJyeGIsmFYIkKNwrgiKDciLUDnu5DjWwb4w3KfzS/YbOziPKxyGV5HyWcOB2P3PxyJ/UzwtGA3hEcfwVsAy97PLEZ0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txa/wG9kATxloG0YdkFKCp/AlGoGeyM3qyDMV93C97Y=;
 b=n2CKoFpB0Zdg0FVmShZgJKU/Izmvb1K+NgEC16UZen0UT3ED791UhlBlamMaYpmAhaB9hmHwBCGRwyJAN4FDgiG+9HsouJVg5jg7IATCO5J6Pi6wwrEHxVsUjlPFR6wg3/EQmMANRXGsY3GSQ9b82JCed/SGH/mQblHQRKmEyH1mqe7pp4yvA2EP9K4NvOCLXEIhRUvBGHLdCa+0orXiOansDRHxD+/tu6vtTmv/wvWP+Q55ppVGonB1YPG8SrpiBsFf2icwUVPiUdMaA+eB3Aer3ggTQfjevuuxV1afcDplE0KhP7y+SE3xQWNQjGjLV4qr2rg5e5LgnLRI2uy44w==
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 16:34:30 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc17:db88:666:ba70]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc17:db88:666:ba70%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 16:34:29 +0000
To: Ashish Mhetre <amhetre@nvidia.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
 <joro@8bytes.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [Patch v2] iommu: arm-smmu: disable large page mappings for
 Nvidia arm-smmu
Thread-Topic: [Patch v2] iommu: arm-smmu: disable large page mappings for
 Nvidia arm-smmu
Thread-Index: AQHYVVf8weZxvKTC30eHfb8NPTIKIKz6j93Q
Date: Thu, 21 Apr 2022 16:34:29 +0000
Message-ID: <BY5PR12MB3764F88D41104D35BB11FDEBB3F49@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20220421081504.24678-1-amhetre@nvidia.com>
In-Reply-To: <20220421081504.24678-1-amhetre@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a5ef91-ed21-4c42-1a55-08da23b4cede
x-ms-traffictypediagnostic: BL1PR12MB5048:EE_
x-microsoft-antispam-prvs: <BL1PR12MB5048C7365190657EDFAE4F00B3F49@BL1PR12MB5048.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4oajlNJr7omGqS+nEyujdf+apxmJIHvhBsHcxqTq4fU8fMs/oxp1QWsHrzq07tQaahOA85SA4psAp5HzAiZ609Nc2zNtegSxRfiA6fVhNuon+7J1ARTYG2knhXs40mz0Gx2dLiw/ulVJ6nIKSBVRfGP7h7swEFL+r3MdjZaDksVzUSlH+TWp/H/trbhLhnPUS9PL5jU876f2YM8q0N6umGIdzwf6Cg/ATvkrJb7uDFOdvrp+J5P+koqeq6pcBGrbjBJJM4opHvPWzgTv1XIl/3zPnvI2KtX9pcyYboD1UXjdjj7z/4RbcnaEtsY4SWtRtuhl3IM5SUM+iHeAicgHM/7j0hTtgvSmYbjuKWg4vE7s+dnhqj5/NID017fS35v+33+L0uYaDxIDLN54RYkwnBTe04qpjmCP3QQ2g8HFwwtHXclZt5SGgdvmun9HMGu89cjkjSr0jFFm0kXEeKf4a+6ffQoTkpcgT2S2zwfYseAc37EZxDBBQkshVrX2qDt+D+h40kOsw8NmHObAFWH3RClDDeSfPIO47+yk7ufkcnjUTKFc/DT8YnIZoA9ApsSFg2thlOkXFPppPrpHco153ljz59wAjd5ynA4Uin7crkiOFMDCqQ/H6S3mjrDvII6yWJsAi76JqA97gjWBt8YtTXaV777Czxk5Riqv1PoHqb7diMbr6ImB+v9b//ouuL7PbN+z1G5V59YQWQDAtwcXRXGq1+BlEiZDF/SBYumT7Bo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(186003)(83380400001)(38070700005)(66446008)(9686003)(26005)(921005)(38100700002)(122000001)(5660300002)(8936002)(52536014)(55016003)(2906002)(66556008)(64756008)(66476007)(508600001)(7696005)(6506007)(66946007)(316002)(8676002)(76116006)(4326008)(71200400001)(54906003)(33656002)(110136005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D/mpevgwAfsxffNQzxqNZyHhILQIh104A2vF5QNL0Us3t/niNzf0jCBNA9Vl?=
 =?us-ascii?Q?TNsgnxR5l4TiD2fYqpeDQ8wMjwa9iBwfLZyaIEDjAQgYGFlzgm9KQdieoM4h?=
 =?us-ascii?Q?1p3MCHjB0E3vv1wWe2U5r8E3O1q3rwAO83/AO1lFxAf+Xo712ETXgpmvfQJK?=
 =?us-ascii?Q?Aj3kztlD7So9VfRNR5iFnL1ghNQg6sldny80HNfrCuB/qOygDBnucJEW2yLo?=
 =?us-ascii?Q?zdNyOCluRfR7y6aZyFIK9P/H1k/a1asbztJPJr31i3riVsjmP+4o957Vkchq?=
 =?us-ascii?Q?B2ZAi+rvG974duGz/U1Mjn/Rv/H+QeCjcdRq+Kjee2X/ddISBcuU3P9KiW60?=
 =?us-ascii?Q?LdzaRj03GU9JF9D9VZ89zNCg9hEcMlgSsaA9goBwzwr5JFfJePwiKy+or5KV?=
 =?us-ascii?Q?71hLliPi2zUfUJPr3wzbg0OvEdNIJs/qkzJbcMtBhMn8ravC4muBY/08OcB8?=
 =?us-ascii?Q?fy1B4UGJW6nb9c9U8PLY7JFcLSb5IxFlZIQkq2lPdXgshiddkqMAStUV24OI?=
 =?us-ascii?Q?coJfIgNiEQWvwQwBRrBwPgcm0YK3mAHnHKB/ZOA7ckeKNdea73ZC8OfXza9K?=
 =?us-ascii?Q?p32zpma0LcrqrIVgZzO2hswrI5j0ZzzCNoSRZsRdt06tgXk1Iavx+NFotSND?=
 =?us-ascii?Q?gfR0nFmqWJckOxc0fqBFVquibSsPUv8Fp/cZAmvfALqz9C0IAK61N7P1QOvq?=
 =?us-ascii?Q?RmfgNBz+wNJr5sc6LJWHVAdGzkhvgl2PYkIH5hPhHExJA/2frJmyML3CrfPI?=
 =?us-ascii?Q?XG9BKz1KSXPa54wZpwFCxFm8Gk4m2AsMIbZR6Ux05gk6CGAf31+Of4SrGpF7?=
 =?us-ascii?Q?I/125ZWLg4kn4UQwU9I5ZQ34XFWDqXylhyIBhEIW0grNDz07g5kD6fItKEVD?=
 =?us-ascii?Q?aHLx4LEu9SlNp2HGtp63Vlwl/L16FE76hXhPZysbXVxpLr43sEIhLIJgnSEA?=
 =?us-ascii?Q?Xb5oI1+hNDHMuOwdyzjbz5OReXgFLMpusffD1lN+yTYXPF7jXVqAWkHX4uE5?=
 =?us-ascii?Q?nVRnGqnFcXJqzHPYNkbdID1sdXJRoRAJ+Oy3Y5r5NsrhhXeKj0YVax6nYLvp?=
 =?us-ascii?Q?fdea/OiBS/Rx+7zz4QkVuPCJn5Q2JzMdSeNNMavuUV8aeR6+2RfEhas3vvDo?=
 =?us-ascii?Q?PWk5ytKywlC/kkeZ7N1uHMvBFDgY2ldBl2rNdVzbr2Ju91y8QvzVyzTyatwW?=
 =?us-ascii?Q?OsrteNBJocdGGqs95JmpThjrp1PSan2RwBShQ4spl51MJydhPhc2T8uImZjk?=
 =?us-ascii?Q?FSro6QkmuXF1UFIeLC89Hj1ITTl+PMyCnSXMCYMXmMKgDLs1F7hH+icFjuuJ?=
 =?us-ascii?Q?w52YL5DKlcNwj/VyBgSYq9ljqNk0hI5/nMXidLvovx5j9X5xKZq5mooNkwTG?=
 =?us-ascii?Q?mdIm5hl/xMKy5/ZhAQSZkfpgpa+z29ZY3LZra46zG6yUn2opgapkCCkX98u/?=
 =?us-ascii?Q?PyOqG+F7PMk+KZ2c3pi8+yeTYoTyIwhJx1bDSIUMVA0GrPFbHXCmlO8u5Umr?=
 =?us-ascii?Q?Byo/DL9Sjj0b/ZH3EN1wvVNKG/qGO79a7yXqgtANjBRhPUEWi0I5t9z7YFYR?=
 =?us-ascii?Q?dGv5Kg9BhyCmusKRxE5ktLm6vMzmWaBmm7lYgPWRZqx+m4S6s5nb0IGoNo2w?=
 =?us-ascii?Q?l8sDhBaDdtrXF36Ilt4goRBP37+RU/eImigULDTXooo9vEJB7WFE3Qk18YRY?=
 =?us-ascii?Q?GW2jn9xIuu+Fsha00nA7NoqvDzCWrROYMqhf8ranKJMHW9yiYxegs1N3eOdR?=
 =?us-ascii?Q?0IoAa+Ullg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a5ef91-ed21-4c42-1a55-08da23b4cede
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 16:34:29.7469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9vpHHw1dgFSTkrM4ui2KxdqGfwY7YeZO1gSist9jEI/9TyXjYGy8IWyNQz3XF4C0xznD+f99sFSuKlITsSd6nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048
Cc: Sachin Nikam <Snikam@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>
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
From: Krishna Reddy via iommu <iommu@lists.linux-foundation.org>
Reply-To: Krishna Reddy <vdumpa@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> Tegra194 and Tegra234 SoCs have the erratum that causes walk cache entries to
> not be invalidated correctly. The problem is that the walk cache index generated
> for IOVA is not same across translation and invalidation requests. This is leading
> to page faults when PMD entry is released during unmap and populated with
> new PTE table during subsequent map request. Disabling large page mappings
> avoids the release of PMD entry and avoid translations seeing stale PMD entry in
> walk cache.
> Fix this by limiting the page mappings to PAGE_SIZE for Tegra194 and
> Tegra234 devices. This is recommended fix from Tegra hardware design team.
> 
> Co-developed-by: Pritesh Raithatha <praithatha@nvidia.com>
> Signed-off-by: Pritesh Raithatha <praithatha@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
> Changes in v2:
> - Using init_context() to override pgsize_bitmap instead of new function
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 30
> ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> index 01e9b50b10a1..87bf522b9d2e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> @@ -258,6 +258,34 @@ static void nvidia_smmu_probe_finalize(struct
> arm_smmu_device *smmu, struct devi
>  			dev_name(dev), err);
>  }
> 
> +static int nvidia_smmu_init_context(struct arm_smmu_domain
> *smmu_domain,
> +				    struct io_pgtable_cfg *pgtbl_cfg,
> +				    struct device *dev)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	const struct device_node *np = smmu->dev->of_node;
> +
> +	/*
> +	 * Tegra194 and Tegra234 SoCs have the erratum that causes walk
> cache
> +	 * entries to not be invalidated correctly. The problem is that the walk
> +	 * cache index generated for IOVA is not same across translation and
> +	 * invalidation requests. This is leading to page faults when PMD entry
> +	 * is released during unmap and populated with new PTE table during
> +	 * subsequent map request. Disabling large page mappings avoids the
> +	 * release of PMD entry and avoid translations seeing stale PMD entry in
> +	 * walk cache.
> +	 * Fix this by limiting the page mappings to PAGE_SIZE on Tegra194 and
> +	 * Tegra234.
> +	 */
> +	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
> +	    of_device_is_compatible(np, "nvidia,tegra194-smmu")) {
> +		smmu->pgsize_bitmap = PAGE_SIZE;
> +		pgtbl_cfg->pgsize_bitmap = smmu->pgsize_bitmap;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct arm_smmu_impl nvidia_smmu_impl = {
>  	.read_reg = nvidia_smmu_read_reg,
>  	.write_reg = nvidia_smmu_write_reg,
> @@ -268,10 +296,12 @@ static const struct arm_smmu_impl
> nvidia_smmu_impl = {
>  	.global_fault = nvidia_smmu_global_fault,
>  	.context_fault = nvidia_smmu_context_fault,
>  	.probe_finalize = nvidia_smmu_probe_finalize,
> +	.init_context = nvidia_smmu_init_context,
>  };
> 
>  static const struct arm_smmu_impl nvidia_smmu_single_impl = {
>  	.probe_finalize = nvidia_smmu_probe_finalize,
> +	.init_context = nvidia_smmu_init_context,
>  };
> 

Reviewed-by: Krishna Reddy <vdumpa@nvidia.com>

-KR
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
