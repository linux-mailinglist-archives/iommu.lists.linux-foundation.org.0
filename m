Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A6C18A1
	for <lists.iommu@lfdr.de>; Sun, 29 Sep 2019 19:50:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1A1710A9;
	Sun, 29 Sep 2019 17:50:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 143ADE45
	for <iommu@lists.linux-foundation.org>;
	Sun, 29 Sep 2019 17:50:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C8E78735
	for <iommu@lists.linux-foundation.org>;
	Sun, 29 Sep 2019 17:50:21 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569779421;
	bh=eMIVtaaYxmqE+13EFEMvT3gTKsf9DNaaYaJnjwKMjuY=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=OxQG+ql3muIrR4IO4Uerz99E72GRLgbUuNGbjlc3w3Fw6jAdt+Kb/ilLa/SU3nek5
	tlTD5UgVjLOJzo8YLWfQfNpvgV/1LU7OPgm2I9iuLqwTASSsXZppeQmA2Io1Y9DnfG
	upcbgFwy1Uh6n5jJdlp/tDxjOS3m0oKyROnDM1XI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190928191007.GA7565@8bytes.org>
References: <20190928191007.GA7565@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190928191007.GA7565@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-fixes-5.4-rc1
X-PR-Tracked-Commit-Id: 2a78f9962565e53b78363eaf516eb052009e8020
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d2af08ed08ce87c4fd2379fa857153631ee8537
Message-Id: <156977942161.28081.7134210299973252649.pr-tracker-bot@kernel.org>
Date: Sun, 29 Sep 2019 17:50:21 +0000
To: Joerg Roedel <joro@8bytes.org>
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

The pull request you sent on Sat, 28 Sep 2019 21:10:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-5.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d2af08ed08ce87c4fd2379fa857153631ee8537

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
