Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5B2298E6
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 15:03:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BEF4864F2;
	Wed, 22 Jul 2020 13:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gxi4c5q86Mhs; Wed, 22 Jul 2020 13:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C7E3886190;
	Wed, 22 Jul 2020 13:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA86BC0051;
	Wed, 22 Jul 2020 13:03:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FFACC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 497D186190
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUpycFFfLYGQ for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 13:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 218E186166
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:03:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D81502C8; Wed, 22 Jul 2020 15:03:08 +0200 (CEST)
Date: Wed, 22 Jul 2020 15:03:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] OMAP: iommu: check for failure of a call to
 omap_iommu_dump_ctx
Message-ID: <20200722130307.GC27672@8bytes.org>
References: <20200714192211.744776-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714192211.744776-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Tony Lindgren <tony@atomide.com>, kernel-janitors@vger.kernel.org,
 iommu@lists.linux-foundation.org, Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
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

On Tue, Jul 14, 2020 at 08:22:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It is possible for the call to omap_iommu_dump_ctx to return
> a negative error number, so check for the failure and return
> the error number rather than pass the negative value to
> simple_read_from_buffer.
> 
> Addresses-Coverity: ("Improper use of negative value")
> Fixes: 14e0e6796a0d ("OMAP: iommu: add initial debugfs support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/omap-iommu-debug.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
