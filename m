Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A40E3270489
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 21:04:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61A4287815;
	Fri, 18 Sep 2020 19:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gioDRNWcyLw6; Fri, 18 Sep 2020 19:04:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7DFC87814;
	Fri, 18 Sep 2020 19:04:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95065C0891;
	Fri, 18 Sep 2020 19:04:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE58C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 19:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 244BB2E1F1
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvj-y6ZAdWFR for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 19:04:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id AAAAF204B4
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 19:04:14 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.9-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600455854;
 bh=ENzdNrr6Yxov2Bq4jXUL6Wo6Vtn0e8D2Uu4poYfo59Q=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=KDqRm34Z2uFXVYGIG2bdFP3UNv4TFwH+CGAq67wfqdTtRNM1ID9TiUiNgPTfDQOm9
 2r37+N6alFdjvnZ9C69UJdvoXO/CMGn0q8Y1C7R+EtXDVA2DqenNivLBSZoz9wL36a
 6JgYpzJnLTGkSJJu0b+6g88i94vDVyaMksPa1rpg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200918151051.GA31007@8bytes.org>
References: <20200918151051.GA31007@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20200918151051.GA31007@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.9-rc5
X-PR-Tracked-Commit-Id: e97685abd5d711c885053d4949178f7ab9acbaef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fd79656f7d59b2ccfc8d7ec8136db60d21f1e0a
Message-Id: <160045585430.18461.16309137272287318103.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2020 19:04:14 +0000
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

The pull request you sent on Fri, 18 Sep 2020 17:10:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.9-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fd79656f7d59b2ccfc8d7ec8136db60d21f1e0a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
