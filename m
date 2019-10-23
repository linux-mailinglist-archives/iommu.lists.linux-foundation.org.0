Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE630E210C
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 18:53:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4017B09;
	Wed, 23 Oct 2019 16:53:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BBDA92F
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 16:53:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DF32A89C
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 16:52:59 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8F2EF21906;
	Wed, 23 Oct 2019 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571849579;
	bh=F5Izp3I8AX+Ri+LTIkBe2psZof2nJUu/2jw8CqPmo+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vM3wriHv2BCfsl4QWE/Yo0Tr9tEwuSOYD/+jXqoi+TwKpYLw+r7KqC/INuDeE6paR
	8kN95fF7O/278RKBRp+COHuOA0qlcJLdeS3sShi0ETrCZk8FOTwW3RTHbduQUIfc83
	EcxQlpdh+2SDSt3EWDK/G1983yOPo7V7MQo9/1sY=
Date: Wed, 23 Oct 2019 17:52:53 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 2/7] iommu/mediatek: Add a new tlb_lock for tlb_flush
Message-ID: <20191023165252.GA27471@willie-the-truck>
References: <1571196792-12382-1-git-send-email-yong.wu@mediatek.com>
	<1571196792-12382-3-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571196792-12382-3-git-send-email-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	edison.hsieh@mediatek.com, Will Deacon <will.deacon@arm.com>,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Oct 16, 2019 at 11:33:07AM +0800, Yong Wu wrote:
> The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
> TLB sync") help move the tlb_sync of unmap from v7s into the iommu
> framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
> lacked the lock, then it will cause the variable "tlb_flush_active"
> may be changed unexpectedly, we could see this warning log randomly:
> 
> mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
> full flush
> 
> The HW requires tlb_flush/tlb_sync in pairs strictly, this patch adds
> a new tlb_lock for tlb operations to fix this issue.
> 
> Fixes: 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API TLB
> sync")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 23 ++++++++++++++++++++++-
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 23 insertions(+), 1 deletion(-)

[...]

>  static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
>  					    unsigned long iova, size_t granule,
>  					    void *cookie)
>  {
> +	struct mtk_iommu_data *data = cookie;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&data->tlb_lock, flags);
>  	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
> +	spin_unlock_irqrestore(&data->tlb_lock, flags);

Given that you release the lock here, what prevents another nosync()
operation being issued before you've managed to do the sync()?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
