Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083D514D37
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 16:35:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 171C74040D;
	Fri, 29 Apr 2022 14:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKbkWkSgKIdd; Fri, 29 Apr 2022 14:35:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 17C7E40918;
	Fri, 29 Apr 2022 14:35:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D0D0C007C;
	Fri, 29 Apr 2022 14:35:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 113D7C002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F395A40588
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUAOQ-8syga0 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 14:35:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::620])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32B224000B
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAY2/U/oZ39rMHVuIF85bnv3Gm7RPPeBchgf1GxoJDy4KFEbEUhf+4atlYVqschGAOfpd0HPHZRIu9whW3sxjcM6VPpApmUkelBP5v2rMAkcKsxysv7dcT0tRT/bWRF7JeMAe8JKnFfQj6T1A25fCIK/QoTFv0tcWpzT2X0YHB+0AiRNMK//3XEJxTQT0HCx+DiK76T1v2DiIc7Svbnl4dtgekQkP+Pht1rgxor8gsC6ToV3HZGMZcnuKjr8TzL+7Rs7ZYgojBsImTDDLdTB3/ap2+IaJ6xQmId10Vk823ZOzgC8XIAtxW/iYcaInTB6Oxwge6JSpv0muuWXoLH3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toSyfbWKIbvn3nE51AskHydQik8mpcRolCngAJaJqnI=;
 b=WoLPj810y4frZhWVB9TDv50uwfYABJeTxlc/MGvnCTPatR1KVvDRJiUi9VKiB9zT8teCSFQSqTmmtw/syXIBE928g/OEZHLwtuVZQwNkwyY2gUEtM8EkL04L6/0Wtp/NBm8w9XOhD1YAm8Hu4EZNkvRcNsumz56WM1S6fItkaq/kzK08rCH8cZDDNq4/RnWVelcnjNiT7vk0lIgH9K1Q118cp+FyRm+Mx8Jl3mjv8So9lDwXz4Q6FeHa2/G3tI9lxuwKUe9/zltsyU6cK2NYqdN4t2aNtt0dPlZn7v93eV19Y0IjOYs2y99blq5M2Q9HhvkA+gKVcRZYZeWThj99vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toSyfbWKIbvn3nE51AskHydQik8mpcRolCngAJaJqnI=;
 b=Ei68k3ryDi/m1a+ha/o60G1jZL6P1/yoNcpOYx09rCQMxpXvXBedY5DpPjlwIx3YIz9yMSTLG30VgSWUEUkzPB4gWD3l+X3UJyKuVhXcgO0+i8pzsi4iAW3N7IHp7iZ4CPcNTRwx0AAVBkjcOGqfNyjWiuU+ReKv3PukeYepcC1cqcg1OFl2JJS8L+l7QdlMMdf7hZBQhPeqpxQNg5sah9LAOLGIjsPpgPeWPeIXI4PmA7KLdE96lWchTc7Uki4dXjDXT9x2R+fCrVEydHpV4JbIRnp5XaEt5uxIeqAlEC/AVBtUC6TbsJqEFXkG/pxvWyYDqz3Yggg9fF4VVyx4sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4010.namprd12.prod.outlook.com (2603:10b6:5:1ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 14:35:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 14:35:06 +0000
Date: Fri, 29 Apr 2022 11:35:04 -0300
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 01/19] iommu: Add iommu_domain ops for dirty tracking
Message-ID: <20220429143504.GZ8364@nvidia.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-2-joao.m.martins@oracle.com>
 <20220429120820.GQ8364@nvidia.com>
 <eee58121-1224-cc56-f5a8-b7b8387b9e61@oracle.com>
Content-Disposition: inline
In-Reply-To: <eee58121-1224-cc56-f5a8-b7b8387b9e61@oracle.com>
X-ClientProxiedBy: BLAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:208:32b::7) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3469e18-be9e-48e0-9227-08da29ed7415
X-MS-TrafficTypeDiagnostic: DM6PR12MB4010:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB40103131E3A1C8A5AEF1910FC2FC9@DM6PR12MB4010.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IV1MJQTrNp4p09kTBeLY7qhUuacBHGDeXNG4luB+CtgExArYbrXYXf0jVnnNJt/dsEx6o3QBTh/mbL3qHXdqOMnjF6CWzsTHzLoOlzfD4HI8nJ9diSR4YJ7hkof0R6yssoUvu3URXRIWl14h6cnI2dycmvl9NA+tswdypXPJHyQlC6JU8eJTLrqcGBKLyiZfXWmLLlcS3S9XWnbtHib75jPL1rvrqVZmXCwOGZqbdwLN9vgJKA74GHh+wPzlya6YExRqgpQ6QM6DyZm8WAUBtPp28wCelGdFcLO4vhbUoT3rUWb/wbMaRrXbmQ0Ufu3UpeWnBUgUTe60v1ZiFfnTlXg6f0blEK21m+pmvEoat4cyK+Og9sI7zIsqmBp864EG5Lq9x8Sw6oO7axHKa8NFKePQRDQhpJcDQHFkxiLF+nBMI4q2zEHTgU+IK3r6L6+4Phv8mo0KrWeB0BhTr2iexv5KAxyvGSne2yAzi0+lSlfLx2cjtKR1R/NmOlteTJQO6jT1s4qY0a0NfWeVUe2lxrCaio7SG2JV2fVFUvWqlDa1TOX3RXXf03jRbEdJGKDo0UKPe2RSDLHegnWfoxppmORnhfWIpo8B6F/rxXyso+dK4kCY2q0OyCIlJtnNtcDtawIdYhFtWWevSBAFXEwV6yUBdVcmWWp9jkZelVl3OvJs5TyejYTo4Wsm1XtONc53RwMcApfyEzov08j4X0Yl7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(508600001)(6486002)(6506007)(8936002)(5660300002)(7416002)(26005)(4744005)(33656002)(1076003)(38100700002)(186003)(2616005)(36756003)(6916009)(54906003)(316002)(4326008)(2906002)(66556008)(66946007)(8676002)(86362001)(66476007)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lkavr5BKF2MxreAIpt9Y4rctMuqXDbd9v4GZhCxHOP1pf6pg3sFzwqyJgj86?=
 =?us-ascii?Q?YAqaRH+x0oNKfrUIPjaQle3yCWjuJWHeLjpvkGFV0qtexxXthbtf4Zw5EASD?=
 =?us-ascii?Q?6OI+Jb5Hl+J3Bzo0UG6QhMd7VQuOsLvSwA7WOGuCbOOnwZwOdoviAAOkRqdg?=
 =?us-ascii?Q?jWIEZF9tEdWJ7YhE4GhCGnvXY2XZzHi+NtO5ZoC19HbMEZE9BHdHiqfFueCT?=
 =?us-ascii?Q?6la3mLhvoOhd9n/dJiFITf6aXQeafm4BtmH9YnV3BUBr/1xnEog8XcN7s1h2?=
 =?us-ascii?Q?KN0jzpsN1n//ZMXCOUTz/NwvNLyGkF25QD93WuSQbGoCzAEw7U1SbNHTcKbV?=
 =?us-ascii?Q?PFtNNjTFotj6KDLu80jchZCRyNdriUTIaKqDzNbKMRggnMGhuzAJE8fuNtfG?=
 =?us-ascii?Q?CPc0uMlnRv2GyYvRlgfGkVyZBu9Bfr2I11Qe/YXaxpFe73F/DYvwFe0RA/UG?=
 =?us-ascii?Q?H/EfbIR+HSnOfEg3fG+Pw+TiEOKPIVhp6kjhAFBQ8YLu6NAaUz3jD4TnrPLY?=
 =?us-ascii?Q?XUEKvpKe/yNtGqUbJajOQvtwLbHgQ5VtMYDtkuN6b9jxsOm9T9QL+Hb954iq?=
 =?us-ascii?Q?DYj3Yn0Lfz74asyEowVMVd5Nve5/uWvzKBmYYaR3425k4sUCB/K3TqfDS/Ls?=
 =?us-ascii?Q?QqI6r4LtZ++4P+Ldcqgp6N80xRCUcG1W/vTztlPCZykybBd7doY240lXFOFb?=
 =?us-ascii?Q?bGZERvfj15HyZJZPYAk/Yl21YEIxKYrppgdI/mi2rKv4zpi2GqChOjBvRyfM?=
 =?us-ascii?Q?gHiE0G0w96E8H2C70nTYes8wnCH/uhP0jf4X4OHdrkNM4KCOPiOQnjiIoq1d?=
 =?us-ascii?Q?YgjP6idbyqLJU+fWPNpOJJK5jCoyVFurGyMypc1/Eo0Za2qDV9d9JfKDRcKd?=
 =?us-ascii?Q?O8amEHTjkMRjEcXeXC8s0oAlfQ9ebNpRjp99hTQTK2NZFd9qfQa487AFO9Xt?=
 =?us-ascii?Q?y0JtXDDNZ0ruw5IhSZLFGwQtJt2nuAaxo7uqKYqs+UZ0NazhMi2NIT/OXqgk?=
 =?us-ascii?Q?4BmbE9grT7bgHHz5vO8MerpGCP6m+y1Ora2X+0IVSJWftdnOoZeLBVG4tUS/?=
 =?us-ascii?Q?NDvrOeA3CriwvHkz6rxnABDer4hZI/Orib10rHtI9XwcB/1jUGwlG2/kirMv?=
 =?us-ascii?Q?0LYLcM8c9lX0S9dEQEtCc0YKX02SnCjiYDY7+IhWLDFpfLD1lBU1CvagQSB3?=
 =?us-ascii?Q?4v4Fr65eMTCaPx7vqpI1pxsU/P6SmcD9uyGptjr/SDL49fQO+ouM7CvDF7oZ?=
 =?us-ascii?Q?IcPMBZZ+i1R+GOdy1rUeXuNQGoWK9Xyk6uN2QF/fgmQsFtEhKU3dt2f428Y4?=
 =?us-ascii?Q?sVQjCM2NTsJT7zUY9oDw+oKY9PzBjKJYfFvlC9P30GKHG7wPPKLoKyAn3loi?=
 =?us-ascii?Q?Xzgb4g3WVRY9R1Zz9xx/Wz9eMnxhtMAYS9+W/+JXt9r4MzHktQU5lv+lIvVx?=
 =?us-ascii?Q?hlobfMCC9UCxc9W04ocE4+NS4qL3SpNZ0SiUfL97rkegfnlFJmwJnDdDBGqx?=
 =?us-ascii?Q?RavxuW/9YUVtEsAx6I8OWi4BvCY4tMsRuoeVHjsTrEErULCzojg4WO9kWEl5?=
 =?us-ascii?Q?FYu+lq9x6kTCMe+z2wM11mhrzTUuVQgAx0Vjtx7MSKhmrzUVoUSczVxLiwD7?=
 =?us-ascii?Q?3JN5JAUG4nSMOeitQcfUZosSphzOMYhyN3i+V8ZA2KVDSmIQ4+G+j+Rujavo?=
 =?us-ascii?Q?+2xTpVc/71NO5bHIUWzd52YHPlAX/KVh5OEGhGAKbJ2kd2C8w1/NWeHx732+?=
 =?us-ascii?Q?b1Sk2IB6eQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3469e18-be9e-48e0-9227-08da29ed7415
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:35:05.9623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc4N8+uJ6ieje+hrKeV8xqp9kJm3HNEcTQwz9eqha5ahoMcxRGUZRqOZG9G7DvHQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4010
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
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

On Fri, Apr 29, 2022 at 03:26:41PM +0100, Joao Martins wrote:

> I had this in the iommufd_dirty_iter logic given that the iommu iteration
> logic is in the parent structure that stores iommu_dirty_data.
> 
> My thinking with this patch was just to have what the IOMMU driver needs.

I would put the whole mechanism in one patch, even though most of the
code will live in iommufd, then it would be clear how it works

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
