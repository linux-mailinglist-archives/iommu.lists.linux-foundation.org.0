Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8808B3792C1
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 17:31:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 093A2402AB;
	Mon, 10 May 2021 15:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0vwPRoj__oL; Mon, 10 May 2021 15:31:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10F1D4027C;
	Mon, 10 May 2021 15:31:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D65A7C0024;
	Mon, 10 May 2021 15:31:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE6A5C0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF25760BEB
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-jxKEgUj1Bz for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 15:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DC4D60BD2
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ1XScNC8WxDcJSBGF4fH2x6doXrBkSkkD0U1HV5YPC09ze3kTsfUKGZpfCnNZfTzqNH8DY5rjkDOqjsMNf9gKMfNHDw3flPOcHj2NfhJ5SoUTBrZUIGgg19GuR7/FmP/Yq6EAv/lwBGMVQnDWBQREO+9CjXxozTvk/voXvP0FNsit/1L2n+v1vrRSQYNlqMkV7q9Ab6vPvy1lrE5RiFVoxpeN4v/fCZgBE3takI1eHbkECrIiZO9xU/+8rEdn68XDGPnGWqLn4XqshAvrcXnAtGu+xMdh+E1LfhgPYbQbwLKtoeeVIRv2Ola3GivCZ5+z1PlOfnGELx2RcTmvvhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udVIqNaDkwT7Wnxrtq81jU6gH6RKKDUZxI8YbxXrVN8=;
 b=VfSOynSvuoFfaz45rYgu5wO3Ta1xKEqzX/cwZFmgDPrF3ovrDLIJmnSUPdmnrOG0qMixageYZXHxyqjAkGrKNsVUCWhKwB5q023EaxEvL/cVoR7cqPvMQ63QR+tIaWXwUnmTfbZ/+6GiBk/bSQ1XGGgC8tBKPEg776Key0XqRWi4IhTTap5qX1LRjjAkFBpajZR3ze/ILBP5YwWWB0kqDbZcOnFXuWX2T1P7nQuwnCcKpj/mvqdTgATQsJ0EB321bI9kPyHYclhPaZcEnXxgbalrDR5lGlrSSfKsUdqs6zCYCCvCD+uv9baJ+SVSPHbfiHqbALCMe+9ntstdod2jXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udVIqNaDkwT7Wnxrtq81jU6gH6RKKDUZxI8YbxXrVN8=;
 b=mFsEy5JkekTI80bM85PZUHzWs0zmPmwB/1P3jBfkRBIAW2Stna8fGSwcuqgBI2+CeWBATW8yKdloJnDqvrkcx2AF01IQ2ZuvO6dykVuRETBDh0SxDUtIcjcOXXqXiPsMtLGdlV4UN2aHapnBZBJMAMANKQO4dMJL6+QaeOyNhj7+F7+5U+P1CaHz01fQS27A9nOw74FlIgx2lsicNIwSb3UlXkFV4O9iCRb7hohjLbgCQKrksl/2cl9uigF8OJl8bQYwChjbetw8LL51jr1BLXfr6vl3ya+MeEuREXqDVN60sV2QgSbNkLhH/4NQJczJ4PXm1UgfVN6/ELBTo7jlkA==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1241.namprd12.prod.outlook.com (2603:10b6:3:72::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 15:31:13 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 15:31:12 +0000
Date: Mon, 10 May 2021 12:31:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210510153111.GB1002214@nvidia.com>
References: <20210504231530.GE1370958@nvidia.com>
 <20210505102259.044cafdf@jacob-builder>
 <20210505180023.GJ1370958@nvidia.com>
 <20210505130446.3ee2fccd@jacob-builder> <YJOZhPGheTSlHtQc@myrica>
 <20210506122730.GQ1370958@nvidia.com>
 <20210506163240.GA9058@otc-nc-03>
 <MWHPR11MB188698FBEE62AF1313E0F7AC8C569@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210510123729.GA1002214@nvidia.com>
 <20210510152502.GA90095@otc-nc-03>
Content-Disposition: inline
In-Reply-To: <20210510152502.GA90095@otc-nc-03>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:208:2be::18) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0193.namprd13.prod.outlook.com (2603:10b6:208:2be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.12 via Frontend
 Transport; Mon, 10 May 2021 15:31:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lg7sF-004axe-76; Mon, 10 May 2021 12:31:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ab3455-20b2-4f63-814b-08d913c8a496
X-MS-TrafficTypeDiagnostic: DM5PR12MB1241:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12412481168F8F4151DFACAAC2549@DM5PR12MB1241.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkoCTtkKKuNtkd2sHpMgYF2xHYZKECcnEU9ohj3NYxyncclkuInXgsenfSsz5ARR8q2kBUCUIrOJ3D1R7yCBV0lRIA3scVAfR3H2UAEWOUWe2mhtMk79w12e2REjo25wGz4AngbJof4yLDGCJ26PW2Zxh0ZO0M0TCZRw83ud4c7Mbe/YwXsOrAMRT7ueoGFV/UVG3PrgrRCpUcya5LnYIoPGBwBaXNbRy1r7Nv4kf1U6uTLHTTqvK7wEommoI27R79ajUWzqPrZO5oOArmqTJuSTbp/TnBKam2jt20MDtLNWIltBo3UBKYFbVkT04BcR6tlur/gLM6h4sBw6x9q40Hsp2jga/aR5wIvtBiZHzrocaV0VYRFDJj4tYzsVoUTq1a9hg3pI4vCGOKzfKeTc5IjGb+s+XhyNgn0t60u5fW0Bcc74Yts5SPtN+9BtsbVSNSBtg6qSTwJVXRqq5S/YA7gPYNE+QfDVBLwQQs6YcntcneQuhe33zRhGN2nXRQcHtA9PAaayKBoFTqvDngTurFA3UXNy1hBnWRkn0BRFoaEohmPP8+JBdpLQdeGCgDVItHBF4yvMFgUqjipvLZeZbVSXA84H2r/gQgw2L6JzbBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(426003)(9746002)(9786002)(26005)(66556008)(2906002)(8936002)(66476007)(7416002)(66946007)(38100700002)(6916009)(5660300002)(186003)(1076003)(54906003)(33656002)(4326008)(478600001)(36756003)(86362001)(8676002)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/FoYh/WBZIguh1RA1qdpWf/EA1zsu/m1UGRYEId0lCPUxnxd6Fe1euZ+fI2Z?=
 =?us-ascii?Q?qKI3erQY700VmgqtyA1oZc5p5cjwdMs4x8fGTHxckFPCgtOwMqCc/C8Gk9zP?=
 =?us-ascii?Q?HXcJHuNP3RTDx3Jd7SL3Fns+vqL7QyPMb2o0ORHosdG28U8z/YNc3st/95jT?=
 =?us-ascii?Q?djEpjcMBaJ1auMj410FEFF0Zgd9cI1N7gYyPegdp/ol7JKAPmKiKjG1nmGGV?=
 =?us-ascii?Q?Ln5P5PTCjidanyjf2gWv+vy9UXA9TVHMpOdCleHkaBf18TydfVPo8xWSwk8g?=
 =?us-ascii?Q?UD7aGX3uduoVxw/jOrrtdMgZ7KpSbjnwexV8x1mZKs1ANeMYrN+2Se3m/96w?=
 =?us-ascii?Q?dMmiqsAQaqnNciXI4yrv50rkFmZJPxacVRpT2zwfcnEvVIADOMPkvHXNFAeQ?=
 =?us-ascii?Q?pIiYiVICllL4xgOycjU9fnlhhSFtBKA0MAtsSa63vZN4v50s6KYw8064sRn9?=
 =?us-ascii?Q?k50cOZ2J4ffGHAtE+9dyvLJB8336/Cxh0D6bVyI4DVgWtBx1S64HD4Pt7S6t?=
 =?us-ascii?Q?hikM/bH4K068YEew8TpdMdoYD7o6PB2Nll7C9OlSZK387nOoQfiRQosOZ95Y?=
 =?us-ascii?Q?/Xty9FHBDEFK6b9XygEd7MVPBWoGJInd5CcnHQrmkf/X17cSKtDBfz9LNKGA?=
 =?us-ascii?Q?P8WcB8xbXGZzOIr1Q1HkXqEPhntzOxRakcCDcWlGDhU59FvMknKju8mES8hW?=
 =?us-ascii?Q?/96+p7gyltABftyZ4gUWZag0uhJnY0LL6n/K8iifGTV37mojsf8Mylga9J/0?=
 =?us-ascii?Q?ps1hApOrd9RDenkoJyW7NSUzAMp/aExnwum1cfdRpVFqMlm0HTefs71TSCNm?=
 =?us-ascii?Q?x+MBbci0ebCCshkZMsVB83W+PQ1JkkWLEhhvOM3SM/oSvHvU5yc/1qpeSSB7?=
 =?us-ascii?Q?k1ozfnrG7/tvS6+gBpQ33lIH85DsHOyCqL1PDDHZRcIZXDT/43G1nUaUg616?=
 =?us-ascii?Q?Tc67ouDvCSDNCkDV77RpHgTcr4096De3In3aUnr50gToeYhlhuezFR+n1vaK?=
 =?us-ascii?Q?lfb6Ob9uhZaM9WA7LeudCA0qLcB/rlMhJkzC9nnb2bso29OCn2guxwQIDitX?=
 =?us-ascii?Q?lXxu7dAN81TwV771IoEBkaLRljcHKFJu3ypjnEj0dyA9HPExa6A5Wd5b4h/6?=
 =?us-ascii?Q?bgnt3V5Y/92bV8z4FVO4SKgipNowYS4x6mGzf8reN/seEritjua4hAuhMMsC?=
 =?us-ascii?Q?tj/k8Z/IJh8EA/Qijg4RnwvZf03dsOZudPUYBxx1O7aaT7ZS7KXlkQktwZve?=
 =?us-ascii?Q?Frdj8u64pPw0z+2ayNWwJd/YyZ/MxfjFPbPbfaCKHLzc0p+uMxPYnstvuTej?=
 =?us-ascii?Q?CkJANvnyL4wu2W1HzZNgru5R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ab3455-20b2-4f63-814b-08d913c8a496
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 15:31:12.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0rnepl0bQAdj7c5AO4Yiq5n2Vm2P2YnBn/y00H42rP3AICPdqRiE3H+bumN/C1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1241
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Mon, May 10, 2021 at 08:25:02AM -0700, Raj, Ashok wrote:

> Global PASID doesn't break anything, but giving that control to vIOMMU
> doesn't seem right. When we have mixed uses cases like hardware that
> supports shared wq and SRIOV devices that need PASIDs we need to 
> comprehend how they will work without having a backend to migrate PASIDs 
> to new destination.

Why wouldn't there be a backend? SRIOV live migration is a real thing
now (see Max's VFIO patches). The PASID space of the entire dedicated
RID needs to be migratable, which means the destination vIOMMU must be
able to program its local hardware with the same PASID numbers and any
kind of global PASID scheme at all will interfere with it.

> When we have both SRIOV and shared WQ exposed to the same guest, we 
> do have an issue. The simplest way that I thought was to have a guest 
> and host PASID separation.  Where the guest has its own PASID  space 
> and host has its own carved out.  Guest can do what ever it wants within 
> that allocated space without fear of any collition with any other device. 

And how do you reliably migrate if the target kernel has a PASID
already allocated in that range?

ENQCMD must not assume it is the only thing in the platform. It needs
to be compartmentalized to specific participating RIDs and made
explicit because it has a bad special requirement for cross-device
PASIDs

Jason 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
