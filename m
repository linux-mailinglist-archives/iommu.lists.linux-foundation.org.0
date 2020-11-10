Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8BC2AD7FA
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 14:46:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60FD48723F;
	Tue, 10 Nov 2020 13:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOE73pr3fxf0; Tue, 10 Nov 2020 13:46:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA0FF87246;
	Tue, 10 Nov 2020 13:46:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5CA3C016F;
	Tue, 10 Nov 2020 13:46:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53FC9C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42F2086416
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoUqt+qP99pN for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 13:46:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B0576863D5
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:46:49 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD4C22076E;
 Tue, 10 Nov 2020 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605016009;
 bh=P7FNUoUlbSY2GKi42YVDRwQnkOib6vtn54EtBPOLiDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hYDBbp0DdpYpcHeeOBptc7EzMimHnzDqfHH9zPh4g/fqp3K97yvx/BjCLQYQqw/Bo
 hm5eVhisSud5otCjw5SndxHvIiSqDHPiXzMJ6baSTsO+5Okx52I/sEFrisL1N/SI1j
 l25I0lRJXC0UMHi7FqyVZDoJuf3v9Z41LMEfMTH0=
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v19 0/4] iommu/arm-smmu: Add adreno-smmu implementation
 and bindings
Date: Tue, 10 Nov 2020 13:46:40 +0000
Message-Id: <160501115071.4000419.14530620296550155623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109184728.2463097-1-jcrouse@codeaurora.org>
References: <20201109184728.2463097-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 Hanna Hawa <hannah@marvell.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <treding@nvidia.com>, kernel-team@android.com,
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

On Mon, 9 Nov 2020 11:47:24 -0700, Jordan Crouse wrote:
> This short series adds support for the adreno-smmu implementation of the
> arm-smmu driver and the device-tree bindings to turn on the implementation
> for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> per-instance pagetables in the drm/msm driver.
> 
> v19: Rebase to kernel/git/will/linux.git for-joerg/arm-smmu/updates to pick up
>      system cache patches and devm_realloc() updates. Use a function hook to
>      modify / write sctlr
> v18: No deltas in this patchset since the last go-around for 5.10 [1].
> 
> [...]

Applied patches 1-3 to will (for-joerg/arm-smmu/updates), thanks!

[1/4] iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
      https://git.kernel.org/will/c/5c7469c66f95
[2/4] iommu/arm-smmu: Add a way for implementations to influence SCTLR
      https://git.kernel.org/will/c/bffb2eaf0ba2
[3/4] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
      https://git.kernel.org/will/c/a29bbb0861f4

I assume the .dts change will be routed separately so as to avoid conflicts.

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
