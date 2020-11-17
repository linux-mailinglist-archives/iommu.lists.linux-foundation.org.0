Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB392B5CA5
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 11:10:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3396585D8F;
	Tue, 17 Nov 2020 10:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLxpK96lvwvz; Tue, 17 Nov 2020 10:10:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD85385C9D;
	Tue, 17 Nov 2020 10:10:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B27CC07FF;
	Tue, 17 Nov 2020 10:10:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71D59C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 63FA7870FD
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7SmQtVQkSXj for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BCCE087113
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:09:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 51D0B39B; Tue, 17 Nov 2020 11:09:55 +0100 (CET)
Date: Tue, 17 Nov 2020 11:09:53 +0100
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: IOMMU Maintainership
Message-ID: <20201117100953.GR22888@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi,

last week I spent in the hospital and had an unplanned surgery from
which I am recovering now. The recovery will take a few weeks, which
unfortunatly does not allow me to fulfill my IOMMU maintainer duties or
do any other serious work in front of a computer.

Luckily Will Deacon volunteered to handle incoming IOMMU patches and
send them upstream. So please Cc him on any patches that you want to
have merged upstream for the next release and on important fixes for
v5.10. The patches will go through another tree for the time being, Will
can share the details on that.

I hope to return to my duties when the next merge window is over.

Thanks a lot for your help, Will! Also thank you to the others on Cc
which will help Will handling the patch flow.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
