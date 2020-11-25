Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 082432C41BE
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 15:05:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B025A86D56;
	Wed, 25 Nov 2020 14:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gj0Wkxea2i9c; Wed, 25 Nov 2020 14:05:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 498E586D52;
	Wed, 25 Nov 2020 14:05:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33EBCC0052;
	Wed, 25 Nov 2020 14:05:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 906B2C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 71FE92E148
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6LQ8iv-MDJG for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 14:05:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C7802E0BD
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CB2A206E5;
 Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313137;
 bh=V88pL5dlNClg3Rp8IlVW2fGZVgMNsnMnyslRAsAM0/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IKW4E7dLWXrWphU+1depwI0HysOt8xUnw1zycj1/GiAbqFrqnwZIpebwqZANKTBQG
 zMYtxnOpSvrzyIVc5vWcZhvjf0B+1UXybyI3H61bSs7fklfGgin3EEmIhmzeCMvb+P
 Onqnwz5eSRSV4zLPcE5iBzz27cyKD8hNX4zv1Dzg=
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCHv10 0/9] System Cache support for GPU and required SMMU
 support
Date: Wed, 25 Nov 2020 14:05:19 +0000
Message-Id: <160630994849.3550201.9456322529162111327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
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

Applied the SMMU bits to arm64 (for-next/iommu/arm-smmu), thanks!

[3/9] iommu/arm-smmu: Add support for pagetable config domain attribute
      https://git.kernel.org/arm64/c/c99110a865a3
[4/9] iommu/arm-smmu: Move non-strict mode to use io_pgtable_domain_attr
      https://git.kernel.org/arm64/c/12bc36793fd6

[8/9] iommu: arm-smmu-impl: Use table to list QCOM implementations
      https://git.kernel.org/arm64/c/00597f9ff5ec
[9/9] iommu: arm-smmu-impl: Add a space before open parenthesis
      https://git.kernel.org/arm64/c/7f575a6087f4

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
