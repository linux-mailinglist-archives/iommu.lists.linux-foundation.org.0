Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B64185FC7
	for <lists.iommu@lfdr.de>; Sun, 15 Mar 2020 21:25:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 137AC89D3B;
	Sun, 15 Mar 2020 20:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kNOVUuNPwdz; Sun, 15 Mar 2020 20:25:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85C6B89C6A;
	Sun, 15 Mar 2020 20:25:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72AD0C013E;
	Sun, 15 Mar 2020 20:25:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D9E8C013E
 for <iommu@lists.linux-foundation.org>; Sun, 15 Mar 2020 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 59CB52150A
 for <iommu@lists.linux-foundation.org>; Sun, 15 Mar 2020 20:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdIFAQODCkQq for <iommu@lists.linux-foundation.org>;
 Sun, 15 Mar 2020 20:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id E0134215DF
 for <iommu@lists.linux-foundation.org>; Sun, 15 Mar 2020 20:25:06 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.6-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584303906;
 bh=eiuLjTM0H7dwvn819pmsnMr/lPvShNx1pDwdSrAXyRQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=N1thktkZN0Da+XmJMgGqEbwh6qedl5hyY8gzb5T3LArQIyhhDrzfVz8frkUI9LnVr
 Rhz+OuK6CceQHZYPD1NIXSrtsxPr8s3jw3NJiSMx6ud2TFGW0JwchOisx7s/BPY9v/
 emu3Fa0mFlRe2bINEcXCOIeMHo7yBAVMc4F4r12Y=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200315091602.GA18173@8bytes.org>
References: <20200315091602.GA18173@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200315091602.GA18173@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.6-rc5
X-PR-Tracked-Commit-Id: 1da8347d8505c137fb07ff06bbcd3f2bf37409bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de28a65cd0e39d031dfcdc61fbe06268cb4a5f94
Message-Id: <158430390668.13594.6670059982592088397.pr-tracker-bot@kernel.org>
Date: Sun, 15 Mar 2020 20:25:06 +0000
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

The pull request you sent on Sun, 15 Mar 2020 10:16:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.6-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de28a65cd0e39d031dfcdc61fbe06268cb4a5f94

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
