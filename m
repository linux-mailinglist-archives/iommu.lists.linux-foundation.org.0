Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3037696D
	for <lists.iommu@lfdr.de>; Fri,  7 May 2021 19:21:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D8B4019B;
	Fri,  7 May 2021 17:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w64gBZi2B7gh; Fri,  7 May 2021 17:20:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B766540150;
	Fri,  7 May 2021 17:20:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 983DCC001C;
	Fri,  7 May 2021 17:20:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8959CC0001
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B3940621
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYhm_p7K7lXs for <iommu@lists.linux-foundation.org>;
 Fri,  7 May 2021 17:20:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EF51405E4
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 17:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmcUKVesdgBin587q93Rxxfh0UW8A8wwUXkGVOg1OyuZjMdC+2DGyIN4wQ8ZT0JVDwiN0FeSu/6U1QSr+1zlwOOozBTdXC1Qtn0VmZWHdEl7NAxwfSgcHfkVoCov45W/NXCGNLwbZGRa0vNx6uzWr2UFVFwyJ6beutQT3RwWIXnUK93XkqUuLpl77JztCsGC8kyUc4vDRQm2ygBmfmBlJ6Ad46krl0qMeweACdPJGK7Nnk2WK+g8JwaPUyt//j836fKuaVk46AAmj1fjTUrhzw7yCeNljDspL+pdj0xMU+heJdoavFx8IAlEilMqyuR4S+Rah/u+WnAfhVfHuaRx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS3+uvJmeFN39QS9MK57Q2TVTgfZKoPo2fFubvNSmyw=;
 b=CRwSw8Ey1udE82M6EzmahvV29U0x2q0iBVfB5Ocry3RgJy3fhhaLrNNm9F0RC7Eo//9oRLjtJYYiOJyXFD9tO90/ZFzgGpc9fb1RDFpDJQwYftMBkvtkD+npCZ0EYDCzzfPTahR32JQrzr07xaToecV9nY3m1Z1g4mqoaKl3mpzhz1AjKJoRAmTkp+5T32wF19MgrkA67UXx8i8rh3n7eHAw0itIIxywoOblT+IfDIS8yLJHk/XThmr18jHjtZlyJgHRpTyhXj/qvLQ2mEB5FevYM4G15wr0ZfmOCKLhpewNm5BoAlcFYTQjwYlYoX3EkthACDRAwcmgcGb+0GwSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS3+uvJmeFN39QS9MK57Q2TVTgfZKoPo2fFubvNSmyw=;
 b=sWZ7QvP8WoCtNtg+Sk+VERfzP6U2ZZ64/LRP8wWlTvbJfpgdGBYOAZwy74gJ/SOjkyT0yivVzhAlO/AhBY8LMMZntvfS2ksUNXLQs53cFuDU/9YklIs8Rv4W8ClULaJSWCASlV4L/PZSRan9lK1RGsUGGsEpipThjMgzI6xg1S5Rw3F3LIJHn7MacEfUH+6yjoF7Ot/Buu0CPya9bR2JM3dMajrmjk8FBy+86mGwUSoLcj8peaAb880pcuB9PXB1BZfJNuJs/E3MpJa4ur7w3U2RJCJh9xOEdqmCpx0TXyKpWVoAKa29FqnwTP5EKFUjK4w6JS+wpwjnmMWWa7tmmQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Fri, 7 May
 2021 17:20:53 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4108.030; Fri, 7 May 2021
 17:20:53 +0000
Date: Fri, 7 May 2021 14:20:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210507172051.GW1370958@nvidia.com>
References: <20210504084148.4f61d0b5@jacob-builder>
 <20210504180050.GB1370958@nvidia.com>
 <20210504151154.02908c63@jacob-builder>
 <20210504231530.GE1370958@nvidia.com>
 <20210505102259.044cafdf@jacob-builder>
 <20210505180023.GJ1370958@nvidia.com>
 <20210505130446.3ee2fccd@jacob-builder> <YJOZhPGheTSlHtQc@myrica>
 <20210506122730.GQ1370958@nvidia.com>
 <20210506163240.GA9058@otc-nc-03>
Content-Disposition: inline
In-Reply-To: <20210506163240.GA9058@otc-nc-03>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0315.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::20) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0315.namprd13.prod.outlook.com (2603:10b6:208:2c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11 via Frontend
 Transport; Fri, 7 May 2021 17:20:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lf49j-002vSd-Rx; Fri, 07 May 2021 14:20:51 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf26299-80ed-4db8-14b8-08d9117c77d7
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0204:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02048C1642EB9B1414977C57C2579@DM5PR1201MB0204.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOzShNa/xPmIxV1rypTpESI96Febz6458YRr5JPmXAhRgHidHNm60esXfNh4kFLrwFn8R9xQHKHCroa3Hbg3h/fmZrQDvOelFL/5NkZ0Xsypkm83uVmXt4sR69AoJHqWDFNptSyTTsL8b2bX+pka+vrC78Ya1VjSgBIbsUo6LMmksKlVsjk1GzGECf+hPkTh9mKuWfda/l/37VLj81C6LXRdgHYGWVuahUP/OpihLuGuLb7ImgWiHex9HjQkRJoAUpHtJQXpDk/+RfAi7aTwHwN5Oqd0YMzsS5UI0plNAlx+akUgCCaN0KulRojVL3PFFQ0kAGY5zz1Lgp8Z0WH1qdAhUrXcJjeDiz6QlrZMmjAJI/vo+FNworH31pnaZIcM/c8urVNFMqyy8i1yTzzVXqgVt4rtubRPWIEOAfc2h9FU8kuWvqrV2wi2sjzwnD7+TlUBwwcXBXAEPqtJgJb4HmSv47SsY6DFXVwBtNg21ENZK47VWlOIiX2cNRLqGNff9lbLMHrDgo6SqBdpJ7JKl0g/gz6Aa3G0gLc9CSSrZFlEU9dam69wvt2gfJosSWySa4Dyz7xM2KY2etmFHt/wNaEqZldd+3wH7ulFYUzCBok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(426003)(2616005)(4326008)(5660300002)(316002)(36756003)(54906003)(38100700002)(9786002)(9746002)(26005)(7416002)(1076003)(66556008)(66476007)(66946007)(6916009)(8676002)(33656002)(478600001)(186003)(2906002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5uNDrlRQhdnvVZqHyQ9BLdbachnea4nmxz9PY4RSvAwa/kaS9i5+zue6VNqM?=
 =?us-ascii?Q?LLi08eMdrWXitnaEVAObykKjVa6rN2JsRxpD1GgqOKcCnyjAwgNzmvR6o1w9?=
 =?us-ascii?Q?lQAgChH1GCgwOYfun5bO+e2cn6EvgqcUpa8C+6gOdth/1jIgdhveG3/aXC82?=
 =?us-ascii?Q?jpCl4eq6ndu6osd9fGkGh6LOPA6NCcqimtHwWglI/MrM9hHUbed/DxuqM+fj?=
 =?us-ascii?Q?a+syzaqpw3NviRZO2t/ogrOyiK/PM4vrOxrFw304tOeyQoWznx6haSxCYyBR?=
 =?us-ascii?Q?c3Ccn91DROYv43MUnCUdNQqgySwJmL/OofaBEpnbyYfag+IKtmONQsIrpqz5?=
 =?us-ascii?Q?PDPzYGjuaqzps9PVeyNTmR3y1exo5mQDVHP4CkvZ+QJ5c8CqADxAnZiVfCPW?=
 =?us-ascii?Q?3+uIhxR32MMBboh1DT5Hc61yrumFFz7k49MQF8mPiTpuiTMI7NP/6UtX/DoM?=
 =?us-ascii?Q?/h9VxB0vnuzWhS7XbUBYBXuO6hl6AsdcY7AFjMGFN8fGf7idUSPPtcqfx5Za?=
 =?us-ascii?Q?FXcel6lHC8DdB345ph3FpNNCBUTPZcLz+5wpf9XRd2eO03ste3D2K40x/9us?=
 =?us-ascii?Q?obXK6TdyXB5IhrstF59UgZ1KUXd2qUmaiUkNyGfxo3J8cmwCGGD9pPIs1Z5I?=
 =?us-ascii?Q?HsjkZZ0UAUuFJUQLjqF2Ihni/hubR+88pqX0WYeYHHXbrG4xV5u7n7japqWX?=
 =?us-ascii?Q?Q3mcQcJ3h3WfGP8R1scgqZaytWueUXRQjVB6QrEuMfSxG+h2/PKkzzdCsxQI?=
 =?us-ascii?Q?ZB/CLqRM+N2lgaCnSQmUPHxXzTd89uG/S6kD+pk6CjNhhSB42/hj/4CfWaZi?=
 =?us-ascii?Q?FqfBfbtbPV+phtPPOqdCTxGPGnMApdxIZk4UqI0icQKDdJDU39Plh0NmstAC?=
 =?us-ascii?Q?vZoxv9uGjgXmEiA+/ZTk+jbQvuKkCHoWr+YzWT3ld9nhv852AGIHlu/wxoUO?=
 =?us-ascii?Q?jMpLDuvYT6yoqB13JLN4Sad7a/ciF1u11kLPcsvvngFTAYSwjjJWsof9hjWa?=
 =?us-ascii?Q?3xvJrar8PKaD3bIw6WrRagUVdSNtN4xiK1WiezuzSsG6e0nFytJ74QOlPNsN?=
 =?us-ascii?Q?IkRsistb209Bc0HAoS6nQvIUNs+SrpF0/92gK6T7EI6M6qyFfd7rDATVB22S?=
 =?us-ascii?Q?3XOW3zJl2Lsl8UAji+BUSmGtKcb+RLHYraOrFtrV7ou1iDcA1tmohuP/4qf3?=
 =?us-ascii?Q?C2i3VZl3ayR8hikaRJHAmgz6oLzoPj4lwlHtQbxIzvaqYCJnBPmzUufp2ZuU?=
 =?us-ascii?Q?dAsuhNgrESGUq0BaOeivaOkqrdAj8hAnx6fsTf2bu6nXVnxUdgRH/AAEZtcO?=
 =?us-ascii?Q?TVg/tZvo4SblWEsFsB2FzxZI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf26299-80ed-4db8-14b8-08d9117c77d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 17:20:53.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Mx27YtMdGW2Hm/YegbfJ6fcqGgNLxs5oAB310hJB3nSKzK+0j9I8qb7fLXjXAmJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0204
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

On Thu, May 06, 2021 at 09:32:40AM -0700, Raj, Ashok wrote:

> For platforms that support ENQCMD, it is required to mandate PASIDs are
> global across the entire system. Maybe its better to call them gPASID for
> guest and hPASID for host. Short reason being gPASID->hPASID is a guest
> wide mapping for ENQCMD and not a per-RID based mapping. (We covered that
> in earlier responses)

I don't think it is actually ENQCMD that forces this, ENQCMD can use a
per-RID PASID in the translation table as well.

You get forced here only based on the design of the vIOMMU
communication channel. If the guest can demand any RID is attached to
a specific guest determined PASID then the hypervisor must accommodate
that.

> > Which would be a different behavior than something like Intel's top
> > level IOASID that doesn't claim all the PASIDs.
> 
> isn't this simple, if we can say ioasid allocator can provide 
> 
> - system wide PASID
> - RID local PASID
> 
> Based on platform capabilities that require such differentiation?

I think at the uAPI level the callpaths that require allocating a
PASID from a group of RIDs should be explicit in their intention and
not implicitly rely on a certain allocator behavior.

If you want to get a PASID that can be used with every RID on in your
/dev/ioasid then ask for that exactly.

It makes the uAPI much more understandable to be explicit.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
