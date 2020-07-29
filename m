Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19F231E67
	for <lists.iommu@lfdr.de>; Wed, 29 Jul 2020 14:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC61C84995;
	Wed, 29 Jul 2020 12:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p79X2gQvMlGo; Wed, 29 Jul 2020 12:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 493B28488E;
	Wed, 29 Jul 2020 12:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2665BC004F;
	Wed, 29 Jul 2020 12:19:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1479C004D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 755912269B
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9Rq7aICs64w for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 12:18:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id EEB4C2263E
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:18:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6EBC13EC; Wed, 29 Jul 2020 14:18:55 +0200 (CEST)
Date: Wed, 29 Jul 2020 14:18:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Move driver files into their own subdir
Message-ID: <20200729121853.GB23653@8bytes.org>
References: <20200727120510.GA20662@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727120510.GA20662@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 27, 2020 at 01:05:11PM +0100, Will Deacon wrote:
> As requested in [1], here is a second Arm SMMU pull request for 5.9, moving
> the driver files into their own subdirectory to avoid cluttering
> drivers/iommu/.

Pulled, thanks a lot, Will.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
