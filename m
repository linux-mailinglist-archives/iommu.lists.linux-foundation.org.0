Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7944A12FCCB
	for <lists.iommu@lfdr.de>; Fri,  3 Jan 2020 20:02:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25FCA85F5F;
	Fri,  3 Jan 2020 19:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CALAjn7mGjd5; Fri,  3 Jan 2020 19:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1809985F59;
	Fri,  3 Jan 2020 19:02:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 008C8C1D8A;
	Fri,  3 Jan 2020 19:02:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36F9FC077D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 19:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2D2DD86BA8
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 19:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgLsLbaFFVU1 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 19:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7ACBC8685D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 19:02:16 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cy15so42399648edb.4
 for <iommu@lists.linux-foundation.org>; Fri, 03 Jan 2020 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
 b=O2MUFtAD4ZE08qe5e8wUK40pSV3MWGSqQ9oCAPTvZsEdPCFIN0dnMBZamFXlmw6lEt
 pjbp3ltsNqOVn7rnbJL3TqQGijOBPe5Jkq4gD5dRfySP0YItvvLFTf9mBhrabASlg47a
 2Bm4XFI54uLMXNw/GcTGRethvJsUfjLSYEww68efsuRZlnlAi4KyEx1bqLE+478t/sdf
 wzTGDoAFKcyin76PjFi53Ex/UhOtNaJMwvUOQ16KKmtS9KpIv3NpYuNdfBDbe41oMYaE
 kqPu3OqyaIDoEPWR1htm4+anPvqidSSfXQOKV+wWLhqQYyWv1KVOrDaTpkowvcvxiUGt
 1Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
 b=qWjWjz0riMTu1NVE3yI9p1zaERUyMrlT4dKrPPGQO59Ebf6X8TL+OIwWfEq3UO3Vtp
 dd/pffYacvIA7WmhEut3DdngbxcKRDQHDemEC9gZ08IwTvPm+a2bf71EqFEW2MrhgMTd
 2ykApv9pEZo04qiOBZ4BqKqpaWu9O+z54RLxQR0LF2cWFiNz9rwRMWewUPxt9OThlASw
 8cyPhDXb02eFmOF5PzRGQqL+xOkjgh8TXhvyeND+typ08gFo2UT8mqNDoseCt1808lT1
 AOUedyrdBZqSnDrFHZGqWk9pXEa9D0wXKHTTJ4e4TkH6Q7KvgaMjXoQ9LrMEDcBXLOkH
 IngA==
X-Gm-Message-State: APjAAAUuRtPGgWcWDBVABMKu9z7Nr/AVkEUqO/BusvB36fWekHYdDwLU
 PEDRpjG41gXv9N2GnGxoaj722D0e3k6m1NBVl/Y=
X-Google-Smtp-Source: APXvYqxS55HXS3z8CIX9ctS+VVvu28guenRxGgfT7JZP5HxyppRusJag9NZUaCsJSd1/RAnJOLIyc/xzpyWSZQZVZhs=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr94494730eds.163.1578078134838; 
 Fri, 03 Jan 2020 11:02:14 -0800 (PST)
MIME-Version: 1.0
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
 <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2020 11:02:03 -0800
Message-ID: <CAF6AEGvmrTmjyFsqX+DQNNgXxDw2uGYJv6bA0Y6OGn05m_0WFQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/7] iommu/arm-smmu: Add domain attribute
 for QCOM system cache
To: Sharat Masetty <smasetty@codeaurora.org>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 dri-devel@freedesktop.org, Vivek Gautam <vivek.gautam@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jan 2, 2020 at 3:02 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Add iommu domain attribute for using system cache aka last level
> cache on QCOM SoCs by client drivers like GPU to set right
> attributes for caching the hardware pagetables into the system cache.
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 10 ++++++++++
>  drivers/iommu/arm-smmu.c      | 14 ++++++++++++++
>  drivers/iommu/arm-smmu.h      |  1 +
>  include/linux/iommu.h         |  1 +
>  4 files changed, 26 insertions(+)
>
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c..d1d22df 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -30,7 +30,17 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>         return ret;
>  }
>
> +static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +                                 struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +       if (smmu_domain->sys_cache)
> +               pgtbl_cfg->coherent_walk = false;

just curious, does coherent walk not work with sys-cache, or is it
just that it is kind of pointless (given that, afaiu, the pagetables
can be cached by the system cache)?

> +
> +       return 0;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +       .init_context = qcom_smmu_init_context,
>         .reset = qcom_sdm845_smmu500_reset,
>  };
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 4f7e0c0..055b548 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1466,6 +1466,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>                 case DOMAIN_ATTR_NESTING:
>                         *(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>                         return 0;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       *((int *)data) = smmu_domain->sys_cache;
> +                       return 0;
>                 default:
>                         return -ENODEV;
>                 }
> @@ -1506,6 +1509,17 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>                         else
>                                 smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>                         break;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       if (smmu_domain->smmu) {
> +                               ret = -EPERM;
> +                               goto out_unlock;
> +                       }
> +
> +                       if (*((int *)data))
> +                               smmu_domain->sys_cache = true;
> +                       else
> +                               smmu_domain->sys_cache = false;
> +                       break;
>                 default:
>                         ret = -ENODEV;
>                 }
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index f57cdbe..8aeaaf0 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -322,6 +322,7 @@ struct arm_smmu_domain {
>         struct mutex                    init_mutex; /* Protects smmu pointer */
>         spinlock_t                      cb_lock; /* Serialises ATS1* ops and TLB syncs */
>         struct iommu_domain             domain;
> +       bool                            sys_cache;
>  };
>
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 0c60e75..bd61c60 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -127,6 +127,7 @@ enum iommu_attr {
>         DOMAIN_ATTR_FSL_PAMUV1,
>         DOMAIN_ATTR_NESTING,    /* two stages of translation */
>         DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> +       DOMAIN_ATTR_QCOM_SYS_CACHE,

Given that IOMMU_QCOM_SYS_CACHE was renamed to IOMMU_SYS_CACHE_ONLY, I
wonder if this domain attr should simply be DOMAIN_ATTR_SYS_CACHE?

But that said, the function of this domain attr seems to simply be to
disable coherent walk.. I wonder if naming the domain attr after what
it does would make more sense?

BR,
-R


>         DOMAIN_ATTR_MAX,
>  };
>
> --
> 1.9.1
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
