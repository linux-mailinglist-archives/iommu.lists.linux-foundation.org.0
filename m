Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B333135127E
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 11:40:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4757140FAE;
	Thu,  1 Apr 2021 09:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHaLDhGPtSiL; Thu,  1 Apr 2021 09:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA9E40F76;
	Thu,  1 Apr 2021 09:40:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18CEDC0012;
	Thu,  1 Apr 2021 09:40:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9CADC000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 09:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89FEE84A2F
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 09:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNgl9uppKQDb for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 09:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 995BD84A2B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 09:40:02 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id h11so928633vsl.2
 for <iommu@lists.linux-foundation.org>; Thu, 01 Apr 2021 02:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlZPhLbLjyArTWcGf9vQn5+R2JQ3oOIwh7hu7M8eTGE=;
 b=Q+3rhg+Nyk6p+Qdb5j8c2CXaNknCz7E/KiF+VIDhHN1nuXjy5ER8fsHboKE3+aDc00
 0w4QbNaxDjLUrNIi0bM1Bbz6SkihmXpfxJbJ9nFEshNEPSMtBP9sj1m8A1xpsnbriyyh
 RQjgA5SHquTux0WyNjY+tZGMxlMMnkQ/0qpp8Di8uXQDfcNrB4b110IUavJBIsH8nGxe
 XCLaQ4kYpIbU0z84KsvpvgHkPslZd5O7fB3txu+uttdULpW6GGnuKMiRWFVUwTYr+gja
 2c9bKGlQ7DSzPKua3BZj7uOkrgZ+ru6sUIoj2LfCry2DQoN44nBEZl3065TsnHbYroEf
 v+GA==
X-Gm-Message-State: AOAM531M95oxslhBTbOAZ8991F6bwQTdYlaRBwpVZZ/3kAVVmQ/twO0t
 F6jXtx4n6fCp/XCol8zmuB85JbpfKewE1G8vwS0=
X-Google-Smtp-Source: ABdhPJwtjhpCL5W/EAZ6ZkPr/6GjXlFv2xr2ixEs/0hAzf8mGhOjkLhWBwxFQthEFvBZl9MIhgLDiGsTQqnyLl4S9Nc=
X-Received: by 2002:a67:1ac7:: with SMTP id a190mr4490994vsa.18.1617270001553; 
 Thu, 01 Apr 2021 02:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210331093104.383705-1-geert+renesas@glider.be>
 <20210331093104.383705-3-geert+renesas@glider.be>
 <20210331094007.77aa5194@gandalf.local.home>
In-Reply-To: <20210331094007.77aa5194@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Apr 2021 11:39:50 +0200
Message-ID: <CAMuHMdUvgRiYfsVOJdocB3peLhnDWe=Kn1MLW64sh8zpd2XoLA@mail.gmail.com>
Subject: Re: [PATCH 2/3] tracing: Use pr_crit() instead of long fancy messages
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Petr Mladek <pmladek@suse.com>, Marco Elver <elver@google.com>,
 Linux Embedded <linux-embedded@vger.kernel.org>,
 John Ogness <john.ogness@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Will Deacon <will@kernel.org>, Gary R Hook <gary.hook@amd.com>
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

Hi Steven,

On Wed, Mar 31, 2021 at 3:40 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 31 Mar 2021 11:31:03 +0200
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > This reduces kernel size by ca. 0.5 KiB.
>
> If you are worried about size, disable tracing and it will go away
> entirely. 0.5KiB is a drop in the bucket compared to what tracing adds in
> size overhead.

Fair enough for this particular case, as tracing can be disabled.

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
