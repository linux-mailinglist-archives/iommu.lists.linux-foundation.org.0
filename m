Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA051377E
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 16:56:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66F160E3A;
	Thu, 28 Apr 2022 14:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsttjPwmKlqd; Thu, 28 Apr 2022 14:56:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D4FCD60B09;
	Thu, 28 Apr 2022 14:56:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEC6EC002D;
	Thu, 28 Apr 2022 14:56:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68167C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4707440374
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPJsAHlkC7BP for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 14:56:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B358400BF
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:56:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8C61474;
 Thu, 28 Apr 2022 07:56:33 -0700 (PDT)
Received: from [10.57.80.98] (unknown [10.57.80.98])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B923C3F774;
 Thu, 28 Apr 2022 07:56:29 -0700 (PDT)
Message-ID: <f0ab2aa5-ca23-fa40-6147-43fc1f385bc8@arm.com>
Date: Thu, 28 Apr 2022 15:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH 1/2] swiotlb: Split up single swiotlb lock
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>
References: <20220428141429.1637028-1-ltykernel@gmail.com>
 <20220428141429.1637028-2-ltykernel@gmail.com>
 <e7b644f0-6c90-fe99-792d-75c38505dc54@arm.com>
 <YmqonHKBT8ftYHgY@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YmqonHKBT8ftYHgY@infradead.org>
Cc: parri.andrea@gmail.com, thomas.lendacky@amd.com, wei.liu@kernel.org,
 Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 konrad.wilk@oracle.com, linux-hyperv@vger.kernel.org,
 Tianyu Lan <ltykernel@gmail.com>, linux-kernel@vger.kernel.org,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 andi.kleen@intel.com, brijesh.singh@amd.com, vkuznets@redhat.com,
 kys@microsoft.com, kirill.shutemov@intel.com, hch@lst.de
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

On 2022-04-28 15:45, Christoph Hellwig wrote:
> On Thu, Apr 28, 2022 at 03:44:36PM +0100, Robin Murphy wrote:
>> Rather than introduce this extra level of allocator complexity, how about
>> just dividing up the initial SWIOTLB allocation into multiple io_tlb_mem
>> instances?
> 
> Yeah.  We're almost done removing all knowledge of swiotlb from drivers,
> so the very last thing I want is an interface that allows a driver to
> allocate a per-device buffer.

FWIW I'd already started thinking about having a distinct io_tlb_mem for 
non-coherent devices where vaddr is made non-cacheable to avoid the 
hassle of keeping the arch_dma_sync_* calls lined up, so I'm certainly 
in favour of bringing in a bit more flexibility at this level :)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
