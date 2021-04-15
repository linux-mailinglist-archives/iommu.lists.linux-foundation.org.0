Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500C360AFB
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 15:48:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF53740E5E;
	Thu, 15 Apr 2021 13:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tietAkVCj60I; Thu, 15 Apr 2021 13:48:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD4A40EE5;
	Thu, 15 Apr 2021 13:48:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C07BC000A;
	Thu, 15 Apr 2021 13:48:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADB7BC000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A11E40E9C
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t08a-wDeoD9F for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 13:48:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ED5840E5E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:48:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6A328387; Thu, 15 Apr 2021 15:48:40 +0200 (CEST)
Date: Thu, 15 Apr 2021 15:48:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Avoid build fail when build as
 module
Message-ID: <YHhENs5Jh5h0Pz+r@8bytes.org>
References: <20210412064843.11614-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412064843.11614-1-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Mon, Apr 12, 2021 at 02:48:42PM +0800, Yong Wu wrote:
> When this driver build as module, It build fail like:
> 
> ERROR: modpost: "of_phandle_iterator_args"
> [drivers/iommu/mtk_iommu_v1.ko] undefined!
> 
> This patch remove this interface to avoid this build fail.
> 
> Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Currently below patch is only in linux-next-20210409. This fixes tag may be
> not needed. we can add this if it is need.
> Fixes: 8de000cf0265 ("iommu/mediatek-v1: Allow building as module")
> ---
>  drivers/iommu/mtk_iommu_v1.c | 62 ++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 34 deletions(-)

Applied both, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
