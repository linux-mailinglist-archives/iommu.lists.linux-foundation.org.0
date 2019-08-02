Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3497FE21
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 18:07:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 09D5911C8;
	Fri,  2 Aug 2019 16:07:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 27A31EAD
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 16:05:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 298C389D
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 16:05:10 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping regression fixes for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564761910;
	bh=N5RwYZDXcNZRV1M/9f8qEW8lY38ujjf1NBQSXuCxR3Y=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=GQ33+MyQ7jMXOSYasgN7GZLv0h2xeXfN8MW7AGpqLCC1O3GQw6Q/nt+VSMjhNg8Sf
	0ZrjHa9q7Gm8L3yRnUvUHOdcYqoQUv9HUoDvxJdE8A8V/Cx7Zl9rFGW0Nbkpgzpud0
	h18124AtoHrGEdqioL098pmgUJx0ZfU81dJeeEhM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190801164520.GA26214@infradead.org>
References: <20190801164520.GA26214@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190801164520.GA26214@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
	tags/dma-mapping-5.3-3
X-PR-Tracked-Commit-Id: f46cc0152501e46d1b3aa5e7eade61145070eab0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35fca9f8a999627e3291907992b299b1207baee5
Message-Id: <156476190993.27663.2522263500735152124.pr-tracker-bot@kernel.org>
Date: Fri, 02 Aug 2019 16:05:09 +0000
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

The pull request you sent on Thu, 1 Aug 2019 19:45:20 +0300:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35fca9f8a999627e3291907992b299b1207baee5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
