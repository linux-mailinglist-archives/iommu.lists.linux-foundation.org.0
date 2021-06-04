Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822E39BBF8
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:35:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B461660689;
	Fri,  4 Jun 2021 15:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWz6jRC1THXT; Fri,  4 Jun 2021 15:35:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E54F6084B;
	Fri,  4 Jun 2021 15:35:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 277B7C0001;
	Fri,  4 Jun 2021 15:35:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F027C0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE498431F
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vrrW8KJnp2C for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E1E82C9D
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:34:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 60D653A9; Fri,  4 Jun 2021 17:34:54 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:34:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: chenxiang <chenxiang66@hisilicon.com>
Subject: Re: [RESEND PATCH v3] iommu/iova: put free_iova_mem() outside of
 spinlock iova_rbtree_lock
Message-ID: <YLpIHfDS3atZsF5f@8bytes.org>
References: <1620647582-194621-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620647582-194621-1-git-send-email-chenxiang66@hisilicon.com>
Cc: robin.murphy@arm.com, linuxarm@openeuler.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, will@kernel.org
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

On Mon, May 10, 2021 at 07:53:02PM +0800, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> It is not necessary to put free_iova_mem() inside of spinlock/unlock
> iova_rbtree_lock which only leads to more completion for the spinlock.
> It has a small promote on the performance after the change. And also
> rename private_free_iova() as remove_iova() because the function will not
> free iova after that change.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> Reviewed-by: John Garry <john.garry@huawei.com>
> ---
>  drivers/iommu/iova.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
