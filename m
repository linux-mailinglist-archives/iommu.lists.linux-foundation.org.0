Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC039F297
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 11:38:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88D1540299;
	Tue,  8 Jun 2021 09:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POn9cISdifsq; Tue,  8 Jun 2021 09:38:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE9340291;
	Tue,  8 Jun 2021 09:38:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D41FC0011;
	Tue,  8 Jun 2021 09:38:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46B75C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27132402C4
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn10XpGL2TBr for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 824C1402C2
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:38:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD13861246;
 Tue,  8 Jun 2021 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623145130;
 bh=vxDRlETdFI2PxULKoexaolR76e6sEkGi4SwEVNAONko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3vtJ+jhevpN9HMr0yO5HHI84E7BaAUQhqF0Is8p+TOQLEKDl1floYBhTkmAvtQM+
 ZdeXq1S9f6rO205DS6HunWGzB47PxBEoRKTuQirizr0lOj7HODwIlDrCXB8+BFfK/2
 Ra/9/vghohxzMzsnYoPcnmX2/q7Ed+iyeaK2ayM04oSLmiP9kj9ebRdfqgY+rabkfX
 qxT83QpM5F0jxJHzd2CF8aJbWdBXFAZcfOAVDU/cjNcKG9CsjJZk8KHCq1EwBIN+m+
 Hg28jb+pCFoeaWpwhkGlf7WqIQpcs/1fQDvkjDwh6+Ltr3tRM2v8EKhAJYaRXWakHJ
 fn39WWUD+sXvA==
Date: Tue, 8 Jun 2021 10:38:45 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
Message-ID: <20210608093845.GC8935@willie-the-truck>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
 <20210510035425.3212-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510035425.3212-2-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Robin Murphy <robin.murphy@arm.com>, iommu <iommu@lists.linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
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

On Mon, May 10, 2021 at 11:54:25AM +0800, Zhen Lei wrote:
> All spelling mistakes are in the comments, no functional change.

[...]

> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
>   * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
>   * bit32 of the CPU physical address always is needed to set, and for Region
>   * 'E', the CPU physical address keep as is.
> - * Additionally, The iommu consumers always use the CPU phyiscal address.
> + * Additionally, The iommu consumers always use the CPU physical address.

If we're fixing typos, then I think the 'T' in "The iommu" should be
lowercase here.

Anyway, all the other fixes look correct to me. I'll leave it up to Joerg as
to whether he wants to apply this or not, given the impact on git blame and
the potential for conflicts.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
