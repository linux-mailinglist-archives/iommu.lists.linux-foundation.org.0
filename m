Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7297EA1
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 17:25:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF346EE5;
	Wed, 21 Aug 2019 15:25:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C547ED2
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:25:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 507FEE6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:25:34 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0307C206BA;
	Wed, 21 Aug 2019 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566401134;
	bh=Z133FCcaUexJ59kOIXUWJUTamhLJKJ6ldqxj9NWa3tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUDPg5D2HGetVoKEHsW8DXI3N8IRAZgH4Tai4x88ildrlJztU+xVCdx4+3RGx2O2c
	N5xYByPeiRxepUcdRhHOkougwAECZWjBWIx9W0p1/W0+2p3czw/xCZjOZAh7KO7B+o
	cfMKfQyFaTQVwpV34sGMhCCZ2nWA2Elrqu5sjzPE=
Date: Wed, 21 Aug 2019 16:25:28 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v10 07/23] iommu/io-pgtable-arm-v7s: Use ias/oas to check
	the valid iova/pa
Message-ID: <20190821152527.6rkgf4g5wgsc7fyq@willie-the-truck>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
	<1566395606-7975-8-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566395606-7975-8-git-send-email-yong.wu@mediatek.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
	Robin Murphy <robin.murphy@arm.com>, Matthias Kaehlcke <mka@chromium.org>,
	linux-arm-kernel@lists.infradead.org
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

On Wed, Aug 21, 2019 at 09:53:10PM +0800, Yong Wu wrote:
> Use ias/oas to check the valid iova/pa. Synchronize this checking with
> io-pgtable-arm.c.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 72f1880..fa1b38f 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -504,7 +504,8 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
>  		return 0;
>  
> -	if (WARN_ON(upper_32_bits(iova) || upper_32_bits(paddr)))
> +	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> +		    paddr >= (1ULL << data->iop.cfg.oas)))
>  		return -ERANGE;

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
