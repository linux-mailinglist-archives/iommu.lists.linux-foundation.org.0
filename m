Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6C2191A6
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 22:37:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BADCF20439;
	Wed,  8 Jul 2020 20:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzWsAuVvQZja; Wed,  8 Jul 2020 20:37:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B3152078B;
	Wed,  8 Jul 2020 20:37:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB882C016F;
	Wed,  8 Jul 2020 20:37:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DD09C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0911D86943
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpRvxHT2QBhi for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 20:37:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80E388693D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:54 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z5so22221374pgb.6
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jul 2020 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ljcNt9Q9gyoQ+/Fb061cdO0nQmkXaUZAJJkPkHoUNac=;
 b=drdq9olWal5ez1y2TdJFej07GcBIeRMEANqTT0u7bHwUbCDF5jJ4SSdsxGbL/CnKId
 efhZJpESy1Jm6sWFCNDVk7HR821YBSOksd/azKBSTO9NEMfLh0XXeZ4a6CqgMEkTJ66r
 920mDi2yinUxrwXG+GQ36ZHgcXHMVUm7cGu5diO3R/ybDFZIdh1obuVR+50M5nTJzPmE
 32vVvE3dK5IWytBsS2h9Ed1ESz3fASU0Z0bsOboJFmJuedsKS7T2R+Tw9sxOI0b43gjt
 h9h/fPIS5yrKydQZU8Xzfu4NePVJduC89xparXm98r6FAWjgxBaV16E3IeI3rNgpYYWm
 YxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ljcNt9Q9gyoQ+/Fb061cdO0nQmkXaUZAJJkPkHoUNac=;
 b=LJOR8uVFvJBCDOs7zs9wne/kLtMXXWPzsejqOC7jF5BK4i9rzeZtWzoLpXmg/SXvXX
 ADclG+oSlkLdP9tNxEgO5kAxB+zVVhDa7zj3kt57AxnvfWOKnKRjnURxW4wuTrLGFFDs
 KIFxWWIgXR07PABIJvuACqm9uLe/+UCSsg+le/gugCqnvgS4H+doOWf5M+2Y9EuTUHSb
 YItlTaiORs7i23GuOD5F5fqRhk1ZOEL7cMemJrbYnuD9ntS1uWKoCrNAn+HoI41QlMu5
 K61hz2o3kCHXnXqQsI+f0Ia0XJdSHDofnsJuz7AHHDtQPLEoDdG9/2/ZW8QqNWT82GTu
 hu5Q==
X-Gm-Message-State: AOAM531mHs7MoZzBBedPzBvBcR+5wz6yDZ8a76BwJ5nvfDu5zrWI2m7r
 1p8SU5v2wn2K0abxl9HtVSE=
X-Google-Smtp-Source: ABdhPJyPrtwfQkvn91VaFePjHd+mmgPxNNRCW36/D+GYnL7TWzlB+XRW8gav2TLMpTbep6hsFpiA6A==
X-Received: by 2002:a62:140e:: with SMTP id 14mr11831620pfu.196.1594240674079; 
 Wed, 08 Jul 2020 13:37:54 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u74sm573275pgc.58.2020.07.08.13.37.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jul 2020 13:37:53 -0700 (PDT)
Date: Wed, 8 Jul 2020 13:37:40 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 2/5] iommu/arm-smmu: ioremap smmu mmio region before
 implementation init
Message-ID: <20200708203740.GD28080@Asurada-Nvidia>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-3-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708050017.31563-3-vdumpa@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 praithatha@nvidia.com, bhuntsman@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On Tue, Jul 07, 2020 at 10:00:14PM -0700, Krishna Reddy wrote:
> ioremap smmu mmio region before calling into implementation init.
> This is necessary to allow mapped address available during vendor
> specific implementation init.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
