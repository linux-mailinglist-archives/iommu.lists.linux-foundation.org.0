Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76C3E4ED7
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 23:59:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA338270B;
	Mon,  9 Aug 2021 21:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5q-jR7mMHFR; Mon,  9 Aug 2021 21:59:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0846682741;
	Mon,  9 Aug 2021 21:59:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7843C000E;
	Mon,  9 Aug 2021 21:59:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0263C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D281F60011
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 21:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_JEwVUGZs8x for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 21:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B00C6080E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 21:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsCsTHpzmWTiiouMP6xwkm9FUZreL8+k153ytEXb1tzpfE0ONCiAiOncXAjJmox8gSPLnmsr5ocGq9p5A+E4KLO++CB3otaWAMezVW9f0eb+iP394GbYVoSRrCqgGqsE4FDmAz3ZYXXB1bkGwriqRhyENT0yb2Ql2GWKAfq0TJBqQOLIyJWBQOxjwC2p9FJrZnTnnnhUXcNZA9MlgBIRGptMkyKFEoyRwbIB4IlWV46AagBjivXq7JRqeHbkAe/8wmyu58GNz80Ka8gdd1HWKfzQlc7ffQtRdImtUXk1j3z5RuNKWePDOZ5ZW7DAzVkbtSWvNTktx7fksHwlEIoOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+fVWOuMbO9S+XMebVddL0YWYyT5svIeeo6QLGQ8yu4=;
 b=TWUuBY8rLkZny4igxIEnSKCVnMDPothszs/EcA0j7j0eaBWC4rLDqqw40XUywHd0wS8nlU/BZgQ6CRElB/GEhSwR5sukaU3ME21NDfABvCSB7RHoz3k4qzJ/MpTpQmD51zXQcRFSNU2yLRicyW9TKZAIzmF7T5BMouOcAq/cmwFO0BbBpJwXytEkqUQXlmmruUzxhY49GHmhl0rs7N6wEXtTaydZMhFpLtusMGt5hm6U32yn59fTLA1Lf46gMQJS9PnLQCglED/CV8gc1S/WM9nC0lcFWB8rJFVMHCI41EoECkqZplLjGxrHlL7W4lQ8bzmru+YxUcT19JYX66ORJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+fVWOuMbO9S+XMebVddL0YWYyT5svIeeo6QLGQ8yu4=;
 b=BPW9SdqL0Vota9OT9bPPMiY84fBblH+finX7v/4McEcGiHUniQ77CiE8cIxsCVb/6OnyKZPEZypzPvPdbS3E0ABUZ/hbh8JZSP0yc0fiOlMeykHRl7sGJRQPmKFAROx3F4AgK8cKpw5RNfpBaIGzJ2bdthLN5xCyw6N+cjAMwKw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Mon, 9 Aug
 2021 21:59:03 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::73:2581:970b:3208]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::73:2581:970b:3208%3]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 21:59:03 +0000
Subject: Re: [PATCH 06/11] x86/sev: Replace occurrences of sev_es_active()
 with prot_guest_has()
To: Joerg Roedel <joro@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
 <YQfMw2FRO5M1osGF@8bytes.org>
Message-ID: <934f3e72-49d1-be56-6fa2-f37a02413fb2@amd.com>
Date: Mon, 9 Aug 2021 16:59:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YQfMw2FRO5M1osGF@8bytes.org>
Content-Language: en-US
X-ClientProxiedBy: SA9PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:20::29) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.30.241] (165.204.77.1) by
 SA9PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:20::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 21:59:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e7830d3-3b80-4716-0aff-08d95b80e6a5
X-MS-TrafficTypeDiagnostic: DM4PR12MB5103:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5103BB129605437CE3D95B1CECF69@DM4PR12MB5103.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOYaY8buUGNlr08qCZuZskyrgB/wo6y9E1tS0G7EJkbCzowPxvmEnoSoXmxtG2Uzoc6hIM7Y1A94RgEVXf/KuaGPHmVd/3a5j9ckKa82nAacWmUnE63nrRQBeVwBayq61sGECxFaxN4OX4H23jbU4TDD5j/3ilXFmDAjjozl7yvsv5EXYH/KpRg2oi2HWcGTbZ6QTgR74wrmKm+RgRwzTjV5iCBEhzJ5jZZomd9jnOq/J5Zyy4rJh7F3lF1FIqw7MJ5UFp0F105VYERIbqCYqJKKPkYX11GfCgUOUHM3pFerJ/vu+TUxT2N/23uGvtkzvX3Muwjy4wXp7/NgzDtMrtE/ATtxfYeoXifF64aWrWLT4UEDk1pDG16Zb9s2JJ4UOizmDyWNQctjFCTyBlnlmvbS0hJL8Y1JbL0YEDI5e1w4Aum3GU+0rfL4SfMKo9s/Jw99HZq22UjIIm8qycPbSjErmoFQImCV29m3Vp9kDX0vDDbBxDVHNpXMiZ3QDuJlg4eX3eB47SyYVpwxQvDaBECwt+QXQOb1l53C1fpSUAp5DWYOEyOtKjLKsEubLoLV5C7kZ9PRMscKhnfzI9cXKx2Wums5bSGSkv+1cp8URQRPX8Sa5dd1mKRpcNaWZGM8zuWVakjS4H8rzLaYWSWkk2ldesxbMX8/sN1V8yahA0DLhn1GYMNRDkslyYKQYa+172Wj2Lxni3bPVizR97qMzEMg5nNaOu2/PMQOSu1Cgh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(26005)(316002)(478600001)(2906002)(6916009)(4326008)(31686004)(66556008)(66476007)(38100700002)(66946007)(5660300002)(36756003)(4744005)(2616005)(6486002)(186003)(31696002)(8936002)(16576012)(956004)(83380400001)(53546011)(86362001)(8676002)(7416002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekQyQitaRjdFRG5VZ0tob0hNUTBwQ2JPOWNTeHQ1dlU4M0lvMEdEZEhjaVE5?=
 =?utf-8?B?YzdoZVNNeDFiOEEzbndURW5NNkIwQVFFYis1RkduR3dQa3owNitCdFhZMUVv?=
 =?utf-8?B?NTQ2cGp1M0JpbDJiQTNiVTJWWEpjMytZY0xOd0FoVVRVQXRramlFS1l1Qzl4?=
 =?utf-8?B?ays4MlJLdlllWDU2UmpBZ2ozOGJjVy9HVEtnTkJoVHM1eXQrcXVVQ0IrVUp6?=
 =?utf-8?B?RHhGdzZxM0dXVGRUSE12TFdLc2djTmJUYXZkUUFpbzNFUkcvL0U0MHpVY2hR?=
 =?utf-8?B?U3N5S041Qm9ORmplQmd5UEM3ald2WmlOM3RmWFhjTG1NZVV2ZEJQQ2E3SkpM?=
 =?utf-8?B?VkRKekljcnoxM1BLZDhTMGE2a3Jpd2wwTi9XcmtwWFhVRUdMa1JLYkVUOXdH?=
 =?utf-8?B?Wm5TNm5GNHMyY1BUckZvUHl5TzhjN1pBSm5IUmpuZGFKTkNNcFA1YUlVYVZz?=
 =?utf-8?B?RDNZeFBQTVA4ODltMGxCdjVpKzNuMzRIUFhZVkFsZ1h4Tk9oV0xyYlBsSDJm?=
 =?utf-8?B?S3FxbDBYVVRoditvMG95SWZrUWthbmUvS2toREswdHViR01NeEJNaGE0RExG?=
 =?utf-8?B?NDBIQjVnMDJrMXZhd0JFRVN3d3RzVENkQWFCQURiRXBDNDVBT0duRmhhejUw?=
 =?utf-8?B?bS9EMDFyRGdtUXM1dUZudlluKzVLeEMwZmo3Qmg2OXRqMmFlYWRjd0FxMUZh?=
 =?utf-8?B?Zi9jelRURU1PY0VhY29lNEx3TGZMRXVDOWZKeDJBSlpOeHpJR3UzS3EvenFE?=
 =?utf-8?B?SHJQUnRTd1l3NUk1Q3VCV3dsN01qWjVsWFNCMVVMdnBVQ0Iwc1RtQmltV0tv?=
 =?utf-8?B?RDJ5V1AwYlVDS3BtOENuR0VWUmN5V3VQM1BEb0x5OHlKVjNkek5MTlVQd2Ro?=
 =?utf-8?B?UVg3L2QzaTlNN1ppK0d6c2k4NVNOVVNFUnlBTWNaSkFsZENpU0ExRDdyUEhZ?=
 =?utf-8?B?OGkwRURrRndSZHlRbFd0UTVUY0gvcEpPZ0U4U3NTd2creDRPUkRlVDl0Mkll?=
 =?utf-8?B?a2h1WTg1WkxXano3aEdkUlBUUFZTUXRteFFWK3A2WUZtTTh6Mk9SdW9jZGxj?=
 =?utf-8?B?TEkzWGpvRm5kYkpKeWptcUk0ZUw3SWloSytROTZhRTlpOWRzMktaS3NqVXdQ?=
 =?utf-8?B?ZzVESGR0V3FEZWZOT0s3cjBpUmZmV05yYjJkcEZTV29ZQ1ZMSnIwMnA3R2Fu?=
 =?utf-8?B?eHN6ZGxnYy9iaUgvZU9INU1UVEZIbUVyNTd2TFZLTDdCNWxkT3hYaHlaOUpI?=
 =?utf-8?B?MklEZFd6N2dKUkxzQjIrc1hkM1BjVUlwVzV5Y2c0SmxJZmUzR2h2SEkrczZE?=
 =?utf-8?B?Z0EveFJjQm5vSlAxaHRDR3hTSGp3eDFqMGVKc0FWbklOemw1RFNiWmZYMUgy?=
 =?utf-8?B?SXhKL1dudWxRTVVTU2pUWEkvSHlRbkUwVk5wWEJSbjlEemNyQ1JmWXcrMWRP?=
 =?utf-8?B?b1Izb2ZzRFUzRDFWeU5CbVlTTGRHOTJZUzNVS3FPLzhUZ0xhNlFYR3dEeHNV?=
 =?utf-8?B?cVYvOUcvSVZNNzJqa1Bxb1BoZ0lhMkxnQzZuQjdyWDVwRWt1MmtFZHc0M0U5?=
 =?utf-8?B?M3pORDdybjFiSlNMbyszcjBoeHg5Q2dJaUd1SUNYS2VGM2lPUGZKMWlLREhN?=
 =?utf-8?B?WDRCN09WVXpPRWVYNWhjWVhRWGhDNW9YbnljTzNHNkF3RVhDaTdxSnpiRHFY?=
 =?utf-8?B?SWZ4SzBiZDlkVEZ6Q2pkWkY2cXppL0NLQUFpaGVOdmlBWGJFbjYrUkt5bGs0?=
 =?utf-8?Q?6gCxOSSraziaEXQQKcov9PDokiiJNBfw0U4BUSh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7830d3-3b80-4716-0aff-08d95b80e6a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 21:59:03.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xsUSBeVGUQ38N0or1ei9lB1TfCIUEwhfAbVhfjIoSY4Tefq5TqkTdUt2STTglYNsW1R5taJommignIUhI7UfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
Cc: linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andi Kleen <ak@linux.intel.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>
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
From: Tom Lendacky via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 8/2/21 5:45 AM, Joerg Roedel wrote:
> On Tue, Jul 27, 2021 at 05:26:09PM -0500, Tom Lendacky wrote:
>> @@ -48,7 +47,7 @@ static void sme_sev_setup_real_mode(struct trampoline_header *th)
>>  	if (prot_guest_has(PATTR_HOST_MEM_ENCRYPT))
>>  		th->flags |= TH_FLAGS_SME_ACTIVE;
>>  
>> -	if (sev_es_active()) {
>> +	if (prot_guest_has(PATTR_GUEST_PROT_STATE)) {
>>  		/*
>>  		 * Skip the call to verify_cpu() in secondary_startup_64 as it
>>  		 * will cause #VC exceptions when the AP can't handle them yet.
> 
> Not sure how TDX will handle AP booting, are you sure it needs this
> special setup as well? Otherwise a check for SEV-ES would be better
> instead of the generic PATTR_GUEST_PROT_STATE.

Yes, I'm not sure either. I figure that change can be made, if needed, as
part of the TDX support.

Thanks,
Tom

> 
> Regards,
> 
> Joerg
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
