Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C56A0193
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 14:24:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55DA02D7E;
	Wed, 28 Aug 2019 12:24:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1315E2D12
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 12:24:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
	[210.131.2.91])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E8398BC
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 12:24:36 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
	[209.85.221.173]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id x7SCOLCG011134
	for <iommu@lists.linux-foundation.org>; Wed, 28 Aug 2019 21:24:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7SCOLCG011134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1566995062;
	bh=QGwpmYKpkBfkJkR52bVEAkpX4zw0mwzUiEGIdCDkwxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fIzFW8bgi8hLSJgmQBbOSUOLIa7CJMZyUJ8KYrwFi+QR8+2VLIWz8WUCiF0uHxCqJ
	NDlOLKYE+pIP9kvY4eP1Cf1N+zG+K/Z5egByhE5ywEY+MwiIT7X7smpgfyN5H2CpgQ
	OmDbS5xeEkkoGVbAWsK7sXSLSumlSSjs+MJHmxzCOk9n6csZ8O92BHxYUTx3F1p5M4
	f+LqJ/1xJVheohby2PU1O8Nw7v88Hnx7F6zCTRQwBloI1uwQtl8DHmvZu12e0PyoqD
	u26s3Wc4v+dph34ijUwypiud4S3EifSgcGpo27MVDJ6oQhmaJu5p9QmgMCpQspwZo1
	2+UrwxWshbpwQ==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id b11so561788vkk.10
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 05:24:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUKRI0IDWw7f4LVbGISqX16tq+hC3UM/E4dSxHx/Xrml1w5/QCW
	t6YvbmkFhIHHZPtDUnEOG3bbD5e1S31X6+FBS4U=
X-Google-Smtp-Source: APXvYqzOQYU2Q+Xq/DN7mTcKzBb0P1kiiE+ggL4N1BaGeuzN90KCZ6nzT8nGJkbkDhur/ilmD52mrtpqBPxR1Kulykg=
X-Received: by 2002:ab0:442:: with SMTP id 60mr1554937uav.109.1566995060173;
	Wed, 28 Aug 2019 05:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190506223334.1834-1-nicoleotsuka@gmail.com>
	<20190506223334.1834-3-nicoleotsuka@gmail.com>
	<CAK7LNARacEorb38mVBw_V-Zvz-znWgBma1AP1-z_5B_xZU4ogg@mail.gmail.com>
	<CAK7LNAQfYBCoChMV=MOwcUyVoqRkrPWs7DaWdzDqjBe18gGiAQ@mail.gmail.com>
	<20190825011025.GA23410@lst.de>
	<CAK7LNAQb1ZHr=DiHLNeNRaQExMuXdDOV4sFghoGbco_Q=Qzb8g@mail.gmail.com>
	<20190826073320.GA11712@lst.de>
	<CAK7LNATYOLEboUTO4qPx2z7cqwDrHBO1HFHG8VzZEJ15STv+nw@mail.gmail.com>
	<20190827075021.GA953@lst.de>
	<CAK7LNAQZ+bueZZzSoMADmgLjWNvijHRV=wLQzN_kvLG3b5Uu+w@mail.gmail.com>
	<20190827115541.GB5921@lst.de>
	<CAK7LNAQ_nQcBt=xH1-h+=co85mTxFgbe+_46Gu4LaNsDSm+kYA@mail.gmail.com>
In-Reply-To: <CAK7LNAQ_nQcBt=xH1-h+=co85mTxFgbe+_46Gu4LaNsDSm+kYA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 28 Aug 2019 21:23:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvz=TTe+3OyLrtUqDuTUTn1dg9Sk-t3BD_OFZfViCPMw@mail.gmail.com>
Message-ID: <CAK7LNATvz=TTe+3OyLrtUqDuTUTn1dg9Sk-t3BD_OFZfViCPMw@mail.gmail.com>
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

On Wed, Aug 28, 2019 at 7:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Christoph,
>
> On Tue, Aug 27, 2019 at 8:55 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Tue, Aug 27, 2019 at 06:03:14PM +0900, Masahiro Yamada wrote:
> > > Yes, this makes my driver working again
> > > when CONFIG_DMA_CMA=y.
> > >
> > >
> > > If I apply the following, my driver gets back working
> > > irrespective of CONFIG_DMA_CMA.
> >
> > That sounds a lot like the device simply isn't 64-bit DMA capable, and
> > previously always got CMA allocations under the limit it actually
> > supported.  I suggest that you submit this quirk to the mmc maintainers.
>
>
> I tested v5.2 and my MMC host controller works with
> dma_address that exceeds 32-bit physical address.
>
> So, I believe my MMC device is 64-bit DMA capable.
>
> I am still looking into the code
> to find out what was changed.


I retract this comment.

Prior to bd2e75633c8012fc8a7431c82fda66237133bf7e,
the descriptor table for ADMA is placed within the
32-bit phys address range, not exceeds the 32-bit limit.

Probably, my device is not 64-bit capable.

I will talk to the hardware engineer,
and check the hardware spec just in case.

Thanks.

-- 
Best Regards
Masahiro Yamada
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
