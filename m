Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C773440F61F
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 12:46:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D57F402B1;
	Fri, 17 Sep 2021 10:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swR8dDewDJve; Fri, 17 Sep 2021 10:46:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0352A4021C;
	Fri, 17 Sep 2021 10:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF32EC001E;
	Fri, 17 Sep 2021 10:45:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83B8DC000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E98E84041
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FaIUqWOgD1e for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 10:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FF1A84034
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631875555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xygT969cDBZ/j2pA5jAQZPS3mU7sdWk4emBIUX/9lVE=;
 b=W9TAmaYNRJX6PYHTNKiCWHjq0BNDf8SV3TKCRCC5PYoinxmk2e3IUZOgaRRU0k8dRZ1fYI
 Wy7d/uPBxu1US9dBO9scyjvHwVAnpMifEq/xnqM6itJwwWyeg1ohLQE/nz6LlIzPDnwfiz
 J3EjnL50pBwNKnhHqPlwvPWmjVGqjAE=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-GrDtbzgpNkWMdQW2zCUVqg-1; Fri, 17 Sep 2021 12:45:54 +0200
X-MC-Unique: GrDtbzgpNkWMdQW2zCUVqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QipcfJjC3Xsc6Dmx/BuF/G9EHVfVtUX1uqsYY8SDfToaGCDxpA+2TmZPbBhITA6nHnVHJ0l21rS0x8aBxdOBbnjkNDRDsxNVKNhxx7J4zNT13fY2A+/4sdTb3NycPl77+nW6vC+EVBDYQEvZ6f154TyZnr2zizkCOrlwjId6oA/pUeLqRFBsLFdU57DAf1dDOrcKaBhOXkJskTDB+LuCONqvq0EYecKduk3pn/1cvOHdL/LS7R+DDLgYhWpSz55dj8V0LWCMJT8wLcp08N9IggF14TtNqbb56mVz+ufn/PmBc9d7THdv+K4CLzmiLZ2nyEtTA37RmfQWHvyuQrpT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xygT969cDBZ/j2pA5jAQZPS3mU7sdWk4emBIUX/9lVE=;
 b=H1GMQi1hiWB9rb6AhRrlSKlWcuoeaNGgzGBuZYAqHnGuSrUz5GLZlU+kIdLT5t54O1a9LRYRAoFF2prEy2yqmnWhmnh7cB9NSTPzdmrzQqSviyFyMMYcF35DJVslYFfyIOZzMUQwZBClVljmx6qObMnesHdp9Nxaofp4bL9/ZJBNe7GFoRHSh7pthHFls6Rah1ZyPfnExcnfp2WIv5taFJlwnjhxWZ7RwYP8CR8BzflpJ8PFb2KiBFscCPFuqg+XVWnskRIKoJeAeuC1L5lqHmx3bOqjhyXtVSs6ZWLNx78yXohowi0mJNnKS4mrQODRX2X2j7roI8HMjE46Opbx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 17 Sep
 2021 10:45:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 10:45:52 +0000
Subject: [PATCH v2 1/4] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com>
Message-ID: <7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com>
Date: Fri, 17 Sep 2021 12:45:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com>
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0085.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0085.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 10:45:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a8b658-b3cb-4ac7-1729-08d979c8519b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7038133B5FD6F34E9FEB12C8B3DD9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJvfl4TOCMxZk5Hkw6X1UGtuuJekKSpg5sbARmQDJzbR4PwzObuEuRLB4ElgjWxJ4DozlfkadWHD37Y3J/e9Fy86fiIg0OS/iWfK2TcROwvraU1+z69n8vFDvx9yzQ3DYLlwnF9Q5eIr0tMWUJ8Njc0xR+mXmdbdhauFYRziA9WjaY+LuldbvUY6HrMJX0Nb0ZBYtwLv3XtX34tBqlZk6YjVTjlgR5boCKsL06fnI0MKVnNdsV4RuV6B5dmqlHC7RoUo/9gSFu6+VuNgPweWUYooq8ABV53bwlXHVK4mBG6ghApj17HTUihckeXoOTwQZDrPgKE26eAikPz8/T+iCmCQ9NMGzU0OAdGRZBa7/9VoqowHDX7gEHT8TlSiu5JphBiuMeT1f8Uvc0841/9OVTLPWlMOwXhSlab7mdkMFk6S/29MvxEKSCJcNcuMECJLNJb93r44NzT7hf3sfBGLqAGMPZ2VpT7d13Rsc7BSpkZh47TtnLqyqejmZKtbKtCLGSZjqmN557F4nM24XgB6BKdZp6tSfhxL4fMKm/C15vYCTu75zp3gZcB3H6dOWT76KaIQ1R4lhlvlv6m4ZCoPAsbcu0yjVOV2OWYRN3UIATu2NHcDddDyz3zvHd5Tzcr41ZdZwEIKbbLRVNWjmJEFIZ3OFMC2AGFbpwBgKPRYiDl7bMq9WzZjFiS0LIv5Z59YeXX0NL9F2vBAkUVLHcYLwY20uDlEHR6JCBLUfdReuFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(26005)(38100700002)(83380400001)(8676002)(36756003)(2616005)(66476007)(66556008)(6486002)(8936002)(2906002)(86362001)(186003)(31686004)(66946007)(956004)(5660300002)(316002)(4326008)(54906003)(110136005)(478600001)(31696002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzh0eE1QbWhKemFEN1F3N0V0anEwT0Q0TTNSb1BLZlRjOVA2cEtjQ1gwRVJT?=
 =?utf-8?B?eTVEQitvRzlKOUlXd2Q1MTVQK2tRSzQxZnVJZm1qOXFyNmlQVENrSVVTWW0v?=
 =?utf-8?B?Y2NRb1o0V29vY2c0elJlVGE4NjNFQ0ZnQkVpQlRVb2dScHJ5Sm11dlBBalQ5?=
 =?utf-8?B?L0ZsaDV1YWpDMG9kTnl4RUFJS2tsTldtUlo3TFNZSW10d013Y3JtZzdzTGRs?=
 =?utf-8?B?OVZBYzJvZCtadmlYMFF3VGphNUtZZXdhck5vNWE5RzZxOWtjaXNONTRqT3JE?=
 =?utf-8?B?eFNsUi9aMkFGN2dyRFFJTHpkRGR3MWdWeENtYlBUcUs4SDJubXdTSjRQWHF3?=
 =?utf-8?B?bkl5VWRpTW1nUXFnSmhubDkzYWpyMktTNzZ6R2JWTkk3aGlBbE5oNE45Z09R?=
 =?utf-8?B?c3JkbzZNRS9kYkIzU0JNbTFZYzV1aGNDaFp6MjdxdDJ4RkVmRHgxOGc4SWJy?=
 =?utf-8?B?TTdSL0VBYzVwVVM3THBBd05zeGYzbFF4TnpNSnpQSENNeUJwUmY3WkZaVWJm?=
 =?utf-8?B?eGoxSnMvejZTRUtmaWVuQkNPS3VWck5objdwUC81d0JWSGVDVnh6NWJCK2Jr?=
 =?utf-8?B?ZUZudTEreTlpVTVEdExCSUNtU0pmWTJvN1lwejlNdzBXeS9WVFQ1ajN4N2tn?=
 =?utf-8?B?a25zM0hvRXBnZ0xXN09mbGg2VWM0T3hQc1c2VERyNHl1cW1uMVZYRDZ0Mi8v?=
 =?utf-8?B?SytzT3p1VHlCTGNpWEd2eElZcUlBaVg0NTY2ZkJhZ0dBNUtlSzk4TU13SWVu?=
 =?utf-8?B?NGdLNkI0WEIxbjcyNEpoRUlmdnkvVmpnN25TUDdHVkpMUVUyeGUrN2I1eUFx?=
 =?utf-8?B?UEFIeGlEZWliZjE2RWpDc292SVdjR0tOTXU0Z1preDdiOTU1eWpaT3Q4Qkd6?=
 =?utf-8?B?RXB4VitOUVJMNHBEVHVvU1dNdU5RRkxocTlzSVRQaHJuSzZ5bmI1LzF1U0xj?=
 =?utf-8?B?MTZIUUNTRDU2TzY3Z1M3QmZwcnhGaTFsNjBEUm91ekRmbVpYd3pScGw4bFYw?=
 =?utf-8?B?dy9yVklFejV4cFplb2lXSkd4aUpQNVplYTR1NHVyZkdxeWNTK0d2bHZuYTlV?=
 =?utf-8?B?TmcxMG5rTzJxSThzU2xWTzRRUzhteVlJSld1RWllcjBOWENrMVBubmhxcVVB?=
 =?utf-8?B?Zy9PMG1Uc1VtZVViUHRBQU9GV1FGK003QlZPVnhkTTQ0aG1qRVVORkdJb21X?=
 =?utf-8?B?UVRGTEIzOWFMNENUZ0FVaEFBc3lPV2N1bnBzY3Z5eVR1THV4NVBFcVV0ZE5M?=
 =?utf-8?B?dzY3MFQ3R25WVlV5K1A4QTRBWTBRMk5ZcE1hRng4R2dMUFZBMDBSdE9RRjBu?=
 =?utf-8?B?VWZxMWtSaG9pU3Z2OVhDV3ZGWjMzTXNzakVQVElJb1lEa3hHK0Q5aWxBRjNo?=
 =?utf-8?B?SkdNNzh5R3hlQ3pqeHBIRlgrWVkvOWl6cnNSdWhWSGhUT2w4SmE5amlzNERv?=
 =?utf-8?B?d2F3K1p0dFVOYk9hbDFGbTlPSSs1YVV6b3lrT242cm5XK3ptVERMeDR3djFD?=
 =?utf-8?B?aWoybDRNR0FtM1lJZ2xGK2NOZmVMZHRieGVIbDcrYUNBVE1zQnVKYjFheDla?=
 =?utf-8?B?Ykp6ckhXZnpOMUlmcWVuOWtLVWVGVjZIM0JzMTVYeGxxWXUxNVp2Qmhmajlm?=
 =?utf-8?B?eUNCamdqSWd2WUhJeVl5ZkpJQUtRaERtdnhHeWFPUFJyeW02MXo1YnpkV0xZ?=
 =?utf-8?B?SThhSlhCQTBpdHprZTJFbGUrK3FiS1ZoNFBiUUdySjU4RTZnNHZnZERqck5M?=
 =?utf-8?Q?9BNYdZqpM/QexeFOt3WvwlNcoxKVn3MxN/rO72D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a8b658-b3cb-4ac7-1729-08d979c8519b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 10:45:51.9854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg4diNqLAQ1fx64FdDFPcPfx1T/o/UzWchvG1YWd1pA9kTjucQnGvrZeUel1lzk+QfIzb/1NrKAowws/Hhq85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, lkml <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "hch@lst.de" <hch@lst.de>
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
From: Jan Beulich via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

While the hypervisor hasn't been enforcing this, we would still better
avoid issuing requests with GFNs not aligned to the requested order.
Instead of altering the value also in the call to panic(), drop it
there for being static and hence easy to determine without being part
of the panic message.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I question how useful it is to wrap "bytes" in PAGE_ALIGN(), when it is
a multiple of a segment's size anyway (or at least was supposed to be,
prior to "swiotlb-xen: maintain slab count properly"). But that's
perhaps yet another separate patch.
---
v2: Drop logging of alignment. Wrap lines.

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -230,10 +230,11 @@ retry:
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	start = memblock_alloc(PAGE_ALIGN(bytes),
+			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	if (!start)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+		panic("%s: Failed to allocate %lu bytes\n",
+		      __func__, PAGE_ALIGN(bytes));
 
 	/*
 	 * And replace that memory with pages under 4GB.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
