Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A420F209
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:00:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E5AC2262F;
	Tue, 30 Jun 2020 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNGJZ-1v-Wdc; Tue, 30 Jun 2020 10:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 296CE20385;
	Tue, 30 Jun 2020 10:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17EB1C08A0;
	Tue, 30 Jun 2020 10:00:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEB81C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A392D88522
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSuaIazPPo-j for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:00:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2BFB288516
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:00:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7BBA42A7; Tue, 30 Jun 2020 12:00:15 +0200 (CEST)
Date: Tue, 30 Jun 2020 12:00:14 +0200
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: Re: [PATCH 00/13] iommu: Remove usage of dev->archdata.iommu
Message-ID: <20200630100013.GJ28824@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>
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

On Thu, Jun 25, 2020 at 03:08:23PM +0200, Joerg Roedel wrote:
> Joerg Roedel (13):
>   iommu/exynos: Use dev_iommu_priv_get/set()
>   iommu/vt-d: Use dev_iommu_priv_get/set()
>   iommu/msm: Use dev_iommu_priv_get/set()
>   iommu/omap: Use dev_iommu_priv_get/set()
>   iommu/rockchip: Use dev_iommu_priv_get/set()
>   iommu/tegra: Use dev_iommu_priv_get/set()
>   iommu/pamu: Use dev_iommu_priv_get/set()
>   iommu/mediatek: Do no use dev->archdata.iommu
>   x86: Remove dev->archdata.iommu pointer
>   ia64: Remove dev->archdata.iommu pointer
>   arm: Remove dev->archdata.iommu pointer
>   arm64: Remove dev->archdata.iommu pointer
>   powerpc/dma: Remove dev->archdata.iommu_domain

Applied.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
