Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE66558CFB
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 03:50:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BAC60C14;
	Fri, 24 Jun 2022 01:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BAC60C14
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=daIOn5hR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCEP7gvjf1-I; Fri, 24 Jun 2022 01:50:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8450360C12;
	Fri, 24 Jun 2022 01:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8450360C12
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53C1FC0081;
	Fri, 24 Jun 2022 01:50:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54588C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB96141964
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB96141964
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=daIOn5hR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmxJYkhSVVP3 for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 01:50:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3DD341920
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3DD341920
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqJbAoi9L5bLxTif82oBgwiq9Gl9v5hApgm3sOKnBziCEt2lJM8VBdFoGtOQUiAkE89Lc/7fenprh/7UfC4Ctk+hWQ+8l7d02/dVBSv71RvRXCWBysvfjIIiGZv2d4+QQ6JRLv+4etCB+/0BFkVeXNNxdlQohuRqVJlfhgUKddd37WSPOAQ5Il4EKYzSRXvd7qwUuiCtkIdfNYiSk73HAVKoy1zLjovQWnln08W+OOYv9aXR48O6+/seO5GDwbfrOHtBHLHkp9ZtkSVosB7x9Es1KEF5m8sMUs3SWdP7zokynLUUemPfMptpMPRufnbdeI7WPPx4BmcEIPAY4iQuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4DHRKlka3MYtTFbBPIU2nOFYSrLrj69UR/YS1bXgz8=;
 b=KGBjsahtp5SrYvR6NH6pcOHgSBA1kzSyehUuzCSWwzUxF63YmxuaQMZHzBxJPGXcnBZu497imvgEErO5oh294JWQc2A1YZUxtYOC7AKZkVfPG/ja4dC+YlUcjj0nuuF5y4TPTKRcOde0vsrqS37BmOoQQRF/1wkR0j1MHv/R4dsFYRJOOLWVYZMDDfUkuegieA6oXyQ/K+mFYVj83Oktz8w1LYNJHIu3xckya265KCaUznCe17GqQJA1hjm0b4tbjlQrhFoDSufAQgic1hJbxDDsAmksKwu//bzFtJn4sa51ZU1k1/KOgYLCOOrNFqQ/bPNBhQCP44Jv+oDRRKs9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4DHRKlka3MYtTFbBPIU2nOFYSrLrj69UR/YS1bXgz8=;
 b=daIOn5hRjZ3NJhsI0YviBkxBm0wICT0/lBq4DnxNFcctcLUgN6VRGFzw1l46PWZhyDzcVB/1RkPqaweiT5PPFKFSsFkPY9OXksC7terVGKz4VlZeXq7NHq5XqO+A8g6T/qJ33Hhuc5y/57g4BV2EcfnwgBj0gPi+aFPD/ZYdPQSy0I/i8G7tQiUHBJVlXyO7vPdHagIxMOB1tbYXHvqoZWfNMr4OKaOR7kHJ4QajLnyXM3VFb+Kqb76N3Llh1QEb8WnQmNrL9WmuqSNWTmxSF2Ubjd3xcJLSFtrEW5ze4p77zUaobk7d149yXTEbAk/G+jMV74N0yOElG0v9db97KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW2PR12MB2522.namprd12.prod.outlook.com (2603:10b6:907:f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 24 Jun
 2022 01:50:31 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 01:50:31 +0000
Date: Thu, 23 Jun 2022 22:50:30 -0300
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Message-ID: <20220624015030.GJ4147@nvidia.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
 <20220622161721.469fc9eb.alex.williamson@redhat.com>
 <68263bd7-4528-7acb-b11f-6b1c6c8c72ef@arm.com>
 <20220623170044.1757267d.alex.williamson@redhat.com>
Content-Disposition: inline
In-Reply-To: <20220623170044.1757267d.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:207:3c::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79d5af0f-c829-4779-75d3-08da5583ebe8
X-MS-TrafficTypeDiagnostic: MW2PR12MB2522:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cPer+L16Wwl74/UppmeoLJc66sRMGMIYgl/Arwfg3OtQ5Xp8DdfavhARWy680V6TI2Puh4qLQn0idZyrS34uic9Ks0U9U3kM7nGb+4QJnya+yKOF8xwQE1SRMto18gPox9liXJf0RTom9s+mf+tToy3c4u6OSgNvJhw1Xvmke9dqKEkKA37DSkUxtsCfVOyKlWMYCWOnHOAWyxX763Pj/8l+VqiyIvKRsDQshm5JRNbk9hF7sGGxRLRFisbui6vAHMvm0lPUIWl0ImsRUPOXWtBGmo7IcElle13/AZ1toI0i8Ltm32BbP2XR17zkkHTBw58GHxgoN431utDr1O6nsgGcGc3MTLTzHdWOTs0021E19VamMVgZ12b8Wnqb3C9IKlRZCMt2zaIX39LCHSPxtUOBByQRw1BLCrpPMqF57mpDHauoRLSTDREV2gwKFayrdYEBM3MgsMJdYjaU+2o7PxKR/5+ZF5+lzq5tQxH9x8uXTZFnzgZAqBM2a8x2O4zp7CHQ99RdBUgwEZOUGtki+UzcY/OE4N+wqVZc24eJ3tNfbm8W3UiSJxu+QZVv4T9dsFlaLxUDdGp2D8YZXgnS8//4S04/UPs8eA8D/YU1Mj8MurqtDApLVFUQkfhwSZg2+3dp1D4CtDUApKAAP8N8YnYPxxSX4eNrxMc0OrTR2xqGpHBEGjSZRWEyamYJfChPB/SAFNtJTM/s6pGkinRrxAJtgwxHpjGDej93s1J1Ju0lxMegNNNyJHu9FUuNHkP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(66946007)(6916009)(2616005)(186003)(4326008)(66476007)(86362001)(316002)(2906002)(83380400001)(66556008)(5660300002)(8676002)(33656002)(26005)(1076003)(6512007)(41300700001)(8936002)(6486002)(6506007)(36756003)(38100700002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4COLO8hQhGICRF+HZIdcS6JuATRDsM2Q2ltRbYYlm9T4Dar9Ve7HODLiByIG?=
 =?us-ascii?Q?hu+OY0PUeUSmUCp8rAHpiIBL0HWrTxAKU7HcfVjXLGskXYos2min1DRovg2w?=
 =?us-ascii?Q?XTKm6CLFZjUYj9uoNQCTu01YeVXgtp/P7EFN8e00BL3j4d6VvD+I27m2mEGf?=
 =?us-ascii?Q?ZEMTAgKhOodw7qzmxc3wvWqk75R1LFC7P9uT1OnEbJmOaBUGamLmJ7v721Vj?=
 =?us-ascii?Q?hq79MB2hRjQqBb8yzkqWWqRwcwyauWINFoTRLgxESPz03GZKWgs0tlskWqNM?=
 =?us-ascii?Q?j0qc6xhtwZI2fnDgtO6MkzmtrnFeGXx4NWXEgSj0I/DvWJn3dGo4nm7sgM60?=
 =?us-ascii?Q?Rf8oBcYRBz9Rh6jYa1nm+b8yyWygTc9KzvUpwqGFDHO4KgqWyCakIhJk+8OL?=
 =?us-ascii?Q?OT8yaVQ4b2CCTedat7nXbErMysMw2FEj5TULPLXsDKucoStJbrE74WSZljl8?=
 =?us-ascii?Q?NdsQiaVrkpk16s7WR4TIs/cTtTcM1adxYJ9HswiPYTmVjAV/9Ce4KrvkBrrj?=
 =?us-ascii?Q?BVDUl/7NOfxVD28HkvpdSg/VznYk15jWsy1xeNR9SmJZotKdXAmFuUf7Fiz+?=
 =?us-ascii?Q?iVvaKRfg1EDHxgwjJw/XWhcM3WmDzEfEC1+5y9Zbrh5IW9KiTRiI7FQ8OaAH?=
 =?us-ascii?Q?j2QqRnMQleYZjqlD1mZAZq+4VTVSQYsg3Wa00bjRmusri7cvfybKi9DvOsju?=
 =?us-ascii?Q?SxKCP16Z0PJRsqNZxOgQtZqRBXMLu8cZl2rmwZcrkVjZj1zie1EVkymOrXQj?=
 =?us-ascii?Q?5fNBk807svUbMXs+u4O++O9/UGD4zXITwAoxfVoioWW21arb2OzTnqoHuk91?=
 =?us-ascii?Q?p+q+1mFi5pTLZVqy3sxJPWbm4L0OL9bcfVWZ7TEnSn97y0snZMmvPBdQyTIa?=
 =?us-ascii?Q?nuJQ/skVlaG2GqQmqNhuE/NOxi+h9BECGarZgdKx34NFac+Z068D/HRyH1kN?=
 =?us-ascii?Q?z/hNqnRiG3Kqap8oT3Tgu6l9QUO8foMZlbLadvnQZEXQNtI1WDVkI9N+PBQf?=
 =?us-ascii?Q?CpMohSnv58X8z0t1l88HLyK200FUzUNuko8qNEMDk89SzB9xBwJzZNlyman9?=
 =?us-ascii?Q?mDnpfCebEA6rSip7HvScbthJ4FG0rz6kR7mDAYUn2oM0KaRfY/NUD1zu/Ziy?=
 =?us-ascii?Q?rDgL7Htz2FjBwoQgE3/4lfxZo4FFpDVopGazgY6qkfiCr7DfLOCP/qYil34M?=
 =?us-ascii?Q?+6gfucjZsEjVudq6BW0GGu9KUBshjnoSrji4qfc+yWfyiaLsbRu6W4yE1QvQ?=
 =?us-ascii?Q?EI2EShMEYdIAIS2N8qkniDmGAowJ73w4XUOv4ZvbdCE1bwn2QuRaFChWxIx0?=
 =?us-ascii?Q?P+Ujf6QqMJ9pbCu2aiRj/86GYSVYwq44ysKIF7STC8IpmtiM7RjofnQ25Vj2?=
 =?us-ascii?Q?ohzwFMvomXJYckxZsccFRi63v/K+LvTTbnBcDsdCrmu0l9ZW/FtUcMxrIK9Z?=
 =?us-ascii?Q?79ouIMu35drQUn6fjh9r5fP3EiQpAlvqbrQP/ODcLGwyZwWEVkUiImzJuusU?=
 =?us-ascii?Q?kROl9reMbzj0GJkRbEj872p64CuuO2Joz7q4zeLIxBTVyTvs10g/LzqiEuRA?=
 =?us-ascii?Q?z8GZfM+SKuEp063aruWqEDqvkAPP1jI5MutNVhfQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d5af0f-c829-4779-75d3-08da5583ebe8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 01:50:31.4397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxSInNTjfGEjHNmvWTK7oKbvpqj2jOCbfUiPt17nAmwuYB60XatbEnL5h9iRp5WE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2522
Cc: kvm@vger.kernel.org, cohuck@redhat.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
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

On Thu, Jun 23, 2022 at 05:00:44PM -0600, Alex Williamson wrote:

> > >> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group)
> > >> +{
> > >> +	struct vfio_group *group = vfio_group_get_from_iommu(iommu_group);
> > >> +	struct vfio_device *device;  
> > > 
> > > Check group for NULL.  
> > 
> > OK - FWIW in context this should only ever make sense to call with an 
> > iommu_group which has already been derived from a vfio_group, and I did 
> > initially consider a check with a WARN_ON(), but then decided that the 
> > unguarded dereference would be a sufficiently strong message. No problem 
> > with bringing that back to make it more defensive if that's what you prefer.
> 
> A while down the road, that's a bit too much implicit knowledge of the
> intent and single purpose of this function just to simply avoid a test.

I think we should just pass the 'struct vfio_group *' into the
attach_group op and have this API take that type in and forget the
vfio_group_get_from_iommu().

At this point there is little justification for
vfio_group_get_from_iommu() existing at all, it should be folded into
the one use in vfio_group_find_or_alloc() and the locking widened so
we don't have the unlock/alloc/lock race that requires it to be called
twice.

> I'd lean towards Kevin's idea that we could store bus_type on the
> vfio_group and pass that to type1, with the same assumptions we're
> making in the commit log that it's consistent, but that doesn't get us
> closer to the long term plan of dropping the bus_type interfaces
> AIUI.

Right, the point is to get a representative struct device here to use.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
