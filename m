Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF961D7A33
	for <lists.iommu@lfdr.de>; Mon, 18 May 2020 15:40:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5DAF21505;
	Mon, 18 May 2020 13:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-JfgXozL00z; Mon, 18 May 2020 13:40:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3BFBA2154F;
	Mon, 18 May 2020 13:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1791BC0894;
	Mon, 18 May 2020 13:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 714AEC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6A847871E0
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIDlE8WCR876 for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 13:40:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F281385D5F
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:40:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D91A7386; Mon, 18 May 2020 15:40:02 +0200 (CEST)
Date: Mon, 18 May 2020 15:40:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] iommu/omap: Add registration for DT fwnode pointer
Message-ID: <20200518134001.GC18353@8bytes.org>
References: <20200424145828.3159-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424145828.3159-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Fri, Apr 24, 2020 at 05:58:28PM +0300, Tero Kristo wrote:
> The fwnode pointer must be passed to the iommu core, so that the core
> can map the IOMMU towards device requests properly. Without this, some
> IOMMU clients like OMAP remoteproc will fail the iommu configuration
> multiple times with -EPROBE_DEFER, which will eventually be ignored with
> a kernel warning banner.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/iommu/omap-iommu.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
