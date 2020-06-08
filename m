Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EB1F1F67
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 21:00:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AF49875A2;
	Mon,  8 Jun 2020 19:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VhGqGVDUcyh; Mon,  8 Jun 2020 19:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F1A1A8759A;
	Mon,  8 Jun 2020 19:00:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2CE0C016F;
	Mon,  8 Jun 2020 19:00:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1258DC016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 19:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07CAE87475
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 19:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVwjGgoUNWvA for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 19:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A4EB786DAE
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 19:00:26 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591642826;
 bh=TADXkTSQWoa3MyExygYsuGyc5j7G9rmpLPZ8UBV7ETY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EHxoXKabiFXLcYfAz1VttN/HO1JpOj5IcuDx0szV4eVqxyEdtCJIF89kJY8MJkm5o
 uZK8nYmj7pg/W6no3p3D1wg86g2NsMq0XZx9VM/wSsdgQsvdb++tOJcRn9MeNwW5mm
 RIH64HMvsmcK7ughkqD3w75RP/bmDLYUSedgrU1Y=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200608160502.GA4491@8bytes.org>
References: <20200608160502.GA4491@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200608160502.GA4491@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.8
X-PR-Tracked-Commit-Id: 431275afdc7155415254aef4bd3816a1b8a2ead0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e3a16ee9148e966678bbc713579235422271a63
Message-Id: <159164282645.16000.16082571812872995168.pr-tracker-bot@kernel.org>
Date: Mon, 08 Jun 2020 19:00:26 +0000
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

The pull request you sent on Mon, 8 Jun 2020 18:05:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e3a16ee9148e966678bbc713579235422271a63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
