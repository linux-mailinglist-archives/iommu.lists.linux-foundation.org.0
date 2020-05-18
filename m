Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F31D7A0F
	for <lists.iommu@lfdr.de>; Mon, 18 May 2020 15:36:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C824485DEC;
	Mon, 18 May 2020 13:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmrLeGrcsPCc; Mon, 18 May 2020 13:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6118585DC0;
	Mon, 18 May 2020 13:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4093BC07FF;
	Mon, 18 May 2020 13:36:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBDBAC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA4A785D11
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwCO-_r5UgpO for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 13:36:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA2AF85C7A
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:36:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C0D6B386; Mon, 18 May 2020 15:36:26 +0200 (CEST)
Date: Mon, 18 May 2020 15:36:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH -next] iommu/omap: Add check for iommu group when no
 IOMMU in use
Message-ID: <20200518133622.GA18353@8bytes.org>
References: <20200518111057.23140-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518111057.23140-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, tomi.valkeinen@ti.com
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

Hi Tero,

On Mon, May 18, 2020 at 02:10:57PM +0300, Tero Kristo wrote:
> Most of the devices in OMAP family of SoCs are not using IOMMU. The
> patch for converting the OMAP IOMMU to use generic IOMMU bus probe
> functionality failed to add a check for this, so add it here.
> 
> Fixes: c822b37cac48 ("iommu/omap: Remove orphan_dev tracking")
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> Hi Joerg,
> 
> This patch applies on top of linux-next, fixing an issue present there
> at the moment.
> 
> -Tero
> 
> 
>  drivers/iommu/omap-iommu.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
