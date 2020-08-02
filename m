Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C210223554E
	for <lists.iommu@lfdr.de>; Sun,  2 Aug 2020 06:36:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 01E0E20134;
	Sun,  2 Aug 2020 04:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kP7lmG8hC6Oj; Sun,  2 Aug 2020 04:36:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE44B2042B;
	Sun,  2 Aug 2020 04:36:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB248C0050;
	Sun,  2 Aug 2020 04:36:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 416FBC004D
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 04:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 30A21860F0
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 04:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwGg5gKxReit for <iommu@lists.linux-foundation.org>;
 Sun,  2 Aug 2020 04:36:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22F8385FEB
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 04:36:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q76so11335483wme.4
 for <iommu@lists.linux-foundation.org>; Sat, 01 Aug 2020 21:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vNmnflYEbg7mvYXMmclsr6IkCV02+IyNI5VnpskLy0=;
 b=M24/oMXwL+i8voPB/nhMMkq8wC7F3ckMxw60EFMwGurZkyCb+C1P2p/A98M2DiyQWk
 4jXOf9kenEAnq8Xdmjear0QrUUsn4fNCX5u/wn8CUuBRdVg8rmngpRos9iy2RWuqB+aY
 jFCjtGCWgYdoo4QMWUKNmzwGALZJ1qJJE/y69IIQoGqithqjiLv305lEiEN2njSdYgZa
 0RRfJ/APvvW4N2TLedc3Sft2INBe6/C3WjIgrxM/rZW31x/2KWTN5s9woZEUYy4+TNYT
 qKLtV3J2Mus3s+e2lV9Pr+pzSlfwGpNeqUeWAQFHK2DjHJcbQHk5fpNHRKa0f3Dm2hsW
 9i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vNmnflYEbg7mvYXMmclsr6IkCV02+IyNI5VnpskLy0=;
 b=hRcV6l0SuomvqTOW2mP0aCSU3dYzs1kIs9pqGb9llzLWeev9B0NdHp6Joi4pMnF8/d
 pQiJna/GZNTi0icETc3EXA5JnVORMplzoIE3LweViPcJlgr3O+O6l4bgrMqSkZ/kE49b
 zQG/VLl+hEvfHVtia0oytsM2IuQsnaLd3SKBCGXeoHsCF40VWI4RD9IYSe5L/R+7LWk7
 3C1ZxvAONlECWE3NhFugUk59EkrxzAchPxKmODF9ohbiAYnpVJsst087ISNwng2ajCN0
 oeeujMckVg339aIQ4fLDn8o6HKkY/s/hUD2rf12VYyF4CYIf2JjsA+cijhVO1fdfF+Vu
 QE6g==
X-Gm-Message-State: AOAM533Im1ikZ+rqLp5XQy46yO/MVjqcsaxIC9PSkHbVSHR7NZgXfHLx
 5kUSfHQ7GU32hZrYfLlsTvZLx/yP5H+9/c/X40xECg==
X-Google-Smtp-Source: ABdhPJzKT2xb0QRayGaUb2+mgux4I6UL6ohXUuX4iFlXzn31jA9YDJ+gqU1xKCMRWBCdzNISXp9sWmoJPZ5YrB6B0BA=
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr10035470wml.70.1596342983482; 
 Sat, 01 Aug 2020 21:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
 <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
 <CAMi1Hd09EbzOgTU5P4EDS8BQ6J2jFntvyR49BePyAqJ15DBB0Q@mail.gmail.com>
 <20200731130903.GA31110@lst.de>
 <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
 <alpine.DEB.2.23.453.2008010105560.4078406@chino.kir.corp.google.com>
 <20200801085706.GA2991@lst.de>
 <CAMi1Hd2tCfbDUuBP=OKoG8fPVCTpiARmqrkPadEJjJ52fgc_-Q@mail.gmail.com>
 <CAHk-=wjY8LBgu5SyXnwf0W8AkwQGO38j=KHXoyAZ0XUw+TFQ7g@mail.gmail.com>
In-Reply-To: <CAHk-=wjY8LBgu5SyXnwf0W8AkwQGO38j=KHXoyAZ0XUw+TFQ7g@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sun, 2 Aug 2020 10:05:47 +0530
Message-ID: <CAMi1Hd2f89Rx_0nVJZmGYJiZNo0DRkcHr2SQhEwRGWK4Vn3K9A@mail.gmail.com>
Subject: Re: revert scope for 5.8, was Re: dma-pool fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: jeremy.linton@arm.com, iommu <iommu@lists.linux-foundation.org>,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Sat, 1 Aug 2020 at 23:58, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Aug 1, 2020 at 4:57 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > Hi, I found the problematic memory region. It was a memory
> > chunk reserved/removed in the downstream tree but was
> > seemingly reserved upstream for different drivers.
>
> Is this happening with a clean tree, or are there external drivers
> involved that trigger the problem?
>
> Because if it's a clean tree, I guess I need to do an rc8 anyway, just
> to get whatever workaround you then added to devicetree and/or some
> driver to make it work again.
>

No, this is not on a clean tree. The phone's device-tree is not
upstreamed yet. That is the only change I carry. I have updated
the device-tree for this fix and sent out a newer version for review.
https://lkml.org/lkml/2020/8/1/184

Regards,
Amit Pundir


> Or is there a quick fix that I can get today or early tomorrow? We had
> some confusion this week due to a nasty include header mess, but
> despite that there hasn't been anything else that has come up (so
> far), so..
>
>                        Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
