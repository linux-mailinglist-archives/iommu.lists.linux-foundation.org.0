Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557653BD8F
	for <lists.iommu@lfdr.de>; Thu,  2 Jun 2022 19:49:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2665B60B64;
	Thu,  2 Jun 2022 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmk36zjjQRaS; Thu,  2 Jun 2022 17:49:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1BB7D60B51;
	Thu,  2 Jun 2022 17:49:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E771FC002D;
	Thu,  2 Jun 2022 17:49:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBBBDC002D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jun 2022 17:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B52EF81763
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jun 2022 17:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFmSencKeP9G for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jun 2022 17:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 234FF81371
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jun 2022 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=iyck+wOifMpSZlLxRfCrWDgusCm3mWKdpT17Ia+B9wY=; b=rnaKQUhn8m0zyN0RqZEYQDjsXS
 bQq3WwRpeKjVK1qMYZK6mfxOtb/vSCH4EYY+RMt8unUUNIFPAn8qkWOpu0WY8P+7ycxavtU8c1x42
 GL4bMz3u3uliqUKkk/rKHRiF6ip5UbjhpBdiEMfIJ6nrjfPr/5Sq6euvL6HgLOAijk7z3HlBHP7ls
 pcXQ0r9j5pF9NW3clGalNpKN8L7zkm/dgY51Cgy5nTN+GYoKstvVBkAR/a/aEoyXotFUOBWnP/yvp
 eUKOoQvmroULemDQpPRn3ppgTUJ3ZUx9YNJrBF5YBjbqtvmxd7j82k4fvWwyzEA+XJ6DtYonhy2aI
 X2SqWSig==;
Received: from s0106a84e3fe8c3f3.cg.shawcable.net ([24.64.144.200]
 helo=[192.168.0.10]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1nwoww-00EP6z-6D; Thu, 02 Jun 2022 11:49:35 -0600
Message-ID: <251c6028-c53a-28dd-2bbf-d5c8ec2496b3@deltatee.com>
Date: Thu, 2 Jun 2022 11:49:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-CA
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220407154717.7695-1-logang@deltatee.com>
 <20220407154717.7695-21-logang@deltatee.com>
 <20220527125501.GD2960187@ziepe.ca>
 <a2590e27-41e8-59dc-3576-b5b8d716a198@deltatee.com>
 <20220527190307.GG2960187@ziepe.ca>
 <d336cfe8-2451-04c3-a2ce-0e8e47afd1e3@deltatee.com>
 <20220602000038.GK2960187@ziepe.ca>
 <400baba7-1cd6-09d4-4de9-2a73f08afc79@deltatee.com>
 <20220602163059.GL2960187@ziepe.ca>
 <51cc6645-2504-6d01-5626-238ed6ffff04@deltatee.com>
 <20220602172811.GN2960187@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20220602172811.GN2960187@ziepe.ca>
X-SA-Exim-Connect-IP: 24.64.144.200
X-SA-Exim-Rcpt-To: jgg@ziepe.ca, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 dan.j.williams@intel.com, christian.koenig@amd.com, jhubbard@nvidia.com,
 ddutile@redhat.com, willy@infradead.org, daniel.vetter@ffwll.ch,
 andrzej.jakowski@intel.com, dave.b.minturn@intel.com, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, jianxin.xiong@intel.com, helgaas@kernel.org,
 ira.weiny@intel.com, robin.murphy@arm.com, martin.oliveira@eideticom.com,
 ckulkarnilinux@gmail.com, rcampbell@nvidia.com, bhelgaas@google.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v6 20/21] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
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



On 2022-06-02 11:28, Jason Gunthorpe wrote:
> On Thu, Jun 02, 2022 at 10:49:15AM -0600, Logan Gunthorpe wrote:
>>
>>
>> On 2022-06-02 10:30, Jason Gunthorpe wrote:
>>> On Thu, Jun 02, 2022 at 10:16:10AM -0600, Logan Gunthorpe wrote:
>>>
>>>>> Just stuff the pages into the mmap, and your driver unprobe will
>>>>> automatically block until all the mmaps are closed - no different than
>>>>> having an open file descriptor or something.
>>>>
>>>> Oh is that what we want?
>>>
>>> Yes, it is the typical case - eg if you have a sysfs file open unbind
>>> hangs indefinitely. Many drivers can't unbind while they have open file
>>> descriptors/etc.
>>>
>>> A couple drivers go out of their way to allow unbinding while a live
>>> userspace exists but this can get complicated. Usually there should be
>>> a good reason.
>>>
>>> The module will already be refcounted anyhow because the mmap points
>>> to a char file which holds a module reference - meaning a simple rmmod
>>> of the driver shouldn't work already..
>>
>> Also, I just tried it... If I open a sysfs file for an nvme device (ie.
>> /sys/class/nvme/nvme4/cntlid) and unbind the device, it does not block.
>> A subsequent read on that file descriptor returns ENODEV. Which is what
>> I would have expected.
> 
> Oh interesting, this has been changed since years ago when I last
> looked, the kernfs_get_active() is now more narrowed than it once
> was. So manybe sysfs isn't the same concern it used to be!

Yeah, so I really think *not* blocking unbind indefinitely is the better
approach here. It's what has always been done with device dax, etc.
mmaps in userspace processes get unmapped and will fault with SIGBUS on
next access and unbind will actually unbind the device relatively
promptly. Userspace processes can fail or try to handle the device going
away gracefully.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
