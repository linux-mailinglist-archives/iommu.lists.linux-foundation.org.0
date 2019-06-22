Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D29834F8D0
	for <lists.iommu@lfdr.de>; Sun, 23 Jun 2019 01:05:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 94F0318A3;
	Sat, 22 Jun 2019 23:05:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C79F5189E
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 23:05:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 916E3224
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 23:05:04 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.2-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561244704;
	bh=7QUak2VryUzJwlPALMoUzkXCarUVSfSF93ogRPYy7Rw=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=G7z8ii+ZisH9XgKUpYJfVPRw5IkNG/61M7CIvWj85/D4T8f59zeVh5jRguBtaTHOF
	L5wlNVE5NiiU6RVKS/7w3LUf33OPK4Ru/lknH7a7svM2V1NqCD4lL9Irwf2/SFQcTD
	9I4AJq6PvfVvK41ZhRJc1jaFjmWvYaxESPgK2W8Y=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190622194641.GA5200@8bytes.org>
References: <20190622194641.GA5200@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190622194641.GA5200@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
	tags/iommu-fix-v5.2-rc5
X-PR-Tracked-Commit-Id: 0aafc8ae665f89b9031a914f80f5e58825b33021
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6698a71a1e360d89514aafcea15ccff837f59038
Message-Id: <156124470420.733.3742446385319983333.pr-tracker-bot@kernel.org>
Date: Sat, 22 Jun 2019 23:05:04 +0000
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

The pull request you sent on Sat, 22 Jun 2019 21:46:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fix-v5.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6698a71a1e360d89514aafcea15ccff837f59038

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
