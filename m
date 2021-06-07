Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC139DD0D
	for <lists.iommu@lfdr.de>; Mon,  7 Jun 2021 14:56:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF57605CC;
	Mon,  7 Jun 2021 12:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flzJvl3e_9F3; Mon,  7 Jun 2021 12:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665D960626;
	Mon,  7 Jun 2021 12:55:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B408C0001;
	Mon,  7 Jun 2021 12:55:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19BFFC0001
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEB79605FA
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiNEhyfkxTbd for <iommu@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 12:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED9D605CC
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 12:55:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 66702391; Mon,  7 Jun 2021 14:55:48 +0200 (CEST)
Date: Mon, 7 Jun 2021 14:55:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/amd: Tidy up DMA ops init
Message-ID: <YL4XU/9GKXBQBiN8@8bytes.org>
References: <665db61e23ff8d54ac5eb391bef520b3a803fcb9.1622727974.git.robin.murphy@arm.com>
 <YLpGHx+rYnBF64Yh@8bytes.org>
 <781da5b3-4856-9a76-d803-51800dec6033@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <781da5b3-4856-9a76-d803-51800dec6033@arm.com>
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

On Fri, Jun 04, 2021 at 06:35:17PM +0100, Robin Murphy wrote:
> For the sake of justifying this as "fix" rather than "cleanup", you may as
> well use the flush queue commit cited in the patch log - I maintain there's
> nothing technically wrong with that commit itself, but it is the point at
> which the underlying issue becomes worth fixing due to how they interact ;)

Okay :) I added:

Fixes: a250c23f15c2 ("iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE")

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
