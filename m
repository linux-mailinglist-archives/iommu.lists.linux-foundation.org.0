Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6C2C41BA
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 15:05:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8845A86E72;
	Wed, 25 Nov 2020 14:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgVSzS-ybzP4; Wed, 25 Nov 2020 14:05:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA00286E45;
	Wed, 25 Nov 2020 14:05:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5CF5C0052;
	Wed, 25 Nov 2020 14:05:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A33A1C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 896C587598
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzShs7hQcgce for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 159B88759D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 047E720684;
 Wed, 25 Nov 2020 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313133;
 bh=nlropR2GVshViNQ37mRXiDY92PPVrpHL27XsaeQ2YQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=urmeyfJAGKiqg0PdUHFJzhGcTKe5Nb2ymqRQJpmLq1BY+8OJlFntcjnjMjO3ksliE
 pMnsTccb9vj9awndZMZjxQA85RPe+X2PrUtn33+WI3AcDJcaNTWEj1M1cqY9+pc93+
 2+pjUsoWb/N+LmmpW+osDxnaZ3JePZNdLJLQwNjg=
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH RESEND v2 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Date: Wed, 25 Nov 2020 14:05:18 +0000
Message-Id: <160630228218.3309190.17273821531692081062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, kernel-team@android.com
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

On Wed, 25 Nov 2020 02:10:08 -0800, Nicolin Chen wrote:
> Changelog
> v1->v2:
>  * Added Thierry's acks to PATCH-3~5
> 
> This is a merged set of resend for previously two series of patches
> that were reviewed/acked a month ago yet have not got applied.
> 
> [...]

Applied to arm64 (for-next/iommu/tegra-smmu), thanks!

[1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
      https://git.kernel.org/arm64/c/cf910f61aff3
[2/5] iommu/tegra-smmu: Expand mutex protection range
      https://git.kernel.org/arm64/c/d5f583bf8654
[3/5] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
      https://git.kernel.org/arm64/c/8750d207dc98
[4/5] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
      https://git.kernel.org/arm64/c/25938c73cd79
[5/5] iommu/tegra-smmu: Add PCI support
      https://git.kernel.org/arm64/c/541f29bb0643

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
