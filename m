Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F83FBA91
	for <lists.iommu@lfdr.de>; Mon, 30 Aug 2021 19:03:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D20A80D6B;
	Mon, 30 Aug 2021 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZB63ESrfnRQm; Mon, 30 Aug 2021 17:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 27DB280CBD;
	Mon, 30 Aug 2021 17:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 071BFC000E;
	Mon, 30 Aug 2021 17:03:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7084AC000E
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5958D605A0
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 17:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gv1gnqO7oPyX for <iommu@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 17:03:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 835386059B
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 17:03:25 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id c4so8888418plh.7
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WdA/bMO1TKjMxwaqSCpYrAC+Qrvx7KaeUrgZ61bH0AI=;
 b=NkaPHJhOhUnON4YzLbCMrmjcBGNE8Kx6Dx27g177KQF1+orcu4+bch4O3TkjXb+yeb
 BDjolpoeMriVKP2IRktfpkN5PeA8Lxw/OKfZYXgBK3gqKxhuGR7YlKNx2L+doM2pbuRK
 r4ayl67mqZRqreItUYw3isqIB90q+vqfI5tLRsWfCl4P2CMJs/bwCchZrb5VgluI9oDm
 A42es9ILdquC8fDumvjUVp4l1DGdAbTdwcTmVn2T4TKKMUo4tykL8yKNYYlAN8XcFmKe
 MN/RaEJzq4QEu204gjgGZs3NdgHIRoLSJA9KcOUg+/FiEKVl/iocNR2UhGL4i33Lrn32
 H3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WdA/bMO1TKjMxwaqSCpYrAC+Qrvx7KaeUrgZ61bH0AI=;
 b=m6DuexXVe7ICysY/upmRAjw3RNclfd8GP44IKG2t9Yf9a3Iru74Ty0BX+9AQr0yRez
 LRUy7Pwnb2/GJJjaQ0jLVvCSglF30Idw/z6lR5XveWWEj75bAesXOdjxIIqlJg0C1UGY
 ESuxnfoHKQRS/rWA3C7VH6U+Noy4JhW9tgYN6B2yB5FWn28vWek3al9pCwO5yW0CZvZW
 +oOzuNrx+s6A74FPMloQYMbrY3TbXmqdJUYGYzdYWPBeWl0Dn51ENuKDslH1y3gFUkyQ
 Hbq6iYqHQTAHtfsBuUxELKOb84vKxQiXzHuZWfv73l7mYc+D3zHTMs+Hqftn3rjD8jrs
 L15A==
X-Gm-Message-State: AOAM533suDnAjJIC0f5vEzMUHf3v0VMkBYkKxGZld4rli8+ClYNUrcDK
 R2b6rIpPynsoiR+Kpe4ly6NEnoyZmyAzAkPmebgHpw==
X-Google-Smtp-Source: ABdhPJwILxnYbPA2sbKq3/p/rSKRJ32HoC74NyeaIzgS8HVajDYodqL/vxmPLBtO+c94XKeEqy7zKaMIB1IFUZUDDzg=
X-Received: by 2002:a17:90a:31cf:: with SMTP id j15mr85790pjf.86.1630343004689; 
 Mon, 30 Aug 2021 10:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210830045925.4163412-1-stevensd@google.com>
In-Reply-To: <20210830045925.4163412-1-stevensd@google.com>
Date: Mon, 30 Aug 2021 10:02:48 -0700
Message-ID: <CACK8Z6G=O4cewAmNPfG9rpu2JTQ6T6ukE6QZ3BU0BTu7_KAqfA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Fixes for dma-iommu swiotlb bounce buffers
To: David Stevens <stevensd@chromium.org>
Cc: David Stevens <stevensd@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
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
From: Rajat Jain via iommu <iommu@lists.linux-foundation.org>
Reply-To: Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

I'm wondering why I don't see v7 on these patches on patchwork (these
patches on https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=27643&state=&q=&archive=&delegate=)
?

On Sun, Aug 29, 2021 at 10:00 PM David Stevens <stevensd@chromium.org> wrote:
>
> This patch set includes various fixes for dma-iommu's swiotlb bounce
> buffers for untrusted devices.
>
> The min_align_mask issue was found when running fio on an untrusted nvme
> device with bs=512. The other issues were found via code inspection, so
> I don't have any specific use cases where things were not working, nor
> any concrete performance numbers.
>
> There are two issues related to min_align_mask that this patch series
> does not attempt to fix. First, it does not address the case where
> min_align_mask is larger than the IOVA granule. Doing so requires
> changes to IOVA allocation, and is not specific to when swiotlb bounce
> buffers are used. This is not a problem in practice today, since the
> only driver which uses min_align_mask is nvme, which sets it to 4096.
>
> The second issue this series does not address is the fact that extra
> swiotlb slots adjacent to a bounce buffer can be exposed to untrusted
> devices whose drivers use min_align_mask. Fixing this requires being
> able to allocate padding slots at the beginning of a swiotlb allocation.
> This is a rather significant change that I am not comfortable making.
> Without being able to handle this, there is also little point to
> clearing the padding at the start of such a buffer, since we can only
> clear based on (IO_TLB_SIZE - 1) instead of iova_mask.
>
> v6 -> v7:
>  - Remove unsafe attempt to clear padding at start of swiotlb buffer
>  - Rewrite commit message for min_align_mask commit to better explain
>    the problem it's fixing
>  - Rebase on iommu/core
>  - Acknowledge unsolved issues in cover letter
>
> v5 -> v6:
>  - Remove unnecessary line break
>  - Remove redundant config check
>
> v4 -> v5:
>  - Fix xen build error
>  - Move _swiotlb refactor into its own patch
>
> v3 -> v4:
>  - Fold _swiotlb functions into _page functions
>  - Add patch to align swiotlb buffer to iovad granule
>  - Combine if checks in iommu_dma_sync_sg_* functions
>
> v2 -> v3:
>  - Add new patch to address min_align_mask bug
>  - Set SKIP_CPU_SYNC flag after syncing in map/unmap
>  - Properly call arch_sync_dma_for_cpu in iommu_dma_sync_sg_for_cpu
>
> v1 -> v2:
>  - Split fixes into dedicated patches
>  - Less invasive changes to fix arch_sync when mapping
>  - Leave dev_is_untrusted check for strict iommu
>
> David Stevens (7):
>   dma-iommu: fix sync_sg with swiotlb
>   dma-iommu: fix arch_sync_dma for map
>   dma-iommu: skip extra sync during unmap w/swiotlb
>   dma-iommu: fold _swiotlb helpers into callers
>   dma-iommu: Check CONFIG_SWIOTLB more broadly
>   swiotlb: support aligned swiotlb buffers
>   dma-iommu: account for min_align_mask w/swiotlb
>
>  drivers/iommu/dma-iommu.c | 188 +++++++++++++++++---------------------
>  drivers/xen/swiotlb-xen.c |   2 +-
>  include/linux/swiotlb.h   |   3 +-
>  kernel/dma/swiotlb.c      |  11 ++-
>  4 files changed, 93 insertions(+), 111 deletions(-)
>
> --
> 2.33.0.259.gc128427fd7-goog
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
