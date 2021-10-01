Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E096441F388
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 19:45:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8272A407ED;
	Fri,  1 Oct 2021 17:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpQ2e0HWjSZA; Fri,  1 Oct 2021 17:45:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 828D4407EC;
	Fri,  1 Oct 2021 17:45:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F93AC0022;
	Fri,  1 Oct 2021 17:45:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AF63C000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2EA4260B
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipTdB8SV44ah for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0B964260A
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EBAC619EC;
 Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633110345;
 bh=50KEU2tGlqTXnkEzUvBVWrpJ77cLKCuts7/ISS9Stfg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=iQTRvzzd8a5NNlJX09ICpyZwXBCoZ1DdteeXkp1nbvOPfg+dnuYCi0AP/bdsrqKgi
 cPAeyAIxS9uAPhWmO6sdY+h7+r2Bg1e2QY6yUHOZTnFowisnqBhmpoFpVHUZ3csCk+
 BeRuG+xsU7s0B6G2qOCOjr1QJVtO58x7wwe4I5MMiGEDYUV8BpBS6ovXaBUFx+UGY2
 tRPoDfTP7oThTCFL/ULSNb7D3qOWwTwsKWQGH0v6ANanFoPn1nUQoICNTC73UeNShx
 KUQiJyPYQD9mBDQtqoSMCwT1XGrS0mCIwlGcLpyocasWve+wFFuHDCSinXLdi2sBmD
 Bt+HR7pUiizog==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7F94E609D6;
 Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <YVcw4sXKg6alXhmx@8bytes.org>
References: <YVcw4sXKg6alXhmx@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YVcw4sXKg6alXhmx@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.15-rc3
X-PR-Tracked-Commit-Id: f0b636804c7c4c564efbca5981e3c56b5c6fe0c5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89e503592385fbed872c7ea1fb89931ece3409a5
Message-Id: <163311034546.16016.5734147883884656976.pr-tracker-bot@kernel.org>
Date: Fri, 01 Oct 2021 17:45:45 +0000
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The pull request you sent on Fri, 1 Oct 2021 18:01:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89e503592385fbed872c7ea1fb89931ece3409a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
