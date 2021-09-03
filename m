Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5F40053A
	for <lists.iommu@lfdr.de>; Fri,  3 Sep 2021 20:45:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D9D60723;
	Fri,  3 Sep 2021 18:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbtqlalxAYw9; Fri,  3 Sep 2021 18:45:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0323D60623;
	Fri,  3 Sep 2021 18:45:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB6B7C0022;
	Fri,  3 Sep 2021 18:45:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D958AC000E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 18:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C84D760623
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 18:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lPDqaHEbJn4 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 18:45:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 936E460723
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 18:45:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 304C2610E8;
 Fri,  3 Sep 2021 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630694747;
 bh=AAegnXp8DjLcWSQIhw6Xa4GPvr9P2pP+q7SnAN6X/VI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Nk3/Y23DySrfXyvZ1TqCfujwBOzxw56hGyTFWRaKZYdLkJbXsV9tOQ4+95vIdHQNG
 kfJ0hSlsnphuR8eKY5C4EX1cz7NSNWetYmrLimWBPASAuMKiYL/aIlisMbgFtodP+I
 20QUnPbdcrrK8GNUprd4T+x7B3uZFNS3JTveBtf5Qqi6K9dH/1XthKhchqpN9o2doZ
 RuioQvZdsZg116cdKzhtgd6PFK0pTewxBRG6yej55iETUc7BU20dwrbo1MwOUyg/6U
 gyJYvQQIGD1mA/RKnE/nnZfywDRXjNOAjNpB3bqVBN/Own6uUq+7tNTAEs1CFEbNwY
 jbE1pylsei2Yw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2B0E7609D9;
 Fri,  3 Sep 2021 18:45:47 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <YTIrHxWNzIwuseXO@8bytes.org>
References: <YTIrHxWNzIwuseXO@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YTIrHxWNzIwuseXO@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.15
X-PR-Tracked-Commit-Id: d8768d7eb9c21ef928adb93402d9348bcc4a6915
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69a5c49a9147e9daca76201e3d6edfea5ed8403a
Message-Id: <163069474717.21432.492880426025517336.pr-tracker-bot@kernel.org>
Date: Fri, 03 Sep 2021 18:45:47 +0000
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
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

The pull request you sent on Fri, 3 Sep 2021 16:03:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69a5c49a9147e9daca76201e3d6edfea5ed8403a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
