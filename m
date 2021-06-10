Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5643A36F8
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 00:24:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCF483AA9;
	Thu, 10 Jun 2021 22:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPJS5DGyksvk; Thu, 10 Jun 2021 22:24:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0BC5583AAC;
	Thu, 10 Jun 2021 22:24:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCBADC000B;
	Thu, 10 Jun 2021 22:24:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1461CC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 22:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02DF960AEB
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 22:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLlV5oLRr2Zv for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 22:24:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41546061F
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 22:24:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id f10so14268692iok.6
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7TVjLZ+YHlKeGJ8qAU9Un06YFm9yXurMjRE2VQEqoY=;
 b=lcnU0h1GZrdQJLHy8y+QLyi53BxH+7M3T72jS6rR9R+chmR1B7uM/QQBUr0wb9Na5Y
 ztJ6PqO0L1apCQeAEkrh7TvbJK5Uw0hLjM37NV2AFe/Kgnno9gNP2tycgvMLwh4zbi58
 Q26dJPAFABhMVEZeABUu2C+MTVBBYla4XZvvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7TVjLZ+YHlKeGJ8qAU9Un06YFm9yXurMjRE2VQEqoY=;
 b=oycZ+qHkB4gZfFKujHRbZLe5l7Q+pqy9FZ6XWqjMTmwZVaDOF9IOLaimDXS+ySMLX8
 l0HY9mo7ZJb/dzno0dEAgt2rVG2Aq8FZ7GYPlwE2OiVYF74bBTdLUKoTS8ig6LQfOrU8
 kajQWjAqylvssSFRwr30ge/nIO8g2K4q1C34vH2WiEcvbBTFCQq23+gGdllg0eEicWjx
 dFcw+8zahAraAY3wnWT+XJeHY9/3K0fkPJtnLbAWsjqYBEAYEtdEiIooZ0PfnPh1Ss+r
 oRZFB+9z4QY2zT8VcdKNd2OdlVRq9Ji1ALxFu37Eewm7rIL/L2kOif+51z32TrQRmJUw
 zUIg==
X-Gm-Message-State: AOAM530vwalO5/AiYR7CaNQzdy5SnYCvZ68k+zRzQIel7iR/QjdU+MTF
 jAo4XosSAFzOlCOD/ShSNANosHz08Ra6LeMW99gIlw==
X-Google-Smtp-Source: ABdhPJxXRsWHoRSS+DqKbfDPMQ4aRNvfX6WB5CCyhEHmFMsKbxf9xeh5w6evmQo2ATTX7WJCxTs0JimQzDD9PcEr90Q=
X-Received: by 2002:a6b:cf13:: with SMTP id o19mr599046ioa.206.1623363860099; 
 Thu, 10 Jun 2021 15:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <1623293391-17261-1-git-send-email-xiyuyang19@fudan.edu.cn>
In-Reply-To: <1623293391-17261-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 10 Jun 2021 15:28:15 -0700
Message-ID: <CAJs_Fx6qgQFOp16SLQfz-Aaj4mqTo+vCvfpQr_E3UapVTrsu6Q@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Fix arm_smmu_device refcount leak in
 address translation
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 yuanxzhang@fudan.edu.cn, iommu@lists.linux-foundation.org,
 Xin Tan <tanxin.ctf@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, Jun 9, 2021 at 7:50 PM Xiyu Yang <xiyuyang19@fudan.edu.cn> wrote:
>
> The reference counting issue happens in several exception handling paths
> of arm_smmu_iova_to_phys_hard(). When those error scenarios occur, the
> function forgets to decrease the refcount of "smmu" increased by
> arm_smmu_rpm_get(), causing a refcount leak.
>
> Fix this issue by jumping to "out" label when those error scenarios
> occur.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..3a3847277320 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1271,6 +1271,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
>         u64 phys;
>         unsigned long va, flags;
>         int ret, idx = cfg->cbndx;
> +       phys_addr_t addr = 0;
>
>         ret = arm_smmu_rpm_get(smmu);
>         if (ret < 0)
> @@ -1290,6 +1291,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
>                 dev_err(dev,
>                         "iova to phys timed out on %pad. Falling back to software table walk.\n",
>                         &iova);
> +               arm_smmu_rpm_put(smmu);
>                 return ops->iova_to_phys(ops, iova);

I suppose you could also:

   addr = ops->iov_to_phys(...);
   goto out;

but either way,

Reviewed-by: Rob Clark <robdclark@chromium.org>

>         }
>
> @@ -1298,12 +1300,14 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
>         if (phys & ARM_SMMU_CB_PAR_F) {
>                 dev_err(dev, "translation fault!\n");
>                 dev_err(dev, "PAR = 0x%llx\n", phys);
> -               return 0;
> +               goto out;
>         }
>
> +       addr = (phys & GENMASK_ULL(39, 12)) | (iova & 0xfff);
> +out:
>         arm_smmu_rpm_put(smmu);
>
> -       return (phys & GENMASK_ULL(39, 12)) | (iova & 0xfff);
> +       return addr;
>  }
>
>  static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
> --
> 2.7.4
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
