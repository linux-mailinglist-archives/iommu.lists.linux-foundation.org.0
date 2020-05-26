Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF51C2E82
	for <lists.iommu@lfdr.de>; Sun,  3 May 2020 20:35:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80A7D85F3A;
	Sun,  3 May 2020 18:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdRuWW_4rgMH; Sun,  3 May 2020 18:35:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6921585F35;
	Sun,  3 May 2020 18:35:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4975FC0175;
	Sun,  3 May 2020 18:35:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED8CFC0175
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CE0248832F
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjcy2ar+Jzks for <iommu@lists.linux-foundation.org>;
 Sun,  3 May 2020 18:35:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF9A3882AA
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:35:07 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.7-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588530907;
 bh=DG8ptTP/CPkgT4xTXP2BJxu9eBcErQVTmEzrRxKDUZc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=XO/d592drAmPwCblB4J1Ov6rIyiJgQCvtywNdYw0h6HxnsFtrVm3coRamKscGOPCK
 PfguK91nw2E7mqiDnN3i9LeGxLFJjqY5CX8T/3bs5C7NZxnkBUowClKNPsK6uDhquu
 LcBzoEOSuvCz0babN8eYamdBFQPLDv0d/1XiFxlk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200503121929.GA10425@8bytes.org>
References: <20200503121929.GA10425@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200503121929.GA10425@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.7-rc3
X-PR-Tracked-Commit-Id: b52649aee6243ea661905bdc5fbe28cc5f6dec76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea91593350ecb9d739c413d9213db9db08297108
Message-Id: <158853090751.15713.12435988349132997875.pr-tracker-bot@kernel.org>
Date: Sun, 03 May 2020 18:35:07 +0000
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

The pull request you sent on Sun, 3 May 2020 14:19:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea91593350ecb9d739c413d9213db9db08297108

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
