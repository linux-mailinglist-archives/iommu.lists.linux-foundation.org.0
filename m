Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2E371DBD
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 19:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E5C60692;
	Mon,  3 May 2021 17:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj6AMycqoNvj; Mon,  3 May 2021 17:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C1860658;
	Mon,  3 May 2021 17:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 567AFC0001;
	Mon,  3 May 2021 17:04:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0B21C0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA41C60658
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUTiHZd5KGpA for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 17:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F7C605A0
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=XIo5o0eZ2ybUTNprcEF2/49WtyCaykR1qXGIExijWsM=; b=A4opownLuMAvZjkxn/S5VlDlz4
 qED8iUdb0jEoi6DzG3q5SA7kp8n+oxHLhbgsHmFUrOLUwQFlzg1FKL0fq5PkdsBhHJzqb0XviPegB
 kKRHngxYkYJ0UpPyjCO0lOMylnMndCw8cb5iA/v+hS3jma7ltHNInla8vLysBcmccx983fL/js4MY
 lPvFn13ECitpdcjFVe84V/mNNGwhgHPrgKLAxqbjwODcoPUPBoYb1uT61RMyXvJXAK4g98T3HsqhD
 FQzLgskh7qEpkiRSBuYU5Blwu7PNIvF93A+JxrLASdf+M6KJe0wh6+dC6naKCDSvBhDzOiFHiKtCi
 3JIqatrw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1ldbzZ-0004qY-4w; Mon, 03 May 2021 11:04:21 -0600
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-10-logang@deltatee.com>
 <37fa46c7-2c24-1808-16e9-e543f4601279@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <8de928ab-2842-dac9-07ad-a098124f791f@deltatee.com>
Date: Mon, 3 May 2021 11:04:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <37fa46c7-2c24-1808-16e9-e543f4601279@nvidia.com>
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
Subject: Re: [PATCH 09/16] dma-direct: Support PCI P2PDMA pages in dma-direct
 map_sg
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

Oops missed a comment:

On 2021-05-02 5:28 p.m., John Hubbard wrote:
>>   int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
>>   		enum dma_data_direction dir, unsigned long attrs)
>>   {
>> -	int i;
>> +	struct pci_p2pdma_map_state p2pdma_state = {};
> 
> Is it worth putting this stuff on the stack--is there a noticeable
> performance improvement from caching the state? Because if it's
> invisible, then simplicity is better. I suspect you're right, and that
> it *is* worth it, but it's good to know for real.

I haven't measured it (it would be hard to measure), but I think it's
fairly clear here. Without the state, xa_load() would need to be called
on *every* page in an SGL that maps only P2PDMA memory from one device.
With the state, it only needs to be called once. xa_load() is cheap, but
it is not that cheap.

There's essentially the same optimization in get_user_pages for
ZONE_DEVICE pages. So, if it is necessary there, it should be necessary
here.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
