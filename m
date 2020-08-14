Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C3244FE8
	for <lists.iommu@lfdr.de>; Sat, 15 Aug 2020 00:41:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40A6D88CB3;
	Fri, 14 Aug 2020 22:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DT8Y7+o6o+AE; Fri, 14 Aug 2020 22:41:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DDC788CB0;
	Fri, 14 Aug 2020 22:41:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BA01C004D;
	Fri, 14 Aug 2020 22:41:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1054C004D
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 22:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 99B0586D27
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 22:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3YPbz7ktCSa for <iommu@lists.linux-foundation.org>;
 Fri, 14 Aug 2020 22:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5098C86D03
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 22:40:59 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id m15so5583787lfp.7
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cw/Xi+zTnVph1e4MFSY/wz6yqwLJpsrk++bjsEyga4k=;
 b=gBmiWZUczwz3Q1oPbPKyqeSDui1X6O9Kt/ZmsnT8NLd59EQmQWhvQdSCRYGjswsOPw
 MHKj25WfDZYFKZsMyBVQks4287vVbGdrDRd3GeBmkPlM7zgqOIkH+aR3ebuNjPEYwh3z
 vPg4TJKNWq+J0d1Au0Y3jxKtyUtjlWDJJCEhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cw/Xi+zTnVph1e4MFSY/wz6yqwLJpsrk++bjsEyga4k=;
 b=fflxxUaczru/+Yb+znDwO2zrxRDrNyJHZ4OPwKCXrdfYSuxR/9z9nSbizjLANwSO2G
 Hgh7i3JwFvtINLfsBFiULzvz1mUjYehMs2bXeD2gOpO2n5bYFMiqCLb4b9+h3DNQgwyu
 HYr99PTaeCHc2hskTs/NVrxp0z8aYMUtJPdAkbtWeUvQV2j+FJ6/40WHwUQVGm1UdT70
 0vCZQs+qMlQXLzJ6J+O7ceOVRQPb+VaemJcmo/HwXDSGRa2e+AuXqeKLH8tV1Z9yeGY1
 JxFLlpd2Pq0P4V0lRh76OYlIuwgVIX3gJRloUqn3QbabAGgvdotwY7xnE1un1PUZvyB5
 kEOw==
X-Gm-Message-State: AOAM530CWMVi65IFuXi7mqbIGIlt8kS1QarvrczYQ1DGT55oR+HZcHzM
 RURl9PEo3hsD778FScS/D2/wDypcCHM8Rp43
X-Google-Smtp-Source: ABdhPJxm+ZLInlcm3Tmr+UpT6LMKKK6Q7MLDDcOYRd+Xve6WSP33i6MidatExHiKblgbMeGF2/L1rw==
X-Received: by 2002:a19:70c:: with SMTP id 12mr2183288lfh.207.1597444856877;
 Fri, 14 Aug 2020 15:40:56 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id s21sm2007368ljs.8.2020.08.14.15.40.54
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 15:40:55 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id t6so11497392ljk.9
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 15:40:54 -0700 (PDT)
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr2094857lji.314.1597444854609; 
 Fri, 14 Aug 2020 15:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LSU.2.11.2008122005240.11996@eggly.anvils>
 <CAHk-=whYLHtbeF6BFmoiik9PTjP2+pnpWxXLE9f0ccnT0LAd5A@mail.gmail.com>
 <20200814054241.GA719@lst.de>
In-Reply-To: <20200814054241.GA719@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Aug 2020 15:40:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wifNX6U28sjPay+1ZJ5BmxRG8Bac7W1sP_Ft1yTqLj+GA@mail.gmail.com>
Message-ID: <CAHk-=wifNX6U28sjPay+1ZJ5BmxRG8Bac7W1sP_Ft1yTqLj+GA@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: fix debug_dma_assert_idle(),
 use rcu_read_lock()
To: Christoph Hellwig <hch@lst.de>
Cc: Hugh Dickins <hughd@google.com>, Eric Dumazet <edumazet@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, iommu <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
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

On Thu, Aug 13, 2020 at 10:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The whole thing predates my involvement with the code, but I defintively
> think the patch from Hugh is a major improvement.  But I would also
> have no problem with just removing it entirely.

I decided to just do both, since neither you nor Dan seemed to really object.

I applied Hugh's RCU read locking patch as a clear improvement, and
then I did a second patch that just removed this function entirely.
That sounds a bit odd, perhaps, but in case people decide to resurrect
the debugging code, I didn't want us to lose sight of Hugh's
improvement just because I then decided that we might as well go one
step further and just remove it entirely.

And the only real reason I care is that this whole COW and page lock
thing has showed up lately, and I like removing code.

I'm _very_ tempted to just apply my COW simplification patch that gets
rid of all the complex try-to-share cases entirely (and would also
obviate the whole forced-cow patch). I suspect it would effectively
remove almost all of the [un[lock_page() bottlenecks entirely, but
that code has decades of history and I suspect it's a bit too drastic
wrt KSM and the swap cache pages.

It would be lovely if the main source of page locking would really be
about just IO, but the page lock has also become the thing that
serializes almost everything related to page state. Which is why you
find it in contexts that are really not IO-related at all (not just
COW - page migration is the other one that has shown up a lot under
"heavy CPU loads" without really necessarily any IO component to it).

                         Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
