Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FFE1FD4A1
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 20:35:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 97A2888E52;
	Wed, 17 Jun 2020 18:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OM207eAVOLzc; Wed, 17 Jun 2020 18:35:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BD6788E10;
	Wed, 17 Jun 2020 18:35:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 300C5C016E;
	Wed, 17 Jun 2020 18:35:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45B26C016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 18:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 34DBD88E10
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 18:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOYXwVlkkvHP for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 18:35:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF1E388D7C
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 18:35:25 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592418925;
 bh=tcpLLHq6ekGGxG5zR9yj/3ixxGQL7DOjyVhjSB/mzYQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dtj58PLdIcYgWVXmgLpbvjE6DBEV/Q2eEmCcDEfRnSq5F0oI3O8LBbh1ATeazJSYU
 StdGAHKZfoY73suJVyKPwtkrnsv5CYtcLPnqXIuC4QZNOnhnNAZaJNNE3hldAS447S
 SljJEiXEExuM0fAd2k6S37Tf4faB7VgjygWdwKiM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200617072716.GA7356@infradead.org>
References: <20200617072716.GA7356@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200617072716.GA7356@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.8-3
X-PR-Tracked-Commit-Id: dbed452a078d56bc7f1abecc3edd6a75e8e4484e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b5044021070efa3259f3e9548dc35d1eb6aa844
Message-Id: <159241892542.2275.7100762619147699282.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2020 18:35:25 +0000
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

The pull request you sent on Wed, 17 Jun 2020 09:27:16 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b5044021070efa3259f3e9548dc35d1eb6aa844

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
