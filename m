Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 937485B113
	for <lists.iommu@lfdr.de>; Sun, 30 Jun 2019 19:57:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F9F1CD1;
	Sun, 30 Jun 2019 17:57:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D614DCAF
	for <iommu@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 17:57:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 78B75782
	for <iommu@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 17:57:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z75so4873022pgz.5
	for <iommu@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gnuu4DiqCU91G6SZ+lCF3hdalsnxFMZ0yY9Dk7Kz1QA=;
	b=V18MuBosTg022k/LVYNkzC726h/ARIUohyhekRGZsu6x8knCqgFodcSGuo0RpEK0+q
	ZiYlgVi4U6iJWV1SuDG1JI9qrTx/Ct/YhrH0+kdLXL7XLOI4oChqw8f4/TRtT32faYeB
	Im9UDaDFtYv6eS/aLKeQjBzqYTUpJLAae5UmDHRZRUfFKJFPYpn6pcCLKpnoySLdl73B
	xChmUsxefocq+XY0NhqoBF//eHALjX95RZqNn9IJyR0BU4T2jwfrJM33px24no7NWthR
	qsyp+6RoBGdY5QcXFctRq0q9galGa+RTo24D9UFNI5VlRhD+hhJaTQwaTw/mRGJsVrpy
	kPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gnuu4DiqCU91G6SZ+lCF3hdalsnxFMZ0yY9Dk7Kz1QA=;
	b=NN9Yiqv2EXFXeUnjnw62CyEQw1G8PdnoxJcxPJLyhU+KvEoG7i6sIwjxnFboiJvpPA
	7ytkwCycoDNKToNi9vkbLy+g/2WYvXijudntouNEos1+uvufQXkCSJBQ5TnCx7iNMz1c
	T0d9JgI1kPJalz/VSUxiXjf8onU24y8yzNwbc9CtkoMA3liWQrEjYMzMU4EvMjzTw7Lp
	HJ+axFqqu5uUdUPnyhcOSSGPVMw22fva9Gbt8E8LQYnLEPQmsDBcIuJmj/fotDeX/w9i
	Nc+wXL0fA+Jco4TnOciAIT6u+6wUiFXx0HoTtxszLS9fN77JZV8ZTnAlCY9X9GyS+uYj
	oJQA==
X-Gm-Message-State: APjAAAVFpcrIKdw7TWe0qxQhw46gPMK7v4CjBgzIuRGvDjliglDbII+A
	KOkgQetvJpXRubKbrCLFmKtJF85h
X-Google-Smtp-Source: APXvYqzj6+5iNSjYh0RzmaHJwkhvWgSEB7n6qVP8liVj7jGcYNf+WNHxi6y4sXhMbXcqAc8yWHsLNA==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr11653965pgp.72.1561917427786; 
	Sun, 30 Jun 2019 10:57:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	m5sm7841040pfa.116.2019.06.30.10.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jun 2019 10:57:06 -0700 (PDT)
Subject: Re: [PATCH] MIPS: only select ARCH_HAS_UNCACHED_SEGMENT for
	non-coherent platforms
To: Christoph Hellwig <hch@lst.de>, paul.burton@mips.com
References: <20190630164805.12229-1-hch@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c1d2f389-c674-5c85-8c90-be66c20273e3@roeck-us.net>
Date: Sun, 30 Jun 2019 10:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190630164805.12229-1-hch@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 6/30/19 9:48 AM, Christoph Hellwig wrote:
> While mips might architecturally have the uncached segment all the time,
> the infrastructure to use it is only need on platforms where DMA is
> at least partially incoherent.  Only select it for those configuration
> to fix a build failure as the arch_dma_prep_coherent symbol is also only
> provided for non-coherent platforms.
> 
> Fixes: 2e96e04d25 ("MIPS: use the generic uncached segment support in dma-direct")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

This patch fixes

kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Tested-by: Guenter Roeck <linux@roeck-us.net>

Mips images still don't boot in -next after this patch is applied, so
"Tested-by:" only means that affected configurations now build without
link error, not that they actually work.

Guenter

>   arch/mips/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 61a390c2f2c1..caf480275a31 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -8,7 +8,6 @@ config MIPS
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
> -	select ARCH_HAS_UNCACHED_SEGMENT
>   	select ARCH_SUPPORTS_UPROBES
>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> @@ -1120,6 +1119,7 @@ config DMA_NONCOHERENT
>   	bool
>   	select ARCH_HAS_DMA_MMAP_PGPROT
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_UNCACHED_SEGMENT
>   	select NEED_DMA_MAP_STATE
>   	select ARCH_HAS_DMA_COHERENT_TO_PFN
>   	select DMA_NONCOHERENT_CACHE_SYNC
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
