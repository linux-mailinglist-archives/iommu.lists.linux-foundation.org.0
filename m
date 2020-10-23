Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B1035296D80
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 13:22:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 685FA86805;
	Fri, 23 Oct 2020 11:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2UuHKL6A50d; Fri, 23 Oct 2020 11:21:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2BD5867FF;
	Fri, 23 Oct 2020 11:21:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D112BC0051;
	Fri, 23 Oct 2020 11:21:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E8BAC0051
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C87187285
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ht4xr-UuEL8l for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 11:21:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA7F386F13
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:21:56 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2AAC207BB;
 Fri, 23 Oct 2020 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603452116;
 bh=Q6EJmyqOf5tfjZLlhH9Oj+yDC1RmgGtXR6z9A920tEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yb+qgd3fCLrqV+aHUHGJYDg7C+r0yjseSv5PVATRi+wMwUB+1hSavsi7MbzibCDq5
 tPJJRtCDQITBgw8ZrYT3Ci85G2m8k3Mf8golIIWK1mnoHp9BLfgHYgzO1PWCkYj49/
 WwBTs0VMggQ92LKsSkWQ9nivsF8U3CeHVgZQ/EQ8=
Date: Fri, 23 Oct 2020 12:21:49 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for
 MediaTek
Message-ID: <20201023112148.GB20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-12-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-12-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Sep 30, 2020 at 03:06:34PM +0800, Yong Wu wrote:
> The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
> (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
> 34bit.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
>  drivers/iommu/mtk_iommu.c          |  2 +-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 8362fdf76657..306bae2755ed 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -50,10 +50,17 @@
>   */
>  #define ARM_V7S_ADDR_BITS		32

If we rename this to _ARM_V7S_ADDR_BITS can we then have ARM_V7S_ADDR_BITS
take a cfg parameter and move the arm_v7s_is_mtk_enabled() check in there?
Same for _ARM_V7S_LVL_BITS.

That would avoid scattering arm_v7s_is_mtk_enabled() into all the users.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
