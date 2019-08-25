Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 247759C164
	for <lists.iommu@lfdr.de>; Sun, 25 Aug 2019 05:15:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2520B7A;
	Sun, 25 Aug 2019 03:15:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3AD59AF0
	for <iommu@lists.linux-foundation.org>;
	Sun, 25 Aug 2019 03:15:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ECCE9A7
	for <iommu@lists.linux-foundation.org>;
	Sun, 25 Aug 2019 03:15:06 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.3-rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566702906;
	bh=mPe3odrknBIFfF0lqHZtL9q2YQNnQ+0AuopSqTNkTbM=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=oR/rkFO644feU+z4crnl3ubSvYZmCexFNEafhkRdDyk6GrkjtnoJhZ0Kx9/LQZnwU
	qjqw35eo9RcpQjl/iguP523Omqf9wsVDxVqhGF0fzx/UQAFmcgxeLAIEyUwKrJo0MX
	Uq+SILhGG94Ywy8C93W2Z006GEAAo2TM+RL8XcXY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190824225010.GA18590@infradead.org>
References: <20190824225010.GA18590@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190824225010.GA18590@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
	tags/dma-mapping-5.3-5
X-PR-Tracked-Commit-Id: 90ae409f9eb3bcaf38688f9ec22375816053a08e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e67095fd2f727c35e510d831c588696f2138a1bb
Message-Id: <156670290674.4585.269087204039323980.pr-tracker-bot@kernel.org>
Date: Sun, 25 Aug 2019 03:15:06 +0000
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The pull request you sent on Sun, 25 Aug 2019 07:50:10 +0900:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e67095fd2f727c35e510d831c588696f2138a1bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
