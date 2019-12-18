Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB65124B6C
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 16:19:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CBCE2850EA;
	Wed, 18 Dec 2019 15:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_9P-i8jriwL; Wed, 18 Dec 2019 15:19:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58DF084E6B;
	Wed, 18 Dec 2019 15:19:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C76FC1D87;
	Wed, 18 Dec 2019 15:19:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93DB5C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 15:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 834E484CF4
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95oPzvrra3Fm for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 15:19:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D970784964
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 15:19:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0C4EF258; Wed, 18 Dec 2019 16:19:00 +0100 (CET)
Date: Wed, 18 Dec 2019 16:18:57 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Remove incorrect PSI capability check
Message-ID: <20191218151856.GA2995@8bytes.org>
References: <20191120061016.31386-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120061016.31386-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 David Woodhouse <dwmw2@infradead.org>
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

On Wed, Nov 20, 2019 at 02:10:16PM +0800, Lu Baolu wrote:
> The PSI (Page Selective Invalidation) bit in the capability register
> is only valid for second-level translation. Intel IOMMU supporting
> scalable mode must support page/address selective IOTLB invalidation
> for first-level translation. Remove the PSI capability check in SVA
> cache invalidation code.
> 
> Fixes: 8744daf4b0699 ("iommu/vt-d: Remove global page flush support")
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel-svm.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied for v5.5, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
