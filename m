Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02418CA66
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 10:30:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 469788811F;
	Fri, 20 Mar 2020 09:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5lfpDkKr3Wj; Fri, 20 Mar 2020 09:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFEF3880F8;
	Fri, 20 Mar 2020 09:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB3F1C07FF;
	Fri, 20 Mar 2020 09:30:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6B8DC07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C4B1F8870B
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbS97LpMuwC9 for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:30:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB09C886F5
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:30:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d1so5505571wmb.2
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t95jhtMcmGffLMbEseHS3007BbwA1KPmU4Pb5j0U3FY=;
 b=VqvMEJNKWZ+GMMBwIEtcSmmQKWKa8aEWa+iSg7K5ytuOLsVlLmG0bxMkn3PU/07/GG
 6Q2HUOGfO5iPvqGcO35qgA4IixhmG8QwLjWYOw5KbUtFDawlvpNZaptJe1SF0+t+TdwY
 UtVSFJ+0AL/hWuO+Z3Iubq09qsH358JYUPFD8YAPeFuEeQ8v9zcywnWIhuz/cje9jg5W
 IBx1bbdVWZEZ7sETn+vGQz57/J5yfr3U3GK6WHlYPmD+kApK8u+i/paveQbmAE2HSqE8
 1AoHygKuu9yQQKRZXHd26ReC8qzFOV56S8fIDSduJWHoBdRwddg+s47yKqdRUhwuioFU
 knag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t95jhtMcmGffLMbEseHS3007BbwA1KPmU4Pb5j0U3FY=;
 b=PQZacQ+UnmsRfyQgd0OebNGCBX/w78xoB978o7X4HXtE/evTnYYKLaOrTdTTR0D+mo
 yrtU6ep21/uFx1lubdHLeK64KYtRDXEJgAof/C8DV9bBDDc4/y6bd4CLpaAdpuJtMDlg
 9nyw6r93hR8Fx6rsYmbRrRcFsiJB+g9Ddzrr17jBV3yEhtewpPE3UQovs21pRN15aoRc
 RvbJpKRJbgECyWzlIfOsVU3wFChN3UeRTi899lyReYwR6ZdtBkzsi/Qv1yftj9FlbyXI
 LiopacxdT1WyKAW5ZaLyXPbaMj7vWM4it2M9uDvsNrxnT8TeUuBBPckp4frCI+4mrUQS
 s2kA==
X-Gm-Message-State: ANhLgQ3Iearpips5prp/i+lqZGxwYnd0uoHjYItPJfvwTv7uxOwVB438
 ISykQ/SVLjyX51vxzCCXkdReAw==
X-Google-Smtp-Source: ADFU+vvKndZNZl8YtUgYmokxoyclO36pHTSz5y/ZbuS1pLvWCL0Auic4wn0jWR1CcWyuTi2+/gPLrQ==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr8809378wmj.29.1584696633296;
 Fri, 20 Mar 2020 02:30:33 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p10sm3252738wrm.6.2020.03.20.02.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 02:30:32 -0700 (PDT)
Date: Fri, 20 Mar 2020 10:30:25 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Report SVA feature with generic flag
Message-ID: <20200320093025.GB1702630@myrica>
References: <1582586797-61697-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1582586797-61697-3-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582586797-61697-3-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

On Mon, Feb 24, 2020 at 03:26:36PM -0800, Jacob Pan wrote:
> Query Shared Virtual Address/Memory capability is a generic feature.
> SVA feature check is the required first step before calling
> iommu_sva_bind_device().
> 
> VT-d checks SVA feature enabling at per IOMMU level during this step,
> SVA bind device will check and enable PCI ATS, PRS, and PASID capabilities
> at device level.
> 
> This patch reports Intel SVM as SVA feature such that generic code
> (e.g. Uacce [1]) can use it.
> 
> [1] https://lkml.org/lkml/2020/1/15/604
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

Don't you also need to have has_feat(), feat_enabled() and disable_feat()
return positive values?

Thanks,
Jean

> ---
>  drivers/iommu/intel-iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 92c2f2e4197b..5eca6e10d2a4 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -6346,9 +6346,14 @@ intel_iommu_dev_has_feat(struct device *dev, enum iommu_dev_features feat)
>  static int
>  intel_iommu_dev_enable_feat(struct device *dev, enum iommu_dev_features feat)
>  {
> +	struct intel_iommu *intel_iommu = dev_to_intel_iommu(dev);
> +
>  	if (feat == IOMMU_DEV_FEAT_AUX)
>  		return intel_iommu_enable_auxd(dev);
>  
> +	if (feat == IOMMU_DEV_FEAT_SVA)
> +		return intel_iommu->flags & VTD_FLAG_SVM_CAPABLE;
> +
>  	return -ENODEV;
>  }
>  
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
