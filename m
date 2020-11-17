Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C01432B7172
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 23:22:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75E43870B9;
	Tue, 17 Nov 2020 22:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYAb1BgsRxCQ; Tue, 17 Nov 2020 22:22:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE5E0870B2;
	Tue, 17 Nov 2020 22:22:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEC1BC07FF;
	Tue, 17 Nov 2020 22:22:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 038DCC07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E651A85660
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzLgK_BYT9le for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 22:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B19B85657
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:22:33 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 256C920678;
 Tue, 17 Nov 2020 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605651752;
 bh=BkGt+44VK/Hsa4hyKjPNouLZQNX3V18+l8zXTgVURcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L/BSdz3NJvUY/xkgcPvM62jPhjYYtOZKFF8W8fE+KE2hEnzTUlgF3ytopaqpW3NGc
 QhMc0b/GrlAC4gYuw0XvYFQ88Mfq3C0tCOQEcqPr0YwPVL5JGUm5nwStNmUX8O8f3O
 fmeW0/Gu3AjnTppszbXmEvSm1CSLSVJu36EkvlDQ=
Date: Tue, 17 Nov 2020 22:22:27 +0000
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: IOMMU Maintainership
Message-ID: <20201117222227.GB524@willie-the-truck>
References: <20201117100953.GR22888@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117100953.GR22888@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Nov 17, 2020 at 11:09:53AM +0100, Joerg Roedel wrote:
> Luckily Will Deacon volunteered to handle incoming IOMMU patches and
> send them upstream. So please Cc him on any patches that you want to
> have merged upstream for the next release and on important fixes for
> v5.10. The patches will go through another tree for the time being, Will
> can share the details on that.

Thanks Joerg, and please try to get some rest.

As for the temporary new workflow; I'll be queueing IOMMU patches on
branches in the arm64 tree and merging them into a non-stable branch
(for-next/iommu/core) which will go into -next. I'll send a separate pull
for the IOMMU bits when the time comes.

If you have IOMMU patches targetting 5.10 or 5.11, then please CC me to
make sure I don't miss them. Alex, Robin and Lu have also offered to help
with review and I can pull from them too.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
