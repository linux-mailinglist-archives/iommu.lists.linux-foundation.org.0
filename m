Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A024138CD
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 19:40:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0075607ED;
	Tue, 21 Sep 2021 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtHrVa0cKr4m; Tue, 21 Sep 2021 17:40:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 97A35607E3;
	Tue, 21 Sep 2021 17:40:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66944C001E;
	Tue, 21 Sep 2021 17:40:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4B72C000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2A5A40515
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 122IwVEDfE9f for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 17:40:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 998FD40505
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=necqnQudCGikMlBWus9JSlaleXGUV4EhnORS1MaggfhgTnFt4mN10OTuYyxA5VDYNwRLswVB1sXgxgSXbBcTHl35VZ+7G6deHbg1+Gw8Uppci5ZvF/mlvR3JMmIaSjTkKzAk8+NHiTFK2UyHvBdmQP+X0jPaNAklVl66ONy9BH99VEoFsDASThs2OgtqPBgLTzsJULbhUeYCllD5QpAoOjo4eAUccgVUi5ogvsdrjYzzk/UuFE7h1+wGanRAsWnOl7G8ETOE18pIzm2KpKlrM+i8rn5u4cPIUQXm9FsFIaPMbSsfKhC0ndK+do3uHQmLg0BDdVked2mJmfnYGs87RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=AjD50/xqq7YV1Y2BzjDuQtCCQCZgtJ9ex67/1l7P6PM=;
 b=bTZli6NAJB+bveQN9kaTf8Rz2ituEbLNTo/BAkmcYUrETZPhOIzcipw9RXK2UoxgeK8Z0hsSbTDL73qgu2qUZota2bA/KeqUekgpMxtr1OYp+XoTXngm2wLLjrAn3giUSzI/IyLFnrvi2SPw8KqxmrP1PnU2Fl+zKUCmPVMZZFq9NRr0Lahk9fHbtjWCpQknryM1Lo6O9kbwz9wVeDY1xa4YOCPHYSyDqsimHW6pl/SjmTMAhUUvl0OC2pCR1YMdKflv/gOwTGMCtrCsvp3lBKBJc7VKP69z+kTMus1SnfdItKvVNooI5ao7eidvIhGH7FQ+ovlBF/N5SeoaW+4LQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjD50/xqq7YV1Y2BzjDuQtCCQCZgtJ9ex67/1l7P6PM=;
 b=uNmJ7puZdFwrhgicEGJbPGcji4Jq5EklQ/zP19iL5cPYj5czBKvvx6yCoVsdgBbOWB89tHtLE9MLxwq0AOIb86z4SidFntTb5ORZbGkFhq2ilCreIKqvNb0kWuCEAPjEvtfAIm2RBI0dPffGrw6xsIQK+MgqUATFpeD2oYbXZtVe9W8g8BNQofboG3VI875UybfNXe32cX993UDIwua63FrOKNDIDSgGe2eILG/r7KSehmn1lKlTxtbWoOIJ6wiJEoeJN/4NIRtkHpmJEJkxwLnb2/WGCF2xW9ppmg+057j843RPlmVGrwepUVJWTl1Cxzj3T0ujdRM5FIhjVAvXRQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 17:40:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 17:40:50 +0000
Date: Tue, 21 Sep 2021 14:40:49 -0300
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC 10/20] iommu/iommufd: Add IOMMU_DEVICE_GET_INFO
Message-ID: <20210921174049.GV327412@nvidia.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-11-yi.l.liu@intel.com>
Content-Disposition: inline
In-Reply-To: <20210919063848.1476776-11-yi.l.liu@intel.com>
X-ClientProxiedBy: BL0PR01CA0002.prod.exchangelabs.com (2603:10b6:208:71::15)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0002.prod.exchangelabs.com (2603:10b6:208:71::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 17:40:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSjlB-003Wzb-38; Tue, 21 Sep 2021 14:40:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a271b1c3-bbf8-4e64-cf4a-08d97d26f38e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5144D1FBE8BB35E1CEB8FAF1C2A19@BL1PR12MB5144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6FlW8PA3myNyIhvWBWlu0i3+RwBswooP3Y5JYvnBJDwNzb0EXSGF2Mpjt2msUjj8Tx2l6tRh7DtbdA5MCYOjjJHqYyGHZh/m6m9F4FIzzYZ4BqGzSawgsc77MlQtELegEvcmJF/4QOGrFKuZ9p3xb2eOs4ip9cok8XsqVSPtuvUeur3U85uhYMmK9yDXsnwzqI5JU9ueX08vbz2ZHDOdEActuKfmnaI/Mw7FohuqeQgWTQhAUsCUOJlBQExfprrlAXMbdiIAHKl4wWwuGJM140nZ3NKM+AaUfmq6ty/CMILGcj2vBMtGZDvUPyPhQEt1x4Ze4z0GlniysiIEOZRNcsW/yDyzj1cZSQQD6pQQvX3+P1HRYuyiV6od9IlVG4OE8BinqqxBVkXz3oOVzcBQw4qOHIBsu5Cl1cPYSSrLW+6lFRsbyBv40zK/f6dDG8G6ZcrP3fijxo81pCQHVzVX1aSgIyR8Q77YYfXsXbkI5IROg1etUTp95jfhbsT0o02CuFDJ30U5DCjHWWQzGgmVrd4dM4oy8YZWMV+vmUlrCo5KW+RaHnPrFU3OQZyeF/Cw8jRXiTlDl80ahXKKyW2jR/dMKjWiUHLyg3dE4ewPLRzx+DJkL4eTmN+nzCwoU3fr5V9j4a9L3Cjgh0KYQYSCckJ5wqKVpbYkyrOl/WNiKRRQG1Wv6jENjn/2Y45Y7Oh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66556008)(107886003)(36756003)(186003)(26005)(2906002)(426003)(33656002)(66946007)(86362001)(5660300002)(8676002)(4326008)(9786002)(9746002)(2616005)(66476007)(508600001)(6916009)(7416002)(1076003)(316002)(38100700002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?heINA7s3zuIgTP4zUmXkD9P8K/srZAJEq9L1BrCgnvNJWx5Nm7buTW2s5KC/?=
 =?us-ascii?Q?KmXazhCxIpdECddk4YaQs14zxMuKUdvZuuO7F0oxW9wtH+TC5WybddaXnTgS?=
 =?us-ascii?Q?WXci4AoBzMGoZ20B5fsDEpj1Ku6l/bK+2HWDQGOKHJEienc0lND+tZlChYLu?=
 =?us-ascii?Q?uxu3dqqbHqK+JWG5TGjS7VZVN8k6WTTIG07qsTJVKj1SaxyiXRHlFSkGVjQM?=
 =?us-ascii?Q?gn62j/MZ4LTp3IEgsvUkinV538MjJ/WyMuSuAxv5Rm0R7fxbDSJmo1WI2u6x?=
 =?us-ascii?Q?OoQs5NDze+REkzD+KO/TL2oLpBpOym6GKej4VTR0a8K8AILIchnUieBPo4Bu?=
 =?us-ascii?Q?OQF4d8urQdqEX99qwxbzQSxolEwPaELXG2LIEKmbJnMr/zVx+YLnFjKsLvV6?=
 =?us-ascii?Q?JCdsaPQ82el1yrlifGd4W6uoxwjMqeEAHZRKgPb1bRsDSac62x4s5k1KNLt9?=
 =?us-ascii?Q?LvqR9P75BfA1tfPBmGazm6VvPzGnmIfQLjfAHJU267OPyF6JFzjRuLdEYdOV?=
 =?us-ascii?Q?h6uE7ZshKh+EgZIpdQegaFCzYwHpotVLh69rdO7KrarY1BAlbtt2o4u/1S+p?=
 =?us-ascii?Q?Xtjp8nMjE3VID8o7SSQU/ogvz6mCJmuxXw1menI9Qkuj9TpbXPxTRB+iscDw?=
 =?us-ascii?Q?2VUMYDWW2xBZlyrve+ePXwc7Oq9Ejixy6Zs45Xnv3vXwNQQyYQ2b3guSYMQ2?=
 =?us-ascii?Q?Abm9NSYS5fkCXtuh3RD4W3FBjl606oVIE7aEh0ETcPAmdhAF9+aVfBzavNPn?=
 =?us-ascii?Q?LaHp46YPt02XUNv3RPeDEIwosUOkuf2wrzYMICAgkAR69XoQrm6C/tAKqHiL?=
 =?us-ascii?Q?3TmKJh+emW4eU0Gc7MZYGsdXn38UB9BbUro5AODRf8DLPdKfMQF1MGwn2qXK?=
 =?us-ascii?Q?0vI74vWLX8J+rIy/P3rWq/l8dB+5is8H79p/b+fTuNWudadBSzS803Gl0hM6?=
 =?us-ascii?Q?vpQXAFjZNR4WMZMidw6cXlXui1PojpJiktnSZh+esfrimj+6iCoC1wmdAkUs?=
 =?us-ascii?Q?upGSfznnh3iWc0TnSNzY+Jg/7F5gaejZTn7Bfm5UlY61mfFBW25nITlbfnH1?=
 =?us-ascii?Q?IQEson+xQP6JzP5zyVoQX3z8MC+4jISVtFCZWcrnF7BarLIbWNcjSddfYV0/?=
 =?us-ascii?Q?feHcDZppZCIZDb3dlJ8DV/DCCjs28bix8Owi4Ha8B3Sx+mFMTZcrYtiVxtgp?=
 =?us-ascii?Q?/1sHLEtdgCTmho/TEfFDXgNJ5hf1gUggvB+TA+aYGjckQ16hB9BUSJXYb8B3?=
 =?us-ascii?Q?wjW7IAYb77VfRJEaw4/Q+AdLBNS/dEk+S3xpX7c3YkCtlYKW2Db9vIsgXAmO?=
 =?us-ascii?Q?kEDfCJYQ4p4kPmnfKzX7cMP/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a271b1c3-bbf8-4e64-cf4a-08d97d26f38e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:40:50.0576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XueyFe4nxjdYjIyaDTPkJdMXTDve45vQTGSULLgppeg/XHa0btLGLnOGw2nouHdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5144
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, kevin.tian@intel.com, parav@mellanox.com,
 alex.williamson@redhat.com, lkml@metux.net, david@gibson.dropbear.id.au,
 dwmw2@infradead.org, jun.j.tian@intel.com, linux-kernel@vger.kernel.org,
 lushenming@huawei.com, iommu@lists.linux-foundation.org, pbonzini@redhat.com,
 robin.murphy@arm.com
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

On Sun, Sep 19, 2021 at 02:38:38PM +0800, Liu Yi L wrote:
> After a device is bound to the iommufd, userspace can use this interface
> to query the underlying iommu capability and format info for this device.
> Based on this information the user then creates I/O address space in a
> compatible format with the to-be-attached devices.
> 
> Device cookie which is registered at binding time is used to mark the
> device which is being queried here.
> 
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>  drivers/iommu/iommufd/iommufd.c | 68 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/iommu.h      | 49 ++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd.c b/drivers/iommu/iommufd/iommufd.c
> index e16ca21e4534..641f199f2d41 100644
> +++ b/drivers/iommu/iommufd/iommufd.c
> @@ -117,6 +117,71 @@ static int iommufd_fops_release(struct inode *inode, struct file *filep)
>  	return 0;
>  }
>  
> +static struct device *
> +iommu_find_device_from_cookie(struct iommufd_ctx *ictx, u64 dev_cookie)
> +{

We have an xarray ID for the device, why are we allowing userspace to
use the dev_cookie as input?

Userspace should always pass in the ID. The only place dev_cookie
should appear is if the kernel generates an event back to
userspace. Then the kernel should return both the ID and the
dev_cookie in the event to allow userspace to correlate it.

> +static void iommu_device_build_info(struct device *dev,
> +				    struct iommu_device_info *info)
> +{
> +	bool snoop;
> +	u64 awidth, pgsizes;
> +
> +	if (!iommu_device_get_info(dev, IOMMU_DEV_INFO_FORCE_SNOOP, &snoop))
> +		info->flags |= snoop ? IOMMU_DEVICE_INFO_ENFORCE_SNOOP : 0;
> +
> +	if (!iommu_device_get_info(dev, IOMMU_DEV_INFO_PAGE_SIZE, &pgsizes)) {
> +		info->pgsize_bitmap = pgsizes;
> +		info->flags |= IOMMU_DEVICE_INFO_PGSIZES;
> +	}
> +
> +	if (!iommu_device_get_info(dev, IOMMU_DEV_INFO_ADDR_WIDTH, &awidth)) {
> +		info->addr_width = awidth;
> +		info->flags |= IOMMU_DEVICE_INFO_ADDR_WIDTH;
> +	}

Another good option is to push the iommu_device_info uAPI struct down
through to the iommu driver to fill it in and forget about the crazy
enum.

A big part of thinking of this iommu interface is a way to bind the HW
IOMMU driver to a uAPI and allow the HW driver to expose its unique
functionalities.

> +static int iommufd_get_device_info(struct iommufd_ctx *ictx,
> +				   unsigned long arg)
> +{
> +	struct iommu_device_info info;
> +	unsigned long minsz;
> +	struct device *dev;
> +
> +	minsz = offsetofend(struct iommu_device_info, addr_width);
> +
> +	if (copy_from_user(&info, (void __user *)arg, minsz))
> +		return -EFAULT;
> +
> +	if (info.argsz < minsz)
> +		return -EINVAL;

All of these patterns everywhere are wrongly coded for forward/back
compatibility.

static int iommufd_get_device_info(struct iommufd_ctx *ictx,
                   struct iommu_device_info __user *arg, size_t usize)
{
	struct iommu_device_info info;
	int ret;

	if (usize < offsetofend(struct iommu_device_info, addr_flags))
           return -EINVAL;

        ret = copy_struct_from_user(&info, sizeof(info), arg, usize);
        if (ret)
	      return ret;

'usize' should be in a 'common' header extracted by the main ioctl handler.

> +struct iommu_device_info {
> +	__u32	argsz;
> +	__u32	flags;
> +#define IOMMU_DEVICE_INFO_ENFORCE_SNOOP	(1 << 0) /* IOMMU enforced snoop */
> +#define IOMMU_DEVICE_INFO_PGSIZES	(1 << 1) /* supported page sizes */
> +#define IOMMU_DEVICE_INFO_ADDR_WIDTH	(1 << 2) /* addr_wdith field valid */
> +	__u64	dev_cookie;
> +	__u64   pgsize_bitmap;
> +	__u32	addr_width;
> +};

Be explicit with padding here too.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
