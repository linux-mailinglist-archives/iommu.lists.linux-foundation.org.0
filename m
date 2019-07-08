Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A761B87
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 10:02:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2351421BD;
	Mon,  8 Jul 2019 08:02:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7735A1F48
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:54:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB9DE148
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:54:07 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id q20so15280162otl.0
	for <iommu@lists.linux-foundation.org>;
	Mon, 08 Jul 2019 00:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JnWDiPvhwU3RR2emtC/EVC/Ubm3es3odvaASBd4kQ/M=;
	b=aXGHjLKf4d6Izq2S3TFpmzEpJJDOoEZvtRaGo6WwcdxCpJ8caXaYAQrWcv0oV7yKMr
	l6ONgLQISWsuHhoNPfle1vs/sxI5vBdar71xhbJageITgH+WBzGHjY1ibhcLequHNrXf
	9jqNPmwWpXYSSBikTa7XeRDj28ZxqdQ1LxCGmAnl8gK07XYt83HXD9juJQmljHkIZXh2
	5zIv4WT10RNJbPk1RQ0qqIX/U0+YVp4rAGDrA198vMsjX91YnLk0co2cN56jR0F6QaWZ
	kP716CUVL9Yg4Gz+QjsXBLNaMKJk3KAFgop1G1hT8GRtHju0nzDfODPowi14kjUPiKOi
	Qefg==
X-Gm-Message-State: APjAAAXI7R7KxZQeVJECE+18givbaHW9qU4Jibn53WqHiKX9/CQhtaFV
	OmgLy7g53rJswsZeHUUnr3sTsR42F/ELRwuE5wQ=
X-Google-Smtp-Source: APXvYqzCmeUlPg1ZvUjRzDixJzUeoktPM2AVQcwWd/J9BTHPBZLm5/K4ET0DctJ3ExlDvKL11Zj4ilWRG3yEHDL/wZ4=
X-Received: by 2002:a05:6830:210f:: with SMTP id
	i15mr13375924otc.250.1562572447087; 
	Mon, 08 Jul 2019 00:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190625090135.18872-1-hch@lst.de>
In-Reply-To: <20190625090135.18872-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2019 09:53:55 +0200
Message-ID: <CAMuHMdX9QoEhyrAg_5WD03MB3bLoq6br-ZANEsLa=j9GPrs8hg@mail.gmail.com>
Subject: Re: switch m68k to use the generic remapping DMA allocator v2
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
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

On Tue, Jun 25, 2019 at 11:01 AM Christoph Hellwig <hch@lst.de> wrote:
> can you take a look at the (untested) patches below?  They convert m68k
> to use the generic remapping DMA allocator, which is also used by
> arm64 and csky.
>
> Changes since v2:
>  - fix kconfig dependencies to properly build on sun3
>  - updated a patch description to better explain why we are doing this

Thanks, both applied and queued for v5.3.

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
