Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C108558D06
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 03:52:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC41405D2;
	Fri, 24 Jun 2022 01:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC41405D2
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MDKR79el
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WccuMUrSUyai; Fri, 24 Jun 2022 01:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1AE405E6;
	Fri, 24 Jun 2022 01:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1AE405E6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45E47C0081;
	Fri, 24 Jun 2022 01:52:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16E28C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CECA381C20
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CECA381C20
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=MDKR79el
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FQBft1WPliG for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 01:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B81C81C04
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B81C81C04
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 01:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gos3ScDpY+iPrB7kh1hvLiDvpHuNT3X9W6WzT8L0m8ItPr/SDVdP8kRTV/834bAnQ7olw2qeGyHqn3xzEYDJEnDz5rcAYpDSrL7osGwVsn00jwVLxNTCKkwenW+WA4UOgNoykspr6HRMsx/8ObjyK9WNLDckU8MpRm0OtBbwuwlWHdUeiMJMv2s4G1GVoDBLCBnlwqq6+H4qxTsDv8VxfKoQ2R2399BACLcgRe4ohYuJK+wd+KghwE5gpJHDTdvtgNwPXchOuJ/FlNFgoZ/Xa7f2N9zr/EhH4dtIZ4ejQK0kQMBegSZVyc/qxEI/0S6nky2+WjUS8vx5bHG+RlJVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekJnCstW/mh+6ECgMiSBUHr5HvKVSe+5MGvbhFazLbw=;
 b=PPt4gwx0sHoGhb7y4mxE97D5Zta1LwGBqAGEBJ+V8x9kQYo/ikQQWIK/rZwVOZvH39FBGaH3t+M8wdapm9XqCJb9Yxwk9On7pwVxWGeTG/eOeAeE7R+OmWk5IQDeRUf46asPvo/b6eML0bjmxaIOgCO4fx1sXE5eijAhhZS5fkkZCKHO9MVEy28+svjhJiKpdiX+fAaU01qXJ2ZzCY7ous8LjSrcRwubivT6tchTJBW59JiDlD7Km4XaE3NX9cZDBxYUU+MAo/vdWDypL60I4XiUw8iUFGYR9g0bdRjXNypPxvf3fu/ZWASaRyHLAl+u26+dKVRGBSDBa0FarteXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekJnCstW/mh+6ECgMiSBUHr5HvKVSe+5MGvbhFazLbw=;
 b=MDKR79elOPScY3tBMV25mS/2crs/fJ9v4G60ROzh2wgsFR3S52Lw5uwDT15e/eV4PPnl7014mPGqIemV99xG45Vnj4avzELZqeT8uK6dtIROAXFboOmQ/25AE/7SBjuT6IDfpnaDrdiMumfrdOBlzUNS7XLoG5Ohq82LJoKPeFSsjKVN1lq4ukiA1A5kEqzsba8toHzrIKQcHVANcMzyoI6aQayL64/K4XoctCEFdc9ThsLFubaEuAJMIpSLmRcXajEuqTfJnpjDL4hFZlu+4kZrs/Z4gsczi5qoi0QS9YwcDDODSHcdPu18QPfcNt99xe8LzoMurEEqJPZ694q8uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Fri, 24 Jun
 2022 01:52:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 01:52:49 +0000
Date: Thu, 23 Jun 2022 22:52:47 -0300
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Message-ID: <20220624015247.GK4147@nvidia.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
Content-Disposition: inline
In-Reply-To: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
X-ClientProxiedBy: MN2PR20CA0060.namprd20.prod.outlook.com
 (2603:10b6:208:235::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a48f704c-24ff-4182-7ea2-08da55843de9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Wd3e43Y2b7gg/gjBj6BO/GsyvRyjIJPZsxI2JxlWw2A6t+LUIeUkNm6vKOMrEaUcjh3vVPbRLA7tau022pIo2wGsD9BXV7pp6uwAtDciyfeLRBrpsYSU3F4u2izFgVeH2VtJMuJmofhYoxjzzb1vUdzHWK9/qRx1g8yvmOkLBEI8S2DeqQbR+AJjRc5SH55xfFcXGTW53sTLudeaOYPDP+SR+Mn2vSphzFuQzUm55a9ddDiyqh8l6DtACMeVT3uiUfIUNztvwy5MGI4WvKFaNkAdt4EXi1Ql2qa+798CzMwJRKhk5uEQMz6Nm3IN1qDx1+hFrK4hujOrcYAEOt/Un3PBRl9bud9cOLmeaNgEYYc2y4Cp7zyvYIAtDlbKbHJFJVABSUfm+NnmM4Yv0TDfG81H+ODv/VY4i9t7MilGVpVrIfmGyDHusetCEKExzK8HdkggFBAJGGxXVS7Xvcb3RrKMBVIol5NTYyOIfSYIDBslbfUTfQmbf00+oeyM4ywWK0awLJDTkttJSpvntmQebZ9Ps4V/NF3AQIg9yg9Zmr0LYFW8fdjrPOZCH8XJoXd7cvE9Ior4C+tCOPSpOXJ82pjZT71t8nrlpUIRqaViuTfDNf5LOhQU339zuQ/V5Jz+ir/vaQFmq+pk+TxS2f9IVG7xc+xjIEFTT4aBrjx4AOdUxCS7iv0TV5mkZuiIlFfddPpubD01RAQWjE7fPzCVjJN6l0dFN/bOAE6eZDMRWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(66946007)(66556008)(478600001)(8936002)(66476007)(8676002)(2906002)(4326008)(5660300002)(6512007)(33656002)(41300700001)(2616005)(86362001)(6486002)(186003)(83380400001)(4744005)(6916009)(316002)(6506007)(38100700002)(1076003)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sN1ZlOp1SoHNmbixTPqcC7lZcxDQadTYmPJyoBXpyR9NkONcbDPfp1Waxmq?=
 =?us-ascii?Q?NN45Uz+yAkBWdkqfJtLA7TU+/hWS4vozd0Kcq0KP1gSQwynU2VocVAPzRQkF?=
 =?us-ascii?Q?qVypFPykuair3hfm1hiaOHgWFAalB6BJEMlpxsqSgHhDMtObAj/C1phRVrdZ?=
 =?us-ascii?Q?LEhpO9JtMtsPJ/nJ9MzEzWFyuPR4l/85cR8Yx2Vu0/Ip42E67hsEdNddX7kp?=
 =?us-ascii?Q?QULUYrDHY4YgbCx2uFrvgg8mINssX2YajhuZGidHaMo5JuTMkIyFo4DVAYKS?=
 =?us-ascii?Q?RkpIPwiIlEQlDeCawTyN8+FMIDBBJUrLwuSDw9afvVofmp2eNIJ/qW6VsFjJ?=
 =?us-ascii?Q?LO/tjWyGAmvUcYFZ188Xz5lCrTYc1M7vC95Hyae9vrAUTVwAx/uyoomlCc6l?=
 =?us-ascii?Q?7SwOhIYqFm7n2c7f8OOIihSw5DqAWezrTQyatbnuNdLhtZTRgrxATR/Vb0oQ?=
 =?us-ascii?Q?Usejg/SlobREcpWoNZYPrJjzCUqzA0XJHrv1GIn6h0O6KCJRYwRyR9GflBBa?=
 =?us-ascii?Q?X0ysXqYvaovprkeAaNYI0SY0SoU3VXmfPq8OjGRBbXX6axId9N1R8GT2hWT3?=
 =?us-ascii?Q?q/DOwmP9lov66M5I1O7f5Uz8y8+z2yXxkGkB9hpcGy+wzTRS27zxr3Jvlwwx?=
 =?us-ascii?Q?vuMplayDkOCKtuRSC6SY9r96Y1LQtXyfOE5DItLbrQQyY2lInoPM/87yuJxf?=
 =?us-ascii?Q?L81r54H9dwsUsDU7/oq+SHoRTbIbrOgc2TLxVipG6LrZS03aIl+DO1ojvItW?=
 =?us-ascii?Q?/haLUSN7RrBIUrRIX7Ng6VdkTxUHsIOjJm3XRjxjrIUSOM2iDr31RRQitqcm?=
 =?us-ascii?Q?Y7PViehLHKyINi6zSC0r4gDGRaYTaOhdS2JF7zWbRetbp559WrOSnZ0Hf9eh?=
 =?us-ascii?Q?Q6E6B0W0AjUqhwM7JSqYylZJye2MnMQEEHut/z2DDdLNH+NHiqVmah/P5vnc?=
 =?us-ascii?Q?5eoQRArI4gxhOXvB9BrccRSIN/Q+6J99CR4QoltXNXSL5dbxvLagOkvML0hp?=
 =?us-ascii?Q?9bcx/ki7Bwp2wtdcMllqojCpsyJZ/f6PzrrS8luN0A0GWG1K+g/uF+UViYYT?=
 =?us-ascii?Q?5FN2cEYHo6jpb0dcLy/ZGvMtkzCbGv5HodDE1TVPug347a4hLRGj2S5C1zIz?=
 =?us-ascii?Q?I9DcgoSN4p0TlT7j1kcuxf/soo4ZDJaQJ4BJaSdl1PU7s3o795cu+GcH0ErZ?=
 =?us-ascii?Q?vTh2hE4GnfzI20t7sYq04+4a0E4uwtgFDVewxe6WbCef4FdmkvN+YdNRi15C?=
 =?us-ascii?Q?h98JdCgnJTccbA+OGFP2qduhmmM8SKrmu+yEkWu45/eAXzTvpAyDVxBM+gTB?=
 =?us-ascii?Q?2hbJ4zPPFDs6pwSh/O0zTyWmNDKFpmboKy945FG4ahfDqP5ctUQdWVv9nEcJ?=
 =?us-ascii?Q?UvfjnkUyjWQP4WzekvAe/+gzaPPfiR/B0rshHwlvQ/ZaYZR27nVtK714KuNS?=
 =?us-ascii?Q?2D5s1qPBx3Ws54rXs+YVxArLIAxbbO+YO8jsSZXj8iz1ARtylg64DgphKjeB?=
 =?us-ascii?Q?aGoQMYIXSmpIkyCqBp0zsWVP6EHPlc1GNhVhWGrj9aQcvbEK0y9+N8oHECEX?=
 =?us-ascii?Q?XZVb+RYjgwSAFGAFCLybpkF+bCNnsgl47Ecnolg8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48f704c-24ff-4182-7ea2-08da55843de9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 01:52:48.9883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jg/LxXDRhUh6AI6GmnGdKesoRXtr7WnnK17amWfmy3GRjp6gaXeimdcYOE0oQiEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 alex.williamson@redhat.com
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

On Wed, Jun 22, 2022 at 01:04:11PM +0100, Robin Murphy wrote:

> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group)
> +{
> +	struct vfio_group *group = vfio_group_get_from_iommu(iommu_group);
> +	struct vfio_device *device;
> +
> +	mutex_lock(&group->device_lock);
> +	list_for_each_entry(device, &group->device_list, group_next) {
> +		if (vfio_device_try_get(device)) {
> +			mutex_unlock(&group->device_lock);
> +			return device;
> +		}
> +	}
> +	mutex_unlock(&group->device_lock);
> +	return NULL;
> +}

FWIW, I have no objection to this general approach, and I don't think
we should make any broader API just for this.

Though I might call it something like
'vfio_get_group_representor_device()' which more strongly suggests
what it is only used for.

Thanks,
Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
