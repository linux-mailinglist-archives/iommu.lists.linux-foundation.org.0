Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A9371948
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 18:30:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 957F9404B5;
	Mon,  3 May 2021 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iel5k4gtlKZ4; Mon,  3 May 2021 16:30:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E462404AD;
	Mon,  3 May 2021 16:30:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3032AC001C;
	Mon,  3 May 2021 16:30:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79F1EC0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 16:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545778442A
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCJYwjpnWoLO for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B669B83DBF
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=6WT0OUR3hjtTcavzEdie6Lc7Z9dy98V7OmbCellGUKQ=; b=iSoi3m2KmtK1HP7gIRg1noBzhL
 NtSADOj0t1i5+64Ao6MTgqBy53Oi5hySB1oaSupB48LrYAe6WSHgX3sRePeOmRSBeOalLwq3PjLPe
 o7VWjNhWg9bzTER3go24x5rY4NvcXrNHSG27dPCq8FaviCpfTy6oAmfGHttkYx1zLPVHclNk+ZT3v
 hOI/J3t/5Sqbz+qntMkChEOhBBbxyjMtkPXUOkK/z1Y3q/JFHcnBDRIwMPc/9kvijxshC5QTCuOyS
 SxxEAdJQLddlRqnk0FBt+k4stxyPW+VkbiUafpJFRXjJC94bHUQiCofxZEm+6s4anxL6tsme1AtkS
 LKE4otqA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1ldbSh-00043Q-48; Mon, 03 May 2021 10:30:24 -0600
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-5-logang@deltatee.com>
 <ce04d398-e4a1-b3aa-2a4e-b1b868470144@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <f719ba91-07ba-c703-2dc9-32cb1214e9c0@deltatee.com>
Date: Mon, 3 May 2021 10:30:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ce04d398-e4a1-b3aa-2a4e-b1b868470144@nvidia.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: robin.murphy@arm.com, ira.weiny@intel.com,
 helgaas@kernel.org, jianxin.xiong@intel.com, dave.hansen@linux.intel.com,
 jason@jlekstrand.net, dave.b.minturn@intel.com, andrzej.jakowski@intel.com,
 daniel.vetter@ffwll.ch, willy@infradead.org, ddutile@redhat.com,
 christian.koenig@amd.com, jgg@ziepe.ca, dan.j.williams@intel.com, hch@lst.de,
 sbates@raithlin.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 jhubbard@nvidia.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 04/16] PCI/P2PDMA: Refactor pci_p2pdma_map_type() to take
 pagmap and device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Ekstrand <jason@jlekstrand.net>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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



On 2021-05-02 2:41 p.m., John Hubbard wrote:
> On 4/8/21 10:01 AM, Logan Gunthorpe wrote:
>> All callers of pci_p2pdma_map_type() have a struct dev_pgmap and a
>> struct device (of the client doing the DMA transfer). Thus move the
>> conversion to struct pci_devs for the provider and client into this
>> function.
> 
> Actually, this is the wrong direction to go! All of these pre-existing
> pci_*() functions have a small problem already: they are dealing with
> struct device, instead of struct pci_dev. And so refactoring should be
> pushing the conversion to pci_dev *up* the calling stack, not lower as
> the patch here proposes.
> 
> Also, there is no improvement in clarity by passing in (pgmap, dev)
> instead of the previous (provider, client). Now you have to do more type
> checking in the leaf function, which is another indication of a problem.
> 
> Let's go that direction, please? Just convert to pci_dev much higher in
> the calling stack, and you'll find that everything fits together better.
> And it's OK to pass in extra params if that turns out to be necessary,
> after all.

No, I disagree with this and it seems a bit confused. This change is
allowing callers to call the function with what they have and doing more
checks inside the called function. This allows for *less* checks in the
leaf function, not more checks. (I mean, look at the patch itself, it
puts a bunch of checks in both call sites into the callee and makes the
code a lot cleaner -- it's removing more lines than it adds).

Similar argument can be made with the pci_p2pdma_distance_many() (which
I assume you are referring to). If the function took struct pci_dev
instead of struct device, every caller would need to do all checks and
conversions to struct pci_dev. That is not an improvement.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
