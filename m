Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C42C0F25
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 16:47:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA3C8870F8;
	Mon, 23 Nov 2020 15:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iP7l+rFXX2N; Mon, 23 Nov 2020 15:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C95487028;
	Mon, 23 Nov 2020 15:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3226DC0052;
	Mon, 23 Nov 2020 15:47:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 099CEC0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D5CD52039C
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGMLiYgv1Irs for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:47:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B3592033E
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:08 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE8592080A;
 Mon, 23 Nov 2020 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606146428;
 bh=TQ307+slGSfbezrSc14iNVZMOcunNKCJLg4x+ZYj56g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V/hwEQUNBve8QmWE07YNiyDXKXv/BDWsZmfiBvGnHEARjxZbrw27pVuCeBq2/10+7
 hrgUA91Fd1NQ2tV8VqruZVd0fx0TLCNgYzEI2rMRdG2mk7ndDDE56UXR2U79kvyQQ8
 ViOt21YEOu23NZLUgOV0nRCE1JfcJFYx6P+57CV8=
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH RESEND v10 0/4] iommu: Shared Virtual Addressing for
 SMMUv3 (PT sharing part)
Date: Mon, 23 Nov 2020 15:46:58 +0000
Message-Id: <160614101572.2838306.10746273931698766152.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201106155048.997886-1-jean-philippe@linaro.org>
References: <20201106155048.997886-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 robin.murphy@arm.com, zhangfei.gao@linaro.org, kernel-team@android.com
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

On Fri, 6 Nov 2020 16:50:46 +0100, Jean-Philippe Brucker wrote:
> These are the remaining bits implementing iommu_sva_bind_device() for
> SMMUv3. They didn't make it into v5.10 because an Ack was missing for
> adding the PASID field to mm_struct. That is now upstream, in commit
> 52ad9bc64c74 ("mm: Add a pasid member to struct mm_struct"). No change
> since last posting [1], only rebased onto v5.10-rc2.
> 
> Note that full SVA support for SMMUv3 still needs IOPF and DVM support,
> coming soon.
> 
> [...]

Applied to arm64 (for-next/iommu/svm), thanks!

[1/4] iommu/ioasid: Add ioasid references
      https://git.kernel.org/arm64/c/cb4789b0d19f
[2/4] iommu/sva: Add PASID helpers
      https://git.kernel.org/arm64/c/cfc78dfd9b36
[3/4] iommu/arm-smmu-v3: Implement iommu_sva_bind/unbind()
      https://git.kernel.org/arm64/c/32784a9562fb
[4/4] iommu/arm-smmu-v3: Hook up ATC invalidation to mm ops
      https://git.kernel.org/arm64/c/2f7e8c553e98

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
