Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4704F6F37
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 02:32:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAEF140BC1;
	Thu,  7 Apr 2022 00:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1Uj4bb1YKEA; Thu,  7 Apr 2022 00:32:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 03EF540BBA;
	Thu,  7 Apr 2022 00:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B856CC0012;
	Thu,  7 Apr 2022 00:32:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8CA0C0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 00:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7381F83EEB
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 00:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="vbABOKAN";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="Lti0hsKh"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2otJythkW1d6 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 00:32:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F2F283EE1
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 00:32:51 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236JxCl8014737; 
 Thu, 7 Apr 2022 00:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=aTC2y3mQ6ctLwH7KhTj5tu3INTi3vFwfSn8kYqrFJ/I=;
 b=vbABOKANvJEte1zCObWsmp86gQ19e+q/0fCbpcWM7KRCzHlf5b9J4G/lH3rghB76hLgp
 WvDL7s8vbO6zZ7YxN7cfkpXckS+FCFyd7EFcrJdIQaABE5AnF4bl2R86O14K4wcGn0kk
 MZEYIa9sX+KhceXQdVygPjKA/uQ5ClbyvYt7oFvPqgjwqsK1WIkohnsQGEiaVfWg9VZH
 fhIGzNtAI+pgGe5IJPZJJoHUD4/NTWoixTQvnGW3GiCFCqlUKras9o6aF/+a4h6BLY7h
 WSZ9Sd0u4tzQ0FXNelO1wUx9vpkurZQr5ApkzR7HqJMqUpB4weej4qmGR7eIFRlhmW5K bQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6ec9t7e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 00:32:30 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2370GVD3038607; Thu, 7 Apr 2022 00:32:28 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f9803exag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 00:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB3x2bO4bT/T66mk3N25TJKP/iXq6PKwsnn7sP+HC5w6AdiRm7KX++dFqRfMAr3O2v4i/btXyNWxpUeK4E/SjXedSYJkWaAXxkxCwfbzhTQgPf0p34GjSi/aNHDNHkIY7Gf9aqMn03ZbmLBhYY2zMrMJ4pYsFgQ2LYdNZl6VDxrP6sERAisxGH0l93R4E1yEW0M3WIHAY+J45lSWUK3t+qOhFxodISwiE2E8nw8xP7ugsPV5pvamfkj4F2LeJPWmwr/71SDxW0DfrxBZP0Yy3bNUp/Gp2GbFIMUYwyiL7hKB1GO6GBZOwGRoyKpR6GdJJN3GfyznGuFaQB1AVj1A0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTC2y3mQ6ctLwH7KhTj5tu3INTi3vFwfSn8kYqrFJ/I=;
 b=cuZDqa4f4t7JAuP7uiGmheGqJo4V4a+Y+tEVmSdqf3yEUvtts5xDGYdExSeN4a7UfZytalygqXIFBb4uMJb4lsAsR6dutz+rGzjAb6XIb21BokYgHP9wc4TSKsQt+38BFgYSir9KMzNt8i5NN4SZ4hfH+ZKax6JIubZZvU/iKrj/RtVIuPqO4Y5rDRQsQOKQvYALuyv0m6rdSy3WwPUddT91o1RHTYxA1LdeYuQOriCjXwfa3MIO/DYluGghAh6A0Y/+qNrvuOsKWP9+Mx6K5G9ZokNNNRi6tdJYl3OvzNIgH/wsdlenVB8hKaDjTx8uUCP/t/YdU0196B6QFikvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTC2y3mQ6ctLwH7KhTj5tu3INTi3vFwfSn8kYqrFJ/I=;
 b=Lti0hsKhdFS7CxBaGjYp/89+ECoctmFlBIvKsRkVbNga0249wYVeqIzZnLEezTDgHyN84F5fri4qSSE8p7POTvnvFr6v5wYwOfe+r0/mrrjWwh7fdPrmw+d03h/AL11eOL6y0pzT/iWtbSCB7wvKObIWw7X+N7Whz5KIIyrXlKE=
Received: from SN6PR10MB3006.namprd10.prod.outlook.com (2603:10b6:805:cf::13)
 by CY4PR10MB1671.namprd10.prod.outlook.com (2603:10b6:910:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 00:32:26 +0000
Received: from SN6PR10MB3006.namprd10.prod.outlook.com
 ([fe80::8dcf:404c:fc1a:1d42]) by SN6PR10MB3006.namprd10.prod.outlook.com
 ([fe80::8dcf:404c:fc1a:1d42%5]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 00:32:26 +0000
Date: Wed, 6 Apr 2022 20:31:48 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: cleanup swiotlb initialization v8
Message-ID: <Yk4w9N7IATu20RaM@char.us.oracle.com>
References: <20220404050559.132378-1-hch@lst.de>
Content-Disposition: inline
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::15) To SN6PR10MB3006.namprd10.prod.outlook.com
 (2603:10b6:805:cf::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15af4aa8-0caa-4107-ef2f-08da182e035d
X-MS-TrafficTypeDiagnostic: CY4PR10MB1671:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB16714A57414F3639DEE8C8D689E69@CY4PR10MB1671.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4OPyhwqyzNUQwZTEDOrOu+QjfgWXAZIcmrvPugyPcQp3yhxfTcYqkNlTkegqXR8CZlxmHEg23QPXhIVnmn1sv2j4odmmbQqJV1eWx0xyFtVSr5y8wDiZeqzgz1p98slepqY8eN808paxIAvdu3sp4Y/zeK8SXwKXqVEZfPt0rb03/+0+WT/g2VmYeu3NALfha14pQyLuF85kBUD7nwacxjeEuT1WHgi5Zt4o8BB1I8v13RZLdoBuGjZ54gnZiH2iHoeGhGKk9/vl0pxxDTmwTosocb52+aJBfdaEfP0ZXBEyF44uWzaSynqwR5L/O616z+Q2yT3Val3kFuy5RoVimfN+t3Vnm1uCImvA/C/HvfhmaOiFy1UDRF2HPXHheTH0bjzTJ8t1AwZjKyGBrneO1xosiGga2l7Bi+6k7Wllkj+pIUuNudw2lyhvAiUtwrA38tBiThQLBEOBsnealxR5zDl7r2o1P3A8DHVFlOH9fOtSAsksa4B21GgAIUTr8dbzESdmAXpmrnW3p53vFkxFZgJp47lSRA7PGti2V91rAvLShlGD6r5kmdTdiUXEZ3WCOt5YRPjfhcShhqIFiYcVAMWreh6hL/KqX9pOEKsZnQg2TOKwgz2yftMJZzCTT1qsyyfiAFAUTOX6xeTp+3HUpx+VtXgFzXQYcXkxM4tVxIQpZm/Z6GGYZ4uwkgqBtVaT/4f+jrYQq5sVFTkrbPJRRJr49FIZoL7g88haUFZvEqB48OALKBXQTMjKQchl0C50RL1O8ewoRTfHr3Cycr5wZ//Rjhmwprudh/brBS6lhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3006.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(4326008)(8676002)(6916009)(66556008)(54906003)(66946007)(316002)(66476007)(6512007)(8936002)(86362001)(6666004)(4744005)(966005)(5660300002)(7416002)(6486002)(508600001)(38100700002)(38350700002)(6506007)(2906002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7n1E6F/Avl8goOftI/glJgLJ//gveoI+X1zaSPZ/FjFAIamrFiWEYrQ0wJ4?=
 =?us-ascii?Q?cBHwM6PEyN7FRfmdP4aDWx1pp92XYrlsPzt9/EOT9jmRK7ZoTUt5Ahz/jijL?=
 =?us-ascii?Q?LxfT4wT1UO/s+CzPUjfOeqLsdMdPRZ/G4phE/krD4NebzKdWV/tp8XA6/YMb?=
 =?us-ascii?Q?UHv9QUm0IwjmXluuHtZL86DPAliyzWhzHTHfqH6iVIJG9RwYUEdSaZu4cYmA?=
 =?us-ascii?Q?NlC+ZjkycbkMFg1TndvxnIZ5uPV6LuTAQQ/XnC9fSNEfXQo3aWOL0K/w67KS?=
 =?us-ascii?Q?EsxZMko4F+pZSAO5e0g2NhA0chfgHwDDPSdTUBTQaC9ObuUjJueDX/8Oi3bu?=
 =?us-ascii?Q?UTS1KnF49d+EwgsJyi02rSN2+mkVXcSse5KQYijGBsmVjIxDVzvCLqJU/Veh?=
 =?us-ascii?Q?LxuUkbpLJTcTuDyd98CDzrg+NfVTyTWGsxL4P9Z1v8NmhjTR/5GEaz2WwSEh?=
 =?us-ascii?Q?tTC4aXwrJxNBRxstZG6E/hlAMlwJCfZsNe7wgH89QJXUOIfOaklxXg3vEK9o?=
 =?us-ascii?Q?6By2/S/oU51KWnvWh/BUYo4LgQFDVMOmACvIISckeWx9TyA0TVMcoMOwduee?=
 =?us-ascii?Q?Zm5sS53ODUj09hpxLdqJI+XoeyrYOoU6vzzyr33EJzplVKNjSWEJ0InyKbVx?=
 =?us-ascii?Q?UtiqFf1f4/yRY+o8Ov05EvDK/EemA1JfmRiGropJ8OmJhwq8Kt9O1WxrNu9n?=
 =?us-ascii?Q?LRdiwCf6jzvgW1EzgNWZ/PWpiXn0vS8k7ZPq8LsFffx2CDxTz9tjXKbTwF6+?=
 =?us-ascii?Q?g1YnsINBQLJAL2dWKzM1oeRekkfQ2iG6w8Qq7aUd4krzSkHSH2vknH9fP9wm?=
 =?us-ascii?Q?eM2+v7eXlFaF4gCcnOJAw3FCfIyHoS2XDHTOnvva6nWPupxwQ8UF4z9CNSpS?=
 =?us-ascii?Q?oq1d/I2dFT5u6p0ce4xuI/qOrwohW6hB0nPICT6rnuHauUgoxcurieFh26zw?=
 =?us-ascii?Q?8WpJx7epNCW0/8JRb0TULt4rmtWtMWpHvQ7G7WWZnHjzjLBkwqTm3hSXDS5C?=
 =?us-ascii?Q?o6cJGzSunXAwin4Kf4OyFHxdiJ27Z2jsJxi9Mjh1aRt3AQNh7iSwCD6CQG67?=
 =?us-ascii?Q?7IJ143SWVFScaYlVvEi872JS4sngAvTLIu7NFLuYAXv9UGXCjItPwzF9zQ9z?=
 =?us-ascii?Q?jW1Mdp4315zejlbwHkepTlE7L8d5lCFg12iWn7d6XRx3hee0YswMLsW/BXV2?=
 =?us-ascii?Q?pa0O2gml6Mf7HD7qVWLSiqZ9OmKJX1bmgCTCphXOfTMGRfiXeCmdbXl4Wmlh?=
 =?us-ascii?Q?JqQ8zGirzvhDdfxkDF+684GtUESRryDhe6jR9V0Xt0WblnjYzMkNW/4EM4FI?=
 =?us-ascii?Q?MNqZyUvqsWkjDeKDT98QsX9IncBlNp0Z4Gtm3Fd54UtW+5GQPJMTF/lOfKwM?=
 =?us-ascii?Q?tkmw/FV7hQxit8xclLcETgdHJ7SZzABetxodWwTVnzCB5Jtaq8Ko44PwzNb3?=
 =?us-ascii?Q?Fni0Tz3BO3XPsymYTVePHrSik3sFsjVlYY0WJOSqYmDKOCHsRLPI2M7exNo6?=
 =?us-ascii?Q?feQe1MkKA/14LUsDnnbuctl2+pZyxBcWHwkmcS/99XcCbYN4sD+t1MmA1/vy?=
 =?us-ascii?Q?S7CEsw6YYXNwdfqX7LBu8xoubFkn62Cyv9czS5elp0a03hQhKbbiA5AX4Wlx?=
 =?us-ascii?Q?a+qa7ifCdX0Y64uwNrxIjt26JFkTvNwrxxpsctV1fjNLkFW1Q0CDQzMmopXn?=
 =?us-ascii?Q?j98cuI1HCAqt7Bvbr98TPELE7asAbXasalz0D8ToVDa09UVdnwiWlNLfSpR6?=
 =?us-ascii?Q?VTSNUXwcHy1VPiyiz0+2+FoJkEU3Euw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15af4aa8-0caa-4107-ef2f-08da182e035d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3006.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 00:32:25.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Zuge13Gx6/cDD5X0rmdeOMD9yPKu+maNN9cfLEdyChjeVqGf42KY8/s1WlFgS/stdwI2QQgMZ1lgZs11nmp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1671
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070000
X-Proofpoint-GUID: Ld5JT0Q0K8pOByVfmiRRkW68u3Olyj10
X-Proofpoint-ORIG-GUID: Ld5JT0Q0K8pOByVfmiRRkW68u3Olyj10
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, linux-hyperv@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 04, 2022 at 07:05:44AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series tries to clean up the swiotlb initialization, including
> that of swiotlb-xen.  To get there is also removes the x86 iommu table
> infrastructure that massively obsfucates the initialization path.
> 
> Git tree:
> 
>     git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup
> 
> Changes since v7:
>  - rebased to Linux 5.18-rc1
>  - better document the lower bound swiotlb size for xen-swiotlb
>  - improve the nslabs calculation for the retry case in
>    swiotlb_init_remap and swiotlb_init_late

Hey Christoph,

Feel free to tack on

Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

on them if you would like.

Thank you for doing the spring cleaning of this codebase!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
