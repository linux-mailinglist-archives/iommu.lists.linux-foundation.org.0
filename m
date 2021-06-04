Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6239BBCD
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:26:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D484068A;
	Fri,  4 Jun 2021 15:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pn2kQ1F_tiOK; Fri,  4 Jun 2021 15:26:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33314159C;
	Fri,  4 Jun 2021 15:26:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76B1EC001C;
	Fri,  4 Jun 2021 15:26:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F8B9C0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E325606F5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zhHZts97dh4 for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:26:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4D9460689
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:26:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 687BC3A9; Fri,  4 Jun 2021 17:26:24 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:26:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/amd: Tidy up DMA ops init
Message-ID: <YLpGHx+rYnBF64Yh@8bytes.org>
References: <665db61e23ff8d54ac5eb391bef520b3a803fcb9.1622727974.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <665db61e23ff8d54ac5eb391bef520b3a803fcb9.1622727974.git.robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jussi Maki <joamaki@gmail.com>
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

On Thu, Jun 03, 2021 at 02:48:21PM +0100, Robin Murphy wrote:
> As discussed on the report thread, I think it makes most sense to merge
> this as a fix for 5.13 and not worry about any backporting.
> 
>  drivers/iommu/amd/amd_iommu.h |  2 --
>  drivers/iommu/amd/init.c      |  5 -----
>  drivers/iommu/amd/iommu.c     | 31 +++++++++++++------------------
>  3 files changed, 13 insertions(+), 25 deletions(-)

Applied for v5.13, thanks Robin et al for the quick work on this
regression.

Robin, do you by chance have a Fixes tag which I can add?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
