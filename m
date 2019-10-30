Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A86E9C39
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 14:25:11 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DE28D36;
	Wed, 30 Oct 2019 13:25:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D59FCD09
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 13:25:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB2818A
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 13:25:05 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.4-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572441905;
	bh=DmmVLnO2Nuchx2VqNQqfcDQaXZjO+KlZLc+j/LGWQWM=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=U3qiA9LOdmlhEL7fiTwaa9JI3b9W86IMZcgvOdjUPWk+8ov2+TbcurOUJFDBmj821
	C/WBIK7gqxh22pTats0caYT0PijkX6KdBiLa5aAyCTPLviO1SwQtY//ltxXS3mbJSg
	UUwkV2F/1zKz/N3KUK1FkIBVcb4U+Je/asLHcD/w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191030130251.GA11315@8bytes.org>
References: <20191030130251.GA11315@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191030130251.GA11315@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-fixes-v5.4-rc5
X-PR-Tracked-Commit-Id: 160c63f909ffbc797c0bbe23310ac1eaf2349d2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 320000e72ec0613e164ce9608d865396fb2da278
Message-Id: <157244190549.19806.13453430741450004166.pr-tracker-bot@kernel.org>
Date: Wed, 30 Oct 2019 13:25:05 +0000
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

The pull request you sent on Wed, 30 Oct 2019 14:02:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/320000e72ec0613e164ce9608d865396fb2da278

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
