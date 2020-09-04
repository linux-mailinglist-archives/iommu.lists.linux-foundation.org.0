Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE925D46E
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6568E86D76;
	Fri,  4 Sep 2020 09:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-vpXfu0oxuV; Fri,  4 Sep 2020 09:16:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C74F86D99;
	Fri,  4 Sep 2020 09:16:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62AB6C0051;
	Fri,  4 Sep 2020 09:16:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81BC0C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7061786C59
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlSclYgXqebG for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:16:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5BE086C48
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:16:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 343F99CE; Fri,  4 Sep 2020 11:16:44 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:16:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: Rename iommu_tlb_* functions to iommu_iotlb_*
Message-ID: <20200904091642.GI6714@8bytes.org>
References: <20200817210051.13546-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817210051.13546-1-murphyt7@tcd.ie>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, person@a.com, Will Deacon <will@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 17, 2020 at 10:00:49PM +0100, Tom Murphy wrote:
> To keep naming consistent we should stick with *iotlb*. This patch
> renames a few remaining functions.
> 
> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>  drivers/iommu/dma-iommu.c       |  2 +-
>  drivers/iommu/iommu.c           |  4 ++--
>  drivers/vfio/vfio_iommu_type1.c |  2 +-
>  include/linux/io-pgtable.h      |  2 +-
>  include/linux/iommu.h           | 10 +++++-----
>  5 files changed, 10 insertions(+), 10 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
