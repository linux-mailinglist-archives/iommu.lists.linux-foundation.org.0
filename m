Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB9243D17
	for <lists.iommu@lfdr.de>; Thu, 13 Aug 2020 18:16:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ECF8D2045B;
	Thu, 13 Aug 2020 16:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oPXVTpOGfsG; Thu, 13 Aug 2020 16:16:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E70782002D;
	Thu, 13 Aug 2020 16:16:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7C1DC0895;
	Thu, 13 Aug 2020 16:16:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6625C004D
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 16:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C4D4786CAC
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 16:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnJX58OLJ6Pk for <iommu@lists.linux-foundation.org>;
 Thu, 13 Aug 2020 16:16:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCF1786C82
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 16:16:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c80so5182889wme.0
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
 b=Me8R6C+bT+HcxPAfKWKJXWW0PdK3ui8PTkMX4mfTZia+OsdLQzy26AOH4SPA6csTne
 AH/QScFCt8eRHHy2kzT0sDROOyf/+cesMWqQDzb45MRYMkUxfYD4JU2UFEkPDBweUBWh
 sJ/MW/U31mPfbg6SC3XGecibDGmFei+W06ypvarH3yHd2NYMKqVlsHuPeDVYWw0HcyNq
 lxgL9T9/VTNfOTsOVzyWrBvLE9UymEpSfbSKTeDB9N9XjyKafFen4Me03sf8odU6w2LK
 7VGQQiyLYvEn+HgMVau1xJUNdI/Qgc3hT9zkTgbZpBYzqv70RrLfp518z+Su3/QtbSWd
 MMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
 b=Shpd/PW+9CcOY0X/tslw+4AHvRFnuPsD8cUygwICZxu8G9WmA3PcErtc2mhtjTGh0E
 Vlz0PeXp3lMLiGDasoJzwzddHCmtyts5NuIj2FSgVm1/dIIqxLbIAlpY60sNoA9vFXu0
 Vf2BLKpxjFIRHnWSqdLI/dMjSJ+O2yp/KZgFZW5w3cTdS/NQZhB7FOJysvAIg7RjWQyP
 V7knapLPoWYgmVIYlG11hwDZdx5E9aePEmDcvlwy8TOevN/1Ltnj4PT27Xuz+hYDNSIl
 OjzIBd5Rp0ZS1u2I9N6BZcXMDD/bDHZbBByzGe+Ko11EVh8/Dt/x+CtcvzsvNlwYlY4q
 msgw==
X-Gm-Message-State: AOAM533+aQ2U4fSd86hwUW1k4CCm8tk+9zO+qwqa/6WUfk/fp702uNqp
 pcuv3LPbYJ3wK3Te2La5CDuSyYEcPKstaXRhOs4=
X-Google-Smtp-Source: ABdhPJx9BIL8YvczFKCJBH4UENkHUjiA1/2Ml3mI2JxBFhQVn2uDFhMYCBAVLjNaZCNs0zfCkO4LE+S5uR3RemIOvk0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr4890016wmj.164.1597335395036; 
 Thu, 13 Aug 2020 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-8-jcrouse@codeaurora.org>
In-Reply-To: <20200810222657.1841322-8-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 09:17:21 -0700
Message-ID: <CAF6AEGsA-jWLvSjZYz=ZkM7cxC5Wv6rDcoVv-9K5QpEZT=Cv7A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 07/13] drm/msm: Add a context pointer to
 the submitqueue
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
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

On Mon, Aug 10, 2020 at 3:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 972490b14ba5..9c573c4269cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,6 +142,7 @@ struct msm_gem_submit {
>         bool valid;         /* true if no cmdstream patching needed */
>         bool in_rb;         /* "sudo" mode, copy cmds into RB */
>         struct msm_ringbuffer *ring;
> +       struct msm_file_private *ctx;

So, it looks like this is (currently) unused, and everything is
instead using submit->queue->ctx

That said, changing this so the submit also holds a ref to the ctx
seems to fix the intermittent splat I can trigger by repeatedly
hanging the gpu.  Which (from the pile of additional tracepoints I've
added on top of this series) seems to be related to re-playing submits
after the userspace process has crashed and/or closed the device.

It seems like the reference the submit holds to the queue should keep
the ctx (and therefore address space) alive, but I need to dig through
that a bit more.

BR,
-R

>         unsigned int nr_cmds;
>         unsigned int nr_bos;
>         u32 ident;         /* A "identifier" for the submit for logging */
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
