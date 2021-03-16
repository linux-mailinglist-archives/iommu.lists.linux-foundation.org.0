Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239E33D852
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 16:55:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48006F649;
	Tue, 16 Mar 2021 15:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4WM2UTTltOh; Tue, 16 Mar 2021 15:55:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041696F641;
	Tue, 16 Mar 2021 15:55:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC426C000F;
	Tue, 16 Mar 2021 15:55:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDE0DC000A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D81CC4EC90
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkSMaqc_RokX for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 15:55:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 264294EBF4
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=oFF8o/RVegrG3G5YG5dTK44WOWDv57bdoGVgR2ktNWc=; b=dsqiw2UqRHpc2m6czITifyPazC
 l3KC3T9j57KTF3XoWiyV+LPgw4lbLtgOWKdd598bgRLfvrtkF2yuQDTcMKhGG9vB+KiBIJHVKMqOo
 mz5L+MEsdNsRbgo0gzz/8XPLL0CEathKtt+ZC61Qu6pAMYwbwCzqpb34Hfj+pEJnqN+lbJ6lzm9Ih
 wMlXJ7CnBmVPIFSao3qYHQjM/uSXXdMUZqbGyOWB+ccwh0ZmHoBC+XWjsMT4ETu8VxhHGEnyC4uu8
 9v/yv+i4wmpSzCRFdT+0I+6inCilQdZbbQP3yiENwxiLiBsWDTPHNXrs7QPi+fZVB9gawHTLngfEt
 /Q9Irqsg==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lMC27-00012D-3W; Tue, 16 Mar 2021 09:54:59 -0600
To: Christoph Hellwig <hch@lst.de>
References: <20210311233142.7900-1-logang@deltatee.com>
 <20210311233142.7900-7-logang@deltatee.com>
 <215e1472-5294-d20a-a43a-ff6dfe8cd66e@arm.com>
 <d7ead722-7356-8e0f-22de-cb9dea12b556@deltatee.com>
 <a8205c02-a43f-d4e8-a9fe-5963df3a7b40@arm.com>
 <367fa81e-588d-5734-c69c-8cdc800dcb7e@deltatee.com>
 <20210316075821.GB15949@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <093b77cb-e8b1-c8a8-620b-ab36cdb7f3cc@deltatee.com>
Date: Tue, 16 Mar 2021 09:54:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316075821.GB15949@lst.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: jianxin.xiong@intel.com, andrzej.jakowski@intel.com,
 sbates@raithlin.com, dan.j.williams@intel.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, jgg@ziepe.ca, christian.koenig@amd.com,
 willy@infradead.org, dave.hansen@linux.intel.com, jhubbard@nvidia.com,
 dave.b.minturn@intel.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 robin.murphy@arm.com, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH v2 06/11] dma-direct: Support PCI P2PDMA pages in
 dma-direct map_sg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, linux-pci@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Matthew Wilcox <willy@infradead.org>,
 Jason Ekstrand <jason@jlekstrand.net>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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



On 2021-03-16 1:58 a.m., Christoph Hellwig wrote:
> On Fri, Mar 12, 2021 at 11:27:46AM -0700, Logan Gunthorpe wrote:
>> So then we reject the patches that make that change. Seems like an odd
>> argument to say that we can't do something that won't cause problems
>> because someone might use it as an example and do something that will
>> cause problems. Reject the change that causes the problem.
> 
> No, the problem is a mess of calling conventions.  A calling convention
> returning 0 for error, positive values for success is fine.  One returning
> a negative errno for error and positive values for success is fine a well.
> One returning 0 for the usual errors and negativ errnos for an unusual
> corner case is just a complete mess.

Fair enough. I can try implementing a dma_map_sg_p2p() roughly as Robin
suggested that has a more reasonable calling convention.

Most of your other feedback seems easy enough so I'll address it in a
future series.

Thanks,

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
