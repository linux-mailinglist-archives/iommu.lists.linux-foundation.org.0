Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A63282AA240
	for <lists.iommu@lfdr.de>; Sat,  7 Nov 2020 03:50:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 25AC720465;
	Sat,  7 Nov 2020 02:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g+ox6nRA1QpW; Sat,  7 Nov 2020 02:50:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 521E02045E;
	Sat,  7 Nov 2020 02:50:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 446ECC0889;
	Sat,  7 Nov 2020 02:50:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAA5BC0889
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 02:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A9B1086ACB
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 02:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tc-_NL1t99U8 for <iommu@lists.linux-foundation.org>;
 Sat,  7 Nov 2020 02:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A3C8784AE1
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 02:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60km6xH0HSvahM5c30+DJ4g8BodPX7+0LmwNaM0K8BI=; b=ExYwdc+DkS+fkDeydObiKNmENV
 tHOCg7o9tz01AsRah8P/Sr/9fh7XNjnnO8jUpwDGiiOtI4fzZuc6CUz0kowPjTXWC6ng/SIFsgqYN
 EJHOk3xQTOWZhterUYWYUuqnSOJrTgIRuwbsS0EX7HcK+HPf6oJYHWV5Bct4py7lGeNLo3+V3BDQD
 y5yp6ooOKpOsyzsFqaAIcs+xYoIbgqvVKxiXPkS/46cCAeQ19J2mBvZiqs9XbCzRkYaVcg210o8Hy
 kosgowf22Fkc7d716zpVdUVQa11HzeqnKB3bS3yoy0lNdGfuHQmF/UGjLKyQSo4URkuNgC0n1iHYd
 T4gVkX0w==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1kbEJI-00029J-SL; Fri, 06 Nov 2020 19:50:37 -0700
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20201106172206.GS36674@ziepe.ca>
 <b1e8dfce-d583-bed8-d04d-b7265a54c99f@deltatee.com>
 <20201106174223.GU36674@ziepe.ca>
 <2c2d2815-165e-2ef9-60d6-3ace7ff3aaa5@deltatee.com>
 <20201106180922.GV36674@ziepe.ca>
 <09885400-36f8-bc1d-27f0-a8adcf6104d4@deltatee.com>
 <20201106193024.GW36674@ziepe.ca>
 <03032637-0826-da76-aec2-121902b1c166@deltatee.com>
 <20201106195341.GA244516@ziepe.ca>
 <e6a99d54-b33a-0df1-ee33-4aa7a70124a6@deltatee.com>
 <20201107001457.GB244516@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <6f202b79-fa90-7cda-9ac9-457aa451530f@deltatee.com>
Date: Fri, 6 Nov 2020 19:50:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201107001457.GB244516@ziepe.ca>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: daniel.vetter@ffwll.ch, willy@infradead.org,
 ddutile@redhat.com, jhubbard@nvidia.com, iweiny@intel.com,
 christian.koenig@amd.com, dan.j.williams@intel.com, hch@lst.de,
 sbates@raithlin.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH 14/15] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ira Weiny <iweiny@intel.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Matthew Wilcox <willy@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
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



On 2020-11-06 5:14 p.m., Jason Gunthorpe wrote:
> On Fri, Nov 06, 2020 at 01:03:26PM -0700, Logan Gunthorpe wrote:
>> I don't think a function like that will work for the p2pmem use case. In
>> order to implement proper page freeing I expect I'll need a loop around
>> the allocator and vm_insert_mixed()... Something roughly like:
>>
>> for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>>         vaddr = pci_alloc_p2pmem(pdev, PAGE_SIZE);
>> 	ret = vmf_insert_mixed(vma, addr,
>>   		       __pfn_to_pfn_t(virt_to_pfn(vaddr), PFN_DEV | PFN_MAP));
>> }
>>
>> That way we can call pci_free_p2pmem() when a page's ref count goes to
>> zero. I suspect your use case will need to do something similar.
> 
> Yes, but I would say the pci_alloc_p2pmem() layer should be able to
> free pages on a page-by-page basis so you don't have to do stuff like
> the above.
> 
> There is often a lot of value in having physical contiguous addresses,
> so allocating page by page as well seems poor.

Agreed. But I'll have to dig to see if genalloc supports freeing blocks
in different sizes than the allocations.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
