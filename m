Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B441E48210C
	for <lists.iommu@lfdr.de>; Fri, 31 Dec 2021 01:40:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D50409A1;
	Fri, 31 Dec 2021 00:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5xRWXwPmf07; Fri, 31 Dec 2021 00:40:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 454CC4099F;
	Fri, 31 Dec 2021 00:40:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 140B5C006E;
	Fri, 31 Dec 2021 00:40:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC73C0012
 for <iommu@lists.linux-foundation.org>; Fri, 31 Dec 2021 00:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02BFB40438
 for <iommu@lists.linux-foundation.org>; Fri, 31 Dec 2021 00:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ru6eJY_j8y2s for <iommu@lists.linux-foundation.org>;
 Fri, 31 Dec 2021 00:40:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B939C40178
 for <iommu@lists.linux-foundation.org>; Fri, 31 Dec 2021 00:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2PZPncSeQwvslqEyI4JYZp5GG6u/UhQlC6jtd39X0Y12c/Z0Ot02Dcmf5D61qQ+S4dXjmPtgTTIac0dryHETMUx03Bnoz8b1CfaLu7WZJp9P1s7K5UIjpe8B7n1CuGaGGFML7JXCSozc4yzpBb4NyIB5gtlSWkLrZ37FsKU9Xgiz0V5+xJJohEU2dmrglhuSF0Q3I1j4RV/tB5436CO3FevQPoRl9whOjELq7EIX/O7KKlMKcit8SBK7UNs8fvjG8vqspY+wSPbXMEPibd6kzF8JSu6ae7HCUIml7+8yNKSSEnA3fDAWqTYwWg5YulietZWit/xifvhoGD4XgBtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ2bkJkdHkx59vlJ/agGTcSOjrBCLlOS4QID+UTqxSA=;
 b=kV+p8XKYatvsMc1Edpayb1b9FzCNEjWO8YqIRKSRK//W6Kc//Taizn0MFUSOEa7+5KLuaoMIoV5n4I3/uO7XAdMJu34Of8O7eVoS+qyjto83pOnzwiri8eKa8WdwxUCe9ge0YUaxQhGu0rOnd4Su4BFZuTa0KHifEXlvNA9cTfpWRM73x/yxDz4dmQT4EEmX//Akg/aCA2npPtt6tkEJxM+ST4l73EZ688wiFNlui31KFz2/9augoUNLPCeJS5CRlwNP9Tztt8ZmHcBHa4ZhrC7eKZqyactioIZfQFCpbj6BXVDrDnuxDgbQU61kkxGZrPoqG5+XCbZr6hONv4YyNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQ2bkJkdHkx59vlJ/agGTcSOjrBCLlOS4QID+UTqxSA=;
 b=myqprRy6n1PMXxcLtaKuIRwB0fbr1NaDGf9/l4pKWLvbS+7vPGe1niqsleu+/D6XKgCK/8nN4Y2iMTm+oBNvjgoxQEj6RRcLeEYWhD/jHQlXhKtDgAYd7IJlwf3uYaU/Wx5rMwxNm0padBvj79iSfJ/tXEpu8CHvH5bXAXtj6u/1XJ1+2seBGyMadr6/dXDZjXAeoFQ1abi8N4MDnZQVVViXU/XpVEUb+6EFXav/+AARlUVqtmWWuegYBab+rJvrtqGJFi5u76xQDaAbgyjnIZTiSzWaeE18cV0qpTRqK6AFGlA5OLYsTFv5VnUvamDahfz77UTwFgG1Kw4JPetdNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5223.namprd12.prod.outlook.com (2603:10b6:208:315::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 00:40:21 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 00:40:21 +0000
Date: Thu, 30 Dec 2021 20:40:19 -0400
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 03/13] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20211231004019.GH1779224@nvidia.com>
References: <568b6d1d-69df-98ad-a864-dd031bedd081@linux.intel.com>
 <20211230222414.GA1805873@bhelgaas>
Content-Disposition: inline
In-Reply-To: <20211230222414.GA1805873@bhelgaas>
X-ClientProxiedBy: MN2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:208:234::7) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff53f9c7-fe52-44bc-3923-08d9cbf62009
X-MS-TrafficTypeDiagnostic: BL1PR12MB5223:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5223A98F79D71EF2A42F6CF6C2469@BL1PR12MB5223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igZ8YsuIUHhRTNSVi4ThY2FcU2Aor1FW2H53RJsuh9f7+FP3wSv+jQ9C4o8ytjF49GP/lEfEFiMva1qYlhdx7nzkRAZV0gr8FiFMRcI32FKR/iyzo9oxWyDjyD4dTz1bYJxynxBTVBKdirk6v866fW0R5PsyCc0pug+gfIrwPFalbusIiKKeN/3deKZEiHIHOnzO8pawDwDAYHpqKZuW6ctonExvclsnKSY6fmZpY/v+3hE2kgDWAPdajqSbFOzyTZOeHGE9+/zqexpQmEVXiAUngDfuiAtYbmimKBndg5SEe+mkXtzv6S3jUV03oUPabdd4LdG4egnX1ee3N5y+uNdnNcY6oLnKyZxI+kMQCYnJ8lHPvIILChKU66/GbETKiF965G2L96Rv/IS0cfQT+f4S5kq0x8TACqki69Nz4GVmnTJeOfsxDeptXu0S6z3pxTyGt7SLJIaxBtkKdZXSs0P6ibA7T9LHZ69BGWQH+2hRTjSCfMCibsx43zNTbA0kVpvlueawCYXnv0FXU1tsBOTSF43Nh7+ZC8IW49GQsNmxoxfmfn5ikcrLIxkLsFDh3oZEz3M77n/I2cxl0FB8HKFkeeZvuzXiB/U6MDNma/u2TUqNIOz1wT7ofwGI8AdMh58LJ8m6iQe2jAnCCv9x5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(7416002)(316002)(66946007)(26005)(66556008)(66476007)(186003)(38100700002)(2906002)(6916009)(8936002)(6506007)(6486002)(4326008)(33656002)(86362001)(36756003)(4744005)(5660300002)(2616005)(54906003)(6512007)(8676002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yk43pqH6LwOJ8X3tKUChxyhyeEoS52KBBBFjy7Pk8ouh7Mt/ykyG4aRKfcuT?=
 =?us-ascii?Q?hT5ZFjJXsCkZ2f+LRne9CKxmuA1IrTaRBm3RH5tAm58vbvc+HwwW2+j7iJr5?=
 =?us-ascii?Q?JXF6eiyLMD37dIwbXJHDf17KR5qfN6qfImm+z1AMiD51JN2Kt8kD7l3noqAY?=
 =?us-ascii?Q?QtgUKUWOppPOLQVLYntEtsASTFYahB0UpNaRQa6mdx6fMo4/S2I0cNETn2ex?=
 =?us-ascii?Q?bARy50zitHbpQsMkoS4Rjl2uL1yB2X7v9DqebwvQ5CBDsJfP7H5At8Voza6n?=
 =?us-ascii?Q?t7Mvm/a+tKhjUgjke0ES3jLXSXFRrSM7HTlilGj7B4+4oXm0o3G9edRhNsKY?=
 =?us-ascii?Q?tHq8VyJ8h/SIGsJM8Dl2q9JyWxThanZ6lpfNucOYyOhEodrLXfBVx4gtdrYq?=
 =?us-ascii?Q?LZPLqPCidmWETxVRT3KTfYH1SuyJUYWUVtsSoaBuxr/HdgJNCgX6Et/HoZBr?=
 =?us-ascii?Q?dmlSbo7w88hmLwhVHM6TNOkVd2aKs/asIZ8JFr6bPtPewX9sL5H66B1VNt2z?=
 =?us-ascii?Q?Dpo9cTwUlZRoUROFi+1NmnT6PJSDJb2RIcJxf5eL+HozJi4QWcInQ9R1SOix?=
 =?us-ascii?Q?QqXBpmVSmzjGJNfIsdMdwUojyhMrl8KgMNb7MfBq1XAaUpj75L4sxhTj6bZK?=
 =?us-ascii?Q?jtvai7Xb41DMEKVf0Uu90YZwwSOpyuRlAQrNycZHoLAuaUIP4t/bY9NLkMQ5?=
 =?us-ascii?Q?0JzSMDgXwddm3dai2tiIlkB8ZkCdQ6Oq1S/40YCp0RDOGY5qa0sAgqr9e8+o?=
 =?us-ascii?Q?HRuqf4SwEheVjY50sVTorAxmf1DoOFRP4GHAuY32Fcz/DXWhaocpDvuAidvX?=
 =?us-ascii?Q?yYJwZVsBRIohm+mWUVfm0B1uZy7JEjhAeNpa243S8MHmUSPsTeQ4gj8QGWbm?=
 =?us-ascii?Q?PqKnU20suDtOOGTiYlJOuKf8RozIs83QS223Z+G6zyHV+1TZHSaPi/ZGiIjT?=
 =?us-ascii?Q?KTxZvZN4PygXK8I94x/hwL7dgJvNq+l7T7oSu5DTwXjQqIbyLkFtu5pmDXu1?=
 =?us-ascii?Q?nI4dN+TtkHdYzNpEDAPwlE84ZJ0TGApTtA3ImWuyN3ITmoel6iQHRug7JtDy?=
 =?us-ascii?Q?r/OAeGGqXeen/KWxEQJW4qaDFYf2BwlWpExQuIpHH21z1PtJ0GgsThRXTwE0?=
 =?us-ascii?Q?RN8Z26NLU4eofW2tX0fnUIDSarmKlmYhtgHH9FnLgP6HomHAm2de+Ux9ekFT?=
 =?us-ascii?Q?Qx3ZdKpB1eAb0UIVv1Exuz0AWqBSerAe1/Dk5nhNasWrQLZe8FA5urgGzZH9?=
 =?us-ascii?Q?Krzz02AZTfJw58GJOYPX78OZ0M3NnHwpbL1FkAVrD9/dPYj+fXi4J4IDShT/?=
 =?us-ascii?Q?KF5qKMmpbdgO6LOlVocSut9ZZUzJl2d/6kYusH/r5ZHAyCNHAVSWusApkv8M?=
 =?us-ascii?Q?x3t1fphoBzZi1fWg5bFsFPxGVdkkqX7P7TrKCBlxZU5ltiGlfgeHUrEzMNqR?=
 =?us-ascii?Q?oe+85PWR88edP+cD6/T2E3JrmwnHwtpH3jaLyhipk2YHAvPoltZAfoq1WeQC?=
 =?us-ascii?Q?kxjgeaRKLRSMiCGKdlOCSCUmyl86yDFwEKTQMax1NaOLUNHqm1AdPlnevUaP?=
 =?us-ascii?Q?An5v2+rEQza5SZ/qqV4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff53f9c7-fe52-44bc-3923-08d9cbf62009
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 00:40:21.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV7llXLoWCTk73q7LI3lC+2bM7Hwvsyu5BUYK3Q4AXiQNHRJH4ohCSRQWbo3H9Wg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5223
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Dec 30, 2021 at 04:24:14PM -0600, Bjorn Helgaas wrote:

> I was speculating that maybe the DMA ownership claiming must be done
> *before* the driver's .probe() method?  

This is correct.

> If DMA ownership could be claimed by the .probe() method, we
> wouldn't need the new flag in struct device_driver.

The other requirement is that every existing driver must claim
ownership, so pushing this into the device driver's probe op would
require revising almost every driver in Linux...

In effect the new flag indicates if the driver will do the DMA
ownership claim in it's probe, or should use the default claim the
core code does.

In almost every case a driver should do a claim. A driver like
pci-stub, or a bridge, that doesn't actually operate MMIO on the
device would be the exception.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
