Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554D3EBB60
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 19:23:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 942B240FEA;
	Fri, 13 Aug 2021 17:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETiit4_NC_us; Fri, 13 Aug 2021 17:23:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D997402CD;
	Fri, 13 Aug 2021 17:23:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FA2CC001F;
	Fri, 13 Aug 2021 17:23:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63798C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 404626063C
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHPF-dlYj9-O for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 17:22:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2045.outbound.protection.outlook.com [40.107.100.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B5AD605CC
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5KcLB+YN5nErDPgWwKk4assRc0Yto8sv9C8W7IA5DXzVMlYsVDqi1csBCh9VJVuNy4JYWV3nKpvCru2mTqQZSDO55qXWsXTgYeT2hxkdIuFgNuGhm2MMNhNY7dM0MViPFb2G5Z317FZ6C9sTb6UdQa+jFTshlNH3t/rFn7VKKgm9v7OhKoeFL97qMLPEFWa/qyklWkkESkpWnLIq4SY4qtizOIimP2c5AOE9f+Oc6QmerFFZM/cSB4WSKT7Woz2IOngkF9Fsn9NwIlrtaOF8LOao5XorhT7c+vpKswigTRdhY7YEjT6RcYcfbtdtMYomEcSbbiiom0+ZKNBNHT6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6RvfefU119MSrSgTAgvn6AIvZu84Wui9FRpOrjCKiA=;
 b=PUJo/fSqVIyx4p2e3K8XIkPhLi8QA857Pw9UiFSF/eUUDlhuxq9uXRaP3EsntilZLbu8cjrkCDJ/Z1U+PLzt2QphuH7nEC93NHIWNYWiTxDXj8gOz3yULLpBNGvSjqpfhDKLQNQTOPNM1En5ZYlhUKxoOVhLmBoEP1d9/OdERuYZpAug++hniiwp3PK4e1+NsxhQn91RNhdWDgsOaFvBpF0wNLvg2l1KyyuZhWn04pNNIvzs4FSyvs7JqaxeYtaYzSDZyCa4GCWTCdgYIwvC3M95prcaEha41Phjb05PMxi5oXqll22DmKdN8/zLFCqvZpWZ7EW+JIrPyWEUyUSU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6RvfefU119MSrSgTAgvn6AIvZu84Wui9FRpOrjCKiA=;
 b=ogDzJzpzVLvfrDsNISSdL/C+9bqb3m1SBEb4xGlC8iiwNQ4tnPOqHADvMjhKx1RozuzfasCa6Eee1uDMgpvIFlCIKO9M7y9n3noMT8TYkILL7BSuyCo3sw1mrz7gGp+OwTWRPl4iypZ1cIRks+Qe4swTZjRNvr+d47hM/fHBXxA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 17:22:54 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::d560:d21:cd59:9418]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::d560:d21:cd59:9418%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 17:22:54 +0000
Subject: Re: [PATCH v2 00/12] Implement generic prot_guest_has() helper
 function
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <cover.1628873970.git.thomas.lendacky@amd.com>
Message-ID: <5c5443e1-1168-078f-89d2-70275706be6a@amd.com>
Date: Fri, 13 Aug 2021 12:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cover.1628873970.git.thomas.lendacky@amd.com>
Content-Language: en-US
X-ClientProxiedBy: SA9PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:806:a7::8) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-ryzen.texastahm.com (67.79.209.213) by
 SA9PR10CA0003.namprd10.prod.outlook.com (2603:10b6:806:a7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 17:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9969e273-9a71-4807-01fc-08d95e7efc41
X-MS-TrafficTypeDiagnostic: DM4PR12MB5214:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5214A11425D4B1238BCB4A77ECFA9@DM4PR12MB5214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLsGDn0lrE8RKaN7ImSaDuO8ZE0Ezx9lRA68/4BNy6piwFHMoiNKQodyJRKpQLS7jvEKfAPsx2l3qhESpsmbCM6XUX2lCUsT4V/+A1baxddR11K2VnYVC0tOhG+yANdck5Y0rs/SxsltxgJVNaq7etewEoFK4et4+0AOSF0h1jOHRBxHu5E2zFQiaD0gOrvI8XPQugNOg6YABH+9IoqHEOnD92FhoT+KV4pWV2BjhRUgrr9aXGgYSAKqc86iusnm2/la6TVAHEgmVLBfHff4/TBuyK1MlJDHZRh8PUEn0je4rDlBNU9qMQE7GGnbW04L8RZP07JGqYr+WLYmJ+TUhgCma+XOq0YhpYoeQKKZdfB9QYW/xh2/170wuHHhl2uHGs2XQ+96sGijmeJLXOao/+KV/ClE4zYLJlYgD0CRx3HTRTJGcPMzD5Dz0G4m/9tgkX/t60as6gjuExAq41J9L/YIc/AvcqU8GAxwvCYm/6jEkWSrJ6pAWv6/uFaT1+dBFKHvqjTF6keLICITcBKfxsQ4GGVMkKKaCnAiI0ImJ3XUC3WRnC1ZoUrNmUcdnTSd72OrkeJodd4fskyAzkX62zdBKVoa6r7/wpu/weLAzr4JFampey5FOEVjCunuQ2ShRPSNJp6ae5nGbR4eIzk8gITFuSvXI9Qg3i+wbx4BXKvbPeNqMy4avPpDQKbzDgTSOFWuAALFi9091x69ct4WEAEwooT0mKlHAlsJdEitXjt49Mc+6E+vP/93AveXnJQt33sMRyV+JM4cmsKRUWSXLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(66476007)(83380400001)(7416002)(66556008)(8676002)(86362001)(7406005)(2906002)(26005)(31686004)(4326008)(4744005)(921005)(186003)(31696002)(8936002)(36756003)(6512007)(66946007)(2616005)(6506007)(478600001)(38100700002)(5660300002)(316002)(6486002)(53546011)(54906003)(956004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0dSdlVvc0JlSDFvZ2VjUi92VXJld25CKzMwejJiQTNUMUdRa1RhT0E5TWI4?=
 =?utf-8?B?cmw0VlZMemhzVGdxRzB4NE4zclpaL2xFZDFDZFVDYy9uNFE1dFZ1ZUFlRjEz?=
 =?utf-8?B?SmwvZFZQMnpsRXREZEJZaGpqMys3Zzg4MkVveWVVaGJxakIzN1lBVWh5aTBF?=
 =?utf-8?B?dXhnU1VHTXBacGZSQ2R3ZUFpQ21tTUYzMXd5OWdsZk0zNUEwbExiRjJKaXZv?=
 =?utf-8?B?dDlsMWpCV1RGajhsTE12YnFublBCWWtrdWxFUi9zaWIyZnluVFdmeHNQaW5M?=
 =?utf-8?B?dWJCOVV6WVplSG9XcE9kVWh5NFoySXRnTGl2YjEyeDlnR28yZEs2QVhjbGhH?=
 =?utf-8?B?T0VMeTk5UjZPSzhwOE90WmVjQVJEY1pVL3BvQTZuT1R6RnFWbjBZVHNFRzIy?=
 =?utf-8?B?TW1ic1F2dkNpS01ZNlVKZWdnWkpHbXF5dmV0MjVqa1IrcFMveFlSRi85MTVX?=
 =?utf-8?B?NTV3dm5UcFI2WmhkRG05ZTNmM3pESjNMVFlyQ01Jeld3OVBaZENjeUZqMlJk?=
 =?utf-8?B?VVBMMjkwTkZUZ2tjMzNVWmR5UWszb1J0aExPd3BDbkYxSHVFVi8xTy9TWTRx?=
 =?utf-8?B?MkxRU3ZaWnBLc2RVUVdSSW90MVNrcWl2OXlpSTVVTmN3blFCN1dkUyt0WGoz?=
 =?utf-8?B?eFBBZmk2Y2ZnbkYzR3VkZzBNbXRHYXlFYlhVM0JkYmFIblJ6WnR2QVZsNTAx?=
 =?utf-8?B?ME1tWUpYRE5ZNnJBMU8wR0RpbWJyZUhocDFtM2RyZ0VoYTNGSXlDczBuWjdn?=
 =?utf-8?B?K1FBYU4vcDN0SkxCN3NnNUQ1eERoaHZjeDRoaXR4cjVsdEJ0cU1tMTRUSWpM?=
 =?utf-8?B?aWhWUUhnQjhhRC9JWEFqdFZNc1ZYcDdaeWZVTXhqbDkyUDdhT1crVGRyTVF2?=
 =?utf-8?B?a0taUEZDRml4SHYyLzlJRWFsZ0MzdHdTRE1telMxQ01sanBkdCs5cjhRcVRn?=
 =?utf-8?B?R3NHT0RjTGwwdTRDY2RkMDZOZW01T1I3U3VzNUUvaGdVd21RQ2NMQjNNRmty?=
 =?utf-8?B?NW5jZTdGQjRMRWQ0eFN6cllJWjRlTnJ4ZDhnbERJeFF5b3kyTDRHSkNKWE1W?=
 =?utf-8?B?MFJzb2w4RWRheVpwUDZOVkZEa0pvSlRmN0pWQklEVlAxVmIzN2t1RzhkREsx?=
 =?utf-8?B?YXJSRnh1QzFrcDZsaW56aUs3V0dDNnVybnVSa3loRlV1QnRXQXdmZ3U4Wmpu?=
 =?utf-8?B?bWRDUlpUdXBMUWlmRnNIeUU5OUlvVG9FZFZaek5iZVNwUmxlQlA1TkNkdVRW?=
 =?utf-8?B?ejc1b2E0U2hsTGZna1lyUHM3Z1BIVHlkMW1BRzJjV3VkTzhhMlZCbWs0dGFF?=
 =?utf-8?B?dUwrRHVNNnBiQVM5ajhaU0p4NFpUWHNQQXY3SEErczl5ejBQRW9YOEFyUFdT?=
 =?utf-8?B?c0hRNnNlUUFpL1V2eDJYbUQ2am93STJDMXRiWjFWSjlTRzBZL2hTTXJDamVE?=
 =?utf-8?B?ODNhMUVlUWVNMGFXbTVsWjZkQnFaZTJVMXAvVE5jN3Jycy90Zkc3K05nd0Fl?=
 =?utf-8?B?L1J4UE14QkJTblYzQkNuSThGekY1N1ZzbXc5Mit2dHpmR0F2eis0OW9QeXRJ?=
 =?utf-8?B?SEo1aUtuYk1McDNrbmd4ai9Kc3ZoQ0FVREpTWWtzYlR0Rkd1YjlKRjdqR3Zj?=
 =?utf-8?B?YmdwcytwTnVXS0paMC85L00wS1J1NG1JREU5d0ZMOUh5dTZDam9JaERjaHI5?=
 =?utf-8?B?akgrWXYyQzBlU3pHeDVEd3Ztbm8vS0FydzB0aEdiR2RKdENtVFZ1aE5ZL09l?=
 =?utf-8?Q?Z02W9AkJz7sBg9wEjSky1jrugMay/nZZQAI+Wdg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9969e273-9a71-4807-01fc-08d95e7efc41
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 17:22:54.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj6QcnXXEHT0CXIxlKEIH/IA+azLA8VsCm+jOAbcy2bvSShnzEWVnDEefF9wit7AKRRZPssiJtbSJFUHliohnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5214
Cc: Brijesh Singh <brijesh.singh@amd.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Dave Young <dyoung@redhat.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 8/13/21 11:59 AM, Tom Lendacky wrote:
> This patch series provides a generic helper function, prot_guest_has(),
> to replace the sme_active(), sev_active(), sev_es_active() and
> mem_encrypt_active() functions.
> 
> It is expected that as new protected virtualization technologies are
> added to the kernel, they can all be covered by a single function call
> instead of a collection of specific function calls all called from the
> same locations.
> 
> The powerpc and s390 patches have been compile tested only. Can the
> folks copied on this series verify that nothing breaks for them.

There are some patches related to PPC that added new calls to the 
mem_encrypt_active() function that are not yet in the tip tree. After the 
merge window, I'll need to send a v3 with those additional changes before 
this series can be applied.

Thanks,
Tom
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
