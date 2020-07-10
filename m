Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1D21AD7D
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 05:29:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24641890E5;
	Fri, 10 Jul 2020 03:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N+iPOULif7cg; Fri, 10 Jul 2020 03:29:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 715DE882F5;
	Fri, 10 Jul 2020 03:29:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F9CAC016F;
	Fri, 10 Jul 2020 03:29:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D9FC016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 03:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF6A3897D9
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 03:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFRHf-IziWyg for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:28:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A621A8938A
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 03:28:57 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k4so3703617oik.2
 for <iommu@lists.linux-foundation.org>; Thu, 09 Jul 2020 20:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKws9rr7OljHAXLs0SNBqV8l/zDxM95hYUjoVUcsLMw=;
 b=Y/MA9imFJwm2h1+DgPUYOn0x1e5bQqgU07Gi2iGRG/lwfvQkyoG/FtwR5qsp3do0Y3
 yCR5Hps1LDqH/0O708Hck+CXWJXUW/Pm/dgq7jjaEfghm7v5/mSEHmBFS3fX0QNPYolf
 ubTdX550xKgLib4fyaBylbbUUSzyb38aG7zeVQdB5pSqjHMt+rsLG5JV2DsxNMdt1pvt
 KRMZPYM+vQpClcwdCxiSCTuFyS0F8maJbP2n3RriwfznlTAeWSdn7geAldubl/lrUFC4
 me4dbcPDXLovepdNDGbrDCJ6PBJlAkPvR4QYNjXe2765EUymJkyyqOT78m+cxQYEziei
 SOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKws9rr7OljHAXLs0SNBqV8l/zDxM95hYUjoVUcsLMw=;
 b=ib6qtkZbX1hh3So1j3ljmgVjPA6cLUOSgj0rNIrbilxin/e6QLfCMMG//+Fc9w/dHa
 94uvVxh4/vsX+fy6zcOQfsJXqHU/IN0F5UNMWLYZTIWCBAnNR0xLzCXSk6LYOuIaJCcq
 r7O+PdZQ80gKX8Qm6U5ce6wSz1+Kr391RBxby5lDF7iHqIYk6SMsIFJYwF2OL3oOtW9N
 jBbB/d2wyDJM6ps6zvBl3kIZ3y7CYB6FeRcg9JiZ4TxvrqqMZMYRlQzY7PiPVji+GsWW
 0T2w0UoEF6lQFiAI7Y4ivFwcbrG5C+LfE9jLdbh1cMYRe7hYM8SjDixOx1vd34tebiQp
 SsYw==
X-Gm-Message-State: AOAM533Z3YA/hrWjzNbnwpV8NpLcSQyMmMg/iSa5aJVQzYx0Dc6E1YUd
 3s0AaWHSZmMBbF9onklT43rQiWPmL6zMp11TIVMk6A==
X-Google-Smtp-Source: ABdhPJwBCYPfCvq2KTarh+AoVyZD+95RmFXiFFqX0zZedcK0ojnQcCI1atRrtNfjUyY3XSL9F1IRdjivxmmz1/tlsLo=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr2796817oif.10.1594351736777; 
 Thu, 09 Jul 2020 20:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
 <20200702141825.GA16941@willie-the-truck>
In-Reply-To: <20200702141825.GA16941@willie-the-truck>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 9 Jul 2020 20:28:45 -0700
Message-ID: <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To: Will Deacon <will@kernel.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Todd Kjos <tkjos@google.com>
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

On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index b510f67dfa49..714893535dd2 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >       tristate "ARM Ltd. System MMU (SMMU) Support"
> >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >       select IOMMU_API
> >       select IOMMU_IO_PGTABLE_LPAE
> >       select ARM_DMA_USE_IOMMU if ARM
>
> This looks like a giant hack. Is there another way to handle this?

Sorry for the slow response here.

So, I agree the syntax looks strange (requiring a comment obviously
isn't a good sign), but it's a fairly common way to ensure drivers
don't get built in if they optionally depend on another driver that
can be built as a module.
  See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
!USB_GADGET" in various Kconfig files.

I'm open to using a different method, and in a different thread you
suggested using something like symbol_get(). I need to look into it
more, but that approach looks even more messy and prone to runtime
failures. Blocking the unwanted case at build time seems a bit cleaner
to me, even if the syntax is odd.

thanks
-john
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
