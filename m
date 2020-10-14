Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28B28E724
	for <lists.iommu@lfdr.de>; Wed, 14 Oct 2020 21:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E8CE86E6B;
	Wed, 14 Oct 2020 19:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ8Z1ULhsaTd; Wed, 14 Oct 2020 19:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E03108708A;
	Wed, 14 Oct 2020 19:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C53C2C0051;
	Wed, 14 Oct 2020 19:18:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D186BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC05C87B8E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMTihi-KsOe8 for <iommu@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 19:18:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 663A187B8D
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:18:15 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602703094;
 bh=CeJQJA6+jJU1Q8IK7BcXIkzwp0K6ByI6ZQq+kFkobS4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EUcsM0cu0KcdUyUhtqzfBWtbAzxCQU0j0DPEoRcE5KMwS9JOm9mFdDId/QjscHIbt
 kB70VR26d+rtrQhaqfMWyz+7OtAarEsoIC6r/Y09qoT9+v7qA2xhoE9fpMDCRpOUgF
 0FuB+DMtQ1e4vt8afxtWXjjaZSo3MXiELEoB44v0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201013160353.GA19438@8bytes.org>
References: <20201013160353.GA19438@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201013160353.GA19438@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.10
X-PR-Tracked-Commit-Id: 7e3c3883c381aeda903778d7e99fc4cd523be610
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 531d29b0b674036347a04c08c0898ff1aa522180
Message-Id: <160270309490.18367.15785316135185550226.pr-tracker-bot@kernel.org>
Date: Wed, 14 Oct 2020 19:18:14 +0000
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

The pull request you sent on Tue, 13 Oct 2020 18:03:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/531d29b0b674036347a04c08c0898ff1aa522180

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
