Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA4186ED8
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 16:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DDBAC203E8;
	Mon, 16 Mar 2020 15:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ks5-GHJ+9YGT; Mon, 16 Mar 2020 15:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9107520406;
	Mon, 16 Mar 2020 15:43:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9CDC013E;
	Mon, 16 Mar 2020 15:43:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94039C013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 80010203E8
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzOrh7xtfF8j for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id F2308203DB
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 15:43:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a25so21841641wrd.0
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=gEq8/ZMBwfLkBD9tGRHGjZfTd20HP1xHo/lJCYGOxGAYI7JgVG9jMowKPQSyqmQoJH
 Q9ZbaY7SOKJp8K4eyLHZOG5BXM7bIz0LDg0iLZ0C7XwnSZgO4Q7ql/grJgyu+f0XKKiZ
 8hj2Hl5fh1i6wP+q7uq/YnEi3K13FYNSMiMBiMDb9rTjtVKuKwTX2bq22JmdTliOTXP2
 K+5zCU0/1lWFBSvTXbDx9fEkSA/zS7i5vKY3n2XrAijwrJW7uI1+D+Ab8wO+LOpxCjFg
 cLiZ+CoMaM/7tmWRw/RxFAOt/xBIBCD8p1Ekq22vHH0ospnbZ5362hTq6dFil73T5VxH
 cAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=Rm51ccyeYslXuvIxfEUYg1rKugMnjZr+EATNOxHhDkVBuzbFt3yVrdMdD7id1QPxw2
 JMnx0TqwJdk+qomcisYkrVpzxPDvYcwg9xtnsBquhrwFPg5DkjwZj3ToeGDYuL6ok0Og
 28coW9qR5BcmnGKnK/WEp5ECCBAeqhYbjy//swhVb/ry8FaE/YjOI0lUphLA80TgYM8k
 G4cES7w47xKmt8yD3CVTIov8WuEhEOIu4cZOY3dBo2rER9itgl0fQKvyO36rE1bhLcMK
 wQMJ2jnUot5Ky3Z/fxZxfOd1cqpyOpo3RBeLVQRpSxDtrgOPOEYRan/YqckUC/Oc67a9
 XFTw==
X-Gm-Message-State: ANhLgQ3B8xWwLvfDidc//EMSpLZ4WsRnsTL4of2MTV1ix3LFz9Bc8bIn
 iLM/VB1+ETj9wYLVtiVufm8Msg==
X-Google-Smtp-Source: ADFU+vukGMBSU+PIquYB6P7V4T5BWKneai54XgateQmlyq1EDcQ3i3rP1F+AK6w2nNtuc0TA4HUjIw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr35844297wrr.125.1584373387505; 
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id h13sm433117wrv.39.2020.03.16.08.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:42:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 04/15] iommu/tegra-gart: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154259.GE304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-5-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-5-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:18AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/tegra-gart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 3fb7ba72507d..db6559e8336f 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -247,7 +247,7 @@ static int gart_iommu_add_device(struct device *dev)
>  {
>  	struct iommu_group *group;
>  
> -	if (!dev->iommu_fwspec)
> +	if (!dev_iommu_fwspec_get(dev))
>  		return -ENODEV;
>  
>  	group = iommu_group_get_for_dev(dev);
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
