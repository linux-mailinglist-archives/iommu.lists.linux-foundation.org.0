Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CF051BC8C
	for <lists.iommu@lfdr.de>; Thu,  5 May 2022 11:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7BCD40BD0;
	Thu,  5 May 2022 09:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9df4nRk4slg; Thu,  5 May 2022 09:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A289F40BBB;
	Thu,  5 May 2022 09:53:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64864C002D;
	Thu,  5 May 2022 09:53:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF95C002D
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 09:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A0824070B
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 09:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LC2KRguDw6E for <iommu@lists.linux-foundation.org>;
 Thu,  5 May 2022 09:53:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D79A402F5
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 09:53:19 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24588rU7025194;
 Thu, 5 May 2022 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2YIb3V99E143jjHS+8U/f+6x4DodJwmiA1RCettscZg=;
 b=H7IDSo10UaWYVYWVzVcSS8OiT+pIW22xVAHzBNqnTZGnOgalqpIBJ8t7zMofRjrMQVuQ
 pRC4t1LCmOwFuGqdPckxRFu2gtZ+woRYV5HBfPWd2AE5EBogsB1M/yPr6eeWEOuPpKC6
 W33SLk4ZSvzmFioCvYy96SF3/3QSBYdjKGF3enXTYC5iE6Jg/5AuxCT5TIDcOgqbTyql
 XUKG/N8YnXaxZRyCNlkGwaamIircG9CQs+SmgeclnjxiP/PgauSoozHbichZFGLi1cTd
 23HtEfke+xZ5m0kMyZR3DEJ2S6FQbxLpCuhWrqCOIp+jtIyj47XaLQnHGbb38e6snW2F ZA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2jut1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 09:52:43 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2459pOYi020046; Thu, 5 May 2022 09:52:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a6rbba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 09:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHQGDKB6S8i4nC1WUV9z0ihpD2BMzlH339OHkW5xKqowAYEYpZ34H8b2HCVB/6dHRoW9kWgIw2k1NQTbSVdoO+7MADMSIOxEnWpxesXfux27t9QWEsLasUN5bUZ9GIqzdnxVvwvf9kMHG6BS+LzVjo5JywsPPyDJWXlhWz9DW/ZytfDUniei2cWi47mPXEIo38a4HCpgZ0N92BW0MiOYnfrv8ML6qLuOulG0/VEgaI7KF8qDVblYCfDHVYJpjbqc+LK81v0V5PtsE2J0jfIk7jvr4mdTnWoc4+Wzk2Iw4VsVjwZLzI1AON8k45fzNHdR2GRg3xRU0Vj6S7kc87rFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YIb3V99E143jjHS+8U/f+6x4DodJwmiA1RCettscZg=;
 b=FVxXPQrSEjPbWbHKkR6aiTidF6AfKn1aBmiCscpgzNm6hmoPjl6N0YBiZLrygoGjZ8XSfg3Bb3p2wGMtuIls+z7LN2tuXBZrbItEt87ZUKxbkRR5l6jHgB5vSjWv/06zhIRjLljPhTlVP815s38L3rN36fnUttmR1TNsdmHrwNxxJDJRRgG7KKqEJdoXWLnLKlgwYF9wTQryi9kgS0HLpTs9ShzVDPUb19sRhau6knVeud7TV1j9xb0vZ2V7UxrmSgDXZi+yKIco3ZRMoVj2goDnY7kdf4gi0nEe0i0J7ZDZe+Ivr2U+RenfF9CBEKfojHs6DiD27Y72OVATE6+l9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YIb3V99E143jjHS+8U/f+6x4DodJwmiA1RCettscZg=;
 b=qrUzfofEVUbJeyMQbhB07sj0vmhzKxeQU2sHJgMBfQW+x9KRWJGdTX0j3IMWYxzqAjEu1f1njqNwWmqdrJe6mGC4pr/5ISryi0tq/n5peel5PKN1ySpvJiiINdBKUOFqlsJ7iWTOuS7bz+qW4sv8AJ9FJR/F/pbgkaxBBQsZqGs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB5320.namprd10.prod.outlook.com (2603:10b6:408:12a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 09:52:40 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 09:52:40 +0000
Message-ID: <dbc96a71-4571-ac8a-e6e4-d2763f9c251d@oracle.com>
Date: Thu, 5 May 2022 10:52:33 +0100
Subject: Re: [PATCH RFC 15/19] iommu/arm-smmu-v3: Add
 set_dirty_tracking_range() support
Content-Language: en-US
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-16-joao.m.martins@oracle.com>
 <BN9PR11MB5276AEDA199F2BC7F13035B98CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <f37924f3-ee44-4579-e4e2-251bb0557bfc@oracle.com>
 <e25a157d76a64fb78793efeb072ff53c@huawei.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <e25a157d76a64fb78793efeb072ff53c@huawei.com>
X-ClientProxiedBy: LO2P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::31) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2d6d4d-b180-4064-7731-08da2e7cfe3a
X-MS-TrafficTypeDiagnostic: BN0PR10MB5320:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB53203F232899896024833191BBC29@BN0PR10MB5320.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOwq8HCY4iheKYB8qzgfrsvmOoCWgjgjT1iXxx46yd275uE4kFrZShbgpP5d42igrT9A70I6X2aCiKAgjteJHCX4Kq00uZbT5AhbysNZd26WYD1HVKeW2kbsvbB3c3u28M8J660nhGjGEV/5YS/dhidKZuiWg7PJk0UcZJjWQEo7myvEnwbemyJKIdZg33Z6EK3Nr0ZJ4jrsY1gfJ7pGNQ3Ht9gWwpW44W8UCL/czJUvn29RHIkfip06NtSsWQ0uFAwdU7kdJdrwaYTGCxVMnVnCSX3tqj5iqUy96zGOokPnsf2+pI4lRz3T0TMDBsU04BeTQRaujKKRK+VqrcIwdnWcUlxIotKCP/yZ2s7dBU3uR2yfmHOCP5Kp1BdamKMa2qZIe8xXgk/3qFwEAajSTPsvPq3gmlrCv3DsiXQ1zbiN1rqVghMgv7A3LLiPDXMs7qaJmkEQMbCgPuv5NSQlxJgkNKX3RUI3Lgan+H05RowYPbmnusDv7REGwMxHv6ICJ9W5+7W4SwmvPZGLGhp8elJoTfgDRZhAEgkwIbs440NyLnNHfq1v1SHGb3e3+OEU0nXGJ5bi9jYCapS28c/ehWOWXYfFygpsiXSovBK7S6Hdjjuqh3nqxlO/iZqTmdMBzUN6pk7OUdsAhdfPoTvrlSsYEHGa9PCHK4VLekxbLiULaoU37sIaLmjYPdjOwl4ACPaXzSm0IOB8HvQkDw6ZSKCFzqdbpFn+oD+3I3oFuIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(53546011)(2906002)(7416002)(8936002)(186003)(36756003)(66476007)(4326008)(31686004)(2616005)(26005)(6916009)(6512007)(6486002)(54906003)(316002)(508600001)(6666004)(5660300002)(83380400001)(8676002)(86362001)(31696002)(6506007)(66946007)(66556008)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODU0QTFXMUhGSHR3T1M2MFlSL3RrdkJqQjlqdzMzSDlEeGxJTGlIZXJiUHB5?=
 =?utf-8?B?Q2ZzZHRrUU9HZk1vVmJhSnhDbzFYeDFNbzZhYmVJOSswOWwwR3VCUktzVVkx?=
 =?utf-8?B?bzMycEZ0a0tiZDlabTV1ekJteHZmOGFnVmp2Z2FzRGtnWGowb01ZRTBRZHY5?=
 =?utf-8?B?T2dMQmdKL1A4eS9Wb0lYV3graUhwR2RjTXRNUnluMTR6cmRwSTVFZjM3NHN4?=
 =?utf-8?B?WmdLZEtRMWJ1MkpDNENPditXZGR0T1J0M045RjdhRGdaK1gwTFcvVXg4S0pt?=
 =?utf-8?B?RVh3WEtReDBTclRNbDZlK2lWL2M1VUl2elpHeGt5L0J4aXRtSm5WSmI0TkUx?=
 =?utf-8?B?blpNR3grZ2VZSjMzRTN0ZUZ2KzFOWUg1YndMeU1zcis2M2tpLy9EU0tRQmZU?=
 =?utf-8?B?OEFBUVBkNUFmUW9odi9wbERSVkVhU0IwZXY2Szc0bUJpT2tmc1RiSm5KcFNn?=
 =?utf-8?B?dW04ekxnR0NoMTVSRHhFNk10bFlIelNKREtLWEhyb1lTVHVzUklDZFpQNEZQ?=
 =?utf-8?B?QzBXM3JPclhCM21xanVwcDZoZlNQVkE3Y1ZYQkI5TWhhQzNZZDBJaUJmMHdo?=
 =?utf-8?B?WC85a1I0cHFBdUxKNXFFNEE3TEMyR09QeGdCNE0wZ2xOQ1Y2YmVjbEFqam9s?=
 =?utf-8?B?WCtWcy9ONlFGK1ZGeWJ6ZXEyVmZBWWpVTnN1cGxMTEtzUjhuUnNLK25ocHV0?=
 =?utf-8?B?NmpqVWFOdm5xaitZYXl6cngxKzJ4M3loS2pIY3RObmJaRFZIWW9sN0c1aHR0?=
 =?utf-8?B?SDhZbEF2N2RuSko1dWtSMzJlSnFlVytRN256VjI5TGM3UTRjWE5aWVJ5eWdk?=
 =?utf-8?B?bXhzQ3NqL3V2NzdNL2RXRFBJR1VvQmtJNXNXNE0yaWdVT2NnTWNKeUwxdDgw?=
 =?utf-8?B?b2wxQkxqc2hZTkM1N2NuTzVJRllYRmk4OHpIS1hyKzNCTE1MM05MZTVxQXps?=
 =?utf-8?B?eWp2a3JrcDlMdGRWSklYdnEwNEpCcWh2SDZueEZ0WDRPcTZQbXRzM0RQYUhP?=
 =?utf-8?B?MDVJM1A2WHZ5OHVLaDZuUFV1UTd5UisxK1hZbEdseWdXQStqRE1SUmJrQ0c0?=
 =?utf-8?B?WDNYU3NHakM3UjVTL1ZGaVJ3MVJlM1FsRzI0U2tEelZjb1FTeWN0QnB4eXU1?=
 =?utf-8?B?T3lOdG1IWWJPcVgyeEl2RTJKc3VzbTRTZlI4U1oyWlg2eG5EcmRMYUN1MHh1?=
 =?utf-8?B?R2h4UTlTdEczTE1qNXo4aDd6bzgrNlVNd2U4WDc0eGIvVmxjbUtIUmtXdjYz?=
 =?utf-8?B?NUVpU1ZGUnE2T2hrRkdWb1p5WHI4Rm1xNXR0SE5RSm4wZlJNUXE3RUs4YUlw?=
 =?utf-8?B?VVdjd0x2bnlkWDFpRXZnbWxSajNGdm11SEYxN2pLWW44ak43L0ZaTzFLYjg5?=
 =?utf-8?B?NzZsVkx6aHJKSUJrS21EcXc2UVJQMzJQRVhrS0NuOVVkL0hyTTJyZ3U4MTc2?=
 =?utf-8?B?YXNCTzU0TVVGaWI3Q1Z5eHM1Y1FRNDYwRjRhSnYxWEhGNUJCMnlrYkZMaEdr?=
 =?utf-8?B?ZnVHNWZyUzR6ZmJsS0JBZGhJdDVOOEdpM2sydU1UdGtMMWx4SGRjbXh1dG44?=
 =?utf-8?B?K3UvR0ZFYjA4ZHY0d08yRkY3aURPMkxBZ1k5TklrMHFFb3FJdHArZFhVMmxn?=
 =?utf-8?B?WnA4UlVUdzFjOG9XWkIwMk1SejZPY3dBODJBTDVSUEtTbEFKV01QQklnc1E5?=
 =?utf-8?B?czBpNy9yYTJkOHE5bmQ1T1VVMmJHR09qaDFFaTM3VTRWeTQyTlU2RHlTdkNu?=
 =?utf-8?B?dDVLSWI3U1hWeE8yK3l2MGlFQmNzU1luOWJwSXk3b2xOQVdybnZ4eDVtOFBJ?=
 =?utf-8?B?OXR5K282YXJpUHRlK2Z3T1hOOG1OUzZOWWViS3FYdHFtRW9uQVRBYm5UZDc1?=
 =?utf-8?B?bkY1NEhzMUg5a0hISldmdkYyd2pxOVZPWWY2RUI0ZG4xNTMrRktXb0QyNSsv?=
 =?utf-8?B?M1kySTR2Q3RaU2l2Wlk4eUlpQ0pwWDFoOFJiVS9acTJpMnZWanYrMlVqOUda?=
 =?utf-8?B?MWNBdERmbTRacmMyb3hFbDhCNEsyRnJZaHNTZVVhbEt2QVdjbHFHVE1NeEh4?=
 =?utf-8?B?Z1ZPdks3ei9yQ3M5Y0x5NTlUNmVON09FWTZwY1hJKzhsMFJ0Um9oZzQ0ZkxQ?=
 =?utf-8?B?NXR2SzlKUU80UWNXNEhzOUUrZDBoQUphR0lSd3h2bWl2RmE0TXdnSG9kTWM4?=
 =?utf-8?B?alhJWGFVOVZZOUZUYnVNQjdFcjh6WWhyQ1ZjN1l5dVhCY2pyZjl3YThncGVa?=
 =?utf-8?B?VlJ0NnQxdi9ZSzJOc0g4dHBsajRmSWtPTUJxZS83c083SzgwQ1duNy9iMERh?=
 =?utf-8?B?M2NmSXNGZTJTb09KalM5RVlBdVZPc1l2all3MlQ0R2RJL2tzVlR3Q3g0L1FN?=
 =?utf-8?Q?9RKdRhlzOU0JUfxA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2d6d4d-b180-4064-7731-08da2e7cfe3a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 09:52:40.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wsK+X1uyAjh1tOx/2Iw6Z6jvJ48KJ8D0wrobqhnOS21g/dtRGF0KE/rXHLvwJoHk4f+51BF8EtIchwIUQh1lAukiij8xDEL66dxB3WIDiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5320
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_04:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050069
X-Proofpoint-GUID: qZPj-Febji_Xztc6M5J3Gs_pZbjF_Nx3
X-Proofpoint-ORIG-GUID: qZPj-Febji_Xztc6M5J3Gs_pZbjF_Nx3
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 5/5/22 08:25, Shameerali Kolothum Thodi wrote:
>> -----Original Message-----
>> From: Joao Martins [mailto:joao.m.martins@oracle.com]
>> Sent: 29 April 2022 12:05
>> To: Tian, Kevin <kevin.tian@intel.com>
>> Cc: Joerg Roedel <joro@8bytes.org>; Suravee Suthikulpanit
>> <suravee.suthikulpanit@amd.com>; Will Deacon <will@kernel.org>; Robin
>> Murphy <robin.murphy@arm.com>; Jean-Philippe Brucker
>> <jean-philippe@linaro.org>; zhukeqian <zhukeqian1@huawei.com>;
>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> David Woodhouse <dwmw2@infradead.org>; Lu Baolu
>> <baolu.lu@linux.intel.com>; Jason Gunthorpe <jgg@nvidia.com>; Nicolin Chen
>> <nicolinc@nvidia.com>; Yishai Hadas <yishaih@nvidia.com>; Eric Auger
>> <eric.auger@redhat.com>; Liu, Yi L <yi.l.liu@intel.com>; Alex Williamson
>> <alex.williamson@redhat.com>; Cornelia Huck <cohuck@redhat.com>;
>> kvm@vger.kernel.org; iommu@lists.linux-foundation.org
>> Subject: Re: [PATCH RFC 15/19] iommu/arm-smmu-v3: Add
>> set_dirty_tracking_range() support
>>
>> On 4/29/22 09:28, Tian, Kevin wrote:
>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>> Sent: Friday, April 29, 2022 5:09 AM
>>>>
>>>> Similar to .read_and_clear_dirty() use the page table
>>>> walker helper functions and set DBM|RDONLY bit, thus
>>>> switching the IOPTE to writeable-clean.
>>>
>>> this should not be one-off if the operation needs to be
>>> applied to IOPTE. Say a map request comes right after
>>> set_dirty_tracking() is called. If it's agreed to remove
>>> the range op then smmu driver should record the tracking
>>> status internally and then apply the modifier to all the new
>>> mappings automatically before dirty tracking is disabled.
>>> Otherwise the same logic needs to be kept in iommufd to
>>> call set_dirty_tracking_range() explicitly for every new
>>> iopt_area created within the tracking window.
>>
>> Gah, I totally missed that by mistake. New mappings aren't
>> carrying over the "DBM is set". This needs a new io-pgtable
>> quirk added post dirty-tracking toggling.
>>
>> I can adjust, but I am at odds on including this in a future
>> iteration given that I can't really test any of this stuff.
>> Might drop the driver until I have hardware/emulation I can
>> use (or maybe others can take over this). It was included
>> for revising the iommu core ops and whether iommufd was
>> affected by it.
> 
> [+Kunkun Jiang]. I think he is now looking into this and might have
> a test setup to verify this.

I'll keep him CC'ed next iterations. Thanks!

FWIW, the should change a bit on next iteration (simpler)
by always enabling DBM from the start. SMMUv3 ::set_dirty_tracking() becomes
a simpler function that tests quirks (i.e. DBM set) and what not, and calls
read_and_clear_dirty() without a bitmap argument to clear dirties.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
