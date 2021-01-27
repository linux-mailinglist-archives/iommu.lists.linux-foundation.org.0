Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DB305A15
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 12:42:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 05ECC84FB9;
	Wed, 27 Jan 2021 11:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSv9UwNY2X9D; Wed, 27 Jan 2021 11:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82A0B844D4;
	Wed, 27 Jan 2021 11:42:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F503C08A1;
	Wed, 27 Jan 2021 11:42:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A97C4C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A179784E8C
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1yfjuPYSS3I for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 11:42:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 36D23844D4
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:42:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C358F303; Wed, 27 Jan 2021 12:42:10 +0100 (CET)
Date: Wed, 27 Jan 2021 12:42:09 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] iommu: amd: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <20210127114209.GD32671@8bytes.org>
References: <20201228135112.28621-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228135112.28621-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org
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

On Mon, Dec 28, 2020 at 09:51:12PM +0800, Zheng Yongjun wrote:
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/iommu/amd/iommu_v2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
