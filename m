Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF040FDE6
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 18:29:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 328AD4013A;
	Fri, 17 Sep 2021 16:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWCBsl6RyPx9; Fri, 17 Sep 2021 16:29:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2586A4076B;
	Fri, 17 Sep 2021 16:29:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0D5AC001E;
	Fri, 17 Sep 2021 16:29:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50359C000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E6874075D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-8mxdUh7NKF for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 16:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54BD44013A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B2A5260555;
 Fri, 17 Sep 2021 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631896179;
 bh=F+9ZYOY/fQCB+/cc3bWLn/U+CNBbgrbLdqp7h7nZ5Hg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=m38FJrdfUX6C3NvbwHdixpA9Zdjl2977a2g3SCaYy/X9GWcjxXMg7mXd7AF/g9gno
 uHEDVhIhIjVvGQd1LKSQBh4VBFtAIsRrvP/b2oM9CI6LGk9pQ1JwoeMiwHzCEB5l4J
 fmQnnAJE6u0vi4LeW4iwLwgluc5DyoUBdLKVg7DF8+vMEv13BqWFCdk41bWQpMblA8
 duY8ASeiXBDmlnL5Hn+vX1/z17RbfBJHMiw4m/aJDIa4/BxLA118sGNCvmfyAQZ5jc
 fsDo6m/3ahdbBbi36n9yB+cCFqIa5mELmaHSrmVKk0k17iG8bPvXcnfR4DO/S3BmjV
 IeOBgZHw5SqyQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ACB5260965;
 Fri, 17 Sep 2021 16:29:39 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for Linux 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <YUR6gpm+mTWqdil6@infradead.org>
References: <YUR6gpm+mTWqdil6@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YUR6gpm+mTWqdil6@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/nvme.git tags/nvme-5.15-2021-09-15
X-PR-Tracked-Commit-Id: 70f437fb4395ad4d1d16fab9a1ad9fbc9fc0579b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65ed1e692f2b996292a5bd973200442816dd0ec1
Message-Id: <163189617970.30150.9881812220681119353.pr-tracker-bot@kernel.org>
Date: Fri, 17 Sep 2021 16:29:39 +0000
To: Christoph Hellwig <hch@infradead.org>
Cc: iommu@lists.linux-foundation.org,
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

The pull request you sent on Fri, 17 Sep 2021 13:22:42 +0200:

> git://git.infradead.org/nvme.git tags/nvme-5.15-2021-09-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65ed1e692f2b996292a5bd973200442816dd0ec1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
