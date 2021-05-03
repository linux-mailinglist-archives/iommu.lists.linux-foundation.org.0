Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FEB371E50
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 19:19:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EF1A403FB;
	Mon,  3 May 2021 17:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09TTAuCHcjDK; Mon,  3 May 2021 17:19:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FE8402C7;
	Mon,  3 May 2021 17:19:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 106CBC0001;
	Mon,  3 May 2021 17:19:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AAE7C0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A82140491
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efFlb7kI5iW8 for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 17:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65F5040485
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=Xgskyepw/lHRcKmwXdhV8lu3qVd1TfZZh6M74Jlngas=; b=QqAwmeJngpzHhZ/sdMQj3UlLTL
 rC/1Y3ph6DV1kkJjARvToJ6QRKEfJDGAt2iQpPoawvtTM+fMCs6n5bVz+292DJzzv2C+T87D91M2V
 4wQ42/crm5YKsUUkp1hzvaTN17qEVQ+9oQ5Geo3ecq6vpk8odJrImqmZK5cpK3vHJJj9E+WmPg9Vq
 PNjtWNXdgJrO7pQU42Bzcn/2z9aPF7saV5+TkwUTbLKY2ssS41V1zdma+gltt/IQ92sPJS4wSu9fA
 qs7uDvdjdZjyuEC+dg4iSsxKIllszekl4Ujify/+NQ8fbP/N5UrU3OAn3vie0yC4GaRvbbT11kmeF
 NOTlVoCw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1ldcEG-0005Bx-Lz; Mon, 03 May 2021 11:19:33 -0600
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-14-logang@deltatee.com>
 <78a165e1-657b-c284-d31a-adc8c9ded55d@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <4ad9c1d9-ec2a-1fe1-c5d9-19d2053da912@deltatee.com>
Date: Mon, 3 May 2021 11:19:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <78a165e1-657b-c284-d31a-adc8c9ded55d@nvidia.com>
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
Subject: Re: [PATCH 13/16] nvme-pci: Convert to using dma_map_sg_p2pdma for
 p2pdma pages
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



On 2021-05-02 7:34 p.m., John Hubbard wrote:
>>   	if (iod->npages == 0)
>>   		dma_pool_free(dev->prp_small_pool, nvme_pci_iod_list(req)[0],
>>   			      iod->first_dma);
>> @@ -868,14 +857,13 @@ static blk_status_t nvme_map_data(struct nvme_dev *dev, struct request *req,
>>   	if (!iod->nents)
>>   		goto out_free_sg;
>>   
>> -	if (is_pci_p2pdma_page(sg_page(iod->sg)))
>> -		nr_mapped = pci_p2pdma_map_sg_attrs(dev->dev, iod->sg,
>> -				iod->nents, rq_dma_dir(req), DMA_ATTR_NO_WARN);
>> -	else
>> -		nr_mapped = dma_map_sg_attrs(dev->dev, iod->sg, iod->nents,
>> -					     rq_dma_dir(req), DMA_ATTR_NO_WARN);
>> -	if (!nr_mapped)
>> +	nr_mapped = dma_map_sg_p2pdma_attrs(dev->dev, iod->sg, iod->nents,
>> +				     rq_dma_dir(req), DMA_ATTR_NO_WARN);
>> +	if (nr_mapped < 0) {
>> +		if (nr_mapped != -ENOMEM)
>> +			ret = BLK_STS_TARGET;
>>   		goto out_free_sg;
>> +	}
> 
> But now the "nr_mapped == 0" case is no longer doing an early out_free_sg.
> Is that OK?

dma_map_sg_p2pdma_attrs() never returns zero. It will return -ENOMEM in
the same situation and results in the same goto out_free_sg.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
