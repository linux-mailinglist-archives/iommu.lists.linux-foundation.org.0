Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774C4FFB9D
	for <lists.iommu@lfdr.de>; Wed, 13 Apr 2022 18:44:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E63E82B97;
	Wed, 13 Apr 2022 16:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ah2DADCd0ame; Wed, 13 Apr 2022 16:44:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5500F82F37;
	Wed, 13 Apr 2022 16:44:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F6C9C0088;
	Wed, 13 Apr 2022 16:44:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 841E6C002C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 16:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F34482B97
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 16:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02F1d-NA5-h8 for <iommu@lists.linux-foundation.org>;
 Wed, 13 Apr 2022 16:44:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C46A8291C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 16:44:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8FC2568AFE; Wed, 13 Apr 2022 18:44:15 +0200 (CEST)
Date: Wed, 13 Apr 2022 18:44:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dma-direct: avoid redundant memory sync for swiotlb
Message-ID: <20220413164415.GA31640@lst.de>
References: <20220412113805.3210-1-chao.gao@intel.com>
 <e25fbb7e-a67e-5421-b7be-700fd0209b0d@arm.com>
 <20220413010157.GA10502@gao-cwp> <20220413045958.GA31209@lst.de>
 <4a993382-6a29-a0f4-4600-90ab60ad982a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a993382-6a29-a0f4-4600-90ab60ad982a@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Kevin Tian <kevin.tian@intel.com>,
 Wang Zhaoyang1 <zhaoyang1.wang@intel.com>, linux-kernel@vger.kernel.org,
 Gao Liang <liang.gao@intel.com>, iommu@lists.linux-foundation.org,
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

On Wed, Apr 13, 2022 at 02:10:56PM +0100, Robin Murphy wrote:
> Are you sure? AFAICS swiotlb_map() does the right thing, and 
> dma_direct_{sync,unmap} are working off the DMA address, which is that of 
> the bounce slot when SWIOTLB is involved (not least, how would the 
> is_swiotlb_buffer() checks work otherwise?)

Yeah, actually this should be fine.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
