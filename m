Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6334D9DCF
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 15:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD951400C9;
	Tue, 15 Mar 2022 14:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXCR1qM9czOz; Tue, 15 Mar 2022 14:39:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9B32040A3E;
	Tue, 15 Mar 2022 14:39:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 838D4C000B;
	Tue, 15 Mar 2022 14:39:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55E23C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C16B160FD9
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLbwsMTDhYuq for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 14:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::609])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA6860FD5
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j727ywfAqCNe2f9v8cM48dHpwZXzhnyQZAoeZm/VVaX/cqB9CVojx8+QKU42ooi5laFrqCgHMFNG01o/VFq/J9lFBbj40Fjrhb1wjqX6uKMynC1CtZ78/1Qde8e4BcAAu1lTHTPCegl+mKftXOKWVo79nxS7iUIXjsHz5PFMyh0iMqhnlKv2yxSLd9Fv6IkI3tS6t6cO+4XXyxqEMwyOEssPrgkQQgjlGOCV8oOVW6xf2iezzlhjh5HPN/QAYphtTyFEXFE6X6oR5WmvS8ZDCYLL6+mhbiCdCaUfpeKaZzBzWYvb7K0M677SVcv4YkT2wpvz5IXpaqXKu20BFdIrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T53ifrrZ3TFU3o249ofbbE57hDCzS9ZqiBVJjyGdBWI=;
 b=FiORkkhcrlcx8GZN2quRJ+27+FPz+LALHS3qS7qDvfcx/lzXWZKDG43V7Fg1LOqowSW5CLztPVNmJFb8qaU6tqdnF9YZilSvnfndZkMd+SREQ1FkADLnHsUe3oZe+YPiq94h63Ik7eTxMfxlfgY2ZqS6pOINl7vJRvP6b+6U5/PJ3VGnmd2Ac+vfrVAsMVPM4MyqX7T3/duOKuxMNmCRuolCsmA6cXhj0sEX+y5Y26ZolM7thcHHanZzwkhfyoQbESDOkTfqroqo0mrtuc6lAJYWfNtspBwKJyNeReEylg5TCdOHP2lu6ff9nn6m45CfCynkTe/bhoTnGwWVB/XMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T53ifrrZ3TFU3o249ofbbE57hDCzS9ZqiBVJjyGdBWI=;
 b=YXdlGje2IWIClWqzZpjJpdCxqx7wgTZTqDEoLYBo3YKBm+HrWkk6iOqEQAVz/sfR6dNmThrh9JjXOJ4RpYDt6MECP8zy7PDcWJ46/BNMgGUxoEW6vOFQTgeOJShm5qdcJzrQ6Yw2XhTNLKKjTIGZQSmg1aNbuKJ1X4jxxZ7Ptw4uN76uIduKwpUwg2IOMOf/Ni8ChCVWlcBX1Tvp41/VZAS2z6RHye11Jaz0yLmZH7/v/H7lvYGrpCVaeoCsQMETe/chuuggsxgElJ8wgNj/yAq7L5VWVG3BxAKAUd9KmVYbExzKJ87nXwJhXPbUxmLKfOqZAByQNVmy2A0MgvICLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB2957.namprd12.prod.outlook.com (2603:10b6:208:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 14:38:59 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28%4]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 14:38:59 +0000
Date: Tue, 15 Mar 2022 11:38:58 -0300
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v4 15/32] vfio: introduce KVM-owned IOMMU type
Message-ID: <20220315143858.GY11336@nvidia.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
 <20220314194451.58266-16-mjrosato@linux.ibm.com>
 <20220314213808.GI11336@nvidia.com>
 <decc5320-eb3e-af25-fd2b-77fabe56a897@linux.ibm.com>
Content-Disposition: inline
In-Reply-To: <decc5320-eb3e-af25-fd2b-77fabe56a897@linux.ibm.com>
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9ae89f-bf99-4c95-6f1b-08da06918aa4
X-MS-TrafficTypeDiagnostic: MN2PR12MB2957:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2957EBB87771B0A46C678711C2109@MN2PR12MB2957.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsvxlG5REqDVisZLyOU2pW+XMWEaL7h/V5lrpfrm7LQjZKFPNYEbDB47izNqkjfT96BfhhsH9fOlj8E4YsRlrR0F50uAgpL9dUkq24oZJeu9WmmbJWasQQ2k99Oe5N+v2sY+G0P2QVKLUpBY9UuRpfRjVo3XbTTNEc9hUQekUWFkrDxpIpAUwQmtGvDmQRrbz+w44S7MDJ+AevcXrf2OyH0DJyVzNRQb9s9BBU6QE84BvQjBjdA3XcUQd4hjdCLP9S7zxbSbmtPqb9W3RXH1aAehsJQKtVRWmTXIugBvartvqu8SqECjZKWKSrfKdNELTE3DVdYZRJr1w8Tlieazwwl10esKJuzJNnCTV5dbx3SrWqXtzQCZTpjgp17jmN3tozqWFYhGRdv/1l/dQk14zgXDw1PiXZq9tDTlQ4XomgB+SX9dyALZ1Ob0ATZU9NMdOLHObMedLPN0gN0BEwSSIHnZPvVtjp7W0FkKwKhG55zUxi6tu/Kt6KE+n92u+PTnMg0RKCKKMd+9Paha+15ilsRpOwpJhLZ6AtI6lFVi8lBZFh60fYM3uh6f0dSTXwXTNHgMCa8ed3KxY+AUe6XdyEsnjpxJLkRFOcjMfVn47yRYVLuGbYRPj28mLJqQZ8GTVGrbVm9gEeiunUBQzqj9tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66556008)(38100700002)(186003)(26005)(86362001)(6512007)(2616005)(1076003)(6506007)(66946007)(508600001)(36756003)(316002)(6916009)(33656002)(2906002)(6486002)(7416002)(4744005)(66476007)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNLFrO4VZZiZnzRqMEriaQCQIwFsShbrrMr2FQ+QwC42avm2YXWCLmMnvLO4?=
 =?us-ascii?Q?I4YV/MapRxCqE2OfD00jSNTt8Y8FdlTsvU2G0xbiEw+s3gOF2Ewvd0nnG8tk?=
 =?us-ascii?Q?P/iAt2z6Go9shug1/nZUI9mEWJH3U9e0y7rjHuCzOu3eu7QLDdv/p+cmVeDu?=
 =?us-ascii?Q?pSqqd0kMjLwTiazLft7Zx74H/54fMj/NEIN14mmwB7GRnXLvshDH6m0vQB5D?=
 =?us-ascii?Q?hy6gRmCxTBafwyivABwp2E+PMAg5qmvd6g83g5wd/iWWFswOHB9uJ5vRNRgb?=
 =?us-ascii?Q?7LaaXDv6x0qMyYHly3kyKzkOBX8tkbIH3b92cz9mA+ZtXO+NBVkSANfstXi6?=
 =?us-ascii?Q?z81kh9VRUx3UcZ2T+Rf5f6CZrQMA+MOpLH9zTCCieUPgPYlKGFCpz6uFwACu?=
 =?us-ascii?Q?dTBjRRb5Aa9RybzR/JCUeXwF6eKtD6+SJx2dDG089BpQJNNITkTmxVfX7rY3?=
 =?us-ascii?Q?Q4IU6Od5WDFMGg5RIkyMUeSwW/AZ1NX4M+TGiwP2rsyvuXWdTeCosWfWpIxd?=
 =?us-ascii?Q?XJjr8g63aXFsmt9vzq6if8Ojp3xjmHRVsoEQAwNtMps+6zWfDBxL1RHWwreC?=
 =?us-ascii?Q?+PN798LV5Eq85gB4kL/ER2Z4Zz0k228ygx6HJVNoqYmYSbNGVvXwvLX2+IIz?=
 =?us-ascii?Q?x9pkDkLzqrswuW29jGnL6MweTHqeRJ0yIRhyy4NO4Pu/BGcWfO32QazkPcWe?=
 =?us-ascii?Q?U317Y/bETESCXxEEWPCI1ADZiFSWFXBtOWLTgbz36hGX7NI7c3WxqdC51jeh?=
 =?us-ascii?Q?mTEOd5AFDM0R3F2KicfSdvwJ180LyYDHCSaVZ/DlWAf4A5wiu0TEfV1tnQPk?=
 =?us-ascii?Q?K/wMMp29ba5oGDN1wWV/i19Tmb2IO5AyXdXDJZIT/kVOnwkpLDutjrLCkz7j?=
 =?us-ascii?Q?aiS3dRe9rrxNXS4Q3I3GudnyjvxNM/2SD8gZzjh7RldtxJuf+id1nsqQ2nG1?=
 =?us-ascii?Q?fPX/LMq3Y8DVx6VQQDtMRdLj/txs82DYmMkHujc5PwxpCDmP9aCtI8YZ5m7I?=
 =?us-ascii?Q?yzafZYh0YWCg9D1r2++XxWoeN55aNOs3d2N+FKmYoCo4LnQO8VvHOfsRa+tO?=
 =?us-ascii?Q?iyOFnZevIYhPXSnElbbUDMDOpb8qeq9ZRjbxIZ6NqOJ1ydLrWN+NXTodxga3?=
 =?us-ascii?Q?bKJIm4+/Ubdv3k84Ss5E/1CAdujC2IOqj4xnhJzp4EKj6UqWRzn50F8BsT60?=
 =?us-ascii?Q?CkyhaxSujF7yPhcqtnHVXlQeDnw0hi+qvRtyYFaieLPwPSu9MGgrUXDsZYLJ?=
 =?us-ascii?Q?ER3bk6RFWHpexqQ2QFuuwQvCBVE/3bQEy/F2AMJL3X/jG2GW9dN8GsoaF6Yp?=
 =?us-ascii?Q?C1YIN4YPF9EvCK94de2QeqyGNJBpQDasRWcl7S5axUum+geLY3FWq8GkMuMX?=
 =?us-ascii?Q?dYldXJzSZvIBeFT6UlhCTuWSYqDalQS83wFWX0+plmuJuPYTmAB2x5pSdZ/I?=
 =?us-ascii?Q?7keL4A8AXrtsADF9keOO811Th2D43+IB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9ae89f-bf99-4c95-6f1b-08da06918aa4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:38:59.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kFSrRY+UxUMTcejoABIPYTfYn6CpAIysUNDgs2aEqjfpi949C4Yn8YboPDxVSrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2957
Cc: kvm@vger.kernel.org, david@redhat.com, thuth@redhat.com,
 linux-kernel@vger.kernel.org, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 imbrenda@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 pasic@linux.ibm.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com,
 farman@linux.ibm.com, gor@linux.ibm.com, schnelle@linux.ibm.com,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 pmorel@linux.ibm.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 iommu@lists.linux-foundation.org, svens@linux.ibm.com, pbonzini@redhat.com
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

On Tue, Mar 15, 2022 at 09:49:01AM -0400, Matthew Rosato wrote:

> The rationale for splitting steps 1 and 2 are that VFIO_SET_IOMMU doesn't
> have a mechanism for specifying more than the type as an arg, no?  Otherwise
> yes, you could specify a kvm fd at this point and it would have some other
> advantages (e.g. skip notifier).  But we still can't use the IOMMU for
> mapping until step 3.

Stuff like this is why I'd be much happier if this could join our
iommfd project so we can have clean modeling of the multiple iommu_domains.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
