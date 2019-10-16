Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755AD89E0
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 09:37:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00C63A7F;
	Wed, 16 Oct 2019 07:37:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46B85941
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB1345D3
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:37:24 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 60so19306771otu.0
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 00:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WgvLqvd3HqGI5kSw300TNFW7n5vex69U8QqkYqkOx30=;
	b=fvhSQ7eF/wFF66QsNfytn7ynA31vENr4zVSb78JkI2izEopPzck3VZkG4+jp2uKFDF
	OeW9pC3B2JZwZD7fseg0wjRIXSoBHB/r9MjCUIdhUrL08B2d1B8T8+Y4iUDB7HerdqHp
	npaLPBm1+oIzW+fZLuaLiu3ihyb1inDMdgB5BHdG0bXiA4WpkQwLnX1fhy525Bf22mlq
	rAHeXDu6V5DD8WBzngrnWnaPAvFgVPI+mFbSBXxLahVUFK0bbtBn1czAAXeyXT8oMgrf
	w8DKDC1sHfsSDJ37feC1nQG6P/R9AeJlAtz76lCxeJF4duYY1cv6gG3R/t8Tz9FZX7YH
	lRXQ==
X-Gm-Message-State: APjAAAUZ//khPGXw5qSMGGg4xHsE5HkOdNhx24j0/sF7txyYYD6i9wMD
	PUv3BqZMfs//zOFq50qoZ73ipmrPEJarSngf8vI=
X-Google-Smtp-Source: APXvYqylDyXm4/2DWkPaho/HBt8brkDULyUp3dfIMBVyRdnps8DOBDPCrg5aXi2G4i8hyMb6wB8HWjgez26s7NP9htI=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr22986531otk.39.1571211444117; 
	Wed, 16 Oct 2019 00:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1571137920-15314-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571137920-15314-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Oct 2019 09:37:13 +0200
Message-ID: <CAMuHMdW9L9Z7_avmGfEF8FbuYPkeX2UTx6Tup35bg+yb07a4vg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] iommu/ipmmu-vmsa: Calculate context registers'
	offset instead of a macro
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

On Tue, Oct 15, 2019 at 2:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch uses ipmmu_features values instead of a macro to
> calculate context registers offset. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

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
