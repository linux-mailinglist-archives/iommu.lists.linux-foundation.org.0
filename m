Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B40520712
	for <lists.iommu@lfdr.de>; Mon,  9 May 2022 23:51:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5301581025;
	Mon,  9 May 2022 21:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XajeT5CAIZC7; Mon,  9 May 2022 21:51:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7150580F3D;
	Mon,  9 May 2022 21:51:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B80EC0081;
	Mon,  9 May 2022 21:51:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A88EC002D
 for <iommu@lists.linux-foundation.org>; Mon,  9 May 2022 21:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FD1940873
 for <iommu@lists.linux-foundation.org>; Mon,  9 May 2022 21:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs7GJbku7apu for <iommu@lists.linux-foundation.org>;
 Mon,  9 May 2022 21:51:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2429C40868
 for <iommu@lists.linux-foundation.org>; Mon,  9 May 2022 21:51:44 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ebf4b91212so159901977b3.8
 for <iommu@lists.linux-foundation.org>; Mon, 09 May 2022 14:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AvO3ygd/UqQBdhP/KL3f8qnTPDYPqb0azYvzR8YOfT8=;
 b=R3Bl52ygNd7YCtVGI1Dw5zkcyKwpLE8CGq7E2JVCvhEmmiwnJ4wmVpVM4hlSvlECuc
 OQDjh4PbkC9KiRGsYt0AXq17RBizWsfzpjBDi44Q8JKJVglwWIHC0BYVTNq/nQC/gYia
 I4x5J+hUljknRIc8rVa8KUkLegjNrIQsTA4RjmG7enjhjU7pf9lmdlt0hY4Xx2xd7Eud
 CbDnUZubySlms7d+G+FN3irKBt4FdgSC6BgxnsVCA3QRtieNX4s3giofwSk9qxOPcB/H
 bqwRhSvS+2yebAoixhhQ2quEtBR3/WErNLr/69uUN0Bm818iDpAErl2YPNBfXBbMM2zy
 eOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvO3ygd/UqQBdhP/KL3f8qnTPDYPqb0azYvzR8YOfT8=;
 b=0j7WKxN6yC5DTpFCr1fnCIlaQePyIw2C7QOXTJA4uktjsvy/kgyuUpTDBE4ocLebDC
 e+OpBIWw8c5hoFbbriVjt04030V3ErNHOhcl7W+HDKDe4dPBJhYszq5ND6LvgXTCWRqG
 F3UuplD2e2vTdJOVgLJ/GoRKnn3O48VCjmElWGHPx0xicQN0vFnLu9S+chXx2mMPirRF
 DvIDpphBxun7orn5NJNbYXZAI+DH8u5TO5R7U/bwiiTTnDXYzZIvZEwLBo5ReG+fgb4f
 ESnEzMISEwHU8shmFR+im/+ve1LWT17A8YZCEJBp3uViZ7uIaL83lHkMXjWyACD0PZiu
 zVAg==
X-Gm-Message-State: AOAM533q7+29lvWSZHvDPwRro6kjJHzWVYD6QvJVnoKXMZc1E4tTkO4u
 pi1apyd7nOo0sBzFWnOv/tX1H8+GPFdjHae1UxYXrQ==
X-Google-Smtp-Source: ABdhPJz66qKQ182cMfzUcfRuUB+ezFafeLeHufnODn96xLMf/SFpFj0VGuEdSlO2r018rYSvQhdo92Derlajd83ax3s=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr16673482ywe.268.1652133101967; Mon, 09
 May 2022 14:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220421074204.1284072-1-hch@lst.de>
 <CACRpkdbdKBfmXGdyTm3T-MFAK30N-z4KH0k8eD8F7xaYUbDDhA@mail.gmail.com>
 <Ynk2wjRyH05uEJiO@shell.armlinux.org.uk>
In-Reply-To: <Ynk2wjRyH05uEJiO@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 May 2022 23:51:29 +0200
Message-ID: <CACRpkdYVrPt_GHt19pT2BQZJ08QrS87XfvU-aWVibzP2qBSV2g@mail.gmail.com>
Subject: Re: fully convert arm to use dma-direct
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Andre Przywara <andre.przywara@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Mon, May 9, 2022 at 5:44 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> Assabet is what needs testing for that, or one of the SA1110 machines.
> I'm away from home on my boat (and have been for the last two and a bit
> weeks) so can't test. Sorry.

Hm I actually have an Assabet, but I never even powered it up. I'm
on parental leave for another week but after that I could actually
try to get that machine up, but it'd be a bit late for this merge window
indeed.

BR
Linus Walleij
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
