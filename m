Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7D38F8A2
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 05:16:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 598C360605;
	Tue, 25 May 2021 03:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvMrz4btID_R; Tue, 25 May 2021 03:16:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2F6605FD;
	Tue, 25 May 2021 03:16:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 317C5C0001;
	Tue, 25 May 2021 03:16:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 665C8C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 03:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 531C7403BD
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 03:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfZJU_J3PtnO for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 03:16:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 918B9402C5
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 03:16:25 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id 1so22231628qtb.0
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 20:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUICKcc/sKdAjzKNgq2l5eqYx+k5eTShYrWAkwN1nE8=;
 b=TELw0+2UEzjgBQgY3N9cHf7cvJQg4x1GF5jHbOj/Xhbu2EVYn5hJJdXJJYpk6Mpk8G
 l2k+90bOTlHqSiuws+ej9C6F14blJi9bSItZInf5oUYtu07o9RuIUrgGf8YFYR9loGpy
 S0ow3K1ouDjzn61e3PW37PZcm998eK6VcTTFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUICKcc/sKdAjzKNgq2l5eqYx+k5eTShYrWAkwN1nE8=;
 b=QBZ+qVhB1PD7OtWf+lyu8CFllVsmKcusJRFe9UoumrOju5KRwbhhUbRaV5Uy9+d5LI
 D8f6jEJuT2sCuSY5KuJN8L+808PQz1NIsU07mjiAyyTc+FUDWO5rYnKyiwAn3dokrsVr
 BY6RJZ+8d2Rrr03HUlhaYkJAX7ogJPbdwRDdyJyeN7AHo/GC03W9aZvD2oZe0/BBqDVl
 OYWSm6yrd7mpTLNblABcEkOnwOAIfuZFw9BCu8CVc/W0D2wqQOUU3T2Fj+3pHp9dLdkJ
 txUgQZgvf5BhuwSM6XiNe9DwdAoFkYOWte0W/gfTztTYrozhz2G6HzN8Z86/nyKzAHdF
 eKjQ==
X-Gm-Message-State: AOAM5306H/LHoZJSSa2fG4PfenK3bj95vMwJLtjCLmL+qwOsca/0zseV
 3mt2XmCnaAYxBG9OgVnpdKmR6jkxaWvtgA==
X-Google-Smtp-Source: ABdhPJweexLXmIiDWRqI5cjQHBlDZQWdInNKt4mih5Hcf5zeoKuDyxaD4qvqRyUDEaJNI9wrdDJljA==
X-Received: by 2002:ac8:5414:: with SMTP id b20mr31278223qtq.66.1621912584157; 
 Mon, 24 May 2021 20:16:24 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com.
 [209.85.222.178])
 by smtp.gmail.com with ESMTPSA id w4sm11982098qki.57.2021.05.24.20.16.23
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:16:23 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id j184so7059086qkd.6
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 20:16:23 -0700 (PDT)
X-Received: by 2002:a05:6638:22b4:: with SMTP id
 z20mr26846805jas.128.1621912112776; 
 Mon, 24 May 2021 20:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org>
 <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
 <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
In-Reply-To: <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:21 +0800
X-Gmail-Original-Message-ID: <CALiNf2-M-CQdQaHiFTMfOkON6PEd0Yu_TvaCXKx9vXJ-7o5ffg@mail.gmail.com>
Message-ID: <CALiNf2-M-CQdQaHiFTMfOkON6PEd0Yu_TvaCXKx9vXJ-7o5ffg@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
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

On Mon, May 24, 2021 at 11:49 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Tue, May 18, 2021 at 02:48:35PM +0800, Claire Chang wrote:
> > I didn't move this to a separate file because I feel it might be
> > confusing for swiotlb_alloc/free (and need more functions to be
> > non-static).
> > Maybe instead of moving to a separate file, we can try to come up with
> > a better naming?
>
> I think you are referring to:
>
> rmem_swiotlb_setup
>
> ?

Yes, and the following swiotlb_alloc/free.

>
> Which is ARM specific and inside the generic code?
>
> <sigh>
>
> Christopher wants to unify it in all the code so there is one single
> source, but the "you seperate arch code out from generic" saying
> makes me want to move it out.
>
> I agree that if you move it out from generic to arch-specific we have to
> expose more of the swiotlb functions, which will undo's Christopher
> cleanup code.
>
> How about this - lets leave it as is now, and when there are more
> use-cases we can revisit it and then if need to move the code?
>
Ok! Sounds good!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
