Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDB502E3
	for <lists.iommu@lfdr.de>; Mon, 24 Jun 2019 09:16:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B460F5AA;
	Mon, 24 Jun 2019 07:16:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 288C12C
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 07:16:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 68378710
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 07:16:42 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a128so9049310oib.1
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 00:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+VaP9DcJntoExkzdbDVYZcYt6yhIrCESVYXgeB0JPho=;
	b=F6lcQryV2i4cCY7eoT7Xh3/I+tVO5A6tESI35WZ25C/zWjuUM8Fpk9q085dp+Rz8nU
	in4YcETVNvmmPyce+D+GCnBkUZKxDa4Vay7TApdd4FkGHTJXl74G29vmuoTM7w/YGpBl
	wkgisKjTKuWNW4+0HsO3+2W9ooL6AZta5YOwebAZOv/4n50lzMjZXaCf0TISRWuinV0S
	91TpfOIU/Jgj2nkR0P9CEK+ERgnT3cptDPS0KWSkbRECB2s/U16dK+i+Toy7LzkA+0hh
	5O87Z8eN5H5BTqT6EFhEeFrtD7eclcA3+clEyDZBy1PsOox/kzc6SF7wVxVxfwgzP8jV
	h7eA==
X-Gm-Message-State: APjAAAV+wJYAxXMEZZWFbo29cQvTy8idEXhw/k4zkf1SEGp9q3CW5eh0
	YLHQG5cB9epgJ78AXFkNDdlM+BE644ZGbf8qaEs=
X-Google-Smtp-Source: APXvYqwjNpJZS5JGDSd4vFCHzeEA5Jvi4zbkSDl1ADx6436Ln2bc4donTa2LIBvyHioB/b/v4b+ZniLu5PjJQ3MIyuw=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr9868425oif.131.1561360601551;
	Mon, 24 Jun 2019 00:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190614102126.8402-1-hch@lst.de>
In-Reply-To: <20190614102126.8402-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2019 09:16:30 +0200
Message-ID: <CAMuHMdUbuTc+MWqDFw=RnYxtiNQPQkzJ91KDuAQbhMq533tBCQ@mail.gmail.com>
Subject: Re: [RFC] switch m68k to use the generic remapping DMA allocator
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Christoph,

On Fri, Jun 14, 2019 at 12:21 PM Christoph Hellwig <hch@lst.de> wrote:
> can you take a look at the (untested) patches below?  They convert m68k
> to use the generic remapping DMA allocator, which is also used by
> arm64 and csky.

When building for Sun-3:

kernel/dma/remap.o: In function `arch_dma_alloc':
remap.c:(.text+0x316): undefined reference to `__dma_direct_alloc_pages'
remap.c:(.text+0x32a): undefined reference to `arch_dma_prep_coherent'
remap.c:(.text+0x34e): undefined reference to `arch_dma_mmap_pgprot'
remap.c:(.text+0x378): undefined reference to `__dma_direct_free_pages'
remap.c:(.text+0x3f4): undefined reference to `arch_dma_prep_coherent'
remap.c:(.text+0x40a): undefined reference to `__dma_direct_alloc_pages'
kernel/dma/remap.o: In function `arch_dma_free':
remap.c:(.text+0x446): undefined reference to `__dma_direct_free_pages'
remap.c:(.text+0x4a8): undefined reference to `__dma_direct_free_pages'
kernel/dma/remap.o: In function `dma_atomic_pool_init':
remap.c:(.init.text+0x66): undefined reference to `arch_dma_prep_coherent'

Doing

-       select DMA_DIRECT_REMAP if MMU && !COLDFIRE
+       select DMA_DIRECT_REMAP if MMU && !COLDFIRE && !SUN3

in arch/m68k/Kconfig fixes the build.

Alternatively, you could use:

-       select DMA_DIRECT_REMAP if MMU && !COLDFIRE
+       select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
