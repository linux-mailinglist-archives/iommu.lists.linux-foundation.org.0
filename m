Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38920B966
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 21:40:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36BB286A8D;
	Fri, 26 Jun 2020 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgpU3Gz3RLTn; Fri, 26 Jun 2020 19:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF62286B10;
	Fri, 26 Jun 2020 19:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9F94C016F;
	Fri, 26 Jun 2020 19:40:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 820E8C016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 71E77875E9
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 19:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQKAyoq-4xHQ for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 19:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 015D987587
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 19:40:13 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.8-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593200413;
 bh=sumYEiYj4agMZCjapVLL0DEwnnKEekY+2rshZJfFCB0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hsSiGlPiREJWygTLSYSanI3tlSUPDi2fEj7B58UhiVj90BcKg2bY+CkxD28RXAHmb
 EsSP/WiITGDBeMxoo1pm85nGrmAEauCPugT510kKDmIwt7YLDcxcs0N5vf/fEQpp2B
 zZx/2dy4Sd1YDAOO+Wdw0TEAAkjpMAxXtCg7CcfM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200626144655.GA20234@8bytes.org>
References: <20200626144655.GA20234@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200626144655.GA20234@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.8-rc2
X-PR-Tracked-Commit-Id: 48f0bcfb7aad2c6eb4c1e66476b58475aa14393e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd37cdf8ba1b56a968173560314398d5d3b2d37a
Message-Id: <159320041384.11855.1244021860580748750.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jun 2020 19:40:13 +0000
To: Joerg Roedel <joro@8bytes.org>
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

The pull request you sent on Fri, 26 Jun 2020 16:47:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.8-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd37cdf8ba1b56a968173560314398d5d3b2d37a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
