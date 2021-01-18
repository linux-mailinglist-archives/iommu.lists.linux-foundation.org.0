Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F42F9DEE
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 12:21:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06CF1848A0;
	Mon, 18 Jan 2021 11:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItTB7gGt9frM; Mon, 18 Jan 2021 11:21:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A40C1854E5;
	Mon, 18 Jan 2021 11:21:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8531CC013A;
	Mon, 18 Jan 2021 11:21:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4407C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8BB84854E0
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EncWgGC-cl7 for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 11:21:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F0DA848A0
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:21:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11201221FF;
 Mon, 18 Jan 2021 11:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610968891;
 bh=f7slgC3FybDChj4RgWx/+lOIZ+uIiteGAYHQ8oorWy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqVL7gdAFxJseTnv/KHUNnT6Jm7jXOVXD09MZcwKcTam0E9x8k6bte9kJ+qgDDIue
 4nDfanXk43ign34DCyhFvOBPnE3kxZoWOKqfSCvFzRbUSLeIPZ+ymYOGxmq/S37TpM
 RZJdTDD+rJbr7CWEm7sa45n1NtYGOXuDjCcLBjtaEFKrIOrpPHBTF7yRrntPolCXzs
 fSBupA9l4YyXMrIwSj22DOQYbza0qHm/mNZ1oSf4+bHQF+BRmgk6mgeZLRuY5HmIVr
 Vo1VepR3MR2d212OymR40qcT45y3ufy6PeZBHoRJg1gfYy8xuqjMXOqwb/LtNgGk0V
 srap3RxV9Ggcw==
Date: Mon, 18 Jan 2021 11:21:26 +0000
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 0/6] IOMMU: Some more IOVA and core code tidy-up
Message-ID: <20210118112126.GA16500@willie-the-truck>
References: <1609940111-28563-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609940111-28563-1-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Wed, Jan 06, 2021 at 09:35:05PM +0800, John Garry wrote:
> Just some tidy-up to IOVA and core code.
> 
> Based on v5.11-rc2
> 
> Differences to v1:
> - Add core IOMMU patches
> 
> John Garry (6):
>   iova: Make has_iova_flush_queue() private
>   iova: Delete copy_reserved_iova()
>   iova: Stop exporting some more functions
>   iommu: Stop exporting iommu_map_sg_atomic()
>   iommu: Delete iommu_domain_window_disable()
>   iommu: Delete iommu_dev_has_feature()
> 
>  drivers/iommu/iommu.c | 21 ---------------------
>  drivers/iommu/iova.c  | 36 +-----------------------------------
>  include/linux/iommu.h | 13 -------------
>  include/linux/iova.h  | 12 ------------
>  4 files changed, 1 insertion(+), 81 deletions(-)

For the series:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
