Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04A51C181
	for <lists.iommu@lfdr.de>; Thu,  5 May 2022 15:55:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FDB2419B6;
	Thu,  5 May 2022 13:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id of-jjxgFNGJP; Thu,  5 May 2022 13:55:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 631FE41951;
	Thu,  5 May 2022 13:55:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E1A9C002D;
	Thu,  5 May 2022 13:55:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A30EC002D
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 13:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09971400CE
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 13:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jmc9JPxtTCAf for <iommu@lists.linux-foundation.org>;
 Thu,  5 May 2022 13:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::602])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4CB140385
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 13:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gte6ZDetHLtyldm0RuPlZgxgXc5CDRwy2+F3ka737iXY0OepadW/w6Owvko3mORrwUf/7L3JUtUv4dywByNtbcQszVexcSyy2EWAm8H3GwlPgNvOlmh0PPYAQeHHNBqOBv7Y3ftign1Zbbtqjb6KFa08sBdvkzXHakjIxmidTvdQdPLLATVkN/L3kKGosvPYHpkmmUyPvYod+iOIurKuQLFFq8JFZheKs614ZeTFu+BPr4r3dU0ZPQWtToK4GfaTKtyuWGV4zIu0Fkh+afVxu09Mps6m5jSe26vPGzGjrL/9AI90aXsTtnH05KBWbC2Vql91BrNDNnIkoGT8DpDVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZdo7n5BDz0WG+zYafFCc0ZSxXEEXgzt5yMDrFsdAjc=;
 b=R1/z8mJSROzyB+JyG0flBm2rTbae6EkVo7lSu4HoKoTpSy5CmXgFIpFjGpp1fU06EKdaahct+sDXzNGXjOtxlCyH66VrqUVDeZyA19q+1af0MHxecQJPByKZ2xr/kx20dLpPKzVHg1xJdqNnMKG4vTCMrOXUbm6DnhxSalhge2iOjVeUl1i+i6vb/lb1t0KZ54be1HEeGNoopaqMY+B1a4WXaEBfGgPbc2cyROlya+QSXxLykcImINs7BT+h5hML4SFJipY7fyCwOGlallh4FfvbSxErEAgrjuKGQxG0xc9mx27Y7atccPCPt9MQLCu4bbdBuo5eD3hMFjGFkjY8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZdo7n5BDz0WG+zYafFCc0ZSxXEEXgzt5yMDrFsdAjc=;
 b=pOvm5DOljBNMSV+HkXGx8yRJN70gsjE/0LLlGVl2/LndTGZfatft5jRUMNl/+YttH726UoVqljEhUVSL4UK67Tm+lHeSxbqsErbPinjUy8DDe2mrzCyJU2x+N4cUjX+HEWkxSRDIuN9PXpTgQ2WUr18Y8XHvoPMMU3GVL/s1pJDGeqDzWb6V82FlFdyqRMaHQXfO7O7DcjMAWXpSpc5m/OSCCsQDgTM1ijuHQNfVGQqIKZvV4dhG21N2e2mTZYaT6tnpyjdMdYwZco7OG2YnAc8xi8PyV29JmV5zOby3rUVTM0kcP7qdH88oVRIUmK4/xKjUJC6pN3xQQgwZ1M1vvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3049.namprd12.prod.outlook.com (2603:10b6:5:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Thu, 5 May
 2022 13:55:09 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 13:55:09 +0000
Date: Thu, 5 May 2022 10:55:07 -0300
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH RFC 00/19] IOMMUFD Dirty Tracking
Message-ID: <20220505135507.GP49344@nvidia.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <BN9PR11MB5276F104A27ACD5F20BABC7F8CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220502121107.653ac0c5.alex.williamson@redhat.com>
 <20220502185239.GR8364@nvidia.com>
 <BN9PR11MB527609043E7323A032F024AC8CC29@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7b480b96-780b-92f3-1c8c-f2a7e6c6dc53@oracle.com>
 <BN9PR11MB527662B72E8BD1EDE204C5538CC29@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527662B72E8BD1EDE204C5538CC29@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR11CA0020.namprd11.prod.outlook.com
 (2603:10b6:208:23b::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b264b7f7-7403-49a4-1b28-08da2e9ede38
X-MS-TrafficTypeDiagnostic: DM6PR12MB3049:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3049D8DAE6CD63F4F78EA7AAC2C29@DM6PR12MB3049.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfBlsRFSKtosuSDOt2+S1uC2kthJ2yJzcmoITfHAg42MIGaMww+94dIzDo2/CA1Qyy1Nc2o7I0FuM8DBLHJb8R7D0dkUMSavz2uF8qayiy7bsfK9abRNbNWVNcwGFC9hmQNr8TvT8ZTUQlwjq2BKcOmjWFz4nB4M1QXI66VVtForVGiSmiGRTtgEGzrr5V3CYVInChiOI1adgBSJn8KmC90B9PV1WtbQ7OkIWLVpDe/bCCf+zLvrMQfJrif44JoSzrb5waRbzp/dWqxx8kbI5FdAFf3KKoTAa2TeUf8YykxiaQb47L3Ffjpcv9BwrBepnp+l/Yn8fgPPCiCE6sDi7+gcvyPKoc2dFP1evAtiN/bTmg5c2l8mFCj0E+asYHVDuNOjWTepyyG91nK6PA4VSVRqpYx5rYKSySIzQCRr1wJRbGG4nLikhbY4HBVZKjOhYC5DKiISDqfA88S0KtnjpvVsYWlZuhNRD5UNu/qQ3LyUwl6USShv++7JNFjRiZT4PYcN1pbWNM46z/Mx55o1aWshU07q1iiJG7wFMhgHlcFvjHlTLS8h6QEsnVxIZBzUmnc6JEOzJSxB2VsRwT8A/KdaDH1s65y2dnwdbMSZ+0VcoI+QYhXkCWEb8Evg8/SGasU45G8VaGmskD5M3GpjcizokfMSVupSOrMKXpu8UQ0jIP5ivkbHhvDA3CRDvEl30ps5+Zl3xGxBxvzZwJbXhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6506007)(4326008)(8936002)(33656002)(66556008)(66476007)(66946007)(4744005)(8676002)(36756003)(2906002)(5660300002)(7416002)(38100700002)(86362001)(316002)(54906003)(6916009)(2616005)(1076003)(6512007)(83380400001)(6486002)(508600001)(186003)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIx3t86GxjU5dPZNEiSfW19BMMKSHiTBpMq0tcfggl1ChMDFHIiSmhzCIwG9?=
 =?us-ascii?Q?Q2LAxOExbCFj4qjhIT1pi8e6zONzJAnO/XFluMwX0w98QnvzBwaIupKk7fU7?=
 =?us-ascii?Q?S1j6ScdW4gZFmMykXEX5tteD2QENSwmUH76WQjtDJpVEiev6s++8OXKfPrVs?=
 =?us-ascii?Q?x8yh4bXe/26/TZedGX4FJSrE0jFfmk2DnQ1ZqjpvLnyiyHGJmC+lLn7i+qI8?=
 =?us-ascii?Q?yTdiFe12GR/M5u6303vEVlApoBb9l+XCQDvvdUMJbiOI3r0zrgEgeF68yNRJ?=
 =?us-ascii?Q?yaSo977FUH+AUOAJQh6w1Hfs5ejFMUf4iV8FPbnjf0rwtaH2+tq3td/wa87T?=
 =?us-ascii?Q?5+wEnVx6TYJS8pG5YgJ1ExXszlUmTt+y+hfd2rwpgyNgBld2ZO7e5+LL0y35?=
 =?us-ascii?Q?Od7YIyrCPx9pxYroDkbWGZwDT+umGkgfOgS0ALg78q3atgYqn3lKk73ZkhPG?=
 =?us-ascii?Q?jJmN7GNch5P/102262IVW8fzAnwNq4DbmL6aHRGGoa0gYE8xuCaf7BUWNJFM?=
 =?us-ascii?Q?w4qIz00wH2dT/MZRfQB7oGjUdz/nCBSNtBiR3oX4UE+cDW8N9ZnKpXsDFZyK?=
 =?us-ascii?Q?Ua5Pn8q9+ER0qeY6E/pn4KSY4tdkhysDzIFehujXe3QviDAMlFGpUoimKX2J?=
 =?us-ascii?Q?n2NPXhdtu5xIanZN3VHlTwqoDoimJNgUOpeG1HBI8Cy+PS2NULJXiJ+CDI6+?=
 =?us-ascii?Q?na6RXgCsEvtJ5Dpz8rVp09GWIhntCnAyXRLrhMUFOb8jsYw8EHL854yX2YSY?=
 =?us-ascii?Q?wuuTdaY9Vfl5t42IZyuGC8XsiBz1TWVmQuAKWx5g2LgfnRWJDnaLAuZXL/Jm?=
 =?us-ascii?Q?+4vWa3Yk5WzlPwdwSupB0V/6Ix2Y8zLs80Bkng300lfBp1jNKuL+aucAJ5BV?=
 =?us-ascii?Q?ItR+3/EFLFIS+LCjRLReaZsybbyIIuSpc9C4mlNyAaWKcYUOvI3oO0W4cr0b?=
 =?us-ascii?Q?RHPh9YNuBHZ7fCpHptkb4qFiGaUBBIV8uzkvNC5S0WbAgt+QMIM1GbmrtXjA?=
 =?us-ascii?Q?MvStwOI0QH+StmHlWBTli/NSNmCXoXWjq9QSecBCK4YVu+kD5hqUBW5glDju?=
 =?us-ascii?Q?l44d1WD3XZAsGxDUGCRGipN/oxy0MsUhHLqQ+W9YpAG0ozurnZCFbR9KmfMt?=
 =?us-ascii?Q?016hzLJCha4Ts3sNP1NyGBPuLJbUU4/dG3wRo7cutIkwqSeemq9qmiSvCMYX?=
 =?us-ascii?Q?6igPW5WyTaeIzx8Kv39Xd8SFm48GBX4NKByFmEtKwPdBSEMkW5PG/1wUyWte?=
 =?us-ascii?Q?ZT1DTxcL0a3nGM2mWyTK3pCMkxilFWTUt8UYo8nle3f8xIiDluiSvGtXZEK3?=
 =?us-ascii?Q?tFBPGLAv+lvibXDORTYGrwKAYSfu0P+j3uFCQD1qzAqlmqJ/1pUvnnlw9gAb?=
 =?us-ascii?Q?OU4yXfP8TO5aCB51tpoqo5aALufUxojWcmJ0MiEZ3PabJukcjjV7w6CfO1to?=
 =?us-ascii?Q?USDgjuKLLm0pWx6vvdKEErgtwgqQjFtYUybFMlaB2tVph/tHvN7HEPIS4wG1?=
 =?us-ascii?Q?jYTbGKx0NtgWhFVQLjXYLmsqQPOECA8B1SOqOnFAtO5tzhNuLu4cJxWby8pK?=
 =?us-ascii?Q?2tBlv4moMsLfBBBU5oCdF7A4kjWSWS5PuwvdhF2PcN4F1OEESKI5CDq4ojn7?=
 =?us-ascii?Q?iNHU81UJwWiHr29usUTpMa52/0ZMX/YJk9xx+iCecsgc+RSz2Db0FbsDg1Ih?=
 =?us-ascii?Q?0XKBrjaDdwCP3mmGKOq3ksKmyyaZoT+eIWkRgyDUwikARxiirhN0a4R9jjMa?=
 =?us-ascii?Q?Hb++AYarbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b264b7f7-7403-49a4-1b28-08da2e9ede38
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 13:55:09.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvmEAWFBQ56VwT9M4KyNLkqkIpSlBo99JWmpf+RJxkhNeZKeggNlB1baX5o5mauz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Martins,
 Joao" <joao.m.martins@oracle.com>, David Woodhouse <dwmw2@infradead.org>,
 Will Deacon <will@kernel.org>
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

On Thu, May 05, 2022 at 11:03:18AM +0000, Tian, Kevin wrote:

> iiuc the purpose of 'write-protection' here is to capture in-fly dirty pages
> in the said race window until unmap and iotlb is invalidated is completed.

No, the purpose is to perform "unmap" without destroying the dirty bit
in the process.
 
If an IOMMU architecture has a way to render the page unmaped and
flush back the dirty bit/not destroy then it doesn't require a write
protect pass.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
