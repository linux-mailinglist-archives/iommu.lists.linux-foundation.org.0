Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADA41CE5C
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 23:47:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FBC83D7B;
	Wed, 29 Sep 2021 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RuZPhIFUDC0H; Wed, 29 Sep 2021 21:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ABD8E83B29;
	Wed, 29 Sep 2021 21:47:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74F64C0022;
	Wed, 29 Sep 2021 21:47:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9E0FC000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 21:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B17B940215
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 21:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9zaa7B5OR37 for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 21:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D190400DA
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=E0+dWT8gAeYt6sxwFEz+vMLQHximHDqyya3XwSsMquA=; b=B1+ojUPj4nQ9gfTcjrhn2ItoGQ
 aINPbvBXV9Nds1L0hVw7x1w9p2f358U5Fu3wsB7LxIEcnVMidcZxVp9bnuYVbm+woQWShpT40RVzU
 OWcloGv5IVDL4LO1/uqKO7qJp8yyXESOWL5Pk908ezjO+8d79gGLYr04akWdskoQQITHB9DMMIHmA
 92BxFHqUONXLFywx+DHgJ56IhJUbz68+CmbfX8Rw8Ao+P9/K4WRFREHY1Dgj8ZBtJ3HAi1EpCtHUm
 l5AU9JEaCtAhOL0zCRMIIQj6PRFACLBxlb8WUFdKUs9k94DRCRe5C1KpsFdiatomWcFHdJ3AjXAfr
 abJCdzRA==;
Received: from s0106a84e3fe8c3f3.cg.shawcable.net ([24.64.144.200]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1mVhPY-0006ZO-78; Wed, 29 Sep 2021 15:46:45 -0600
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20210916234100.122368-1-logang@deltatee.com>
 <20210916234100.122368-20-logang@deltatee.com>
 <20210928200506.GX3544071@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <3dfbfb6c-321c-f717-8adf-a37956f15678@deltatee.com>
Date: Wed, 29 Sep 2021 15:46:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928200506.GX3544071@ziepe.ca>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 24.64.144.200
X-SA-Exim-Rcpt-To: ckulkarnilinux@gmail.com, martin.oliveira@eideticom.com,
 robin.murphy@arm.com, ira.weiny@intel.com, helgaas@kernel.org,
 jianxin.xiong@intel.com, dave.hansen@linux.intel.com, jason@jlekstrand.net,
 dave.b.minturn@intel.com, andrzej.jakowski@intel.com, daniel.vetter@ffwll.ch,
 willy@infradead.org, ddutile@redhat.com, jhubbard@nvidia.com,
 christian.koenig@amd.com, dan.j.williams@intel.com, hch@lst.de,
 sbates@raithlin.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v3 19/20] PCI/P2PDMA: introduce pci_mmap_p2pmem()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
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
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
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




On 2021-09-28 2:05 p.m., Jason Gunthorpe wrote:
> On Thu, Sep 16, 2021 at 05:40:59PM -0600, Logan Gunthorpe wrote:
> 
>> +static void pci_p2pdma_unmap_mappings(void *data)
>> +{
>> +	struct pci_dev *pdev = data;
>> +	struct pci_p2pdma *p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
>> +
>> +	p2pdma->active = false;
>> +	synchronize_rcu();
>> +	unmap_mapping_range(p2pdma->inode->i_mapping, 0, 0, 1);
>> +	pci_p2pdma_free_mappings(p2pdma->inode->i_mapping);
>> +}
> 
> If this is going to rely on unmap_mapping_range then GUP should also
> reject this memory for FOLL_LONGTERM..

Right, makes sense.

> 
> What along this control flow:
> 
>> +       error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_unmap_mappings,
>> +                                        pdev);
> 
> Waits for all the page refcounts to go to zero?

That's already in the existing code as part of memunmap_pages() which
puts the original reference to all the pages and then waits for the
reference to go to zero.

This new action unmaps all the VMAs so that the subsequent call to
memunmap_pages() doesn't block on userspace processes.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
