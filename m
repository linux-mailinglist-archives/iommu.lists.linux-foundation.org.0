Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A829B51498F
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 14:38:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538898403D;
	Fri, 29 Apr 2022 12:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKDql5KIjk53; Fri, 29 Apr 2022 12:38:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2F8F884039;
	Fri, 29 Apr 2022 12:38:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEC9EC007C;
	Fri, 29 Apr 2022 12:38:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D023DC002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 12:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC5FD416D7
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 12:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLSIedGXTNsk for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 12:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67B73416C9
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 12:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOzGVtSghkXFtKzuqHIIwda73kHNaUHDz/m/x1InhXL6fozfBBGN97XNpTIgXg2EREJgVCH8BFE1FSNE5xhlF7Y2hf3+H9vAvUXHcwEYr79EspPMkV9qN8+M9EyHcj8AoLyk+Bwz2XkRehoAMNr2u26P89yp17D1wEFJFYp6W3WrFLAzsIbsQm1ROtgLlNEMKYougd2pV4TiQ6SXbbIoGoI7ET13I4egMg2ay4Rh5NguI0EcEqOTBk28W8e/LwZlxOpn2Vc497rdMW0hZwOkKr3YHn+9mIkwYNWIyWLM91s4RTLIrPlqJOBuOQN7Iy7AcRcOaM4nW9oETwmpGLVtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRdyizI/jhSyo1m6tKDWIcuRiW78U86FyXUS9FHz1tU=;
 b=EVhvmQVFe0orSSRmwqXaHwZlmK8drQjliNcEWFVYIBwANYphwdm1MMNZmHnS2vMVce8fGcp9DAP//ZpwHcVBRzch5scV+BasiR/580SNKibozgcDnkOmqykmSMt2XyGCpIiBMQRMiQ3TLlaKZhnk1Fi7ydTnacNqb5Gss9T+/DKl+FjzxFbPkJ+ZQtI7q3Iyj2T7VMuxa9YtuCYXckE3qIHpoVMh6/v58ggzIHvt5xysQ8wz04unq6LAu+awEXfqIILAwUf2hGImhrz6SlUZD2Sq7QfOKF46vwrgVMMj/YduzNN10qjbvbwQCQG/4gbeOjiyYnJOP5dwa6oYMsinlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRdyizI/jhSyo1m6tKDWIcuRiW78U86FyXUS9FHz1tU=;
 b=DWtD3RzU7OmTE8JDfJ3ULIL4C44f0xpX680jhTe1zSmKzzNWvQMMswWkKIA30VEukj1Vj5NUxBomCz7nkwchBPMzVfx6rYfNfcHShnAs5zGi0tDGn7ymLbMnDHziUNOz1ILfeMGbCgmM3LAPD6gWE8odWJy8UWtuc1ZXnUhFbWM7vdHUiKybwX/ybliWRgGUEXCKuoM3B5RUgChJLx4h/+6DBlPlp2wfLSCskcwrAz8TrSfmz0pxIjb7J380l9i33LJx3vGvC0wh8G/5r761fbmiqzoeaKtooS60zxkBakkpv6thu9aY9NhZz3T5UGTHUQRwjzsB5tzb5CTzXR1N/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB5325.namprd12.prod.outlook.com (2603:10b6:5:390::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 12:38:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 12:38:42 +0000
Date: Fri, 29 Apr 2022 09:38:41 -0300
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 00/19] IOMMUFD Dirty Tracking
Message-ID: <20220429123841.GV8364@nvidia.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <BN9PR11MB5276F104A27ACD5F20BABC7F8CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <f5d1a20c-df6e-36b9-c336-dc0d06af67f3@oracle.com>
Content-Disposition: inline
In-Reply-To: <f5d1a20c-df6e-36b9-c336-dc0d06af67f3@oracle.com>
X-ClientProxiedBy: MN2PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:c0::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e4f48f-b68b-45f7-943a-08da29dd31be
X-MS-TrafficTypeDiagnostic: DM4PR12MB5325:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53253D157D3168AD75A60B07C2FC9@DM4PR12MB5325.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovFOZvAE10yQhd96yIuazjwRRn0DacfkY14dHp1KHZFed7XLEijWhXLQTTlfnFI2d1t2xI4vaKRn+n7FcilxexGPAsVkGa0qYuUaFL+bHheZRdjoeRSWFC5s8ZCUbHbaYxzzM88kC3QwUqVAvY7FiLsf3THO+maKsAqV6JbHcIRj7mVIkwNv5+5d6vHr+1RyM0SIpBfwsgnx/2AFvFHTglfxzWbRPOG41neHJPZFJo0y4cB37fod2zn2/1tT0NAXpjfVPw4EmjDCHawVUyhS4c+UuiiYFjjH5Id+I9oRg1un8q/qhbj9zIy0MUnuXfyS8NoNa3npeiUvMCZAH021Qid2CrV+veZCNE12Fmzn3ZLzuKFlkD8py87CNxmXNzlriJPEoGS2ubC1DE1x7R4Soz2wbAY0Gi8MdkiY4u+vqHY6XHiXpP3PjgHxYsalWJi5ycjZdhjdntf/TTeTyxgD03AHZZtdsPZiENe9WWbE9bBI6NFg7f9F/pN4hi+sdIqbzOld7YvOObmDYBLVBlgbsjDEwlZXwjVgOa6PitmPOQN5BfyU+DbL3AnW6fkf4LSFpYvck1OLnLoSxgc1rVwKD5VMnCrHLJxAIKEW5BCW3u9dTyrSPeaKpN7UI0bF8R0a6EkcZertgcxfLeXYHUprBl3nMQHbOt0wT2hu1r8Nl38MdFOBrAJ4y0xrNABy/+4I/e0l/OEfNsETUsaka4/JlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(83380400001)(38100700002)(316002)(6916009)(33656002)(66946007)(8676002)(66476007)(66556008)(4326008)(6506007)(6512007)(26005)(2906002)(5660300002)(508600001)(6486002)(186003)(86362001)(8936002)(7416002)(36756003)(1076003)(2616005)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqP4KOd98tAr6RrBMQs15r2hRpgP0auo4y8WzWHbpRnt9neo8ZfRs5BUexJH?=
 =?us-ascii?Q?SgalMOVqmXp+07VnPBEEyQDXweL4BNveWmckQJdgBs6hDBBQtKjJAawgZt+v?=
 =?us-ascii?Q?263YPoUkk7VDn8igyWRHZaJhm6AKU1nygF7VqgB7T6ORbUxQdE3joJ1TvC5q?=
 =?us-ascii?Q?mwFXjBat+xhnVKsyWugyf1JGYivi5rFzfwTLG+/kj90sYc+XPiyNavFDk39V?=
 =?us-ascii?Q?6uu9Dmw99nYYgo8c3ditf4nznvTD79wopUaD05Ro+3qDu6fgTldr7SscyWpS?=
 =?us-ascii?Q?/KQ+ehYzq2WuzCgv3qKJSScmyTi/fgoEduwJThX6FbLemRWqjWi2sIwNfIiA?=
 =?us-ascii?Q?863FU+pDzN86QeKOJGs3yPOjsRepnJCSfmXo9v70AsX4MOb4ShQqylo6V68T?=
 =?us-ascii?Q?JDxHNuBdoBKZy6QBAJYmvmZUcZEQM484+LLnbB6/PT5bCaJP+UgNTIiOjDrk?=
 =?us-ascii?Q?PpPdn7nUzEkEi9/Dro2WM31S96m0wMrz3NC5LAToL5FmAS1shijmIuN9i5C2?=
 =?us-ascii?Q?1I+STQOmCPu/h9Bx7+DUFBzN3izL7T6y3KLlZ+KAWnBrySE99aIoxtk82Jrw?=
 =?us-ascii?Q?5X3jcDtEvYk1pUFTT+7O/2oxcdQe4KNBm8JhfsD0EYp+us+EuMQbVMjYk2EJ?=
 =?us-ascii?Q?Dkn1UpmNMv5zL7in5rpg0kqGjXlyTmOlrvLUX5N/UYvF0wP0p71wKZ8u7c4z?=
 =?us-ascii?Q?jthoMNzCi+4mnIyWO86psjeTFfQvYNqgGf2hW175opkbzDGxo87DSj+sSmeM?=
 =?us-ascii?Q?/NnAU43zTLDCPIBk/rRDhUX8Gg1gm+RhXdAfidEJKuoUUpE4f0CWaSR7d4j8?=
 =?us-ascii?Q?4BnyzPwzNMyyofOFqR88a5nM3F3wAeBBSzd8iCaD8XdwPfFvv1/f0ySZHm/V?=
 =?us-ascii?Q?EDGNZckCIU9dMcSDgh2G8S790mtrmk9B81EK9EgaAkkfeVdXHBhoVvkFpwkE?=
 =?us-ascii?Q?pfP7Q6k5NBK17wJn9GhfCc4JZ2x1G+1d3YBCcqcFxea5k/mEPHsJIVxGpKhN?=
 =?us-ascii?Q?Txc04fqQd3vEXOR3dl46uzb1PtZKlLdnBfuXOBuFMNGs4VLe1xBtPMzeLcv3?=
 =?us-ascii?Q?yqg3Gk3y2v5p2ZBwH9vMR/0TIP8bbK2z+pFf93OsasGlnuBkuA74342pjacD?=
 =?us-ascii?Q?JfNYwQjkLfEEeUGfaw67l8MaEStIvkUPX8ze/ysYGhxxH5RFx6nlKz54alNP?=
 =?us-ascii?Q?mGE+30/Iuuz6pbuGx2vRmeelZU/OPyOEtPb4Jy4OSY7dyLmR5iRq+/8x1a8X?=
 =?us-ascii?Q?EjIW0oQ9zJq6o1HhsmKMURlrIO5rLEXosMk5KkKiermrr6VyhtEbDPRZw4ni?=
 =?us-ascii?Q?BxLUrNvu9+qV8JP2UO8xWHmz2IWdVqp9vA8pHyXjzk6X7DSTOL3a5IPpS3IL?=
 =?us-ascii?Q?VmHJdPNCX/pMXBfOVdGiggu1G6dUAi0B6PJj5nlMjfJvrAgJHM9leaNTUvHr?=
 =?us-ascii?Q?Mn6TGuub7oEXRig1FdOdRCN1xtVz8y4HsUf6lNcrktAayu4PqJCsnRgyvHc0?=
 =?us-ascii?Q?qK8aeYXJ3eUrSEm6QwiX1tTcVsbHfes21AsSBpNN6McQ/Qs28Gl2+8vc0AO6?=
 =?us-ascii?Q?4cfLTEvefD26r2j+0nJZ+1vQjjy9Yn8g8hkCvBNlU+v6YYI+QalrDI+ryorU?=
 =?us-ascii?Q?eJ3m4oATvWkh2saf81ikKkFPRuS980E9I4GPcrWcscMRReBgfzFmNouM67ZE?=
 =?us-ascii?Q?/ogjHIL09piyeK1XgExeJJpifpIta30D7MoNeX8GIiMSjXFL3FOuiYyUydY9?=
 =?us-ascii?Q?ra3NB8Nf/w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e4f48f-b68b-45f7-943a-08da29dd31be
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 12:38:42.6993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB74JhS6aYsoVc94Ea5gcZIm7ZnztILSBJ9BnA7K+IUbNTrTM1K/Xi2E4h1Ipq+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Apr 29, 2022 at 11:27:58AM +0100, Joao Martins wrote:
> >>  3) Unmapping an IOVA range while returning its dirty bit prior to
> >> unmap. This case is specific for non-nested vIOMMU case where an
> >> erronous guest (or device) DMAing to an address being unmapped at the
> >> same time.
> > 
> > an erroneous attempt like above cannot anticipate which DMAs can
> > succeed in that window thus the end behavior is undefined. For an
> > undefined behavior nothing will be broken by losing some bits dirtied
> > in the window between reading back dirty bits of the range and
> > actually calling unmap. From guest p.o.v. all those are black-box
> > hardware logic to serve a virtual iotlb invalidation request which just
> > cannot be completed in one cycle.
> > 
> > Hence in reality probably this is not required except to meet vfio
> > compat requirement. Just in concept returning dirty bits at unmap
> > is more accurate.
> > 
> > I'm slightly inclined to abandon it in iommufd uAPI.
> 
> OK, it seems I am not far off from your thoughts.
> 
> I'll see what others think too, and if so I'll remove the unmap_dirty.
> 
> Because if vfio-compat doesn't get the iommu hw dirty support, then there would
> be no users of unmap_dirty.

I'm inclined to agree with Kevin.

If the VM does do a rouge DMA while unmapping its vIOMMU then already
it will randomly get or loose that DMA. Adding the dirty tracking race
during live migration just further bias's that randomness toward
loose.  Since we don't relay protection faults to the guest there is
no guest observable difference, IMHO.

In any case, I don't think the implementation here for unmap_dirty is
race free?  So, if we are doing all this complexity just to make the
race smaller, I don't see the point.

To make it race free I think you have to write protect the IOPTE then
synchronize the IOTLB, read back the dirty, then unmap and synchronize
the IOTLB again. That has such a high performance cost I'm not
convinced it is worthwhile - and if it has to be two step like this
then it would be cleaner to introduce a 'writeprotect and read dirty'
op instead of overloading unmap. We don't need to microoptimize away
the extra io page table walk when we are already doing two
invalidations in the overhead..

> >> * There's no capabilities API in IOMMUFD, and in this RFC each vendor tracks
> > 
> > there was discussion adding device capability uAPI somewhere.
> > 
> ack let me know if there was snippets to the conversation as I seem to have missed that.

It was just discssion pending something we actually needed to report.

Would be a very simple ioctl taking in the device ID and fulling a
struct of stuff.
 
> > probably this can be reported as a device cap as supporting of dirty bit is
> > an immutable property of the iommu serving that device. 

It is an easier fit to read it out of the iommu_domain after device
attach though - since we don't need to build new kernel infrastructure
to query it from a device.
 
> > Userspace can
> > enable dirty tracking on a hwpt if all attached devices claim the support
> > and kernel will does the same verification.
> 
> Sorry to be dense but this is not up to 'devices' given they take no
> part in the tracking?  I guess by 'devices' you mean the software
> idea of it i.e. the iommu context created for attaching a said
> physical device, not the physical device itself.

Indeed, an hwpt represents an iommu_domain and if the iommu_domain has
dirty tracking ops set then that is an inherent propery of the domain
and does not suddenly go away when a new device is attached.
 
Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
