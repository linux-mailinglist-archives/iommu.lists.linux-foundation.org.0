Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF614F668C
	for <lists.iommu@lfdr.de>; Wed,  6 Apr 2022 19:17:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3524160ECD;
	Wed,  6 Apr 2022 17:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWqP74mNGOGW; Wed,  6 Apr 2022 17:17:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2B7A060EA7;
	Wed,  6 Apr 2022 17:17:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE49C0082;
	Wed,  6 Apr 2022 17:17:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4453C0012;
 Wed,  6 Apr 2022 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0E0F60ECB;
 Wed,  6 Apr 2022 17:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlSgKNFiD2Ur; Wed,  6 Apr 2022 17:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B22D460EA7;
 Wed,  6 Apr 2022 17:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuYZT6B696M50d1HOQ77Hv9Klmy4tlFKTgfO9M8rhE87nx06cSEm79L+wuDjIfs7BehBGIEg6MykLISQVWkXVak/qYz1sJ6KsZhmPiqErluDmMwgA4FAvlqG16GD4f6a36qV/yV24st2T3FV2jGsvt+77uDGwVZslPp7rQZtcDRrnzpjvKF1ceMbdawpvYZcu0bmeYbfE5XanY3aHyCiOc8QhGw8Bq6JMbUW5Xr4VdXi1Qow8w9Z3HOJpwSbSysWF2yUTy5OOxZGebn+ND/EAyGHhcUztVrxNI0/flUoLU9UOKAwq6aNpQzpWrQODjhus7spfOqWoyzuqQ5g0lXAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeLl9tvWkv1qk9DIx32ykxtv58qBigg9/OSGVp/1wac=;
 b=aH9monxweDt7w6bJyP/K9wbh747KVKBxO9F1QxYr14wvEhxjoSwnnEGiz+6OK0FRr095sfQWLW5FKo0P/8J0LsqeYv4XCW7lvQEpnwOoLV6KyFAo/G+M767okd1xR7U97V8oZ9ipTmsu9vxh6Mx8exjy2pfE9IGfTSqAsefeFS4IcndahGloelzBinEo3SYHVgyuC7horTlslLTm8MS3+faOn7iFJ8XvB1HPLUc4EqHrXDQxfgAMkZYCEM6vKRPgERtN45+WuUpD/ZWvH99Q9sqW9mRq0X29s7iLiWxGtMvRkdc0WOt1tzjd0IOTTsct8jS3ZEMhtVDudujzL1Cw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeLl9tvWkv1qk9DIx32ykxtv58qBigg9/OSGVp/1wac=;
 b=UfKHKxG1d8xArB5IfCMwFeSVkWHNvN6ZoDXInLY+1mL/flaZFAA2V/DJ7oSstsa3nvOX6nTH+Z6OQyjin0IoT0IL+0NhIToPueQ92BUSn1g51MlPj5vVDyEkg/NNPWnmY4JNWl6EGemzkCOE1mVpf9ip/xpfjX6FMcvQPVr/Gx/VP+si10wA8x8nzQFRNx9n1WglSbxFQ5YopkpgVDiL1jPNCtSYNaAykgu0V1CbZg9nfZkyoCPhtu5wgBa9T0DoTfvPG8cwGtV/l8JprRWWX+L2D1dc5zyYhqVyRrHSNpFitwsbTD0Ov+jB/nT/powQnilAUCGcT3XgQehna2CfDQ==
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:17:33 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:17:32 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 17:17:32 +0000
Date: Wed, 6 Apr 2022 14:17:29 -0300
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] iommu: Replace uses of IOMMU_CAP_CACHE_COHERENCY
 with dev_is_dma_coherent()
Message-ID: <20220406171729.GJ2120790@nvidia.com>
References: <1-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
 <db5a6daa-bfe9-744f-7fc5-d5167858bc3e@arm.com>
 <20220406142432.GF2120790@nvidia.com>
 <20220406151823.GG2120790@nvidia.com>
 <20220406155056.GA30433@lst.de>
 <20220406160623.GI2120790@nvidia.com>
 <20220406161031.GA31790@lst.de>
Content-Disposition: inline
In-Reply-To: <20220406161031.GA31790@lst.de>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f1ac694-fac8-438b-cc54-08da17f155e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|BN9PR12MB5210:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2941B021E620A7C040D8451BC2E79@MN2PR12MB2941.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbKkRM6k6BKdjHJ5SUFjR0yzAa0me7MANlDXy+wbfPzWoTpAJoqa+tfirTv5Uc/BNuWy/CvZphmSesHz46oBffVU00uK9J6oajch6vh3iACC9RHNf20wU6iK9w1zHyfNKq3b62yDUEAwJrb78ddCYJj9gnvmnUnpKBRPl/yYdtxqUeFwkAyhu9L3boUU6wpg0Y1Br7xXdcK9bsy/hTrC2TzFzjh3tuV0O/qrWtXLJIOf0dQLSdcyYB8ufMBcMn8p+FcYiKJASFjcBiSh7j3b0Bka1ALOL/j9BGSg2fXnOHqoodzlmI7PCxvYoMs04qNXtjlkq+Hf65jovEUz/CIooOhzVwSGZN1g6KqF3AICeZNROTKURa1s57EygrIuDJKNb8MmEUsGZsRMkikvffJaEFgmQUfvgEXyWaEFiznXMBtulWFXTUOaB4U97XYs5aHclyv3LGTUvDE0kiwEKdaAIfk8hoRKp8fiUTDBI2/4DDeoVbe/RC2g4i/gBWDr7KpDLYoiyh+xdzgD3gXs1LxLCMTRaVTGM5yNFBeh7wFVYPf9bNxV52k8CwTpgV9Be/FpyeSdWhIhVyIo3B6ujbJIDNW1IWlQMq87fKYh2sCBf+oAkAlVW+JETWaZZt7Eb2F3oMC0oEpn7LImNJvM3SlvSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(54906003)(6486002)(508600001)(6512007)(6916009)(6506007)(7416002)(5660300002)(6666004)(2906002)(316002)(33656002)(2616005)(8936002)(186003)(26005)(66556008)(38100700002)(66476007)(1076003)(4326008)(8676002)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CruKPwALXC+pMgw47IfKLFNSsNg8c5oOxaEX9A3fjWAtxB4N5jnrhMp5p3SY?=
 =?us-ascii?Q?xU1diFLhvKejWsS5JWqE2z+bU/icnaIiM7OA0Qw+rJHSUaMMZmVrwVWFezhr?=
 =?us-ascii?Q?9FmW4jBbCRLC8wUTsjjL5fBD+XCF48Ry9K5r5jF9YyLNCHd6Trx8+wN2C9RF?=
 =?us-ascii?Q?NdXjNUt9y4oRZzIhjKX7zrxvzwQi4fWkqXFY5MqQkrNNpH8Yvq988tNq2s27?=
 =?us-ascii?Q?GHR3comhc9UqabyJ1+BPRmyLT7GBksOQLKaXn71j6L+12vgG1AmfeuLWod8P?=
 =?us-ascii?Q?S5FRiR+GJNus/Ox+4By7NsV1UCOBBjdmoVsrdoK/MQU/l/G40Zn9vVXJT6XK?=
 =?us-ascii?Q?F9WVvECoIfk4w4vvy5RSRki9xWNXVfu4HsDKuYNSabiK+b+bMn0UhXuIPuhs?=
 =?us-ascii?Q?U5jZa+L2bb2WqoMS8xOhIqW7AmULduuT0C/Nt4DrIXDtarHLikmzGPWEg4m0?=
 =?us-ascii?Q?J8+PikVKQWVRll7peckSDIhFyujakq3aEIcss6bKK8z/AcHp1m7XJ4sfKAO0?=
 =?us-ascii?Q?iZ53P64Wkx75BICsZZFX/WGIEOqTgxpmKoBXelA2k0VhudhuCp7chLwpPsXM?=
 =?us-ascii?Q?3a0z2VGqM5FHo8wT76ECUAoV4bOPScR6jUqgTIQoRKCC+OSzA+WyimudRDMV?=
 =?us-ascii?Q?+YMbi6T3bxTN4uPUcmlK5Mp0yt4CJXjxJ9VjZFiGEozHKDYeptijgdyibxZV?=
 =?us-ascii?Q?4pF8J3N3/wj4hwGG0nmrLQgO6hjPebS9niV0mugvl4aprFlUtS50YbIynWVT?=
 =?us-ascii?Q?O8AnqsASfIbP3fGka3yghQmc1nPFmTE/nkCk3+HwrTggjcG3u2D/pgJSVr53?=
 =?us-ascii?Q?QQSkx0mJ7phFYFNdeZ/l7CshfytuYxo2A9xMh3W27/OgiIVWxBgysaY8zviY?=
 =?us-ascii?Q?AVRXwA7Pr/6h/pIEpy9lviS0yZmPvIvNxCREyktFC25Y/uSj+Q7Ki9X5eONS?=
 =?us-ascii?Q?zHc3CwXDvUEgVu56B0ixj7yn7zYDYaooufNoid5gu7lQQIM3uh7JxCt0DZ8G?=
 =?us-ascii?Q?ls6/hhtIcCpL/dFiYvX0SQy4J/cUylh493OSLGVFbgUe7U4XYFmRt12QBt2/?=
 =?us-ascii?Q?pNrQFZASS4X0CEtW8RN07YFoLRgnvAbnfiSKyF/8GZG3LKSIdBachYOP5vSa?=
 =?us-ascii?Q?VVkKOkjuGu41IifiLGJ30yBPGYxssfofd3DK9f0sjtDKZp1nP6ZsAUt8rk9L?=
 =?us-ascii?Q?gPGL3GqcAN17M/rA7ZCbfF8R6okSeWW9l4cBRNTFOWbmyHA+vDxe5u2Cdxc0?=
 =?us-ascii?Q?EjCLxcyFlt/Cs8AI1X2KbUQpn8jLiqUNwaGVvHkTurAX08X10QU+iWuzdzoc?=
 =?us-ascii?Q?+Jk1mPH2XXaVcp8wlt+hr7OfSM5h4o9ae3C+qDmQFkWY0g/Xp8YAia16kNev?=
 =?us-ascii?Q?1poKA8xgSfowSvFdwhesszvLoYAReYBllLHiauzGdhTc7hOMAHB9zWv5IvcV?=
 =?us-ascii?Q?J5V2C8rz3zurv2odKeNoFG+9ElJwhQYfDFZAyuN5MC4mBsuGb+bKJlqrkEAU?=
 =?us-ascii?Q?7NbA1gqEQEcSBnkaJjamUtl4NjiWuRb73pNkbrkxESfXdRYgJglmpIkupAIs?=
 =?us-ascii?Q?fPZxkx0DiKUQgQ1AKcvOXKhZjdas7SJDJ5zbLGhdVHZtneC+z9mNPVmoJNfA?=
 =?us-ascii?Q?9GGWdoqtN8NWtkHbwoSqd/R5FZxngYf3/5iIfeZ6N+rywdxJ6o/QpcQtJqUl?=
 =?us-ascii?Q?irDRx8g84mBzjhDKRfCf2ioE7xqzR+8Hs2srmU7+iV/lkYHM9B4/dr/v8Y/Q?=
 =?us-ascii?Q?01hXCVKe4A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1ac694-fac8-438b-cc54-08da17f155e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:17:32.4584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vg5+MnYZRge10j7/r9zB02aLHjHFyRMV+J4DyfviJyzq1iOkDN17GKT6QmrqlYJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
Cc: Nelson Escobar <neescoba@cisco.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 linux-arm-msm@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, iommu@lists.linux-foundation.org,
 Christian Benvenuti <benve@cisco.com>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Apr 06, 2022 at 06:10:31PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 06, 2022 at 01:06:23PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 06, 2022 at 05:50:56PM +0200, Christoph Hellwig wrote:
> > > On Wed, Apr 06, 2022 at 12:18:23PM -0300, Jason Gunthorpe wrote:
> > > > > Oh, I didn't know about device_get_dma_attr()..
> > > 
> > > Which is completely broken for any non-OF, non-ACPI plaform.
> > 
> > I saw that, but I spent some time searching and could not find an
> > iommu driver that would load independently of OF or ACPI. ie no IOMMU
> > platform drivers are created by board files. Things like Intel/AMD
> > discover only from ACPI, etc.
> 
> s390?

Ah, I missed looking in s390, hyperv and virtio.. 

hyperv is not creating iommu_domains, just IRQ remapping

virtio is using OF

And s390 indeed doesn't obviously have OF or ACPI parts..

This seems like it would be consistent with other things:

enum dev_dma_attr device_get_dma_attr(struct device *dev)
{
	const struct fwnode_handle *fwnode = dev_fwnode(dev);
	struct acpi_device *adev = to_acpi_device_node(fwnode);

	if (is_of_node(fwnode)) {
		if (of_dma_is_coherent(to_of_node(fwnode)))
			return DEV_DMA_COHERENT;
		return DEV_DMA_NON_COHERENT;
	} else if (adev) {
		return acpi_get_dma_attr(adev);
	}

	/* Platform is always DMA coherent */
	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) &&
	    !IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
	    !IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) &&
	    device_iommu_mapped(dev))
		return DEV_DMA_COHERENT;
	return DEV_DMA_NOT_SUPPORTED;
}
EXPORT_SYMBOL_GPL(device_get_dma_attr);

ie s390 has no of or acpi but the entire platform is known DMA
coherent at config time so allow it. Not sure we need the
device_iommu_mapped() or not.

We could alternatively use existing device_get_dma_attr() as a default
with an iommu wrapper and push the exception down through the iommu
driver and s390 can override it.

Thanks,
Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
