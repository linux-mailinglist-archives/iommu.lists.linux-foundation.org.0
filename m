Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78F420A97
	for <lists.iommu@lfdr.de>; Mon,  4 Oct 2021 14:05:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D246072F;
	Mon,  4 Oct 2021 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knVcsuTp7YbU; Mon,  4 Oct 2021 12:05:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E28B360AEB;
	Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24770C0025;
	Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 115B2C0011
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EB682974
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiJB2BlE2YVB for <iommu@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A30082835
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BCEB613D5;
 Mon,  4 Oct 2021 12:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633349147;
 bh=R6dz7pO6OG6fmGkY234lfGDjKO98fbK8hK91/ADTI20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r6zYcHhTvwIKFGoyPpvyaQEqD7hoQlLHgKwiJ9EkslxdrF15gKV0WEksGSZkEx7oy
 degp/UJXwJwK8gLIDvreb6ywDz2cbuVanh7GiTbyFOwt9iKRqEpRVW6RuPglJs8yST
 shtE9AIWwJrWvil9QK+Da1dbBdEPfhkCzr3dIhiiolaXc5yp3aTEqCjy7dAMmHVKRd
 xauI8fjwP/3c65JNAZl6/TrgG0NxAwlqcwceDmw9l4e/gV8fZxAuNOsVtJQweHBj1G
 szK6OhHFF3eAJIjQ1i8QBXg1udK63jjRIYuTqarIdezL4XpL1CRTOynFg+oC5LXkQA
 aRQatk6YTgRvw==
From: Will Deacon <will@kernel.org>
To: robh+dt@kernel.org, Loic Poulain <loic.poulain@linaro.org>, joro@8bytes.org
Subject: Re: [PATCH 1/2] iommu: arm-smmu-qcom: Add compatible for qcm2290
Date: Mon,  4 Oct 2021 13:05:34 +0100
Message-Id: <163334827414.2617486.6663969645889307910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1633096832-7762-1-git-send-email-loic.poulain@linaro.org>
References: <1633096832-7762-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, shawn.guo@linaro.org,
 kernel-team@android.com
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

On Fri, 1 Oct 2021 16:00:31 +0200, Loic Poulain wrote:
> 


Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu: arm-smmu-qcom: Add compatible for qcm2290
      https://git.kernel.org/will/c/756a622c8f06
[2/2] dt-bindings: arm-smmu: Add qcm2290 compatible strings
      https://git.kernel.org/will/c/f1edce3db543

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
