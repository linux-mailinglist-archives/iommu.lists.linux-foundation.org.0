Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE07186F75
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 16:58:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B86A87396;
	Mon, 16 Mar 2020 15:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwfemCIPZ8Zn; Mon, 16 Mar 2020 15:58:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B44587383;
	Mon, 16 Mar 2020 15:58:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8508BC013E;
	Mon, 16 Mar 2020 15:58:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38179C013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 259D120529
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZewSpI-u7P+v for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:58:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 143A0207A8
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:58:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s1so166733wrv.5
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H8gu7DkqIY6Hs0O9tBbPEC3uwEKTTAu/TiMJwJ6IfWo=;
 b=XGOY+0zNdZhJAwbt7nG45/bQQxernSkoWJlhxo09FLN2GjiT7TZsLFWAicn5ItdGvm
 M2f0bxD904jzYwBR3rGju26xdAss05Tnrad5a3+eTITy4PaGbbo8kVJpU/QkMvi8bKHx
 M4gGOaDYgSyiZ3mJ9iPwBTsfWTTTSNUYdtcHHTf5c45HYQCEw05zhk2zHiiIlgXrLl50
 dxZ2vtj0a93wasRTiOYVhgOTGADvh9/WAPglVYHNBNVBcnbgiZ5GUkbXkDqOwRRwnZoI
 /icjBVyzPGEJHv+lmMhuIcgeVZ3ifW3bA1YXra3qBcD2x7XmMiVgn/6LpHTLIoSPUCDG
 QnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8gu7DkqIY6Hs0O9tBbPEC3uwEKTTAu/TiMJwJ6IfWo=;
 b=SxvFRrK0nLvDXy2OyeC8X+tT8mSyKqOGrT7NeF7VmyrUiGrxd+BA5w36pbmDNVUhoi
 XP7PKpbNAYyIOiJDXOpIZMZ3/HxC0/Ba720g23a3bN54wmH7zxHshpD2bIGrA3XAw4gY
 XEYUr+6cY1Ukkh7tAOYVMreD4nMb5t5g4+f7M8fZec8HbHCXNJTPgA9GmnotD7GIomH2
 g7kUJY6PM1IP+VB2jA2VI3Vs+i1gQMicIE4em7uYJ+4mmDiD6fuuDp4W+Suph62eW3bC
 jhpPmN/Okqh73gRHLvecfOx4znUNiE7hRHCIBlnNhxtYW38OFiuPie7cbYghasd8PSSa
 iRHQ==
X-Gm-Message-State: ANhLgQ3uAR3lyKcySEGr30oZM7EWPFu3HjFflxYBrnNVYUafNFn4Kprc
 xD8WnLwzpUSlYck+0/m5aS0D6Q==
X-Google-Smtp-Source: ADFU+vsSrPRyJcA3YQxERetVdYcC8+kKaCnqT9yz2q1GFbJB+t1gIFoFuZk5ByOWaxPUf9x/6kt4+g==
X-Received: by 2002:a5d:66c4:: with SMTP id k4mr23072wrw.133.1584374284591;
 Mon, 16 Mar 2020 08:58:04 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y189sm180467wmb.26.2020.03.16.08.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:58:04 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:57:56 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 15/15] iommu: Move fwspec->iommu_priv to struct dev_iommu
Message-ID: <20200316155756.GO304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-16-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-16-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:29AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Move the pointer for iommu private data from struct iommu_fwspec to
> struct dev_iommu.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  include/linux/iommu.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 056900e75758..8c4d45fce042 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -369,6 +369,7 @@ struct iommu_fault_param {
>   *
>   * @fault_param: IOMMU detected device fault reporting data
>   * @fwspec:	 IOMMU fwspec data
> + * @priv:	 IOMMU Driver private data
>   *
>   * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
>   *	struct iommu_group	*iommu_group;
> @@ -377,6 +378,7 @@ struct dev_iommu {
>  	struct mutex lock;
>  	struct iommu_fault_param	*fault_param;
>  	struct iommu_fwspec		*fwspec;
> +	void				*priv;
>  };
>  
>  int  iommu_device_register(struct iommu_device *iommu);
> @@ -589,7 +591,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
>  struct iommu_fwspec {
>  	const struct iommu_ops	*ops;
>  	struct fwnode_handle	*iommu_fwnode;
> -	void			*iommu_priv;
>  	u32			flags;
>  	u32			num_pasid_bits;
>  	unsigned int		num_ids;
> @@ -629,12 +630,12 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
>  
>  static inline void *dev_iommu_priv_get(struct device *dev)
>  {
> -	return dev->iommu->fwspec->iommu_priv;
> +	return dev->iommu->priv;
>  }
>  
>  static inline void dev_iommu_priv_set(struct device *dev, void *priv)
>  {
> -	dev->iommu->fwspec->iommu_priv = priv;
> +	dev->iommu->priv = priv;
>  }
>  
>  int iommu_probe_device(struct device *dev);
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
