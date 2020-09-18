Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD526F8CA
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:59:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F33B3872CA;
	Fri, 18 Sep 2020 08:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_7u9MDxDzgX; Fri, 18 Sep 2020 08:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C62A87285;
	Fri, 18 Sep 2020 08:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7997EC0051;
	Fri, 18 Sep 2020 08:59:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48E0FC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E669874B6
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaDxCrk5wuG5 for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 89BC786D95
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:59:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C2B2D396; Fri, 18 Sep 2020 10:59:23 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:59:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [PATCH] iommu: fsl_pamu: Replace use of kzfree with
 kfree_sensitive
Message-ID: <20200918085922.GK31590@8bytes.org>
References: <20200911135325.66156-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135325.66156-1-alex.dewar90@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 11, 2020 at 02:53:25PM +0100, Alex Dewar wrote:
> kzfree() is effectively deprecated as of commit 453431a54934 ("mm,
> treewide: rename kzfree() to kfree_sensitive()") and is now simply an
> alias for kfree_sensitive(). So just replace it with kfree_sensitive().
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  drivers/iommu/fsl_pamu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
