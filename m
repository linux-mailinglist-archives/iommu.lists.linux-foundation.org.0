Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B428E720
	for <lists.iommu@lfdr.de>; Wed, 14 Oct 2020 21:16:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF6AF875FE;
	Wed, 14 Oct 2020 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3Q4z8igNdwf; Wed, 14 Oct 2020 19:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 791E6875A4;
	Wed, 14 Oct 2020 19:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E2BFC0051;
	Wed, 14 Oct 2020 19:16:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1500EC0051
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 08E9F86A51
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBORaHFDm-eJ for <iommu@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 19:16:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0DA678122B
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:16:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id d24so684650lfa.8
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLBC1OBCAHPnlJe/kwABmB7Gu/SxbFcXde/KY/08Vw0=;
 b=MqBNMvj6g8fhP9nN08YJSxZGfPY+UdXwbQFpRboG//A1f/DWy3z3Q7zQpX51uTIAUM
 zcX/BJ55DNTdSFID5z00t0gYnxZsI3PDsax39wRQm4dYNf3qR+5dPY5qCG/9gKofNiEA
 OTOpn1bZl/jnoEEpVblH2kwT1UBknAUZXCU0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLBC1OBCAHPnlJe/kwABmB7Gu/SxbFcXde/KY/08Vw0=;
 b=XUx6xaGmb2qrP7e2eqR/ZEO3AEnlFL3ZdmegLLSTJkUwEw/4HQcv/SgbLUWXLmLXu5
 p/ZTwPj1tc5oNuvcalzeoEHRQf4m2f2e3K/IeR4TNDlGF/v/eXtiKXJpHRJBHkVXp3iG
 C7HrZ3hnDKJtmrRW9iAApN3iXlf+xMh9Ebwja/iAbbzsdSiabAjnpq+PLLBtSzFYL7ll
 YkhlRmby6i+UlP/DIx4KrWVegFPxQgJ6Ezi8pgaVaCNtaZBhl+mjTXlX85led/PD3wI/
 R3CHieln93hYCU9MEuZ/2ryal6rIykkDzOzJjz3ugt1dXWv0zWIPuh0uRgm3qcCOblLu
 7lDQ==
X-Gm-Message-State: AOAM531PEKTtnXg9tGXDTBQj/nDA3BJkQkbBskeg2BgyB5pZlOFlPqxh
 83y2aiEGsC3nqPYJX+FvH+sTDQWncIkU3P1x
X-Google-Smtp-Source: ABdhPJzcOugoiDOeki53IEInxAgCWzPElg2wEc5HxBFoDeCIZqRKdxIZVJuL0+TbEFshLFvwyDwvRQ==
X-Received: by 2002:ac2:5c5d:: with SMTP id s29mr258983lfp.584.1602702973618; 
 Wed, 14 Oct 2020 12:16:13 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id d21sm73354lfl.62.2020.10.14.12.16.12
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 12:16:12 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id j30so713503lfp.4
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 12:16:12 -0700 (PDT)
X-Received: by 2002:a19:4815:: with SMTP id v21mr240074lfa.603.1602702971895; 
 Wed, 14 Oct 2020 12:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201013160353.GA19438@8bytes.org>
In-Reply-To: <20201013160353.GA19438@8bytes.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2020 12:15:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirdKHYK_T=Pdx7eLP7z04P_q4zrT3uOod=dCWtmYPe8g@mail.gmail.com>
Message-ID: <CAHk-=wirdKHYK_T=Pdx7eLP7z04P_q4zrT3uOod=dCWtmYPe8g@mail.gmail.com>
Subject: Re: [git pull] IOMMU Updates for Linux v5.10
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Oct 13, 2020 at 9:04 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> there is a minor conflict this time in include/linux/iommu.h which
> should be easy to resolve. I would attach my resolution, but somehow git
> [show|log] didn't show it to me.

So when a resolution takes one side over the other (as opposed to
mixing two sides), then "git show" doesn't show it as a conflict any
more.

The reason is simple: at "git merge" time, git figures out the common
base, so it has all of "base", "side1" and "side2" to look at and does
a three-way diff (for the simplified normal case). So it can see it as
a conflict, because it sees both where you came from, and where you
ended up.

But once you have resolved the conflict and committed the end result,
"git show" (and "git log") doesn't do the whole expensive "what was
the base" thing any more. "git show" just sees the parents (so "side1"
and "side2") and the end result, but doesn't really see - or care -
about the fact that some time in the distant past you also had that
"base" state.

As a result, "git show" doesn't ever really understand the notion of a
"merge conflict", and all it shows is really "whee, this end result
looks like neither side" as a kind of pseudo-conflict diff.

Anyway, thanks for the describing the conflict, it was indeed not
complicated, this email is just to explain your "but somehow git
[show|log] didn't show it to me" thing.

                   Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
