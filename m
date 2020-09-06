Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 569AE25F00C
	for <lists.iommu@lfdr.de>; Sun,  6 Sep 2020 21:14:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DA511203FA;
	Sun,  6 Sep 2020 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPCELNhTUrNd; Sun,  6 Sep 2020 19:14:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C155E203F2;
	Sun,  6 Sep 2020 19:14:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A54CCC0051;
	Sun,  6 Sep 2020 19:14:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7F77C0051
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9C2008709C
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 19:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu+ZZXlJlDZZ for <iommu@lists.linux-foundation.org>;
 Sun,  6 Sep 2020 19:14:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A69487097
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 19:14:14 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.9-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599419653;
 bh=vSn4eQZTLFvGD2Hp/EuDAxGBxkMT9Wrn9dnzb9lh6is=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Mt68C0cMN82Nu7ftQj5E7RaRDxet4fZ0NMDqQiGIJy/SyRVCNsR2jDevqk2MQYZh2
 YXj15dM4S5znHlVQgeV/g+xNrZ+Vq2FAKd8Ru/5JYXa2UzWhj/3RJYPq09n+royksa
 kcGssYnX2s89TLa8jpYM7Tek+E7rgUE6BCcbAieA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200906150115.GA29365@8bytes.org>
References: <20200906150115.GA29365@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20200906150115.GA29365@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.9-rc3
X-PR-Tracked-Commit-Id: 29aaebbca4abc4cceb38738483051abefafb6950
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ccdd9f8b2ce7290aad6f0a34200ad394e61f940
Message-Id: <159941965380.19439.4825563684088118188.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2020 19:14:13 +0000
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

The pull request you sent on Sun, 6 Sep 2020 17:01:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.9-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ccdd9f8b2ce7290aad6f0a34200ad394e61f940

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
