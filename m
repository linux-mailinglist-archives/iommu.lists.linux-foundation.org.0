Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDC4E66C5
	for <lists.iommu@lfdr.de>; Thu, 24 Mar 2022 17:15:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D799C418F6;
	Thu, 24 Mar 2022 16:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLcotBg6aFis; Thu, 24 Mar 2022 16:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C97E041688;
	Thu, 24 Mar 2022 16:15:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D61CC000B;
	Thu, 24 Mar 2022 16:15:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6C88C000B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A37208410B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiszVQBiNlvG for <iommu@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 16:15:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD2AA83EA4
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ney3aY/UN0eylN6mWGRvuU04JErNjYHSzcy194FXoMA/rD6aE/7QBO5zyzjnO352YLMfu0hzpF6nJf2yQiZLux/MuQvAx3XbYdVKX4Dsv1Q/M8578ewvplDFFlzQwpJOGXczjeM2q6+YtZE5kRGubdChv//yJHsMbsZnbVOVfaNkjHjPTQJ8WrNk9BHWkQo9F7xWYFeGT0MX4QbLTKTWSKDWa8XP95RA5aQH6uME27oCSdH60r7lXTfgvjHS8wWjkTaCHk+5Xlz3tNOxEcIh7/xoU0DMaHQ4TTe/5VQSRPGnl3NnsVBCJ5vXcqo7PjgmIl8dmlYfIa28SfTEyCqPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itBxWx6tDcrya8iixhcLhuxoHC5tL999NwyEf1OxrJ0=;
 b=ER//+5kIMbTHIFYGeMapidtv8W3gLcsqRMxVupUIGU5ekvJN15QJ/jbDUFG2eOBMUPN6TDvsnnlyzjAUAO55uiLjfFKlySTyid/NllC6+MBkKXY5ck7xhe5rEDIRm04BgP0fMEaDScQLbgBP8sat1+GB4R3zMe7DC/FWQ+get5p3Tt0kxBzbu/4Qct91XzxejLHnQjLsSh0J9OmadjMwFDiz5woxgCWSIewkuJE+TuQ3NgMvJ3rfn6vMs79TDqCZzqxGqhxa7EwYhB/g/uagsXa7ISXJ3RoUaNtYUmCdUZrrEB9VX7PTa1PucI5o8xOQJ5t/41iUBxJtbQ8C8/Hqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itBxWx6tDcrya8iixhcLhuxoHC5tL999NwyEf1OxrJ0=;
 b=dqgaET7bdvh1IoBlm09EelBnYGm4UMhpY+vFT5m1Bj/ytoZWxZvSw4K6rrR7IJkh5nZlrNNlraWyykx+1PcIf0+aRWOkFuwRqESFqQeyCUEhdZVviCXByd5LOxzGcFMr9Ph0V2l2CdsuXp5/cveenBt98ZA7eNNamuzhMDIHqKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1514.namprd21.prod.outlook.com (2603:10b6:5:22d::11)
 by BY5PR21MB1411.namprd21.prod.outlook.com (2603:10b6:a03:238::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.10; Thu, 24 Mar
 2022 16:15:09 +0000
Received: from DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::f8aa:99ff:9265:bb6b]) by DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::f8aa:99ff:9265:bb6b%4]) with mapi id 15.20.5123.010; Thu, 24 Mar 2022
 16:15:09 +0000
To: sthemmin@microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, rafael@kernel.org,
 lenb@kernel.org, lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [PATCH v3 0/2] Fix coherence for VMbus and PCI pass-thru devices in
 Hyper-V VM
Date: Thu, 24 Mar 2022 09:14:50 -0700
Message-Id: <1648138492-2191-1-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To DM6PR21MB1514.namprd21.prod.outlook.com
 (2603:10b6:5:22d::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5654b487-5a85-4c95-70e4-08da0db1774f
X-MS-TrafficTypeDiagnostic: BY5PR21MB1411:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <BY5PR21MB1411F06DFFB871E32EADFF23D7199@BY5PR21MB1411.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8J7Ds/8naHFTJhwSwQuL0tPIxZZWTeb7nK36k2ZG/sRW0WRB+LbPoYORswWBEWSNDlxEAicp8JgF+WwABfgcEgpvP/CMUDQ31+ikZKlfYyFg2gQmPhgNchNIvnPO4FxBLaFZmYWt0jKoHZO8LB8ZLxIIe46AZD6g4wWh9RZTtfi2E/VhppgGMz4qLCmzMWYDt02WHTourBq1QhYy4lic+ai98Cgq+ccC1sCkgXSnRGZ9BpEfQ52dsoIeRU0Gny2A2S6/uvRHdp+2n5sWnWGmGYhLuJoyMgPutnv17AzCib0TTTeFadFjvz5TZz1VFSnfMFocUuupvbcYiz02GiGmXp0efOth/oNJZJWSAxIv5TjYCTRE1MwdkoeRDZePl7xvVNClp6FLuK5WQW8wlxtFC8ilqtxRXZ2pp78/rZFkw//Bhe+hn3mA/kPneLqeQ7jlhe11e+XIWV9Dd8j498pou4JkAugExc3xcWfTORkERHio6nPBCp4+Xd/NKmOPq0GzIcJh8f8MpJu6YriUdLXA9wbKqDlLJyNx3DbTvxdAajk4M/wph+zcrPXnyLUosi7Rj1qb2z7uxn15f3EyOUKRY5/xPWely3V4Ob0qUp9bECDPMgTybxcqZejFotlcPBU6CshSrqlOBsHqTF1wUQAQs9L7B5DJOa4suKhvihopkeiZ9pVmA7HK6lAKbC5wFgciqGOdDV7NmEvCUoZPFh0A9ZfPhE7vmD+ALxgxeQ+eq51tufMdC9tGHQJo+0DaRCirnDBCzV4mKsczN2x/RiSbkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1514.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(2906002)(6666004)(6506007)(52116002)(2616005)(6512007)(26005)(107886003)(186003)(8676002)(4326008)(10290500003)(6486002)(508600001)(66476007)(66556008)(86362001)(316002)(66946007)(36756003)(921005)(82950400001)(8936002)(7416002)(82960400001)(5660300002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ElI+3o71OGQWNDIkFokiE1FrS/MFxK1IQ2aVjb52VCf0A7Xmr90ENUC3dO4c?=
 =?us-ascii?Q?3fE2NcfMmLPJPnM49KgNPjvQbXDqV70By7iVHfpiywdmNdW40qlQbkvietqT?=
 =?us-ascii?Q?b97mVbCXWMLZJXK0EXm/4GFcQahoOw+g5qlgM+ML7RRroD5Q3ooHZYTqwftN?=
 =?us-ascii?Q?tCFeWZeyEHuowJ1fCReS/c60krG5LplFYf26Th4qhg6GY55Hv3elEnEZCEeX?=
 =?us-ascii?Q?2Uc6SEIgAbbxuQVYzVSnzkFYiaiZq8V3PosT2FQotn5Z7oaGxYF2jDJvF1Yh?=
 =?us-ascii?Q?3cU+9OPS4r8Ala7rhWzzB9yl0+xX6DVrj8E0Z9NwH90geIdgNKF5zqkKKWAf?=
 =?us-ascii?Q?/UTkMRyWdFPKM68o3pe1xxF+xbqDSKD9JtYDPI1C0U4tn8PuUQ8ir00X5C7e?=
 =?us-ascii?Q?NpLoge6mP24llGobgbljb/ZahV3CbbdS5qitjZj1SJTXEF1IugqTWJBH5hur?=
 =?us-ascii?Q?guJJBEbMKIhGpg9GDL26R08rmMDVbbinaQJW7YlIU06AR0ZviCRnJV0T8Guy?=
 =?us-ascii?Q?xQr82SDSl0tRPZD/V2CJ641rIsrzivk/RvdajfYzwlP8vrIDpHWoWJ1P4u1V?=
 =?us-ascii?Q?mpWAArIgRYwhU0/Ue/Uy3WGIktp25H3n6282EXCBNAI8gqmaw7+CexPCnE8b?=
 =?us-ascii?Q?k2oT9MtCsaEOL9zQAajR5F//AVpcz7dnfRj0qzUJYUrblbfvO97T6KXn5Br8?=
 =?us-ascii?Q?oaQ2LsOmmgTpICQ98I5R8k0EUOX0ZFSzV2rEp05dtmLVgh81bO0nRCe0wXem?=
 =?us-ascii?Q?I2NEr7OPyZw0GSn3xT+2hKmGC/T/B6HU17bqkK6+5g89/KlMTzczyG2RI7Rs?=
 =?us-ascii?Q?6iQAcyjiliijZL6j8NpSQL20W2hk6j7/U/0YNCyk11FnsEPikKMS62XSXefF?=
 =?us-ascii?Q?YC232opKD34JILSomZjqBICpz/FoY1j9n3ygBHsmVZIa3DqSWMFeDbk1Hsj+?=
 =?us-ascii?Q?BpYnkzNp1WFG9bX5z78/U6D1sab47N9UhSykjD+5yCnSOGpyEUn/edrTO4ev?=
 =?us-ascii?Q?7o9RwDDeSnZgf7+/IUyvjkxjDIVYXSPcc06zhqc9BA5ZqWbm/8eHADY1OdGG?=
 =?us-ascii?Q?W1Is2FPjFnDEn3a2Y7V1hQ9dbJPt4z+7QjxD0WLhRM4ShLbA+0HLGCFbcfw8?=
 =?us-ascii?Q?IsOX7RYLkoTc4E86ZkkiU27t3h3WjXDEh0LXo4PpEFHOMYPEJ0hl4wInlsk1?=
 =?us-ascii?Q?2uS72f7pm52fngZ2h1i/caqZHttMOHq35VhpI9ZHP+tSjaBpCN3gCYaxkF4u?=
 =?us-ascii?Q?+7T35oBsuA4kn3xjsGsxFIDLK+VbSNJFsd5aJnu7HrXgsTDNsntF3FIQhku7?=
 =?us-ascii?Q?74FYYWxXDvRgUQvXlyhqNizYgZDutXIZiKKIPIjiUKMAecP4OPj8VbTyKTUU?=
 =?us-ascii?Q?9kJiPhBLq0WVcxqoCXCoO2AWn5YsFLCbIsWQ/IxUifRlEy+5sXmxgu1sk6lo?=
 =?us-ascii?Q?6rjMQyZ7PhnXpXKMoerEpot/B7dS21J04RFVqhTGGXbO7G9fZVox+6uJdfGs?=
 =?us-ascii?Q?Dr2SeJjrdWns7K9f2yxtjZBQfNt6S2B7SfeaSHynqx+olIWACV3XY3/mkP1x?=
 =?us-ascii?Q?cjD36Az+EKnNN2uu3C6kiRi4EXAPHAWjejzO7g79RNpg7XJsRl2O0lNwBSQk?=
 =?us-ascii?Q?y+iSHcc3KnqECX+EsbjgEwIz17q+A2xZrIvHMIqUmevcXmGwj+oSqlnAuIIf?=
 =?us-ascii?Q?LI1DFkJIiLyK1nFYz4rsT+0BwTf5lo7urd90x87j7lEj0bFZpNKOkjinI19E?=
 =?us-ascii?Q?NbI6oJi1rRCFjOkvP1hgJiA19miVcvk=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5654b487-5a85-4c95-70e4-08da0db1774f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1514.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 16:15:08.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSwKy6zSEoJtWRTKa3joc9u33G78/3VjVLIzhLZlEU1J3TYXefbw/jpQybCnuIObKXpvRigsqITinjB8ox8iwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR21MB1411
Cc: mikelley@microsoft.com
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
From: Michael Kelley via iommu <iommu@lists.linux-foundation.org>
Reply-To: Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hyper-V VMs have VMbus synthetic devices and PCI pass-thru devices that are added
dynamically via the VMbus protocol and are not represented in the ACPI DSDT. Only
the top level VMbus node exists in the DSDT. As such, on ARM64 these devices don't
pick up coherence information and default to not hardware coherent.  This results
in extra software coherence management overhead since the synthetic devices are
always hardware coherent. PCI pass-thru devices are also hardware coherent in all
current usage scenarios.

Fix this by propagating coherence information from the top level VMbus node in
the DSDT to all VMbus synthetic devices and PCI pass-thru devices. While smaller
granularity of control would be better, basing on the VMbus node in the DSDT
gives as escape path if a future scenario arises with devices that are not
hardware coherent.

Changes since v2:
* Move coherence propagation for VMbus synthetic devices to a separate
  .dma_configure function instead of the .probe fucntion [Robin Murphy]

Changes since v1:
* Use device_get_dma_attr() instead of acpi_get_dma_attr(), eliminating the
  need to export acpi_get_dma_attr() [Robin Murphy]
* Use arch_setup_dma_ops() to set device coherence [Robin Murphy]
* Move handling of missing _CCA to vmbus_acpi_add() so it is only done once
* Rework handling of PCI devices so existing code in pci_dma_configure()
  just works

Michael Kelley (2):
  Drivers: hv: vmbus: Propagate VMbus coherence to each VMbus device
  PCI: hv: Propagate coherence from VMbus device to PCI device

 drivers/hv/hv_common.c              | 11 +++++++++++
 drivers/hv/vmbus_drv.c              | 31 +++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-hyperv.c |  9 +++++++++
 include/asm-generic/mshyperv.h      |  1 +
 4 files changed, 52 insertions(+)

-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
