Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57E380DF0
	for <lists.iommu@lfdr.de>; Fri, 14 May 2021 18:16:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC59841848;
	Fri, 14 May 2021 16:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibWqcZMz7vzN; Fri, 14 May 2021 16:16:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04B341847;
	Fri, 14 May 2021 16:16:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 687F5C0001;
	Fri, 14 May 2021 16:16:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63229C0001
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 16:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4505484650
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 16:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWoHZct3uw-f for <iommu@lists.linux-foundation.org>;
 Fri, 14 May 2021 16:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C76D58464A
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=E4eKfLLPwxlNLjuttUuI8VaOne71TO7fgDfREp6VqWo=; b=sPRxOlEMD/ZVQ88LgoGLL9OjBW
 Wx0+B2uNVHava/VVSM9gB4FJtOz6aiI72TospMuM4DTR6YiCUjKsyUOFus7PH/19HYF72JItnGrXW
 vLLue47wtV1XdyCo9lXQkyk8vp82wx6TPOdDnUwXhjOophg0NxfdhWMpLuolM5ISe/FynxCSvGtSn
 JJsuJooWId8Qr8z3RExNK6gc34i19s93IGYSCWBOAxS9DTtnHVWXzpIfK9FdD6uCsHV5a5kGmOum/
 rXiAGakNoK/7PHlxa2iM/+f2Q+Ns8rzVCrKhqZN6zgA9a10xmb4hzYQ25BXQ/JHXfvK25hlMlmWo3
 CP907NSA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lhaTZ-00066P-MN; Fri, 14 May 2021 10:15:46 -0600
To: Christoph Hellwig <hch@lst.de>
References: <20210513223203.5542-1-logang@deltatee.com>
 <20210513223203.5542-9-logang@deltatee.com> <20210514135126.GB4715@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <241e7dad-8d38-9f0c-5e54-8b7df32b8bac@deltatee.com>
Date: Fri, 14 May 2021 10:15:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514135126.GB4715@lst.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: robin.murphy@arm.com, ira.weiny@intel.com,
 helgaas@kernel.org, jianxin.xiong@intel.com, dave.hansen@linux.intel.com,
 jason@jlekstrand.net, dave.b.minturn@intel.com, andrzej.jakowski@intel.com,
 daniel.vetter@ffwll.ch, willy@infradead.org, ddutile@redhat.com,
 jhubbard@nvidia.com, christian.koenig@amd.com, jgg@ziepe.ca,
 dan.j.williams@intel.com, sbates@raithlin.com,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v2 08/22] dma-mapping: Allow map_sg() ops to return
 negative error codes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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



On 2021-05-14 7:51 a.m., Christoph Hellwig wrote:
>> +int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
>>  		enum dma_data_direction dir, unsigned long attrs);
> 
> I don't think it makes sense to expose this __dma_map_sg_attrs helper.
> Just keep it static and move the sgtable helper to kernel/dma/mapping.c
> as well.

Makes sense. I'll fix this for v3.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
