Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89B4C0595
	for <lists.iommu@lfdr.de>; Wed, 23 Feb 2022 00:54:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C837E81248;
	Tue, 22 Feb 2022 23:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_sviIyerCWU; Tue, 22 Feb 2022 23:54:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A9CAE80D04;
	Tue, 22 Feb 2022 23:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6304BC0073;
	Tue, 22 Feb 2022 23:54:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1876DC0011
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 23:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECC6B408C9
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 23:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNZ1vXUXVP3t for <iommu@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 23:53:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E0F54089A
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 23:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+DK+cYBzujfz8NGkohVIpEmFrRXYfSsW4nAApH+kTXGvNxqty+eGqZjBFYg2+5qD4H/ysjYX4K5I8gTsgoltkJvp/34J47fNzKHcJWUc3BJIXAYAYCL1VKFN5+1J7zV1AVuxOiqtW/8pbzb+7H/Ej1Ommq1QNmwxdG6un6t4xcpFthZZr9NtDkEKn7QXa9Uvn4BsP2/5MQGHV7PKgu/TkFXWvkiYzEd9IZHYSaj14jQitdcC4U7gUFEiMcN3VEE0M0jmS0xKtaAU6YVyVqWlrsBWRSY4jha+6shVr0GqHS30oN0o5H9dHjbG3cGmY4uccvbZqhD6TpywmxW+mhnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M+HmnzoZWRa4HlG15PGqC0YemS28TE2kd/KpiCg5fo=;
 b=VykgX3+uT3REnpqaLP8jVua3uUWZUeEhQQezljhy9BXutKN1OmvdIqbE7ssM7AsCPqWbof0hAsvRY8HotDHZoqyXNy4YtN/DYYNYT+Lneew7aEIV+YbGFol5OH3sk1SaZkBCVLm0x3WdZkGhptQ8t3y5BcU4OLp2/fM74uDY/qsJTacqlgw42YQy/8U8qhQ8A3jBagBRyIGumJUS+gFDxoRqDYCAXGD/LH7yy0nS1WXYH4f8pwjC0VCIg9b84VcsJdrePa5O/Z6i+jX0ViwotbVj6FbJqfUo6LmxYra/PGC40/1uSJcqlXf/FVGsocqhHBl+RiRCvywFDvDvJgQBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8M+HmnzoZWRa4HlG15PGqC0YemS28TE2kd/KpiCg5fo=;
 b=bPnHqGpSi6tNsEGk4M+9CVzA2dHL8durKb30k2KbeXbTNBFhPPPsJaE2cETS7wnOuEeA7LFd+3JTLN9vTXoNtDfHbXh/iSZZrLSU+WVPe6VBkGfrJu7+WML0Y6J9W4p02qxLwZYFtUmDWBImVFOO0P2oiT+VB860YfU5MMaTKVtj1Mmcc3WQkz5joIzoGnKwSGQkK6fZU/vTny4KEBF1ST8ZXNWHNiS5SD3XSubiCNCasQzBo0+YsM+jDyb5m86E8h6egqUlJATnqN20yAvdYLQ/8mFg3f4ewWEKPGiMni+Wbqh36ba8qFRSu6AcbALfVG4wpXbNQ1ipDOiJsdj3GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4530.namprd12.prod.outlook.com (2603:10b6:5:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 23:53:54 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.5017.022; Tue, 22 Feb 2022
 23:53:54 +0000
Date: Tue, 22 Feb 2022 19:53:53 -0400
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v6 02/11] driver core: Add dma_cleanup callback in bus_type
Message-ID: <20220222235353.GF10061@nvidia.com>
References: <20220218005521.172832-1-baolu.lu@linux.intel.com>
 <20220218005521.172832-3-baolu.lu@linux.intel.com>
 <YhCdEmC2lYStmUSL@infradead.org>
 <1d8004d3-1887-4fc7-08d2-0e2ee6b5fdcb@arm.com>
 <20220221234837.GA10061@nvidia.com>
 <1acb8748-8d44-688d-2380-f39ec820776f@arm.com>
 <20220222151632.GB10061@nvidia.com>
 <3d4c3bf1-fed6-f640-dc20-36d667de7461@arm.com>
Content-Disposition: inline
In-Reply-To: <3d4c3bf1-fed6-f640-dc20-36d667de7461@arm.com>
X-ClientProxiedBy: BL1PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff3d9fe-7a3f-4e53-7022-08d9f65e9553
X-MS-TrafficTypeDiagnostic: DM6PR12MB4530:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4530936D84017B3708C27D3DC23B9@DM6PR12MB4530.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Au9nbpJe6F41A28C7gBSWhPfQeWTLlhcSh6TGJeaJlqpA3iYTv31wHFl4FF6cb+0ZxeRmRnS6QUgaNOc+5UBIxSqYAjHZ+tvQeZxWql31Q+zsE0PyMm2c/j6crhm4IHhflURhr1yjeD012Opyw3qW+aHt38ynlO9hJZ1X0nJ40/G27zEki6nfO84s2aU4O5cf0n4n5z+pyrpXZ0Yf2iAGKPwLDd9LMoZgqUTBixmZHJ+mkm+NUZ94rExQD97VoCK+ks7vZH4Ho3hKGwHRbtMV4QiK6avR1RWRu4LLFRFJtP221OqAWloEHroyiyp0aYI/qAhoXLqQXw40ENfL56vR6jZRtAnEU9hRlSW/O6FL6AUYqoNJKXLgshsUkyRWr7B7Pq4exptdxGGFB5N79nmhKrMWeVRouyJsnOVnCmn5bsv2BxLCoPXHSh7hKa4ogXf/b7PFIv7osEGmXJx2mC8MHNG7Vc+q8S5ograDKYwkB/5xgJ4yx0rX3JhWtohgwAcFw6TQ5HNFrnmAZ5UBK8QelVu3rFMXkW5/I5AHcEvSjDueB3loPIriMy1samQhI7HA5+90tF7xJgic7Ao+kC0sMXPB9TBatGxvRQ5tti21Jg6qbiY19PwMZh7e3t1Gb5UH9khTlLXxf9zuZlW1b9Ulg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(33656002)(26005)(1076003)(86362001)(2616005)(6512007)(6506007)(38100700002)(54906003)(316002)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(5660300002)(83380400001)(6486002)(7416002)(8936002)(508600001)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OH7hIyzT1UvFIHsnkQ1DaCEe91FbgBJviWTHTJ9aSZwCKAknI5hxrrpCUw3G?=
 =?us-ascii?Q?Gp8xOX6k11ZU8yNhNKNnhGJD6BzyRN1Ou/11O61IbAPlm4ASCa9SHn5XjIlg?=
 =?us-ascii?Q?dmOLuE0gb/dV6dZjMc34fdnfg2HAWe5x2qxTQhWP8TMvAmEFGTP5CqUx5rFo?=
 =?us-ascii?Q?g+pUIeknTfuX0DC7OLOfOg8JUpLzRkImgwqNObBQ+S4CY5DUwErXQX2lxA76?=
 =?us-ascii?Q?//2UGQaCJLB7bFMS7/V3FPUS8ZtjKLmsHKhPXaocVihBjBB/K0eLAzjDGZna?=
 =?us-ascii?Q?fVBscssq5F0I/Nv7i50nSte6O8ecN5UEmXkztQgSk6okdc7d1kiGBXw+maGH?=
 =?us-ascii?Q?Kr2IP6o+XOVZc7yN2tCP1Rv61mlDRzr+FLeklD78VoiuU4usK5jZCIdrSTwH?=
 =?us-ascii?Q?cNiS7O+eXS9q94Yyk3vSO69rEdVGGcpChMlQZK0bYKSKbjilTS8QWt3CImWK?=
 =?us-ascii?Q?6j1u62bbAYFYl4idUS3Cz2js3bbAGutuCdcxOGgrrRqAu9I+WIyKK/Zy3XcA?=
 =?us-ascii?Q?dajUBsM2/jCzEzT8Hhyt+UEUKrulKx2JpmMpKOgB8hs0Jhad/Y955WRaYEaY?=
 =?us-ascii?Q?WdYgVR0iNli3oTtdua9QHaD4y73OU2YffRTHIh2D3SN5+neGC3BDBxGPjWU+?=
 =?us-ascii?Q?M/BAncbfRJcUIj5vOEzi7t5LLw3v7BvmpYU1sSNEgf+kjuj9TwGqUyiwP8yf?=
 =?us-ascii?Q?kkM9pXB+8ErUg9Phr10nEcI27PS+24cW1C9TCdjI2veMQsuHDECIET84Ogri?=
 =?us-ascii?Q?q8K0Owf7LvmtG7MpuKPNL91ehUtTr2rpBSO5OKA8SBGYYeFYwu7IQIpXQfYs?=
 =?us-ascii?Q?glTg7tuqubrkvqkHUD8CmuZS9wRQ4efG7j0C4YdK6LcxZh9psKDEDUJR1vSW?=
 =?us-ascii?Q?6xg5ARM6tKpBJDkg5lq3fs1yU/bidmbKuRZXnl+zlS66GkKSXYOfvSgqdkw4?=
 =?us-ascii?Q?stGMx5+CC8gaMwBVBLEUgHcqBJU1wSCmB0Sd6EKNYpvK8KqU5nXTnfwVI6cA?=
 =?us-ascii?Q?9aY8oUAdP/w/W3n4C8kpP+jEXcd47ldKc4ezKz7pVEYRXdJM+3EQA8GiWT0Y?=
 =?us-ascii?Q?wey63rDUq9WtKr8n5ZF0E/9ywNqp3ONIAancRFOcEOZzb6TQz1kMyf89kTSF?=
 =?us-ascii?Q?w1QexmDkEYEinNcGpIPVEstSJJBzMV7FQXt/N+VNu7T+sYQ5vOuWUyu1sAlx?=
 =?us-ascii?Q?N9qOhJnhTaLfz8kkTyTt4/gdzelFy4nc6WRl0ruQOOGa6FaZWgB8ow507i3a?=
 =?us-ascii?Q?PcQXNhL8i101zKxjmHSqenLixEAboC8akDUGwITf7gmrYV8uLe7lZcbTxfl8?=
 =?us-ascii?Q?GvFi4E35Ch4NjrCp0Dn1EFVbJzRWw5ZSXp1Pgfp1+ASTRna00q1dxtdVOKU2?=
 =?us-ascii?Q?Yo/49HQxHUbuAilTddvCaQ+cD9aFiOoq+7W4xUkLvuSgHSVbd5xZJcKpoI5O?=
 =?us-ascii?Q?0kbgim4aKpzklJt3A82G4NJR4sQ37MBpDS6T6mINoh/3njJB98XQJfsNCoMq?=
 =?us-ascii?Q?X8FukLJykv1eFB5tYSOVKwoAfqNKialM2TnubrzsrFVn8747ZVPQIRPrBcKK?=
 =?us-ascii?Q?ykwQxELrSVNkmkNfvU4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff3d9fe-7a3f-4e53-7022-08d9f65e9553
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 23:53:54.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/9ErF1ElRBXZJhF723qTDjnImUxvcMsCVC+/4Qbt0X0N3eMjbXM8i40jvCnEpvW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4530
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Stuart Yoder <stuyoder@gmail.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Feb 22, 2022 at 09:18:23PM +0000, Robin Murphy wrote:

> > Still not sure I see what you are thinking though..
> 
> What part of "How hard is it to hold group->mutex when reading or writing
> group->owner?" sounded like "complex lockless algorithm", exactly?

group->owner is not the issue, this series is already using the group
lock to protect the group_cnt and owner.

It is how you inspect the struct device it iterates over to decide if
it is still using the DMA API or not that is the problem. Hint: this
is why I keep mentioning the device_lock() as it is the only locking we
for this today.

> To spell it out, the scheme I'm proposing looks like this:

Well, I already got this, it is what is in driver_or_DMA_API_token()
that matters

I think you are suggesting to do something like:

   if (!READ_ONCE(dev->driver) ||  ???)
       return NULL;
   return group;  // A DMA_API 'token'

Which is locklessly reading dev->driver, and why you are talking about
races, I guess.

> remove:
>        bool still_owned = false;
>        mutex_lock(group->mutex);
>        list_for_each_entry(tmp, &group->devices, list) {
>                void *owner = driver_or_DMA_API_token(tmp);
>                if (tmp == dev || !owner || owner != group->owner)

And here you expect this will never be called if a group is owned by
VFIO? Which bakes in that weird behavior of really_probe() that only
some errors deserve to get a notifier?

How does the next series work? The iommu_attach_device() work relies
on the owner_cnt too. I don't think this list can replace it there.

> always serialised, even if the list walk in the remove hook sees "future"
> information WRT other devices' drivers, at worst it should merely short-cut
> to a corresponding pending reclaim of ownership.

Depending on what the actual logic is I could accept this argument,
assuming it came with a WRITE_ONCE on the store side and we all
thought carefully about how all this is ordered.

> Because the current alternative to adding a few simple lines to dd.c is
> adding loads of lines all over the place to end up calling back into common
> IOMMU code, to do something I'm 99% certain the common IOMMU code
> could do

*shrug* both Christoph and I tried to convince Greg. He never really
explained why, but currently he thinks this is the right way to design
it, and so here we are.

> for itself in private. That said, having worked through the above, it does
> start looking like a bit of a big change for this series at this point, so
> I'm happy to keep it on the back burner for when I have to rip
> .dma_configure to pieces anyway.

OK, thanks.

> According to lockdep, I think I've solved the VFIO locking issue provided
> vfio_group_viable() goes away, so I'm certainly keen not to delay that for
> another cycle!

Indeed.

Keep in mind that lockdep is disabled on the device_lock()..

> paragraph quoted above again. I'm not talking about automatic DMA API
> claiming, that clearly happens per-device; I'm talking about explicit
> callers of iommu_group_claim_dma_owner(). Does VFIO call that multiple times
> for individual devices? No. Should it? No. Is it reasonable that any other
> future callers should need to? I don't think so. Would things be easier to
> reason about if we just disallowed it outright? For sure.

iommufd is device centric and the current draft does call
iommu_group_claim_dma_owner() once for each device. It doesn't have
any reason to track groups, so it has no way to know if it is
"nesting" or not.

I hope the iommu_attach_device() work will progress and iommufd can
eventualy call a cleaner device API, it is setup to work this way at
least.

So, yes, currently future calls need the owner_cnt to work right.
(and we are doing all this to allow iommufd and vfio to share the
ownership logic - adding VFIO-like group tracking complexity to
iommufd to save a few bus callbacks is not a win, IMHO)

> > It has already been 8 weeks on this point, lets just move on please.
> 
> Sure, if it was rc7 with the merge window looming I'd be saying "this is
> close enough, let's get it in now and fix the small stuff next cycle".
> However while there's still potentially time to get things right first time,
> I for one am going to continue to point them out because I'm not a fan of
> avoidable churn. I'm sorry I haven't had a chance to look properly at this
> series between v1 and v6, but that's just how things have been.

Well, it is understandable, but this was supposed to be a smallish
cleanup series. All the improvments from the discussion are welcomed
and certainly did improve it, but this started in November and is
dragging on..

Sometimes we need churn to bring everyone along the journey.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
