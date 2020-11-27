Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 534632C6BEA
	for <lists.iommu@lfdr.de>; Fri, 27 Nov 2020 20:19:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D70A0874B3;
	Fri, 27 Nov 2020 19:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7em0QyHqojnX; Fri, 27 Nov 2020 19:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 666C88775A;
	Fri, 27 Nov 2020 19:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF4FC0052;
	Fri, 27 Nov 2020 19:19:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C6C6C0052
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 19:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 32F2E87A5F
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 19:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSxu7ItBunVH for <iommu@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 19:19:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6F6A87A26
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 19:19:51 +0000 (UTC)
Subject: Re: [GIT PULL] IOMMU fixes for -rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606504791;
 bh=Nr5BvFLHb4Qmc/0zhtcVQYgSAZ5EMHTvFIVuupVSDOE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=HEaDHW6KCt8mtWULbL00GpCaTcMHJKYRJxHFcqbSaxVJjbQPOr0cUA5gi/MlRTNxX
 myoQiWzS0U2mFTvesM7YGMS3+W829yG9csNwhqxiiP1/CFZdYo4DOa8FPt4ToaPUho
 4yrMOAMdnk3qsIDsnygx8ygN0SsaRw6CKlVLiQsU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201127114529.GB20418@willie-the-truck>
References: <20201127114529.GB20418@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201127114529.GB20418@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 tags/iommu-fixes
X-PR-Tracked-Commit-Id: d76b42e92780c3587c1a998a3a943b501c137553
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6adf33a5e42feada39d52eebd389d2019202e993
Message-Id: <160650479150.7570.9422474572706414701.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 19:19:51 +0000
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 tglx@linutronix.de, torvalds@linux-foundation.org
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

The pull request you sent on Fri, 27 Nov 2020 11:45:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/iommu-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6adf33a5e42feada39d52eebd389d2019202e993

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
