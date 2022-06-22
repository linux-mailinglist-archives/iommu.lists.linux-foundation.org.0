Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A29554BA5
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 15:46:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81C960B0D;
	Wed, 22 Jun 2022 13:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81C960B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M253YHf-hB6o; Wed, 22 Jun 2022 13:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 10C7860A69;
	Wed, 22 Jun 2022 13:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C7860A69
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAE8EC0081;
	Wed, 22 Jun 2022 13:46:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 644B7C002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F59482A7F
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F59482A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JnI1ENTb3nB for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 13:46:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A94208274E
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A94208274E
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:46:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CDCE72D0; Wed, 22 Jun 2022 15:46:22 +0200 (CEST)
Date: Wed, 22 Jun 2022 15:46:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Fix compatible for rcar-gen4
Message-ID: <YrMdLeEL3EQ/+4bP@8bytes.org>
References: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
 will@kernel.org
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

On Fri, Jun 17, 2022 at 10:01:07AM +0900, Yoshihiro Shimoda wrote:
> Fix compatible string for R-Car Gen4.
> 
> Fixes: ae684caf465b ("iommu/ipmmu-vmsa: Add support for R-Car Gen4")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for 5.19, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
