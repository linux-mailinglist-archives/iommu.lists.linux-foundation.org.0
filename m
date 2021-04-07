Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88C356607
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 10:05:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D0040F7F;
	Wed,  7 Apr 2021 08:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsWEiqrU2BQA; Wed,  7 Apr 2021 08:05:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CD24030D;
	Wed,  7 Apr 2021 08:05:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9F12C000A;
	Wed,  7 Apr 2021 08:05:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F633C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C37884898
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVTc8PHAT8T1 for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 08:04:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 493EE84888
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:04:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 54B682A6; Wed,  7 Apr 2021 10:04:50 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:04:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 0/3] iommu/iova: Add CPU hotplug handler to flush rcaches
 to core code
Message-ID: <YG1noCU6pFQRC+yF@8bytes.org>
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, will@kernel.org
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

On Mon, Mar 01, 2021 at 08:12:18PM +0800, John Garry wrote:
> The Intel IOMMU driver supports flushing the per-CPU rcaches when a CPU is
> offlined.
> 
> Let's move it to core code, so everyone can take advantage.
> 
> Also correct a code comment.
> 
> Based on v5.12-rc1. Tested on arm64 only.
> 
> John Garry (3):
>   iova: Add CPU hotplug handler to flush rcaches
>   iommu/vt-d: Remove IOVA domain rcache flushing for CPU offlining
>   iova: Correct comment for free_cpu_cached_iovas()
> 
>  drivers/iommu/intel/iommu.c | 31 -------------------------------
>  drivers/iommu/iova.c        | 32 ++++++++++++++++++++++++++++++--
>  include/linux/cpuhotplug.h  |  2 +-
>  include/linux/iova.h        |  1 +
>  4 files changed, 32 insertions(+), 34 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
