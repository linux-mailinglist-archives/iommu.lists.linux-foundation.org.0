Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA9558A5C
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 22:50:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970978480F;
	Thu, 23 Jun 2022 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970978480F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D+gUEUB/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwOkTonbpuk4; Thu, 23 Jun 2022 20:50:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8D5A484810;
	Thu, 23 Jun 2022 20:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D5A484810
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62016C0081;
	Thu, 23 Jun 2022 20:50:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A907C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 20:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D1E61176
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 20:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D1E61176
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=D+gUEUB/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0aTtMu71If6Q for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 20:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDFE61175
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDFE61175
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 20:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaZVFMFgTURV03ydRH/qoFNcLaYXGuUZqBg4CSAIgcSqSmK4BXyLDDbxVlytIw/zWNNtvyYtaAcV6t+bDeGnHxPc0VIBGhA9qlFqVlJnzEgoQIY7fBLUgB2Ospmd8AcuogXNmhtl5xRnfYoRrWtVPu8tKsncGOUjWdU3TKugeLxisL6b8vpCwnzZ6XFuaGTc4zngQUbJ1slNhR9z/q33IWVNbrGAuECsDnJe8M6+THeQISOd5UgU6KD6KUZeS6RGBemiR7BC8u9PmJ5wIJtp+1AmtUTZkRpTxvMKnSvH8qvSYDTViBn2ie2acUvcSxqotgqi07NlJFHfYShXd9+P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqKdjnjHQ5n5G3z3A0A1RcCvqHjiTAVA/wUWl6oZ/6Q=;
 b=I8lKCHVpqEzx1/ZQlLqfLWfjItlpEdWzA+/JXB8dKPPysIMqWk7mgMYAisA3hJMuax5GMS11AEp8rToDSIKUgIQ3+ZDZWn+4//VffT1xYeP9t82VO5hc2wmhgXJIaMzcK5xSCTGT++LG8qbiGnQdKsxH5QwMr+FxX5nWkWVb0V8jtsaC6n08AVNmC4xApkqeZgqsuB8goriRecqGC9TCQusHdjnxQ+mN7ZsYT6lmC+ckzHaRwJ6pxzgNy7isuT/6Zp8nEKuPHgv9juOKXEse9R1jA4WfBOiwTm6QkiREv54L/RXYdloZPSdMgiWKKqNiMctrBeyiY0aMbQY5JmkuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqKdjnjHQ5n5G3z3A0A1RcCvqHjiTAVA/wUWl6oZ/6Q=;
 b=D+gUEUB/l7A61gVJS0RC0TatuTsA42zWp+zT+tEJz7ZXotfXAO1vADZKAaIq+F7qMFxy2LTyrvtQTr7CV0kgh5fTR9rOFRUDdyuyfvL1iXyH/pZ06M57CO8qaFdmlwmbkga2QCBQaxCMwyVFrgHPRpSZ+SCd8bAImqvifxyKgSzA8uGhoUlRo21z0g0dTIAPBkzzMtMbX4+Vs95VJ3PEnAj1lTfY1LVMW3Nxt1UpN6XbSgpk+YIX8zGLEUJd42Ty44j9MGhnrQ4sMGRT31KfrbD/h397eHMbqyRGeP6eLYiKiBcwRn6UIxPSEwkvtshImeXAlepk2q3DuCCJbSkB6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1282.namprd12.prod.outlook.com (2603:10b6:404:1d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 20:50:34 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 20:50:34 +0000
Date: Thu, 23 Jun 2022 17:50:32 -0300
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Message-ID: <20220623205032.GH4147@nvidia.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
 <20220622161721.469fc9eb.alex.williamson@redhat.com>
 <68263bd7-4528-7acb-b11f-6b1c6c8c72ef@arm.com>
Content-Disposition: inline
In-Reply-To: <68263bd7-4528-7acb-b11f-6b1c6c8c72ef@arm.com>
X-ClientProxiedBy: BL1PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 202ee41a-1e8b-430b-153c-08da555a0496
X-MS-TrafficTypeDiagnostic: BN6PR12MB1282:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hv/AQK4iwzsiUgxxTGmTInf7xHWbiAmRFi2NugUeBNquOQn1zmmbtkp+9aq4hsShiuixd9DQH++2w+ZEKZvP4N8jriVqO58Cny4beA5jPEBl/RMJK6lXNA33wRubIbh92bLGjn/65+eKJU5kNr3/3cxJrntLJxQZaFcIs/Uz8IBXI3JJdNwFMq+5qoImlZg72/8blL1nWGe1RXHTJQjwSRYau5u7lg+bVxc4a3tUL7AP+Dqw8zcdm4PwENDDeXpqPCZGKG/w2o7vAihmKYyK4HlUuFxSzcNPVNR/8oQUQgws7W8w+u5/3LtEn2xelgTYjOTsbM9aVkOdIpmL21576pQ+St8aKXHZhp3vahQ0tK0BkEkO7FsY4C5G6Tf34rwlGQUCNcy9/8pLi9/qcuNewe2TMLycSye33OhpdQ04eH5LG2ts+uQtQ4BJMzdYtaxwo2MoKWHT/ONKych6gw2pBDya/Yt/XniLzMiDPUvaDQr92D/4fdPItPULBr3i3HkgjMe2fEtMGB28TW0q78MVucNUVdYh0aVuCRjV5zRfXoMg4uD54Vu5/xLIrXzJk0DHLmhuNE7gLydcCOy1vv1XQlMwuKuVj3zCRL1NGADMyiXTg9zQOc0UEOmFDV0QDRByt2wkqc+fV0FzApzHwT6str3WuVq5SVEN3xNrz/STZxJc/1+gJiYfn3lhRdJlvFJ1+VrQwWVMXJxIG3ASachUHcmtPjWEo2t0Y7tp4UG+z/3hYU6OjCTZE0bADdRudaFx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(86362001)(66556008)(6506007)(4744005)(33656002)(66476007)(38100700002)(2906002)(6486002)(5660300002)(8676002)(26005)(6512007)(83380400001)(316002)(478600001)(4326008)(41300700001)(6916009)(36756003)(2616005)(8936002)(1076003)(66946007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhctTAP5nDmjbxp6+1GEfnh3rjot14/GDwv7mjA/bnbyd2Kb/6c3hTtvUfA/?=
 =?us-ascii?Q?Z7KRf1i2ayF+1jMB3HkHugw8hAs/UaRmLEXTO4aiU/9hSJMQo0lrGF/9M1LL?=
 =?us-ascii?Q?If6ZSLFbIVW+ofTNOmmhU2FKUe3CUvVGFxAUGx9hbkV+/vxoqlzvkbaMbDL/?=
 =?us-ascii?Q?JFl5Qn6R14Q/C076D0tm8sGFnmBiKN6FZidxDhLWl32z2Iv3WFJBh0flFhBZ?=
 =?us-ascii?Q?ImYYI9CcB2FGf3MThhUXiHE5lLn3b3ofIhLcI+N59IxkwYFgBKayEVOX030w?=
 =?us-ascii?Q?gnSPGEKTetHmE6VGyPqTfsouoRUAWL5AcAz5O/ivgajNpdYF4z4lfBxCg1jE?=
 =?us-ascii?Q?FOLKo5gRyUtGBudrntBY3jKceUnrXW6tMsYoSf8RRsLcjbO3h9mDGFzDwdke?=
 =?us-ascii?Q?65Ms/qkFg/KsQZnl5LetgIRcymzRnGm2mmD/wQ6NJ2W5qyfzo0mCAAbzhrR+?=
 =?us-ascii?Q?fCZfBXuXOh1boUM7RGLrd45X/6G9MOUhv7JEqZJnTpLWtX/wnpRipvTt+Z1v?=
 =?us-ascii?Q?HHhItsYH2xTKF+HfcMKiiFSXWvL2Ox1Rt9JJJdJnlpt2DGTviCCyUAH9qndd?=
 =?us-ascii?Q?blZI+y6J/ZX4hkLW42laswpYnj8djbyb89HTLId8YN2PFS0NkqqiZOtF2Fb+?=
 =?us-ascii?Q?q34lp0G1VbjmekpWN/HomgjkxrFhKoIraee8VKmTOiy0Bai9pOi+9rrvH4Q4?=
 =?us-ascii?Q?5eCltX/iv3sfqRcDsw706PiwuDhLOGJfS9/Io3nV7lXmGYNQDKFQS69i+Fdr?=
 =?us-ascii?Q?+v4eQJZ6nizdnvBrFnyXp4MEnZcvEFmkqWBuivwSKMMXXQW6Uhu6RYrSE++u?=
 =?us-ascii?Q?bIFgj0rZTaswkG63OsmtWpniCCN0N1AuRwcfe+ezzvaOz0SlUH/sUqhcFN2N?=
 =?us-ascii?Q?1moOWYfB8Ksi2TovXFQV8pouIIvkqxgjOqO4RGcdA4ZpL86JXdstafSIj1oL?=
 =?us-ascii?Q?VUOBAn2B90Cw3UAJ5dXcgaaApO+0S29doXyjP+lBJVuXAtf/zvpeKTbp1ZEM?=
 =?us-ascii?Q?It2DTetYJ9v3Mq1Wd5jet9RZklmuKc6yaBwOunBPrR0sn6pS6sLPzRQWYEO0?=
 =?us-ascii?Q?jX5eF7s7FGiak1GBNKgnU16A5tfD0GhT05sVqypHWj+HGhWbD91UlQqihCNn?=
 =?us-ascii?Q?ligwtjrPIM4aBeRB0SOdC2z4l97q3kfb1Vtx8ADcMZMs9g3NkRNbK6HWkKYX?=
 =?us-ascii?Q?RkpjkIELpDSSzSpNneodxD17/R6HEfnEkyY9vDrCrq4DXM/CEqUYa24dk0hc?=
 =?us-ascii?Q?p1j1eY8ROLqGsAEVm4oVMvfsvCCP1uCqsd6DOzGDW2sdOt8fJKmsNZehsxu+?=
 =?us-ascii?Q?I6TuYZx+laa7vILLdMcSKajmGzWT7EzJKN9CwMqlSu3njV+lZznUV2bkJIZZ?=
 =?us-ascii?Q?dMRz0aP5ne6pWGkVdC3TLJ8NUHTcCD348q2a84QEzVH0KJQqcQbYw1/omoAz?=
 =?us-ascii?Q?QKDGzADh1PLVUJ9jEEs+qcIY1NyQgmy9pt9kUNGiw+X6vR6rP+77m1jpF6DT?=
 =?us-ascii?Q?aPC9ZCY1mKM+O3OKi8F+7WMH0QrzC3M8ZbmpB2Kl5cDXvImCFJ8y+GuHpmy3?=
 =?us-ascii?Q?uRaPgQ9GnJoHoOx7sq48+BPXWAu4Rx70DzJE+FRm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ee41a-1e8b-430b-153c-08da555a0496
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 20:50:33.9958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kHh6+fTOG+rWJ/d7rDH7B3dUTAnPleJ9eQn0nsnJDrN4NPgVJ6O4NdzsVFLkKtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1282
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>
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

On Thu, Jun 23, 2022 at 01:23:05PM +0100, Robin Murphy wrote:

> So yes, technically we could implement an iommu_group_capable() and an
> iommu_group_domain_alloc(), which would still just internally resolve the
> IOMMU ops and instance data from a member device to perform the driver-level
> call, but once again it would be for the benefit of precisely one
> user. 

Benefit one user and come with a fairly complex locking situation to
boot.

Alex, I'd rather think about moving the type 1 code so that the iommu
attach happens during device FD creation (then we have a concrete
non-fake device), not during group FD opening.

That is the model we need for iommufd anyhow.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
