Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C139F759
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 15:11:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FB883BAB;
	Tue,  8 Jun 2021 13:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTQFrdCbzpsm; Tue,  8 Jun 2021 13:11:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA0983BD3;
	Tue,  8 Jun 2021 13:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA6E1C0001;
	Tue,  8 Jun 2021 13:11:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BE1CC0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28CD940424
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjeh7_Qjcf_E for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15470402C4
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZa3h9kqJD4qcYhcdvzrJDaiWzuFEN9hP+MWoIP5F7Ui2TXLoq9t6iOhDRivIJVpParQQlabgRo+1sCRHvIJ2tE1ZQixmLLSb9IAnAiJ5aDvAnG0jTCDFW3exw8LGQSNVjERsu1vrPdYCnk9h7cXmdrbDzk4fzUM87WOylweoQpaLjwAKsfozzlvVg2FuMgbhI7Ae6BRxHlNPXJcYv2Kk/VVWOJbgD0nEaI/JpDjoMBb3goFOnI9SEgyUSMOrnl0UCcb+y3eK+hVFMM9xWPcja8aNU++IlF3EGPfNhlb8gEGfcH27EpH8pPmXlrCbUNdJZBv3j2CDUpIKWZfs7qo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf9vr+faZoa8pYDHkzodOthjyWV/67iurkrgTfswTHs=;
 b=UAXPgh1VHR1IzDcw+sQiNU3ChTAN1p+fGOwd6JvptNMB4acwxnqZs95ng8z5ZONgJNslba5beKHijUjtbJld/guNYgmNCiIGttFMEo7Hr/edCvg6npZcULJRvv+4vZPzb9P1nGetbAmY6T+Es9vN3T4vltebyp0rr1QWqy3dd3/LiFZv0Ln3gMNpXSn3hA/qS+AfWlD5rr6HTex8io4O+uPwv9HsaZp9xu3tOAfNeaOhTIyQijMLSn8GTTFsrYUIivLMoZWFZm3SUJRIB4fMJ9GCXDPcVqqbdkqIRF8gM7flWWtWeQEiP/461NAUXDElUnxRzL4SA1jnnwhQUixCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf9vr+faZoa8pYDHkzodOthjyWV/67iurkrgTfswTHs=;
 b=MUt+dJavtayhQGgWwRqYezPiEhZQxY1kRw1ETlXOf8Zrn2fu9I7FV7udXxLLYwCBfPM8SOzxxyUQ5FWgBt76tiGIqw/voVivI6H/qqOSXzL1BxTJhvPjjwllSLK28y4wlSDkVrUs80q7GoqInoAVK9RC7hfNnOEypkrJqFkp4lWoH47OcH/VeTiEdYHOS7tzFr4frx2JeXm8HONGEj3+XlwGozdcrZhsPpr1oh3oM4HgO1+svpSVl/WaNw7aiOfFpU4DbgQxufuoyNDaipRg7m95qnPQROvGtLbVpqMfxL2LlnIV0+O7GCe96yJI01dexvhotDd2ZTiGGlwLEqyQ0w==
Authentication-Results: metux.net; dkim=none (message not signed)
 header.d=none;metux.net; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 8 Jun
 2021 13:11:43 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.021; Tue, 8 Jun 2021
 13:11:43 +0000
Date: Tue, 8 Jun 2021 10:11:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <20210608131142.GD1002214@nvidia.com>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <bb6846bf-bd3c-3802-e0d7-226ec9b33384@metux.net>
 <20210602172424.GD1002214@nvidia.com>
 <bd0f485c-5f70-b087-2a5a-d2fe6e16817d@metux.net>
 <20210604123054.GL1002214@nvidia.com>
 <329fcd72-605a-fc10-1a8d-c3f2ac3be9a1@metux.net>
Content-Disposition: inline
In-Reply-To: <329fcd72-605a-fc10-1a8d-c3f2ac3be9a1@metux.net>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:c0::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:c0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Tue, 8 Jun 2021 13:11:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lqbWA-003qT5-B4; Tue, 08 Jun 2021 10:11:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c05f2d4-6fb5-46bf-fc11-08d92a7ef62a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52537A27CFF07FF18E69BEC2C2379@BL1PR12MB5253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: by3fwjAgMVg155cKlHa54BqHROuch0rTm6tns+xUN/W/3f46PXO48am0R1KR/Juno72+MbKQqYPwOJAkX8vWP02JvM7yIPkWiRjbOfPLDiEwUSQeGPzUUJdBI28Dzycq6xFVMdYMhT4w03Gtjk+w30OsF/MaBCGDsiVA/LXH2spT8oYfTn1B36iOHGuD4qLXbcRtitcERGwqzxYc5OU9Wg3U2lqFVQ4lug3p8zHfxUZ4b/UsdLn97sBrHpIaoFiiPxims0/USHMm3u+WWqZX4FXZIaSxWgaaVFhWHt4+vdyMdvp4KOgw1DtNHELT7zq4Hgbwjfycn1qWT0b7wdLuJ2U/HaMzoGWlJ7bxLOrioxETejhtqTXaxRA5hedU6rqCOv+xmmXlFsJX5NUCTwiZPEJ1sMp/aPhPTqV1QqZJOW4da/e4TbxEQPju52rmCdRvAvD5euL226uo74LmpUO4B8dkald9JRKxq90+DuNzKLXLCoLFqOQ3JvuAS2BHB+kwnvNVybCi2rBD/s2SiDVf7W9wYECccu0UnrufMPBjto7kJnFX9B6IwvL+p26RE/gFT3gW/gh/VjEuqOq2x9MMN4KluevJnAA+/p4QI096NFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(26005)(33656002)(8936002)(1076003)(38100700002)(54906003)(2906002)(558084003)(5660300002)(36756003)(186003)(66476007)(66946007)(66556008)(9786002)(316002)(83380400001)(6916009)(7416002)(4326008)(2616005)(86362001)(8676002)(478600001)(426003)(9746002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7G2n+w7SXraZEuZCCsMTx2dKJRBksyD6kIij5TxBWuuQjV5mpmuRcR4NeyYz?=
 =?us-ascii?Q?vEr2o4YTL4QU3JoHrbjU7qCvke/Zh5xUf3Xay0ICxLGXSdSExl3b/stLcOX6?=
 =?us-ascii?Q?U42kgzxxCIka86uujU/fIOJWPy36xEXqeMFdpf+BonI9gw35qSIcJE8OE0IU?=
 =?us-ascii?Q?sGQAn1jVEYlqT8f2WY/0wUiTMTItvI1n1/VK+3S+sjLLB1LZNTR/hvGLn3d/?=
 =?us-ascii?Q?yq4qoDskJR8AVGsHop/+qGXLoNamL8K/I3TMjoKPWHX5WbbamcItFvygmo9P?=
 =?us-ascii?Q?NmZoAlT7cQmTfWaOMC6y3DKyfyaNh490S9a7oVrf82qYFMPUGY56YMxR1H3k?=
 =?us-ascii?Q?/sHRFHjaUQZtDFHyD/ujXrycrtk3t/zNNYOyA0Q4exbmylUohY5Yscq8XGYz?=
 =?us-ascii?Q?M8IoYUA36f9cPQFfilSoOJirSByUNjsHNx9WtjLydb5mKEve0EEXJn/xUqjK?=
 =?us-ascii?Q?033wZLuMrMZtX1slope3g9NAGXPfmFIE0OnYarIv8z0wjsIl1+QpFyCW3dKg?=
 =?us-ascii?Q?UrB0E4NyfYPxLS99AdhjcbkRTtlZgZmFtrMUteJ+08GjdYh7whkW3LKuiYIC?=
 =?us-ascii?Q?khsQu19UuoGXBTf19ADrThflQ4HV1ZjVOKk8SuJc5XLuJpN6ZaMxOhCVADyd?=
 =?us-ascii?Q?UeiKN72v6AwSQyglAiz2r3OBSuXpBIlES0JBQjxURfiv+SZkzHKkrvGs9nD3?=
 =?us-ascii?Q?T6O/jEPYYs7WOINYKoeeP8+CUYnOWQQ+Av+mYspj3xlzLvQW3ezXl/Epb3sh?=
 =?us-ascii?Q?EMdFZ11gw/ycAQ2ZknSFnT4Q18ZmIpCBmADqqX7y21/ixa6jjXXtvTnDTx9y?=
 =?us-ascii?Q?LGnBDdkTzFY9Q9na5c1v5J0OOuvuilHXNyOsyHgFv574+TEBO6+GYAbGjfgm?=
 =?us-ascii?Q?QcpWWys8eyXDYHUDuEbI5fFIqdyVRIxygYJKR/kDIP1xfpcswIic8b+7CDpf?=
 =?us-ascii?Q?xHu/F1M+L+GCMAzL53+FvanldfSSsPDWvO0SYeVVSvFn2PkogGUu0Gwx3nHE?=
 =?us-ascii?Q?XMF2oQ8HCCiobvQTsPpgcAzdkRrRgwikvDzn7uoGxo5xzLUBdwr4Ge0c5M1y?=
 =?us-ascii?Q?NQfIdQhwH/s2uVKwMQ83TZJ/D2jj5Labm3nr7wVfCruJHkt3sD6d6g+dnUQM?=
 =?us-ascii?Q?CoLlhT1da3OrfmBboIQb394qTP1NYv7WtqUkfiYwiZOEfVL/wU3dv2oEoGKm?=
 =?us-ascii?Q?+2T4p4TkIpTcPDgSUe+zTygGuLQNYyErzl/T3UCEGaJrOOBGOQW2/m7O2KNC?=
 =?us-ascii?Q?uyMVXxvdWt/Fje3AcUT2jvxc3gT9mRkV7sFVfQ96bcxF7Kl2RFa3Bo4rpa9d?=
 =?us-ascii?Q?Zp+0BiTzyfB8NnLGRKsEcxx3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c05f2d4-6fb5-46bf-fc11-08d92a7ef62a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 13:11:43.5795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zymKk1/7hR9vSdeWRHUQ6vOoCAjrUWb4uv0XrrNx4edlcVo0ZQjYVFXqMvg6vTfp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 David Gibson <david@gibson.dropbear.id.au>, "Jiang,
 Dave" <dave.jiang@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Jason Wang <jasowang@redhat.com>
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

On Tue, Jun 08, 2021 at 12:43:38PM +0200, Enrico Weigelt, metux IT consult wrote:

> > It is two devices, thus two files.
> 
> Two separate real (hardware) devices or just two logical device nodes ?

A real PCI device and a real IOMMU block integrated into the CPU

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
