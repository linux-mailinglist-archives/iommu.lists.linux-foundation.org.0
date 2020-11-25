Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B852C41B7
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 15:05:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0FDE686D2B;
	Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7z5myVt2PdJ7; Wed, 25 Nov 2020 14:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A822086D27;
	Wed, 25 Nov 2020 14:05:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E1B4C0052;
	Wed, 25 Nov 2020 14:05:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E136C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 487E186D27
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjkhYk95mjh4 for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 14:05:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D743586D2B
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:31 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53EC820BED;
 Wed, 25 Nov 2020 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313131;
 bh=G0QniDixREASD/+97G1s9HC8wwScSSPO5MfGlrcrBuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O6E+10hEkNV96Jai8iOP93upvTHZb+ZK8e4sVKefiWCAdSxmYRmocF3DBVggpEiRu
 ObmRZhJwV48JYE0SYCgtQi1uegfZo3DFKiHIBhphbs9Guh7RdRhopOLI4nOQDcBIiQ
 N2vkzpcrTEWvhuNfOtwjg84VmtzKsXzCn4BvcXvo=
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH v6 0/7] Convert the intel iommu driver to the dma-iommu api
Date: Wed, 25 Nov 2020 14:05:17 +0000
Message-Id: <160630583051.4094327.7513344162564263042.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124082057.2614359-1-baolu.lu@linux.intel.com>
References: <20201124082057.2614359-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kernel-team@android.com
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

On Tue, 24 Nov 2020 16:20:50 +0800, Lu Baolu wrote:
> The v5 of this series could be found here.
> 
> https://lore.kernel.org/linux-iommu/20201120101719.3172693-1-baolu.lu@linux.intel.com/
> 
> Changes in this version:
> - Rebase the series to the latest iommu/next branch.
>   https://lore.kernel.org/linux-iommu/20201123100816.GA26619@infradead.org/
> 
> [...]

Applied to arm64 (for-next/iommu/vt-d), thanks!

[1/7] iommu: Handle freelists when using deferred flushing in iommu drivers
      https://git.kernel.org/arm64/c/2a2b8eaa5b25
[2/7] iommu: Add iommu_dma_free_cpu_cached_iovas()
      https://git.kernel.org/arm64/c/230309d08b87
[3/7] iommu: Allow the dma-iommu api to use bounce buffers
      https://git.kernel.org/arm64/c/82612d66d51d
[4/7] iommu: Add quirk for Intel graphic devices in map_sg
      https://git.kernel.org/arm64/c/65f746e8285f
[5/7] iommu/vt-d: Update domain geometry in iommu_ops.at(de)tach_dev
      https://git.kernel.org/arm64/c/c062db039f40
[6/7] iommu/vt-d: Convert intel iommu driver to the iommu ops
      https://git.kernel.org/arm64/c/c588072bba6b
[7/7] iommu/vt-d: Cleanup after converting to dma-iommu ops
      https://git.kernel.org/arm64/c/58a8bb39490d

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
