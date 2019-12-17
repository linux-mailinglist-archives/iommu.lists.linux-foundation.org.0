Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C410912286A
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 11:12:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 50DCB85DEC;
	Tue, 17 Dec 2019 10:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wE8VIurpQsns; Tue, 17 Dec 2019 10:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E695785D54;
	Tue, 17 Dec 2019 10:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9D45C1D84;
	Tue, 17 Dec 2019 10:12:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64A06C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5B76C87216
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K81xTRkEfGgm for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 10:12:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6150870A9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:12:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 00D53286; Tue, 17 Dec 2019 11:12:41 +0100 (CET)
Date: Tue, 17 Dec 2019 11:12:40 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/dma: Relax locking in iommu_dma_prepare_msi()
Message-ID: <20191217101240.GJ8689@8bytes.org>
References: <6fe5ef45ebfa613d098c1b7f59f6599dabd589c7.1575920766.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fe5ef45ebfa613d098c1b7f59f6599dabd589c7.1575920766.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org
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

On Mon, Dec 09, 2019 at 07:47:25PM +0000, Robin Murphy wrote:
> Since commit ece6e6f0218b ("iommu/dma-iommu: Split iommu_dma_map_msi_msg()
> in two parts"), iommu_dma_prepare_msi() should no longer have to worry
> about preempting itself, nor being called in atomic context at all. Thus
> we can downgrade the IRQ-safe locking to a simple mutex to avoid angering
> the new might_sleep() check in iommu_map().
> 
> Reported-by: Qian Cai <cai@lca.pw>
> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: Clarify comments a bit
> 
>  drivers/iommu/dma-iommu.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
