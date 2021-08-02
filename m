Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C45963DD48E
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 13:20:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D01A403C3;
	Mon,  2 Aug 2021 11:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LB-eWI4b3BzI; Mon,  2 Aug 2021 11:20:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F2BB5403B9;
	Mon,  2 Aug 2021 11:20:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8F60C000E;
	Mon,  2 Aug 2021 11:20:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13647C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FE654034E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ellerman.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auWYD5uIsLXN for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 11:20:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757734034D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:20:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdbCN2p71z9s1l;
 Mon,  2 Aug 2021 21:20:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627903233;
 bh=Ph52ycwEVB+Kr83e5k5zzEwv6lbCoXALW4ekLWI3mvY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OyD8Aq4AaqIcoMdaKfnwOqsE8epJkeGEPf9zJ0mxrHVywJVEKvSUZj+8YoIcH1VE0
 honyNi+z9ReapyZ4mk0fGsa4f3+TDmmba0/ty3GP7pNlm6LYVIBMCjhfutrxOxHu8U
 sXMxTIGfAExBHy4IhWp21JGrCbgJ+3wenHoU1iroNBQ5voTWW6vLvDn8IZF88BqEG1
 /H9zBHykLP4zxKizoJFitgHSqjAZTrCPkT/GNtGZIKgGPYlDfFDLg73RL/C+wl4gcp
 xLa/w0jrpy0Nr/i4gK3JpxGP4X4LK3JHpDAQ4j1a8uYsQjEqJM8BSwqNCeKElZLAQp
 CCvt/6/jf5VKA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] powerpc/svm: Don't issue ultracalls if
 !mem_encrypt_active()
In-Reply-To: <20210730114231.23445-1-will@kernel.org>
References: <20210730114231.23445-1-will@kernel.org>
Date: Mon, 02 Aug 2021 21:20:30 +1000
Message-ID: <871r7cks8x.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, iommu@lists.linux-foundation.org,
 Claire Chang <tientzu@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Will Deacon <will@kernel.org> writes:
> Commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> introduced a set_memory_encrypted() call to swiotlb_exit() so that the
> buffer pages are returned to an encrypted state prior to being freed.
>
> Sachin reports that this leads to the following crash on a Power server:
>
> [    0.010799] software IO TLB: tearing down default memory pool
> [    0.010805] ------------[ cut here ]------------
> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>
> Nick spotted that this is because set_memory_encrypted() is issuing an
> ultracall which doesn't exist for the processor, and should therefore
> be gated by mem_encrypt_active() to mirror the x86 implementation.
>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Claire Chang <tientzu@chromium.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Fixes: ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com/
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/powerpc/platforms/pseries/svm.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


I assume Konrad will take this via the swiotlb tree?

cheers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
