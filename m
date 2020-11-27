Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090D2C6260
	for <lists.iommu@lfdr.de>; Fri, 27 Nov 2020 10:58:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9239B87A3C;
	Fri, 27 Nov 2020 09:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1HR1lvdspTr; Fri, 27 Nov 2020 09:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27CEC87A3B;
	Fri, 27 Nov 2020 09:58:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B680C0052;
	Fri, 27 Nov 2020 09:58:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 358E4C0052
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 09:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 240EF87B8B
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 09:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98fhXB8vfPax for <iommu@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 09:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6642C87996
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B22021D91;
 Fri, 27 Nov 2020 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606471086;
 bh=GZ4Id4NPj/0z4l0L3vDEF+7KrF0Y8aco3ppn/S+WkzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nrujzITmO0NEf5k1oxkMxuoStmoJFWbAG/YdAhpWalkHT/uOeLZPwhdfc3ag97xUq
 hw2bnfBO6IDMvsPPUiwkJvScGI2ke83QDGU/NcSk9lFcPNEIWAP62nK2Xokjjyo+Ef
 KXX1DLXv9Kx74SLWRBe+dA6EPUfky8BkY2UgTZyw=
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Remove set but not used variable
Date: Fri, 27 Nov 2020 09:58:01 +0000
Message-Id: <160647075022.1960777.14243304052525988022.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127013308.1833610-1-baolu.lu@linux.intel.com>
References: <20201127013308.1833610-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>,
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

On Fri, 27 Nov 2020 09:33:08 +0800, Lu Baolu wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/iommu/intel/iommu.c:5643:27: warning: variable 'last_pfn' set but not used [-Wunused-but-set-variable]
> 5643 |  unsigned long start_pfn, last_pfn;
>      |                           ^~~~~~~~
> 
> This variable is never used, so remove it.

Applied to arm64 (for-next/iommu/vt-d), thanks!

[1/1] iommu/vt-d: Remove set but not used variable
      https://git.kernel.org/arm64/c/405a43cc0047

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
