Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B740F647
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 12:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B3D415FB;
	Fri, 17 Sep 2021 10:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_lfrYnsxL_6; Fri, 17 Sep 2021 10:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 05B7D41647;
	Fri, 17 Sep 2021 10:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0DE7C001E;
	Fri, 17 Sep 2021 10:52:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2B68C000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E8860744
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfDj-1m3mYGa for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 10:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD59D606C9
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631875920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m0yUEYOIwtXoQEw1AT8DnQj0nd8vXqc0yecdszzCso=;
 b=RveUeuFCmFxZkEIsYQTozU4cw346awhcsru+ndCftPIYv33g4LzEbvkS4TJL6aSYSbTKpy
 lEhPG/r2c6yD+x+BMUTp/Lih/EQuiCQiEr8B2HVAAY1EiiJRgCOrgSd3EdN3HF39XEeyKz
 VYlO1rPxN1HT8HQf8fz0j7l13i4KSUI=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-P8aNfK2EPouioQHcyxwjtQ-1; Fri, 17 Sep 2021 12:50:44 +0200
X-MC-Unique: P8aNfK2EPouioQHcyxwjtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1tlc4SNiDViK5kqmMb1qtbfmRiQGG/VxWMn1zrAe5ppX7usWcjm2xeW0VwrHsQtTrs3nY9GSTaev4NR7/Jgu1AO9NPqu2XwOmL1KEXRjNO7qh5KOeBUm12ihfMJE7tN1zuCMzn/BHepXG7cAGz6uL4FHrYRv2agrCSXP6INazxjklfOtp/Piu18H913bDv4kHiKsRsMNl1eroePs4bwiMQPCDp6Qwbi4NzgARNgYEzq2caujnZgKtVvnlksnqevKiiOt5K+PpCkpQQmIDCPvAK9qL3AL2l3tpMN+rTZjAyDAcmR2oNtCOqxmmidjgdf1HYXzvGlFLyyvBZHViwDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9m0yUEYOIwtXoQEw1AT8DnQj0nd8vXqc0yecdszzCso=;
 b=lIZLqxXq61JykHKxx4DkqsySe4RfHQEVjwaktnQnXvfytG0WQ7rLRqSbA78mWjR7XgcylHnMgMvA7eMNT1l6lev7GU5J6N5R7flqrQDa27UbOtkj+vSGUatOKVMoA0fA38BnptJfZvTybbPgugwcc8CmMIXPh2fPJd22P6LhiZ1Yuj1DYgBKqT1iMIhfd9ROP44gH4cE9xYMbAYCMUdWmNU3dg3oFy4Q4bx481bm/2nodw5bTxxWnO7+pdrff3USFquPlOz+rDHdzmzTHiHgrc91tVaE2G7968BlevzLbDonae8Os1k4pAB1oC/za/mdlKvnwSZMTs2jVifztHM0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 10:50:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 10:50:41 +0000
Subject: [PATCH v2 4/4] swiotlb-xen: this is PV-only on x86
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com>
Message-ID: <5947b8ae-fdc7-225c-4838-84712265fc1e@suse.com>
Date: Fri, 17 Sep 2021 12:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AM8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 10:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3666c03f-0fcd-42f9-0b1c-08d979c8fdea
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5600A6886B6CF4AB6A86FCC5B3DD9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUvxXgay/gSI7NGlMWXcXdc4negUrzmJaVrSy9BcskwMNgUqRDBesK1uOcsBCdwFY7UYnnROSbdZyxR1D0Q9AC4HYGz+BQPeyaJGehZJpAbsfolYwC/l47cyOV8eH8czaU/eTkN5WH+yItVDkbpRVxdB8eoDcZOjbkyABHbDTP5DLaKA94iKFJvpUwzuiTRMQGmLii2HWgpcdpRuNSqMe55FHLQqfZfxbTKqIu677toceZbhz9UxuVil8gF3F5zJe7Mwsijzu1SZzqO1oU6ZnWoUZRiuUGu2si8ObeQ8A0eExH0l2eFYgtSs7EJ7NYEFnEOz5qgNNEP0CcUpQi1GURZgeAr3a5zvdY6dft9QORZAQfdQvfe+agjPi2PHDUff/40BUGnVyZMxowL1/Fe6wSWXewVtjrykoqnx9vssgd4u5L4Jbtw1zn/lXHX8A0Koe/51ETm4/r6RmeTUCtgpW7AqOe1Rl3XCQoCdmr48RB+FFrWN6R5oV0UeZoLnZ97wmlss+Lr3fkDDFdqDf3iTX8FSCsBllsiEmPYJka+IOSYq3y9fQ7xf3ZaNZmSvoHMoLfkSXO3KderUtjx5Uh513I2/fRwuKUYmGOZmC07862xtkD0Ru/DeDqfCjGG4ftUWeV/IuVs78N842FbIjuqwb/EvR8hQW62y/R0c2Exk5ybR32kB5M7fy0vVe9dcrkNn3ZDKi5sWBcBqZoB2wirGBXYdfEHsfp8bfuByjyvv8tE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(31696002)(7416002)(66946007)(508600001)(66476007)(66556008)(86362001)(31686004)(4326008)(186003)(26005)(38100700002)(956004)(83380400001)(36756003)(2616005)(2906002)(316002)(16576012)(8676002)(110136005)(54906003)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhEZHdvMDF1b251WnpZOTJJMkFXRzk2YVo2M2E2RC9wWjZtdlQyckRrNzFt?=
 =?utf-8?B?ODFDZmhMSmZhQ3M0NUwxNUZRcW1LdytIT0l3cnA4VFNyaGxDbE40Uld5L1Ax?=
 =?utf-8?B?ay84QU1xYjhFWDEzTGFqcXVLdmhaL2hkK0F5SThoWXlSWnFuTWkwQjA1dlNy?=
 =?utf-8?B?NVc3eUNQUlVSeXhFbjFEWkk2aDVTNlVsUzRFeW16ZmErMWR5MzFaZDgvdkM3?=
 =?utf-8?B?VEQ1QjQ5L3dwTDhLdEdNaDR3Wm5LV2JIVzZFbnpRaCtha0Z1TlVib2RXVE9Q?=
 =?utf-8?B?Q3d3SkNqa1I2cEljYlFIa1dkMWpqTENFc2d3VEEzTEgrWFNUSXUwcFJ6U210?=
 =?utf-8?B?eitjcVFlaGRtZFo2WVNWUnEzeUQ1WlIvQ2h6eWh2UkpUdG8wZXF2Z3daWWNT?=
 =?utf-8?B?bUFSWlVaYjYvdlc1NktjaUM5YkZxUTZCU1U0Q1QwTlZIUHNMZUpZeW5SVUdK?=
 =?utf-8?B?RHk0dUNhYUxSbGFWTGZrOHVoQTJlcS9TWW4rd0E2S2tRMmdIZGRsempiMkNi?=
 =?utf-8?B?cGkzOHFQZSs3TlRlTEVwMStSOXhWS1FjcFMyMFR3UHZJSkxpeU1JbDRyd0dy?=
 =?utf-8?B?WllhZjkzTEpVZ043bmQyMGNsTGJyNU9TR2poajcwclYyUTNSRnc1aUw5QUk1?=
 =?utf-8?B?Y3diNTJsRmJwV3JaZ0hRajdYay9hMGU5VnVWTVNQZ0pVSkM5L3RMaXdKMU5F?=
 =?utf-8?B?Q3cyTk96QVpQWnhVZURyRDVYWjJoWlRsU3k5YXdwa2U5Uzhxb1MreWFYbTR3?=
 =?utf-8?B?OFZ5NnRsNW0rRUdISjZScUZoaFJYZGs2eXNqcDBtODJrSnh1Y2kwVFNSRlRF?=
 =?utf-8?B?WG9hT2JzdlVBQ2lEOUhxbytBbW9mTXJXdVVmallDb0FCOWJRclY5aWNpS2Qv?=
 =?utf-8?B?QTF4VTdxQzNDSFE5bldsY2tubGw0MDc5Y3ZwUjBUUXdoRG5oTm54cE03RHJv?=
 =?utf-8?B?cHNkUjFtM0ZNbDlndmZ2OGpYeVhRSU84a1lmS0dJb2lJZDFVbnBab2Raayto?=
 =?utf-8?B?QURacUt2SDZ2QmJSZU9KMUJSZWYrTXVkck9CeFIySzlHNm1wU1Z5Yk1TUnRS?=
 =?utf-8?B?TlBJTEExOGtScWJneHdpMndZZzJkMWI1NEVERjN4WGxmQ1VlUno4K3daN1NR?=
 =?utf-8?B?bklPYjBPb3dKNmc1cUhoaDVHN2luZ29qdUNNa1pwUk0yM2tLWWcyK2ZCWWp1?=
 =?utf-8?B?djZPVEEwN2NsaGhVNGpCTzN1c3hZTUtQOUEwWGluUXlFRjBIUFcvVjYzSlhW?=
 =?utf-8?B?MXBjSlgwd0pETjQzTkVaT2x5OUJic0NoZHc4dFVNbk5IUUYyaVZ6YzlFL21T?=
 =?utf-8?B?bEoySkFINERlNGNSSnIvZnJmRWVTYUNxSzlqTlBzWm81cXdnL1NxeWErNkxH?=
 =?utf-8?B?R3g4R2lQU1NWSUZibmp1SjR3RjlKSmQySkxSUnp3dlV0VG1VOWx4SmZ5Q01J?=
 =?utf-8?B?THpnQ0dYem1CTzJUczhhdU04VTdMdUJ1T3c1dTVvOHo0SmxWTEE5Ni9acnFT?=
 =?utf-8?B?UEFvV084c3FoYWYwYU5ldUlkWTBJdXdwTG9jNjd1dHpLblVYNkFGbUNWeVF6?=
 =?utf-8?B?a2M5L1dTUUo1Y2Rta1V1TC92OGRiWlAzSEVMc0FnUkkrK0tnRDl3aHZDTE96?=
 =?utf-8?B?RFE4YWdicmZUREdYVm41bmZFdVpzWExPajFBMUl1N0orL0dnUjF1Si9sbDg3?=
 =?utf-8?B?VzErTzVOWUJRaytIZ2Q3cW1zVmh2TWc1Sll4ZmxTRnV1RW41eHVpZk9ZM01L?=
 =?utf-8?Q?559Wla61/o03FiuOirM2RehDXGFXy/dFb3P91Vz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3666c03f-0fcd-42f9-0b1c-08d979c8fdea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 10:50:41.0719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZ2RrmKjN84ov5BMOyBpAoEtGhqGW9BbnmFL3zdwmvG+tZ12+ibQYAmMbwB4z1f6V9bNY78pHT/TMDdkloOt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, "hch@lst.de" <hch@lst.de>
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

The code is unreachable for HVM or PVH, and it also makes little sense
in auto-translated environments. On Arm, with
xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
time seeing what good the Xen specific variant does - the generic one
ought to be fine for all purposes there. Still Arm code explicitly
references symbols here, so the code will continue to be included there.

Instead of making PCI_XEN's "select" conditional, simply drop it -
SWIOTLB_XEN will be available unconditionally in the PV case anyway, and
is - as explained above - dead code in non-PV environments.

This in turn allows dropping the stubs for
xen_{create,destroy}_contiguous_region(), the former of which was broken
anyway - it failed to set the DMA handle output.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2605,7 +2605,6 @@ config PCI_OLPC
 config PCI_XEN
 	def_bool y
 	depends on PCI && XEN
-	select SWIOTLB_XEN
 
 config MMCONF_FAM10H
 	def_bool y
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -177,6 +177,7 @@ config XEN_GRANT_DMA_ALLOC
 
 config SWIOTLB_XEN
 	def_bool y
+	depends on XEN_PV || ARM || ARM64
 	select DMA_OPS
 	select SWIOTLB
 
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -46,19 +46,7 @@ extern unsigned long *xen_contiguous_bit
 int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				unsigned int address_bits,
 				dma_addr_t *dma_handle);
-
 void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
-#else
-static inline int xen_create_contiguous_region(phys_addr_t pstart,
-					       unsigned int order,
-					       unsigned int address_bits,
-					       dma_addr_t *dma_handle)
-{
-	return 0;
-}
-
-static inline void xen_destroy_contiguous_region(phys_addr_t pstart,
-						 unsigned int order) { }
 #endif
 
 #if defined(CONFIG_XEN_PV)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
