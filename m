Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DA356B32
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 13:29:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ED2E405DC;
	Wed,  7 Apr 2021 11:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-GEQDL62WSZ; Wed,  7 Apr 2021 11:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F309405C1;
	Wed,  7 Apr 2021 11:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D534C0012;
	Wed,  7 Apr 2021 11:29:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89579C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 11:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 774064030A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 11:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axWg77NcDqaH for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 11:29:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 759E940220
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 11:29:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3237161369;
 Wed,  7 Apr 2021 11:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617794953;
 bh=9NYyU7bUjOR+lLmEGMoWH42DJ2TAlct90gArzd8w4y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mb72Mgv2mJJ7Y9FIzjDq+4botbLgPx1PAR73hGL5gqbsWLGb1/VlO3QqmfClRIw9m
 NzcejtnuMc43m8jlHvyMZOa/ReMYUWEG7DELK6RNeJ0YpshjcqWnYm/PGnhWpR4vNP
 gYIphl3n3PoBEmVmH33Tc4maj5Ej8ZmbX/56ek5EfAImlkCuPcwf9grp/RVYwbGFxg
 Vqsmmgb3lP34tTN5X6zTAu4+UblR6ekvQYr9dOoOUn2r7FkchKU0MaKjmUgIcjO/Yl
 WkekR3IcccJUG8dv82uLkTxUNVxEVmcrdEBMtqgnSNBi9ZpZ/meDr/aaRzQMeleahJ
 SypmiCrufDKeQ==
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, Zenghui Yu <yuzenghui@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Remove the unused fields for
 PREFETCH_CONFIG command
Date: Wed,  7 Apr 2021 12:29:07 +0100
Message-Id: <161779144071.3351666.16894933104302748109.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084448.1838-1-yuzenghui@huawei.com>
References: <20210407084448.1838-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, wanghaibin.wang@huawei.com
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

On Wed, 7 Apr 2021 16:44:48 +0800, Zenghui Yu wrote:
> Per SMMUv3 spec, there is no Size and Addr field in the PREFETCH_CONFIG
> command and they're not used by the driver. Remove them.
> 
> We can add them back if we're going to use PREFETCH_ADDR in the future.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Remove the unused fields for PREFETCH_CONFIG command
      https://git.kernel.org/will/c/e0bb4b735404

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
