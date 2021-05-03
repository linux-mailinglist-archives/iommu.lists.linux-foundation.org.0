Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6A371DBE
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 19:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1183D40EB0;
	Mon,  3 May 2021 17:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vuc9eMgfLNjX; Mon,  3 May 2021 17:06:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044CB40EB3;
	Mon,  3 May 2021 17:06:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C92BBC001C;
	Mon,  3 May 2021 17:06:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C940C0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B19740EB3
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6SsMpfuO_Ps for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 17:06:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9ADD40EB0
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=WB2BFEGNYO0DIiKQ7JhTxvJPDMwGp3muQhOssHP9UL0=; b=dDTy/SRhXjKaPCQWTjtyGkzIXz
 L+5aXPYOXJFX/vzhqTUEvlHVk3nFr8UGmdqpKSDkYliw+ysfyGSOqaGrtbPwyRjFwob8n3y9wigi9
 Zl8BxPlH0yJ+PzbWpgvKPKQS98GCRTyXpn+eVtfXwsrPjQBPAPntrbhx6T5W+Kpxf5bZhnwUaPkAG
 ++hsd/+nGCa9jsMKPQjpg0vJf9dFGZPO2LJgKzlZ6TDWnRf4ACzVugXtJj31oEDdJPDVXsne85+3t
 NGcnOfrWi9lffb/ksw/nsFJghwSzqipzDuI1Q1PBz31x+/96qT0qbm4RHxKGSCMaEVx5Fu4d5LH/4
 SdHnJy+A==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1ldc1m-0004sS-74; Mon, 03 May 2021 11:06:39 -0600
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-10-logang@deltatee.com>
 <37fa46c7-2c24-1808-16e9-e543f4601279@nvidia.com>
 <f2ac9584-6133-cd3d-e9a0-bff20adfb23e@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <f4c4d197-a0b8-2238-d6ea-af4c67e43da3@deltatee.com>
Date: Mon, 3 May 2021 11:06:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f2ac9584-6133-cd3d-e9a0-bff20adfb23e@nvidia.com>
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



On 2021-05-02 5:32 p.m., John Hubbard wrote:
> On 5/2/21 4:28 PM, John Hubbard wrote:
>> On 4/8/21 10:01 AM, Logan Gunthorpe wrote:
> ...
>>> @@ -387,19 +388,37 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
>>
>> This routine now deserves a little bit of commenting, now that it is
>> doing less obvious things. How about something like this:
>>
>> /*
>> * Unmaps pages, except for PCI_P2PDMA pages, which were never mapped in the
>> * first place. Instead of unmapping PCI_P2PDMA entries, simply remove the
>> * SG_PCI_P2PDMA mark
>> */
> 
> I got that kind of wrong. They *were* mapped, but need to be left mostly
> alone...maybe you can word it better. Here's my second draft:
> 
> /*
>   * Unmaps pages, except for PCI_P2PDMA pages, which should not be unmapped at
>   * this point. Instead of unmapping PCI_P2PDMA entries, simply remove the
>   * SG_PCI_P2PDMA mark.
>   */
> 
> ...am I getting close? :)

I don't think your original comment was wrong per se. But I guess it
depends on your definition of "mapped". In dma-direct the physical
address is added to the SGL and, on some arches, the address has to be
synced on unmap. With P2PDMA, the PCI bus address is sometimes added to
the SGL and no sync is necessary at the end.

Logan

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
