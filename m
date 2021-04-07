Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF43567CC
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 11:15:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1FE60A3A;
	Wed,  7 Apr 2021 09:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MN-9yZHygV43; Wed,  7 Apr 2021 09:15:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD456090C;
	Wed,  7 Apr 2021 09:15:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D546C0012;
	Wed,  7 Apr 2021 09:15:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C517C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 09:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4CB6090C
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 09:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEsX4-sZsA1B for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 09:15:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B763360682
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 09:15:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B59E52A6; Wed,  7 Apr 2021 11:15:26 +0200 (CEST)
Date: Wed, 7 Apr 2021 11:15:25 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: AMD IOMMU cleanups and dead code removal
Message-ID: <YG14La980Qy8qbPG@8bytes.org>
References: <20210402143312.372386-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402143312.372386-1-hch@lst.de>
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

On Fri, Apr 02, 2021 at 04:33:08PM +0200, Christoph Hellwig wrote:
> Hi,
> 
> this series cleans up a few random bits in the AMD IOMMU driver.
> 
> Diffstat:
>  arch/x86/events/amd/iommu.c            |    1 
>  arch/x86/events/amd/iommu.h            |   19 ------
>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c |    4 -
>  drivers/iommu/amd/amd_iommu.h          |    2 
>  drivers/iommu/amd/amd_iommu_types.h    |    1 
>  drivers/iommu/amd/init.c               |    5 -
>  drivers/iommu/amd/iommu.c              |   90 +--------------------------------
>  include/linux/amd-iommu.h              |   30 ++++-------
>  8 files changed, 16 insertions(+), 136 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
