Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0D2846FB
	for <lists.iommu@lfdr.de>; Tue,  6 Oct 2020 09:19:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B490847AB;
	Tue,  6 Oct 2020 07:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OYTLiFGRgmd; Tue,  6 Oct 2020 07:18:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 676FF8489F;
	Tue,  6 Oct 2020 07:18:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C85CC0051;
	Tue,  6 Oct 2020 07:18:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D762FC0051
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 07:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD9C283499
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 07:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fcLC4Mh5Msm for <iommu@lists.linux-foundation.org>;
 Tue,  6 Oct 2020 07:18:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E80A483498
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 07:18:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j136so1903053wmj.2
 for <iommu@lists.linux-foundation.org>; Tue, 06 Oct 2020 00:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ITHR5xjZR9qU+0rYpKhMHSvOMECUC8YhvuIaZkbc094=;
 b=dohHJ8zyoyUP/5cex9Ul7yNiwiHU2DfG7+FLxcTZzC42x+R/1y1NxgXPcdayhA8wjm
 3kLVEvIgMtAvmM3PMVmzmJzX+56TruqIfI8SAaPZnLqD+OebdQx0I2QjpvRAnLcjMuzf
 w6sGoHEWBUGPuq8JPmH1eexhTK07ld0ohr/Ij8lby4QvN130stoCaPOfCsqwSRb2iRda
 /XpmnHGmtK5Ovf2n+fKU9xX99hyiUG9CNTZoo/dwx+nU9b4eWUyLG9Cm/HPI4R+TrSYr
 dJrQWhQFhF3KxHfHvrmdId/+I8CRbcSQ2YUPiryGvDzQGV7nYthvLLdgtP5N+7SiEuHL
 PQNA==
X-Gm-Message-State: AOAM532Vetl3uFTRzLTSNUrV1DxXiplpuARCm13+Mp1fUCCRYBR01s1P
 QRczcONhzhSdudznvlzI8Y4=
X-Google-Smtp-Source: ABdhPJx0yNrHEU7UDvNE8lhlFuoDDRp9Cl+ESLoSIMyNzIen0lPioASqSAe2IV+9r6VqPllxNH0sgA==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr3284322wma.48.1601968722386;
 Tue, 06 Oct 2020 00:18:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id p9sm2617wmm.4.2020.10.06.00.18.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Oct 2020 00:18:41 -0700 (PDT)
Date: Tue, 6 Oct 2020 09:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 18/24] iommu/mediatek: Support master use iova over
 32bit
Message-ID: <20201006071838.GA5703@kozik-lap>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-19-yong.wu@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

On Wed, Sep 30, 2020 at 03:06:41PM +0800, Yong Wu wrote:
> After extending v7s, our pagetable already support iova reach
> 16GB(34bit). the master got the iova via dma_alloc_attrs may reach
> 34bits, but its HW register still is 32bit. then how to set the
> bit32/bit33 iova? this depend on a SMI larb setting(bank_sel).
> 
> we separate whole 16GB iova to four banks:
> bank: 0: 0~4G; 1: 4~8G; 2: 8-12G; 3: 12-16G;
> The bank number is (iova >> 32).
> 
> We will preassign which bank the larbs belong to. currently we don't
> have a interface for master to adjust its bank number.
> 
> Each a bank is a iova_region which is a independent iommu-domain.
> the iova range for each iommu-domain can't cross 4G.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c  | 12 +++++++++---
>  drivers/memory/mtk-smi.c   |  7 +++++++
>  include/soc/mediatek/smi.h |  1 +
>  3 files changed, 17 insertions(+), 3 deletions(-)


For the memory part:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
