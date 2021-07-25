Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805F3D4F46
	for <lists.iommu@lfdr.de>; Sun, 25 Jul 2021 19:49:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E9C403C7;
	Sun, 25 Jul 2021 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZS0_OnofZPy; Sun, 25 Jul 2021 17:49:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D14EC403C6;
	Sun, 25 Jul 2021 17:49:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DE34C000E;
	Sun, 25 Jul 2021 17:49:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8856C000E
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 17:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C203E82B51
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 17:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nja8SVLaqbUQ for <iommu@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 17:49:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D40082A8F
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 17:49:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B536D60F11;
 Sun, 25 Jul 2021 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627235386;
 bh=7pETpqCU40IXUaFx5pvopBByYFHbdyxIvzK1JeQNbOE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bAQCAKKRRS1boVg3TYyp36sWLiQ9I0SeVoZnKTd43M5Jyl6chC/02FbtB5btZVZKx
 f6FCc4VrH8jW+Q8+l5eF153iunNOFVFCX/jCUpEA5XJpaHyTiPPGpoawvk1cHBO7dv
 i+qBzZwCtK8IoPX1tz63A7JGpdSVjAT5sW+H8Q0gNQMxj14C4vGV3P+JSSiAhuKKYY
 LV67XUTU979vdwYNxE19knooUuqsn8J3ZW4QLyXbhTEHMb0rvrdhbJOXiwZxkbKud7
 nFI1xIuzCNleGLciNcv9A2zZ5Ob7KFS4zyAWhx2AESIWXGkTLo2EfhAUeKmXYF9jcC
 E1mgnOQhEYaQQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AEC6D60A2F;
 Sun, 25 Jul 2021 17:49:46 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fix for Linux 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <YPz+qQ6dbZVDbMwu@infradead.org>
References: <YPz+qQ6dbZVDbMwu@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YPz+qQ6dbZVDbMwu@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.14-1
X-PR-Tracked-Commit-Id: 40ac971eab89330d6153e7721e88acd2d98833f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04ca88d056b44efee1e7635c74c0be3705efc72c
Message-Id: <162723538670.30584.9150662147851995225.pr-tracker-bot@kernel.org>
Date: Sun, 25 Jul 2021 17:49:46 +0000
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

The pull request you sent on Sun, 25 Jul 2021 08:03:21 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04ca88d056b44efee1e7635c74c0be3705efc72c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
