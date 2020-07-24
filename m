Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0F22C174
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 10:55:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 94F3820242;
	Fri, 24 Jul 2020 08:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K+HQJ6Xmw6bP; Fri, 24 Jul 2020 08:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3128A20115;
	Fri, 24 Jul 2020 08:55:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1257DC0052;
	Fri, 24 Jul 2020 08:55:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4448C004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D0FB920242
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 08:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceaXVrqqoJlK for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 08:55:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B3B220115
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 08:55:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3D11846A; Fri, 24 Jul 2020 10:55:20 +0200 (CEST)
Date: Fri, 24 Jul 2020 10:55:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 00/12] [PULL REQUEST] iommu/vt-d: patches for v5.9
Message-ID: <20200724085518.GR27672@8bytes.org>
References: <20200724014925.15523-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724014925.15523-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Fri, Jul 24, 2020 at 09:49:13AM +0800, Lu Baolu wrote:
> Below patches have been piled up for v5.9. It includes:
> 
>  - Misc tweaks and fixes for vSVA
>  - Report/response page request events
>  - Cleanups
> 
> Can you please consider them for iommu/next?

Applied, thanks Baolu.

For the next round, would you consider using the b4[1] tool to queue
your patches? This way you can easily add a Link: tag to the commits,
pointing to the original upstream discussion.

I also use b4 and the link it adds to the commits is from your
patch-posting, but that does not include the original posting or
discussion around a patch.

Thanks,

	Joerg

[1] https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
