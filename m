Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 095791E7EAC
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 15:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 89BD68694A;
	Fri, 29 May 2020 13:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgXhXyKeVhb1; Fri, 29 May 2020 13:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3CAEA8693F;
	Fri, 29 May 2020 13:28:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21C2AC0892;
	Fri, 29 May 2020 13:28:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5B7C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E37E888483
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90cJyXYhJZiJ for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 13:28:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 479F68847F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:28:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F0E2A327; Fri, 29 May 2020 15:28:43 +0200 (CEST)
Date: Fri, 29 May 2020 15:28:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: wu000273@umn.edu
Subject: Re: [PATCH] iommu: Fix reference count leak in iommu_group_alloc.
Message-ID: <20200529132842.GG14598@8bytes.org>
References: <20200527210020.6522-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527210020.6522-1-wu000273@umn.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Alex Williamson <alex.williamson@redhat.com>, kjlu@umn.edu,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Wed, May 27, 2020 at 04:00:19PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> kobject_init_and_add() takes reference even when it fails.
> Thus, when kobject_init_and_add() returns an error,
> kobject_put() must be called to properly clean up the kobject.
> 
> Fixes: d72e31c93746 ("iommu: IOMMU Groups")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
