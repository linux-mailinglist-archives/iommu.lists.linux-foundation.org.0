Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C98373E2168
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 04:15:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F25C40295;
	Fri,  6 Aug 2021 02:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4b5xA1QuZ5s; Fri,  6 Aug 2021 02:15:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE32A40273;
	Fri,  6 Aug 2021 02:15:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6E95C000E;
	Fri,  6 Aug 2021 02:15:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 029ABC000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 02:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D805B60901
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 02:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LF68byWlb1jr for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 02:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3705B605A6
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 02:15:29 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id kl2so4109071qvb.11
 for <iommu@lists.linux-foundation.org>; Thu, 05 Aug 2021 19:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Imy8OreXrectZDHPA2KWQvvopUzEYXdivHeaJKFxqpw=;
 b=TLEmeQiCIiGQ7wCbsNTZiXznL/Qe/SmmLjIDwfE2OPFDAAKJwKwem0xLhdEvI9eF9w
 ePFC/vJhM5qtwNECXdguUzpTSPuSWPMFrCcWsHM9oCVOkFBkU1XH062mljS2Vyj5Qmi6
 bnlu2+N0SnFi/fT2DucYSaElfxZ48+hnX7LNXzaLjfGQF/IVMlsHwZ2xC3NSzJE+38Bn
 yFfV7Qxr2/zwb458JkK55uWrSpT74x3horLalFZjRBgOAY/2EL11JQwwussgS9NE8Fm+
 FIQCtq2kllD2uPMENaCN1FaSHxQ23eYCzrD9TbBHPmqyEt1/Hrrhdk8HYjB2tb8kaEjH
 rQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Imy8OreXrectZDHPA2KWQvvopUzEYXdivHeaJKFxqpw=;
 b=V9r8SR0wA9YzY0FGCGXuPew4blfTUrum7wniVJyd9ucuoWAMBzO5muFMWaF1PKCQS2
 RSQXnGbtDnA7wqBF9NdaViGww0KQIxUecTcCHInemb+BOZls8s+rO10/szgMJAi045P7
 ZiqQa8e9IFExYn36hK03RkHt496clS69oO/ifaZ4GO5hytdO1VaRzR/JPgUcI/9b7Zcg
 ItSwwPZdC5+lry92nRYUaDuOiU323SO+nedRTTpEzfa75hDkuTDneA5Ha/5d6CF9O89v
 88S2tySB+xna+Nj6Et2HaPofp3z2gN+9ZKO5eh9tQTBe4j0c2HrIpm92f3rshqMU8e0i
 Bd/g==
X-Gm-Message-State: AOAM531g2ZdlpS9kQHeeHUbTUXkFTA9EpiMsJDOLu+lj/v8aznrD0vjT
 owvnmmJc/5fIvRFppOetFhLJq4zXYUeRnXgg2q8=
X-Google-Smtp-Source: ABdhPJyDRTi8g/fjdPgi4sNbcwYcP9GyrixgU9oT7EXZ1xkE/iW+FGwuFXyoA9KhnMVPnLoJppLN/hrWhtZhcygElwU=
X-Received: by 2002:a0c:e84e:: with SMTP id l14mr8797811qvo.38.1628216128097; 
 Thu, 05 Aug 2021 19:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628094600.git.robin.murphy@arm.com>
 <5cc86b540faeb0367df9bd6901a15974f0e31c52.1628094601.git.robin.murphy@arm.com>
In-Reply-To: <5cc86b540faeb0367df9bd6901a15974f0e31c52.1628094601.git.robin.murphy@arm.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 6 Aug 2021 10:15:16 +0800
Message-ID: <CABOV4+VPX-RK-mz-GDZLD_qNDxmBSc3hQGLkvj4NKP6sGOLSxQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/25] iommu/sprd: Drop IOVA cookie management
To: Robin Murphy <robin.murphy@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, dianders@chromium.org,
 iommu@lists.linux-foundation.org, rajatja@google.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Aug 5, 2021 at 1:18 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> The core code bakes its own cookies now.
>
> CC: Chunyan Zhang <chunyan.zhang@unisoc.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thank you for the patch!

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

>
> ---
>
> v3: Also remove unneeded include
> ---
>  drivers/iommu/sprd-iommu.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> index 73dfd9946312..27ac818b0354 100644
> --- a/drivers/iommu/sprd-iommu.c
> +++ b/drivers/iommu/sprd-iommu.c
> @@ -8,7 +8,6 @@
>
>  #include <linux/clk.h>
>  #include <linux/device.h>
> -#include <linux/dma-iommu.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/errno.h>
>  #include <linux/iommu.h>
> @@ -144,11 +143,6 @@ static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
>         if (!dom)
>                 return NULL;
>
> -       if (iommu_get_dma_cookie(&dom->domain)) {
> -               kfree(dom);
> -               return NULL;
> -       }
> -
>         spin_lock_init(&dom->pgtlock);
>
>         dom->domain.geometry.aperture_start = 0;
> @@ -161,7 +155,6 @@ static void sprd_iommu_domain_free(struct iommu_domain *domain)
>  {
>         struct sprd_iommu_domain *dom = to_sprd_domain(domain);
>
> -       iommu_put_dma_cookie(domain);
>         kfree(dom);
>  }
>
> --
> 2.25.1
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
