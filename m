Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CF361379
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 22:29:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3DB608B8;
	Thu, 15 Apr 2021 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_p6R-UvjlT8; Thu, 15 Apr 2021 20:29:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3DB608B7;
	Thu, 15 Apr 2021 20:29:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C1AFC000A;
	Thu, 15 Apr 2021 20:29:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0FD6C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1C90402F6
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="A8rR+D0F";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="Fs5ibvo4"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D64FhijqztoU for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 20:29:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B19B940242
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 20:29:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13FKJU20066894;
 Thu, 15 Apr 2021 20:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=j65uDSOqi1ViCyk4CkctHXFYOUTcowaPLtPH0xVO3DY=;
 b=A8rR+D0FKBzUVLIDw/sfz6eXOBT2mqjZLMpivkeXvV7+MYCplzi7tkSnp7YSB7kKb5vv
 z4GA1aEM7hBbaiW6Mo1XanUWrE77TWWoqICNG37KZNgWiQzGEOu8FCTO6RI5qzYLSUdM
 sF0CWIqS5ZaHYe3aViJL9ZtdErso6TlXye4hUT68zzzHXSUuw8Y934N+J2glZYp10URQ
 IR/SVNHmapcoNcx1GaMlYxec2Mvcm987C6nrSaSydOyviAEz20WxivStQAOpQpsARxjw
 d4y5MaPKO+J2e4PzVcKwMrC79p8qSuWQzcEPf7vuDHkVdfE2wsGZzyD+sIEeKCCzthkk zg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37u4nnq50r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 20:29:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13FKQcgl130223;
 Thu, 15 Apr 2021 20:29:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3030.oracle.com with ESMTP id 37unkt5e7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 20:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTkvLA0o3qKM06me6bC3H4Z2zriaXEJj5ULY/UhINNeDcDdXC1Bf76UtoD0NfUALP3UCXg3vRhrl12HnY4VoRy8r4Fee6WZYeSpmi7c3gjYA5Os0Lu4GsRkl5IxnS9vizCnFzQ4GI4iNogEfU/gmOpYgalIn/KkPtF4KDlKQ4+YJs49Ch4/TIGg6Hgf7kcZ8WCsrkxgpBh52PCi9QGg/Irsw0QahpHUw50ZmOsHhLN+WvPR7sTJg/gBs7COTJa9vAA6oA7qu+DkaX9tHeeVuHOmPMsHd9wdcqJse+u3mnuT3ShX7sA+7LNBApqvsydBmk9LjCyLG1cvHK+npo66hCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j65uDSOqi1ViCyk4CkctHXFYOUTcowaPLtPH0xVO3DY=;
 b=P/Q1QryWnZ1nJCbzFp9eRtRdizLXMM6/UkPiY4uJYtXu+xa3ipNoUQ+hBQGUWf30ROl3LO+qeEbsBjcVUbAevdKe8fRcgMm4ueEVd6lZdJM0C//9iuAozjCbeokHvpPRYnWGhKYGGpCFf/Yhvb23bIvBjZdRCOgCxvYkc/hTsCFdiEXWQk/+eSAhP61zK8a8nXI74kLjNmLl+dL4Um3cy9Uy61npO8mzYdJ84Gidq7WtfX+XieDgg4/c1A6rjMTS0rEy4lfmmKB8GFR93Oz+OQfZmCr49mDnvwIlPUbH/xp8CqwEAN4BxeE6jgqJDHesSWPpNDDxQFAxhbLlJIJD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j65uDSOqi1ViCyk4CkctHXFYOUTcowaPLtPH0xVO3DY=;
 b=Fs5ibvo4em7NEtqpZjX4Nj+tfUEikt1Wjq/31Sobd2FU4tSgSddo6mAdhZ4qCoJBuFKLX3R650sobQynzX3+w6OEk4nuz1koyIK5OtwIFgnf6NWDBG3M5AmcocSJCnOn2mAPG2BsBjxhcWUUZBunNNDgAnwVJAsmASTgLeyPblg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3733.namprd10.prod.outlook.com (2603:10b6:a03:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 20:29:00 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%7]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 20:29:00 +0000
Date: Thu, 15 Apr 2021 16:28:48 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V2 09/12] swiotlb: Add bounce buffer remap
 address setting function
Message-ID: <YHiiALogMcdYDue3@dhcp-10-154-102-149.vpn.oracle.com>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-10-ltykernel@gmail.com>
Content-Disposition: inline
In-Reply-To: <20210414144945.3460554-10-ltykernel@gmail.com>
X-Originating-IP: [138.3.200.21]
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-154-102-149.vpn.oracle.com (138.3.200.21) by
 SA9PR13CA0012.namprd13.prod.outlook.com (2603:10b6:806:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Thu, 15 Apr 2021 20:28:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2be517c-c459-42be-9646-08d9004d1a15
X-MS-TrafficTypeDiagnostic: BYAPR10MB3733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3733B7DA67A1A5D69A7CA208894D9@BYAPR10MB3733.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwaINjnGCJI2Wupy4VEQSO2nkR3K/HODQ4swSraejATXkcYz1JHhAfQGbI1nQLqdPk2Bv95P28Sn73SedJ0SX2vMTWfRd76qTdwHZZAHrkksf3pJ4WpSoKLU8/Nv8KkWcjHn4un6L54SbwgpbxezOvmoW58tb090e3xEVNm5w+0D6DJ1bvOowvr+HFs9PR+vV655+7CIYMjhmVuLshQ22O3MH/7YDL1OI5PgfyKO5SOqexnVp7/ADYIwv0iguC1LGRD+zA9PQLry5QjgSDVqiQqArrN/ylpePfR2wLDVXH/qJmISBtMzCsEKBvF7iyGhFktOv2BVHgAoElED/NKSGetjJNmX+jCKthOBCd4Lp1cknppa+8ywRd/eG5MRy91+GfVRYQ9S38F3gydHAnWf7jYdY44Vqgr0bMFqWkL8zBKKPh/5fkZQbPD8/6CMIZtVz7fC/FHW66mtIXmQbjkQ8h6PzLAb8fQdACD1gKz6K0pufRvnfoRVJKBBBJUhslwdMXa7j6poqAfgF0HXtjvET16gmslOKA36fgMhi6MDyn5goQ/PiMB/5dufKEvIAQLq8fQOHAf8ST0PV5+cgWNLYwDP7SRko3ce8ee3LYbX4aDC+zpLRIt2M05VY+zWVSN6dRUhAPTu1Bukc/S8nc69hG6ZFEWj7UJdwl+eHat52Q3ElwpDqzN+kmFIxebUqGyw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(66946007)(66476007)(66556008)(7406005)(5660300002)(83380400001)(2906002)(52116002)(7696005)(508600001)(6916009)(316002)(7416002)(956004)(45080400002)(4326008)(6666004)(16526019)(26005)(186003)(55016002)(8676002)(86362001)(38350700002)(8936002)(38100700002)(102196002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DtkVvyHDoO5TyfgDDWKAQ5bEc7aXmzBzBZE9qsZMF+zTK4q1ejhuW6Sgf+Zf?=
 =?us-ascii?Q?LCsgjKUu2DEtolbK+oYCdod2XN4qSsCzWzWZKzWK8dG4YRaPc0Fmn18LaHfu?=
 =?us-ascii?Q?J8ZaDc5YCOEqVDCKL296p3On+ASEno8TBqbw5LKYsWJuWulym16ISQvqGccd?=
 =?us-ascii?Q?deyEGBHZ94LOc7Y7YKOYs0Ni6DMXS9YEJnwuuDvI5KQRAY5HHRjEoDb7zJVG?=
 =?us-ascii?Q?0sG32jJiD+c3vR3dwcBQcyw0sVVWMrt54ETp7ACjHvpBdE8S4eqzQTTaHXfZ?=
 =?us-ascii?Q?/KPnTvGezJCF6iM7J9Ux+yn67ft6qFzfkghgNyeNH1NN/NIItYMUeRFLWac0?=
 =?us-ascii?Q?uIqVObwz3dTL+0nbAdWu4Ywon/wLnWspInnnh/1g6WzgtaIF1/Jmng+nCbvM?=
 =?us-ascii?Q?wJNWKbEQYpa8ZrcWXhxBZdUkY4sn/5tbSTC7mIRT2YjSG6NyJWIwkn2tiU3Y?=
 =?us-ascii?Q?AUo/krl8R7HzVzUXAMdj3KKfd/BcfrpjjPAR4LhQV2dymgEwuJElIXX2cGTu?=
 =?us-ascii?Q?ME+kzI2/z3q+GMdF/ZxuNcClE0rH/y6D/E3Xqkm0fVt/qSWzdCny+4Jq9gQY?=
 =?us-ascii?Q?bKkfCnXNtHHPITztgAhQMOYav5lE6MAgnaF5tL0lq+b2tcTj45RjB+QjjV8o?=
 =?us-ascii?Q?16gS8RVgWiVH+saTybIRUIlJzrFppgpFXkV/FcKr8Kh4xsjlTiHpWxLmU4+i?=
 =?us-ascii?Q?4c4aiVT6j7u4Lh/3etV98QgzNmMBtK8Q05s/BQ6k7NJv6TqKCxdy3iWenD4s?=
 =?us-ascii?Q?B82xy5aziFusEHAntFtoTNFW1sZ+EB8mDqIQNAEqahjfKV077zwu29pdktKS?=
 =?us-ascii?Q?CMiDIxU46F+RSwizR6kZG687IeWjQc0XnRuJDfO8NOgnM2IPPwA2PcfK57hp?=
 =?us-ascii?Q?ypYZkea01wWzTtEE5OgWKIsuz6B9oz4Buz6j7efl/FgomOZC9uPXJ3AcyCzb?=
 =?us-ascii?Q?2rE+I0KyWU8WzscIYXNNT00WfPJ205YsEdwSiDTFqeqV5vBJUxPT600Au4PW?=
 =?us-ascii?Q?Tzsc4ybyHn2eFide8cSGQ34MzxSe24echZJ61ivITKHVPC7iAErTsTKLiek7?=
 =?us-ascii?Q?cEYDj5LanOVtJm4h8SZMC9abd5DXGMk89tSh70Tr8G0tv64sjjeCYlNIngsL?=
 =?us-ascii?Q?UVGMs0Cs7WrxCRX3phrXLOjkS3nXHJR8xj8CfOLPxRuk7Vxl4+gc95+IsjIR?=
 =?us-ascii?Q?e8rXKQ+7Ivtqk1nJVIzaZsJLQo4XSA8evY0dLl3Bw/8JOb5BzKlvYhsYmetO?=
 =?us-ascii?Q?SOQPnmzNc5ul0+3A09lM7sAm8ILf0pri46pBX+khPR4qD6moi+yjNQ+rC5rQ?=
 =?us-ascii?Q?pFAbQWy7X61yHjNqisX1KCIS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2be517c-c459-42be-9646-08d9004d1a15
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 20:29:00.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6vcUJ74ZZ5COtBvTz5Kb6GIEgNB+5u9eKIpmE6DnT6Zu8prHV3XMhHbSoGY+cAy7mwpYLEwNXJHoaYJI5hCkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3733
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150127
X-Proofpoint-ORIG-GUID: 2twAKbrCAHJzc_HSiIvgWcdX6LCO-AYl
X-Proofpoint-GUID: 2twAKbrCAHJzc_HSiIvgWcdX6LCO-AYl
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150126
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, haiyangz@microsoft.com,
 bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Apr 14, 2021 at 10:49:42AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
> needs to be accessed via extra address space(e.g address above bit39).
> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_bounce()

May? Isn't this a MUST in this case?

> needs to use remap virtual address to copy data from/to bounce buffer. Add
> new interface swiotlb_set_bounce_remap() to do that.

I am bit lost - why can't you use the swiotlb_init and pass in your
DMA pool that is already above bit 39?

> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>  include/linux/swiotlb.h |  5 +++++
>  kernel/dma/swiotlb.c    | 13 ++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index d9c9fc9ca5d2..3ccd08116683 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -82,8 +82,13 @@ unsigned int swiotlb_max_segment(void);
>  size_t swiotlb_max_mapping_size(struct device *dev);
>  bool is_swiotlb_active(void);
>  void __init swiotlb_adjust_size(unsigned long new_size);
> +void swiotlb_set_bounce_remap(unsigned char *vaddr);
>  #else
>  #define swiotlb_force SWIOTLB_NO_FORCE
> +static inline void swiotlb_set_bounce_remap(unsigned char *vaddr)
> +{
> +}
> +
>  static inline bool is_swiotlb_buffer(phys_addr_t paddr)
>  {
>  	return false;
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 7c42df6e6100..5fd2db6aa149 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -94,6 +94,7 @@ static unsigned int io_tlb_index;
>   * not be bounced (unless SWIOTLB_FORCE is set).
>   */
>  static unsigned int max_segment;
> +static unsigned char *swiotlb_bounce_remap_addr;
>  
>  /*
>   * We need to save away the original address corresponding to a mapped entry
> @@ -421,6 +422,11 @@ void __init swiotlb_exit(void)
>  	swiotlb_cleanup();
>  }
>  
> +void swiotlb_set_bounce_remap(unsigned char *vaddr)
> +{
> +	swiotlb_bounce_remap_addr = vaddr;
> +}
> +
>  /*
>   * Bounce: copy the swiotlb buffer from or back to the original dma location
>   */
> @@ -428,7 +434,12 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
>  			   size_t size, enum dma_data_direction dir)
>  {
>  	unsigned long pfn = PFN_DOWN(orig_addr);
> -	unsigned char *vaddr = phys_to_virt(tlb_addr);
> +	unsigned char *vaddr;
> +
> +	if (swiotlb_bounce_remap_addr)
> +		vaddr = swiotlb_bounce_remap_addr + tlb_addr - io_tlb_start;
> +	else
> +		vaddr = phys_to_virt(tlb_addr);
>  
>  	if (PageHighMem(pfn_to_page(pfn))) {
>  		/* The buffer does not have a mapping.  Map it in and copy */
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
