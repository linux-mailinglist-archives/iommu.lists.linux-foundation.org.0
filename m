Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44792280877
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 22:28:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B782686983;
	Thu,  1 Oct 2020 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiO6nW53c4dK; Thu,  1 Oct 2020 20:28:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1900186B38;
	Thu,  1 Oct 2020 20:28:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 000C6C0051;
	Thu,  1 Oct 2020 20:28:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4112C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AC8F98735C
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBPbojcdwQC5 for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 20:28:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93FB387323
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:28:10 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.9-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601584090;
 bh=Vx/mDwecDTVqctCYUHEFyLcErqa/NIaIFmAxxuYtrC8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2V0hgdrR9SX2mTQU125VYTfgvDVu8qUVOgkcHwhFC+aCCuAqIJJTqe4bGAb00WRai
 0sqnwhPceNkd64SAzwAI92ZPlpVJqss8GdFauRMEjJcXtSXKAm/RINrM4KxJPH0IKV
 O8gcHozZuIEGH6J71FFjXSroYTw9P/jukccStpbs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201001185024.GA3327@8bytes.org>
References: <20201001185024.GA3327@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201001185024.GA3327@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.9-rc7
X-PR-Tracked-Commit-Id: 1a3f2fd7fc4e8f24510830e265de2ffb8e3300d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44b6e23be32be4470b1b8bf27380c2e9cca98e2b
Message-Id: <160158409032.27596.5069528873491259512.pr-tracker-bot@kernel.org>
Date: Thu, 01 Oct 2020 20:28:10 +0000
To: Joerg Roedel <joro@8bytes.org>
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

The pull request you sent on Thu, 1 Oct 2020 20:50:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.9-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44b6e23be32be4470b1b8bf27380c2e9cca98e2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
