Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0B55FF08
	for <lists.iommu@lfdr.de>; Wed, 29 Jun 2022 13:51:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D81C409F9;
	Wed, 29 Jun 2022 11:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D81C409F9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=srT+Xv8P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 514Y-quc9BUV; Wed, 29 Jun 2022 11:51:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7506F409ED;
	Wed, 29 Jun 2022 11:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7506F409ED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA7B6C007E;
	Wed, 29 Jun 2022 11:51:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D948C002D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 11:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 591538269C
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 11:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591538269C
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=srT+Xv8P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6Ibf842yNzB for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jun 2022 11:50:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A6A81D11
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2A6A81D11
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 11:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgiJumhgbmqkf1YBAumf43Tnbs/S8LfkMbUF5BVB7K2oEvQaE9oHm8cKX5yPpm8jFoQTFRL6m6MZtsLP76FA07MoSSekAHJuUy6uMr6TCazCVKI8OR4GmsHJiC6soGLKZlP3IWbeKwNkBbubX0zZkqs+kUZgcxa5zC7ERC07Ol7VP+GSxc5WduFkNVUt+cQ0fzKdO8uWoPH3IBXI8jUWzvEwmGp7DD+d42KgJR30LwZa+A4TA/DP4yofFrgj3mVP2LYqscytFo2oSsD0wiveEvqkm81abv0t7ouM82lFVnw4jUD2d3MiTA8S5YttsSxQpcqMy1HaNtdPjZumzLqxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvce4JSE4V6lrs0s8modkLeIVjazFa5cALL69mj3iKs=;
 b=AKn0Xx3MrRLk4J7VhUMgk8A19RrCtEuOU9eljLN+TX2qaHCS3ytDEqE+6bT5kSC3WH2VYtIDnVLl1ZAT/hklpmi0MkRyDuy8XX7H5Fm0KsQOezfaIaD+SVFDD8DEeu2u7zW9+ahCiKdst6F7JjktbjyTEA/p7lIiiltq8LrWU3ds00EhH5aNtsVlMo27w4uNC15i8q+C+WxWLDc9cgtjH6SJIgEnovXKqbRkR7QKRDhGgvbUagSnGiT+egfJvhHYVYsgtW9rbgk8Tp8IDwQ3E1ZRI7MohTHTiqbh+h6hcjodVJxfZUTV+W0T/qq2DcAe2h9qBfzDUVk976QDi85JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvce4JSE4V6lrs0s8modkLeIVjazFa5cALL69mj3iKs=;
 b=srT+Xv8PzyY+GCEEJpa7RrNXXniPT+Xy0T34gKzhO7SWqPbbusO1cDQEcLc/UQKEryqRggSI6V9SZJrVSqss4egSGJBd4JSq7gtKmH5lYiHttkdEF2xqxbdIJV8RNIjHtuoDCVf7n2MbyLVn4Fa/4ARr78rhswhI72wA3D6LHA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 MN2PR12MB4503.namprd12.prod.outlook.com (2603:10b6:208:264::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 11:50:55 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::14b:372d:338c:a594]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::14b:372d:338c:a594%9]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 11:50:55 +0000
Message-ID: <8b58ba70-714b-ac53-4598-a6c9f270a0be@amd.com>
Date: Wed, 29 Jun 2022 18:50:46 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/7] iommu/amd: Warn when found inconsistency EFR mask
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>
References: <20220622171131.11870-1-suravee.suthikulpanit@amd.com>
 <20220622171131.11870-2-suravee.suthikulpanit@amd.com>
 <YrQizrI5lR3ki37B@8bytes.org>
In-Reply-To: <YrQizrI5lR3ki37B@8bytes.org>
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f56f3285-6a4f-41bd-dafa-08da59c59fbc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4503:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y85DNcBb9kEyEzk4CD9CCBo39RjKu3YRjk4ZHin9z1NGw9nVyG1X6eB6ed1N+rK9dEcKDBJtN2KVMrZR+J8uBqdw6v4ljbi3WQZqKQkHFmNld43kpkCxTZpRLpDv7dM5UHUxgZ2zeq/Rp2RoXZ+F4VFU3DKu0DY9HT36NwGofXkYW6A9ejvbU5QWKU1zQmVCnGj0Uilo3CvkCi8U2HnmwC5quriLBFaZ6oksbZUnik9XTqNBOLOtS15wTXUlqs4aGYcrsyryOyiprVi90e9sTYvtZZO+sHCpZW+Ht5kaUSvgpN84vmxc741dySRRStO1XqROzQCgC8BXd1idXz4zPauccS4KC/bdUX/ajSSR/WZP3ao2GLMvSaztlNTcn6m6HvNOo/KdGPaWdaau1Ojt2uqQGDNtylDAxQEnvMPD2NeK1c5pm9SyVZU3T/8n9dpSPgjZgiJjVvgw0mO5aeKryl+/01/AziEMYRAxm29cKdXF6FlyLPmWoOmaudsSE2Jv9EBm7TADGM6bXmf5afdKDRNvsNWWxzct+70+AyMFj3a442y8i36qjkFuY3LwSrSSGrU1otMvyxbqi1+z1ftEChfVi0gnsXfct7uDDzn99+W0sTmGtgXn2BPYdA4vu/LfmC5Nh0ioO9BB/eDnpCTrvVD9aX5vksMRbbtdbZYUjR262uLbtWiFXOngOtmWz4SOHZW1lN3FL2DRc3f97XKHUUWn+TLveWq6sZJ7eVg+n2ZPvP3R93LWlAnaw1ca3H6GgU+9Kf+Su/xDWpipvb08bNG++tYSdzjdOCBulrD7Lgk+zeiEKlv/oId2rVNjT/GXZWfv3/UVUWPWiyHMtHWAug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(6916009)(31686004)(53546011)(31696002)(6666004)(36756003)(5660300002)(41300700001)(316002)(38100700002)(2906002)(66476007)(2616005)(6512007)(8676002)(4326008)(6486002)(66946007)(6506007)(186003)(86362001)(478600001)(26005)(8936002)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NmbWk5TzBOMExHek9wLzhHdTBGLzVGbTdhaEdPeElEVjRVeWxmTUN3dTFr?=
 =?utf-8?B?WTB3Nm5vcVhQL0FZYUNrQ0EzRVBYbTdaa2NwbUtJTlV1UDdqM3krUkRVUmE3?=
 =?utf-8?B?VTM5bDQ2ZG0wdEVIb0I3U1Q5TmhtYXYzY080bktKL3Y2eCtvVi9ZdU1KVXc0?=
 =?utf-8?B?bnJsTitQNWIvekZlNFZGUmZpb0JaT1ZQeWtlbnhqQVB3Z1hWRmk2RmFVN2Vu?=
 =?utf-8?B?WHg2d2p6VkNjMDk4TVJkUk4wYWJGYUdZTDdrQm1yNTc2Nk5tQUtuWW56VXNG?=
 =?utf-8?B?VWZsU1VabmdIQW1VSjJHaVlJMVRpZ2o1R1c1R21YQzNMQjBIdkVWL3lJVnVy?=
 =?utf-8?B?ZGtaMms3ekhuOFFTWHI3aS9FNkpnZ0JCREMxNVJNa2JKdGc2alZVN2c1aXFB?=
 =?utf-8?B?ZFJtQ2F1K3JxOVhYRjRxamZYRUw1RUpLNnhDaXUyTSszOStlT09vRHNDZktN?=
 =?utf-8?B?cndQdjdYbWdKSFFPWmEwOFlqZTlzZ1k4VFNVaUw1dWZOSGhJQUhubVkwV0VL?=
 =?utf-8?B?U2l3MHhBa3g2clFJcGpPdjFtM0VkVUV4ZVlrdm1TdnRkK3dudGkrcnpOZmwv?=
 =?utf-8?B?cXhHbkJ4SzdmZ3NQMEdPZGFpdEt5eTRwdnVNL1RPVnZHUWdnMnNtVStlWmx1?=
 =?utf-8?B?OFdXbnRRVmVvV21xRkhGVDFBRlZwSVJ6WmlHLytwTDNkVFRFRTlyQ0YzSXdv?=
 =?utf-8?B?NFJ1UlVvNG5ZTVhQM01YQlh0cjIrRzdmUXFXSXpRWkRnWGlDajRFbFZhdUY4?=
 =?utf-8?B?TCtFL2tzVWJEMldoUjdKRzEvRWVPSzA1b2swd1o1Ylh6OVY5TjdtUkZjNVZD?=
 =?utf-8?B?UmpmS2cvMUFkK2dYTEdQRmRTRGxzN1lGelluOGFhZ1o0Qzl5Z3d0N2VNbXJI?=
 =?utf-8?B?MzlBYzc0eDBycGZqclB0bmUyU2RiVHNJYmJIT1dGMGtxREFaVE5rTC9jaUlJ?=
 =?utf-8?B?ek83aFgxQSsrYkh3ODlmVDR2SFhUMkpocS9iWnE5ajFIMy9ncWdOeldRVytM?=
 =?utf-8?B?TGtydXBRWnlZVkQrYnN4SnV5cFY1YS9vY0U5c2VkSWJuOGRmUkRxQW5YNVp0?=
 =?utf-8?B?VmhhMTBiTnZkQXJiS1lxU2NJaklTajhSUXRGOSs5aThRa2NuRFAzbnRoMnFr?=
 =?utf-8?B?Nkt2WGNkRWxvZkJCMnlTRnNOUS84Q0h0eEp5eE0wY1ZFallaK21PRzZUOHE0?=
 =?utf-8?B?WitKRlc5cDVhYTVwTWx5VUllRFZXREhTY1l0K0YwUDhIdnZXdVI2SDNNSExj?=
 =?utf-8?B?aXFjSXExMHJ3OGo2YUVHY01VN3N0bWVYTzZiOTU1MzdUcVJhTHpVVnpPcXhl?=
 =?utf-8?B?RUo1bmVQcVgycXg1aVp0OXBSa1daV29lWk5kR1gwQkdiYi9kb1M0UDZ5TWJE?=
 =?utf-8?B?R3F3NkIvdERYdjVWUXA2OFIyYlhvVW9zUzZoZUNidUxYUytTb1RsbjA5QWx1?=
 =?utf-8?B?K2RhZWF3N2ZvcnNuVlRrUXRLSmx6aUZHaGFmZ083K28yYk40dWg5cDZJczJz?=
 =?utf-8?B?anBOOVVyYnhzTnF4VHMrWXNRa2xIUHZNdkw0OTRvNFBoczBuYUZCUkJWQndI?=
 =?utf-8?B?RndHSDdQU0o1UG1CRDJKSGJ6V0FDZXZmU2ljaGtHQTUxQ2xoWFcrQ0pQRVJ2?=
 =?utf-8?B?K0dFejlNQ2pvQUcxUEIySEVhZWUwTG04KzBPZ3loemdhT0xkVyt5RGZvUGtq?=
 =?utf-8?B?djJBOVZGbmpjNDNjU2daa0ZjYmZ6L2FZM0RLczF3ZlYvRkNmYnVNZ3JnZTc5?=
 =?utf-8?B?ZHZ2ZFFhckNtUEQ1SkRCcEJrZ2JVeWtNUGphOU5BK3R2QWFvdldoNmFGT2RV?=
 =?utf-8?B?bXBGNmFkSHNJRDNnM3IxeW94RUFySHJVcXZSTWtOcHFaRlpYdnpKZXc2K2M3?=
 =?utf-8?B?a3VMVWxlSmpNUFA5WjUwK3NySVhwT2xBTUxiMVR4ZGtURk9SME9kcFRWU2VZ?=
 =?utf-8?B?N2U3dUdnRGh2bTk0RkpsTUlvYkcvbnNUVktxNFhheVB2VlRtMS9UZ3UxK1dh?=
 =?utf-8?B?R2xYeFdaYmRwdytjaTZneVhSYyttazJza2t6OFBhYmtrOHdKK0p4R3l2eUgz?=
 =?utf-8?B?WmhuNENwOEtBRFNpOG5OK1dENEQreWg3azZEUEY0VUFTYlNSRXJmS1hnZjh1?=
 =?utf-8?Q?UqdOuJpIW/rx4uq2DtcRJ5TIt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56f3285-6a4f-41bd-dafa-08da59c59fbc
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 11:50:55.3960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ekI/HP2JcABwN6/jxVOKecExrThPC0rjtreRTDY8u1c6hXs6TVkgUD7JwmacM1saSzv/I2RaN7RMFhCHd0pLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4503
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, linux-kernel@vger.kernel.org,
 vasant.hegde@amd.com, iommu@lists.linux-foundation.org, robin.murphy@arm.com
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
From: "Suthikulpanit, Suravee via iommu" <iommu@lists.linux-foundation.org>
Reply-To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 6/23/2022 3:22 PM, Joerg Roedel wrote:
> On Wed, Jun 22, 2022 at 12:11:25PM -0500, Suravee Suthikulpanit wrote:
>>   #ifdef CONFIG_IRQ_REMAP
>> +/*
>> + * Iterate through all the IOMMUs to verify if the specified
>> + * EFR bitmask of IOMMU feature are set.
>> + * Warn and return false if found inconsistency.
>> + */
>>   static bool check_feature_on_all_iommus(u64 mask)
>>   {
>>   	bool ret = false;
>>   	struct amd_iommu *iommu;
>>   
>>   	for_each_iommu(iommu) {
>> -		ret = iommu_feature(iommu, mask);
>> -		if (!ret)
>> +		bool tmp = iommu_feature(iommu, mask);
>> +
>> +		if ((ret != tmp) &&
>> +		    !list_is_first(&iommu->list, &amd_iommu_list)) {
>> +			pr_err(FW_BUG "Found inconsistent EFR mask (%#llx) on iommu%d (%04x:%02x:%02x.%01x).\n",
>> +			       mask, iommu->index, iommu->pci_seg->id, PCI_BUS_NUM(iommu->devid),
>> +			       PCI_SLOT(iommu->devid), PCI_FUNC(iommu->devid));
>>   			return false;
>> +		}
>> +		ret = tmp;
> 
> It is better to implement this by introducing a global feature mask,
> which represents the minial set of features supported by any IOMMU in
> the system.
> 
> The warning is then something like:
> 
> 	if ((global_feature_mask & iommu_features) != global_feature_mask)
> 		pr_warn(...);
> 
> This also makes the global variable to track SNP support obsolete.
> 
> Regards,
> 
> 	Joerg

That's actually better. I'll send out v4 w/ global EFR variable.

Thanks,
Suravee
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
