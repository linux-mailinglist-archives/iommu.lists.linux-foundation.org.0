Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8E41CFF3
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 01:28:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76DE80E63;
	Wed, 29 Sep 2021 23:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysgi5z-hSMrw; Wed, 29 Sep 2021 23:28:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 251D980E64;
	Wed, 29 Sep 2021 23:28:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 027AFC0022;
	Wed, 29 Sep 2021 23:28:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33814C000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 23:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F56E4013A
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 23:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDmwT8hH_poC for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 23:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37609400C7
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 23:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=NYyTaf27EInHhX60ljYBoeATyLjSGs1NVod8tkafPeY=; b=EWozigDhXaXheIOw3+nHDtN4G6
 eFSOZ5q8F/2nZpK2IzAxIYKC4S9LDPF19Ym9gqJ8EQH2CYYB0eZPhBVZFPNgllppCzKBbLElzRGxI
 mjOi6SpfbjHBdpYGGFSewfSUDyh7wanUxSZDj+03pzSkYeqm/aIZoPsTswsfEkqn0df+fg2/B8ZNP
 eLLZtU513+UpUEKzyBAWGXBYdkvhYZyf3h7NVOsMnsbHERQjNOXVhBo5XV1nMbOTXEnvBbdqySQqu
 xIv45bM6TtjludpPxa83ejx2eBYBOoqqEyohv4QngbqSVtzDM3nLZqpla5/bYOnKPfhp+diVGMaME
 v4VgN3yw==;
Received: from s0106a84e3fe8c3f3.cg.shawcable.net ([24.64.144.200]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1mVj0C-0008Eg-58; Wed, 29 Sep 2021 17:28:41 -0600
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20210916234100.122368-1-logang@deltatee.com>
 <20210928200216.GW3544071@ziepe.ca>
 <06d75fcb-ce8b-30a5-db36-b6c108460d3d@deltatee.com>
 <20210929232147.GD3544071@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <93f56919-03ee-8326-10ee-8fbd9078b8e0@deltatee.com>
Date: Wed, 29 Sep 2021 17:28:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929232147.GD3544071@ziepe.ca>
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
Subject: Re: [PATCH v3 00/20] Userspace P2PDMA with O_DIRECT NVMe devices
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



On 2021-09-29 5:21 p.m., Jason Gunthorpe wrote:
> On Wed, Sep 29, 2021 at 03:50:02PM -0600, Logan Gunthorpe wrote:
>>
>>
>> On 2021-09-28 2:02 p.m., Jason Gunthorpe wrote:
>>> On Thu, Sep 16, 2021 at 05:40:40PM -0600, Logan Gunthorpe wrote:
>>>> Hi,
>>>>
>>>> This patchset continues my work to add userspace P2PDMA access using
>>>> O_DIRECT NVMe devices. My last posting[1] just included the first 13
>>>> patches in this series, but the early P2PDMA cleanup and map_sg error
>>>> changes from that series have been merged into v5.15-rc1. To address
>>>> concerns that that series did not add any new functionality, I've added
>>>> back the userspcae functionality from the original RFC[2] (but improved
>>>> based on the original feedback).
>>>
>>> I really think this is the best series yet, it really looks nice
>>> overall. I know the sg flag was a bit of a debate at the start, but it
>>> serves an undeniable purpose and the resulting standard DMA APIs 'just
>>> working' is really clean.
>>
>> Actually, so far, nobody has said anything negative about using the SG flag.
>>
>>> There is more possible here, we could also pass the new GUP flag in the
>>> ib_umem code..
>>
>> Yes, that would be very useful.
> 
> You might actually prefer to do that then the bio changes to get the
> infrastructur merged as it seems less "core"

I'm a little bit more concerned about my patch set growing too large.
It's already at 20 patches and I think I'll need to add a couple more
based on the feedback you've already provided. So I'm leaning toward
pushing more functionality as future work.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
