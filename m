Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450E34E758
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 14:17:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959394046A;
	Tue, 30 Mar 2021 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwBAF81YlZ_m; Tue, 30 Mar 2021 12:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FAD40469;
	Tue, 30 Mar 2021 12:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1E74C0017;
	Tue, 30 Mar 2021 12:17:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC3A8C000A;
 Tue, 30 Mar 2021 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7ED740146;
 Tue, 30 Mar 2021 12:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiyA3qGsdWrl; Tue, 30 Mar 2021 12:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F4C4400B8;
 Tue, 30 Mar 2021 12:17:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCFD861613;
 Tue, 30 Mar 2021 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106632;
 bh=R1A+HSQkC8e4xAjjBa78+nl1HCzgHqTXI4btq91BvAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c25S81BmNCVGy2OObw4tONoA0BojMCxtSOklHDKSIj3LBTHzA1/vu4ULOtdwrhaKd
 WDRfAnsEctJcADLUnZE7e4rCMh20iy3euLeexNN3WbVyaj2Jtsudf1lTE+dAEff4Na
 EbBkVoLWPCMK4kXmg1lZUi472g/zewPckNo6IUv1xppwSMzqP67IcdaAjBBbbJIPdj
 bAU/Cefcsji1sn251Az9hG84M4pKR8GSzh27H1MZGWktXOEdnAXajGUbYVkL8ZQkNK
 2pHZBINx71bFOqfhE2/GG/OPglg0+vCFbhdOxQ2PvsQfLAlsrPgsJIVJGbkCeEVtuv
 jx7d9GgoKNuyg==
Date: Tue, 30 Mar 2021 13:17:06 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/18] iommu/fsl_pamu: merge iommu_alloc_dma_domain into
 fsl_pamu_domain_alloc
Message-ID: <20210330121706.GD5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Mar 16, 2021 at 04:38:10PM +0100, Christoph Hellwig wrote:
> Keep the functionality to allocate the domain together.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 34 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 24 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
