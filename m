Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 328AF308FD2
	for <lists.iommu@lfdr.de>; Fri, 29 Jan 2021 23:12:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E4BC52E149;
	Fri, 29 Jan 2021 22:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvWn3SF7Y-tj; Fri, 29 Jan 2021 22:12:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2784C2E135;
	Fri, 29 Jan 2021 22:12:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DCF8C013A;
	Fri, 29 Jan 2021 22:12:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7EBBC013A
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 22:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B1BBB87038
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 22:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1qCdnCw0SBP for <iommu@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 22:12:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3085E86C13
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 22:12:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F1C564E05;
 Fri, 29 Jan 2021 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611958342;
 bh=I0DQYedg79MDplR4wz0VMCk0Kg1nGuOgVHy0BPastaQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ot/m49BwWvv1BTHkQNwCtXonxcAAY2vi1nfcl4+solCYa+YCX4C81nOKTKSFGP0c5
 fYr3vpHKR2xXHSxwNPZUnZzI4ntPiFY4KvMNPFcP5LgRuSQ7Nf3fG8H49r10/QYfeJ
 zkjBOOPfWltSo7fqqgJCHFJ2KfvrpMu6N7ju02zSp87OBsRHG/zInBUFqd3+Nkkyvl
 yf0xQloCZkI1j+g4A9uxnMkr31BB8lez0gS+TVBb0Jyvpu1ofCVnQX25LZq3nI2E3h
 ip6WdyBVDBDeB/86GcKFewpuQ0xrp5jnJaESUkAitCMBV2izBTL0hjTwURHOAo3juQ
 Ab9qG0uouHRgw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8BF8860953;
 Fri, 29 Jan 2021 22:12:22 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210129164123.GA25513@8bytes.org>
References: <20210129164123.GA25513@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20210129164123.GA25513@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.11-rc5
X-PR-Tracked-Commit-Id: 29b32839725f8c89a41cb6ee054c85f3116ea8b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ef24c2011b77bd6344d16630d3cd95d63de63f8
Message-Id: <161195834256.1476.12524452460486856757.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jan 2021 22:12:22 +0000
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

The pull request you sent on Fri, 29 Jan 2021 17:41:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.11-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ef24c2011b77bd6344d16630d3cd95d63de63f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
