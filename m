Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B10220319
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 05:53:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FA8789AB2;
	Wed, 15 Jul 2020 03:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4heBCCoZtRJv; Wed, 15 Jul 2020 03:52:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4B2189D4E;
	Wed, 15 Jul 2020 03:52:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8D29C0733;
	Wed, 15 Jul 2020 03:52:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BBC2C0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A99720767
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STlkNh+8yoo2 for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 03:52:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id BA90220495
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:52:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k27so1971691pgm.2
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TsOL0cHZgNHHXdS8EKSurkqDwkh4q7dcMdF14rSf6+4=;
 b=PA0lyJmmqv3z1yng5c+bbC+Fd2sF2bB+Z0yAb13o6k76rebaVXD1D3fb41re4Ihvq+
 hivlxR8HzDkiHGmh0l8EEY9XgRAXgoQEKAMqW+d1+qsPz3YGnYvKzC5wsCQDWpkMhiX8
 pQ/KWP1oW9UejrUN609DKt62AESXiboSQaStU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TsOL0cHZgNHHXdS8EKSurkqDwkh4q7dcMdF14rSf6+4=;
 b=q8asxr3Y0Hd0TpRPAtJcgBVRXqLg8mZG3xISvTXJlvmuIerxXBdbPUSrlKSSr/ktaE
 Xh0mAmcj2t2PsuHLbsxwWS5+tTff62OabYPjxU0A1cq0mUng3+c0IOPOXGx/5OwLDPmW
 0Dx2ab1faB5G715rMyB7FifaO/q/Q6/nStOBn4jFMDLuKwdyoi/PEkV0k8Fa+hTxnHYG
 uO8NRgglfVTcYMknirsXIUnM7xRnDr58WF5Jedsme+Z5J7w+sD+ZGr6PGLQg9BnfvfkY
 eGiRMma+zkJH7fuETknWAJZ/HMTOv9+r50JLmJZftDs8gGCJ1Q+zYKiGi5/qh3f+JmXu
 xdFA==
X-Gm-Message-State: AOAM533mYBbwE2VqsD8jdeBEdWtNPYLZJ/AAkPoiA2o6Aw8A7X+mKTRk
 8BIXD/g+L3bw7p4qfrbGBOoLepmG5LU=
X-Google-Smtp-Source: ABdhPJy5l0bcZuXhJFKtDp3wsoKqWkRmNSjo9EWZ+Y00Ggj2ScC9147EzG8K2IsJrnOFzllCbQH1VA==
X-Received: by 2002:a6b:1885:: with SMTP id 127mr8210978ioy.17.1594784778037; 
 Tue, 14 Jul 2020 20:46:18 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id e16sm548628iow.37.2020.07.14.20.46.16
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:46:17 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id o3so744589ilo.12
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 20:46:16 -0700 (PDT)
X-Received: by 2002:a92:a196:: with SMTP id b22mr7685147ill.303.1594784776244; 
 Tue, 14 Jul 2020 20:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200713091211.2183368-1-tientzu@chromium.org>
 <20200713091211.2183368-2-tientzu@chromium.org>
 <4a2451f9-57d8-2e83-e1d6-f144f37173c0@arm.com>
 <20200714110141.GD16178@lst.de>
In-Reply-To: <20200714110141.GD16178@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 15 Jul 2020 11:46:05 +0800
X-Gmail-Original-Message-ID: <CALiNf2-9b5LMjv+KCqFJ9oz2FocT6oQ1zVY_MBaFgNG1DQxZ=Q@mail.gmail.com>
Message-ID: <CALiNf2-9b5LMjv+KCqFJ9oz2FocT6oQ1zVY_MBaFgNG1DQxZ=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-mapping: Add bounced DMA ops
To: Christoph Hellwig <hch@lst.de>
Cc: Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, saravanak@google.com, suzuki.poulose@arm.com,
 Robin Murphy <robin.murphy@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 dan.j.williams@intel.com, treding@nvidia.com, frowand.list@gmail.com
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

On Tue, Jul 14, 2020 at 7:01 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jul 13, 2020 at 12:55:43PM +0100, Robin Murphy wrote:
> > On 2020-07-13 10:12, Claire Chang wrote:
> >> The bounced DMA ops provide an implementation of DMA ops that bounce
> >> streaming DMA in and out of a specially allocated region. Only the
> >> operations relevant to streaming DMA are supported.
> >
> > I think there are too many implicit assumptions here - apparently that
> > coherent allocations will always be intercepted by
> > dma_*_from_dev_coherent(), and that calling into dma-direct won't actually
> > bounce things a second time beyond where you thought they were going,
> > manage coherency for a different address, and make it all go subtly wrong.
> > Consider "swiotlb=force", for instance...
> >
> > Again, plumbing this straight into dma-direct so that SWIOTLB can simply
> > target a different buffer and always bounce regardless of masks would seem
> > a far better option.
>
> I haven't really had time to read through the details, but I agree that
> any bouncing scheme should reuse the swiotlb code and not invent a
> parallel infrastructure.
Thanks for the feedback. I'll try to reuse SWIOTLB.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
