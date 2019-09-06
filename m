Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52BAC121
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 22:00:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B0C2122C5;
	Fri,  6 Sep 2019 20:00:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D13F52252
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 20:00:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 923888A3
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 20:00:06 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.3-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567800006;
	bh=2K3R/dyDKxGrrVxKDbGMHID5lj8Lbh6A2qaZcfIDRjQ=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=1EpUlSbuKCPvixmzdFzIHfoW/q+JlEyj97X4CwnTg9brBZ+74Mgd9dsS6/UhZw233
	GvWgQlUfzy/9nKQH/GCp2jMvltduiDCmC9OCcFi2wd/hSvU14Ns44iDGaOo1zIIc/l
	bMlUAFa8j6je1MVDIGGkSwza4CSMmXH+1j9OpjzU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190906151220.GA8420@8bytes.org>
References: <20190906151220.GA8420@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190906151220.GA8420@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-fixes-v5.3-rc7
X-PR-Tracked-Commit-Id: 754265bcab78a9014f0f99cd35e0d610fcd7dfa7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76f5e9f870b045546b9a429f21b65205baf69c0c
Message-Id: <156780000639.21952.17823516206887580681.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2019 20:00:06 +0000
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

The pull request you sent on Fri, 6 Sep 2019 17:12:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76f5e9f870b045546b9a429f21b65205baf69c0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
