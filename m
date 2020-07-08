Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B721919B
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 22:36:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1DA74215DF;
	Wed,  8 Jul 2020 20:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-3hdaR3ixhW; Wed,  8 Jul 2020 20:36:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6DCCB21556;
	Wed,  8 Jul 2020 20:36:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C7B4C016F;
	Wed,  8 Jul 2020 20:36:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1F25C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D9DE868CE
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRiZ3VddshRP for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 20:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27EBD8687B
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:36:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k5so2801990plk.13
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jul 2020 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9rLMHF7RPOkdP8XBfKv5DeFSqMtc69/zKxIruSrtRkg=;
 b=hop4Z7+hPacoKF2K2a9kPOSfxgM5ZnlHngC8TvhdAUSh0hP5SaGebffZ8vCftXZPLf
 VNoTIeuMbvbIQfxnN4LajYTG79nIHpHVuyL+Iqp16e9O7fyWJ50vBL9O4wO6g36rpXkC
 RYhn7fR1ldEaFEiNiOUpwwte+C9dsoCJPtnJQSZ7ffDVyU13JBqY5gDVSkIghL7eDaJq
 necJ+UXPglOcc9LfjN1bGxdmjjlXrSFLQHkZWsrGSbuOlDQuwA/Tr6k+FrReKtpyAXif
 yMXzD1y3pyvrESCxLD7Jc1Z2K8H3Lr34VZZHLIKd4SMDTS9qFupaDM+4F4ItAYl5OCaA
 H7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9rLMHF7RPOkdP8XBfKv5DeFSqMtc69/zKxIruSrtRkg=;
 b=Wv2B0z5hRrtRn1a3fKhc2x4tQzs2yr9G343JFvkQhJVQw074N3IdmHkbBxFn8V9UfF
 buRBt7M9ohPHxKyP4UjKObdUFvkURZRyQCBmA2tFA6NoCzuK7STs0q/D5bpA7wLQUrTU
 GwMpoGYfILdL7hJU7ClxOW2m+kbPHiYfsHz1ChMQRRN4rbrCSy2RGxDZGLVxrxyNDcLj
 GLPhNPwTuRpO06VdHJB29u+Eozo3lCFKT+PnpDclfK6KwZumIUk95w8/5tYtZ6niyOdg
 5Fyv2ppGDj7xaOqlbyQ7Pwkz2aYWaZ3ieq/kidF55rTUm0sBo+sDMxuyUKCRsZx6a5eM
 Fq8g==
X-Gm-Message-State: AOAM530Q/D/7wDPNHkU8v36q0QLdHbaOBKYtFL7/irFZa2lTrnaquDHO
 dptc4R60gEWpWXRYgTxYYq4=
X-Google-Smtp-Source: ABdhPJzemCEI2WFYj68dmrOodtuH49vvXwwDiDf/1BJQPvSdsAAuf3s/BfJtg+3GTR292+GXPwPmXQ==
X-Received: by 2002:a17:902:c38b:: with SMTP id
 g11mr5179940plg.340.1594240592678; 
 Wed, 08 Jul 2020 13:36:32 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id e8sm535878pff.185.2020.07.08.13.36.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jul 2020 13:36:32 -0700 (PDT)
Date: Wed, 8 Jul 2020 13:36:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 5/5] iommu/arm-smmu: Add global/context fault
 implementation hooks
Message-ID: <20200708203616.GA28080@Asurada-Nvidia>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-6-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708050017.31563-6-vdumpa@nvidia.com>
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

On Tue, Jul 07, 2020 at 10:00:17PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow vendor specific implementations
> override default fault interrupt handlers.
> 
> Update NVIDIA implementation to override the default global/context fault
> interrupt handlers and handle interrupts across the two ARM MMU-500s that
> are programmed identically.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
