Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B718D66E
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 16:42:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A720EF5;
	Wed, 14 Aug 2019 14:41:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF861E91
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:41:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E013287E
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:41:06 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8C5A12084F;
	Wed, 14 Aug 2019 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565793666;
	bh=jqAmDB/DdtSMeWfimuoJggpnAk0RJ3WaU75jDeIn5oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNsmFWWNEtepwSspPVPQj7tCrKE+6ilVhN23rjhA7f8T2B2i69Zs85I3qpC/pDSEY
	rqWqwiQfS1y9E4hWMQdJM/K+pyYE6AQ9CMK9ek75MNFaUo5/+LkNcKP4ySo17uqG16
	tpBkanURK0WmMPwYRrDuqri3s8x6EsmrAO4LX/AQ=
Date: Wed, 14 Aug 2019 15:41:00 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v9 08/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
	Mode
Message-ID: <20190814144059.ruyc45yoqkwpbuga@willie-the-truck>
References: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
	<1565423901-17008-9-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565423901-17008-9-git-send-email-yong.wu@mediatek.com>
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

Hi Yong Wu,

Sorry, but I'm still deeply confused by this patch.

On Sat, Aug 10, 2019 at 03:58:08PM +0800, Yong Wu wrote:
> MediaTek extend the arm v7s descriptor to support the dram over 4GB.
> 
> In the mt2712 and mt8173, it's called "4GB mode", the physical address
> is from 0x4000_0000 to 0x1_3fff_ffff, but from EMI point of view, it
> is remapped to high address from 0x1_0000_0000 to 0x1_ffff_ffff, the
> bit32 is always enabled. thus, in the M4U, we always enable the bit9
> for all PTEs which means to enable bit32 of physical address. Here is
> the detailed remap relationship in the "4GB mode":
> CPU PA         ->    HW PA
> 0x4000_0000          0x1_4000_0000 (Add bit32)
> 0x8000_0000          0x1_8000_0000 ...
> 0xc000_0000          0x1_c000_0000 ...
> 0x1_0000_0000        0x1_0000_0000 (No change)

So in this example, there are no PAs below 0x4000_0000 yet you later
add code to deal with that:

> +	/* Workaround for MTK 4GB Mode: Add BIT32 only when PA < 0x4000_0000.*/
> +	if (cfg->oas == ARM_V7S_MTK_4GB_OAS && paddr < 0x40000000UL)
> +		paddr |= BIT_ULL(32);

Why? Mainline currently doesn't do anything like this for the "4gb mode"
support as far as I can tell. In fact, we currently unconditionally set
bit 32 in the physical address returned by iova_to_phys() which wouldn't
match your CPU PAs listed above, so I'm confused about how this is supposed
to work.

The way I would like this quirk to work is that the io-pgtable code
basically sets bit 9 in the pte when bit 32 is set in the physical address,
and sets bit 4 in the pte when bit 33 is set in the physical address. It
would then do the opposite when converting a pte to a physical address.

That way, your driver can call the page table code directly with the high
addresses and we don't have to do any manual offsetting or range checking
in the page table code.

Please can you explain to me why the diff below doesn't work on top of
this series? I'm happy to chat on IRC if you think it would be easier,
because I have a horrible feeling that we've been talking past each other
and I'd like to see this support merged for 5.4.

Will

--->8

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index ab12ef5f8b03..d8d84617c822 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -184,7 +184,7 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
 
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
-		if ((paddr & BIT_ULL(32)) || cfg->oas == ARM_V7S_MTK_4GB_OAS)
+		if (paddr & BIT_ULL(32))
 			pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
 		if (paddr & BIT_ULL(33))
 			pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
@@ -206,17 +206,14 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 		mask = ARM_V7S_LVL_MASK(lvl);
 
 	paddr = pte & mask;
-	if (cfg->oas == 32 || !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT))
-		return paddr;
 
-	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
-		paddr |= BIT_ULL(33);
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
+		if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
+			paddr |= BIT_ULL(32);
+		if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
+			paddr |= BIT_ULL(33);
+	}
 
-	/* Workaround for MTK 4GB Mode: Add BIT32 only when PA < 0x4000_0000.*/
-	if (cfg->oas == ARM_V7S_MTK_4GB_OAS && paddr < 0x40000000UL)
-		paddr |= BIT_ULL(32);
-	else if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
-		paddr |= BIT_ULL(32);
 	return paddr;
 }
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d5b9454352fd..3ae54dedede0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -286,7 +286,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
 		dom->cfg.oas = 32;
 	else if (data->enable_4GB)
-		dom->cfg.oas = ARM_V7S_MTK_4GB_OAS;
+		dom->cfg.oas = 33;
 	else
 		dom->cfg.oas = 34;
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 27337395bd42..a2a52c349fe4 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -113,8 +113,6 @@ struct io_pgtable_cfg {
 	};
 };
 
-#define ARM_V7S_MTK_4GB_OAS			33
-
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
