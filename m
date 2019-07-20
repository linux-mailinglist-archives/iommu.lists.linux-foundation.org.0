Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1526F07A
	for <lists.iommu@lfdr.de>; Sat, 20 Jul 2019 21:35:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA29D1028;
	Sat, 20 Jul 2019 19:35:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77C45C97
	for <iommu@lists.linux-foundation.org>;
	Sat, 20 Jul 2019 19:35:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 567B4E6
	for <iommu@lists.linux-foundation.org>;
	Sat, 20 Jul 2019 19:35:22 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563651322;
	bh=IjC9XRyqEEK7udbTgGaO8BIgzv1bScLdS7/8eArfCM8=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=StV/0N6ppk/JU6ZqwaFdV6fBW5mAbpoiCLIi5tqBwpt4r7Bl54fGO7GjCQwavlJIh
	bJQQ/kYrbSM/XW8pDW9gL+NQn6Q2utPiKJD92SHg3kWJ08oAIEJjkrGsLsJnnh1qEv
	cLZK7nMdbu3lOXoVdENG7+MGgbOS39ThlRouXESs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190720172911.GA11099@infradead.org>
References: <20190720172911.GA11099@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190720172911.GA11099@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
	tags/dma-mapping-5.3-1
X-PR-Tracked-Commit-Id: 449fa54d6815be8c2c1f68fa9dbbae9384a7c03e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac60602a6d8f6830dee89f4b87ee005f62eb7171
Message-Id: <156365132205.3883.10711143327941655871.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2019 19:35:22 +0000
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

The pull request you sent on Sat, 20 Jul 2019 19:29:11 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac60602a6d8f6830dee89f4b87ee005f62eb7171

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
