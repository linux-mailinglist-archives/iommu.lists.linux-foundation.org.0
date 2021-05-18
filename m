Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F953874FA
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:23:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9826783EDB;
	Tue, 18 May 2021 09:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRdjN7xuJBwT; Tue, 18 May 2021 09:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE5D83EF6;
	Tue, 18 May 2021 09:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80F64C0001;
	Tue, 18 May 2021 09:23:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B49CC0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D0E605E5
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzzf9DyRJkHl for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 09:23:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE2B60682
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:23:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C6AE02FA; Tue, 18 May 2021 11:23:38 +0200 (CEST)
Date: Tue, 18 May 2021 11:23:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH 1/4] iommu/amd: Fix wrong parentheses on page-specific
 invalidations
Message-ID: <YKOHmQcqW0bX59nV@8bytes.org>
References: <20210502070001.1559127-1-namit@vmware.com>
 <20210502070001.1559127-2-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210502070001.1559127-2-namit@vmware.com>
Cc: Nadav Amit <namit@vmware.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Jiajun Cao <caojiajun@vmware.com>,
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

On Sat, May 01, 2021 at 11:59:56PM -0700, Nadav Amit wrote:
> From: Nadav Amit <namit@vmware.com>
> 
> The logic to determine the mask of page-specific invalidations was
> tested in userspace. As the code was copied into the kernel, the
> parentheses were mistakenly set in the wrong place, resulting in the
> wrong mask.
> 
> Fix it.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: 268aa4548277 ("iommu/amd: Page-specific invalidations for more than one page")
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>  drivers/iommu/amd/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied this one for v5.13, thanks Nadav.

Somehow the rest of the patch-set got screwed up during sending or so,
at least I see some patches twice in my inbox and with different
subjects.

Can you please re-send patches 2-4 when -rc3 it out?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
