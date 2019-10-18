Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C1173DD515
	for <lists.iommu@lfdr.de>; Sat, 19 Oct 2019 00:50:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 15276CB6;
	Fri, 18 Oct 2019 22:50:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2DDFEC8E
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 22:50:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0B4670D
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 22:50:05 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.4-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571439005;
	bh=FKzAlNN+TyJBmE9+y4CpxN/ZJGSJcbXBg++g7FzD46g=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=RGgsiADRCN4R+BG6B7z1H/if1Fl/fC3kWBAbqgYHTIP8Y8AYqjk+48GS3rJgQdgW4
	XmHZHiUq9t2cQfsPn7r0TJ2sOcBWEI/PGeqntId4QviOhc/Y35OpoRfElMsbKhlYzZ
	0j9wPuamXv/vnG+LDJgjltRnKZO+gKr6bj7fPavY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191018155403.GA9621@8bytes.org>
References: <20191018155403.GA9621@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191018155403.GA9621@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-fixes-v5.4-rc3
X-PR-Tracked-Commit-Id: 46ac18c347b00be29b265c28209b0f3c38a1f142
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90105ae1eeef51987f40d8e2db4c9c79604fc4e4
Message-Id: <157143900556.13317.13328781026600840171.pr-tracker-bot@kernel.org>
Date: Fri, 18 Oct 2019 22:50:05 +0000
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

The pull request you sent on Fri, 18 Oct 2019 17:54:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90105ae1eeef51987f40d8e2db4c9c79604fc4e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
