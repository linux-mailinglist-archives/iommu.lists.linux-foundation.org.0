Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4D341AC0F
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 11:39:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B668401F7;
	Tue, 28 Sep 2021 09:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5pvOzTY9Bmz; Tue, 28 Sep 2021 09:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3F2AE401A0;
	Tue, 28 Sep 2021 09:39:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1032CC0022;
	Tue, 28 Sep 2021 09:39:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 526B2C000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF9480F34
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3Hzok9v8zpq for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 09:38:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3CDD80F2A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:38:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F33BA2FF; Tue, 28 Sep 2021 11:38:55 +0200 (CEST)
Date: Tue, 28 Sep 2021 11:38:54 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH] iommu/dart: Remove iommu_flush_ops
Message-ID: <YVLirjjXIJFqEm3m@8bytes.org>
References: <20210921153934.35647-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921153934.35647-1-sven@svenpeter.dev>
Cc: Marc Zyngier <maz@kernel.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Sep 21, 2021 at 05:39:34PM +0200, Sven Peter wrote:
 
> Fixes: 46d1fb072e76b161 ("iommu/dart: Add DART iommu driver")
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/iommu/apple-dart.c | 18 ------------------
>  1 file changed, 18 deletions(-)

Applied for v5.15, thanks Sven.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
