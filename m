Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EEB4564A
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 09:27:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F709F43;
	Fri, 14 Jun 2019 07:27:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 429F6F12
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:27:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5A34EE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:27:21 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so982680lfm.11
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 00:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pdzPCh9Iq6DsZwmNtrM2YKJ68uEFiOmJCFPMQ9QBxhg=;
	b=JbNiPkgsTDwTLGGUpS+jyLGNg2rQxFXyAniXgw21G2s7ctM7dDoUk4bEalP588qTZC
	UpHGPpsMfg51+0smZr2bvi4U3LmlpWc2OLsZyZI61L6eunDsafMDmEfDf53qMT4743VL
	JvWAgEvduFgeBdouYMoVN0Q+0ReUQgzyGZu9Uq84Z1cJZnSZkrlBDrEz0Hr495ZWUhQ6
	4i7Jy8M/Cm2XTEeqOf7K31tSHDT8b+HcQe9xiWnd9PAGrpAIqEcBBPostWUPd+oGqiTs
	nG8M0M00UyfXh4rKCv+D9eWJjdtd2Cr0bUJXy51zzukifBX/TnmgHd+m734bCGXlCRK6
	T3oQ==
X-Gm-Message-State: APjAAAXl6riEaFlW0BblLmwPM7bRoqp6Z3sKAEbBxY3uWp4aBjGMUpxo
	///ZI/RcBRaeuPxo2/BRxi/ZFP6Muk/TRQYBmdA=
X-Google-Smtp-Source: APXvYqyZPsGGwkPkWixMhMUECj/EG4qRfXowB8lnrcuhtq1khDIasqYBoWJAfAgpDFug4QWIzzNZRN21TX7Vx1y1Gng=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr8197569lfp.90.1560497239682; 
	Fri, 14 Jun 2019 00:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
	<20190614071800.GB8420@lst.de>
In-Reply-To: <20190614071800.GB8420@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2019 09:27:06 +0200
Message-ID: <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
	of a workaround
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>, linux-block@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>
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

On Fri, Jun 14, 2019 at 9:18 AM Christoph Hellwig <hch@lst.de> wrote:
> On Thu, Jun 13, 2019 at 10:35:44PM +0200, Geert Uytterhoeven wrote:
> > I'm always triggered by the use of min_t() and other casts:
> > mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
> > dma_max_mapping_size() returns size_t, which can be 64-bit.
> >
> >  1) Can the multiplication overflow?
> >     Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
> >     prevent overflow for max_req_size"), but I thought I'd better ask.
> >  2) In theory, dma_max_mapping_size() can return a number that doesn't
> >     fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
> >     is zero?
>
> This really should use a min_t on size_t.  Otherwise the patch looks
> fine:

Followed by another min() to make it fit in mmc->max_req_size, which is
unsigned int.

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
