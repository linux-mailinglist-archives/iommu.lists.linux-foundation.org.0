Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA473EB6C8
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 16:34:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D628240FD5;
	Fri, 13 Aug 2021 14:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BimKGw9u7WiK; Fri, 13 Aug 2021 14:34:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8032741034;
	Fri, 13 Aug 2021 14:34:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D714C001A;
	Fri, 13 Aug 2021 14:34:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B02DC000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1386140FDB
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NgdOlJ4FeI7 for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 14:34:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19C7D40FE8
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:33:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E439610A5;
 Fri, 13 Aug 2021 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628865239;
 bh=92m9HeuR9H4yXPt2DolbcPV0xTYOZD/RrYfz77RdcA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YZ9oERHYXdZf/5bfYcWV9pOyAr6+/jpV1J0o6wOqNp3pgwmKdwwwNvNEkv1CicAdG
 lNNNx7QqE7VhKak9TUIYl7r4DWgkgGDXDqsCnIvZNeIO7/UkgoVVraGBdqbRf3O3xp
 KViVVgqupJbOmmJyjPnwS4wnU85PM4jWurRTIwsASST4R4T7HD06069pOhEJ2n96qc
 aiZgR47TftZV39IFMEy9hoEwX9Lhhn2dwgMgDIXpKzgaZeGYB1CFc0wjJNq0GwN9mt
 b62Y5yMV/mg/UvLyRSJCY8L2cqbNvvc1bKoqxLVX87OG1fTy2sm+xZWWVPyDaPbWmW
 GXvH4AYr1BBTg==
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Prepare for ECMDQ support
Date: Fri, 13 Aug 2021 15:33:49 +0100
Message-Id: <162886058252.2822076.1201372357126525246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210811114852.2429-1-thunder.leizhen@huawei.com>
References: <20210811114852.2429-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>
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

On Wed, 11 Aug 2021 19:48:48 +0800, Zhen Lei wrote:
> RFC --> v1
> 1. Resend the patches for ECMDQ preparation and remove the patches for ECMDQ implementation.
> 2. Patch 2 is modified. Other patches remain unchanged.
>    1) Add static helper __arm_smmu_cmdq_issue_cmd(), and make arm_smmu_cmdq_issue_cmd()
>       and arm_smmu_cmdq_issue_cmd_with_sync() implement based on it.
>    2) Remove unused arm_smmu_cmdq_issue_sync().
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/4] iommu/arm-smmu-v3: Use command queue batching helpers to improve performance
      https://git.kernel.org/arm64/c/eff19474b1bd
[2/4] iommu/arm-smmu-v3: Add and use static helper function arm_smmu_cmdq_issue_cmd_with_sync()
      https://git.kernel.org/arm64/c/4537f6f1e2d8
[3/4] iommu/arm-smmu-v3: Add and use static helper function arm_smmu_get_cmdq()
      https://git.kernel.org/arm64/c/8639cc83aac5
[4/4] iommu/arm-smmu-v3: Extract reusable function __arm_smmu_cmdq_skip_err()
      https://git.kernel.org/arm64/c/2cbeaf3f36eb

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
