Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 321552733C2
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 22:45:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C3CE820785;
	Mon, 21 Sep 2020 20:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmGU9JBsKxlq; Mon, 21 Sep 2020 20:45:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 93B4C20763;
	Mon, 21 Sep 2020 20:45:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A3F5C0051;
	Mon, 21 Sep 2020 20:45:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E50B3C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3627861D4
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 20:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn4C9fPi+H3F for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 20:45:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6392386193
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 20:45:51 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3014720735;
 Mon, 21 Sep 2020 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600721151;
 bh=2azUc9d8t3fHwPUNHpcYBtku3ZGS3Konwm3NpWeBUPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ol3y6mLGysrQgD+hsUG5Zs8QfPycb6c9FdF4neo3Yl2B/SVvlbRvPSbSEpjww+2bT
 uQo4nTyqiwwW8rqhc69kVyrBTohJyZSTfJKOw07y1OP8yU+hIq6ad10ko+dr9Pn/vT
 pBH3mLd+y9ggYldkOg61tDWF3qUa/bBauierV5Ks=
Date: Mon, 21 Sep 2020 21:45:45 +0100
From: Will Deacon <will@kernel.org>
To: Vennila Megavannan <vemegava@linux.microsoft.com>
Subject: Re: [PATCH v2] iommu/arm: Add module parameter to set msi iova address
Message-ID: <20200921204545.GA3811@willie-the-truck>
References: <20200914181307.117792-1-vemegava@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914181307.117792-1-vemegava@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe@linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, tyhicks@linux.microsoft.com,
 srinath.mannam@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 14, 2020 at 11:13:07AM -0700, Vennila Megavannan wrote:
> From: Srinath Mannam <srinath.mannam@broadcom.com>
> 
> Add provision to change default value of MSI IOVA base to platform's
> suitable IOVA using module parameter. The present hardcoded MSI IOVA base
> may not be the accessible IOVA ranges of platform.
> 
> If any platform has the limitaion to access default MSI IOVA, then it can
> be changed using "arm-smmu.msi_iova_base=0xa0000000" command line argument.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Co-developed-by: Vennila Megavannan <vemegava@linux.microsoft.com>
> Signed-off-by: Vennila Megavannan <vemegava@linux.microsoft.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 ++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

This feels pretty fragile. Wouldn't it be better to realise that there's
a region conflict with iommu_dma_get_resv_regions() and move the MSI window
accordingly at runtime?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
