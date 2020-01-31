Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91514E9EA
	for <lists.iommu@lfdr.de>; Fri, 31 Jan 2020 10:07:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 000B720479;
	Fri, 31 Jan 2020 09:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZRXwy47bsrI; Fri, 31 Jan 2020 09:07:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 46D592046B;
	Fri, 31 Jan 2020 09:07:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A47CC1D87;
	Fri, 31 Jan 2020 09:07:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D69E4C0171
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 09:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C508A86890
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 09:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMXdPxFFG4In for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 09:06:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9CABA861F0
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 09:06:59 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i6so5906076otr.7
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 01:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FD1m1C7Z6owu7pJKCcZNi0kfjnO20uBFbl49wSgK5Lg=;
 b=YXpHAf4Ux24sPHPpCEY85lxuK7cwOVpBs2JCXefKC/J3Oi7weFeGHZ0oNaqtnTv87Y
 rIK8i8h3uCPHeUXC+MCud1LyxzYfV6QHTPUlMlcJJrAFuTs2JB6nrhv6vsN1DDhixqqA
 umSnYvJjYmsIs7tMwWGj1looELsdkhcUnI4V9aGt8eLJDQMg0zLAQS20GVOI5LT2Bq5v
 YHS2q8Zvrm0aFDFdtBllIZivZDv6a1jfLgSRz9+Zpps1qh1n3SnSHTbQsIR8CVyBD7jF
 xlyBp4Dndn2g8LxH+tzzEi6Sh5oZzM/11/LPRASAoxvRZEPb1oNiQFpfRojYlrT6PcGG
 a1jw==
X-Gm-Message-State: APjAAAXEVpOJ0kD9MnA6V7X2EKQ2dOA9yysuxM6CC1ASExBvdYKMCHWe
 YVz35U9boXjH4yGd6NFApwlACuuYyOV6+lph8QU=
X-Google-Smtp-Source: APXvYqxXnQrTWkpOmfZ4c1F1M3YsJErcFXJpAlowXPQwo2N4eVzTPJn2pP+D0bi+mHOGRWxfvp5vAPdvsTIebEfZIQg=
X-Received: by 2002:a05:6830:1d55:: with SMTP id
 p21mr6833651oth.145.1580461618754; 
 Fri, 31 Jan 2020 01:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20200130191049.190569-1-edumazet@google.com>
 <e0a0ffa9-3721-4bac-1c8f-bcbd53d22ba1@arm.com>
In-Reply-To: <e0a0ffa9-3721-4bac-1c8f-bcbd53d22ba1@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2020 10:06:47 +0100
Message-ID: <CAMuHMdVSyD62nvRmN-v6CbJ2UyqH=d7xdVeCD8_X5us+mvCXUQ@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: dynamic allocation of hash table
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <jroedel@suse.de>, Eric Dumazet <eric.dumazet@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, Christoph Hellwig <hch@lst.de>
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

Hi Robin,

On Fri, Jan 31, 2020 at 12:46 AM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2020-01-30 7:10 pm, Eric Dumazet via iommu wrote:
> > Increasing the size of dma_entry_hash size by 327680 bytes
> > has reached some bootloaders limitations.
>
> [ That might warrant some further explanation - I don't quite follow how
> this would relate to a bootloader specifically :/ ]

Increasing the size of a static array increases kernel size.
Some (all? ;-) bootloaders have limitations on the maximum size of a
kernel image they can boot (usually something critical gets overwritten
when handling a too large image).  While boot loaders can be fixed and
upgraded, this is usually much more cumbersome than updating the
kernel.

Besides, a static array always consumes valuable unswapable memory,
even when the feature would not be used (e.g. disabled by a command
line option).

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
