Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E16572C
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 14:41:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC3144ED3;
	Thu, 11 Jul 2019 12:41:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2559B4EC3
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 12:31:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AAC03DF
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 12:31:36 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F26FC20872;
	Thu, 11 Jul 2019 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562848296;
	bh=taKYFaL4w66TAwI7MPXQRwN1YVw6ACtaT/WEv3sNJm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8t08CD65eN+1vdURSKrXiClbKBzmqV8BxOEB+RYrcsXeEC7JGnv38XHWFNfuEhZe
	Fg3LNEGKB0Iy9Pmb7WmH+bzDCXLlNMZfPl3pfgJFwSxLmeRBm8cerDcIEVHkJX0JpZ
	TevDVShZM2RAlid5HYXefWAbG56bGpv9Y1KjKVJo=
Date: Thu, 11 Jul 2019 13:31:29 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v8 07/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
	Mode
Message-ID: <20190711123129.da4rg35b54u4svfw@willie-the-truck>
References: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
	<1561774167-24141-8-git-send-email-yong.wu@mediatek.com>
	<20190710143649.w5dplhzdpi3bxp7e@willie-the-truck>
	<1562846036.31342.10.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562846036.31342.10.camel@mhfsdcap03>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	yingjoe.chen@mediatek.com, anan.sun@mediatek.com,
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

On Thu, Jul 11, 2019 at 07:53:56PM +0800, Yong Wu wrote:
> On Wed, 2019-07-10 at 15:36 +0100, Will Deacon wrote:
> > On Sat, Jun 29, 2019 at 10:09:13AM +0800, Yong Wu wrote:
> > > MediaTek extend the arm v7s descriptor to support the dram over 4GB.
> > > 
> > > In the mt2712 and mt8173, it's called "4GB mode", the physical address
> > > is from 0x4000_0000 to 0x1_3fff_ffff, but from EMI point of view, it
> > > is remapped to high address from 0x1_0000_0000 to 0x1_ffff_ffff, the
> > > bit32 is always enabled. thus, in the M4U, we always enable the bit9
> > > for all PTEs which means to enable bit32 of physical address.
> > > 
> > > but in mt8183, M4U support the dram from 0x4000_0000 to 0x3_ffff_ffff
> > > which isn't remaped. We extend the PTEs: the bit9 represent bit32 of
> > > PA and the bit4 represent bit33 of PA. Meanwhile the iova still is
> > > 32bits.
> > 
> > What happens if bit4 is set in the pte for mt2712 or mt8173? Perhaps the
> 
> bit4 is ignored in mt2712 and mt8173(No effect).
> 
> > io-pgtable backend should be allowing oas > 32 when
> > IO_PGTABLE_QUIRK_ARM_MTK_4GB is set, and then enforcing that itself.
> 
> About oas, It looks the oas doesn't work in current the v7s. 
> 
> How about I add a new simple preparing patch like this(copy from
> io-pgtable-arm.c)?

This looks like the right sort of idea. Basically, I was thinking that you
can use the oas in conjunction with the quirk to specify whether or not
your two magic bits should be set. You could also then cap the oas using
the size of phys_addr_t to deal with my other comment.

Finally, I was hoping you could drop the |= BIT_ULL(32) and the &=
~BIT_ULL(32) bits of the mtk driver if the pgtable code now accepts higher
addresses. Did that not work out?
> 
> ==========================================
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -495,7 +495,8 @@ static int arm_v7s_map(struct io_pgtable_ops *ops,
> unsigned long iova,
>         if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
>                 return 0;
> 
> -       if (WARN_ON(upper_32_bits(iova) || upper_32_bits(paddr)))
> +       if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> +                   paddr >= (1ULL << data->iop.cfg.oas)))
>                 return -ERANGE;
> 
> ===============================================
> 
> Then, change the oas in MTK 4GB mode, like this:
> 
> ================================================
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -721,7 +721,9 @@ static struct io_pgtable
> *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  {
>         struct arm_v7s_io_pgtable *data;
> 
> -       if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas >
> ARM_V7S_ADDR_BITS)
> +       if (cfg->ias > ARM_V7S_ADDR_BITS ||
> +           (cfg->oas > ARM_V7S_ADDR_BITS &&
> +            !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_4GB)))

This should probably still be capped at 34 bits.

> > > +	paddr = pte & mask;
> > > +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_4GB) {
> > > +		if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
> > > +			paddr |= BIT_ULL(32);
> > > +		if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
> > > +			paddr |= BIT_ULL(33);
> > > +	}
> > > +	return paddr;
> > 
> > I think this relies on CONFIG_PHYS_ADDR_T_64BIT, which isn't always set on
> > 32-bit ARM.
> 
> This was discussed at [1]. Robin commented that this is not needed and
> build won't complain about this.

It's not so much the build I was worried about, but more that we'd silently
be doing the wrong thing and I think we can fix that as I mentioned above.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
