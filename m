Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FC514DE9
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 16:46:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B905C405D3;
	Fri, 29 Apr 2022 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyQHPugO1feH; Fri, 29 Apr 2022 14:46:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B8B57403A7;
	Fri, 29 Apr 2022 14:46:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8018CC007C;
	Fri, 29 Apr 2022 14:46:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43802C002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6FE60E9B
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="AoALewlX";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="Ql3Bva0o"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QELruiv_kFZ3 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 14:45:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 528EC60E90
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:45:58 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TBx0qJ018591;
 Fri, 29 Apr 2022 14:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=NwhVtDE8ol8RxeGOoHJC5BCu/iW3cIMKxMtzYjUw7n0=;
 b=AoALewlXhJaKgSjcmMD4DVSHQxZSC99TFcRWLnZEeUTm1j2SZ+TFtv0OEmvkYTj8mRso
 4KoTpc3vmaZ7IzpLlkvxxi72Cql/cFf1IbA0C+GcVeIbm4D/CItWtk8lZ7myboQtl5lW
 WRy/PUmLyEAYx0ZsWnxJdYqFUsORSPZWT76HL2h2Ki33xDv761J8Kh+SzWFRv9NWPh+K
 /1yZW28awqLBKKr7EA/W5uZUO9v7fTI8XZal3zuq/fpjKFdMZ9XuqwTmUWSqVLA1FufQ
 gZTIn5crbucXUjTNaHAsVMiSFWSHc3vw6tkMynAhG8lFKmu9QFZ8jgFaw7GxoPQXuPu8 Fw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb5k71hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 14:45:34 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23TEeFFo003148; Fri, 29 Apr 2022 14:45:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w83d5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 14:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqQiNVl8DS6waipOds3yd4h564AbyGOzbhK3IWGuWtDh19BOAS4FK9rXVFVbxxnNR8v61twwshmoOpbVGQjzxY0F8BN7zBl3tSNoflLLvY13jagUTjklwzWDG/E4rymajuq2575FfXd7Hyl4QQ1orXK4mJuQXp9ifTsS6rpIo7hi2rbRkr3Zc+xeRE2y6EyWVbTe0t2JIFSxH6sqMiGCOx0fxZqLfwcN9RmcSIOHoTlfSkqeILlXLk6HnquIAV3+072ABtIRapInMQ0EyT4fcpsOx92Mo0oc7DjZka02U77WYAxG9zrsQP5XdDWqom1TAPEWCB9MoJ87RwBb0yEFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwhVtDE8ol8RxeGOoHJC5BCu/iW3cIMKxMtzYjUw7n0=;
 b=iKHDTP+LejahVbm6YTvaw19fEnD8LJpJ6wqad7OSHIgGK+HT41UJE9Hn2cXmILuN1+ideB6h7cJYRhuiiXCkE6CrFda87gbT6mDAWZj6QtsmNsEPYmD0wpuAcK6YpCAsV4I1RDUv28PiStwPYKz0v5yxfjVpFHAGpTVEIw8jxe1K6HPk58Qd5emL2AWDdRo1yPOywcYOcBUQjFQRIks4PdG6N0Ijsji9MseigT9mDmbVgj4ADUtPQHACoVa6/2N4msYBbHa7lXbeO6c99pmLMPB074KyJCGL2I49mVFnTqZsXHxva5i99rtpdN+ls1QzMjPpnwESh5/wpDr9+42E4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwhVtDE8ol8RxeGOoHJC5BCu/iW3cIMKxMtzYjUw7n0=;
 b=Ql3Bva0oEq5aKTgl0FPf2HwxBsP39f+TNFGf8Dhj5RykLeAJ9P2CcL9+IrYCrrH5V8joiOpQNTy2S/9QUwDNx5sXC7NCk8gGqkk8PxDGvD/xM0bmZOXsVaQjEAr7gbnjUKIMisgO//DXtrqf67ZooNFold55Ctse7Jb9WETTEjM=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 14:45:32 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 14:45:32 +0000
Message-ID: <bed35e91-3b47-f312-4555-428bb8a7bd89@oracle.com>
Date: Fri, 29 Apr 2022 15:45:23 +0100
Subject: Re: [PATCH RFC 15/19] iommu/arm-smmu-v3: Add
 set_dirty_tracking_range() support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-16-joao.m.martins@oracle.com>
 <BN9PR11MB5276AEDA199F2BC7F13035B98CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <f37924f3-ee44-4579-e4e2-251bb0557bfc@oracle.com>
 <a0331f20-9cf4-708e-a30d-6198dadd1b23@arm.com>
 <e1c92dad-c672-51c6-5acc-1a50218347ff@oracle.com>
 <20220429122352.GU8364@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220429122352.GU8364@nvidia.com>
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00390cbc-cdea-4271-8bf0-08da29eee946
X-MS-TrafficTypeDiagnostic: PH0PR10MB4423:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB442318170541919B9E037194BBFC9@PH0PR10MB4423.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgvpoxRueUwVHejidKhck6uOEebmyFrZJ4LMAQ4gv/f+lSVM01NRhabzJrtKYh4lYjodpqxiMeKeyzv7smHvT67SuRedzs9/h3J5i7uZ4Ys3QICFrXym00p4wYZrqGVDS+aQHpPnG1yh0DwexBFljE69Q6vuH/zQObv5w9Ah7HD655QHVeuzfXpG/UrNVcqldhQfUtfoKtkMLkz4DsZxNgCq0U4qgP4RNd/W6q1iFeVIAnTaSNSPhr0FhYGicMmENrev4MjahQ+Bmknd6pc/HR7VbfpiFOW2ApkKFiwpbT+IS43h0r277JPF7+hiqjJLDP7RjGnJ2uWqWfSuru53LK+AwvyZoS6JTUWLkdodl5AfY4osajEFtd5nKmijbgCE82Zygz0+5TpRFyJIH/Dy/Akl3DIlxIQHat4vXZlmox0JlxoVOX+h1oKWcbRRET9A6VNJ/FN1QaTKetwjOlAvIxM4aYk7w4GlI8IMpHPYEvjfkCfC05abhHd6uXfu8Std7Mf7z0LB5lZV20ahp/DvboaVesR9YlQ+QU/Q8dw+Ap7W3u0cjupI2cRLxUlAABi3fkYSxOBxrM5Ymm31K1sleMjWgufs+wvlECFsuNlH/s0QBBUOWcCo65LluPE6cQUIjTgpo3C28Khijh2QukE9r5kk2bVui9LibOMqg6PhsiUa0cRgxSaBQIGXewEuNEE6fYr2IuOZWkHO0kE1rNywT89uSWItF4ILBBQOXrpCGfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6666004)(26005)(6506007)(6512007)(316002)(66556008)(66476007)(66946007)(508600001)(6486002)(54906003)(6916009)(86362001)(31696002)(2616005)(186003)(53546011)(5660300002)(2906002)(8936002)(31686004)(7416002)(36756003)(8676002)(4326008)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9GQUtLdkN0Q1VITnVucFh0WjJtWkVURVdLeHkwRzMwaVhORGx0VGJDZzQ2?=
 =?utf-8?B?T3haM3o4QXpTZ2cvakRwaWliRTA2UDU4OGZmakUxRkVySUx1RVA3VDJTU2FJ?=
 =?utf-8?B?Z0paN2dpUnZKRFo1U1djOVBGMDRWOEJpb3NRRDYwNnJTODU4YUZub2VPZmVF?=
 =?utf-8?B?UVF4aGtUMVA0WkZsT3pYb21WNmRRRlFkandIVitMM2Y1NzdUdk9sMllRM2RK?=
 =?utf-8?B?dUQ4cXVZS0VlTWZ6MmRTY25uY1JkUURIT2Nra2l0SzlYcks1VWljaHdoT3ND?=
 =?utf-8?B?WGQvcUdFTU5IanZMaU1ERXlRbnQwV3VoV2RQYS9EWmRSeU1tVS9KMXZLS1BO?=
 =?utf-8?B?T0cveVZGNWFtS3g4NFo3akl3MjVJdnlqeVgzZTJRbkVCMlE3dGRXK2tWYWJR?=
 =?utf-8?B?K2VLc2w3VEVJQmo1endOYVlhL3EwbWg5VnREVmYveUVUZXVoR2JVNGZ0YzVj?=
 =?utf-8?B?bkczRFpGRFVwNmpocXE1N3ZETjd5N0M2ZEZUYU1lcm9kUUx2eEV6VTJwL21a?=
 =?utf-8?B?dTFIMXVNeEdzeS91SWRkMTVtNlZteFMzNU5JMGZCNEovTWJMMXpiU2tvcEZY?=
 =?utf-8?B?QS80VEtIck82Z1hkc216endCeVI2MjR3M2FhWnB4UndZVXRmUG1sYktFR2Nn?=
 =?utf-8?B?dVVOcmtzOVlWczNlWHhJQW1wMUwvYVFydnBEMVpENnFUeGkxbm9uY010KzQy?=
 =?utf-8?B?K1lMUXBJcVFFdEdHWE10MGo0QUlzT3FMZ09BSnlWMlRZWDgyTDlBR3dvMEY2?=
 =?utf-8?B?ak5iSkt0SzE1S1dCZTlPbWZwajYyNmlaQ29UeHRqenJqNkhNT3lHcEpobVp5?=
 =?utf-8?B?RUZDVW5BOXZhNkRWaFBaYjJEbVhsSW13WHorNjRPM21Gc2VUdVpJeGM2S2g4?=
 =?utf-8?B?UkJCcFYxYzhnYU1mYWw2eGRlcXVQeWV0QlIvNVpCUnhCbVV5VmZuRVJGdmpF?=
 =?utf-8?B?ZTdKVEdJSnJGK29jTG1nbWJzVDMzcVJldFF2UmJPallWK0R4a3dJK3h4MG03?=
 =?utf-8?B?dGVSN0hjemxyR1Vkb2loNWVxRExNRjVMd2pveFNMR1N2cmxZV01mR1dTSkF3?=
 =?utf-8?B?dnMxSlJvZ1lFT3FyZUFLc241Z2J1MWV0M3l6ZnBmckxBRUc3V3NBUVdhWGRY?=
 =?utf-8?B?aUMzeDZSbzhiMG1vL2lPV0VnSGM1NHBtc0J3RUdFbFV6Mjdaamczd1YxaFNt?=
 =?utf-8?B?VHJ3L2dUdHBxb09CNWI2ZldvcE82QkxLOXFOQVZ6aVREV2M2eCtTSzZLcHhS?=
 =?utf-8?B?VGo1N09USXJRSm55Wmpqb3ZPZmtqOTZJRFZodWlsWEpmQ0xwQk1vVGJoZ2dW?=
 =?utf-8?B?VGw4d1RTWGJMMkVIWXNJa1ZHRDdUYzBEOWJBV1lKdW02R1ZMUGZIK1JVSGZp?=
 =?utf-8?B?eGt1VjV1VE11T0RRa211ekFnOTluNVVtNUJmWExaL1N3R2c0STFFODJmMEs1?=
 =?utf-8?B?OUxrajBjSmd4TWY3NDJNQjEybVNVVFU3MDBvTEYxaW1xenNIUUgwRHRKeGRT?=
 =?utf-8?B?QjJFbWxNR0UxS1Fmd3pFWWQxaGN1Rkkvb1RmN3c5dzFZQStiaHhyNHdSRkV6?=
 =?utf-8?B?akJIT3RYbjZmYlJ6eUtnMkp6dUJwNXg1VkFlMnB6ZCt5cGdZTjJRcXlTbER3?=
 =?utf-8?B?R09pdVhQTjczTXEwcGlZL2pXQzdrRFdCNnVDNU83T29JUjUyNm80QVQzemkx?=
 =?utf-8?B?V2o0SHA4UEZZY05pTzhrb1ZLUzR2S0J3dlZzWFZUcVlZYlM2MlNuRkhkRXFQ?=
 =?utf-8?B?VXMrNHFzTHlGelBaVEpzZ0NBKzIwRU56NFZSOVZKbnM3L0JFVEM4WU5pMnRr?=
 =?utf-8?B?THZrK0lrNGlENzBqUzBFRFBiMmZRdzZCM2tjZnVoUEM2VXZhYm50SDUycDcw?=
 =?utf-8?B?NFpXK3YvczdlR2xqYWp3YU0zWnhFNHBpb1BXR0tKRndMbTZ1K0s1R0RmdWRL?=
 =?utf-8?B?TmtLc2dUQWRBZ3lwbWZqc0NSc3ZldWVnNjh0bC84ZkZYVmQ2Qjd4TVpXc0lD?=
 =?utf-8?B?UXp1c2xlMTV4UkpWTkovZmgvL3ZBbGRQM0ovQytlWTRPbjhmeEFSbis2Q1Rr?=
 =?utf-8?B?WFJsR1JlMmFwM2s0MUl1b0EwaHZENmszUHJWTUh5UkQzZHIycE02K2RRc3Nj?=
 =?utf-8?B?RDVyMkVrOXQ2bzYwQVFjem10eURoMDRzd0FNTFZ5L0VodWNDTWRIVy9pVW1k?=
 =?utf-8?B?TzJpS1dDQWFWb09JYTNjTUZRUnAzS05DaVJPZG8zSEdCZEpoSEdQMk92c25Q?=
 =?utf-8?B?UGFxSmVwMW5nU3o2azN6eTMrcU9uUXlYN2VLYlFtVE12dEUvYmw5OGd4N1FV?=
 =?utf-8?B?SVlhWEgzdTF5dGFnSVRUYmFXdlhFdllFMmFCdEl1YnBScHNRNG0rZGphMFFk?=
 =?utf-8?Q?fD8PjRF/gbg1x8ms=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00390cbc-cdea-4271-8bf0-08da29eee946
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:45:32.1047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+xjECyMisxM7Nrge41Da89fjke98TKeB5/gu23brxa0ClzafPUOhCWgWowcexPSvI8ufN7wibNTDIfEqRHwyTV6Fk3ANSeHEF4mhAwFrU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-29_05:2022-04-28,
 2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=912
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290081
X-Proofpoint-GUID: c9uv9nSP3vak6MzBqUUxMUVwpVRHrLgy
X-Proofpoint-ORIG-GUID: c9uv9nSP3vak6MzBqUUxMUVwpVRHrLgy
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>
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

On 4/29/22 13:23, Jason Gunthorpe wrote:
> On Fri, Apr 29, 2022 at 01:06:06PM +0100, Joao Martins wrote:
> 
>>> TBH I'd be inclined to just enable DBM unconditionally in 
>>> arm_smmu_domain_finalise() if the SMMU supports it. Trying to toggle it 
>>> dynamically (especially on a live domain) seems more trouble that it's 
>>> worth.
>>
>> Hmmm, but then it would strip userland/VMM from any sort of control (contrary
>> to what we can do on the CPU/KVM side). e.g. the first time you do
>> GET_DIRTY_IOVA it would return all dirtied IOVAs since the beginning
>> of guest time, as opposed to those only after you enabled dirty-tracking.
> 
> It just means that on SMMU the start tracking op clears all the dirty
> bits.
> 
Hmm, OK. But aren't really picking a poison here? On ARM it's the difference
from switching the setting the DBM bit and put the IOPTE as writeable-clean (which
is clearing another bit) versus read-and-clear-when-dirty-track-start which means
we need to re-walk the pagetables to clear one bit.

It's walking over ranges regardless.

> I also suppose you'd also want to install the IOPTEs as dirty to
> avoid a performance regression writing out new dirties for cases where
> we don't dirty track? And then the start tracking op will switch this
> so map creates non-dirty IOPTEs?

If we end up always enabling DBM + CD.HD perhaps it makes sense for IOTLB cache
the dirty-bit until we clear those bits.

But really, the way this series was /trying/ to do still feels the least pain,
and that way we have the same expectations from all iommus from iommufd
perspective too.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
