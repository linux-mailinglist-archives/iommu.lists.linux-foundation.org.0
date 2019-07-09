Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5B63A99
	for <lists.iommu@lfdr.de>; Tue,  9 Jul 2019 20:11:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 446933C69;
	Tue,  9 Jul 2019 18:11:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 422113BFB
	for <iommu@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 18:05:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 153DD881
	for <iommu@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 18:05:11 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562695510;
	bh=NkcUNciY6fp+o9lV42HpyjayCavwwzbOIUw8DGSWkZg=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=O2HrqHuzIETZrvVAyGqeN/bTaCkyGWjXXzZPR8dRxpyf3k5+ZvcpLbLXipphJ9rw/
	JG85yusEn7aITVVTq3efrL5e1AQzlyyOy6hrfMed6XILl2nqjttqUGxTTX3bRMqdzj
	iKaKhJlVvTCn4A+EjwUI/ryRBSdaLhHq0djeSImY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190708160601.GA1214@8bytes.org>
References: <20190708160601.GA1214@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190708160601.GA1214@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-updates-v5.3
X-PR-Tracked-Commit-Id: d95c3885865b71e56d8d60c8617f2ce1f0fa079d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b04014f3f151ed62878327813859e76e8e23d78
Message-Id: <156269551078.14383.16540843583255942762.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jul 2019 18:05:10 +0000
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

The pull request you sent on Mon, 8 Jul 2019 18:06:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b04014f3f151ed62878327813859e76e8e23d78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
