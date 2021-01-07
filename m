Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D82ED206
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 15:23:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 93CE28739E;
	Thu,  7 Jan 2021 14:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDI+huL0gUdO; Thu,  7 Jan 2021 14:22:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C30CD87367;
	Thu,  7 Jan 2021 14:22:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B44E6C013A;
	Thu,  7 Jan 2021 14:22:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66DDAC013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 14:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 633C386C61
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 14:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8qvnQjYp8td for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 14:22:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF7BA8582C
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 14:22:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB78723340;
 Thu,  7 Jan 2021 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610029372;
 bh=QwOHtluI5QjPAV+iXFS1yvi49MqVAvgoQ2rboBEBOpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PNabRhPE10cp2uCbeRIIlWuNVwROfR7d1Jc8lv57+sBchnd9xm2/6paMrq6akzVjK
 iNAjoK2H75lpmOuav5qpv9FP/ICRMeeHZEuQfgtBLGyFg654hX80PXYa0ra5WtO5tY
 FZA1L5NVwnGtxKQKwk/LCO9FV/7S1tlEN36rY03NiiFBdCF4CGFVvMxAFDuRmzxLrI
 BP2uiFPG6YrInkO+Rjp+BNJsXcfXLGoV2zuSzn9AzbPWVzZ4jEXiH+EixoG5aKsbib
 DpPPHBfkh162vI9wlenvAj1Df58lqm0CndcltXf+GVwWmSWHLFD1qvFtji/bFSbc5q
 TIDX+aRQtmkgw==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/5] iommu/vt-d: Fix misuse of ALIGN in qi_flush_piotlb()
Date: Thu,  7 Jan 2021 14:22:46 +0000
Message-Id: <161002603532.2363893.7669085161472435807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
References: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Guo Kaijie <Kaijie.Guo@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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

On Thu, 31 Dec 2020 08:53:19 +0800, Lu Baolu wrote:
> Use IS_ALIGNED() instead. Otherwise, an unaligned address will be ignored.

Applied patches 1, 4 and 5 to arm64 (for-next/iommu/fixes), thanks!

[1/5] iommu/vt-d: Fix misuse of ALIGN in qi_flush_piotlb()
      https://git.kernel.org/arm64/c/1efd17e7acb6
[4/5] Revert "iommu: Add quirk for Intel graphic devices in map_sg"
      https://git.kernel.org/arm64/c/4df7b2268ad8
[5/5] iommu/vt-d: Fix lockdep splat in sva bind()/unbind()
      https://git.kernel.org/arm64/c/420d42f6f9db

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
