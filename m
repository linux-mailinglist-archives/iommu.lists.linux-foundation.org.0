Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6422072A0
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 13:55:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE6EB8756A;
	Wed, 24 Jun 2020 11:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ke_IHJkSq6Fz; Wed, 24 Jun 2020 11:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0109D86F81;
	Wed, 24 Jun 2020 11:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E101CC016F;
	Wed, 24 Jun 2020 11:55:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0749C016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A2D186382
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xc6iHoiZ+JAx for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 11:55:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CF18882AE
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:55:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E135B2AF; Wed, 24 Jun 2020 13:55:10 +0200 (CEST)
Date: Wed, 24 Jun 2020 13:55:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2] iommu: amd: Fix IO_PAGE_FAULT due to __unmap_single()
 size overflow
Message-ID: <20200624115505.GN3701@8bytes.org>
References: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gregkh@linuxfoundation.org, iommu@lists.linux-foundation.org,
 stable@vger.kernel.org
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

On Wed, Jun 24, 2020 at 08:41:21AM +0000, Suravee Suthikulpanit wrote:
> Currently, an integer is used to specify the size in unmap_sg().
> With 2GB worth of pages (512k 4k pages), it requires 31 bits
> (i.e. (1 << 19) << 12), which overflows the integer, and ends up
> unmapping more pages than intended. Subsequently, this results in
> IO_PAGE_FAULT.
> 
> Uses size_t instead of int to pass parameter to __unmap_single().
> 
> Please note that this patch is only for the stable-kernels tree
> because the commit be62dbf554c5 ("iommu/amd: Convert AMD iommu driver
> to the dma-iommu api"), which removes the function unmap_sg()
> was introduced in v5.5. This patch is not applicable in subsequent
> kernel versions.
> 
> Cc: stable@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Reported-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Acked-by: Joerg Roedel <jroedel@suse.de>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
