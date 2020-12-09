Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A122D42A1
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 14:05:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60E838740A;
	Wed,  9 Dec 2020 13:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGftZg-NtHtM; Wed,  9 Dec 2020 13:05:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83F1C87281;
	Wed,  9 Dec 2020 13:05:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E7D1C0FA7;
	Wed,  9 Dec 2020 13:05:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FCFCC013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 20B822DDC9
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJExmgbH49RW for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 13:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 85EB0203A3
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:23 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: robin.murphy@arm.com,
	joro@8bytes.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dma-iommu: remove __iommu_dma_mmap
Date: Wed,  9 Dec 2020 13:05:16 +0000
Message-Id: <160751402660.1427605.2161344329475295616.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209112019.2625029-1-hch@lst.de>
References: <20201209112019.2625029-1-hch@lst.de>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 kernel-team@android.com, Will Deacon <will@kernel.org>
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

On Wed, 9 Dec 2020 12:20:19 +0100, Christoph Hellwig wrote:
> The function has a single caller, so open code it there and take
> advantage of the precalculated page count variable.

Applied to arm64 (for-next/iommu/core), thanks!

[1/1] dma-iommu: remove __iommu_dma_mmap
      https://git.kernel.org/arm64/c/71fe89ceb55b

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
