Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFB484875
	for <lists.iommu@lfdr.de>; Tue,  4 Jan 2022 20:24:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F5E60C0B;
	Tue,  4 Jan 2022 19:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m89g4Y3mzzSv; Tue,  4 Jan 2022 19:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B1FE060C06;
	Tue,  4 Jan 2022 19:23:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D82AC001E;
	Tue,  4 Jan 2022 19:23:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DEE6C001E
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 19:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630784058A
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 19:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiRICUbGuAlK for <iommu@lists.linux-foundation.org>;
 Tue,  4 Jan 2022 19:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97A64404D4
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 19:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvCS9dKrTOffygMmncz4LO7qpXWNROyh0bOdRomuPqVmeQN3v/Vi9NYxj7/GYeQH6zneapqt99i6sWW735uDh31R9/zK0GD7oScNT3NcwAVJdgGVKrSyuZQSd5rDwIfkbZaHyyyVtZjpUOdcUt2C9gjlxKaAuZLiWyropy7fxT647Nq4JHoJU54ljY2xsQW8+utyydCZydybFmQBVL16IgtrexJCv99qmlixdR5pkILH7Zcs8eu/Cq4YlVDhYEuccGwKg0ou2NR7WwBidrHBL3blcVO0t2i7vtfhqrPGOp0VB24ekAbaHIa9C0goRDRH8qK399wFYx0BLfiBxyNXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRHy8MQEuSpVEht0joaFD8S4eiI30QK65Srxkf0OgeM=;
 b=Tpi4xzfr5KFAtl8hwsfOb0g7LLMRw2Cgjd5PrYUYefiy0GTAza567BL3Lk7LoL1Yh9dxGL8T7n+SKvUkiaVi0vBL6oKw+A3XWTnrzMotj7PqPyYsZka88oRX/k5dBOWIvypxdgo53xp1/w7bh4v/wQl5eqRCCZXpVoTm3OIEusUFFs5xhl5Xxqpb3HomlJEWy/j2l0Gh4FJrwgJ1AMRShtCfdq4CJKThZZayuMtDXUer3YFOuB2qfPUCIX2oZbHBWCA8rtEwqUtqJl5dgtKtqwFF8ekYzmXO/3WhwhJkXs7OQXo5aIaIcLvGlr00EZPZ5t3wxoANAML45kfGqmeGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRHy8MQEuSpVEht0joaFD8S4eiI30QK65Srxkf0OgeM=;
 b=iGtEkPAtb4So2XgzL0SUFs8I7leOaKbrgeyBgzXU+13yW/4sydmgs9Z71P86DKEsNWTUxO6UtZNjm8nSJAwnjkfSzW3a93Ir63HPsp7xcCPAyC3/katF+MdGH2Ib/4QwTrlcocCA2QmR/cHiH1YVebUfO6EF1zAHPopPPsl31BTOFKVLLASI45oznBwfJXDAznZ6JcrxzxGPmpUqyG1ErFDqdIrid/gccmWEfTH4pX2ZDwh1KSJ0Lqy75/xpNArCJ6qfM6dFsOGyDg/ShXOM0B3T9caTmS9XLwn+zXhZiMQW4YiFXv6LM9Eca5HWM5QAR4aeB/qjye7fAQUfxHkFnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) by
 DM6PR12MB5518.namprd12.prod.outlook.com (2603:10b6:5:1b9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.13; Tue, 4 Jan 2022 19:23:51 +0000
Received: from DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::218e:ede8:15a4:f00d]) by DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::218e:ede8:15a4:f00d%4]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 19:23:51 +0000
Date: Tue, 4 Jan 2022 15:23:48 -0400
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 01/14] iommu: Add dma ownership management interfaces
Message-ID: <20220104192348.GK2328285@nvidia.com>
References: <YdQcgFhIMYvUwABV@infradead.org> <20220104164100.GA101735@bhelgaas>
Content-Disposition: inline
In-Reply-To: <20220104164100.GA101735@bhelgaas>
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To DM6PR12MB5520.namprd12.prod.outlook.com
 (2603:10b6:5:208::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9613371-b2eb-4102-ee81-08d9cfb7bd05
X-MS-TrafficTypeDiagnostic: DM6PR12MB5518:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB551815570A515B18599BC477C24A9@DM6PR12MB5518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdEuc4NWhwQwgxmOdupyxagQt3+el3ZTpGf38KNCT/mwvxg+1AR/4wgsGX63YrDZuzF4tlb9b6b3JULc6K3Ifg7mOV6o585C2w7OuUdKbirYo60pDPIELL1teEh91AUzO+y1gsP4ZkvvRxXF9uP4mbHsjtdWpfcNDZQjplPyMUaA4PA66pJRSSEU7wjrwqoeD3kE9v4/DeOSNjzhF/w+TVvx09iM0wC/PbzBZ3tLuODPnbgrVCKVDc1HAHOiMfL0K3YNirnfCXAestWherIsRLXT8z9ClPyLDVDT7Z6R2jsYz2yuL2fWPAvIquYS0Hm3HVp9tGu1szyqmANJEkhf5cRITAHps4nF13KDS2kKPy4jipKPso/9Y1m+wQowCxFhiyw6IDj1yZy4w9esCMJZ/VgdHxjwahfYj0rqfqyURTGM5pePZgPRyAzuTSA5SIIyWIVVzhnhzAXa6Y6+OZntpEZOzwE+AmJEnOwHdam8qkPUBn4JOGBve5Baau+h6D7CSvuoVgn2NpwAKxbReU/j769RmdwAmufuvqJUQEq8mThlQX8S43q/xitfnnH798vt9GCRrnKVCS8YL1R+/kvyg5ClJA04p0mVUD/J+iWWi+Y2t2Rak9bRDuK8rCi20FxiM2vRToBFG8Xptz0F8G0N1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5520.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6666004)(2906002)(316002)(6916009)(186003)(6506007)(33656002)(54906003)(66476007)(38100700002)(6486002)(8676002)(86362001)(2616005)(4326008)(6512007)(5660300002)(66946007)(7416002)(8936002)(26005)(1076003)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rlLGbHsTf8+NtJEaoIrnpKzzu01VN64f2b/FK1sR02TwTSEUKV0+//0MZXEC?=
 =?us-ascii?Q?+n1wUJnK2e/nKRyQDM8+2X32IQzMuebzgm4KjnhcjMIN4F9CQzFhSWju5X1W?=
 =?us-ascii?Q?kaC8cFYOTjgGpdsZt8U4EuczX9ACu0iAopiZALFq7dwTqjeeST0b0tQjHZxl?=
 =?us-ascii?Q?EzdZvbDLXd7hqAKPyo8+eAR/coW5O0Qv9UDJ59Y3ULo2Foun5SkmdvxTe27D?=
 =?us-ascii?Q?JhEOareJkyMzqIDIJNyW8vkqad3My7eu6D2Mf+6CTvpw3sB3ZypAVOcGMwsR?=
 =?us-ascii?Q?oin2P0lGgb1F0GbzYSBeHO3Z/8V34Mu1YaPoM8yy4/MfeQI4p/R088K1Jcqk?=
 =?us-ascii?Q?7k36Lh1SBhU7PFKFMlntjBkFdog/dGkcMFswGZyLULc1yysGxN0u+ri68+n9?=
 =?us-ascii?Q?zY8UNhDa72hl41RhLadRm65j+yVFt5AWc14kVdF6k8VNyIQOT6iztcYqHJO9?=
 =?us-ascii?Q?TXe3QmFLQfJT4lYpPK1KQo56sItb7E1rxNUwjKFIEfZxEaxGoKGCb0m7Mlzy?=
 =?us-ascii?Q?kBCbW4gsKExS2bBHuGjmLuMJ/6i+NjTldOyZtz2i1toUFzaRt2wbPXD9WXqJ?=
 =?us-ascii?Q?OXR7FWhcAUP3BO8javDls7FWdVyyEGm2cXGQWarkjltC2qJPlf+9nczqsxad?=
 =?us-ascii?Q?Ft4fx40A5vdKGx5AkrnkwT8YrESNTeGLxYtYc3VrupDFBMc5gwzu4q2YM+AX?=
 =?us-ascii?Q?P3hQi23oumQMGp0sSVk5DElULdRPHzGtW3fMLCHtpZZWnW+YpLMIVDDMoNcw?=
 =?us-ascii?Q?xJj/BPap3kFjSjuLCJqp/qLWFfdOfZmDvueMg0SHFV9sOi5LIAYXx+myK+/s?=
 =?us-ascii?Q?IkxGp0WzL/Fj6lnLXo17N2fsqnzdDHmK0FLbWi/IsZ8Q8slIlj5KsroshpCx?=
 =?us-ascii?Q?AZ1yA6qsXNASNAXI+fF9KdUeGoEmxeFvj8UDoGDCHeDPhQZbvIF9JylgDEHa?=
 =?us-ascii?Q?tEZ2KVGlBzB0CCQwX0E4fRSxgJjRQ0lnp1D+va2CwQ9dMYDq26Z4vBLtjZUw?=
 =?us-ascii?Q?aT47IJSdotBwn9vo9scCvJ3fC/jCE5cTAAwSd3ZWsfrUqjMWfzdCq8Q4dAnQ?=
 =?us-ascii?Q?KXR79cjXeVkhHuAqe/EjsFAI13U5lljlOqI6J6Ajzdz0RDs4YFgjjfsU/FZQ?=
 =?us-ascii?Q?Ue/ah1zjFSUpZzcrIedU8svnoz8yusfHAfL4Oum4qvw9huDjzv53zqDulWIm?=
 =?us-ascii?Q?Dde3wtQ32owwVBodeO83sjJewRTetZ3G6LygQe/iodsbEeZ8p0Nl6Bw8w6ua?=
 =?us-ascii?Q?0OndZ2G0xQz6zTURLq17/HDNsblcDqq+NE3kyeHD42Pf//Pbawt2xBxq8Ht9?=
 =?us-ascii?Q?s6gGOKD3dgYU3AXbJc4wtO+mkAoGmkopdpOAR8CvjqHM2gT1/xVPObxWDhE+?=
 =?us-ascii?Q?uhH3ZrIJvlgNnsm6s0nxYFc6t5u/rbW4Fh9la74eqKdNbzGB+8bxfwbh/KHj?=
 =?us-ascii?Q?kIbbme7LyKeareDjPQcUWr/CiBPhU4KSHDk/aDiYJK+Dx6tGWzAShN74o35K?=
 =?us-ascii?Q?DhzoSVUIPEsd4suUlk51DeCZIs4mNDednL0V8LeTaJHUcfsaO9rM9ifC44+d?=
 =?us-ascii?Q?m1DC2PtN3MgBxqRZEBc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9613371-b2eb-4102-ee81-08d9cfb7bd05
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5520.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 19:23:51.1413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /al5j0bxvnqaeXXKoLiwn46kgPuRyNdO4yXfkfRF0m6IjxeosYaENy8f2Qoi8DTV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5518
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

On Tue, Jan 04, 2022 at 10:41:00AM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 04, 2022 at 02:08:00AM -0800, Christoph Hellwig wrote:
> > On Tue, Jan 04, 2022 at 09:56:31AM +0800, Lu Baolu wrote:
> > > Multiple devices may be placed in the same IOMMU group because they
> > > cannot be isolated from each other. These devices must either be
> > > entirely under kernel control or userspace control, never a mixture.
> 
> I guess the reason is that if a group contained a mixture, userspace
> could attack the kernel by programming a device to DMA to a device
> owned by the kernel?

There are several of reasons, including what you guess, but for the
design of the series now we can just focus on the group's domain.

If the kernel is using a device then the kernel driver uses the DMA
API and the group's domain must always point to the default domain so
long as a DMA API user exists. Hopefully it is clear to understand

> > > The device driver oriented interfaces are,
> > > 
> > > 	int iommu_device_use_dma_api(struct device *dev);
> > > 	void iommu_device_unuse_dma_api(struct device *dev);
> 
> Nit, do we care whether it uses the actual DMA API?  Or is it just
> that iommu_device_use_dma_api() tells us the driver may program the
> device to do DMA?

As the main purpose, yes this is all about the DMA API because it
asserts the group domain is the DMA API's domain.

There is a secondary purpose that has to do with the user/kernel
attack you mentioned above. Maintaining the DMA API domain also
prevents VFIO from allowing userspace to operate any device in the
group which blocks P2P attacks to MMIO of other devices.

This is why, even if the driver doesn't use DMA, it should still do a
iommu_device_use_dma_api(), except in the special cases where we don't
care about P2P attacks (eg pci-stub, bridges, etc).

> > > The vfio oriented interfaces are,
> > > 
> > > 	int iommu_group_set_dma_owner(struct iommu_group *group,
> > > 				      void *owner);
> > > 	void iommu_group_release_dma_owner(struct iommu_group *group);
> > > 	bool iommu_group_dma_owner_claimed(struct iommu_group *group);
> > > 
> > > The device userspace assignment must be disallowed if the set dma owner
> > > interface returns failure.
> 
> Can you connect this back to the "never a mixture" from the beginning?
> If all you cared about was prevent an IOMMU group from containing
> devices with a mixture of kernel drivers and userspace drivers, I
> assume you could do that without iommu_device_use_dma_api().  So is
> this a way to *allow* a mixture under certain restricted conditions?

It is not about user/kernel, it is about arbitrating the shared
group->domain against multiple different requests to set it to
something else.

Lu, Given that the word 'user' was deleted from the API entirely it
makes sense to reword these commit messages to focus less on user vs
kernel and more on ownership of the domain pointer.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
