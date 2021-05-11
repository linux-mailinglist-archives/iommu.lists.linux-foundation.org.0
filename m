Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED537ABB4
	for <lists.iommu@lfdr.de>; Tue, 11 May 2021 18:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D52384328;
	Tue, 11 May 2021 16:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9g-AatSEDLMI; Tue, 11 May 2021 16:19:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 481E384326;
	Tue, 11 May 2021 16:19:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17DEAC0024;
	Tue, 11 May 2021 16:19:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CFDDC0001
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBE884326
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 16:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQAo1iEPl-JZ for <iommu@lists.linux-foundation.org>;
 Tue, 11 May 2021 16:19:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11E1F84319
 for <iommu@lists.linux-foundation.org>; Tue, 11 May 2021 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=KRREYiID4nTLAcd30iCtMu5qS4tYGdizddy6etGFynA=; b=QX2vn+ZSnkNIea3oIqxWCrg9tp
 n1sCb9KHpJoIaRXdY0nYk+A55R5+bJzf7lAUrmRIP+9tYXPMAY9zVdmvTrY8Zi4CN+nP4mJCwlXNi
 9EpP4/ubF7Zt56WkMmsltDxbS59EjBO3rKE9BgbNkI4JufYuR4lLRmoNsuerG4uBi5CFZyekeuaGh
 adS2eOEVb6LeYpnv785vjeHILX6oPibI9iYigpRsbyKCGjWpq95W7BYMUn3Ez26qYJDbXa8bQ4t+g
 9GEhUUbscgDYfAy9KDF7uFUAETOgR5Z55BuzayN3e/GMBH3ziI+KwOOahICDS35fDS9iJbAZ4bRN1
 OGZR8Z+g==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lgV65-0006go-Tm; Tue, 11 May 2021 10:19:02 -0600
To: Don Dutile <ddutile@redhat.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-11-logang@deltatee.com>
 <92704199-4cee-3811-3902-08ccf6cc1f5f@redhat.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <185f39c0-d71c-5d24-9d87-951a72c3532d@deltatee.com>
Date: Tue, 11 May 2021 10:19:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <92704199-4cee-3811-3902-08ccf6cc1f5f@redhat.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: robin.murphy@arm.com, ira.weiny@intel.com,
 helgaas@kernel.org, jianxin.xiong@intel.com, dave.hansen@linux.intel.com,
 jason@jlekstrand.net, dave.b.minturn@intel.com, andrzej.jakowski@intel.com,
 daniel.vetter@ffwll.ch, willy@infradead.org, jhubbard@nvidia.com,
 christian.koenig@amd.com, jgg@ziepe.ca, dan.j.williams@intel.com, hch@lst.de,
 sbates@raithlin.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 ddutile@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 10/16] dma-mapping: Add flags to dma_map_ops to indicate
 PCI P2PDMA support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <helgaas@kernel.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>, Stephen Bates <sbates@raithlin.com>,
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



On 2021-05-11 10:06 a.m., Don Dutile wrote:
> On 4/8/21 1:01 PM, Logan Gunthorpe wrote:
>> Add a flags member to the dma_map_ops structure with one flag to
>> indicate support for PCI P2PDMA.
>>
>> Also, add a helper to check if a device supports PCI P2PDMA.
>>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> ---
>>   include/linux/dma-map-ops.h |  3 +++
>>   include/linux/dma-mapping.h |  5 +++++
>>   kernel/dma/mapping.c        | 18 ++++++++++++++++++
>>   3 files changed, 26 insertions(+)
>>
>> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
>> index 51872e736e7b..481892822104 100644
>> --- a/include/linux/dma-map-ops.h
>> +++ b/include/linux/dma-map-ops.h
>> @@ -12,6 +12,9 @@
>>   struct cma;
>>   
>>   struct dma_map_ops {
>> +	unsigned int flags;
>> +#define DMA_F_PCI_P2PDMA_SUPPORTED     (1 << 0)
>> +
> I'm not a fan of in-line define's; if we're going to add a flags field to the dma-ops
> -- and logically it'd be good to have p2pdma go through the dma-ops struct --
> then let's move this up in front of the dma-ops description.

Already changed for v2.

> And now that the dma-ops struct is being 'opened' for p2pdma, should p2pdma ops be added
> to this struct, so all this work can be mimic'd/reflected/leveraged/refactored for CXL, GenZ, etc. p2pdma in (the near?) future?

v2 no longer has a specific op for p2pdma. We are now using
dma_map_sgtable() which already has the error return we need.

I think any work to support CXL, GenZ, etc will need to be done when
they add their own support. I can't and shouldn't guess at their needs now.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
