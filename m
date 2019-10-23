Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E2E1E44
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 16:36:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A56C2B49;
	Wed, 23 Oct 2019 14:36:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67AD8AF3
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:36:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B9773831
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:36:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id s71so4699572oih.11
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 07:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xxo/chYm01QC8eTInCjxWj6Txmh3kYU/ouOy2udw44M=;
	b=CHX3VYY/GSsfGAgIBdrHIxo8Y5yKNtGe0lluiWHgPeVhb8ZWQLxIVs3nSh3QzNk9/+
	wXmlv1Atj/UeD89yNBwZ+AEa5Tp0cKZzrolQSSlq1TMVrxcAMhjVEXmVdKZHkz8b0bIn
	eL2bMbqiYibMaMuBRknHrcFMy3j1pnivHcYeCw6wZvtRzlThpLQpfAJU7K5i8CIvGG9+
	QfO1n9HiRzm3E8eG9yS/pBfvBUJij81vsuN/Zwfapm2yVMVe98qh56fzQAOkXHa5iWcS
	wTpJG8sC3/joQMN+IMuMsSjU0lTSmbDR71lh2xj9SopcGpq8q/yLSY/8t7UeVQlO+16g
	XV9A==
X-Gm-Message-State: APjAAAWMe46otBvVXNFHmAM3zCelckLZEnxnTMT012V8OluLmcjtDOah
	hE056GAwwsT5LCPat88qQevQBL+QvjSaf21aepw=
X-Google-Smtp-Source: APXvYqxDclxiIFroHlO24WZd1qvRSeKC3vh9yrg9lUgtANFtKnt58omlgaU/40OuK3FT1h/IrrwozE4TWGFgB2yxrRY=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr216403oiy.148.1571841378774;
	Wed, 23 Oct 2019 07:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191023135941.15000-1-yuehaibing@huawei.com>
In-Reply-To: <20191023135941.15000-1-yuehaibing@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2019 16:36:07 +0200
Message-ID: <CAMuHMdV5dBGbB4DCwidpqeFkxtQGzrh=qO8Ph-Se3ZyGnrGpbw@mail.gmail.com>
Subject: Re: [PATCH -next] iommu/ipmmu-vmsa: Remove dev_err() on
	platform_get_irq() failure
To: YueHaibing <yuehaibing@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
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

On Wed, Oct 23, 2019 at 4:01 PM YueHaibing <yuehaibing@huawei.com> wrote:
> platform_get_irq() will call dev_err() itself on failure,
> so there is no need for the driver to also do this.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
