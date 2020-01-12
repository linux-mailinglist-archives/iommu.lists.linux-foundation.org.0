Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFE138792
	for <lists.iommu@lfdr.de>; Sun, 12 Jan 2020 18:40:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B0FA87001;
	Sun, 12 Jan 2020 17:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1gVLr8JcvWc; Sun, 12 Jan 2020 17:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8B278664E;
	Sun, 12 Jan 2020 17:40:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE332C1D8D;
	Sun, 12 Jan 2020 17:40:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 617A8C077D
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 17:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A7CD84AAE
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 17:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvh0LgFHqx-H for <iommu@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 17:40:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CCDA784A6C
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 17:40:03 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.5-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578850803;
 bh=F2rMj+tDgCY54uolmRKP8Lu3t4cWtvsfHk3J8aI4QqI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lLEEPy6Ds5dpxuAqq/QJJ+LYZBSXpWSGRkuJV6SC3oeQYNumlOFwz3mBoVs11KJuT
 CEBVmVS9uvG7v9K7c1BPGy1mTBedL33wIKOEJpYo748FlNU51lYRJMZ9tJ+1DcMxwn
 05mzKsvG1V27jh7fh+fwzVn68zy9a6p9yQT3aXwg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200112095936.GA17108@8bytes.org>
References: <20200112095936.GA17108@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200112095936.GA17108@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 iommu-fixes-v5.5-rc5
X-PR-Tracked-Commit-Id: 55817b340a31951d23d1692db45522560b1d20f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 040a3c33623ba4bd11588ab0820281b854a3ffaf
Message-Id: <157885080357.18926.14855458420719655456.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jan 2020 17:40:03 +0000
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

The pull request you sent on Sun, 12 Jan 2020 10:59:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git iommu-fixes-v5.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/040a3c33623ba4bd11588ab0820281b854a3ffaf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
