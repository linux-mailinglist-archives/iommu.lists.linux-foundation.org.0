Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26E3EBACF
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 19:01:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E7E80DD8;
	Fri, 13 Aug 2021 17:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQFiJP5G6U2b; Fri, 13 Aug 2021 17:01:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 90AA480DD3;
	Fri, 13 Aug 2021 17:01:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C41DC000E;
	Fri, 13 Aug 2021 17:01:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48720C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1094036F
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTcIM6V02Twr for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 17:01:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 201314073D
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:01:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGRZJcPy6P5tF1JUO5XcwXANZ3wLbqu9Mzdwp3/jqNtMBnChgJHPUEmgXlRrw+rFryMrye9e0ItZuIFC1xw99+dkpWlMKx7+cx6ZFVRSLtG0roDeOhfjL2FJ3RiNaw/gu+jxRPzFAjyPS8LqXhFdL1CKedeX0zDR5fQP/wHQCDtTzp2yDTaZr5JEkhAAqzQqcGv2J0T1QWyRBkZmQ+qiHktML8FX6PonOB+eQjWpH29Jmm4Synms5aZryeR2khgFMXy15pKTqIML0NqbA8dF7IpOTaui491oqTN/37uILJs+oYlWUXRWXWPlVSePahiRl3cg6W7Xm3vGeMK1s8NySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4M8Xyn5Mawk/DMXQ+3RqHw1cVkBCe7o51wVYlspL74=;
 b=ad70PkG1HbketO00GR6OYsp0DlPRDnmCZBn7KuMBCuEdUe11elF4g49vC366ZR5/QnH85q8YMjYyYGdu1MNTsvQzoc/NX0ccJWCHdi3zntQEYvIv/Hi2qnWYHGQzz9gObYcNwk3gfbQLHxlZZPK8adGWlJ03liLxg7QL53DoPtPPO9p1UCdGLQXKkma8ilup166DbolurPrXR9BHBfEH7+ig/M+niktsmi62NofZDlOiAY9uhC0rpaTJXhU1z+cYucGSAG83dBzpJadU8aQmi94kXVt561h25sClHdyg9T5h44M6vNcrAPafrvHHRqovnPukUEKMzD+KUBfy0RKOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4M8Xyn5Mawk/DMXQ+3RqHw1cVkBCe7o51wVYlspL74=;
 b=OI3NOJ6xgsYOfRLc7GVIhAvYHLW3XHCCHbHCXBBVz2AUaKNrRqpSiMuXbc/ij5I/FJtRPEncMTCBvOjsZ23hTHLUYOTJXUdK/SMcUVcHfqeT6q8lsKque3MkUHjhQnfQChnq6XOnr3TVp5Kcrxu2RRdgys9r/Z0rBjWj4B36Hzk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5341.namprd12.prod.outlook.com (2603:10b6:5:39e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 17:01:05 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::d560:d21:cd59:9418]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::d560:d21:cd59:9418%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 17:01:05 +0000
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 09/12] mm: Remove the now unused mem_encrypt_active()
 function
Date: Fri, 13 Aug 2021 11:59:28 -0500
Message-Id: <83e4a62108eec470ac0b3f2510b982794d2b7989.1628873970.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628873970.git.thomas.lendacky@amd.com>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
X-ClientProxiedBy: SA9PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:806:27::30) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tlendack-t1.amd.com (165.204.77.1) by
 SA9PR13CA0145.namprd13.prod.outlook.com (2603:10b6:806:27::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Fri, 13 Aug 2021 17:01:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6fbfaa6-dda4-49a6-4d7b-08d95e7befe3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB534145796C21EBA9F8E398C0ECFA9@DM4PR12MB5341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UsRZPUIl67uI750ilxgHe6DIXAmWRO5kypnhEq2k1RUnQErZB8nyHisrmBcnURRrT/j9z3I8G1crJXkGLzEj2TNLfcztYPRwuNk2IYgR9AeYoHlUAk5BTiEapp46hCzcnA1XUmzyUoYKLiDxjIcU7Y7dr2XZmSUXcyqxJMo8GPnc2ivqdlgVuWqw0H5THWO5JDBhj2KwWbQet/Ez+PozdqRR91D+6j4SUZ83wS6rb8G1fgxnaUomxMtdEsiUcHwx04sZYubT2NJKCWG3aAGndx+v2qLBO2/4izX8FMPRYSQXx/PckI1GeVaMzw4Qv0LSUm6x4pWnS92uwSA7AcSncm17Y1Upv+j+H1rMIs0z4s0OaFatH+Hzq96V4uC3grC/1CgHiIvH3EEqEK597YdRrWXG65yjKidyd1wifEMVapTywKfdaBCFfapONptAjPqz/tK8KecWzWSgMQR3tETvIA3xf++dOB+YBJeJfNnGDV8FCVgdRqd+m8TZIWZDGMeOEW3f5/qve5A0p9rGuKo+YsT/oVgP23H3MJaZDyAqhKp9bEXcVz/M3WEy2H51+5P3I2qFWCGxYAv0Vf4HWugT9NbifeqmU8/h5NhBho59pq5bFFVK11T9FwbDLXkg99h3t3xu3nqjDfQXC9adTgnN6MQafp03FYQzjAHg2EKlaxxojNUhJ40S+WhZuiPLSpRcMdaNGpO+gt2Geodp+tOxHfQ3A/gFpM6sIBlQPmy43EQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(86362001)(8676002)(2616005)(4744005)(5660300002)(6666004)(54906003)(36756003)(38100700002)(7696005)(38350700002)(921005)(52116002)(8936002)(2906002)(478600001)(83380400001)(4326008)(186003)(6486002)(7416002)(26005)(956004)(66476007)(66556008)(316002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6ar5e+Ojeb3PldAJH8Q+kPp57d/P2Iu6+UENf89dF1v2YHuDyzkA7FgbzpW?=
 =?us-ascii?Q?HtKaHYzMqK6x78PFUdnYMXtbiLbicJF2JQrmBu58mcSifzTGPBfCnAUvdtCD?=
 =?us-ascii?Q?sO+cZ/WCSC1WK15KofMD3vTCxroYwIBX6gyTOiJjyhsZVcofr3JVdV+ZHElH?=
 =?us-ascii?Q?bmzFhjVNozfYDlWbPgaSH8D1zErZuf7Tu7lHh1rn19GjBEtEWWoGw6+vmpbN?=
 =?us-ascii?Q?mt7iFkRRrXR4zZ9MqG2LflZG1D/N7tHqkdFJOV85pyEFiOftztWLGR1b7HyQ?=
 =?us-ascii?Q?/nYLNHkgOltSd8t1umzvfA2kxaN1PbWBHYTX6hPw/hpdmHStFZBZkG46lwdv?=
 =?us-ascii?Q?JhKuu9fy72WSSR90noteT8WenrvaELFHFu6tmb7BoWsOnYxZ1aUiBM0I7scv?=
 =?us-ascii?Q?4DIpPiOXhTQfnWK6cT0RBlWCNnPqcdN6Jt+QCCRMDSb1fyQNZS24SsVYisTf?=
 =?us-ascii?Q?C1aSotjWE22U/ncrHiXZ7H6vE4WfEow1bFoQbkyXx42o7fMfelc8xi8qIg1M?=
 =?us-ascii?Q?86sK7FVDV7WjApE8NPXwyXTTJsPEK996l4sxZhqP7Vqg7I/Z7NZ9M+735E9t?=
 =?us-ascii?Q?dyp4O1G4sIyFmCrLuqLMjrlFZL1BSdv22ublL3NFYhTE1ruLNXGrTKpjsLDR?=
 =?us-ascii?Q?HB+UOzwbxV2YJXfaubN9w0lQs+K+kpMlKX6x2c3rhf8Hgl59GfpcAjzc1Lar?=
 =?us-ascii?Q?Qhe0p8VR8Ea47yG0RPmKa7TjJ2nGV0Hd3oj8nYruZN4LaQeGHDd7UdlxHDPZ?=
 =?us-ascii?Q?X56TvLOFFC/wov/i+zqFPLZ5RuqKg64ovyHGXB1M/iVyrHjch+1Avw60EYzn?=
 =?us-ascii?Q?o+Pa+efhzcueZrff1XSAcxSFaIKu6Yybvbbb9P8w0XikeuguU1waI4I/Tk05?=
 =?us-ascii?Q?+aKhkVv3zGrpwk6bOo1yNKTtwhM4oa8fGXS3oJ3/2kJKo7bIm54BNv9+mpQU?=
 =?us-ascii?Q?Lj1amIKxoCrx8nV+dFS+FcDSTbm9A8NSDrOaugMOOU6NE5vQLuF4wHPjN14d?=
 =?us-ascii?Q?7NV2MnVgdm3/qKylDsvQfHm4EBa+UqVRvPCJUShE8N9aCF+ssswRub6aMLcc?=
 =?us-ascii?Q?fCTFNfHJr2CyCG9eA57yQYr7MgaWz1qY8Z6THhh44Fj37rT7bsPbKXXD/hxN?=
 =?us-ascii?Q?IWuTU9lPYS7jynYAyJ8Nf8+0SCaiQmnh85fxd/arJfhQxP79X5Df1wVCI0LT?=
 =?us-ascii?Q?at/Wc3qfE+UGxUd9Ss7xOz5pOOL+JQ9fgSyqnt8RO6KTXO05cuI7GAw3UmTd?=
 =?us-ascii?Q?YnZjp7ZkrrrvRdDtRqilLZxsLDGkz670Z7hBrb0Qn2rWrYv9RgA4b6zmaj22?=
 =?us-ascii?Q?qPMshIMOJqpEEfODG32Zi6Qn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fbfaa6-dda4-49a6-4d7b-08d95e7befe3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 17:01:05.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNNo5l1Xy/99nFOfZ7LPRQ2GEYF/10iEoMuYmMWPDKhWsythOAaJWMFV7nInBuTIOfKdoEtdeQ9ttdZGyhncMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5341
Cc: Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Joerg Roedel <jroedel@suse.de>, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>
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

The mem_encrypt_active() function has been replaced by prot_guest_has(),
so remove the implementation.

Reviewed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 include/linux/mem_encrypt.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
index 5c4a18a91f89..ae4526389261 100644
--- a/include/linux/mem_encrypt.h
+++ b/include/linux/mem_encrypt.h
@@ -16,10 +16,6 @@
 
 #include <asm/mem_encrypt.h>
 
-#else	/* !CONFIG_ARCH_HAS_MEM_ENCRYPT */
-
-static inline bool mem_encrypt_active(void) { return false; }
-
 #endif	/* CONFIG_ARCH_HAS_MEM_ENCRYPT */
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
