Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 47617512F20
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 10:56:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03D460C01;
	Thu, 28 Apr 2022 08:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98wSPPbWLiUk; Thu, 28 Apr 2022 08:56:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 221E260D4F;
	Thu, 28 Apr 2022 08:56:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8F03C0081;
	Thu, 28 Apr 2022 08:56:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 940D5C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7459B812E7
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2RzHNQn6vbg for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 08:56:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D200482521
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:56:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B34812FB; Thu, 28 Apr 2022 10:56:34 +0200 (CEST)
Date: Thu, 28 Apr 2022 10:56:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 0/4] Make the iommu driver no-snoop block feature
 consistent
Message-ID: <YmpWwbcrl5OntB+g@8bytes.org>
References: <0-v3-2cf356649677+a32-intel_no_snoop_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v3-2cf356649677+a32-intel_no_snoop_jgg@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, kvm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Apr 11, 2022 at 12:16:04PM -0300, Jason Gunthorpe wrote:
> Jason Gunthorpe (4):
>   iommu: Introduce the domain op enforce_cache_coherency()
>   vfio: Move the Intel no-snoop control off of IOMMU_CACHE
>   iommu: Redefine IOMMU_CAP_CACHE_COHERENCY as the cap flag for
>     IOMMU_CACHE
>   vfio: Require that devices support DMA cache coherence
> 
>  drivers/iommu/amd/iommu.c       |  7 +++++++
>  drivers/iommu/intel/iommu.c     | 17 +++++++++++++----
>  drivers/vfio/vfio.c             |  7 +++++++
>  drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++++++++++-----------
>  include/linux/intel-iommu.h     |  2 +-
>  include/linux/iommu.h           |  7 +++++--
>  6 files changed, 52 insertions(+), 18 deletions(-)

Applied to core branch, thanks everyone.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
