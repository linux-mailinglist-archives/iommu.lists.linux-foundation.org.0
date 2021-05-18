Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E63874C4
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:08:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11F7608E6;
	Tue, 18 May 2021 09:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwelceIO5i-q; Tue, 18 May 2021 09:08:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D92F607F9;
	Tue, 18 May 2021 09:08:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D47D6C001C;
	Tue, 18 May 2021 09:08:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C919CC0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABAEE40282
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVyKYi3ldhiM for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 09:08:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8638740283
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:08:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A60682FA; Tue, 18 May 2021 11:08:47 +0200 (CEST)
Date: Tue, 18 May 2021 11:08:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: chenxiang <chenxiang66@hisilicon.com>
Subject: Re: [PATCH v3] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
Message-ID: <YKOEHh5CECej06ah@8bytes.org>
References: <1618816415-95649-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618816415-95649-1-git-send-email-chenxiang66@hisilicon.com>
Cc: will@kernel.org, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org, linuxarm@huawei.com
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

On Mon, Apr 19, 2021 at 03:13:35PM +0800, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> It is not necessary to put free_iova_mem() inside of spinlock/unlock
> iova_rbtree_lock which only leads to more completion for the spinlock.
> It has a small promote on the performance after the change. And also
> rename private_free_iova() as remove_iova() because the function will not
> free iova after that change.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  drivers/iommu/iova.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Looks good to me, but I'll wait for Robins opinion before applying.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
