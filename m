Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078D276C4F
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 10:48:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 932D9874E0;
	Thu, 24 Sep 2020 08:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGwOf1wSVYBp; Thu, 24 Sep 2020 08:48:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF78A874DB;
	Thu, 24 Sep 2020 08:48:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90D7BC0051;
	Thu, 24 Sep 2020 08:48:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BEA0C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5ECB9869BA
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tG+Dh1Pf5yK for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:48:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1330A86B52
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:48:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5200C295; Thu, 24 Sep 2020 10:48:50 +0200 (CEST)
Date: Thu, 24 Sep 2020 10:48:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] iommu/exynos: add missing put_device() call in
 exynos_iommu_of_xlate()
Message-ID: <20200924084848.GD27174@8bytes.org>
References: <CGME20200918011240eucas1p1e16e5b1b11a4ea6c078ffeceaf554966@eucas1p1.samsung.com>
 <20200918011335.909141-1-yukuai3@huawei.com>
 <9f5b25ee-3dad-1798-fe55-9c1af9cde513@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f5b25ee-3dad-1798-fe55-9c1af9cde513@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-samsung-soc@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 iommu@lists.linux-foundation.org, kgene@kernel.org,
 Yu Kuai <yukuai3@huawei.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 18, 2020 at 05:27:59PM +0200, Marek Szyprowski wrote:
> Hi
> 
> On 18.09.2020 03:13, Yu Kuai wrote:
> > if of_find_device_by_node() succeed, exynos_iommu_of_xlate() doesn't have
> > a corresponding put_device(). Thus add put_device() to fix the exception
> > handling for this function implementation.
> >
> > Fixes: aa759fd376fb ("iommu/exynos: Add callback for initializing devices from device tree")
> > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> 
> Thanks for the fix!
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied for v5.9, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
