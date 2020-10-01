Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52127FF9F
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 14:58:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 608D68699F;
	Thu,  1 Oct 2020 12:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PyAS6Llu8oZt; Thu,  1 Oct 2020 12:58:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F367853B9;
	Thu,  1 Oct 2020 12:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E57BC0051;
	Thu,  1 Oct 2020 12:58:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F52C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A706204A9
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uc8nZIZY3BHJ for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 12:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id EF6C42049B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:58:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8451526F; Thu,  1 Oct 2020 14:58:42 +0200 (CEST)
Date: Thu, 1 Oct 2020 14:58:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [Patch V8 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20201001125841.GF30426@8bytes.org>
References: <20200925190620.18732-1-ashok.raj@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925190620.18732-1-ashok.raj@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will.deacon@arm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi Ashok,

On Fri, Sep 25, 2020 at 12:06:17PM -0700, Ashok Raj wrote:
> Sai Praneeth Prakhya (3):
>   iommu: Add support to change default domain of an iommu group
>   iommu: Take lock before reading iommu group default domain type
>   iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file
> 
>  .../ABI/testing/sysfs-kernel-iommu_groups          |  30 +++
>  drivers/iommu/iommu.c                              | 227 ++++++++++++++++++++-
>  2 files changed, 256 insertions(+), 1 deletion(-)

Thanks for the repost, I can grab it just fine with b4. But this nees
some more testing on my side and some time in linux-next, so it is too
late now to queue it for v5.10. Can you please remind me after the next
merge window? I'll pick it up then and do the testing and it will
hopefully spend enough time in linux-next.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
