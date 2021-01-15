Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBC2F897D
	for <lists.iommu@lfdr.de>; Sat, 16 Jan 2021 00:41:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C6770874C5;
	Fri, 15 Jan 2021 23:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IH-fj-9LAiTy; Fri, 15 Jan 2021 23:41:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 589AE874BE;
	Fri, 15 Jan 2021 23:41:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36476C013A;
	Fri, 15 Jan 2021 23:41:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F0C0C013A
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 23:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 323F4874C5
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 23:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPS6by0gT1XU for <iommu@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 23:41:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2641D874BE
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610754061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlht7br4mqv7F1sN7U7/EAPyte/4NdiUCZ7SCmktRbE=;
 b=GHuUBonAtDU6zQ8a7SECeaAWE7+fe53SGnnsjFSgYQd/Bt5v4evDaW+lGc2rpkTG/SgUQR
 s1ShtwmuAKQk7dV/rpSypxF3/7JUgUjwC8MfCGAqV6QHQAgVrkMWczC6AMo2GLH14gFNvC
 eb9xkkYepvhVkBNf2HvsCgB539ET9Tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-hgMpZCqAORS7qjHkQ2sM7A-1; Fri, 15 Jan 2021 18:39:30 -0500
X-MC-Unique: hgMpZCqAORS7qjHkQ2sM7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17826806660;
 Fri, 15 Jan 2021 23:39:28 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFF7A6F818;
 Fri, 15 Jan 2021 23:39:26 +0000 (UTC)
Date: Fri, 15 Jan 2021 16:39:26 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 5/6] vfio/iommu_type1: Drop parameter "pgsize" of
 vfio_iova_dirty_bitmap
Message-ID: <20210115163926.3d107090@omen.home.shazbot.org>
In-Reply-To: <20210107044401.19828-6-zhukeqian1@huawei.com>
References: <20210107044401.19828-1-zhukeqian1@huawei.com>
 <20210107044401.19828-6-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com,
 Thomas Gleixner <tglx@linutronix.de>, jiangkunkun@huawei.com,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Thu, 7 Jan 2021 12:44:00 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> We always use the smallest supported page size of vfio_iommu as
> pgsize. Remove parameter "pgsize" of vfio_iova_dirty_bitmap.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 080c05b129ee..82649a040148 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1015,11 +1015,12 @@ static int update_user_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
>  }
>  
>  static int vfio_iova_dirty_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
> -				  dma_addr_t iova, size_t size, size_t pgsize)
> +				  dma_addr_t iova, size_t size)
>  {
>  	struct vfio_dma *dma;
>  	struct rb_node *n;
> -	unsigned long pgshift = __ffs(pgsize);
> +	unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
> +	size_t pgsize = (size_t)1 << pgshift;
>  	int ret;
>  
>  	/*
> @@ -2824,8 +2825,7 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  		if (iommu->dirty_page_tracking)
>  			ret = vfio_iova_dirty_bitmap(range.bitmap.data,
>  						     iommu, range.iova,
> -						     range.size,
> -						     range.bitmap.pgsize);
> +						     range.size);
>  		else
>  			ret = -EINVAL;
>  out_unlock:

In this case the caller has actually already calculated both pgsize and
pgshift, the better optimization would be to pass both rather than
recalculate.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
