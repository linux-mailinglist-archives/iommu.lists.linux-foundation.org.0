Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BC3F9997
	for <lists.iommu@lfdr.de>; Fri, 27 Aug 2021 15:22:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1955426B8;
	Fri, 27 Aug 2021 13:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueHGvWdPX1Tc; Fri, 27 Aug 2021 13:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9987C4274C;
	Fri, 27 Aug 2021 13:21:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9788C0027;
	Fri, 27 Aug 2021 13:21:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2961BC000E
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25CDD426C0
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WjXNigm6SQx for <iommu@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 13:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8B6D42736
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:21:07 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RA2VEa020754;
 Fri, 27 Aug 2021 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZzndYLWZUsiuGQo9VdjQB9BkSPTnpPKZ+XKR0Gg7EI8=;
 b=0YGFuUWPlzeS+IdqrsY2nglnH4NqKExmrNXusl+PyxS4JOl2uxQ+8ze3JZ/oiCroHAlu
 xhrPyYFl0gamAE2T33bW7bzCGga1pTcoM/rDkdCDVm9SzLzU5scab5D3iH9vddWEw9N3
 d+6FQPQjcbUnCJ1/f9EeFy9+ZGcmmUcr/48hQnQvTQd308i9AGttrfjANlLLi2ZQQmiZ
 m1XMUd10o2ZJlBzc4kGi6i8bPlijtQ7WaDdNO6c6uG6dfDopfJ0nqS2j0oPFdcO8Lydb
 WVSmHLkx4bGi4dy2wQ2CkzJU/dNZTnMBDgau0G6XsBu2KlykzbJ3chUZa2dcPTlzQwHn aQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZzndYLWZUsiuGQo9VdjQB9BkSPTnpPKZ+XKR0Gg7EI8=;
 b=Mc4gP1kSJoA/mhIzIYt6Uxl1DPvYrHCmhy0U9pzBRTerM1KLOXHY+saZmDfVEZfm+wKN
 +m1XY/EP7vp/8FqU5ZpHtIaTtRvI+qmxekgekbJQ4Acq7e6hh1iGh2orx1fxyWR2uBsF
 lFNh4L8J/Ixs1LukaoqQCsr2A9xWTHeir5oPWNxKwpi43ehLE7OwQqft+lKxUd8wNTEp
 z35xXGYYwBuQtLKPIV9VZM12TFFtkqgA2dMShLRSmNNqdSSniYVSacHyhNdeLfkAx7TL
 XZA8aL89ufydNhYQN6DMSI6rZ0M4UNZ/SRRtwYiXBqHGVzbZ8W3Eaycgtl2ULeCtdkRD uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap4ekunbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 13:20:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RDBY2q007529;
 Fri, 27 Aug 2021 13:20:46 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by aserp3030.oracle.com with ESMTP id 3ajqhmjm83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 13:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApQeq2ff7Nwp89pggCcuSUcZMSWNs5/0URzFRDjraz3I1gxHkW8kMK4O7koVFNGCyJF/hYGKiccxyWSsvpnTy0kyCPFADCklbDC3E7z2tQrq9DyYWmCKP4iAsSWdwZRQ7SOQbMqKgl7B0u5xkJi1g6SFlP6Bt7ZzNPFZLVbhXrL8g9RvH38ISGBI8jDnaPsTIowCjrZ1cyADomDOdTyZPEgKwb2duxuSG+FCaXUMfn3uptGs5m2LgwQ8MFrefUIsHYrxombiy/yPl+A7tieZLNzpKIJvg2ABH7MBBt2cJoNMB3dmh3RShk6pDw8gcXI8t8abd9G8V2tC7ElDMxaGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzndYLWZUsiuGQo9VdjQB9BkSPTnpPKZ+XKR0Gg7EI8=;
 b=aEpqTcEh+pfG+r0lkiXVhRskJRBx1isB9PssXE24mY6FYtxCFMziR/E9/3UCf90JaT6Z+57ifdbOs8xlrPY379yyVMCG1DHls206YCqRlKpCgT0V45nHhkrWwu6nZSgv3wm2ylxz6uwm4iMNkDrBxHmYorYM8zdXUJvW97lu3U9hneKlYiZIUMpLSHbuy04YZnQsmdnouFfANHMQT4+1lCC64lF87F4XlVumKqtTbM2JUEb1YSywLG9Tpm45jBkfeOy4YpxotXFAtIXhv/h1cZd7pWbRzeTNTeD9mVBCr17AuLm5l4zlwutYG6ZiyGetyTm/0mZCmfTfU7Wrf7G9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzndYLWZUsiuGQo9VdjQB9BkSPTnpPKZ+XKR0Gg7EI8=;
 b=Q7oBjiw4n9jo8RlOGDcAhJ+j8HIA+6HEmWxqoFYNhf4mUGprEzbvdiFTVGmk3sc0cR2yFys2qmo9N4bhG6mNXTR4ZZn6hJZTVhvvJ97J8jHORyVD49QSJZhcjex/ORSQf8UydlGnXtZy4+1kw0ximrih9sNmbNGUeULpr6eVmxI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by BYAPR10MB3237.namprd10.prod.outlook.com (2603:10b6:a03:153::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 13:20:43 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3%4]) with mapi id 15.20.4457.020; Fri, 27 Aug 2021
 13:20:43 +0000
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v4 04/14] Documentation/x86: Secure Launch kernel documentation
Date: Fri, 27 Aug 2021 09:28:27 -0400
Message-Id: <1630070917-9896-5-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630070917-9896-1-git-send-email-ross.philipson@oracle.com>
References: <1630070917-9896-1-git-send-email-ross.philipson@oracle.com>
X-ClientProxiedBy: SN6PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:805:de::24) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lateralus.us.oracle.com (209.17.40.45) by
 SN6PR05CA0011.namprd05.prod.outlook.com (2603:10b6:805:de::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.8 via Frontend Transport; Fri, 27 Aug 2021 13:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12eb0bc3-acba-4295-33f6-08d9695d791a
X-MS-TrafficTypeDiagnostic: BYAPR10MB3237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB32371A58E5530127616F7323E6C89@BYAPR10MB3237.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgmEwYddyipRwjKjzXxYWlQfL1Q11SqTrGww88ugRc6KrUnXUqPtbKlQiNG5aUYiHExrUPo+QeJiUn5+1iNnUdfI89ENkbCK8SyPsBS2lwEIeBcQPye00soYAv8GQALsu2v+xCO8PSCqx46BNomglDv41qXtK+2t2BGlZbzU9GjI+8aMy0vOxR7UZt0yHoJaJ9dmyggy4YAybOcR+nE2Lp4Ex521zCGxuuN0HnmYkyV+zWan9Q1Kxv9kV6hoLm2KoB9N8nOXpHF7d8tdvw5Zlbf6EN5548D3scpGnIY9jEO3YrZRFkJmg1ac8+cY6bMVsm1mq1G8rv5tswd+9LJaweRCpFYH+K6YGJhkc54+00Mop3PTd1PGeQAjaoqoo3wbXfXqp9XBBfNs3FPLojUwZfioYwhfG7kQk+1idBhwSt17/DR9pUOrTeWqNQ+3GbwEr1HzA1LTXW7zApUphiy31gSN7p905+t8dwhp/ao90g9DoU4uwV2DC6SWbWsBVExgllc4wy5P+dUaqaqaMMYaz0KrctGmLsGlsvxrHP6/Z4ABUMhmMYv3oUMbTV8eYvUB2ySA5phNnF3l8U024mEgJZxGPMLTHGXLPVSZiqX9iauu4RJU1q+MjD14v6LPKmrh9hrt7p4gGOOJRug8FEjXVlH9/CoewWl3QppeBqna+Kc6ttfSdohaFJFomKyisQcXC+6+dfWCVP/YkQ93jWxSpPLUVNY6jBepxhPTBW1hvUNlRsqB/ZQWHvXEwMRmB/GA4LSH+LxgJCGDoOAaAyXf6Vv7E8jYFk1hWb+XPlrMb5sMR0/GbgzI5MIJfyW8Hk2fWiVGzUL8P+ilSi+ENBdgeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB3793.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(956004)(44832011)(2616005)(30864003)(2906002)(52116002)(26005)(7696005)(478600001)(38350700002)(38100700002)(6486002)(36756003)(186003)(83380400001)(6666004)(86362001)(8936002)(8676002)(316002)(66946007)(66556008)(4326008)(66476007)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0usQz+8aXqElnfqEgQDgy1t2//HMSqFbl3VDMfH9JW2SZf8xxC+AuNfxH9V?=
 =?us-ascii?Q?2zVauuDIogVBMyxUu1hEk7mJVfYVFIamLY+9N7rBoL6zg22tSr3DHVz2/FCK?=
 =?us-ascii?Q?hwcoyRHQcGLCiDuAAjAm7edJuZZeSwnHp8bWUh2Z9/9ljTF/s0wPmj62TzlS?=
 =?us-ascii?Q?opn5sbCyru2P3GfbFZiWnqfVBO9ZyElOaRUhQx0C/xyG8pI08V8rm8H/Pd+M?=
 =?us-ascii?Q?qJ0YG28Z2jJq7U5qksw37dey5zOnUdozgpNMGVL83wXRkekyoEDkhwsNUxFo?=
 =?us-ascii?Q?mwMnYspWEg6VMFH5yVWb+Aur/5aFAOEsw5x0CBWvH6WHwWzSf7MoETURMGgI?=
 =?us-ascii?Q?2ZKQ13cC4w1/Vkl1qUuIRInC6iBc+HGdcuvONV590DTR9lZ+dbveA6x4Wjal?=
 =?us-ascii?Q?TA47rEjDXvNFlvWN9NQBfoNYcLKZ5th9mbOKKsPwOgsiImokjjDe3K6wPAZv?=
 =?us-ascii?Q?Olnaz28S0ATEE5/afhH3egCbF9DNw7nnXSJIjRWS6J1AfRAqzRGviKCpG8fA?=
 =?us-ascii?Q?Ar1eoVUyT3ND3dcajoQM0ftZG+H/ZnnPVC1AVaNzSokZj695IQOGJIMLMnSG?=
 =?us-ascii?Q?4AaqErVS4anQHtb7WSv8OC1HRHsD9HYrSdDdBD80sP2kGUushg0RgvMFD/sS?=
 =?us-ascii?Q?H1Fj262TlInK53DfWuU3FUZDXcqRpEDxuwz56U//9L8QtLGN2XHIlurMkdq1?=
 =?us-ascii?Q?MKURAXB2ypp1jMegW/26jth6DPuXhWcqnw9vaDK0aupIUCivgGXGM6CZxXOs?=
 =?us-ascii?Q?JPLIOf8XIhlQWQYaFNWLIjHJTll9q6oS0N7gK8VEpZs6gPzzPNXeuw9p+pTT?=
 =?us-ascii?Q?6RI/9Mu776T2s6ib2oro9bl4doQkb+SzeeQ295zLoAK79Eh70R1AM1LBKw+7?=
 =?us-ascii?Q?K41ggWWnto+9C2UphdL1osmfwA+D4za/U96kmFJLaQ3FPfkqyCCtNwsbq5tP?=
 =?us-ascii?Q?ZuEylqJ3KSQyEYHxFIEJWCQVn+fjblFlY0HO73aiCH1l1rNxvbDORfPLOe4N?=
 =?us-ascii?Q?jj3NI6R31+xA7xPUkswFsHn1pl1f6/ps1uqcYBxaLOt0Oghm+p0FsQYKDKG6?=
 =?us-ascii?Q?PHc8XFr1QUTKFqNmO34Ms9vhs/NzQQhhmZoY+Dz8klQeZIO2doDdTrxj+Fl9?=
 =?us-ascii?Q?Ez+sx95idGfMO55NdWEAzlmQPo2gh35fhFRbCcTOxdx0MC2UWUPmDCZSBVCu?=
 =?us-ascii?Q?E/lqrnVATJOQaEvI3HHQI/WtWovmsZOC6YSI6mDhcZ1e4UOKxrK+dhofXTii?=
 =?us-ascii?Q?KDesioppH9GaJWjyWqwwbz06BrR+5Aoqn3rNtMh4ihbsv9/0Cl7hz8e54kgw?=
 =?us-ascii?Q?u2J1xXBje/lC5kw896mBcnug?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eb0bc3-acba-4295-33f6-08d9695d791a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 13:20:43.5910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFKKLFzLlK3DJrrHAX74hfY9yYRh6Oilq4dtW6cREKimMtaQngZFEoso5HzgmNgtSZ7YnkbCHuF+QfDWhs6hC6dUicvzTFtVj2UzsB2ZuWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3237
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10088
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270086
X-Proofpoint-GUID: FU9UlOJ9MrvAEny2PdOvN7v7kpsijdDS
X-Proofpoint-ORIG-GUID: FU9UlOJ9MrvAEny2PdOvN7v7kpsijdDS
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

Introduce background, overview and configuration/ABI information
for the Secure Launch kernel feature.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 Documentation/x86/index.rst         |   1 +
 Documentation/x86/secure-launch.rst | 716 ++++++++++++++++++++++++++++++++++++
 2 files changed, 717 insertions(+)
 create mode 100644 Documentation/x86/secure-launch.rst

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index 3830483..e5a058f 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -31,6 +31,7 @@ x86-specific Documentation
    tsx_async_abort
    buslock
    usb-legacy-support
+   secure-launch
    i386/index
    x86_64/index
    sva
diff --git a/Documentation/x86/secure-launch.rst b/Documentation/x86/secure-launch.rst
new file mode 100644
index 0000000..95bb193
--- /dev/null
+++ b/Documentation/x86/secure-launch.rst
@@ -0,0 +1,716 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+Secure Launch
+=============
+
+Background
+==========
+
+The Trusted Computing Group (TCG) architecture defines two methods in
+which the target operating system is started, aka launched, on a system
+for which Intel and AMD provides implementations. These two launch types
+are static launch and dynamic launch. Static launch is referred to as
+such because it happens at one fixed point, at system startup, during
+the defined life-cycle of a system. Dynamic launch is referred to as
+such because it is not limited to being done once nor bound to system
+startup. It can in fact happen at anytime without incurring/requiring an
+associated power event for the system. Since dynamic launch can happen
+at anytime, this results in dynamic launch being split into two type of
+its own. The first is referred to as an early launch, where the dynamic
+launch is done in conjunction with the static lunch of the system. The
+second is referred to as a late launch, where a dynamic launch is
+initiated after the static launch was fully completed and the system was
+under the control of some target operating system or run-time kernel.
+These two top-level launch methods, static launch and dynamic launch
+provide different models for establishing the launch integrity, i.e. the
+load-time integrity, of the target operating system. When cryptographic
+hashing is used to create an integrity assessment for the launch
+integrity, then for a static launch this is referred to as the Static
+Root of Trust for Measurement (SRTM) and for dynamic launch it is
+referred to as the Dynamic Root of Trust for Measurement (DRTM).
+
+The reasoning for needing the two integrity models is driven by the fact
+that these models leverage what is referred to as a "transitive trust".
+A transitive trust is commonly referred to as a "trust chain", which is
+created through the process of an entity making an integrity assessment
+of another entity and upon success transfers control to the new entity.
+This process is then repeated by each entity until the Trusted Computing
+Base (TCB) of system has been established. A challenge for transitive
+trust is that the process is susceptible to cumulative error
+and in this case that error is inaccurate or improper integrity
+assessments. The way to address cumulative error is to reduce the
+number of instances that can create error involved in the process.  In
+this case it would be to reduce then number of entities involved in the
+transitive trust. It is not possible to reduce the number of firmware
+components or the boot loader(s) involved during static launch. This is
+where dynamic launch comes in, as it introduces the concept for a CPU to
+provide an instruction that results in a transitive trust starting with
+the CPU doing an integrity assessment of a special loader that can then
+start a target operating system. This reduces the trust chain down to
+the CPU, a special loader, and the target operation system.  It is also
+why it is said that the DRTM is rooted in hardware since the CPU is what
+does the first integrity assessment, i.e. the first measurement, in the
+trust chain.
+
+Overview
+========
+
+Prior to the start of the TrenchBoot project, the only active Open
+Source project supporting dynamic launch was Intel's tboot project to
+support their implementation of dynamic launch known as Intel Trusted
+eXecution Technology (TXT). The approach taken by tboot was to provide
+an exokernel that could handle the launch protocol implemented by
+Intel's special loader, the SINIT Authenticated Code Module (ACM [3]_)
+and remained in memory to manage the SMX CPU mode that a dynamic launch
+would put a system. While it is not precluded from being used for doing
+a late launch, tboot's primary use case was to be used as an early
+launch solution. As a result the TrenchBoot project started the
+development of Secure Launch kernel feature to provide a more
+generalized approach. The focus of the effort is twofold, the first is to
+make the Linux kernel directly aware of the launch protocol used by
+Intel as well as AMD, and the second is to make the Linux kernel be able
+to initiate a dynamic launch. It is through this approach that the
+Secure Launch kernel feature creates a basis for the Linux kernel to be
+used in a variety of dynamic launch use cases.
+
+The first use case that the TrenchBoot project focused on was the
+ability for the Linux kernel to be started by a dynamic launch, in
+particular as part of an early launch sequence. In this case the dynamic
+launch will be initiated by a boot loader with associated support added
+to it, for example the first targeted boot loader in this case was
+GRUB2. An integral part of establishing a measurement-based launch
+integrity involves measuring everything that is intended to be executed
+(kernel image, initrd, etc) and everything that will configure that
+kernel to execute (command line, boot params, etc). Then storing those
+measurements in a protected manner. Both the Intel and AMD dynamic
+launch implementations leverage the Trusted Platform Module (TPM) to
+store those measurements. The TPM itself has been designed such that a
+dynamic launch unlocks a specific set of Platform Configuration
+Registers (PCR) for holding measurement taken during the dynamic launch.
+These are referred to as the DRTM PCRs, PCRs 17-22. Further details on
+this process can be found in the documentation for the GETSEC
+instruction provided by Intel's TXT and the SKINIT instruction provided
+by AMD's AMD-V. The documentation on these technologies can be readily
+found online; see the `Resources`_ section below for references.
+
+Currently only Intel TXT is supported in this first release of the Secure
+Launch feature. AMD/Hygon SKINIT support will be added in a subsequent
+release. Also this first version does not support a late relaunch which
+allows re-establishing the DRTM at various points post boot.
+
+To enable the kernel to be launched by GETSEC, a stub must be built
+into the setup section of the compressed kernel to handle the specific
+state that the dynamic launch process leaves the BSP in. Also this stub
+must measure everything that is going to be used as early as possible.
+This stub code and subsequent code must also deal with the specific
+state that the dynamic launch leaves the APs in.
+
+Basic Boot Flow:
+----------------
+
+Pre-launch: *Phase where the environment is prepared and configured to initiate the
+secure launch in the GRUB bootloader.*
+
+ - Prepare the CPU and the TPM for the launch.
+ - Load the kernel, initrd and ACM [3]_ into memory.
+ - Setup the TXT heap and page tables describing the MLE [1]_ per the
+   specification.
+ - Initiate the secure launch with the GETSET[SENTER] instruction.
+
+Post-launch: *Phase where control is passed from the ACM to the MLE and the secure
+kernel begins execution.*
+
+ - Entry from the dynamic launch jumps to the SL stub.
+ - SL stub fixes up the world on the BSP.
+ - For TXT, SL stub wakes the APs, fixes up their worlds.
+ - For TXT, APs are left halted waiting for an NMI to wake them.
+ - SL stub jumps to startup_32.
+ - SL main locates the TPM event log and writes the measurements of
+   configuration and module information into it.
+ - Kernel boot proceeds normally from this point.
+ - During early setup, slaunch_setup() runs to finish some validation
+   and setup tasks.
+ - The SMP bringup code is modified to wake the waiting APs. APs vector
+   to rmpiggy and start up normally from that point.
+ - SL platform module is registered as a late initcall module. It reads
+   the TPM event log and extends the measurements taken into the TPM PCRs.
+ - SL platform module initializes the securityfs interface to allow
+   access to the TPM event log and TXT public registers.
+ - Kernel boot finishes booting normally
+ - SEXIT support to leave SMX mode is present on the kexec path and
+   the various reboot paths (poweroff, reset, halt).
+
+
+.. note::
+    A quick note on terminology. The larger open source project itself is
+    called TrenchBoot, which is hosted on GitHub (links below). The kernel
+    feature enabling the use of the x86 technology is referred to as "Secure
+    Launch" within the kernel code.
+
+Configuration
+=============
+
+The settings to enable Secure Launch using Kconfig are under::
+
+  "Processor type and features" --> "Secure Launch support"
+
+A kernel with this option enabled can still be booted using other supported
+methods. There are two Kconfig options for Secure Launch::
+
+  "Secure Launch Alternate PCR 19 usage"
+  "Secure Launch Alternate PCR 20 usage"
+
+The help indicates their usage as alternate post launch PCRs to separate
+measurements for more flexibility (both disabled by default).
+
+To reduce the Trusted Computing Base (TCB) of the MLE [1]_, the build
+configuration should be pared down as narrowly as one's use case allows.
+The fewer drivers (less active hardware) and features reduces the attack
+surface. E.g. in the extreme, the MLE could only have local disk access
+and no other hardware support. Or only network access for remote attestation.
+
+It is also desirable if possible to embed the initrd used with the MLE kernel
+image to reduce complexity.
+
+The following are a few important configuration necessities to always consider:
+
+KASLR Configuration
+-------------------
+
+Secure Launch does not interoperate with KASLR. If possible, the MLE should be
+built with KASLR disabled::
+
+  "Processor type and features" -->
+      "Build a relocatable kernel" -->
+          "Randomize the address of the kernel image (KASLR) [ ]"
+
+This unsets the Kconfig value CONFIG_RANDOMIZE_BASE.
+
+If not possible, KASLR must be disabled on the kernel command line when doing
+a Secure Launch as follows::
+
+  nokaslr
+
+IOMMU Configuration
+-------------------
+
+When doing a Secure Launch, the IOMMU should always be enabled and the drivers
+loaded. However, IOMMU passthrough mode should never be used. This leaves the
+MLE completely exposed to DMA after the PMR's [2]_ are disabled. First, IOMMU
+passthrough should be disabled by default in the build configuration::
+
+  "Device Drivers" -->
+      "IOMMU Hardware Support" -->
+          "IOMMU passthrough by default [ ]"
+
+This unset the Kconfig value CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
+
+In addition, passthrough must be disabled on the kernel command line when doing
+a Secure Launch as follows::
+
+  iommu=nopt iommu.passthrough=0
+
+Interface
+=========
+
+The primary interfaces between the various components in TXT are the TXT MMIO
+registers and the TXT heap. The MMIO register banks are described in Appendix B
+of the TXT MLE [1]_ Developement Guide.
+
+The TXT heap is described in Appendix C of the TXT MLE [1]_ Development
+Guide. Most of the TXT heap is predefined in the specification. The heap is
+initialized by firmware and the pre-launch environment and is subsequently used
+by the SINIT ACM. One section, called the OS to MLE Data Table, is reserved for
+software to define. This table is the Secure Launch binary interface between
+the pre- and post-launch environments and is defined as follows::
+
+        /*
+         * Secure Launch defined MTRR saving structures
+         */
+        struct txt_mtrr_pair {
+                u64 mtrr_physbase;
+                u64 mtrr_physmask;
+        } __packed;
+
+        struct txt_mtrr_state {
+                u64 default_mem_type;
+                u64 mtrr_vcnt;
+                struct txt_mtrr_pair mtrr_pair[TXT_OS_MLE_MAX_VARIABLE_MTRRS];
+        } __packed;
+
+        /*
+         * Secure Launch defined OS/MLE TXT Heap table
+         */
+        struct txt_os_mle_data {
+                u32 version;
+                u32 boot_params_addr;
+                u64 saved_misc_enable_msr;
+                struct txt_mtrr_state saved_bsp_mtrrs;
+                u32 ap_wake_block;
+                u32 ap_wake_block_size;
+                u64 evtlog_addr;
+                u32 evtlog_size;
+                u8 mle_scratch[64];
+        } __packed;
+
+Description of structure:
+
+=====================  ========================================================================
+Field                  Use
+=====================  ========================================================================
+version                Structure version, current value 1
+boot_params_addr       Physical address of the zero page/kernel boot params
+saved_misc_enable_msr  Original Misc Enable MSR (0x1a0) value stored by the pre-launch
+                       environment. This value needs to be restored post launch - this is a
+                       requirement.
+saved_bsp_mtrrs        Original Fixed and Variable MTRR values stored by the pre-launch
+                       environment. These values need to be restored post launch - this is a
+                       requirement.
+ap_wake_block          Pre-launch allocated memory block to wake up and park the APs post
+                       launch until SMP support is ready. This block is validated by the MLE
+                       before use.
+ap_wake_block_size     Size of the ap_wake_block. A minimum of 16384b (4x4K pages) is required.
+evtlog_addr            Pre-launch allocated memory block for the TPM event log. The event
+                       log is formatted both by the pre-launch environment and the SINIT
+                       ACM. This block is validated by the MLE before use.
+evtlog_size            Size of the evtlog_addr block.
+mle_scratch            Scratch area used post-launch by the MLE kernel. Fields:
+ 
+                        - SL_SCRATCH_AP_EBX area to share %ebx base pointer among CPUs
+                        - SL_SCRATCH_AP_JMP_OFFSET offset to abs. ljmp fixup location for APs
+=====================  ========================================================================
+
+Resources
+=========
+
+The TrenchBoot project including documentation:
+
+https://github.com/trenchboot
+
+TXT documentation in the Intel TXT MLE Development Guide:
+
+https://www.intel.com/content/dam/www/public/us/en/documents/guides/intel-txt-software-development-guide.pdf
+
+TXT instructions documentation in the Intel SDM Instruction Set volume:
+
+https://software.intel.com/en-us/articles/intel-sdm
+
+AMD SKINIT documentation in the System Programming manual:
+
+https://www.amd.com/system/files/TechDocs/24593.pdf
+
+GRUB pre-launch support patchset (WIP):
+
+https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00011.html
+
+Error Codes
+===========
+
+The TXT specification defines the layout for TXT 32 bit error code values.
+The bit encodings indicate where the error originated (e.g. with the CPU,
+in the SINIT ACM, in software). The error is written to a sticky TXT
+register that persists across resets called TXT.ERRORCODE (see the TXT
+MLE Development Guide). The errors defined by the Secure Launch feature are
+those generated in the MLE software. They have the format::
+
+  0xc0008XXX
+
+The low 12 bits are free for defining the following Secure Launch specific
+error codes.
+
+======  ================
+Name:   SL_ERROR_GENERIC
+Value:  0xc0008001
+======  ================
+
+Description:
+
+Generic catch all error. Currently unused.
+
+======  =================
+Name:   SL_ERROR_TPM_INIT
+Value:  0xc0008002
+======  =================
+
+Description:
+
+The secure launch code failed to get an access to the TPM hardware interface.
+This is most likely to due to misconfigured hardware or kernel. Ensure the
+TPM chip is enabled and the kernel TPM support is built in (it should not be
+built as a module).
+
+======  ==========================
+Name:   SL_ERROR_TPM_INVALID_LOG20
+Value:  0xc0008003
+======  ==========================
+
+Description:
+
+The secure launch code failed to find a valid event log descriptor for TPM
+version 2.0 or the event log descriptor is malformed. Usually this indicates
+that incompatible versions of the pre-launch environment (GRUB) and the MLE
+kernel. GRUB and the kernel share a structure in the TXT heap and if this
+structure (the OS-MLE table) is mismatched, this error is often seen. This
+TXT heap area is setup by the pre-launch environment so the issue may originate
+there. It could be the sign of an attempted attack.
+
+======  ===========================
+Name:   SL_ERROR_TPM_LOGGING_FAILED
+Value:  0xc0008004
+======  ===========================
+
+Description:
+
+There was a failed attempt to write a TPM event to the event log early in the
+secure launch process. This is likely the result of a malformed TPM event log
+buffer. Formatting of the event log buffer information is done by the
+pre-launch environment (GRUB) so the the issue issue most likely originates
+there.
+
+======  ============================
+Name:   SL_ERROR_REGION_STRADDLE_4GB
+Value:  0xc0008005
+======  ============================
+
+Description:
+
+During early validation a buffer or region was found to straddle the 4Gb
+boundary. Because of the way TXT does DMA memory protection, this is an
+unsafe configuration and is flagged as an error. This is most likely a
+configuration issue in the pre-launch environment. It could also be the sign of
+an attempted attack.
+
+======  ===================
+Name:   SL_ERROR_TPM_EXTEND
+Value:  0xc0008006
+======  ===================
+
+Description:
+
+There was a failed attempt to extend a TPM PCR in the secure launch platform
+module. This is most likely to due to misconfigured hardware or kernel. Ensure
+the TPM chip is enabled and the kernel TPM support is built in (it should not
+be built as a module).
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_VCNT
+Value:  0xc0008007
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR count was found.
+The pre-launch environment passes a number of MSR values to the MLE to restore
+including the MTRRs. The values are restored by the secure launch early entry
+point code. After measuring the values supplied by the pre-launch environment,
+a discrepancy was found validating the values. It could be the sign of an
+attempted attack.
+
+======  ==========================
+Name:   SL_ERROR_MTRR_INV_DEF_TYPE
+Value:  0xc0008008
+======  ==========================
+
+Description:
+
+During early secure launch validation an invalid default MTRR type was found.
+See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_BASE
+Value:  0xc0008009
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR base value was
+found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_MASK
+Value:  0xc000800a
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR mask value was
+found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ========================
+Name:   SL_ERROR_MSR_INV_MISC_EN
+Value:  0xc000800b
+======  ========================
+
+Description:
+
+During early secure launch validation an invalid miscellaneous enable MSR value
+was found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  =========================
+Name:   SL_ERROR_INV_AP_INTERRUPT
+Value:  0xc000800c
+======  =========================
+
+Description:
+
+The application processors (APs) wait to be woken up by the SMP initialization
+code. The only interrupt that they expect is an NMI; all other interrupts
+should be masked. If an AP gets some other interrupt other than an NMI it will
+cause this error. This error is very unlikely to occur.
+
+======  =========================
+Name:   SL_ERROR_INTEGER_OVERFLOW
+Value:  0xc000800d
+======  =========================
+
+Description:
+
+A buffer base and size passed to the MLE caused an integer overflow when
+added together. This is most likely a configuration issue in the pre-launch
+environment. It could also be the sign of an attempted attack.
+
+======  ==================
+Name:   SL_ERROR_HEAP_WALK
+Value:  0xc000800e
+======  ==================
+
+Description:
+
+An error occurred in TXT heap walking code. The underlying issue is a failure to
+early_memremap() portions of the heap, most likely due to a resource shortage.
+
+======  =================
+Name:   SL_ERROR_HEAP_MAP
+Value:  0xc000800f
+======  =================
+
+Description:
+
+This error is essentially the same as SL_ERROR_HEAP_WALK but occured during the
+actual early_memremap() operation.
+
+======  =========================
+Name:   SL_ERROR_REGION_ABOVE_4GB
+Value:  0xc0008010
+======  =========================
+
+Description:
+
+A memory region used by the MLE is above 4GB. In general this is not a problem
+because memory > 4Gb can be protected from DMA. There are certain buffers that
+should never be above 4Gb though and one of these caused the violation. This is
+most likely a configuration issue in the pre-launch environment. It could also
+be the sign of an attempted attack.
+
+======  ==========================
+Name:   SL_ERROR_HEAP_INVALID_DMAR
+Value:  0xc0008011
+======  ==========================
+
+Description:
+
+The backup copy of the ACPI DMAR table which is supposed to be located in the
+TXT heap could not be found. This is due to a bug in the platform's ACM module
+or in firmware.
+
+======  =======================
+Name:   SL_ERROR_HEAP_DMAR_SIZE
+Value:  0xc0008012
+======  =======================
+
+Description:
+
+The backup copy of the ACPI DMAR table in the TXT heap is to large to be stored
+for later usage. This error is very unlikely to occur since the area reserved
+for the copy is far larger than the DMAR should be.
+
+======  ======================
+Name:   SL_ERROR_HEAP_DMAR_MAP
+Value:  0xc0008013
+======  ======================
+
+Description:
+
+The backup copy of the ACPI DMAR table in the TXT heap could not be mapped. The
+underlying issue is a failure to early_memremap() the DMAR table, most likely
+due to a resource shortage.
+
+======  ====================
+Name:   SL_ERROR_HI_PMR_BASE
+Value:  0xc0008014
+======  ====================
+
+Description:
+
+On a system with more than 4G of RAM, the high PMR [2]_ base address should be set
+to 4G. This error is due to that not being the case. This PMR value is set by
+the pre-launch environment so the issue most likely originates there. It could also
+be the sign of an attempted attack.
+
+======  ====================
+Name:   SL_ERROR_HI_PMR_SIZE
+Value:  0xc0008015
+======  ====================
+
+Description:
+
+On a system with more than 4G of RAM, the high PMR [2]_ size should be set to cover
+all RAM > 4G. This error is due to that not being the case. This PMR value is
+set by the pre-launch environment so the issue most likely originates there. It
+could also be the sign of an attempted attack.
+
+======  ====================
+Name:   SL_ERROR_LO_PMR_BASE
+Value:  0xc0008016
+======  ====================
+
+Description:
+
+The low PMR [2]_ base should always be set to address zero. This error is due to
+that not being the case. This PMR value is set by the pre-launch environment
+so the issue most likely originates there. It could also be the sign of an attempted
+attack.
+
+======  ====================
+Name:   SL_ERROR_LO_PMR_MLE
+Value:  0xc0008017
+======  ====================
+
+Description:
+
+This error indicates the MLE image is not covered by the low PMR [2]_ range. The
+PMR values are set by the pre-launch environment so the issue most likely originates
+there. It could also be the sign of an attempted attack.
+
+======  =======================
+Name:   SL_ERROR_INITRD_TOO_BIG
+Value:  0xc0008018
+======  =======================
+
+Description:
+
+The external initrd provided is larger than 4Gb. This is not a valid
+configuration for a secure launch due to managing DMA protection.
+
+======  =========================
+Name:   SL_ERROR_HEAP_ZERO_OFFSET
+Value:  0xc0008019
+======  =========================
+
+Description:
+
+During a TXT heap walk an invalid/zero next table offset value was found. This
+indicates the TXT heap is malformed. The TXT heap is initialized by the
+pre-launch environment so the issue most likely originates there. It could also
+be a sign of an attempted attack. In addition, ACM is also responsible for
+manipulating parts of the TXT heap so the issue could be due to a bug in the
+platform's ACM module.
+
+======  =============================
+Name:   SL_ERROR_WAKE_BLOCK_TOO_SMALL
+Value:  0xc000801a
+======  =============================
+
+Description:
+
+The AP wake block buffer passed to the MLE via the OS-MLE TXT heap table is not
+large enough. This value is set by the pre-launch environment so the issue most
+likely originates there. It also could be the sign of an attempted attack.
+
+======  ===========================
+Name:   SL_ERROR_MLE_BUFFER_OVERLAP
+Value:  0xc000801b
+======  ===========================
+
+Description:
+
+One of the buffers passed to the MLE via the OS-MLE TXT heap table overlaps
+with the MLE image in memory. This value is set by the pre-launch environment
+so the issue most likely originates there. It could also be the sign of an attempted
+attack.
+
+======  ==========================
+Name:   SL_ERROR_BUFFER_BEYOND_PMR
+Value:  0xc000801c
+======  ==========================
+
+Description:
+
+One of the buffers passed to the MLE via the OS-MLE TXT heap table is not
+protected by a PMR. This value is set by the pre-launch environment so the
+issue most likey  originates there. It could also be the sign of an attempted
+attack.
+
+======  =============================
+Name:   SL_ERROR_OS_SINIT_BAD_VERSION
+Value:  0xc000801d
+======  =============================
+
+Description:
+
+The version of the OS-SINIT TXT heap table is bad. It must be 6 or greater.
+This value is set by the pre-launch environment so the issue most likely
+originates there. It could also be the sign of an attempted attack. It is also
+possible though very unlikely that the platform is so old that the ACM being
+used requires an unsupported version.
+
+======  =====================
+Name:   SL_ERROR_EVENTLOG_MAP
+Value:  0xc000801e
+======  =====================
+
+Description:
+
+An error occurred in the secure launch module while mapping the TPM event log.
+The underlying issue is memremap() failure, most likely due to a resource
+shortage.
+
+======  ========================
+Name:   SL_ERROR_TPM_NUMBER_ALGS
+Value:  0xc000801f
+======  ========================
+
+Description:
+
+The TPM 2.0 event log reports an unsupported number of hashing algorithms.
+Secure launch currently only supports a maximum of two: SHA1 and SHA256.
+
+======  ===========================
+Name:   SL_ERROR_TPM_UNKNOWN_DIGEST
+Value:  0xc0008020
+======  ===========================
+
+Description:
+
+The TPM 2.0 event log reports an unsupported hashing algorithm. Secure launch
+currently only supports two algorithms: SHA1 and SHA256.
+
+======  ==========================
+Name:   SL_ERROR_TPM_INVALID_EVENT
+Value:  0xc0008021
+======  ==========================
+
+Description:
+
+An invalid/malformed event was found in the TPM event log while reading it.
+Since only trusted entities are supposed to be writing the event log, this
+would indicate either a bug or a possible attack.
+
+.. [1]
+    MLE: Measured Launch Environment is the binary runtime that is measured and
+    then run by the TXT SINIT ACM. The TXT MLE Development Guide describes the
+    requirements for the MLE in detail.
+
+.. [2]
+    PMR: Intel VTd has a feature in the IOMMU called Protected Memory Registers.
+    There are two of these registers and they allow all DMA to be blocked
+    to large areas of memory. The low PMR can cover all memory below 4Gb on 2Mb
+    boundaries. The high PMR can cover all RAM on the system, again on 2Mb
+    boundaries. This feature is used during a secure launch by TXT.
+
+.. [3]
+    ACM: Intel's Authenticated Code Module. This is the 32b bit binary blob that
+    is run securely by the GETSEC[SENTER] during a measured launch. It is described
+    in the Intel documentation on TXT and versions for various chipsets are
+    signed and distributed by Intel.
-- 
1.8.3.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

