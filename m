Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A956CD6E
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98BA240621;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98BA240621
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iDonQtnM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1-yU0CXXZkH; Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 91C094060D;
	Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91C094060D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBAE7C008F;
	Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AAD0C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25A5E844D8
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A5E844D8
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=iDonQtnM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q-i9ZsODFeK for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651B584184
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 651B584184
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:12:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DCCF6234F;
 Fri,  8 Jul 2022 10:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCDEC341D0;
 Fri,  8 Jul 2022 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657275170;
 bh=oaqt4HnoRw7yf321XrnAxjRV5AunqnYbzVvIMKbeJCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDonQtnMfMfwZppa5mYXEKsTPiiZTuNv4vA241F+/OInU3mQjtlvkKKDGuIlE2Ro7
 fFxzqHZzljynwbO3HyrjVLRb/nzJpV2jAkgzjZGa4/ShqnAMlBwKJmBXMMnb7x4BE0
 1/i5ZBoWtYNkHyaORLSwxeGzJxQV0ud0inKQU/4/h0cfvYoXzi2PFaKI6EsbGt58eY
 OEWAmIwtpgUm/yVVi/0XV50h/w8DCcA+xWCMRXPU1BK4shREPbDFRl30jeoeHeYZ4H
 47qNioacjkqfw33y7rQlVT5lfIz7+s8fkC2bR5dxlrblBa0AOe9arzyJwUOB8dDiUF
 N0qeZ/IW7CeLQ==
Date: Fri, 8 Jul 2022 11:12:45 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] iommu: remove the put_resv_regions method
Message-ID: <20220708101244.GA5395@willie-the-truck>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220708080616.238833-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 08, 2022 at 10:06:15AM +0200, Christoph Hellwig wrote:
> All drivers that implement get_resv_regions just use
> generic_put_resv_regions to implement the put side.  Remove the
> indirections and document the allocations constraints.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/amd/iommu.c                   |  1 -
>  drivers/iommu/apple-dart.c                  |  1 -
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  1 -
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  1 -
>  drivers/iommu/intel/iommu.c                 |  1 -
>  drivers/iommu/iommu.c                       | 21 ++++-----------------
>  drivers/iommu/mtk_iommu.c                   |  1 -
>  drivers/iommu/virtio-iommu.c                |  5 ++---
>  include/linux/iommu.h                       |  4 ----
>  9 files changed, 6 insertions(+), 30 deletions(-)

Heads up, but I think this might collide (trivially?) with:

https://lore.kernel.org/r/20220615101044.1972-1-shameerali.kolothum.thodi@huawei.com

which Joerg has queued up already. It looks like the cleanup still makes
sense though, so that's good.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
