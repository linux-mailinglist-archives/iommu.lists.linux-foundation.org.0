Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27F2C5268
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 11:52:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 918E48782E;
	Thu, 26 Nov 2020 10:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pDziLRKWqAs; Thu, 26 Nov 2020 10:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31D1687829;
	Thu, 26 Nov 2020 10:52:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23195C0052;
	Thu, 26 Nov 2020 10:52:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCB01C0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 10:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C81F987829
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 10:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05W-0uARUg-H for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 10:52:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 31FC487826
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 10:52:53 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20E2420DD4;
 Thu, 26 Nov 2020 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606387972;
 bh=CdLlb1z7XnjJYWndkvYNE80/TxKCto2us3OCs2U4aPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YJXkgxaV5CbnWrqz9QTFxLRPsgOxBrwKZRlu3fdo7aUfupQb8tEba6CNakQALmJHC
 vJggjhdo3I5I9yc5xGxKKwoG/A4pOJXYQDWqkW8cKqfrS1WpoY1k6RZ5V6j9hng2ED
 RBDjI7xRLc8/uFNqZkf/BXzCz074OMjY7ZVn1fz8=
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu: Fix htmldocs warnings in
 sysfs-kernel-iommu_groups
Date: Thu, 26 Nov 2020 10:52:46 +0000
Message-Id: <160638413065.1109527.15725909042368207035.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126090603.1511589-1-baolu.lu@linux.intel.com>
References: <20201126090603.1511589-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Will Deacon <will@kernel.org>,
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

On Thu, 26 Nov 2020 17:06:03 +0800, Lu Baolu wrote:
> Below warnings are fixed:
> 
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Enumerated list ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.

Applied to arm64 (for-next/iommu/default-domains), thanks!

[1/1] iommu: Fix htmldocs warnings in sysfs-kernel-iommu_groups
      https://git.kernel.org/arm64/c/62c9917d9c10

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
