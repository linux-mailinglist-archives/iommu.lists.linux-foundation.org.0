Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1123512F81
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 11:39:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E80383267;
	Thu, 28 Apr 2022 09:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jr0-5lQ4dMe; Thu, 28 Apr 2022 09:39:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D781783380;
	Thu, 28 Apr 2022 09:39:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD5B1C0081;
	Thu, 28 Apr 2022 09:39:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAA49C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E08409DA
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsYRZb1IgrHt for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 09:39:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2046F40894
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:39:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 46ED12FB; Thu, 28 Apr 2022 11:39:04 +0200 (CEST)
Date: Thu, 28 Apr 2022 11:39:03 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] iommu/dart: check return value after calling
 platform_get_resource()
Message-ID: <Ympgt+2G8fXD1w5H@8bytes.org>
References: <20220425090826.2532165-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425090826.2532165-1-yangyingliang@huawei.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, alyssa@rosenzweig.io
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

On Mon, Apr 25, 2022 at 05:08:26PM +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref in resource_size(), if platform_get_resource()
> returns NULL, move calling resource_size() after devm_ioremap_resource() that
> will check 'res' to avoid null-ptr-deref.
> And use devm_platform_get_and_ioremap_resource() to simplify code.
> 
> Fixes: 46d1fb072e76 ("iommu/dart: Add DART iommu driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/iommu/apple-dart.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied to iommu/fixes, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
