Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 516473497AF
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:16:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2F384A52;
	Thu, 25 Mar 2021 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLCiVPXP6U-H; Thu, 25 Mar 2021 17:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1710F84A51;
	Thu, 25 Mar 2021 17:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2EACC0012;
	Thu, 25 Mar 2021 17:16:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82384C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C7F401DA
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btix-v3dr14T for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:16:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 297DE401D8
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:16:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0483561A16;
 Thu, 25 Mar 2021 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616692580;
 bh=phmny67lf++X1rkQVwR6baI2+MCDEs3wLD7iAm3xsOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8VU9MDHPFOdaovt8n/9YdPSCpUyUpJaxNyRawPd3nCxPu/Vk7czI8/ZJWaoeeuTf
 2R7t9YGqqT/43VsL64M8tIUa4sP8SqicY5T75O78nf6c9waYFoto0mjNPEw3OJZS40
 eFElJ8FxMP5Cc2QPIYS1oEnsKLetLwI5kqj58e/Dcpq010+0kokWUrmdQxxi27C1l4
 0yboQp8QEF6PNrPe4ufEMHy19PVfjXOFF2pLq0Q6egatY2jaDG+COxaggbchnJh0mx
 zCuXAfWT4A5r5anmO/0tHnwfW7ulOWdETLsGuZmLoWMKzLg8Yn/UfHrjcj2SMRApos
 XxOBd/1Q+3mJQ==
Date: Thu, 25 Mar 2021 17:16:14 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Alloc building as module
Message-ID: <20210325171614.GA15433@willie-the-truck>
References: <20210323055801.16885-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323055801.16885-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@chromium.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Tue, Mar 23, 2021 at 01:58:00PM +0800, Yong Wu wrote:
> This patch only adds support for building the IOMMU-v1 driver as module.
> Correspondingly switch the config to tristate.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> rebase on v5.12-rc2.
> ---
>  drivers/iommu/Kconfig        | 2 +-
>  drivers/iommu/mtk_iommu_v1.c | 9 ++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)

Both of these patches look fine to me, but you probably need to check
the setting of MODULE_OWNER after:

https://lore.kernel.org/r/f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
