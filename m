Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D337D1BD594
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 09:21:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62847876E8;
	Wed, 29 Apr 2020 07:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSovrANKAy58; Wed, 29 Apr 2020 07:21:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB58686F9F;
	Wed, 29 Apr 2020 07:21:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4F03C0172;
	Wed, 29 Apr 2020 07:21:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D041C0172
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 07:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11F4A81BD6
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 07:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6kL_zianK1h for <iommu@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 07:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ACBA881E4F
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 07:21:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h4so772815wmb.4
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cCAHFPkV5zKy0lOqNzgFSwfk1faaHM5kTxrOdR4mtV0=;
 b=qfHixOrwUj7Z+T5hUCKAQQvbwoGTrwpUbqxft4Z0FW7cxbhKzWmTTBcrbmTUBD1BCU
 UYUNL8rHAalDR3r/O6paaxcxkjvsqp7P1mGeGALESzQUvh8c5kchThOUHol9+MX9ZYce
 KNZQ6rVy/4tK5R/7/kVurzd47F+eU1zSHEz+Cigo9VwyWeF7gsbfbsLQWz7kZavXHbIk
 30SKz/CXf60CiCh/5zaMuDwmvUWBwyjoytcRoYV/zZoV0F5YfA+1AFyVrjD/jHDMlYgv
 /XN9sVJ/XiKC2VgDHnvYRvYINP7ZhukoeZnh4AN+xJXKZ/fpSKQcSOBBO6lDA9qhTxPC
 Vqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cCAHFPkV5zKy0lOqNzgFSwfk1faaHM5kTxrOdR4mtV0=;
 b=fBO+9IauqHIsMSI1l3LZ5gvDUfgQr9otl3L/AMaSOvFFeg7Csm+7IH1Hg8QFHB1kD4
 DTUTKXThX3s9iUF6BGhoCtjfNwYFl5CxxpRmMhY/Eu4eR4dfG5zWJxbc3VZVEeROHT2p
 75Nv8ctabmIsfjceTlzDpnZYeyL9lmS1I99YdLIJ4oRvlIgwjLCwlKslapJQFFfYBIaM
 vGO/aZxRAErCIwXiKb+TkzlN4gau6rvw+AhsuZa8KZak9SJuPt6DhQiowbP4SNkVP5hA
 BENBJ8X5T2ZtPE6NmN/T20qG+p+0PfH6U9RTJM+uMWcVqK4FAHv2lioP/sVNboffMfY5
 dMEg==
X-Gm-Message-State: AGi0PuYWQwoqrkZrraMOArN57aZIiFcN//qg6jQcLtlMxAS+ipZrn44V
 +B7doqzUddkSibsUACBPZNVrhg==
X-Google-Smtp-Source: APiQypJs+3J3cKxM/LtgKzAvg7qC3vSLpX2ePy1LG0WB6A/JB3tF2dYB0tGSkd5NOoDj8qQAP2sJSw==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr1629206wme.18.1588144874110;
 Wed, 29 Apr 2020 00:21:14 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id k3sm31836574wru.90.2020.04.29.00.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 00:21:13 -0700 (PDT)
Date: Wed, 29 Apr 2020 09:21:04 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Tuan Phan <tuanphan@amperemail.onmicrosoft.com>
Subject: Re: [PATCH] perf/smmuv3: Allow sharing MMIO registers with the SMMU
 driver
Message-ID: <20200429072104.GA817954@myrica>
References: <20200421155745.19815-1-jean-philippe@linaro.org>
 <F8C2FB7F-2D21-44AA-B41D-0D4555A63660@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F8C2FB7F-2D21-44AA-B41D-0D4555A63660@amperemail.onmicrosoft.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Tue, Apr 28, 2020 at 11:10:09AM -0700, Tuan Phan wrote:
> I tested this patch on HW, however I need to add one more following change to make it works

Thanks for testing. I don't understand why you need the change below
though, do you know which other region is conflicting with the SMMU?
It should be displayed in the error message and /proc/iomem.

Thanks,
Jean

> @@ -2854,7 +2854,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>         }
>         ioaddr = res->start;
>  
> -       smmu->base = devm_ioremap_resource(dev, res);
> +       smmu->base = devm_ioremap(dev, res->start, resource_size(res));
>         if (IS_ERR(smmu->base))
>                 return PTR_ERR(smmu->base);
> 
> 
> > 	} else {
> > 		smmu_pmu->reloc_base = smmu_pmu->reg_base;
> > 	}
> > -- 
> > 2.26.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
