Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5654D900F
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 00:09:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BEB5405AA;
	Mon, 14 Mar 2022 23:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1Mg2v60xbyU; Mon, 14 Mar 2022 23:09:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4383B402BE;
	Mon, 14 Mar 2022 23:09:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DDB2C000B;
	Mon, 14 Mar 2022 23:09:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F3DEC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 23:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409E38176A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 23:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="Xm+vlTtZ";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="YSKxrCGu"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHpfvDOIcgkF for <iommu@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 23:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 555C08175B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 23:09:34 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EKrjwt008028; 
 Mon, 14 Mar 2022 23:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aAP2rN1XS/6FTcwwbQ7XuGbBn7vgmces63OYSfVHz3c=;
 b=Xm+vlTtZdgncnoQIwq1TczdI1m8y0vFUjox/5FBp1R0IbsGeHf144m9WB8Fh20O96ThA
 yTg6SXLPiA1Kmfs42pfbrlqAyUbOMH9/Sg4TKptZa1X5fkcikSr7Qbvy2f74WjoM9mjs
 pYy1isIEzAstdmAVEl2Fo0ggQr+Oqt0Lt4rlW2RpN+pZWMwVZKHyHVWi1/9hVuVs9abh
 kw3v0DLyqULxT5aSbcPgsjL98aEITAyTdUWQszgtdedJT6wrnjB3NGTtHFUlsz1fAt1w
 Wld7OX8MqXrK+Dg2boxBWuV3N+q4MOv0583VUp1o7Is+ULVcrJc92o+HJIpCSl0YSaPa rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6hn37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 23:08:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EMppAP056598;
 Mon, 14 Mar 2022 23:08:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3020.oracle.com with ESMTP id 3et6573b8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 23:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHL5BKK+VmQRxkAeSDZ8vJlJrkjcHXe/X/ICoERJF2PGEDB77y3VqdS4tEY6GN2Oe1DRKll6yFaQQWxq52GVLksLrNGXuUvsJA4uMrtwTMWXKxb+HiQms/KT/Sed5glwhZpFgK5FxVn+pGtz7IqCpqAexwHcgilpXdXGjRyHckSdGb+Xhg4kEvVesAKNe22JGvv213bcH7uw40VI0cztXGgS+io0sLASz8faFccoXQMLoq77zgGA+T224oEwqOijhzJ7pzZwW53McpApCl7S1p6o2U/3iCoUQfLT28OpaYjj00AkCGokvWokUgz48nqIgqSnpgPB1oPJF6lTQz0ZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAP2rN1XS/6FTcwwbQ7XuGbBn7vgmces63OYSfVHz3c=;
 b=VaGKfBz1Y3QDfKmZgoz5Aw6IIAg0v+KXuPBWMb78NnTxoA6b1eLvgZP5aor9UVqHkr7ks4gew0xE46+7ZlyM/vG3nKAUdoV85h08hIub1YnYzwYgg/br9iQk1lsJBk1OhmiA+J9IVXU9m6IYarDxniUnDn38i1oHnwbOqH0B3FBTjcge7vGcH48jV91qW4kiTmpOTkhwDly5VkUmSdSpTyfOnllBQ3pIXMU4k6yzO1yjL9/8qJb9q2mB9KtoLWTiml6xHMxNuUDgxXHQ2gCo3gg4ElnsfffCDNjobfBxMy1+FuM0usIWzeYRRWuS3wBPJZv3v5D55QegP+IYXlMULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAP2rN1XS/6FTcwwbQ7XuGbBn7vgmces63OYSfVHz3c=;
 b=YSKxrCGuZKi1ps+y920yVbNCy5o4rXyUZa7HRfqg9JYIOAVpgcWi7XPxUushapFPMytqTwtZiy8zoeUtIKipYLTecLQWAruidqTO+DNkzwbxKhifJBByPRx8SugDw34xQqZItpyWbpirw4crRdDrIDC5qrUL25YvR+4qkjTNudg=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BN0PR10MB5335.namprd10.prod.outlook.com (2603:10b6:408:127::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23; Mon, 14 Mar
 2022 23:08:11 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%7]) with mapi id 15.20.5061.029; Mon, 14 Mar 2022
 23:08:11 +0000
Message-ID: <6a43380c-b873-3f8e-5d5b-4a066ee57ac2@oracle.com>
Date: Mon, 14 Mar 2022 19:07:44 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-14-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220314073129.1862284-14-hch@lst.de>
X-ClientProxiedBy: SJ0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::35) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e2481bc-d1b4-44ae-eac5-08da060f80e9
X-MS-TrafficTypeDiagnostic: BN0PR10MB5335:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB533595ADFCE33B7C4903371F8A0F9@BN0PR10MB5335.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEqEbKBQNZdVQPukhdJW1JLqgYr5YNTJuioIzq8XbUNowCPltaUN2SCkML/ki43ypomne6spCiDSr0fpNhg5hp9enZW7bJuu2OSYtCv0HFlkMaTH3+YxoiAsgbVLwDXpgDtHgIptTOz9948x9ahZCeBXdF8dI5W79M46IWFpQSiG0y2PWhZ8InCQvp9qnRVCLZ3M09brSlmreZIm8sKj06eDGjb/gUlIjk12ZONc54d2/wShw3nOa56kkV+0qnYzd84vO/m38QQ8xDGYS42YmAvuNwe2dyQqE+lRynqPxOahBkNtnpCDsaFhLYchr67eEgXzR9EBrh9FFQ4a2C4S6x10ubWtdyg+8NTGutEUfLMwRUP6VnQPPxN9cSinebL7uxBI69QrnlvH/XU3mKCiz9RqhbHNhJ7GiTGU6+4MK59+R+suI7fjA0SPNtayT2TJbZf4mnZslLnTxHv63n5l/oiIkBRRtybUMXVrcarUdDxvRdVwvtPgNutNzjI/6SfELPeITPTEyXZc3Qm5X5Vhx+cuL/pzoRc8hT3g5E3TT8/LlUvys24IBjB6YSns/6NElfNDulApJxs+5VdhUOcp6PLC5qIMjKenTymKOmqSl9Ra6BlZDJAzQqaiZZb/URjDhgsS1F1twsl81Ko+iLalYnDrM7PWZKSvf+yyRlpVJCZ1MABo8mGhRL3lps/CtjQEn4lgPGLUmny+N8r3OQAv+ONDDaRvjGMnliwTrgyIDlK2Zz7eZxoMVSX31fh5LpSv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(2616005)(83380400001)(86362001)(26005)(38100700002)(31696002)(2906002)(66946007)(66556008)(66476007)(54906003)(31686004)(316002)(4326008)(36756003)(8676002)(53546011)(7416002)(8936002)(5660300002)(508600001)(44832011)(6512007)(6666004)(6486002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2JVbExGNDc4MmpiL3RkUFVkUDlURXF6OEx3dWNNUDZ5OVhsOEU1RG44UXY2?=
 =?utf-8?B?bURKcnV6VDIvV0t3eExSMzhqcFZWT0Rxd3E2dFVmSGMyNUVRdFhINVVGemdW?=
 =?utf-8?B?WmEvdDNHc0NhcUtUdjc1YkxvM01TZHhSTnR0eUVDL2x4clozYmpmOGJsWFNn?=
 =?utf-8?B?SllWQlJ3MW1kUE1rRnhZdHliSnRiS3VlcDFZaFdUVUJxL250eGdUZ0I1TFJO?=
 =?utf-8?B?THhKZDNZMm0wR3lmZWkwV3E2ZUpPNDBuWS9xQnNGR3VNNGEwdjh4YnFlL3ZE?=
 =?utf-8?B?dTdoaUtJWk5mclpoakdDYW81eGZXTDB2QkhpTW14QkJmekYwMzVzdElnd0tk?=
 =?utf-8?B?WnFEOEcwL3FLcW5FWkdXTE5NT055cWI1K0JtcGNHM24rWHRyYUNJc0pUanRu?=
 =?utf-8?B?M3FDZkJ0aCtmNURmaU5LeVErR1NaOFhEdFZOcFVZMWc2eU00LzViWFFCdGRW?=
 =?utf-8?B?KzBtWUZlRk5WWExHN3NvSjVwVGZiSFlQTG1zb0o3L01UTnpDa3RYQms1eHVu?=
 =?utf-8?B?ZHBzMkU5UGh6UEV2eXFzb09tcGpWM29oVTdkMHQrR1dWcXl6dnNUYmRrVU1h?=
 =?utf-8?B?Vk1Zb3VaVlZrK3M2Q3l2UjNXQ0JBVzliQTBjSXhXUWp1ZG5aUmJ0OTBna0FB?=
 =?utf-8?B?S3IwZk9SS0xpUnFVMFFhdUVjeWFmK3ovTDdpSmNGZFVIOFAwcVdvK2NBa2o4?=
 =?utf-8?B?VEtMTUtDazVqM2VrZ2twSHQ1blVuMTdSdExKOUdTaHhTK3NDNEZlZmRwNTVk?=
 =?utf-8?B?NXpvSkhGWGdCMk5heE9LUDIrYWZZeE9BZ1I0alFhL3d0ZzEvUVVMSWdxc2ly?=
 =?utf-8?B?M0JoZE1VM2N0QWlTbjFDZHdkWlN0Zzd6OWpJdHRDVy9TS3BUWm02dklHRjQy?=
 =?utf-8?B?alFBc29md3d1N3AwWFhlZDhFM0ZmQ0RTTnFjUGpxS0xQckJraUZ2QmxoWkJX?=
 =?utf-8?B?ZEMzWUd4Mll3Q0tDaGxBN2RFa2VEM1pIUVhYVldkS2hCL0ZpOHZBSnFRRmcy?=
 =?utf-8?B?RVhQVVZGanowRHkyR2RaQUpnRnJUTnVybUc5YkJZTmllSjNvc3pBWVRTeHIx?=
 =?utf-8?B?TUxiemczZVFNZFREK0VMNnljRytGL1pXNVo1WWJ6WnJLdEtaNVdaZXVUTTRS?=
 =?utf-8?B?RzFZeTBPZGo3NFpBejc1cUZYZUhJM2JWWEJuOUJBZENGSDRZWmNuZytmUG9m?=
 =?utf-8?B?d1JhczExaUZCVWVLR3dvTVZWOXBJWm4vQ1dRUVFPd3BPb3YxMzZQUk5nMzlZ?=
 =?utf-8?B?NUpIMlJkbnVmbFc1UmIyaWhRVForVDFHR284djljOFpTZXpROWpIVUpSWG45?=
 =?utf-8?B?N3JKU1JmOGh6TG1QTi9RUUZBaG9XdHhuZTd4UG54cnBRaFExdkNMM0c5aGdo?=
 =?utf-8?B?clF1OVkwWVNZUlRadWdJUTZaa29BUnh5UnUrWmVSQU1FT1JnVFRhT2d0ZDJ0?=
 =?utf-8?B?WGx3TmpFUDRmS3NBTEhUd0VkMmMvQWpBR2JhV2hqZ2hMSW5yVUF6RzJraVp3?=
 =?utf-8?B?Y1NkWEh6em5PUGlpcEtkZVkvMXFTVkxlbTFnSVFJQzhIMGRGS0R3UWNNVlVG?=
 =?utf-8?B?K25FRHRKNCt5bVJmbjNDd0dnd1I1Y2VZdTFWS0NjWEVwZWt4S3I1b0ZzTUR0?=
 =?utf-8?B?aXExMVBITjAwczR0OGRwUDJwY25lQWx6eVBnU3ZUUEVKdE92M2pteHlUTSt5?=
 =?utf-8?B?c2ZiRnNKSE5FSUZiOFJCOXp3dldBTXR6MUoyaWx6dzRFLzN1OXBIUTVkMzN5?=
 =?utf-8?B?WittK1lINUZrVEJxVEhraDBDR0tZYitQbWRDMHRpK1B0ZEJsZG8rcWxLOHU4?=
 =?utf-8?B?ZVVXZnNjNVJuZlU3c2UxN3JHTFIyYlo1b2dkb0VaQ1JkL0VBYTgvaThzd2hR?=
 =?utf-8?B?K0FRVk9NY3pQWHFMbWd2eWZ3ZUM3aDdTSEpIa2hIZ1JjYmNYMXZHKzZ2RmxW?=
 =?utf-8?B?R0M2ODJjUVdoQmUvQWUvZ210dXNCSDRZS1N5S3ROUC9ldjJEcmNyL05zN0xr?=
 =?utf-8?B?c3RRWVZYT1ZnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2481bc-d1b4-44ae-eac5-08da060f80e9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 23:08:10.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzJfRGGEtHiA7QsBW9U1/PvJGCmtp/3nWmc6fTXss12IyNyYilzRQhaQsKHE1B24o6wOdHZLetdZU4UPJSECm6WOby8LohrxCCXzP6PFltU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5335
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10286
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=939
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140131
X-Proofpoint-GUID: RnEdNpa8mj2ie4a-z_0lChTHqkc_NM84
X-Proofpoint-ORIG-GUID: RnEdNpa8mj2ie4a-z_0lChTHqkc_NM84
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Ck9uIDMvMTQvMjIgMzozMSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gLQo+ICAgc3Rh
dGljIHZvaWQgX19pbml0IHBjaV94ZW5fc3dpb3RsYl9pbml0KHZvaWQpCj4gICB7Cj4gICAJaWYg
KCF4ZW5faW5pdGlhbF9kb21haW4oKSAmJiAheDg2X3N3aW90bGJfZW5hYmxlKQo+ICAgCQlyZXR1
cm47Cj4gICAJeDg2X3N3aW90bGJfZW5hYmxlID0gdHJ1ZTsKPiAtCXhlbl9zd2lvdGxiID0gdHJ1
ZTsKPiAtCXhlbl9zd2lvdGxiX2luaXRfZWFybHkoKTsKPiArCXN3aW90bGJfaW5pdF9yZW1hcCh0
cnVlLCB4ODZfc3dpb3RsYl9mbGFncywgeGVuX3N3aW90bGJfZml4dXApOwoKCkkgdGhpbmsgd2Ug
bmVlZCB0byBoYXZlIFNXSU9UTEJfQU5ZIHNldCBpbiB4ODZfc3dpb3RsYl9mbGFncyBoZXJlLgoK
Cgo+ICAgCWRtYV9vcHMgPSAmeGVuX3N3aW90bGJfZG1hX29wczsKPiAgIAlpZiAoSVNfRU5BQkxF
RChDT05GSUdfUENJKSkKPiAgIAkJcGNpX3JlcXVlc3RfYWNzKCk7Cj4gQEAgLTg4LDE0ICs4NSwx
NiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGNpX3hlbl9zd2lvdGxiX2luaXQodm9pZCkKPiAgIAo+
ICAgaW50IHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUodm9pZCkKPiAgIHsKPiAtCWludCByYzsK
PiAtCj4gLQlpZiAoeGVuX3N3aW90bGIpCj4gKwlpZiAoZG1hX29wcyA9PSAmeGVuX3N3aW90bGJf
ZG1hX29wcykKPiAgIAkJcmV0dXJuIDA7Cj4gICAKPiAtCXJjID0geGVuX3N3aW90bGJfaW5pdCgp
Owo+IC0JaWYgKHJjKQo+IC0JCXJldHVybiByYzsKPiArCS8qIHdlIGNhbiB3b3JrIHdpdGggdGhl
IGRlZmF1bHQgc3dpb3RsYiAqLwo+ICsJaWYgKCFpb190bGJfZGVmYXVsdF9tZW0ubnNsYWJzKSB7
Cj4gKwkJaW50IHJjID0gc3dpb3RsYl9pbml0X2xhdGUoc3dpb3RsYl9zaXplX29yX2RlZmF1bHQo
KSwKPiArCQkJCQkgICBHRlBfS0VSTkVMLCB4ZW5fc3dpb3RsYl9maXh1cCk7CgoKVGhpcyBtYXkg
YmUgY29tbWVudCBmb3IgcHJldmlvdXMgcGF0Y2ggYnV0IGxvb2tpbmcgYXQgc3dpb3RsYl9pbml0
X2xhdGUoKToKCgpyZXRyeToKIMKgwqDCoMKgwqDCoMKgIG9yZGVyID0gZ2V0X29yZGVyKG5zbGFi
cyA8PCBJT19UTEJfU0hJRlQpOwogwqDCoMKgwqDCoMKgwqAgbnNsYWJzID0gU0xBQlNfUEVSX1BB
R0UgPDwgb3JkZXI7CiDCoMKgwqDCoMKgwqDCoCBieXRlcyA9IG5zbGFicyA8PCBJT19UTEJfU0hJ
RlQ7CgogwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChTTEFCU19QRVJfUEFHRSA8PCBvcmRlcikgPiBJ
T19UTEJfTUlOX1NMQUJTKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnN0YXJ0
ID0gKHZvaWQgKilfX2dldF9mcmVlX3BhZ2VzKGdmcF9tYXNrIHwgX19HRlBfTk9XQVJOLAogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3JkZXIpOwogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh2c3RhcnQpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG9yZGVyLS07CiDCoMKgwqDCoMKgwqDCoCB9CgogwqDCoMKgwqDCoMKgwqAgaWYgKCF2
c3RhcnQpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07CiDC
oMKgwqDCoMKgwqDCoCBpZiAocmVtYXApCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmMgPSByZW1hcCh2c3RhcnQsIG5zbGFicyk7CiDCoMKgwqDCoMKgwqDCoCBpZiAocmMpIHsKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXZz
dGFydCwgb3JkZXIpOwoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNaW4gaXMg
Mk1CICovCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5zbGFicyA8PSAxMDI0
KQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmM7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnNsYWJzID0gbWF4KDEwMjRVTCwg
QUxJR04obnNsYWJzID4+IDEsIElPX1RMQl9TRUdTSVpFKSk7CiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byByZXRyeTsKIMKgwqDCoMKgwqDCoMKgIH0KCiDCoMKgwqDCoMKgwqDC
oCBpZiAob3JkZXIgIT0gZ2V0X29yZGVyKGJ5dGVzKSkgewogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHByX3dhcm4oIm9ubHkgYWJsZSB0byBhbGxvY2F0ZSAlbGQgTUJcbiIsCiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChQQUdFX1NJWkUgPDwg
b3JkZXIpID4+IDIwKTsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuc2xhYnMgPSBT
TEFCU19QRVJfUEFHRSA8PCBvcmRlcjsgPD09PT09PT0KIMKgwqDCoMKgwqDCoMKgIH0KCiDCoMKg
wqDCoMKgwqDCoCByYyA9IHN3aW90bGJfbGF0ZV9pbml0X3dpdGhfdGJsKHZzdGFydCwgbnNsYWJz
KTsKCk5vdGljZSB0aGF0IHdlIGRvbid0IGRvIHJlbWFwKCkgYWZ0ZXIgZmluYWwgdXBkYXRlIHRv
IG5zbGFicy4gV2Ugc2hvdWxkLgoKCgotYm9yaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lvbW11
