Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 186AD3E49D7
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 18:31:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B81F4041C;
	Mon,  9 Aug 2021 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QL1AU9jwvwoW; Mon,  9 Aug 2021 16:31:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5F9F14041E;
	Mon,  9 Aug 2021 16:31:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6C41C002A;
	Mon,  9 Aug 2021 16:31:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7902EC002F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 16:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9584022D
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="PJmKY19J";
 dkim=pass (2048-bit key) header.d=oracle.com header.b="Xr/H6wtM";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="Xaly+AWp"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYIDBW9bu5dF for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 16:31:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 251C640221
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 16:31:30 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179GV0F8023383; Mon, 9 Aug 2021 16:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BC0NxqhSiEjAPDrjoa8FrXqMrnaIT2JAS0dXXQHPAnM=;
 b=PJmKY19Jh/LLMKZ+ZsP9PeV+jvS8DP5peYNCOB8i+XuyiTl5gEODhqa1Y7p5LPYLRmiw
 8t+2f43cYZoOODza0qV8ciQxtkOPRTYGsP00BhLgS4n315LiA8GF+RAyW960EINvFWCU
 ErCIiYnbx82fbvxAoVXMWYi8lLFs0/W6ddE913JgXDGCZXqrBl9G9I6Ro1vH0CDnawj6
 8MXETxBzb6eEHj0DiV2k60IqAMvfGz1lFSlkP11ygvf45eYv/YVs1MVLtJWl4Mlzvvao
 F3Wecz56z8bTX92pmoUjkhWVOLnyD7bVk4RCGUHvH8B5BdzBOG7MuNwuUMtOATCDNPtL rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=BC0NxqhSiEjAPDrjoa8FrXqMrnaIT2JAS0dXXQHPAnM=;
 b=Xr/H6wtMa0cS6RL4XhCxUgmpH8zoKN03enaqJy43BkAEHoOui0j/34qT0ZgOXcSodaHd
 HAUEgrbUPXj4onB1xDZ8Cam8u1Oa0RCUfr0CR2b0bXnEmIIEFaQXknqDiFA7GN7GymAp
 4Mtrk8Ln2w8+37kWeXvp+IDgGBX8qXtoHseAUYCGMqp5r+6tik9J3GzOQHLO+3t+IZH+
 gnIzHY+QMRlkC5OqMdKS62IAEqhoOieiuXCtZA2aEfZNYH9LJ7U2gKJVjCc5jkaHjqR/
 sTfj3rBZXR2j7Us5ZICOy3iYeqoWg5f4LjJzoy1l6yBxwfs+TJrvRU4G8Fy1m4DNGw9w Jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aaqmussdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 16:31:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 179GUeF3066407;
 Mon, 9 Aug 2021 16:30:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3020.oracle.com with ESMTP id 3a9vv3860c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 16:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJcVLozbSRPUlukTXFNz4PiSkaS8ev4LRD9dI/sQm41Qp+aXkKpr4wb7qONLeC+pYHqdbQy2wWlM6CnkpN7En56VBxmjCkq1RZBwyPhL8cBtoUUZobxM5XEz4HkhBfEetNR8uWBjxtiy61zb9kc1sFKFWO0xHajTibvRvsJHrKQc+RqbDyZgtFW3FtuLIkLcFebvkSRGKw3TSE48darOV6w+A5P8ZffQ4MSAB6nHk1W4r4X+EIiZ3vDwQhkZDu8i+pYs+TMfyrtRX8BJLLpDvq4TDOE/lazawcrG3FdArd9A37GJIP6mBmVtZ+/lRS2XTbcmN79MI6r4y59RXi95PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC0NxqhSiEjAPDrjoa8FrXqMrnaIT2JAS0dXXQHPAnM=;
 b=H9STA5IZG3wwjutP9bvyo3oWkv2/5oZZpjslp/waDXkcujOqcE15sTTUroK9U3eK4DcVUDHMLSjwlaXf/CMEBMUQiF/llPy1UdJLcPcStWDyZsroM2HPuy12wysJ3UHe685r51XRCbANjXj0Bv+h0asLaXeZw7H0JTkW1nWSc62CwWbrrfjFvu+v9w4M0gznMkcYe3ed1OGeVEpr2mPo2951GRwokR7QpOKHoxdVZ5oPdnVKLuapn0FZRoQi7vURPQsMIUN168YJaZEq+yquNjbDBZLr64dy94PavjcHsf5GPXdYFjeV0Y1g/VfxeUInUkN73TquWZsNSLks0/K/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC0NxqhSiEjAPDrjoa8FrXqMrnaIT2JAS0dXXQHPAnM=;
 b=Xaly+AWpi+6g+4tLx4hYNZ2ZasBu6474d5QiNTbH0ew4TFpcBfSBHvf4pixcrxtapARVilarc7R3wTRVz1Vkstteo444esBvZEzjK8+jeJymiycBCo9nbWa8BCKwTVxYwWiGs2WuSoFIENlUZH9+6gZitK+sFDERmbfoynAMfS8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Mon, 9 Aug
 2021 16:30:54 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3%4]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 16:30:54 +0000
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v3 08/14] x86: Secure Launch kernel early boot stub
Date: Mon,  9 Aug 2021 12:38:50 -0400
Message-Id: <1628527136-2478-9-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628527136-2478-1-git-send-email-ross.philipson@oracle.com>
References: <1628527136-2478-1-git-send-email-ross.philipson@oracle.com>
X-ClientProxiedBy: SA9PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:806:a7::26) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lateralus.us.oracle.com (209.17.40.43) by
 SA9PR10CA0021.namprd10.prod.outlook.com (2603:10b6:806:a7::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 16:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddffa5f0-687c-478c-7ece-08d95b530ec3
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3939C1B65AF9EFE3461C98EFE6F69@BY5PR10MB3939.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SZI0YtazmNayxQ4tKcQPBEGKe0jXRbLAtM+W+lhYqiuxE2cKFAeZfXoXcl9oKB8vDC8sGm99pZhjyHbE86G0H2SY6u6HeuMWvVnpPsBBFFPSMS7ysaNpGatsVUs0p5MR4swPWhkqtmXqOwILyJPZ0IBrLGDMzPBFmUm9XMCYeTeVsFiXPibP+0NkAKsGuIcWhuhrjJvBoIwcXV5mOBZW9EKnleN5y4hktlj60M2Ti+A5GVTUNDNrWuNicz22cnY5uiq36wLlR9YESYlY8qdjtYOm54E7J0PWORtgEELSaGoNikuWM6vXS7XNa3Q0CNEND3uGJ7bXGTGd79Y8hHYZITzZ2shjVxZ9ZzDfj4GMecbSBX8eIivqNtcuZ4aD2FigGjo4fCVMMhszzevdY6PP4H+7trOuIL/tX0P/McR9q741414mDaTgzKKuW5M1EcD7efaSEfidxrIXUNhiD5WBjqQ3w1nhph+AQNMKx8BWs4hGWmq0pLoy3eraAUNOnpw35H0TNr9gN3bLzVh772Y4qdS0zUw55Vojb7vf7VxZHHQqhk4zuEZpofwUfjBh5GQvjGVB7IdGEbEiiSZ5NbdxN6wagLJwsywF6XsffiRWzZkQWHW5SVNGFfVzRi8QnXE3kh5uq6nOJ+lBLj5Os8TQFjiMBJvL6rHookaVQShiYzDltvI3o2H7FkshqzIQdXAyP6e4eK+xYOcrENQgR0hlYhGgKlu+NMKW/fpEjrmsDRWGxMfX0y8ntpbBTC1V62s8SgP0s32HLxnCW2D/2HiVGAYye/EvJ0Vsk7ZktwJaE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB3793.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(966005)(38350700002)(478600001)(86362001)(316002)(38100700002)(52116002)(4326008)(7696005)(7416002)(2906002)(8936002)(83380400001)(6486002)(186003)(5660300002)(8676002)(26005)(44832011)(30864003)(2616005)(66946007)(66476007)(66556008)(956004)(36756003)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laZ+MDZGCaKqFzw27WRpHXsXdGmy3kW/4bPr0tf9MH8dZ1x9qp2yqbsbcdXl?=
 =?us-ascii?Q?pdv3a/ufq/o6ZYNsYmzxyyV+XUdltb9We0NqlHr62u16YnOHCbndG+JWNzhU?=
 =?us-ascii?Q?zGvV10+JqjD8TWVF5BFI8xxtjPj8OBlUiPxMnRtyXImTSmtMRH6sZgG1yGUK?=
 =?us-ascii?Q?FeujYO7XyT3SRdCdofGhva1s8hZWj8JAKwHKcgpkrR6fSJN2sBia8XR4E4H4?=
 =?us-ascii?Q?vDKTbYIGxcRtSbDzrgQAvo4HhBxHVCzA3CZ9LyN/GycL9uIsnj/p6s6SJsMo?=
 =?us-ascii?Q?uGx0qqugZtZCpN22NZ1xmynJYgsNl0VKQ3moRVR8mLYdhk4JsEKdCcHdOD4v?=
 =?us-ascii?Q?ruvuI4b5jCxZqYUgb+IObXSRqi8a9mTsf5HoDRmDp3rj4I0qindVVjwW0p7Q?=
 =?us-ascii?Q?NrphXvNqNVcNg6LtjtpA3m02drR/363GhCOfJE0gd2gT/EfhEr4vNm8IifMR?=
 =?us-ascii?Q?YMg9U7ZbDik8D2I5chmN8SDS9opM1qvwwvp/iBAgM2s9/iMIhaBEE6B3jJiz?=
 =?us-ascii?Q?qw+sj1OGgPSaNkc8dtXSqTE2ujeftkwbIr21iopTXEG6GdVfdBaNlpnR5+0s?=
 =?us-ascii?Q?Iv1RGSmanSeMFTCwU5RHByRN7Jtcfclt/UqjIJuVZJxrVzRsIqz6eUoY3XJs?=
 =?us-ascii?Q?t/hLBQBeBXfs2Y+sYcGG8Pfl5Hwi3rD10TqB3KhFHnlEHiHjXOzUXHxY1sLg?=
 =?us-ascii?Q?wpPBEErb025aiifc88L6KfFOY1f9LUX5tnk/Bfov7Va3i44HUJ0UKA9c9VFT?=
 =?us-ascii?Q?aYMC7EruTmszK5shjYz2tonVolmJnzitOwAQDVmgkrhOusWzRNk6j2sHmcff?=
 =?us-ascii?Q?09SwBccTS4neWQVARIXyvubG1GKDtQeRUSNv/hYPk58E+MPe2oyP/4WDoaF5?=
 =?us-ascii?Q?l7x5meFEychmHP6IVdU0/kCUCBawNWFitcP9h95veg+UptKqeACxW5+PaKtY?=
 =?us-ascii?Q?I7uwxhEcD3l+025wq3kCe3eli4Bjyh3ssuoF4FjiNShGFjYc/s37vyChALvS?=
 =?us-ascii?Q?eXJ2IMzvt3qJ0JYd7GCjMGeaQBT6uLykwcV1ABY3KtHZAlfEv2vjR+M1QERY?=
 =?us-ascii?Q?0INvc//ER89rCSIBpHgwO2vQp3UR9aEYNgtHoEw//Rw+LNw+8XkvKHbcEFhl?=
 =?us-ascii?Q?XVVJkdtqfIAk1KDIc80a+p0zDeiCFNfnjaCBQsBr2AsJLKKD9h0ESeHmAgHD?=
 =?us-ascii?Q?YGIXHRaOa2+z1ae5Z6sh2qgwHjFF5ysm6uIKljS3uQJOTPExzlSnk/Vt4skV?=
 =?us-ascii?Q?sUQxuinVhShdpw7cSSUTimnP4fX5LhZ3Srx1SUklioseEc+MNbu8kqifmPjA?=
 =?us-ascii?Q?Fq0CAKDGmjcZNUIBh3BsgPGA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddffa5f0-687c-478c-7ece-08d95b530ec3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 16:30:54.0030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCtVclUAHa4vm7uF38Xe8O3QeJWFanJQ0e1V0NTh6rvYoKNzlQk1uQ9fJW2GVmOg3WOB0IdsBpFZoHoVdBuUtGXr7Z5tR1Fu7jgLmXG/9Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090119
X-Proofpoint-GUID: TQbGulehTt8JyFT62KPnnE_XYLgYfk7V
X-Proofpoint-ORIG-GUID: TQbGulehTt8JyFT62KPnnE_XYLgYfk7V
Cc: dpsmith@apertussolutions.com, ross.philipson@oracle.com,
 luto@amacapital.net, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 kanth.ghatraju@oracle.com, tglx@linutronix.de,
 trenchboot-devel@googlegroups.com
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

The Secure Launch (SL) stub provides the entry point for Intel TXT (and
later AMD SKINIT) to vector to during the late launch. The symbol
sl_stub_entry is that entry point and its offset into the kernel is
conveyed to the launching code using the MLE (Measured Launch
Environment) header in the structure named mle_header. The offset of the
MLE header is set in the kernel_info. The routine sl_stub contains the
very early late launch setup code responsible for setting up the basic
environment to allow the normal kernel startup_32 code to proceed. It is
also responsible for properly waking and handling the APs on Intel
platforms. The routine sl_main which runs after entering 64b mode is
responsible for measuring configuration and module information before
it is used like the boot params, the kernel command line, the TXT heap,
an external initramfs, etc.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 Documentation/x86/boot.rst             |  13 +
 arch/x86/boot/compressed/Makefile      |   3 +-
 arch/x86/boot/compressed/head_64.S     |  37 ++
 arch/x86/boot/compressed/kernel_info.S |  34 ++
 arch/x86/boot/compressed/sl_main.c     | 549 ++++++++++++++++++++++++++
 arch/x86/boot/compressed/sl_stub.S     | 685 +++++++++++++++++++++++++++++++++
 arch/x86/kernel/asm-offsets.c          |  19 +
 7 files changed, 1339 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/boot/compressed/sl_main.c
 create mode 100644 arch/x86/boot/compressed/sl_stub.S

diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
index 894a198..2fbcb77 100644
--- a/Documentation/x86/boot.rst
+++ b/Documentation/x86/boot.rst
@@ -1026,6 +1026,19 @@ Offset/size:	0x000c/4
 
   This field contains maximal allowed type for setup_data and setup_indirect structs.
 
+============	=================
+Field name:	mle_header_offset
+Offset/size:	0x0010/4
+============	=================
+
+  This field contains the offset to the Secure Launch Measured Launch Environment
+  (MLE) header. This offset is used to locate information needed during a secure
+  late launch using Intel TXT. If the offset is zero, the kernel does not have
+  Secure Launch capabilities. The MLE entry point is called from TXT on the BSP
+  following a success measured launch. The specific state of the processors is
+  outlined in the TXT Software Development Guide, the latest can be found here:
+  https://www.intel.com/content/dam/www/public/us/en/documents/guides/intel-txt-software-development-guide.pdf
+
 
 The Image Checksum
 ==================
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 059d49a..1fe55a5 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -102,7 +102,8 @@ vmlinux-objs-$(CONFIG_ACPI) += $(obj)/acpi.o
 vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_thunk_$(BITS).o
 efi-obj-$(CONFIG_EFI_STUB) = $(objtree)/drivers/firmware/efi/libstub/lib.a
 
-vmlinux-objs-$(CONFIG_SECURE_LAUNCH) += $(obj)/early_sha1.o $(obj)/early_sha256.o
+vmlinux-objs-$(CONFIG_SECURE_LAUNCH) += $(obj)/early_sha1.o $(obj)/early_sha256.o \
+	$(obj)/sl_main.o $(obj)/sl_stub.o
 
 $(obj)/vmlinux: $(vmlinux-objs-y) $(efi-obj-y) FORCE
 	$(call if_changed,ld)
diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index a2347de..b35e072 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -498,6 +498,17 @@ trampoline_return:
 	pushq	$0
 	popfq
 
+#ifdef CONFIG_SECURE_LAUNCH
+	pushq	%rsi
+
+	/* Ensure the relocation region coverd by a PMR */
+	movq	%rbx, %rdi
+	movl	$(_bss - startup_32), %esi
+	callq	sl_check_region
+
+	popq	%rsi
+#endif
+
 /*
  * Copy the compressed kernel to the end of our buffer
  * where decompression in place becomes safe.
@@ -556,6 +567,32 @@ SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
 	shrq	$3, %rcx
 	rep	stosq
 
+#ifdef CONFIG_SECURE_LAUNCH
+	/*
+	 * Have to do the final early sl stub work in 64b area.
+	 *
+	 * *********** NOTE ***********
+	 *
+	 * Several boot params get used before we get a chance to measure
+	 * them in this call. This is a known issue and we currently don't
+	 * have a solution. The scratch field doesn't matter. There is no
+	 * obvious way to do anything about the use of kernel_alignment or
+	 * init_size though these seem low risk with all the PMR and overlap
+	 * checks in place.
+	 */
+	pushq	%rsi
+
+	movq	%rsi, %rdi
+	callq	sl_main
+
+	/* Ensure the decompression location is coverd by a PMR */
+	movq	%rbp, %rdi
+	movq	output_len(%rip), %rsi
+	callq	sl_check_region
+
+	popq	%rsi
+#endif
+
 /*
  * If running as an SEV guest, the encryption mask is required in the
  * page-table setup code below. When the guest also has SEV-ES enabled
diff --git a/arch/x86/boot/compressed/kernel_info.S b/arch/x86/boot/compressed/kernel_info.S
index c18f071..e199b87 100644
--- a/arch/x86/boot/compressed/kernel_info.S
+++ b/arch/x86/boot/compressed/kernel_info.S
@@ -28,6 +28,40 @@ SYM_DATA_START(kernel_info)
 	/* Maximal allowed type for setup_data and setup_indirect structs. */
 	.long	SETUP_TYPE_MAX
 
+	/* Offset to the MLE header structure */
+#if IS_ENABLED(CONFIG_SECURE_LAUNCH)
+	.long	rva(mle_header)
+#else
+	.long	0
+#endif
+
 kernel_info_var_len_data:
 	/* Empty for time being... */
 SYM_DATA_END_LABEL(kernel_info, SYM_L_LOCAL, kernel_info_end)
+
+#if IS_ENABLED(CONFIG_SECURE_LAUNCH)
+	/*
+	 * The MLE Header per the TXT Specification, section 2.1
+	 * MLE capabilities, see table 4. Capabilities set:
+	 * bit 0: Support for GETSEC[WAKEUP] for RLP wakeup
+	 * bit 1: Support for RLP wakeup using MONITOR address
+	 * bit 2: The ECX register will contain the pointer to the MLE page table
+	 * bit 5: TPM 1.2 family: Details/authorities PCR usage support
+	 * bit 9: Supported format of TPM 2.0 event log - TCG compliant
+	 */
+SYM_DATA_START(mle_header)
+	.long	0x9082ac5a  /* UUID0 */
+	.long	0x74a7476f  /* UUID1 */
+	.long	0xa2555c0f  /* UUID2 */
+	.long	0x42b651cb  /* UUID3 */
+	.long	0x00000034  /* MLE header size */
+	.long	0x00020002  /* MLE version 2.2 */
+	.long	rva(sl_stub_entry) /* Linear entry point of MLE (virt. address) */
+	.long	0x00000000  /* First valid page of MLE */
+	.long	0x00000000  /* Offset within binary of first byte of MLE */
+	.long	rva(_edata) /* Offset within binary of last byte + 1 of MLE */
+	.long	0x00000227  /* Bit vector of MLE-supported capabilities */
+	.long	0x00000000  /* Starting linear address of command line (unused) */
+	.long	0x00000000  /* Ending linear address of command line (unused) */
+SYM_DATA_END(mle_header)
+#endif
diff --git a/arch/x86/boot/compressed/sl_main.c b/arch/x86/boot/compressed/sl_main.c
new file mode 100644
index 0000000..6ba59e7
--- /dev/null
+++ b/arch/x86/boot/compressed/sl_main.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Secure Launch early measurement and validation routines.
+ *
+ * Copyright (c) 2021, Oracle and/or its affiliates.
+ */
+
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/linkage.h>
+#include <linux/efi.h>
+#include <asm/segment.h>
+#include <asm/boot.h>
+#include <asm/msr.h>
+#include <asm/io.h>
+#include <asm/mtrr.h>
+#include <asm/processor-flags.h>
+#include <asm/asm-offsets.h>
+#include <asm/bootparam.h>
+#include <asm/efi.h>
+#include <asm/bootparam_utils.h>
+#include <linux/slaunch.h>
+#include <crypto/sha1.h>
+#include <crypto/sha2.h>
+
+#include "misc.h"
+#include "early_sha1.h"
+
+#define CAPS_VARIABLE_MTRR_COUNT_MASK	0xff
+
+#define SL_TPM12_LOG		1
+#define SL_TPM20_LOG		2
+
+#define SL_TPM20_MAX_ALGS	2
+
+#define SL_MAX_EVENT_DATA	64
+#define SL_TPM12_LOG_SIZE	(sizeof(struct tcg_pcr_event) + \
+				SL_MAX_EVENT_DATA)
+#define SL_TPM20_LOG_SIZE	(sizeof(struct tcg_pcr_event2_head) + \
+				SHA1_DIGEST_SIZE + SHA256_DIGEST_SIZE + \
+				sizeof(struct tcg_event_field) + \
+				SL_MAX_EVENT_DATA)
+
+static void *evtlog_base;
+static u32 evtlog_size;
+static struct txt_heap_event_log_pointer2_1_element *log20_elem;
+static u32 tpm_log_ver = SL_TPM12_LOG;
+struct tcg_efi_specid_event_algs tpm_algs[SL_TPM20_MAX_ALGS] = {0};
+
+#if !IS_ENABLED(CONFIG_SECURE_LAUNCH_ALT_PCR19)
+static u32 pcr_config = SL_DEF_CONFIG_PCR18;
+#else
+static u32 pcr_config = SL_ALT_CONFIG_PCR19;
+#endif
+
+#if !IS_ENABLED(CONFIG_SECURE_LAUNCH_ALT_PCR20)
+static u32 pcr_image = SL_DEF_IMAGE_PCR17;
+#else
+static u32 pcr_image = SL_ALT_IMAGE_PCR20;
+#endif
+
+extern u32 sl_cpu_type;
+extern u32 sl_mle_start;
+
+u32 slaunch_get_cpu_type(void)
+{
+	return sl_cpu_type;
+}
+
+static u64 sl_txt_read(u32 reg)
+{
+	return readq((void *)(u64)(TXT_PRIV_CONFIG_REGS_BASE + reg));
+}
+
+static void sl_txt_write(u32 reg, u64 val)
+{
+	writeq(val, (void *)(u64)(TXT_PRIV_CONFIG_REGS_BASE + reg));
+}
+
+static void __noreturn sl_txt_reset(u64 error)
+{
+	/* Reading the E2STS register acts as a barrier for TXT registers */
+	sl_txt_write(TXT_CR_ERRORCODE, error);
+	sl_txt_read(TXT_CR_E2STS);
+	sl_txt_write(TXT_CR_CMD_UNLOCK_MEM_CONFIG, 1);
+	sl_txt_read(TXT_CR_E2STS);
+	sl_txt_write(TXT_CR_CMD_RESET, 1);
+
+	for ( ; ; )
+		asm volatile ("hlt");
+
+	unreachable();
+}
+
+static u64 sl_rdmsr(u32 reg)
+{
+	u64 lo, hi;
+
+	asm volatile ("rdmsr" : "=a" (lo), "=d" (hi) : "c" (reg));
+
+	return (hi << 32) | lo;
+}
+
+static void sl_check_pmr_coverage(void *base, u32 size, bool allow_hi)
+{
+	void *end = base + size;
+	struct txt_os_sinit_data *os_sinit_data;
+	void *txt_heap;
+
+	if (!(sl_cpu_type & SL_CPU_INTEL))
+		return;
+
+	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+	os_sinit_data = txt_os_sinit_data_start(txt_heap);
+
+	if ((end >= (void *)0x100000000ULL) &&
+	    (base < (void *)0x100000000ULL))
+		sl_txt_reset(SL_ERROR_REGION_STRADDLE_4GB);
+
+	/*
+	 * Note that the late stub code validates that the hi PMR covers
+	 * all memory above 4G. At this point the code can only check that
+	 * regions are within the hi PMR but that is sufficient.
+	 */
+	if ((end > (void *)0x100000000ULL) &&
+	    (base >= (void *)0x100000000ULL)) {
+		if (allow_hi) {
+			if (end >= (void *)(os_sinit_data->vtd_pmr_hi_base +
+					   os_sinit_data->vtd_pmr_hi_size))
+				sl_txt_reset(SL_ERROR_BUFFER_BEYOND_PMR);
+		} else
+			sl_txt_reset(SL_ERROR_REGION_ABOVE_4GB);
+	}
+
+	if (end >= (void *)os_sinit_data->vtd_pmr_lo_size)
+		sl_txt_reset(SL_ERROR_BUFFER_BEYOND_PMR);
+}
+
+/*
+ * Some MSRs are modified by the pre-launch code including the MTRRs.
+ * The early MLE code has to restore these values. This code validates
+ * the values after they are measured.
+ */
+static void sl_txt_validate_msrs(struct txt_os_mle_data *os_mle_data)
+{
+	u64 mtrr_caps, mtrr_def_type, mtrr_var, misc_en_msr;
+	u32 vcnt, i;
+	struct txt_mtrr_state *saved_bsp_mtrrs =
+		&(os_mle_data->saved_bsp_mtrrs);
+
+	mtrr_caps = sl_rdmsr(MSR_MTRRcap);
+	vcnt = (u32)(mtrr_caps & CAPS_VARIABLE_MTRR_COUNT_MASK);
+
+	if (saved_bsp_mtrrs->mtrr_vcnt > vcnt)
+		sl_txt_reset(SL_ERROR_MTRR_INV_VCNT);
+	if (saved_bsp_mtrrs->mtrr_vcnt > TXT_OS_MLE_MAX_VARIABLE_MTRRS)
+		sl_txt_reset(SL_ERROR_MTRR_INV_VCNT);
+
+	mtrr_def_type = sl_rdmsr(MSR_MTRRdefType);
+	if (saved_bsp_mtrrs->default_mem_type != mtrr_def_type)
+		sl_txt_reset(SL_ERROR_MTRR_INV_DEF_TYPE);
+
+	for (i = 0; i < saved_bsp_mtrrs->mtrr_vcnt; i++) {
+		mtrr_var = sl_rdmsr(MTRRphysBase_MSR(i));
+		if (saved_bsp_mtrrs->mtrr_pair[i].mtrr_physbase != mtrr_var)
+			sl_txt_reset(SL_ERROR_MTRR_INV_BASE);
+		mtrr_var = sl_rdmsr(MTRRphysMask_MSR(i));
+		if (saved_bsp_mtrrs->mtrr_pair[i].mtrr_physmask != mtrr_var)
+			sl_txt_reset(SL_ERROR_MTRR_INV_MASK);
+	}
+
+	misc_en_msr = sl_rdmsr(MSR_IA32_MISC_ENABLE);
+	if (os_mle_data->saved_misc_enable_msr != misc_en_msr)
+		sl_txt_reset(SL_ERROR_MSR_INV_MISC_EN);
+}
+
+static void sl_find_event_log(void)
+{
+	struct txt_os_mle_data *os_mle_data;
+	struct txt_os_sinit_data *os_sinit_data;
+	void *txt_heap;
+
+	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+
+	os_mle_data = txt_os_mle_data_start(txt_heap);
+	evtlog_base = (void *)os_mle_data->evtlog_addr;
+	evtlog_size = os_mle_data->evtlog_size;
+
+	/*
+	 * For TPM 2.0, the event log 2.1 extended data structure has to also
+	 * be located and fixed up.
+	 */
+	os_sinit_data = txt_os_sinit_data_start(txt_heap);
+
+	/*
+	 * Only support version 6 and later that properly handle the
+	 * list of ExtDataElements in the OS-SINIT structure.
+	 */
+	if (os_sinit_data->version < 6)
+		sl_txt_reset(SL_ERROR_OS_SINIT_BAD_VERSION);
+
+	/* Find the TPM2.0 logging extended heap element */
+	log20_elem = tpm20_find_log2_1_element(os_sinit_data);
+
+	/* If found, this implies TPM20 log and family */
+	if (log20_elem)
+		tpm_log_ver = SL_TPM20_LOG;
+}
+
+static void sl_validate_event_log_buffer(void)
+{
+	void *mle_base = (void *)(u64)sl_mle_start;
+	void *mle_end;
+	struct txt_os_sinit_data *os_sinit_data;
+	void *txt_heap;
+	void *txt_heap_end;
+	void *evtlog_end;
+
+	if ((u64)evtlog_size > (LLONG_MAX - (u64)evtlog_base))
+		sl_txt_reset(SL_ERROR_INTEGER_OVERFLOW);
+	evtlog_end = evtlog_base + evtlog_size;
+
+	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+	txt_heap_end = txt_heap + sl_txt_read(TXT_CR_HEAP_SIZE);
+	os_sinit_data = txt_os_sinit_data_start(txt_heap);
+
+	mle_end = mle_base + os_sinit_data->mle_size;
+
+	/*
+	 * This check is to ensure the event log buffer does not overlap with
+	 * the MLE image.
+	 */
+	if ((evtlog_base >= mle_end) &&
+	    (evtlog_end > mle_end))
+		goto pmr_check; /* above */
+
+	if ((evtlog_end <= mle_base) &&
+	    (evtlog_base < mle_base))
+		goto pmr_check; /* below */
+
+	sl_txt_reset(SL_ERROR_MLE_BUFFER_OVERLAP);
+
+pmr_check:
+	/*
+	 * The TXT heap is protected by the DPR. If the TPM event log is
+	 * inside the TXT heap, there is no need for a PMR check.
+	 */
+	if ((evtlog_base > txt_heap) &&
+	    (evtlog_end < txt_heap_end))
+		return;
+
+	sl_check_pmr_coverage(evtlog_base, evtlog_size, true);
+}
+
+static void sl_find_event_log_algorithms(void)
+{
+	struct tcg_efi_specid_event_head *efi_head =
+		(struct tcg_efi_specid_event_head *)(evtlog_base +
+					log20_elem->first_record_offset +
+					sizeof(struct tcg_pcr_event));
+
+	if (efi_head->num_algs == 0 || efi_head->num_algs > 2)
+		sl_txt_reset(SL_ERROR_TPM_NUMBER_ALGS);
+
+	memcpy(&tpm_algs[0], &efi_head->digest_sizes[0],
+	       sizeof(struct tcg_efi_specid_event_algs) * efi_head->num_algs);
+}
+
+static void sl_tpm12_log_event(u32 pcr, u32 event_type,
+			       const u8 *data, u32 length,
+			       const u8 *event_data, u32 event_size)
+{
+	struct tcg_pcr_event *pcr_event;
+	struct sha1_state sctx = {0};
+	u32 total_size;
+	u8 log_buf[SL_TPM12_LOG_SIZE] = {0};
+	u8 sha1_hash[SHA1_DIGEST_SIZE] = {0};
+
+	pcr_event = (struct tcg_pcr_event *)log_buf;
+	pcr_event->pcr_idx = pcr;
+	pcr_event->event_type = event_type;
+	if (length > 0) {
+		early_sha1_init(&sctx);
+		early_sha1_update(&sctx, data, length);
+		early_sha1_final(&sctx, &sha1_hash[0]);
+		memcpy(&pcr_event->digest[0], &sha1_hash[0], SHA1_DIGEST_SIZE);
+	}
+	pcr_event->event_size = event_size;
+	if (event_size > 0)
+		memcpy((u8 *)pcr_event + sizeof(struct tcg_pcr_event),
+		       event_data, event_size);
+
+	total_size = sizeof(struct tcg_pcr_event) + event_size;
+
+	if (tpm12_log_event(evtlog_base, evtlog_size, total_size, pcr_event))
+		sl_txt_reset(SL_ERROR_TPM_LOGGING_FAILED);
+}
+
+static void sl_tpm20_log_event(u32 pcr, u32 event_type,
+			       const u8 *data, u32 length,
+			       const u8 *event_data, u32 event_size)
+{
+	struct tcg_pcr_event2_head *head;
+	struct tcg_event_field *event;
+	struct sha1_state sctx1 = {0};
+	struct sha256_state sctx256 = {0};
+	u32 total_size;
+	u16 *alg_ptr;
+	u8 *dgst_ptr;
+	u8 log_buf[SL_TPM20_LOG_SIZE] = {0};
+	u8 sha1_hash[SHA1_DIGEST_SIZE] = {0};
+	u8 sha256_hash[SHA256_DIGEST_SIZE] = {0};
+
+	head = (struct tcg_pcr_event2_head *)log_buf;
+	head->pcr_idx = pcr;
+	head->event_type = event_type;
+	total_size = sizeof(struct tcg_pcr_event2_head);
+	alg_ptr = (u16 *)(log_buf + sizeof(struct tcg_pcr_event2_head));
+
+	for ( ; head->count < 2; head->count++) {
+		if (!tpm_algs[head->count].alg_id)
+			break;
+
+		*alg_ptr = tpm_algs[head->count].alg_id;
+		dgst_ptr = (u8 *)alg_ptr + sizeof(u16);
+
+		if (tpm_algs[head->count].alg_id == TPM_ALG_SHA256 &&
+		    length) {
+			sha256_init(&sctx256);
+			sha256_update(&sctx256, data, length);
+			sha256_final(&sctx256, &sha256_hash[0]);
+		} else if (tpm_algs[head->count].alg_id == TPM_ALG_SHA1 &&
+			   length) {
+			early_sha1_init(&sctx1);
+			early_sha1_update(&sctx1, data, length);
+			early_sha1_final(&sctx1, &sha1_hash[0]);
+		}
+
+		if (tpm_algs[head->count].alg_id == TPM_ALG_SHA256) {
+			memcpy(dgst_ptr, &sha256_hash[0], SHA256_DIGEST_SIZE);
+			total_size += SHA256_DIGEST_SIZE + sizeof(u16);
+			alg_ptr = (u16 *)((u8 *)alg_ptr + SHA256_DIGEST_SIZE + sizeof(u16));
+		} else if (tpm_algs[head->count].alg_id == TPM_ALG_SHA1) {
+			memcpy(dgst_ptr, &sha1_hash[0], SHA1_DIGEST_SIZE);
+			total_size += SHA1_DIGEST_SIZE + sizeof(u16);
+			alg_ptr = (u16 *)((u8 *)alg_ptr + SHA1_DIGEST_SIZE + sizeof(u16));
+		} else
+			sl_txt_reset(SL_ERROR_TPM_UNKNOWN_DIGEST);
+	}
+
+	event = (struct tcg_event_field *)(log_buf + total_size);
+	event->event_size = event_size;
+	if (event_size > 0)
+		memcpy((u8 *)event + sizeof(struct tcg_event_field),
+		       event_data, event_size);
+	total_size += sizeof(struct tcg_event_field) + event_size;
+
+	if (tpm20_log_event(log20_elem, evtlog_base, evtlog_size,
+	    total_size, &log_buf[0]))
+		sl_txt_reset(SL_ERROR_TPM_LOGGING_FAILED);
+}
+
+static void sl_tpm_extend_evtlog(u32 pcr, u32 type,
+				 const u8 *data, u32 length, const char *desc)
+{
+	if (tpm_log_ver == SL_TPM20_LOG)
+		sl_tpm20_log_event(pcr, type, data, length,
+				   (const u8 *)desc, strlen(desc));
+	else
+		sl_tpm12_log_event(pcr, type, data, length,
+				   (const u8 *)desc, strlen(desc));
+}
+
+static struct setup_data *sl_handle_setup_data(struct setup_data *curr)
+{
+	struct setup_data *next;
+	struct setup_indirect *ind;
+
+	if (!curr)
+		return NULL;
+
+	next = (struct setup_data *)(unsigned long)curr->next;
+
+	/* SETUP_INDIRECT instances have to be handled differently */
+	if (curr->type == SETUP_INDIRECT) {
+		ind = (struct setup_indirect *)
+			((u8 *)curr + offsetof(struct setup_data, data));
+
+		sl_check_pmr_coverage((void *)ind->addr, ind->len, true);
+
+		sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+				     (void *)ind->addr, ind->len,
+				     "Measured Kernel setup_indirect");
+
+		return next;
+	}
+
+	sl_check_pmr_coverage(((u8 *)curr) + sizeof(struct setup_data),
+			      curr->len, true);
+
+	sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+			     ((u8 *)curr) + sizeof(struct setup_data),
+			     curr->len,
+			     "Measured Kernel setup_data");
+
+	return next;
+}
+
+asmlinkage __visible void sl_check_region(void *base, u32 size)
+{
+	sl_check_pmr_coverage(base, size, false);
+}
+
+asmlinkage __visible void sl_main(void *bootparams)
+{
+	struct boot_params *bp;
+	struct setup_data *data;
+	struct txt_os_mle_data *os_mle_data;
+	struct txt_os_mle_data os_mle_tmp = {0};
+	const char *signature;
+	unsigned long mmap = 0;
+	void *txt_heap;
+	u32 data_count;
+
+	/*
+	 * Currently only Intel TXT is supported for Secure Launch. Testing
+	 * this value also indicates that the kernel was booted successfully
+	 * through the Secure Launch entry point and is in SMX mode.
+	 */
+	if (!(sl_cpu_type & SL_CPU_INTEL))
+		return;
+
+	/* Locate the TPM event log. */
+	sl_find_event_log();
+
+	/* Validate the location of the event log buffer before using it */
+	sl_validate_event_log_buffer();
+
+	/*
+	 * Find the TPM hash algorithms used by the ACM and recorded in the
+	 * event log.
+	 */
+	if (tpm_log_ver == SL_TPM20_LOG)
+		sl_find_event_log_algorithms();
+
+	/* Sanitize them before measuring */
+	boot_params = (struct boot_params *)bootparams;
+	sanitize_boot_params(boot_params);
+
+	/* Place event log NO_ACTION tags before and after measurements */
+	sl_tpm_extend_evtlog(17, TXT_EVTYPE_SLAUNCH_START, NULL, 0, "");
+
+	sl_check_pmr_coverage(bootparams, PAGE_SIZE, false);
+
+	/* Measure the zero page/boot params */
+	sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+			     bootparams, PAGE_SIZE,
+			     "Measured boot parameters");
+
+	/* Now safe to use boot params */
+	bp = (struct boot_params *)bootparams;
+
+	/* Measure the command line */
+	if (bp->hdr.cmdline_size > 0) {
+		u64 cmdline = (u64)bp->hdr.cmd_line_ptr;
+
+		if (bp->ext_cmd_line_ptr > 0)
+			cmdline = cmdline | ((u64)bp->ext_cmd_line_ptr << 32);
+
+		sl_check_pmr_coverage((void *)cmdline,
+				      bp->hdr.cmdline_size, true);
+
+		sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+				     (u8 *)cmdline,
+				     bp->hdr.cmdline_size,
+				     "Measured Kernel command line");
+	}
+
+	/*
+	 * Measuring the boot params measured the fixed e820 memory map.
+	 * Measure any setup_data entries including e820 extended entries.
+	 */
+	data = (struct setup_data *)(unsigned long)bp->hdr.setup_data;
+	while (data)
+		data = sl_handle_setup_data(data);
+
+	/* If bootloader was EFI, measure the memory map passed across */
+	signature =
+		(const char *)&bp->efi_info.efi_loader_signature;
+
+	if (!strncmp(signature, EFI32_LOADER_SIGNATURE, 4))
+		mmap =  bp->efi_info.efi_memmap;
+	else if (!strncmp(signature, EFI64_LOADER_SIGNATURE, 4))
+		mmap = (bp->efi_info.efi_memmap |
+			((u64)bp->efi_info.efi_memmap_hi << 32));
+
+	if (mmap)
+		sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+				     (void *)mmap,
+				     bp->efi_info.efi_memmap_size,
+				     "Measured EFI memory map");
+
+	/* Measure any external initrd */
+	if (bp->hdr.ramdisk_image != 0 && bp->hdr.ramdisk_size != 0) {
+		u64 ramdisk = (u64)bp->hdr.ramdisk_image;
+
+		if (bp->ext_ramdisk_size > 0)
+			sl_txt_reset(SL_ERROR_INITRD_TOO_BIG);
+
+		if (bp->ext_ramdisk_image > 0)
+			ramdisk = ramdisk |
+				  ((u64)bp->ext_ramdisk_image << 32);
+
+		sl_check_pmr_coverage((void *)ramdisk,
+				      bp->hdr.ramdisk_size, true);
+
+		sl_tpm_extend_evtlog(pcr_image, TXT_EVTYPE_SLAUNCH,
+				     (u8 *)(ramdisk),
+				     bp->hdr.ramdisk_size,
+				     "Measured initramfs");
+	}
+
+	/*
+	 * Some extra work to do on Intel, have to measure the OS-MLE
+	 * heap area.
+	 */
+	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+	os_mle_data = txt_os_mle_data_start(txt_heap);
+
+	/* Measure only portions of OS-MLE data, not addresses/sizes etc. */
+	os_mle_tmp.version = os_mle_data->version;
+	os_mle_tmp.saved_misc_enable_msr = os_mle_data->saved_misc_enable_msr;
+	os_mle_tmp.saved_bsp_mtrrs = os_mle_data->saved_bsp_mtrrs;
+
+	/* No PMR check is needed, the TXT heap is covered by the DPR */
+
+	sl_tpm_extend_evtlog(pcr_config, TXT_EVTYPE_SLAUNCH,
+			     (u8 *)&os_mle_tmp,
+			     sizeof(struct txt_os_mle_data),
+			     "Measured TXT OS-MLE data");
+
+	sl_tpm_extend_evtlog(17, TXT_EVTYPE_SLAUNCH_END, NULL, 0, "");
+
+	/*
+	 * Now that the OS-MLE data is measured, ensure the MTRR and
+	 * misc enable MSRs are what we expect.
+	 */
+	sl_txt_validate_msrs(os_mle_data);
+}
diff --git a/arch/x86/boot/compressed/sl_stub.S b/arch/x86/boot/compressed/sl_stub.S
new file mode 100644
index 0000000..e36ef62
--- /dev/null
+++ b/arch/x86/boot/compressed/sl_stub.S
@@ -0,0 +1,685 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Secure Launch protected mode entry point.
+ *
+ * Copyright (c) 2021, Oracle and/or its affiliates.
+ */
+	.code32
+	.text
+#include <linux/linkage.h>
+#include <asm/segment.h>
+#include <asm/msr.h>
+#include <asm/processor-flags.h>
+#include <asm/asm-offsets.h>
+#include <asm/bootparam.h>
+#include <asm/page_types.h>
+#include <asm/irq_vectors.h>
+#include <linux/slaunch.h>
+
+/* CPUID: leaf 1, ECX, SMX feature bit */
+#define X86_FEATURE_BIT_SMX	6
+
+/* Can't include apiddef.h in asm */
+#define XAPIC_ENABLE	(1 << 11)
+#define X2APIC_ENABLE	(1 << 10)
+
+/* Can't include traps.h in asm */
+#define X86_TRAP_NMI	2
+
+/* Can't include mtrr.h in asm */
+#define MTRRphysBase0	0x200
+
+#define IDT_VECTOR_LO_BITS	0
+#define IDT_VECTOR_HI_BITS	6
+
+/*
+ * See the comment in head_64.S for detailed informatoin on what this macro
+ * is used for.
+ */
+#define rva(X) ((X) - sl_stub_entry)
+
+/*
+ * The GETSEC op code is open coded because older versions of
+ * GCC do not support the getsec mnemonic.
+ */
+.macro GETSEC leaf
+	pushl	%ebx
+	xorl	%ebx, %ebx	/* Must be zero for SMCTRL */
+	movl	\leaf, %eax	/* Leaf function */
+	.byte 	0x0f, 0x37	/* GETSEC opcode */
+	popl	%ebx
+.endm
+
+.macro TXT_RESET error
+	/*
+	 * Set a sticky error value and reset. Note the movs to %eax act as
+	 * TXT register barriers.
+	 */
+	movl	\error, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_ERRORCODE)
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_E2STS), %eax
+	movl	$1, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_CMD_NO_SECRETS)
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_E2STS), %eax
+	movl	$1, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_CMD_UNLOCK_MEM_CONFIG)
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_E2STS), %eax
+	movl	$1, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_CMD_RESET)
+1:
+	hlt
+	jmp	1b
+.endm
+
+	.code32
+SYM_FUNC_START(sl_stub_entry)
+	cli
+	cld
+
+	/*
+	 * On entry, %ebx has the entry abs offset to sl_stub_entry. This
+	 * will be correctly scaled using the rva macro and avoid causing
+	 * relocations. Only %cs and %ds segments are known good.
+	 */
+
+	/* Load GDT, set segment regs and lret to __SL32_CS */
+	leal	rva(sl_gdt_desc)(%ebx), %eax
+	addl	%eax, 2(%eax)
+	lgdt	(%eax)
+
+	movl	$(__SL32_DS), %eax
+	movw	%ax, %ds
+	movw	%ax, %es
+	movw	%ax, %fs
+	movw	%ax, %gs
+	movw	%ax, %ss
+
+	/*
+	 * Now that %ss is known good, take the first stack for the BSP. The
+	 * AP stacks are only used on Intel.
+	 */
+	leal	rva(sl_stacks_end)(%ebx), %esp
+
+	leal	rva(.Lsl_cs)(%ebx), %eax
+	pushl	$(__SL32_CS)
+	pushl	%eax
+	lret
+
+.Lsl_cs:
+	/* Save our base pointer reg and page table for MLE */
+	pushl	%ebx
+	pushl	%ecx
+
+	/* See if SMX feature is supported. */
+	movl	$1, %eax
+	cpuid
+	testl	$(X86_FEATURE_BIT_SMX), %ecx
+	jz	.Ldo_unknown_cpu
+
+	popl	%ecx
+	popl	%ebx
+
+	/* Know it is Intel */
+	movl	$(SL_CPU_INTEL), rva(sl_cpu_type)(%ebx)
+
+	/* Locate the base of the MLE using the page tables in %ecx */
+	call	sl_find_mle_base
+
+	/* Increment CPU count for BSP */
+	incl	rva(sl_txt_cpu_count)(%ebx)
+
+	/*
+	 * Enable SMI with GETSEC[SMCTRL] which were disabled by SENTER.
+	 * NMIs were also disabled by SENTER. Since there is no IDT for the BSP,
+	 * allow the mainline kernel re-enable them in the normal course of
+	 * booting.
+	 */
+	GETSEC	$(SMX_X86_GETSEC_SMCTRL)
+
+	/* Clear the TXT error registers for a clean start of day */
+	movl	$0, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_ERRORCODE)
+	movl	$0xffffffff, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_ESTS)
+
+	/* On Intel, the zero page address is passed in the TXT heap */
+	/* Read physical base of heap into EAX */
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_HEAP_BASE), %eax
+	/* Read the size of the BIOS data into ECX (first 8 bytes) */
+	movl	(%eax), %ecx
+	/* Skip over BIOS data and size of OS to MLE data section */
+	leal	8(%eax, %ecx), %eax
+
+	/* Need to verify the values in the OS-MLE struct passed in */
+	call	sl_txt_verify_os_mle_struct
+
+	/*
+	 * Get the boot params address from the heap. Note %esi and %ebx MUST
+	 * be preserved across calls and operations.
+	 */
+	movl	SL_boot_params_addr(%eax), %esi
+
+	/* Save %ebx so the APs can find their way home */
+	movl	%ebx, (SL_mle_scratch + SL_SCRATCH_AP_EBX)(%eax)
+
+	/* Fetch the AP wake code block address from the heap */
+	movl	SL_ap_wake_block(%eax), %edi
+	movl	%edi, rva(sl_txt_ap_wake_block)(%ebx)
+
+	/* Store the offset in the AP wake block to the jmp address */
+	movl	$(sl_ap_jmp_offset - sl_txt_ap_wake_begin), \
+		(SL_mle_scratch + SL_SCRATCH_AP_JMP_OFFSET)(%eax)
+
+	/* %eax still is the base of the OS-MLE block, save it */
+	pushl	%eax
+
+	/* Relocate the AP wake code to the safe block */
+	call	sl_txt_reloc_ap_wake
+
+	/*
+	 * Wake up all APs that are blocked in the ACM and wait for them to
+	 * halt. This should be done before restoring the MTRRs so the ACM is
+	 * still properly in WB memory.
+	 */
+	call	sl_txt_wake_aps
+
+	/*
+	 * Pop OS-MLE base address (was in %eax above) for call to load
+	 * MTRRs/MISC MSR
+	 */
+	popl	%edi
+	call	sl_txt_load_regs
+
+	jmp	.Lcpu_setup_done
+
+.Ldo_unknown_cpu:
+	/* Non-Intel CPUs are not yet supported */
+	ud2
+
+.Lcpu_setup_done:
+	/*
+	 * Don't enable MCE at this point. The kernel will enable
+	 * it on the BSP later when it is ready.
+	 */
+
+	/* Done, jump to normal 32b pm entry */
+	jmp	startup_32
+SYM_FUNC_END(sl_stub_entry)
+
+SYM_FUNC_START(sl_find_mle_base)
+	/* %ecx has PDPT, get first PD */
+	movl	(%ecx), %eax
+	andl	$(PAGE_MASK), %eax
+	/* Get first PT from first PDE */
+	movl	(%eax), %eax
+	andl	$(PAGE_MASK), %eax
+	/* Get MLE base from first PTE */
+	movl	(%eax), %eax
+	andl	$(PAGE_MASK), %eax
+
+	movl	%eax, rva(sl_mle_start)(%ebx)
+	ret
+SYM_FUNC_END(sl_find_mle_base)
+
+SYM_FUNC_START(sl_check_buffer_mle_overlap)
+	/* %ecx: buffer begin %edx: buffer end */
+	/* %ebx: MLE begin %edi: MLE end */
+
+	cmpl	%edi, %ecx
+	jb	.Lnext_check
+	cmpl	%edi, %edx
+	jbe	.Lnext_check
+	jmp	.Lvalid /* Buffer above MLE */
+
+.Lnext_check:
+	cmpl	%ebx, %edx
+	ja	.Linvalid
+	cmpl	%ebx, %ecx
+	jae	.Linvalid
+	jmp	.Lvalid /* Buffer below MLE */
+
+.Linvalid:
+	TXT_RESET $(SL_ERROR_MLE_BUFFER_OVERLAP)
+
+.Lvalid:
+	ret
+SYM_FUNC_END(sl_check_buffer_mle_overlap)
+
+SYM_FUNC_START(sl_txt_verify_os_mle_struct)
+	pushl	%ebx
+	/*
+	 * %eax points to the base of the OS-MLE struct. Need to also
+	 * read some values from the OS-SINIT struct too.
+	 */
+	movl	-8(%eax), %ecx
+	/* Skip over OS to MLE data section and size of OS-SINIT structure */
+	leal	(%eax, %ecx), %edx
+
+	/* Load MLE image base absolute offset */
+	movl	rva(sl_mle_start)(%ebx), %ebx
+
+	/* Verify the value of the low PMR base. It should always be 0. */
+	movl	SL_vtd_pmr_lo_base(%edx), %esi
+	cmpl	$0, %esi
+	jz	.Lvalid_pmr_base
+	TXT_RESET $(SL_ERROR_LO_PMR_BASE)
+
+.Lvalid_pmr_base:
+	/* Grab some values from OS-SINIT structure */
+	movl	SL_mle_size(%edx), %edi
+	addl	%ebx, %edi
+	jc	.Loverflow_detected
+	movl	SL_vtd_pmr_lo_size(%edx), %esi
+
+	/* Check the AP wake block */
+	movl	SL_ap_wake_block(%eax), %ecx
+	movl	SL_ap_wake_block_size(%eax), %edx
+	addl	%ecx, %edx
+	jc	.Loverflow_detected
+	call	sl_check_buffer_mle_overlap
+	cmpl	%esi, %edx
+	ja	.Lbuffer_beyond_pmr
+
+	/* Check the boot params */
+	movl	SL_boot_params_addr(%eax), %ecx
+	movl	$(PAGE_SIZE), %edx
+	addl	%ecx, %edx
+	jc	.Loverflow_detected
+	call	sl_check_buffer_mle_overlap
+	cmpl	%esi, %edx
+	ja	.Lbuffer_beyond_pmr
+
+	/* Check that the AP wake block is big enough */
+	cmpl	$(sl_txt_ap_wake_end - sl_txt_ap_wake_begin), \
+		SL_ap_wake_block_size(%eax)
+	jae	.Lwake_block_ok
+	TXT_RESET $(SL_ERROR_WAKE_BLOCK_TOO_SMALL)
+
+.Lwake_block_ok:
+	popl	%ebx
+	ret
+
+.Loverflow_detected:
+	TXT_RESET $(SL_ERROR_INTEGER_OVERFLOW)
+
+.Lbuffer_beyond_pmr:
+	TXT_RESET $(SL_ERROR_BUFFER_BEYOND_PMR)
+SYM_FUNC_END(sl_txt_verify_os_mle_struct)
+
+SYM_FUNC_START(sl_txt_ap_entry)
+	cli
+	cld
+	/*
+	 * The %cs and %ds segments are known good after waking the AP.
+	 * First order of business is to find where we are and
+	 * save it in %ebx.
+	 */
+
+	/* Read physical base of heap into EAX */
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_HEAP_BASE), %eax
+	/* Read the size of the BIOS data into ECX (first 8 bytes) */
+	movl	(%eax), %ecx
+	/* Skip over BIOS data and size of OS to MLE data section */
+	leal	8(%eax, %ecx), %eax
+
+	/* Saved %ebx from the BSP and stash OS-MLE pointer */
+	movl	(SL_mle_scratch + SL_SCRATCH_AP_EBX)(%eax), %ebx
+	/* Save OS-MLE base in %edi for call to sl_txt_load_regs */
+	movl	%eax, %edi
+
+	/* Lock and get our stack index */
+	movl	$1, %ecx
+.Lspin:
+	xorl	%eax, %eax
+	lock cmpxchgl	%ecx, rva(sl_txt_spin_lock)(%ebx)
+	pause
+	jnz	.Lspin
+
+	/* Increment the stack index and use the next value inside lock */
+	incl	rva(sl_txt_stack_index)(%ebx)
+	movl	rva(sl_txt_stack_index)(%ebx), %eax
+
+	/* Unlock */
+	movl	$0, rva(sl_txt_spin_lock)(%ebx)
+
+	/* Location of the relocated AP wake block */
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %ecx
+
+	/* Load reloc GDT, set segment regs and lret to __SL32_CS */
+	lgdt	(sl_ap_gdt_desc - sl_txt_ap_wake_begin)(%ecx)
+
+	movl	$(__SL32_DS), %edx
+	movw	%dx, %ds
+	movw	%dx, %es
+	movw	%dx, %fs
+	movw	%dx, %gs
+	movw	%dx, %ss
+
+	/* Load our reloc AP stack */
+	movl	$(TXT_BOOT_STACK_SIZE), %edx
+	mull	%edx
+	leal	(sl_stacks_end - sl_txt_ap_wake_begin)(%ecx), %esp
+	subl	%eax, %esp
+
+	/* Switch to AP code segment */
+	leal	rva(.Lsl_ap_cs)(%ebx), %eax
+	pushl	$(__SL32_CS)
+	pushl	%eax
+	lret
+
+.Lsl_ap_cs:
+	/* Load the relocated AP IDT */
+	lidt	(sl_ap_idt_desc - sl_txt_ap_wake_begin)(%ecx)
+
+	/* Fixup MTRRs and misc enable MSR on APs too */
+	call	sl_txt_load_regs
+
+	/* Enable SMI with GETSEC[SMCTRL] */
+	GETSEC $(SMX_X86_GETSEC_SMCTRL)
+
+	/* IRET-to-self can be used to enable NMIs which SENTER disabled */
+	leal	rva(.Lnmi_enabled_ap)(%ebx), %eax
+	pushfl
+	pushl	$(__SL32_CS)
+	pushl	%eax
+	iret
+
+.Lnmi_enabled_ap:
+	/* Put APs in X2APIC mode like the BSP */
+	movl	$(MSR_IA32_APICBASE), %ecx
+	rdmsr
+	orl	$(XAPIC_ENABLE | X2APIC_ENABLE), %eax
+	wrmsr
+
+	/*
+	 * Basically done, increment the CPU count and jump off to the AP
+	 * wake block to wait.
+	 */
+	lock incl	rva(sl_txt_cpu_count)(%ebx)
+
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %eax
+	jmp	*%eax
+SYM_FUNC_END(sl_txt_ap_entry)
+
+SYM_FUNC_START(sl_txt_reloc_ap_wake)
+	/* Save boot params register */
+	pushl	%esi
+
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %edi
+
+	/* Fixup AP IDT and GDT descriptor before relocating */
+	leal	rva(sl_ap_idt_desc)(%ebx), %eax
+	addl	%edi, 2(%eax)
+	leal	rva(sl_ap_gdt_desc)(%ebx), %eax
+	addl	%edi, 2(%eax)
+
+	/*
+	 * Copy the AP wake code and AP GDT/IDT to the protected wake block
+	 * provided by the loader. Destination already in %edi.
+	 */
+	movl	$(sl_txt_ap_wake_end - sl_txt_ap_wake_begin), %ecx
+	leal	rva(sl_txt_ap_wake_begin)(%ebx), %esi
+	rep movsb
+
+	/* Setup the IDT for the APs to use in the relocation block */
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %ecx
+	addl	$(sl_ap_idt - sl_txt_ap_wake_begin), %ecx
+	xorl	%edx, %edx
+
+	/* Form the default reset vector relocation address */
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %esi
+	addl	$(sl_txt_int_reset - sl_txt_ap_wake_begin), %esi
+
+1:
+	cmpw	$(NR_VECTORS), %dx
+	jz	.Lap_idt_done
+
+	cmpw	$(X86_TRAP_NMI), %dx
+	jz	2f
+
+	/* Load all other fixed vectors with reset handler */
+	movl	%esi, %eax
+	movw	%ax, (IDT_VECTOR_LO_BITS)(%ecx)
+	shrl	$16, %eax
+	movw	%ax, (IDT_VECTOR_HI_BITS)(%ecx)
+	jmp	3f
+
+2:
+	/* Load single wake NMI IPI vector at the relocation address */
+	movl	rva(sl_txt_ap_wake_block)(%ebx), %eax
+	addl	$(sl_txt_int_ipi_wake - sl_txt_ap_wake_begin), %eax
+	movw	%ax, (IDT_VECTOR_LO_BITS)(%ecx)
+	shrl	$16, %eax
+	movw	%ax, (IDT_VECTOR_HI_BITS)(%ecx)
+
+3:
+	incw	%dx
+	addl	$8, %ecx
+	jmp	1b
+
+.Lap_idt_done:
+	popl	%esi
+	ret
+SYM_FUNC_END(sl_txt_reloc_ap_wake)
+
+SYM_FUNC_START(sl_txt_load_regs)
+	/* Save base pointer register */
+	pushl	%ebx
+
+	/*
+	 * On Intel, the original variable MTRRs and Misc Enable MSR are
+	 * restored on the BSP at early boot. Each AP will also restore
+	 * its MTRRs and Misc Enable MSR.
+	 */
+	pushl	%edi
+	addl	$(SL_saved_bsp_mtrrs), %edi
+	movl	(%edi), %ebx
+	pushl	%ebx /* default_mem_type lo */
+	addl	$4, %edi
+	movl	(%edi), %ebx
+	pushl	%ebx /* default_mem_type hi */
+	addl	$4, %edi
+	movl	(%edi), %ebx /* mtrr_vcnt lo, don't care about hi part */
+	addl	$8, %edi /* now at MTRR pair array */
+	/* Write the variable MTRRs */
+	movl	$(MTRRphysBase0), %ecx
+1:
+	cmpl	$0, %ebx
+	jz	2f
+
+	movl	(%edi), %eax /* MTRRphysBaseX lo */
+	addl	$4, %edi
+	movl	(%edi), %edx /* MTRRphysBaseX hi */
+	wrmsr
+	addl	$4, %edi
+	incl	%ecx
+	movl	(%edi), %eax /* MTRRphysMaskX lo */
+	addl	$4, %edi
+	movl	(%edi), %edx /* MTRRphysMaskX hi */
+	wrmsr
+	addl	$4, %edi
+	incl	%ecx
+
+	decl	%ebx
+	jmp	1b
+2:
+	/* Write the default MTRR register */
+	popl	%edx
+	popl	%eax
+	movl	$(MSR_MTRRdefType), %ecx
+	wrmsr
+
+	/* Return to beginning and write the misc enable msr */
+	popl	%edi
+	addl	$(SL_saved_misc_enable_msr), %edi
+	movl	(%edi), %eax /* saved_misc_enable_msr lo */
+	addl	$4, %edi
+	movl	(%edi), %edx /* saved_misc_enable_msr hi */
+	movl	$(MSR_IA32_MISC_ENABLE), %ecx
+	wrmsr
+
+	popl	%ebx
+	ret
+SYM_FUNC_END(sl_txt_load_regs)
+
+SYM_FUNC_START(sl_txt_wake_aps)
+	/* Save boot params register */
+	pushl	%esi
+
+	/* First setup the MLE join structure and load it into TXT reg */
+	leal	rva(sl_gdt)(%ebx), %eax
+	leal	rva(sl_txt_ap_entry)(%ebx), %ecx
+	leal	rva(sl_smx_rlp_mle_join)(%ebx), %edx
+	movl	%eax, SL_rlp_gdt_base(%edx)
+	movl	%ecx, SL_rlp_entry_point(%edx)
+	movl	%edx, (TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_MLE_JOIN)
+
+	/* Another TXT heap walk to find various values needed to wake APs */
+	movl	(TXT_PRIV_CONFIG_REGS_BASE + TXT_CR_HEAP_BASE), %eax
+	/* At BIOS data size, find the number of logical processors */
+	movl	(SL_num_logical_procs + 8)(%eax), %edx
+	/* Skip over BIOS data */
+	movl	(%eax), %ecx
+	addl	%ecx, %eax
+	/* Skip over OS to MLE */
+	movl	(%eax), %ecx
+	addl	%ecx, %eax
+	/* At OS-SNIT size, get capabilities to know how to wake up the APs */
+	movl	(SL_capabilities + 8)(%eax), %esi
+	/* Skip over OS to SNIT */
+	movl	(%eax), %ecx
+	addl	%ecx, %eax
+	/* At SINIT-MLE size, get the AP wake MONITOR address */
+	movl	(SL_rlp_wakeup_addr + 8)(%eax), %edi
+
+	/* Determine how to wake up the APs */
+	testl	$(1 << TXT_SINIT_MLE_CAP_WAKE_MONITOR), %esi
+	jz	.Lwake_getsec
+
+	/* Wake using MWAIT MONITOR */
+	movl	$1, (%edi)
+	jmp	.Laps_awake
+
+.Lwake_getsec:
+	/* Wake using GETSEC(WAKEUP) */
+	GETSEC	$(SMX_X86_GETSEC_WAKEUP)
+
+.Laps_awake:
+	/*
+	 * All of the APs are woken up and rendesvous in the relocated wake
+	 * block starting at sl_txt_ap_wake_begin. Wait for all of them to
+	 * halt.
+	 */
+	pause
+	cmpl	rva(sl_txt_cpu_count)(%ebx), %edx
+	jne	.Laps_awake
+
+	popl	%esi
+	ret
+SYM_FUNC_END(sl_txt_wake_aps)
+
+/* This is the beginning of the relocated AP wake code block */
+	.global sl_txt_ap_wake_begin
+sl_txt_ap_wake_begin:
+
+	/*
+	 * Wait for NMI IPI in the relocated AP wake block which was provided
+	 * and protected in the memory map by the prelaunch code. Leave all
+	 * other interrupts masked since we do not expect anything but an NMI.
+	 */
+	xorl	%edx, %edx
+
+1:
+	hlt
+	testl	%edx, %edx
+	jz	1b
+
+	/*
+	 * This is the long absolute jump to the 32b Secure Launch protected
+	 * mode stub code in the rmpiggy. The jump address will be fixed in
+	 * the SMP boot code when the first AP is brought up. This whole area
+	 * is provided and protected in the memory map by the prelaunch code.
+	 */
+	.byte	0xea
+sl_ap_jmp_offset:
+	.long	0x00000000
+	.word	__SL32_CS
+
+SYM_FUNC_START(sl_txt_int_ipi_wake)
+	movl	$1, %edx
+
+	/* NMI context, just IRET */
+	iret
+SYM_FUNC_END(sl_txt_int_ipi_wake)
+
+SYM_FUNC_START(sl_txt_int_reset)
+	TXT_RESET $(SL_ERROR_INV_AP_INTERRUPT)
+SYM_FUNC_END(sl_txt_int_reset)
+
+	.balign 8
+SYM_DATA_START_LOCAL(sl_ap_idt_desc)
+	.word	sl_ap_idt_end - sl_ap_idt - 1		/* Limit */
+	.long	sl_ap_idt - sl_txt_ap_wake_begin	/* Base */
+SYM_DATA_END_LABEL(sl_ap_idt_desc, SYM_L_LOCAL, sl_ap_idt_desc_end)
+
+	.balign 8
+SYM_DATA_START_LOCAL(sl_ap_idt)
+	.rept	NR_VECTORS
+	.word	0x0000		/* Offset 15 to 0 */
+	.word	__SL32_CS	/* Segment selector */
+	.word	0x8e00		/* Present, DPL=0, 32b Vector, Interrupt */
+	.word	0x0000		/* Offset 31 to 16 */
+	.endr
+SYM_DATA_END_LABEL(sl_ap_idt, SYM_L_LOCAL, sl_ap_idt_end)
+
+	.balign 8
+SYM_DATA_START_LOCAL(sl_ap_gdt_desc)
+	.word	sl_ap_gdt_end - sl_ap_gdt - 1
+	.long	sl_ap_gdt - sl_txt_ap_wake_begin
+SYM_DATA_END_LABEL(sl_ap_gdt_desc, SYM_L_LOCAL, sl_ap_gdt_desc_end)
+
+	.balign	8
+SYM_DATA_START_LOCAL(sl_ap_gdt)
+	.quad	0x0000000000000000	/* NULL */
+	.quad	0x00cf9a000000ffff	/* __SL32_CS */
+	.quad	0x00cf92000000ffff	/* __SL32_DS */
+SYM_DATA_END_LABEL(sl_ap_gdt, SYM_L_LOCAL, sl_ap_gdt_end)
+
+	/* Small stacks for BSP and APs to work with */
+	.balign 4
+SYM_DATA_START_LOCAL(sl_stacks)
+	.fill (TXT_MAX_CPUS * TXT_BOOT_STACK_SIZE), 1, 0
+SYM_DATA_END_LABEL(sl_stacks, SYM_L_LOCAL, sl_stacks_end)
+
+/* This is the end of the relocated AP wake code block */
+	.global sl_txt_ap_wake_end
+sl_txt_ap_wake_end:
+
+	.data
+	.balign 8
+SYM_DATA_START_LOCAL(sl_gdt_desc)
+	.word	sl_gdt_end - sl_gdt - 1
+	.long	sl_gdt - sl_gdt_desc
+SYM_DATA_END_LABEL(sl_gdt_desc, SYM_L_LOCAL, sl_gdt_desc_end)
+
+	.balign	8
+SYM_DATA_START_LOCAL(sl_gdt)
+	.quad	0x0000000000000000	/* NULL */
+	.quad	0x00cf9a000000ffff	/* __SL32_CS */
+	.quad	0x00cf92000000ffff	/* __SL32_DS */
+SYM_DATA_END_LABEL(sl_gdt, SYM_L_LOCAL, sl_gdt_end)
+
+	.balign 8
+SYM_DATA_START_LOCAL(sl_smx_rlp_mle_join)
+	.long	sl_gdt_end - sl_gdt - 1	/* GDT limit */
+	.long	0x00000000		/* GDT base */
+	.long	__SL32_CS	/* Seg Sel - CS (DS, ES, SS = seg_sel+8) */
+	.long	0x00000000	/* Entry point physical address */
+SYM_DATA_END(sl_smx_rlp_mle_join)
+
+SYM_DATA(sl_cpu_type, .long 0x00000000)
+
+SYM_DATA(sl_mle_start, .long 0x00000000)
+
+SYM_DATA_LOCAL(sl_txt_spin_lock, .long 0x00000000)
+
+SYM_DATA_LOCAL(sl_txt_stack_index, .long 0x00000000)
+
+SYM_DATA_LOCAL(sl_txt_cpu_count, .long 0x00000000)
+
+SYM_DATA_LOCAL(sl_txt_ap_wake_block, .long 0x00000000)
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index ecd3fd6..b665c51 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -12,6 +12,7 @@
 #include <linux/hardirq.h>
 #include <linux/suspend.h>
 #include <linux/kbuild.h>
+#include <linux/slaunch.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
 #include <asm/sigframe.h>
@@ -93,4 +94,22 @@ static void __used common(void)
 	OFFSET(TSS_sp0, tss_struct, x86_tss.sp0);
 	OFFSET(TSS_sp1, tss_struct, x86_tss.sp1);
 	OFFSET(TSS_sp2, tss_struct, x86_tss.sp2);
+
+#ifdef CONFIG_SECURE_LAUNCH
+	BLANK();
+	OFFSET(SL_boot_params_addr, txt_os_mle_data, boot_params_addr);
+	OFFSET(SL_saved_misc_enable_msr, txt_os_mle_data, saved_misc_enable_msr);
+	OFFSET(SL_saved_bsp_mtrrs, txt_os_mle_data, saved_bsp_mtrrs);
+	OFFSET(SL_ap_wake_block, txt_os_mle_data, ap_wake_block);
+	OFFSET(SL_ap_wake_block_size, txt_os_mle_data, ap_wake_block_size);
+	OFFSET(SL_mle_scratch, txt_os_mle_data, mle_scratch);
+	OFFSET(SL_num_logical_procs, txt_bios_data, num_logical_procs);
+	OFFSET(SL_capabilities, txt_os_sinit_data, capabilities);
+	OFFSET(SL_mle_size, txt_os_sinit_data, mle_size);
+	OFFSET(SL_vtd_pmr_lo_base, txt_os_sinit_data, vtd_pmr_lo_base);
+	OFFSET(SL_vtd_pmr_lo_size, txt_os_sinit_data, vtd_pmr_lo_size);
+	OFFSET(SL_rlp_wakeup_addr, txt_sinit_mle_data, rlp_wakeup_addr);
+	OFFSET(SL_rlp_gdt_base, smx_rlp_mle_join, rlp_gdt_base);
+	OFFSET(SL_rlp_entry_point, smx_rlp_mle_join, rlp_entry_point);
+#endif
 }
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
