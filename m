Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C651353E
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 15:34:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 625BC83267;
	Thu, 28 Apr 2022 13:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2zeCBPLnMyB; Thu, 28 Apr 2022 13:34:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7DE66831AE;
	Thu, 28 Apr 2022 13:34:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F3BEC0081;
	Thu, 28 Apr 2022 13:34:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 864E8C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73186401C5
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CUmtQw9vnRu for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 13:34:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E60E40BAE
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:34:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 78C7F374; Thu, 28 Apr 2022 15:34:15 +0200 (CEST)
Date: Thu, 28 Apr 2022 15:34:14 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RESEND PATCH v8 00/11] Fix BUG_ON in vfio_iommu_group_notifier()
Message-ID: <YmqX1kXee3FGGhXf@8bytes.org>
References: <20220418005000.897664-1-baolu.lu@linux.intel.com>
 <YmpfFA1iIQyGBipX@8bytes.org> <20220428115411.GA8364@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428115411.GA8364@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 iommu@lists.linux-foundation.org
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

On Thu, Apr 28, 2022 at 08:54:11AM -0300, Jason Gunthorpe wrote:
> Can we get this on a topic branch so Alex can pull it? There are
> conflicts with other VFIO patches

Right, we already discussed this. Moved the patches to a separate topic
branch. It will appear as 'vfio-notifier-fix' once I pushed the changes.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
