Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D92AA1B4
	for <lists.iommu@lfdr.de>; Sat,  7 Nov 2020 01:15:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF97B85570;
	Sat,  7 Nov 2020 00:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gKyAA4ammsp; Sat,  7 Nov 2020 00:15:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB43D86004;
	Sat,  7 Nov 2020 00:15:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF407C1AD6;
	Sat,  7 Nov 2020 00:15:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97BB3C0889
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 00:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72FEA20448
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 00:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zawi5gBl97Ce for <iommu@lists.linux-foundation.org>;
 Sat,  7 Nov 2020 00:14:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 56F3F20446
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 00:14:59 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h12so2098413qtu.1
 for <iommu@lists.linux-foundation.org>; Fri, 06 Nov 2020 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2xP+5n8avN9R0PMRHtfY/hU7jf10h4hT8Klf4TvQEgQ=;
 b=aokkElWMyWDPsBa6alzqFjXX6Ty/GtCdSx9WukymLV2/BbaYYEQkA6h6NtXkVdapG2
 f4KRlQs9Y+5DAc9+pE/HHKpJIyuCn91sXpwCSZ+08lhM8dAiFiLN7V2xrbpk6hfNSKic
 ieoBgAnzjzjw2iZmefkEtA4fme7kItwUr5LmWc4Urv+NDQjlRSC80EXdjXFB3UnTz0qc
 xUHsKwFfqKXXKxkjKflCvn5HeQw2iywmUCXpbij/QRJ/D8iwlPNvI/Ibqockn0S2v+qQ
 EoTvzw1G3AJLPsWVsVolt0ALyaAOomLE+whBhiXSdjlB8hbwuoItdTWe41htAX37ZvKD
 VHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2xP+5n8avN9R0PMRHtfY/hU7jf10h4hT8Klf4TvQEgQ=;
 b=dN3JpLpdBOOuxeGXpXWZXJ03n+myCHJ3KzwJKv4EJyUSf+CD3tkoNRCimcKTe5+z25
 h4nniTL+W2iMmddD5ggWVDreit4UMMuhXvLlV/Mq/OXRqejwqpa7hhz+bpWbRk9wL4Qk
 ULTXLe7XD1LHHGHzkv15+VE4IQ2/C67rqU1APWyDEuZXnYIcmlXje4B49yVNTQVtxu1a
 R6xRwxTl6ZT5jJuuzPjSsjabXMra8zMyQjZTZ8fBRkWd82J+aHWECe5Aa5SuT3sjQr7H
 PHLUOYv3U38Y7EcyMyVry1KTruJ7aZimeDfrABjtxORIJGXkcR2RAUJS+OH+9IlnltPF
 urMQ==
X-Gm-Message-State: AOAM532zSfua0NpOUq0rLrS3d/kXvFznmwc7qRcPKiaU6Kc6jgXxmmnT
 VnfSHefWiW0C41ugiNB2+ZsTtQ==
X-Google-Smtp-Source: ABdhPJxMxLKgSiQ4x1Of97Fg4BcrbjDaTMOumnt9gw+omdxttGmxoTEsM80CNgLqS0LcZZvrtkPZNw==
X-Received: by 2002:aed:2c02:: with SMTP id f2mr4176029qtd.48.1604708098335;
 Fri, 06 Nov 2020 16:14:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id u5sm1592838qtg.57.2020.11.06.16.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 16:14:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kbBsf-0015Rr-2V; Fri, 06 Nov 2020 20:14:57 -0400
Date: Fri, 6 Nov 2020 20:14:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [RFC PATCH 14/15] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
Message-ID: <20201107001457.GB244516@ziepe.ca>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6a99d54-b33a-0df1-ee33-4aa7a70124a6@deltatee.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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

On Fri, Nov 06, 2020 at 01:03:26PM -0700, Logan Gunthorpe wrote:
> I don't think a function like that will work for the p2pmem use case. In
> order to implement proper page freeing I expect I'll need a loop around
> the allocator and vm_insert_mixed()... Something roughly like:
> 
> for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>         vaddr = pci_alloc_p2pmem(pdev, PAGE_SIZE);
> 	ret = vmf_insert_mixed(vma, addr,
>   		       __pfn_to_pfn_t(virt_to_pfn(vaddr), PFN_DEV | PFN_MAP));
> }
> 
> That way we can call pci_free_p2pmem() when a page's ref count goes to
> zero. I suspect your use case will need to do something similar.

Yes, but I would say the pci_alloc_p2pmem() layer should be able to
free pages on a page-by-page basis so you don't have to do stuff like
the above.

There is often a lot of value in having physical contiguous addresses,
so allocating page by page as well seems poor.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
