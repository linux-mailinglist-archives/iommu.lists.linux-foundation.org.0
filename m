Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C35148D49
	for <lists.iommu@lfdr.de>; Fri, 24 Jan 2020 19:00:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B6FC86EFF;
	Fri, 24 Jan 2020 18:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dahwr8KmO9b1; Fri, 24 Jan 2020 18:00:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A78A86E73;
	Fri, 24 Jan 2020 18:00:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 387EEC0174;
	Fri, 24 Jan 2020 18:00:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74E2EC0174
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 18:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6341D87884
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 18:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrZWl5MAPFBg for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jan 2020 18:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2FC6867D0
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 18:00:04 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.5-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579888804;
 bh=2b4GYibQY/giByCe+xBlKXf22xXWn/Kj4DMTXSEoz0U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=C2Ak3IoLK1W7BmXzCxmcgjx666/EUoACtNda7R5u4o1OwthkwlfCBuEpD/lbTDCWt
 VUZvvRn7W9R2r+NJyPNaW07uHHsspKJOUmSAi+pe7D+mUjw9/4rTFY9lor1yffcmra
 DDWxeNi94byonTOmwIVRNOl/wrpGFqetRH8fpNl0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200124172938.GA30565@8bytes.org>
References: <20200124172938.GA30565@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200124172938.GA30565@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.5-rc7
X-PR-Tracked-Commit-Id: 8c17bbf6c8f70058a66305f2e1982552e6ea7f47
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6381b442836ea3c52eae630b10be8c27c7a17af2
Message-Id: <157988880477.9531.3662551803752426240.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2020 18:00:04 +0000
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

The pull request you sent on Fri, 24 Jan 2020 18:29:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6381b442836ea3c52eae630b10be8c27c7a17af2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
