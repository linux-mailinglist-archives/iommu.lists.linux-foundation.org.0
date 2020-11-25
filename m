Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587E2C41C0
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 15:05:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2571C2E0F4;
	Wed, 25 Nov 2020 14:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NK5h80z+m3q; Wed, 25 Nov 2020 14:05:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8512A2E0BD;
	Wed, 25 Nov 2020 14:05:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70FFBC0891;
	Wed, 25 Nov 2020 14:05:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8671FC0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 797D22E148
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2bnqExf0F5g for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 14:05:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id C0D612E0BD
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:40 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96049206D8;
 Wed, 25 Nov 2020 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313140;
 bh=CrW9VJQR3WVXiruWhGTnLGV91u/uR09AoTYqRiq51WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OLniI8sFhqbr1EsqH5ak+Bj8H223FzLjqgx9hy4JvMdUTPhk8AxEK7UuZ3YhHe6vU
 HCfNTbwZEkTHi2hmkE5h42MvHfwZgRL7CY5oNbB7mb2njdp//PCzN1FeiwISPN8BLB
 2KZP2Yo7RgeexiluKCl5OSZ0Qa7qIDoRtkcB+oGc=
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>,
 Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCHv10 0/9] System Cache support for GPU and required SMMU
 support
Date: Wed, 25 Nov 2020 14:05:20 +0000
Message-Id: <160630795189.1943614.1845602767779998183.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Kristian H Kristensen <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 25 Nov 2020 12:30:09 +0530, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> [...]

Applied first two patches on a shared branch for Rob:

	arm64 (for-next/iommu/io-pgtable-domain-attr), thanks!

[1/9] iommu/io-pgtable: Add a domain attribute for pagetable configuration
      https://git.kernel.org/arm64/c/a7656ecf825a
[2/9] iommu/io-pgtable-arm: Add support to use system cache
      https://git.kernel.org/arm64/c/e67890c97944

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
