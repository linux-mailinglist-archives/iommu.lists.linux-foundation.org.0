Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400C3A4647
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 18:16:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB5D607D8;
	Fri, 11 Jun 2021 16:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfOple9lNVG8; Fri, 11 Jun 2021 16:16:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1D03A6062C;
	Fri, 11 Jun 2021 16:16:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C05B9C0024;
	Fri, 11 Jun 2021 16:16:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D79BC000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A8BB60661
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7t2MrsKpiGp for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 16:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B29A66062C
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:16:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94582613D9;
 Fri, 11 Jun 2021 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623428160;
 bh=X8fq5Ssa8KruLdrdCiVfEs1JgSpE6Roo0bK+wmejB+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=toHI7dqFyFs3RVKe8lF5VXSfnke6XT3P1GGiJdTo3FqWDIkpD/UMJwpTTHHUR++k8
 TW6DmDB2XMJ4JqU9PbTHevr/DPIp/EoUPcmedvAkTGvZbw4FnQVOdzrs2NEYcocnYy
 lKsNALRdXg2ITl7mJcJK3fHjp4ywSZORfvfwmJFPyomJ3R7tCU9tdHsD5gQGkJ6d+6
 J82qegUsU7v8pMbKZvDrhe2ADs9S795kAKWQbQ5eYOPo8I1xNN1j5OAM9sOxPdPzBI
 kRj5HSOqzcd1kfXsJGXUS7jwCLDaTgP9K23UVsfvdJwuPtUK2xSTE1/IYxgMVFGgKV
 V+ghr6emt7k9A==
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Krishna Reddy <vdumpa@nvidia.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2] iommu/arm-smmu: Fix arm_smmu_device refcount leak in
 address translation
Date: Fri, 11 Jun 2021 17:15:43 +0100
Message-Id: <162340795809.3699041.237536515051087882.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1623293391-17261-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1623293391-17261-1-git-send-email-xiyuyang19@fudan.edu.cn>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, Xin Tan <tanxin.ctf@gmail.com>,
 yuanxzhang@fudan.edu.cn, kernel-team@android.com,
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

On Thu, 10 Jun 2021 10:49:20 +0800, Xiyu Yang wrote:
> The reference counting issue happens in several exception handling paths
> of arm_smmu_iova_to_phys_hard(). When those error scenarios occur, the
> function forgets to decrease the refcount of "smmu" increased by
> arm_smmu_rpm_get(), causing a refcount leak.
> 
> Fix this issue by jumping to "out" label when those error scenarios
> occur.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Fix arm_smmu_device refcount leak in address translation
      https://git.kernel.org/will/c/7c8f176d6a3f

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
