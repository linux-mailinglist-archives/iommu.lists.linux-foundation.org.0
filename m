Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9056945E
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 23:30:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED9B61126;
	Wed,  6 Jul 2022 21:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED9B61126
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=tJ8pa1OC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VysIiieL_mt; Wed,  6 Jul 2022 21:30:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 40B4E61120;
	Wed,  6 Jul 2022 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B4E61120
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD59C0077;
	Wed,  6 Jul 2022 21:30:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05511C002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D364F61120
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 21:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D364F61120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMl7zX6xAT6w for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 21:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B4A61126
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3B4A61126
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=8YduW0eS5FyJqaOqaP8Ime9Kxv0Nz0ax91qwOz8aVq0=; b=tJ8pa1OCY41/griklmW+EWfOVD
 GWRX3NjEHhYKoa1dirAXu9tcLaN+qpf0nzpSUt6AE2hSTAMaGkgPgv4NcYCGYPyn5+QpenS+wTnVf
 dzwHgdTgxI67I3CmK0cMnjTb734bjxbjYx7DQA9orlsLZwJnT7/WMP2dzbiZ7YbAQzYQu/y+kd36E
 NWKd/LUDPN2BcSU2j0kYeELLqOgQTg66ewIFq/UnLnPvN5w4UmYxGdTvEJEsZFKMhHTjiXUcAJU+a
 56SmKOp2xezp85myJotIUFWF91GMeRTiTwry5HfRHn7/M0IWeMCxtQww2OKOWXkI2zuBZnUl0FPwc
 DaJoW4Qg==;
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
 helo=[192.168.11.155]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1o9CbT-008LWu-KY; Wed, 06 Jul 2022 15:30:36 -0600
Message-ID: <e40595f9-f398-d43f-b09d-08d3e88b3950@deltatee.com>
Date: Wed, 6 Jul 2022 15:30:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>
References: <20220705161240.GB13721@lst.de>
 <a509b13c-244b-23fc-f989-339750a733a5@deltatee.com>
 <20220705164315.GB14484@lst.de>
 <acb91f37-0470-8ce4-19e4-426903cbc3a1@deltatee.com>
 <20220705165039.GB14566@lst.de> <YsRzNqmZYlgkL7fI@kroah.com>
 <1bd43ef7-0403-bd25-087c-d54d5af677e4@deltatee.com>
 <YsR4CNDgtt4JWonv@kroah.com>
 <b3deacdd-cb76-6ebb-0e29-ef6a5a426a0d@deltatee.com>
 <20220706065127.GA27132@lst.de> <YsU0Cb0rRbW8FGPX@kroah.com>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <YsU0Cb0rRbW8FGPX@kroah.com>
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: gregkh@linuxfoundation.org, hch@lst.de, jgg@ziepe.ca,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com,
 dan.j.williams@intel.com, christian.koenig@amd.com, jhubbard@nvidia.com,
 ddutile@redhat.com, willy@infradead.org, daniel.vetter@ffwll.ch,
 dave.b.minturn@intel.com, jason@jlekstrand.net, dave.hansen@linux.intel.com,
 jianxin.xiong@intel.com, helgaas@kernel.org, ira.weiny@intel.com,
 robin.murphy@arm.com, martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com,
 rcampbell@nvidia.com, bhelgaas@google.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v7 20/21] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
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



On 2022-07-06 01:04, Greg Kroah-Hartman wrote:
> On Wed, Jul 06, 2022 at 08:51:27AM +0200, Christoph Hellwig wrote:
>> On Tue, Jul 05, 2022 at 12:16:45PM -0600, Logan Gunthorpe wrote:
>>> The current version does it through a char device, but that requires
>>> creating a simple_fs and anon_inode for teardown on driver removal, plus
>>> a bunch of hooks through the driver that exposes it (NVMe, in this case)
>>> to set this all up.
>>>
>>> Christoph is suggesting a sysfs interface which could potentially avoid
>>> the anon_inode and all of the extra hooks. It has some significant
>>> benefits and maybe some small downsides, but I wouldn't describe it as
>>> horrid.
>>
>> Yeah, I don't think is is horrible, it fits in with the resource files
>> for the BARs, and solves a lot of problems.  Greg, can you explain
>> what would be so bad about it?
> 
> As you mention, you will have to pass different things down into sysfs
> in order for that to be possible.  If it matches the resource files like
> we currently have today, that might not be that bad, but it still feels
> odd to me.  Let's see an implementation and a Documentation/ABI/ entry
> first though.

I'll work something up in the coming weeks.

Thanks,

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
