Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4F25868D
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 05:58:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B022386FBD;
	Tue,  1 Sep 2020 03:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPUqNL3EbI1L; Tue,  1 Sep 2020 03:57:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 937E886F78;
	Tue,  1 Sep 2020 03:57:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71B7CC0052;
	Tue,  1 Sep 2020 03:57:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02BA2C0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EB4E785F4D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_zOQykp7iRh for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 03:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 267A985D7D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:57:55 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id g96so4744502otb.12
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
 b=dyaEu3K2fa7X2g3Iy4XaFmUwFb2VziG9VK8UPB8GwRUXnqKa7ib6yl+CECA0Q1vPLz
 IjQ+mn612HdIbhc5odg6OfaT3Qb/TYbaI5T/zWIex5gVUoWgirWjKb0AvwZRDaqbzzCO
 Y1OtNL+0UUlSJmpsQ0sd9QBKMSwBu6kJ5paH3wPa4P9agbIv6yxHgu7afTYDTEwIeYGH
 DJZ6IsI3RU6NTWK8tqqEnwY3s/hCocMGlybV+ffvg6CgjQt6J50QWplKw+lBIr/ief3F
 psjjzA+evsRqJDJS9fx7ldrRPcAmxLmEOhyENyNuK+ikFrDogOJS+r6DRfJGytxsSq3x
 WDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
 b=CXH3seiQPPqcz5ipv+Xi3eFgoyH4v6wBQFqcKvSwEe4pPja9Ay/bD/ixJUqnfw/dsR
 lguCdzuWIgtHy6Gho1anrQ4GOi9FqbeSH8FJUWp1k4nKHkA6Z1RUedjwt9+l8R63TkFH
 try46Ywl7oSSPrvmTSII7xxSRc3Em3PLja3natnlcTTfKgkk61YbNmv3T58efVKNQ0TF
 zzPM9YsxMSD1RyOwrujfR2+kIVT2H6Gq4UQceDqNVLku9R9LN+ErXbrVpxS73pM6G2ii
 3Cp6QlZ8qQ92TnBs2IR1eNus548TqLlZZOt7t0vODHtjhLIwpStgjJobLyeQ4GvUiAco
 fn5A==
X-Gm-Message-State: AOAM530lUzkw47majfhhmGF3zZ9GrxTP2A+di8CK2YgYCXIzM/v9waJk
 sN7RXwfiYvqwjAKP28wjUq9ctTgkm043Tg==
X-Google-Smtp-Source: ABdhPJyW82+oNd0uKsSlubviePmT2U0GHcTQ3RDx78hC9s24SzOxGZRfPqGKe1d6Eg2D6goGkTWR0w==
X-Received: by 2002:a4a:aec3:: with SMTP id v3mr2968825oon.69.1598932339869;
 Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id u19sm2067501oic.10.2020.08.31.20.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Date: Mon, 31 Aug 2020 22:52:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 05/19] iommu: add private interface for adreno-smmu
Message-ID: <20200901035216.GM3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-6-robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, freedreno@lists.freedesktop.org,
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

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> This interface will be used for drm/msm to coordinate with the
> qcom_adreno_smmu_impl to enable/disable TTBR0 translation.
> 
> Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
> will directly switch TTBR0 pgtables (and do the necessary TLB inv)
> synchronized to the GPU's operation.  But help from the SMMU driver
> is needed to initially bootstrap TTBR0 translation, which cannot be
> done from the GPU.
> 
> Since this is a very special case, a private interface is used to
> avoid adding highly driver specific things to the public iommu
> interface.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/linux/adreno-smmu-priv.h
> 
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> new file mode 100644
> index 000000000000..a889f28afb42
> --- /dev/null
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Google, Inc
> + */
> +
> +#ifndef __ADRENO_SMMU_PRIV_H
> +#define __ADRENO_SMMU_PRIV_H
> +
> +#include <linux/io-pgtable.h>
> +
> +/**
> + * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
> + *
> + * @cookie:        An opque token provided by adreno-smmu and passed
> + *                 back into the callbacks
> + * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
> + * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
> + *                 NULL config disables TTBR0 translation, otherwise
> + *                 TTBR0 translation is enabled with the specified cfg
> + *
> + * The GPU driver (drm/msm) and adreno-smmu work together for controlling
> + * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> + * updating the SMMU for context switches, while on the other hand we do
> + * not want to duplicate all of the initial setup logic from arm-smmu.
> + *
> + * This private interface is used for the two drivers to coordinate.  The
> + * cookie and callback functions are populated when the GPU driver attaches
> + * it's domain.
> + */
> +struct adreno_smmu_priv {
> +    const void *cookie;
> +    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
> +    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +};
> +
> +#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> -- 
> 2.26.2
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
