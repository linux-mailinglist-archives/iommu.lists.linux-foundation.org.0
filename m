Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC040FFD8
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 21:29:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525544255E;
	Fri, 17 Sep 2021 19:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W82gbn0bG3hZ; Fri, 17 Sep 2021 19:29:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 778024255D;
	Fri, 17 Sep 2021 19:29:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44708C001E;
	Fri, 17 Sep 2021 19:29:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00DE7C000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B5E83E84
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 19:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQhITXpUhp0V for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 19:29:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED20283B61
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 19:29:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DAFE61019;
 Fri, 17 Sep 2021 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631906970;
 bh=MgAZhsC9YYXH0eMO0LIh/+e9w36OjRQfUqYYEFgnqvI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mLQCrCl2Fgc7bZAnOym98F5MLn/oIixqG7RBHQKL/pokEUD7lJtHso5/J6AWf16rp
 9/hwuXyqA40tX3I4fllxAKYQoTdr+YeUqFQSDl/0aqtZ4McpdAfKoEzqU+S+7fmMc4
 zkqnLSYx9VycYg1JK4NvDbgNmrawLGUXAEL47zpNqNbvuqbhqRlPSlWfefAgZR/LLS
 uqPWoZhtz8FtFoF8uES3L9441mlJCLJlh9gcgp3KZP0d3cRha2MEerrCmdUwRT5A0H
 glHoN3+i0fT1gW/L/ykpixfvhi8tIXs6Ys3Z6apiYoHTItETaNYEBFNxgqEOQmqM/I
 EiL1v0wVGxzKQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 688ED60965;
 Fri, 17 Sep 2021 19:29:30 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for Linux 5.15 (2nd attempt)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YUTEnFAls4dyIyJ1@infradead.org>
References: <YUTEnFAls4dyIyJ1@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YUTEnFAls4dyIyJ1@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.15-1
X-PR-Tracked-Commit-Id: 59583f747664046aaae5588d56d5954fab66cce8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9b11b133b4a0b4f8dc36ec04d81d630f763eaa6
Message-Id: <163190697037.17353.4870116211073217387.pr-tracker-bot@kernel.org>
Date: Fri, 17 Sep 2021 19:29:30 +0000
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

The pull request you sent on Fri, 17 Sep 2021 18:38:52 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9b11b133b4a0b4f8dc36ec04d81d630f763eaa6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
