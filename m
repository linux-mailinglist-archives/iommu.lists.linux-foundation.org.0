Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C622D5096
	for <lists.iommu@lfdr.de>; Thu, 10 Dec 2020 03:06:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEA7186D44;
	Thu, 10 Dec 2020 02:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKN1DFbCT9lX; Thu, 10 Dec 2020 02:06:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B7D286C80;
	Thu, 10 Dec 2020 02:06:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18F3AC013B;
	Thu, 10 Dec 2020 02:06:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8014C013B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 02:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCA9A8748B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 02:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LbRN3Xh8Jht for <iommu@lists.linux-foundation.org>;
 Thu, 10 Dec 2020 02:06:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3578C87285
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 02:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=Uml3Mld7EOkwqbJ9IqsKe3VTCWPV7AsDblFsW7V45yw=; b=q5k3ZedQmC5MXoHZ2KUQBWN2Oz
 hquggxONMg9OTs9nTIGThURenvo42BA7KY08/toQkCBcNvHJmSs/mKRb5vQ9qzVX/OQgeho0G6WdO
 9XxCBe11YKfR/VlCB41qkLCtIUS3xCIgIfqrgZQRZ2bxV+gFQp/JjVUm8FS1KWKPLt4w1vqalq2Y+
 Y5a5In4k6tV2ekjPZBMOl4ZPDqqXRiRCqiRxzbFMyXp5HhBTRqxZK/1xsBeK1Vg84BAWQx1sItp/D
 Jr5RGFJd+FK4oQ14PB9CQP62D+M45qewCwQT+yFwRJ9FzoW79zsE6chP5NWVZBjIKnO41O8XhIL9u
 fFBxnSUA==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1knBLs-0005p7-VP; Wed, 09 Dec 2020 19:06:41 -0700
To: Dan Williams <dan.j.williams@intel.com>
References: <20201106170036.18713-1-logang@deltatee.com>
 <20201106170036.18713-5-logang@deltatee.com> <20201109091258.GB28918@lst.de>
 <4e336c7e-207b-31fa-806e-c4e8028524a5@deltatee.com>
 <CAPcyv4ifGcrdOtUt8qr7pmFhmecGHqGVre9G0RorGczCGVECQQ@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <fba1022b-1425-bb79-9af8-fe68e6f2c56e@deltatee.com>
Date: Wed, 9 Dec 2020 19:06:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4ifGcrdOtUt8qr7pmFhmecGHqGVre9G0RorGczCGVECQQ@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: daniel.vetter@ffwll.ch, willy@infradead.org,
 ddutile@redhat.com, jhubbard@nvidia.com, iweiny@intel.com,
 christian.koenig@amd.com, jgg@ziepe.ca, sbates@raithlin.com,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hch@lst.de,
 dan.j.williams@intel.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH 04/15] lib/scatterlist: Add flag for indicating P2PDMA
 segments in an SGL
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Linux PCI <linux-pci@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ira Weiny <iweiny@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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



On 2020-12-09 6:22 p.m., Dan Williams wrote:
> On Mon, Nov 9, 2020 at 8:47 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>>
>> On 2020-11-09 2:12 a.m., Christoph Hellwig wrote:
>>> On Fri, Nov 06, 2020 at 10:00:25AM -0700, Logan Gunthorpe wrote:
>>>> We make use of the top bit of the dma_length to indicate a P2PDMA
>>>> segment.
>>>
>>> I don't think "we" can.  There is nothing limiting the size of a SGL
>>> segment.
>>
>> Yes, I expected this would be the unacceptable part. Any alternative ideas?
> 
> Why is the SG_P2PDMA_FLAG needed as compared to checking the SGL
> segment-pages for is_pci_p2pdma_page()?

Because the DMA and page segments in the SGL aren't necessarily aligned...

The IOMMU implementations can coalesce multiple pages into fewer DMA
address ranges, so the page pointed to by sg->page_link may not be the
one that corresponds to the address in sg->dma_address for a given segment.

If that makes sense -- it's not the easiest thing to explain.

Logan


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
