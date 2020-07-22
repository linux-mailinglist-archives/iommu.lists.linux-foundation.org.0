Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 850532299DC
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 16:15:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 162012042C;
	Wed, 22 Jul 2020 14:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdWZ38PaEVfW; Wed, 22 Jul 2020 14:14:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30107203B8;
	Wed, 22 Jul 2020 14:14:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 169DDC004C;
	Wed, 22 Jul 2020 14:14:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51121C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3988E869C9
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5RCApv6aVSx for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 14:14:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F211869C0
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:14:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 204A0367; Wed, 22 Jul 2020 16:14:55 +0200 (CEST)
Date: Wed, 22 Jul 2020 16:14:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] iommu: Make some functions static
Message-ID: <20200722141453.GL27672@8bytes.org>
References: <20200713142542.50294-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713142542.50294-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hulk Robot <hulkci@huawei.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>
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

On Mon, Jul 13, 2020 at 10:25:42PM +0800, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/iommu/iommu.c:386:5: warning:
>  symbol 'iommu_insert_resv_region' was not declared. Should it be static?
> drivers/iommu/iommu.c:2182:5: warning:
>  symbol '__iommu_map' was not declared. Should it be static?
> 
> Those functions are not used outside of iommu.c, so mark them static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/iommu/iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
