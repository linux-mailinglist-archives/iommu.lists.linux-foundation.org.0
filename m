Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC21186EBA
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 16:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 033B086EFF;
	Mon, 16 Mar 2020 15:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHpili46UPkq; Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F47A86F3C;
	Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48AEEC013E;
	Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 900FAC013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E8A588C8E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1VQd8B3UnQf for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 86A4B88C80
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:39:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a25so21826843wrd.0
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=VjUfHswCT1UKNAujAPhK8VCtliVrWtYIYyppBsAtlnbFCrxaad4Uc2A5soRvyi8Lz/
 SqPfxSFRDIQCzDyvLFNz52fC+JJkBauYJCclNDsvmtzidrUQROIsVQV6zcwzj00LmPWd
 He65rfdf7A/Oc+IFkmPIIFP2thDMmrP7w+MUVZbhd7yiRPnRF5U7lNWsW24hYJVoJYeR
 8wHBvHBpk9d8ZmoBo1s6yLkrnEqIRgPQmKuMyjkvlD33ynh0mEfoeYi9XfpNu36ky7nN
 jntyaqHoGFn/okVfozaKqLoYwnG4+U3ZIqhxZ9ETSHCiCMC6Iw7WS6sjUwRs0+vfP+X7
 +bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=SN3BLPMdMxtgsaGUByY9WUH1vLtRDoaRq4YL3+U2OfW99u7P9epeaUGBE2ipnc6ic5
 ay0zPUChGDZDA6Ao86XO3N4gOxMVGbS3jgj+z9hEVK9vJXpK5YPFMckeAPKbIKJ6rCNM
 32BOb8ddziuVizN5No0I33gNAf7OCzh0Kczzeypwsipcj4kLuLnk2qczahakkIAJ9WGx
 7khCA/Jkj+wp301JNMCPMbE2lNjPMB0x8e3TXalMcZjwxOmabt7jD5n3xTvBi7s6xtdK
 TUiEbUtCth6KjV0IJV4v/tGwMM2P4aRudnn4YLQH9S+mE5He0vRb3txkmxwoYH3wQzzh
 i5Zw==
X-Gm-Message-State: ANhLgQ0M7gFpK+WyC/0iTI8Y6uvzMDDXiTL5FkpQrGg6S0b5ceVfOjtf
 c5hLMOa6T0PfIIgQ+W5UP6a4bQ==
X-Google-Smtp-Source: ADFU+vs0mvRenL1g+U69U0qbNtFq1SVNLFNkkOGefFPc2C+th0hGKZ/JyHhYDuRn/eeS5wXEeUsB/Q==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr26159791wrk.101.1584373164974; 
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 19sm143446wma.3.2020.03.16.08.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:39:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 01/15] iommu: Define dev_iommu_fwspec_get() for
 !CONFIG_IOMMU_API
Message-ID: <20200316153916.GB304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-2-joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
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

On Tue, Mar 10, 2020 at 10:12:15AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> There are users outside of the IOMMU code that need to call that
> function. Define it for !CONFIG_IOMMU_API too so that compilation does
> not break.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

As a result drivers/gpu/host1x/hw/channel_hw.c and
drivers/gpu/drm/tegra/vic.c can lose their #ifdef CONFIG_IOMMU_API

> ---
>  include/linux/iommu.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d1b5f4d98569..3c4ca041d7a2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1073,6 +1073,10 @@ static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>  	return -ENODEV;
>  }
>  
> +static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_IOMMU_API */
>  
>  #ifdef CONFIG_IOMMU_DEBUGFS
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
