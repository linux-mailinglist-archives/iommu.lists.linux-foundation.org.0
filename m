Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48827315108
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 14:58:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC50686BA8;
	Tue,  9 Feb 2021 13:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 956MaXGyY2Yt; Tue,  9 Feb 2021 13:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 50BD286B7B;
	Tue,  9 Feb 2021 13:58:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D382C013A;
	Tue,  9 Feb 2021 13:58:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA1B8C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D7DE58723B
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-hRRWqH2-qb for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 06:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9F65186003
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:09:38 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id q14so11155489ljp.4
 for <iommu@lists.linux-foundation.org>; Mon, 08 Feb 2021 22:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=EN0Mzb6s8Tl+sO9KcM8dEOwC7FeQgGNzUGgSeuHZRDo=;
 b=QiOwygcdrjYgf/3lDY8pI7Ji34qvamUJReMpjfXTUuvpzEcBEFrIOOiUI8xr04NjZU
 tpwH6Mnld5gW5qUqlcT9yclH/H8vFgE74ftvEsxScW/+eNUafP6SF28PnC/FqJsK0wXw
 UALR75hzAWTlMJczQAzJgq1zobcY00uLi654VtOoTCD5qOkMlYDcrFKxsW8nOAxEPNxw
 WOL5S79DTZlWQCi0Re6jfrDqg034CDDoVLCPh75gl2R1gKqxXAIoqFdBXAS+juaAqs/D
 U1bhIwdWGgY5hgvpirFgjr7we1NAuDFcJnrmXzAdj0ahBNHgu2U4sqd3h7/I3c4UQTYx
 DnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=EN0Mzb6s8Tl+sO9KcM8dEOwC7FeQgGNzUGgSeuHZRDo=;
 b=HgFvwsoIGA+EbZhUnQPRxOHQ9N21Kha5H+qAahtsdqjIsntheQyoiGdnsn0a+aeg3+
 s5nCG41l3TcMyQsIJDKBKB+SsuGZ84FgPscInmqzjiDImAzacMHIJGH+VOTzWp9yfHWd
 mK50hVuewuznX4ZuXD33ecvvjx1COF8EIgvV6U0Seyl2tcXrG4m1MuhKPQZn7rH4n4FA
 PCYIjBGzUiLVNDve0s0rXU7+rdK+J2VGBYaiiVRi0xcn0tsjJ2JAqZNYvbVqXgP2h6N9
 gGZCEu+4ta7jHobAYmG4jpDum1aYFTUZJb3/2n42fxvYJJEaHSEAx1KykSbkuj6W4YrH
 n4Fw==
X-Gm-Message-State: AOAM533f1VdWF849Lo3tWn4ME961AgD+/4JExaYlWvkG/bbWXpqhWncj
 Sabm9D+rR75+tAy/VHva6C5H4m3c/J0PFQ7BUd9Khg==
X-Google-Smtp-Source: ABdhPJzg+OLmID5j3R8uwBU7Ya6jUJbEGbdW5wxF4lUjHYE+P58BfiZAah3eC7aYCYxA/+068IMOyaRZUMqwz3AR+s0=
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr2207729ljr.480.1612850976581; 
 Mon, 08 Feb 2021 22:09:36 -0800 (PST)
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 9 Feb 2021 11:39:25 +0530
Message-ID: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
Subject: DMA direct mapping fix for 5.4 and earlier stable branches
To: hch@lst.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Tue, 09 Feb 2021 13:58:38 +0000
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, obayashi.yoshimasa@socionext.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

Hi Christoph, Greg,

Currently we are observing an incorrect address translation
corresponding to DMA direct mapping methods on 5.4 stable kernel while
sharing dmabuf from one device to another where both devices have
their own coherent DMA memory pools.

I am able to root cause this issue which is caused by incorrect virt
to phys translation for addresses belonging to vmalloc space using
virt_to_page(). But while looking at the mainline kernel, this patch
[1] changes address translation from virt->to->phys to dma->to->phys
which fixes the issue observed on 5.4 stable kernel as well (minimal
fix [2]).

So I would like to seek your suggestion for backport to stable kernels
(5.4 or earlier) as to whether we should backport the complete
mainline commit [1] or we should just apply the minimal fix [2]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=34dc0ea6bc960f1f57b2148f01a3f4da23f87013
[2] minimal fix required for 5.4 stable kernel:

commit bb0b3ff6e54d78370b6b0c04426f0d9192f31795
Author: Sumit Garg <sumit.garg@linaro.org>
Date:   Wed Feb 3 13:08:37 2021 +0530

    dma-mapping: Fix common get_sgtable and mmap methods

    Currently common get_sgtable and mmap methods can only handle normal
    kernel addresses leading to incorrect handling of vmalloc addresses which
    is common means for DMA coherent memory mapping.

    So instead of cpu_addr, directly decode the physical address from
dma_addr and
    hence decode corresponding page and pfn values. In this way we can handle
    normal kernel addresses as well as vmalloc addresses.

    This fix is inspired from following mainline commit:

    34dc0ea6bc96 ("dma-direct: provide mmap and get_sgtable method overrides")

    This fixes an issue observed during dmabuf sharing from one device to
    another where both devices have their own coherent DMA memory pools.

    Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 8682a53..034bbae 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -127,7 +127,7 @@ int dma_common_get_sgtable(struct device *dev,
struct sg_table *sgt,
                        return -ENXIO;
                page = pfn_to_page(pfn);
        } else {
-               page = virt_to_page(cpu_addr);
+               page = pfn_to_page(PHYS_PFN(dma_to_phys(dev, dma_addr)));
        }

        ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -214,7 +214,7 @@ int dma_common_mmap(struct device *dev, struct
vm_area_struct *vma,
                if (!pfn_valid(pfn))
                        return -ENXIO;
        } else {
-               pfn = page_to_pfn(virt_to_page(cpu_addr));
+               pfn = PHYS_PFN(dma_to_phys(dev, dma_addr));
        }

        return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
