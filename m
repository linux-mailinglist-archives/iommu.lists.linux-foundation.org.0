Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC128CF60
	for <lists.iommu@lfdr.de>; Tue, 13 Oct 2020 15:42:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B70FD873CE;
	Tue, 13 Oct 2020 13:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsTp0TvnkxoT; Tue, 13 Oct 2020 13:42:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FB5287883;
	Tue, 13 Oct 2020 13:42:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 645D9C0051;
	Tue, 13 Oct 2020 13:42:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19BC0C0051
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 13:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 006A387367
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 13:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbxAIZClldZV for <iommu@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 13:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3A647872FC
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 13:42:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A164830E;
 Tue, 13 Oct 2020 06:42:41 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A63CD3F719;
 Tue, 13 Oct 2020 06:42:39 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To: Christoph Hellwig <hch@infradead.org>, Jonathan Marek <jonathan@marek.ca>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
Date: Tue, 13 Oct 2020 14:42:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201007062519.GA23519@infradead.org>
Content-Language: en-GB
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
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

On 2020-10-07 07:25, Christoph Hellwig wrote:
> On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
>> One example why drm/msm can't use DMA API is multiple page table support
>> (that is landing in 5.10), which is something that definitely couldn't work
>> with DMA API.
>>
>> Another one is being able to choose the address for mappings, which AFAIK
>> DMA API can't do (somewhat related to this: qcom hardware often has ranges
>> of allowed addresses, which the dma_mask mechanism fails to represent, what
>> I see is drivers using dma_mask as a "maximum address", and since addresses
>> are allocated from the top it generally works)
> 
> That sounds like a good enough rason to use the IOMMU API.  I just
> wanted to make sure this really makes sense.

I still think this situation would be best handled with a variant of 
dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set 
automatically when attaching to an unmanaged IOMMU domain. That way the 
device driver can make DMA API calls in the appropriate places that do 
the right thing either way, and only needs logic to decide whether to 
use the returned DMA addresses directly or ignore them if it knows 
they're overridden by its own IOMMU mapping.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
