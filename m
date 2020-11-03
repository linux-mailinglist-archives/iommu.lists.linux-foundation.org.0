Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB262A46B0
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 14:37:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 149742043C;
	Tue,  3 Nov 2020 13:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LncsdI87ugG9; Tue,  3 Nov 2020 13:37:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C1A272051B;
	Tue,  3 Nov 2020 13:37:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD2D2C0051;
	Tue,  3 Nov 2020 13:37:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AFB1C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5748F85E40
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s55CAKwD5iHM for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 13:37:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A21285DDB
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:37:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CD294433; Tue,  3 Nov 2020 14:37:29 +0100 (CET)
Date: Tue, 3 Nov 2020 14:37:28 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yi Sun <yi.y.sun@linux.intel.com>
Subject: Re: [PATCH v2 0/2] iommu: Fix a few issues related to PRQ
Message-ID: <20201103133728.GJ22888@8bytes.org>
References: <1604025444-6954-1-git-send-email-yi.y.sun@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604025444-6954-1-git-send-email-yi.y.sun@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe@linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dwmw2@infradead.org
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

On Fri, Oct 30, 2020 at 10:37:22AM +0800, Yi Sun wrote:
> We found a few issues about PRQ. So, two patches are cooked to
> fix them. Please have a review. Thanks!
> 
> Changes from v1:
> ================
> - Modify subject of patch 1 to make it more accurate.
> - Move get_domain_info() up to the sanity check part in patch 1.
> - Remove v1 patch 2 which is not suitable.
> - Add description for current patch 2.
> - Add 'Fixes:' tags for all patches.
> 
> Liu Yi L (1):
>   iommu/vt-d: Fix sid not set issue in in intel_svm_bind_gpasid()
> 
> Liu, Yi L (1):
>   iommu/vt-d: Fix a bug for PDP check in prq_event_thread
> 
>  drivers/iommu/intel/svm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied for v5.10, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
