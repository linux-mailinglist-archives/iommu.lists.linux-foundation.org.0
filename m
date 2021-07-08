Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CB3C146F
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 15:38:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BAE382993;
	Thu,  8 Jul 2021 13:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h85i-YC-rtWh; Thu,  8 Jul 2021 13:38:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7AD7982977;
	Thu,  8 Jul 2021 13:38:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55901C001F;
	Thu,  8 Jul 2021 13:38:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3A94C000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8665840226
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7KSHtyEPvLf for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 13:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AEFA40144
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:38:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="206490430"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="206490430"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 06:38:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="487606704"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.214.103])
 ([10.254.214.103])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 06:38:36 -0700
To: David Stevens <stevensd@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20210707075505.2896824-1-stevensd@google.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/4] Add dynamic iommu backed bounce buffers
Message-ID: <f6541f4e-648e-d9a0-eda7-b2a117978ebb@linux.intel.com>
Date: Thu, 8 Jul 2021 21:38:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707075505.2896824-1-stevensd@google.com>
Content-Language: en-US
Cc: David Stevens <stevensd@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>
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

Hi David,

I like this idea. Thanks for proposing this.

On 2021/7/7 15:55, David Stevens wrote:
> Add support for per-domain dynamic pools of iommu bounce buffers to the
> dma-iommu API. This allows iommu mappings to be reused while still
> maintaining strict iommu protection. Allocating buffers dynamically
> instead of using swiotlb carveouts makes per-domain pools more amenable
> on systems with large numbers of devices or where devices are unknown.

Have you ever considered leveraging the per-device swiotlb memory pool
added by below series?

https://lore.kernel.org/linux-iommu/20210625123004.GA3170@willie-the-truck/

> 
> When enabled, all non-direct streaming mappings below a configurable
> size will go through bounce buffers. Note that this means drivers which
> don't properly use the DMA API (e.g. i915) cannot use an iommu when this
> feature is enabled. However, all drivers which work with swiotlb=force
> should work.

If so, why not making it more scalable by adding a callback into vendor
iommu drivers? The vendor iommu drivers have enough information to tell
whether the bounce buffer is feasible for a specific domain.

> 
> Bounce buffers serve as an optimization in situations where interactions
> with the iommu are very costly. For example, virtio-iommu operations in

The simulated IOMMU does the same thing.

It's also an optimization for bare metal in cases where the strict mode
of cache invalidation is used. CPU moving data is faster than IOMMU
cache invalidation if the buffer is small.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
