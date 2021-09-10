Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D64071D2
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 21:26:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42935402BB;
	Fri, 10 Sep 2021 19:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1D5abKd0VFkV; Fri, 10 Sep 2021 19:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 973CD402B1;
	Fri, 10 Sep 2021 19:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67C6AC001E;
	Fri, 10 Sep 2021 19:26:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C40F6C000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 19:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F27940480
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 19:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bS1CdF3rVLI for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 19:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FE1840338
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 19:26:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0ABB2611C3;
 Fri, 10 Sep 2021 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631301960;
 bh=cHC1slDp5og8XWCZUc4LD3ckqKL5rJE1mc0HqB2fkB4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QPOiFgZLu1LkjKFcyqPMt1bL+19OJVyUzi7/WZbvmuSgmzMUdWfD+JOkvK2PFNIlF
 1nsIYpqYPvMVma460tA04DlsybTtOkxjnqiWtrLsiAJLfRVQNyUyKaJBBxaWZtoYZG
 Q/jyv0UVizQpo5xD+DDietNHB9f9cQ1S3m4KnvcCh4fJV/+WAgs0gqxn1dLpCSfh1m
 6ZDElOWNAVA8arN4NQECraGYrkPS7e5vYVD2hsr1S1gHRZ7DBcRCMlj9ztOeouaIit
 cRbMKC8lop3SYTbpKlSmq7AMX40qybAa8eOwVKY1ycAHvmDQHJ9aMJPc1PcKanjWXp
 Y3c4zOCzvIu8w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 059FA609BA;
 Fri, 10 Sep 2021 19:26:00 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.15-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <YTt+RAMfjZdchT8W@8bytes.org>
References: <YTt+RAMfjZdchT8W@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YTt+RAMfjZdchT8W@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.15-rc0
X-PR-Tracked-Commit-Id: 8cc633190b524c678b740c87fa1fc37447151a6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 589e5cab170843b2f7f8260168ab2d77163d4384
Message-Id: <163130196001.21375.6132090372979009289.pr-tracker-bot@kernel.org>
Date: Fri, 10 Sep 2021 19:26:00 +0000
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

The pull request you sent on Fri, 10 Sep 2021 17:48:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.15-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/589e5cab170843b2f7f8260168ab2d77163d4384

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
