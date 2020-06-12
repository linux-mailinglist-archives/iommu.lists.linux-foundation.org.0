Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAD1F7D84
	for <lists.iommu@lfdr.de>; Fri, 12 Jun 2020 21:25:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4460987BBB;
	Fri, 12 Jun 2020 19:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72nsDjG4kGZD; Fri, 12 Jun 2020 19:25:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E617387B94;
	Fri, 12 Jun 2020 19:25:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D390EC089E;
	Fri, 12 Jun 2020 19:25:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3642FC016F
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 21C2026B5A
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Um2JFFQbt0z for <iommu@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9C0AE204AE
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:25:33 +0000 (UTC)
Subject: Re: [git pull] iommu: Move Intel and AMD drivers to a subdirectory
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591989932;
 bh=BEnJrzqvMuYpXAMpphS0j5QS8iaksoh4GLbaBhcMbAI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uXFNm8u3IEk9U3bVwC76ryJ5Aem1ysPI9bgyMzCZsFGJRtWgC0GclObvluj5IvSZJ
 ssgg2abB08g8J4z8Ycl8q59EcFw15niVYrJtts+fomyw1IHT11n6qoyj0I1UaLsPHD
 FW7yPVB4HenhPP3gZpPyu0KgnvJgoENbvhWZKjgE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200612152205.GA18833@8bytes.org>
References: <20200612152205.GA18833@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200612152205.GA18833@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-drivers-move-v5.8
X-PR-Tracked-Commit-Id: 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f02f363f76f99f08117336cfac7f24c76b25be3
Message-Id: <159198993250.4050.3240312078488270067.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2020 19:25:32 +0000
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

The pull request you sent on Fri, 12 Jun 2020 17:22:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-drivers-move-v5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f02f363f76f99f08117336cfac7f24c76b25be3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
