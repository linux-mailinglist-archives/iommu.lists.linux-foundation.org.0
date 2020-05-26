Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DF1BC469
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 18:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B348385087;
	Tue, 28 Apr 2020 16:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFJxUz8FYEd7; Tue, 28 Apr 2020 16:03:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 998BE845DB;
	Tue, 28 Apr 2020 16:03:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E497C0172;
	Tue, 28 Apr 2020 16:03:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 694DDC0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 16:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 31EAC20459
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 16:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYT4w+1NC4Vp for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:03:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id CF4B22042D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 16:03:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11FB530E;
 Tue, 28 Apr 2020 09:03:02 -0700 (PDT)
Received: from [10.57.33.170] (unknown [10.57.33.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EE773F305;
 Tue, 28 Apr 2020 09:02:59 -0700 (PDT)
Subject: Re: [RFC 00/17] DRM: fix struct sg_table nents vs. orig_nents misuse
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>
References: <CGME20200428132022eucas1p2aa4716cbaca61c432ee8028be15fef7a@eucas1p2.samsung.com>
 <20200428132005.21424-1-m.szyprowski@samsung.com>
 <20200428140257.GA3433@lst.de> <20200428153202.GY3456981@phenom.ffwll.local>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com>
Date: Tue, 28 Apr 2020 17:02:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428153202.GY3456981@phenom.ffwll.local>
Content-Language: en-GB
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

On 2020-04-28 4:32 pm, Daniel Vetter wrote:
> On Tue, Apr 28, 2020 at 04:02:57PM +0200, Christoph Hellwig wrote:
>> On Tue, Apr 28, 2020 at 03:19:48PM +0200, Marek Szyprowski wrote:
>>> 1. introduce a dma_{map,sync,unmap}_sgtable() wrappers, which will use
>>>     a proper sg_table entries and call respective DMA-mapping functions
>>>     and adapt current code to it
>>
>> That sounds reasonable to me.  Those could be pretty trivial wrappers.
>>
>>>
>>>
>>> 2. rename nents and orig_nents to nr_pages, nr_dmas to clearly state
>>>     which one refers to which part of the scatterlist; I'm open for
>>>     other names for those entries
>>
>> nr_cpu_ents and nr_dma_ents might be better names, but it still would be
>> a whole lot of churn for little gain.  I think just good wrappers like
>> suggested above might be more helpful.
> 
> I guess long-term we could aim for both? I.e. roll out better wrappers
> first, once that's soaked through the tree, rename the last offenders.

Yes, that's what I was thinking too - most of these uses are just 
passing them in and out of the DMA APIs, and thus would be subsumed into 
the wrappers anyway, then in the relatively few remaining places where 
the table is actually iterated for one reason or the other, renaming 
would stand to help review and maintenance in terms of making it far 
more obvious when the implementation and the intent don't match.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
