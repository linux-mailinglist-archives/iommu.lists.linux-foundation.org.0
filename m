Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03F9DEF9
	for <lists.iommu@lfdr.de>; Tue, 27 Aug 2019 09:46:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 519891078;
	Tue, 27 Aug 2019 07:46:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 64B65105D
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 07:46:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
	[210.131.2.91])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1CC0710
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 07:46:05 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id x7R7jwsd016611
	for <iommu@lists.linux-foundation.org>; Tue, 27 Aug 2019 16:45:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7R7jwsd016611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1566891959;
	bh=CCtCL19DmuvrV2VqAgkqWIfPFYfgDfnJCKU/CL8uRio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kO8JlZ8lHvf/loSSFVmHqVGTkXHvwOmoYPGGxY945W4tHS65a4VFoDi25YiwLrW5E
	mF0kkdIZEN+NR7anSem3DzXktPlkTTkcguWNZLfgGM6E3sNalWadrRCn0/mTWdi+qF
	52HyiruY4iV8R75/QcAic2GbU4GkYCKz77z+DUZDKDHwW9MeqhIhU/ulpnk/+AlQ0M
	+3Wvrq+ddyCjvcXKPqz7EzFI5jwNVcq4vqS7rqKoBf8/B5FZaFZIJeXVuu7egMCLL2
	BgAfBn6oYOl6uSw+dh1zVpaDd69w85L5ifK1GTXslRh3qA4AJt8GHT5DaBZWfZ6oox
	62hWYPVXkHmgw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m18so10232587vsr.0
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 00:45:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUSLwRXyx/6ToBe7jh6BPVpFbmFvYzvgD74+ya8mWhJ0+BiZfmZ
	XrOsMWuO8oQ2honHbBXIvwDCLaXqYb7LBRx/1xA=
X-Google-Smtp-Source: APXvYqw3kFkP7AW1Myq4vwC0HTeWHl7qNE1Xu8mQsAgOMCEnoA+VGlGvJAQBc5iBngpOl9rP3s1Rs35DhGciNkmYfkU=
X-Received: by 2002:a67:fe12:: with SMTP id l18mr12861854vsr.54.1566891956209; 
	Tue, 27 Aug 2019 00:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190506223334.1834-1-nicoleotsuka@gmail.com>
	<20190506223334.1834-3-nicoleotsuka@gmail.com>
	<CAK7LNARacEorb38mVBw_V-Zvz-znWgBma1AP1-z_5B_xZU4ogg@mail.gmail.com>
	<CAK7LNAQfYBCoChMV=MOwcUyVoqRkrPWs7DaWdzDqjBe18gGiAQ@mail.gmail.com>
	<20190825011025.GA23410@lst.de>
	<CAK7LNAQb1ZHr=DiHLNeNRaQExMuXdDOV4sFghoGbco_Q=Qzb8g@mail.gmail.com>
	<20190826073320.GA11712@lst.de>
In-Reply-To: <20190826073320.GA11712@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Aug 2019 16:45:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYOLEboUTO4qPx2z7cqwDrHBO1HFHG8VzZEJ15STv+nw@mail.gmail.com>
Message-ID: <CAK7LNATYOLEboUTO4qPx2z7cqwDrHBO1HFHG8VzZEJ15STv+nw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-contiguous: Use fallback alloc_pages for
	single pages
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>,
	linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Chris Zankel <chris@zankel.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mmc <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	iommu@lists.linux-foundation.org, iamjoonsoo.kim@lge.com,
	Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 26, 2019 at 4:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Aug 26, 2019 at 11:05:00AM +0900, Masahiro Yamada wrote:
> > This is included in v5.3-rc6
> > so I tested it.
>
> So there is no allocation failure, but you get I/O errors later?

Right.

>
> Does the device use a device-private CMA area?

Not sure.
My driver is drivers/mmc/host/sdhci-cadence.c
It reuses routines in drivers/mmc/host/sdhci.c



>  Does it work with Linux
> 5.2 if CONFIG_DMA_CMA is disabled?

No.
5.2 + disable CONFIG_DMA_CMA
failed in the same way.




-- 
Best Regards
Masahiro Yamada
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
