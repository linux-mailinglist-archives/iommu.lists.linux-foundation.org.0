Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5183F34F9
	for <lists.iommu@lfdr.de>; Fri, 20 Aug 2021 22:09:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F14080C24;
	Fri, 20 Aug 2021 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qh_mDtCNqy-N; Fri, 20 Aug 2021 20:09:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0CD9380B96;
	Fri, 20 Aug 2021 20:09:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAF4CC000E;
	Fri, 20 Aug 2021 20:09:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87EDCC000E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 20:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B0C66141A
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 20:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulCOwTi00-Ql for <iommu@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 20:09:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0A5D60712
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 20:09:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 81FAE61164;
 Fri, 20 Aug 2021 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629490159;
 bh=UESAVHHByRL8GRF+VuG4vfPxKkx84wJav/Z+xCf8oxM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bevgo92AY/xrcDMvKRXug6GrbQvrVFZhLhE6AXIIqvgfbMoKB8V+306Rwm43ObuRb
 R5GfrBsFIWkCXr2i7VARUKRXfD8O3T+hYzZ9Xw49gCvXqwObCL+8oJaxtkEbpS6LnY
 eY7KCPbdGrh9ZxkSJxlIya7qsI/Pv6V18p3bpnnbTquKlbrhrUfnNJaeNoHFSQjmDK
 V+OjDg2bDHRjDFsNIWGCXtcfaoqbuEh13KceMILF2s13E0Tnsb8sNsxVhZiI4R7Yb2
 wdFIHL5ZTHY1cd8nfTkFCeLVbZxuGpV6PWGbxFol4v0Drui4QR8autfso91qwDwrCr
 TlGJsinPDcaSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C3CE60A21;
 Fri, 20 Aug 2021 20:09:19 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <YR9fopoKjkg2o2V1@8bytes.org>
References: <YR9fopoKjkg2o2V1@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YR9fopoKjkg2o2V1@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.14-rc6
X-PR-Tracked-Commit-Id: 8798d36411196da86e70b994725349c16c1119f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7d184d37ecc99f87fc8e531c788f69084f8a95f
Message-Id: <162949015950.21370.1226491799201947929.pr-tracker-bot@kernel.org>
Date: Fri, 20 Aug 2021 20:09:19 +0000
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

The pull request you sent on Fri, 20 Aug 2021 09:54:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7d184d37ecc99f87fc8e531c788f69084f8a95f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
