Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F23763EB6C4
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 16:34:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB1F80ECD;
	Fri, 13 Aug 2021 14:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FX6ho0X0Tk9; Fri, 13 Aug 2021 14:34:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7B7F880EE0;
	Fri, 13 Aug 2021 14:34:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5679EC000E;
	Fri, 13 Aug 2021 14:34:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2BC8C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BA0680ED5
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwmgyjCFTITC for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 14:33:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 491E380ED4
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 14:33:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07B9E6103A;
 Fri, 13 Aug 2021 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628865234;
 bh=d0BeRz2Oi17JZJ39SH5fmnNP/U0hTjWRV5pfhm+LWBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XkwS8opmptLBwTpvdVUX6Ijyab8gX6A0LxK/5hNHqEGkP0pi1uxRXtVzDS2JwVmzm
 A3tr0cMkJJW8BEr6GPEydxX+z52qoJyYxahcF4lel1vBUfJUrfKvBe4S/fd6INAIX3
 YreruVZt8SqimHw2UMUkXqO8tq3wlCqtZtDosybi0rmU8RZb4D2dzd6aeF9+xP7bix
 U0q0y7NV9A+GrirhXoMlAPhqksYjzPjELzZS/rNtmi4W2I+ohx30EisbFgGQr4l3dE
 0QHliUBIzMNTX/saBqeYAKNBtEaNi28oInJNOke32t7D7sUs5CW4SuC0rbB1HFfMLc
 mZ5bjW/5xpXiA==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop pre-zeroing batch commands
Date: Fri, 13 Aug 2021 15:33:47 +0100
Message-Id: <162886116698.2824022.16783624022186581694.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1628696966-88386-1-git-send-email-john.garry@huawei.com>
References: <1628696966-88386-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 11 Aug 2021 23:49:26 +0800, John Garry wrote:
> Pre-zeroing the batched commands structure is inefficient, as individual
> commands are zeroed later in arm_smmu_cmdq_build_cmd(). The size is quite
> large and commonly most commands won't even be used:
> 
> 	struct arm_smmu_cmdq_batch cmds = {};
> 345c:	52800001 	mov	w1, #0x0                   	// #0
> 3460:	d2808102 	mov	x2, #0x408                 	// #1032
> 3464:	910143a0 	add	x0, x29, #0x50
> 3468:	94000000 	bl	0 <memset>
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Stop pre-zeroing batch commands
      https://git.kernel.org/will/c/fac956710ab0

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
