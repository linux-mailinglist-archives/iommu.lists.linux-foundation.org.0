Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFE4F36F5
	for <lists.iommu@lfdr.de>; Tue,  5 Apr 2022 16:10:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E13D940A77;
	Tue,  5 Apr 2022 14:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmKhz3ZrEmgw; Tue,  5 Apr 2022 14:10:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE17B4017A;
	Tue,  5 Apr 2022 14:10:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1F2CC0012;
	Tue,  5 Apr 2022 14:10:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5870C0012
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A514060B14
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 668-deU6IhFL for <iommu@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 14:10:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AB2B60B96
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJrfD4JK0PeuU9ur1yTS4inhdPsDfDfF3ucg5FXyzUiSBPlXrjfvkvldq1ZsEkIAbOoHRdHZPgsWoOguYrM+WeTsxFc3Mc2WTLH9IUDMybGFAZ+kMBIUfdZ5yxReR6xW+TDlU0BM100+OWS5RK1Mh3l483bQjrNdXtRY+P3T701o+32gjCNeo4P8OXQ+Hv6+BTkjD6KcD0V6mZ8tCPhqALRVmUioHWbtKqA37YRMzr8BmqVYGb7VqP8Kr9abGU+ylvtn5Oh9W+yH0DXuReqPCeIVxETCFa+TzD3pFf9FpSote2N2HCvdRP6yVrEWHbkwwTC/ZTf2dreCfjNXhyCthA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMWhlF/7mXCqTPn/lkqFRJFttYuFEEFJjeNMrxCsqzM=;
 b=nrxpiREVgPULYXzlLP0Of0X/APvyvxnUFhP6KYehVH5iDbLagz1uxkURSNZ0AjL4E69N49Iba7mFbqOhhMfuKcQ0i3Wt1eujxO+lEGdk1YjNRIoe9v8GIgBdewDT1Lr6HjMp01+Zrk9Sc++Fo3bWS/dDTKg4FHnVs5Ic+sepnIx0QyHWEIJNFD9SelTvMtVKHWRnt7UsfE4aiqefY++M0EwoXQHL/5nIbOotXuf75v8ciJbRZg8iecwUsMAOkwXY13xD9NS0FjLaw0ZafSkJtYcUNJHVUDEkD4M9F/FCAHcFEoyJV5sYL++uImwsZFHVvmZiQTz09n1TrFKzCL8HFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMWhlF/7mXCqTPn/lkqFRJFttYuFEEFJjeNMrxCsqzM=;
 b=amjpA6eUNd3FAKJQKi85hPQeTfkAj+tbFAVaRxQvRCj112xic8pnvKAaUVC3nTY+8XS+9aZQjHrLAaUlka4uaFoggJSDy5hwWqtocIslLkZLguLSf3scTgu0VHyV4Tqfg0xF2/FCtjOpejBxxaiVjoqkEiySawMpcP/lKykUl3PCNcF41zWp8Lfvgfsy0hOPXCcqNm44c7ojhWHRQROEAsZtZM11tFFcEhnhFtXHbv+QJZ4lvLzEiUQQIezZYSjQFqwZ0pHuxymRlcuGpwXtl2W3L8JeqOQVOPHbh5PfOiwHqd2lLjh0jdarS7q3o8MVyb/a5xYpb+0kAxgSHx93jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 14:10:09 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 14:10:09 +0000
Date: Tue, 5 Apr 2022 11:10:08 -0300
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH RFC v2 02/11] iommu: Add iommu_group_singleton_lockdown()
Message-ID: <20220405141008.GS2120790@nvidia.com>
References: <20220329053800.3049561-1-baolu.lu@linux.intel.com>
 <20220329053800.3049561-3-baolu.lu@linux.intel.com>
 <BN9PR11MB52760F455B3319789BAB1E0E8C1E9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220329114259.GB1716663@nvidia.com>
 <BN9PR11MB5276239993592FF808726EF68C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220330115820.GE1716663@nvidia.com>
 <6ebd4f9b-5824-9489-43c3-7810963ec918@linux.intel.com>
 <20220404172403.GO2120790@nvidia.com>
 <5ca5d34a-2394-b8bd-837b-cd6bf3301989@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <5ca5d34a-2394-b8bd-837b-cd6bf3301989@linux.intel.com>
X-ClientProxiedBy: MN2PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:208:23d::13) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fff4a7f-f670-4734-6b4c-08da170dfe31
X-MS-TrafficTypeDiagnostic: MN0PR12MB5739:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5739F9F687219EEC38978C22C2E49@MN0PR12MB5739.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqMnz6lLmanwhvZ6smkR7zovZSzUPRrDiph+5rSEeu2da9Dfq7TnQn+JwbAQBbH6Vo02oBoPitg5OXJiWcW59J6FAG7bLwQn0L4jkYsGR74p0EbsOK4G6MQc1ziTQ5Y1e/w0Tt+gsgLHheP/0r2nNP0y2loBky20vth9UR+wr8uljjycAn/wRzCKz3ThQhHbP4HDYPUPmkdZQczmuCT4NQ5jRx7KU+RG5tZXAfjOcDOIqgA/aPgDUTmRnBj0MV/1PfmZ2bgoRvB4NVerBy9I8X6Nf3anGX+j5XeAPba7XwwGmHyTVT5lOkBJIyebKMek8HYa1aCFHEojH0ss8BDBr+BXhYT5TgAupxGPxg9Xs2FwmlWsN4NSZxBXwK1xzbsmTtPkW9gwNZgwuDhDs6h90WnOv8PtkQrx9ZakoqcOcbCl7ZxPluhLKngxgIvT7UM2rRVnWtQ+fL8ZhlUpLawsRBbOVQgtydVJ9eE3146jFhuBBBT8669NsdPoav3241ys1xoq0NMR2LILNCYgCV9NiNPw48GmMOEDsdxRSsSgGztjJYPSTApxTxA0D8wN2wS2kbD5fkbWV8ObaT87NkZUzOyJIHXJCP9gsCcYXeL+Cil3VHXYBirbjFUuYO1dTx7g2FXeFQpl2OwwQpVugvuLcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(53546011)(6506007)(508600001)(36756003)(8936002)(6486002)(86362001)(5660300002)(6512007)(38100700002)(66556008)(26005)(54906003)(6916009)(33656002)(316002)(186003)(2616005)(1076003)(66946007)(2906002)(66476007)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k0Y+SYDulErrcKJ6XD/wZN+Ex7rtAsk4XAd/XVxrbOu9WmN9rJ0WXqp0OBBT?=
 =?us-ascii?Q?jqRY1eI9poipzFXGxC4m/UYeHCHiWKkJR2ABepan8ertYgKWU8ITWtwQKBHh?=
 =?us-ascii?Q?QFfPyRigcH2DRogQG3bDML3fUHuGl0T16mUiV54/XbRyMP4J4l+XZAMzKy2I?=
 =?us-ascii?Q?zW8NI+sOOTems5EFOtaFh0QOPL8P7N7xh76MCN/XJ4rGZsB4XuQX8ccINaK1?=
 =?us-ascii?Q?J1yrFokTqDP+OZQV+isy3PxpQaKfgiIhckfwsxip+TjVY2Z3on2o5VJUbfWt?=
 =?us-ascii?Q?xmGe33GhAaTkZMMrnaxp0dX7kQ+fJhmSnq1BW4/AOFmiQJeB4LaL5J/wFYFu?=
 =?us-ascii?Q?AdgGisYJmpI90me9ed8wJxYe09y/v29hrdfAyr/rbskdey9CHls4MKSzRXhv?=
 =?us-ascii?Q?3Wmk2FTCUjJG3lxTBY+9rWUZliO1Vqc2AOL1YEKtesfd/pSnl+nYp77/As/Y?=
 =?us-ascii?Q?dsNd1y2cjXDUyM4pcGDnKq65yS6+GAbpdYShaqQiHLia0s9jgD7kWda5QBE6?=
 =?us-ascii?Q?cwf3oo2ix404u0tC9KWQShKMoObrvwR/B4ftSFQa9yuZWNtiby6lVxCuBz04?=
 =?us-ascii?Q?mW0JoaBndZ3wc4/vfbcH+kNE9mxlpn10qJuDplAZt89NwFIMJSxQAQ0S4bu3?=
 =?us-ascii?Q?U3uH9XKz3jGixG97g+e4yCtk6Qxur6AXZaXevLLZTCQJmiv/eH952gHcc012?=
 =?us-ascii?Q?55L67XECQP4J7HrOgYgIo/zFunkesk8tH5FHML6s2pF0v3XOt414VVxW+Aj1?=
 =?us-ascii?Q?ZukIFEMPGiKBqJbKNpkzEeGOJ3/7iUk169l0OiANRoi6JO93eWCJ6DDoh90r?=
 =?us-ascii?Q?/fV8M3Z67jQhYLwuyV2fUV7lwDka8BWtmOZN4A1fYgekCzHh6rO0jZrt2iVS?=
 =?us-ascii?Q?ZKDBTEyp7XXiqOMnTXEP/CI2QwOpvcAitP0TO0K6TlnIftxp+RatjyY7KvO8?=
 =?us-ascii?Q?BXhh1kQ/rkXxHXSxNlLYo1w/Im5eiZpl6vrg5jdSFHo5BTEOp6D15uo4E+Si?=
 =?us-ascii?Q?uRSRQWs1w42UJU8qMm9n5xzAbVYjyx41IVYXWpmMK0az1tKIMKILQ5B4D4D8?=
 =?us-ascii?Q?r1VyqG/e+DuUmu5LW1NISuhTmsIFOnHRNxG6iJ+t5l1yLFJXuIvIny+L9O7W?=
 =?us-ascii?Q?34UkQtydkPZXMdfFuF3gQ7DnFJxdSvZjsLLRvUUk41Tik1aeaeYszDL/cQhw?=
 =?us-ascii?Q?jeQLArqq57WYsf9TRNzxrs/2AxZcwh1jJrx8oD7u/1IszBIhmFt7S3wawd1w?=
 =?us-ascii?Q?GTM9MnPW9qQCoJbBsSdv4086PZh8YHCJnPFR7IFPVTrm+a7QG846rLLHKYV0?=
 =?us-ascii?Q?bQ32XsNI4wUQHTuep0xcXy6VkpN2uZ7Lb0xToVR5FEeN6A8rkdsVef5wa/lC?=
 =?us-ascii?Q?WWyJPYeq4MldCEo20M5XJxzxkEMk/I+JGiKrK56uC/TWIBuRJh3udap5kKmC?=
 =?us-ascii?Q?eIqJC/Cf3D02H1Thsdch8FH3xQD3gpNQFMJ6yqj/nQQM8Fo9vulbkYrjUAnQ?=
 =?us-ascii?Q?RrtD4n7jNBY4/4uB7Cy6lZR4kuJtn01oUDAy9eYen2MbcZjKQ8dkPVQgjRRG?=
 =?us-ascii?Q?bl1V9lq8TthZaXnKN6N7gpA4eXxoUcboK29oZSy7URp8hBMGHDR1dJNA9tUl?=
 =?us-ascii?Q?XGvYiJPV1KH2vt+TQZK+1eCPrTySMmTMvklGb/MPG346roITGO/0RC8+bTde?=
 =?us-ascii?Q?c8nG+wq9JQpPIHsIUQFV7+GiYhGZhU6Z+8VtZTpgFdNS6jGv6Yc/qF8q6zyd?=
 =?us-ascii?Q?U8AgCI+qNA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fff4a7f-f670-4734-6b4c-08da170dfe31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 14:10:09.4886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWbDVNe+HPiYjgXjUMGB/k7OZ81DEYQifv3D6dvrVvUfrEMewj0mS+gYRNjv4Fpw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Robin Murphy <robin.murphy@arm.com>
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

On Tue, Apr 05, 2022 at 02:12:42PM +0800, Lu Baolu wrote:
> On 2022/4/5 1:24, Jason Gunthorpe wrote:
> > On Mon, Apr 04, 2022 at 01:43:49PM +0800, Lu Baolu wrote:
> > > On 2022/3/30 19:58, Jason Gunthorpe wrote:
> > > > > > Testing the group size is inherently the wrong test to make.
> > > > > What is your suggestion then?
> > > > Add a flag to the group that positively indicates the group can never
> > > > have more than one member, even after hot plug. eg because it is
> > > > impossible due to ACS, or lack of bridges, and so on.
> > > 
> > > The check method seems to be bus specific. For platform devices, perhaps
> > > this kind of information should be retrieved from firmware interfaces
> > > like APCI or DT.
> > > 
> > >  From this point of view, would it be simpler and more reasonable for the
> > > device driver to do such check? After all, it is the device driver that
> > > decides whether to provide SVA services to the application via uacce.
> > 
> > The check has to do with the interconnect, not the device - I don't
> > see how a device driver would know any better.
> 
> I'm worried about how to support this group flag for devices that are
> not connected to the system through PCI buses. If IOMMU can support
> sva_bind() only when this flag is set, the SVA on many devices cannot
> be supported. Or this flag is always set for non PCI devices by
> default?

IHMO it is not so different from how we determine if ACS like
functionality is supported on non-PCI. It is really just a more narrow
application of the existing ACS idea.

For instance it may be that if the iommu_group came from DT we can
assume it is static and then singleton can know ACS is reliable.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
