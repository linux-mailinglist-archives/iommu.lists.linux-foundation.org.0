Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C92ABE25
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 15:02:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 493AF85FEB;
	Mon,  9 Nov 2020 14:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE8qmGsCzeuj; Mon,  9 Nov 2020 14:02:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C232B85FE6;
	Mon,  9 Nov 2020 14:02:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3BE5C016F;
	Mon,  9 Nov 2020 14:02:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB2DC016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 14:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 195A787009
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 14:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mL7RFNgHUx3B for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 14:02:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4B9FA86FFC
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 14:02:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C77E31B;
 Mon,  9 Nov 2020 06:02:25 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383D53F719;
 Mon,  9 Nov 2020 06:02:23 -0800 (PST)
Subject: Re: [RFC PATCH 04/15] lib/scatterlist: Add flag for indicating P2PDMA
 segments in an SGL
To: Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>
References: <20201106170036.18713-1-logang@deltatee.com>
 <20201106170036.18713-5-logang@deltatee.com> <20201109091258.GB28918@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <491c26de-bda0-3266-a67d-ee2580559a54@arm.com>
Date: Mon, 9 Nov 2020 14:02:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109091258.GB28918@lst.de>
Content-Language: en-GB
Cc: John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ira Weiny <iweiny@intel.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Stephen Bates <sbates@raithlin.com>, linux-block@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org,
 linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-11-09 09:12, Christoph Hellwig wrote:
> On Fri, Nov 06, 2020 at 10:00:25AM -0700, Logan Gunthorpe wrote:
>> We make use of the top bit of the dma_length to indicate a P2PDMA
>> segment.
> 
> I don't think "we" can.  There is nothing limiting the size of a SGL
> segment.

Right, the story behind ab2cbeb0ed30 ("iommu/dma: Handle SG length 
overflow better") comes immediately to mind, for one. If all the P2P 
users can agree to be in on the game then by all means implement this in 
the P2P code, but I don't think it belongs in the generic top-level 
scatterlist API.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
