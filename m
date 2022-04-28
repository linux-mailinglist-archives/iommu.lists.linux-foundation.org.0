Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3620B512F5C
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 11:15:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDF183187;
	Thu, 28 Apr 2022 09:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVppu8e4MkLV; Thu, 28 Apr 2022 09:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 94EC783131;
	Thu, 28 Apr 2022 09:15:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD6C1C008B;
	Thu, 28 Apr 2022 09:15:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76E94C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F7740227
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bp4xDOLplOYs for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 09:15:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A5D400C1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:15:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AF19A2FB; Thu, 28 Apr 2022 11:15:09 +0200 (CEST)
Date: Thu, 28 Apr 2022 11:15:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH] MAINTAINERS: merge DART into ARM/APPLE MACHINE
Message-ID: <YmpbHJc66KURJ3+k@8bytes.org>
References: <20220412161211.23162-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412161211.23162-1-sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Apr 12, 2022 at 06:12:11PM +0200, Sven Peter wrote:
> It's the same people anyway.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  MAINTAINERS | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
