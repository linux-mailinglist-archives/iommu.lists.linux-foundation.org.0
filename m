Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EF3C7A76
	for <lists.iommu@lfdr.de>; Wed, 14 Jul 2021 02:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C95960905;
	Wed, 14 Jul 2021 00:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhfxLKC6jpOS; Wed, 14 Jul 2021 00:15:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 832EF608F2;
	Wed, 14 Jul 2021 00:15:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 497BFC000E;
	Wed, 14 Jul 2021 00:15:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 257BDC000E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 00:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B360401D8
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 00:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="OCESkwgq";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="LaGwn8Lx"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLXUD622eyti for <iommu@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 00:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEB64400D8
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 00:15:17 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E0BBXi025873; Wed, 14 Jul 2021 00:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=WQMe8cxBDBjvWlR6Mys1FIL/vDdGCqW8iUhlSVxFSDI=;
 b=OCESkwgql26LCCMuJg8nhywPPQcI5v0CUTn07b4KFiQTmpTkC6HPqhc8cJ+nkI1JCgxi
 gryWtlBIzP5dltxtMTbO3seSCnmxDs09NY64F0XwpsjviMBX8jBXxSSqqA1+PZ7ok+4K
 sPQ6PRV6KI8uS9PKv8B5Ci+qcmpdq5Yd4HmuiqLagTWiY5zeMTcDaaGIcTKoiDP2UiuF
 0144I20mE9JfqUaZr9t3JcR9iDlLiguCsEbuDSM8DnMBqTijbDzEtb771bMo97iACh4P
 Mix+4LKRq6GvJtzdibXWTSLwpZqiCQCX+nofkZO2Dv/fCkOKxpvDwIpkLwuZF0acB+TP Xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb3ksh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:15:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E0AwwA015456;
 Wed, 14 Jul 2021 00:15:14 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by aserp3030.oracle.com with ESMTP id 39qycxnaww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVH2p4sFCeLeRcWIv0yo2w0o4M5i1WlFNcG/zgHQLqb9jOaLG2Ewhg5UhZrifPie7kUOPabPeBOXeUbP3YkyxLtUC/98Wlj0sxNWfdT7IdtEiQcuPlCNdqrVFC/pxG7hEf8k/+GvuzyAZLm/f9YUn7UmYjHRPWlxOjZXhxoUfaHGzIawhSts/uV1RH7VOvyjWmOCeljRiJ6bXi4CVXxPQ1c6M/b7hG6HYpE1vnik3NfFtIO+X1m2fUZP/aVUcojgOtCR6ynfcfdU3yNWyHIrXrdRAq/7WuytANzHuA/WWC8CLccMc7f2euEofHecmF5eyxojeynTBDkX7Ld9ZssfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQMe8cxBDBjvWlR6Mys1FIL/vDdGCqW8iUhlSVxFSDI=;
 b=K5MzG7ADifiMtwTKi8lmFzTPrSNxq2Qo9aLSLQVoBiCYgQwkT9V0GFouuzlWBb8AJzltOnsQykNvHaISsVLpABdDtqU61lU9Is2Ni5klZ+iFHPnmLyVZqKOUBAucrcCpoe41pWjNf6yDROfynRV7j8g3yPbOEHouma0jlspFl4or68/9d4/uf1YSliZ3k5Sl4teo49YkUGpnVP3BNi3aw4NX9IEoZ7+f3evRPbztFpOM/8jPQmLlp55+ULow7T53MJJ8teFheY2Yzynjf4Fk36MVjEl/+ci5irrDaI4zKhihdj4Dns7l29ho06iIqiQfeQavcKGbepESi+FbXpu5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQMe8cxBDBjvWlR6Mys1FIL/vDdGCqW8iUhlSVxFSDI=;
 b=LaGwn8Lxl3kjcZ9A0mqh18UpCznj648MCHnVFAcqDWXiuTnK/NxPLQpNyeSDbfI7yw88stDKz6qXXqd1fvzPQ82Afq+PkqtWW2oYZBvDO8ByDZRtua/ogEPBeL9PMvgRWkU66Q5jekq9QGJzhL3oh1/TJd9VBZV22zH6YwQ4pMo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3733.namprd10.prod.outlook.com (2603:10b6:a03:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 00:15:11 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:15:11 +0000
Date: Tue, 13 Jul 2021 20:15:07 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Roman Skakun <rm.skakun@gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Message-ID: <YO4si0to/XYximwM@fedora>
References: <20210616154436.GA7619@lst.de>
 <20210622133414.132754-1-rm.skakun@gmail.com>
Content-Disposition: inline
In-Reply-To: <20210622133414.132754-1-rm.skakun@gmail.com>
X-ClientProxiedBy: BL0PR0102CA0032.prod.exchangelabs.com
 (2603:10b6:207:18::45) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (130.44.160.152) by
 BL0PR0102CA0032.prod.exchangelabs.com (2603:10b6:207:18::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 14 Jul 2021 00:15:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b59f7ce4-26e7-4932-510e-08d9465c721d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB373356F4950D36E3F60A71C789139@BYAPR10MB3733.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjnHpK1WThdaq9Sb1h0jSXXe+H8yW5djUSXBOGr3Euap/1gehas6xsx6/9rD2P4sX9/54pqqv2L7jvY8KiJfD42hQ5fzO1BXZy6yHxxuXEMFuy4Qcxvajvy3ZfPNTLVgeG7DD8nxbl5msHiZmBknvePRHW1pAQ+ZArLxy2oqOy0infnuFA+C9aYirEDe5mwHQTkzoxCIWfr3LBSJxydHrnZXfblWJyIyvKVmDuMHzeiW4hJMWlq6t+S15JAQdG4NVuywS0JXfsjM2ilNYWBqfRRQqh5taBZu//CjYznE25gbMJZsPiLjR+hxXJb61afTMPLH/wa7fJ8sXOlE0fneZCDzWmht8qdx05cfPPnMaPoDmrnMxa5+v6hRwKsSXp4zIJAlh6QyMpkj1Q7AHTZ0/IJFkLw7X2FRIlPRsjkGIF09y6DRJqA72z1ywMftZ5QZN/f5hfg79Cf81me9Xjx4xWLmpkysdWp9hhOOMO6uNGVFW/zm+talf/8u28qjVicnJQWwtzjqfaHLxFb1rHyVDzxpmJe03La5WKievCz1Ex+UhLX3xEt5XG5sI9ZToBB3+jSjOQZIgcv2K/R4rIZB5zhEm5eEvL/DCgkrBRCIE7pO6aon+4JUiWTCD2pQ5LAv0qTD24l3YR08xgOBWx7e1C/D4kSZJ8K/aNYCFh8sdHN9ep5XGUy3OAKxdN+bEbGCy8BlDl7YR+29hcA9LiVQAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(186003)(316002)(2906002)(8676002)(8936002)(6666004)(66556008)(38100700002)(33716001)(26005)(66476007)(6916009)(66946007)(54906003)(52116002)(4326008)(5660300002)(6496006)(956004)(55016002)(478600001)(86362001)(9576002)(7416002)(83380400001)(9686003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mk2Z3lWCjur9fjoKdKhkq1037NdTgBJ8bEHfxSZJYOH2JaavmfxMo7sXLqce?=
 =?us-ascii?Q?6UTNCtX5tcpfoP6moupeQecJfm6PO+yOY9DwNH/K0KPO4V6j+oIBC7UkykWj?=
 =?us-ascii?Q?hVVsE4Bmd64PbMtIT2VtJfzxsrDhmvveuJBqBBnCfCgQ957b6czCfdvQeiUI?=
 =?us-ascii?Q?wDqrwsugQSkVdVlk5mXvqySFR0I7HREnw1uDOKEIfmPcRvI9aRNJQUpnKjlA?=
 =?us-ascii?Q?uAnKhtq/hXNhY72sYYOu+GeT5kWzJpImlbaBhTos1qS/k4k78SWXwk7PWVhb?=
 =?us-ascii?Q?vWV5uWgU3GhW0y4ORQJUU06HhBCcqRVJc/CENKf73eKfYvltTmmBksh4H7wa?=
 =?us-ascii?Q?kxB+3S+x+Z4C826fqdzv58h/S3x6qV1mJQihn1EkGHwzRKcjCVY+JDjZbjBW?=
 =?us-ascii?Q?gzSUE64IajGfloHBDa9ROIG4ITjL8QhgArmH+M55GfZEcP3Rg0PKD3rr1ISl?=
 =?us-ascii?Q?h63UrrDTM4LGNac9hTsDSqyv+zKkRqGwg0TZZ9eGkVXJI2IwpIAw/UGukhLS?=
 =?us-ascii?Q?skwLNcj4Ymq7tN8dgUX7jcUHWmstafvoZWOERmLio6Vhq7y2BZ8ZpERS7D2A?=
 =?us-ascii?Q?9uyYYYPbStavXGVfHr9zYLk8QL4jpYInhIqT7zY4Sks4nc89BFiGw2iTmxU0?=
 =?us-ascii?Q?vuh7TLv9D26QVwdYkZuAtmp2MizKRVa2L9FMxXD2y8AJDnClGmmp+tzz745o?=
 =?us-ascii?Q?TxgEh0m+DugvBG8wxpwu4FzAFbaPcS1RG+7rWQS6Snceu2a5//58Mng9Edxh?=
 =?us-ascii?Q?CCmdBF/CkU2ASqoMju/Zx+qU3SPoQsiYIeiwF7SlLdoXQgpxVDGz4txg5BxL?=
 =?us-ascii?Q?GoODGY/c4EGUvOUFfMztp9NyKiS62tPSX+sSRGYNoFq8LZqh5iE3WIrdSP8/?=
 =?us-ascii?Q?lKFI9kR1rF3BOS0VRGV6IIKR6/0hF2uVd1Rm9sc3JZXpWsZkW5fsFlMFB56y?=
 =?us-ascii?Q?NfQipg9medhrclsGMhmsEQkfSU3NoHjUtrMZHYVNnmfjh2PS4XkK7BIQKLFQ?=
 =?us-ascii?Q?jyL8+Ch83Gk7AemKyY4O4u518GljQREYf1igMXR0LT6I2Z5pZFsHBtiv2Xhm?=
 =?us-ascii?Q?qpDoW4pBOFHSOsLVvZ3nyMUo+D8eFChaToqRgEe/jSQDEfpRZDli8+NX2W5G?=
 =?us-ascii?Q?x4tEPcUQyBRvRw1ONZZ2qiXClmmp6tu7AOscvLpFMIsY83S02pB71IRwrUmb?=
 =?us-ascii?Q?XnKc88Z60PkeZcpmw6lb0/BZ+pN1istun9cQS8RE/XKEcoY9+Dy9AULATTY8?=
 =?us-ascii?Q?kxRxbKY6++9uobm8i1SD3ChwvT6gQ846jmnzP8e22+reKHDjcN2ZKReXPf9V?=
 =?us-ascii?Q?xa7HcGgj08FEwcXV2ojiHbir?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59f7ce4-26e7-4932-510e-08d9465c721d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:15:11.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1nfl1b5cnrqXRriiI+l5uq+KvKwuhNKm9BOGzC6lOpN+Z33eNcNEi8u7XwM5sr5Y0Udiy6uCestWYIWcNX9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3733
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130148
X-Proofpoint-ORIG-GUID: d74-teT1IVuI8AP4KMenCHcngSLjVCvo
X-Proofpoint-GUID: d74-teT1IVuI8AP4KMenCHcngSLjVCvo
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, Roman Skakun <roman_skakun@epam.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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

On Tue, Jun 22, 2021 at 04:34:14PM +0300, Roman Skakun wrote:
> This commit is dedicated to fix incorrect conversion from
> cpu_addr to page address in cases when we get virtual
> address which allocated in the vmalloc range.
> As the result, virt_to_page() cannot convert this address
> properly and return incorrect page address.
> 
> Need to detect such cases and obtains the page address using
> vmalloc_to_page() instead.
> 
> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
> Hey!
> Thanks for suggestions, Christoph!
> I updated the patch according to your advice.
> But, I'm so surprised because nobody catches this problem
> in the common code before. It looks a bit strange as for me. 

This looks like it wasn't picked up? Should it go in rc1?
> 
> 
>  kernel/dma/ops_helpers.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> index 910ae69cae77..782728d8a393 100644
> --- a/kernel/dma/ops_helpers.c
> +++ b/kernel/dma/ops_helpers.c
> @@ -5,6 +5,14 @@
>   */
>  #include <linux/dma-map-ops.h>
>  
> +static struct page *cpu_addr_to_page(void *cpu_addr)
> +{
> +	if (is_vmalloc_addr(cpu_addr))
> +		return vmalloc_to_page(cpu_addr);
> +	else
> +		return virt_to_page(cpu_addr);
> +}
> +
>  /*
>   * Create scatter-list for the already allocated DMA buffer.
>   */
> @@ -12,7 +20,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
>  		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
>  		 unsigned long attrs)
>  {
> -	struct page *page = virt_to_page(cpu_addr);
> +	struct page *page = cpu_addr_to_page(cpu_addr);
>  	int ret;
>  
>  	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> @@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  		return -ENXIO;
>  
>  	return remap_pfn_range(vma, vma->vm_start,
> -			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
> +			page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm_pgoff,
>  			user_count << PAGE_SHIFT, vma->vm_page_prot);
>  #else
>  	return -ENXIO;
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
