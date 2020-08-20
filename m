Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FB24C718
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 23:19:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 692D32039E;
	Thu, 20 Aug 2020 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0EYCMPJjJ8I; Thu, 20 Aug 2020 21:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBAC52040A;
	Thu, 20 Aug 2020 21:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B892EC0051;
	Thu, 20 Aug 2020 21:19:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F95CC0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1C0318693C
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 915FxyxZarY3 for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 21:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B71E98692B
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 21:19:46 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597958384;
 bh=2hq6onQCdlA403xN+jtRAG5QjR2ibewvyvH6gGLQeH4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=y82HTfhV8vskYpYEAgQFRWNVn5iAR4aqiJ21sUp3dzCVX2IydREZrrVG8KfcFxw9a
 X1l8w0kcTHCEH5Ku6muPA3TryhIWhty0wZ4x8O4WB/x7i23jYQTL8KwsyZ0khuJcwD
 NTDRBs6xeL8OJggOTgTTDJNnhL+Sq7CVDUXUrYwI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200820164158.GA2186695@infradead.org>
References: <20200820164158.GA2186695@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20200820164158.GA2186695@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.9-1
X-PR-Tracked-Commit-Id: d7e673ec2c8e0ea39c4c70fc490d67d7fbda869d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d271b51c60ebe71e0435a9059b315a3d8bb8a099
Message-Id: <159795838442.11229.2400574888982180858.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2020 21:19:44 +0000
To: Christoph Hellwig <hch@infradead.org>
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

The pull request you sent on Thu, 20 Aug 2020 18:41:58 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.9-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d271b51c60ebe71e0435a9059b315a3d8bb8a099

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
