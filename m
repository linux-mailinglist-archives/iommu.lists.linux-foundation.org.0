Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5EB3D57A6
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 12:38:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B5A8374F;
	Mon, 26 Jul 2021 10:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUPnAxRfDafy; Mon, 26 Jul 2021 10:38:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BEB9483760;
	Mon, 26 Jul 2021 10:38:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE80C000E;
	Mon, 26 Jul 2021 10:38:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB6B8C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 10:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6A296060E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 10:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmOzQ7PG2qBc for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 10:38:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAE83605F9
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 10:38:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F178A2B0; Mon, 26 Jul 2021 12:38:03 +0200 (CEST)
Date: Mon, 26 Jul 2021 12:37:56 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Georgi Djakov <quic_c_gdjako@quicinc.com>
Subject: Re: [PATCH v7 00/15] Optimizing iommu_[map/unmap] performance
Message-ID: <YP6QhHDyCLSiqIvn@8bytes.org>
References: <1623850736-389584-1-git-send-email-quic_c_gdjako@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623850736-389584-1-git-send-email-quic_c_gdjako@quicinc.com>
Cc: isaacm@codeaurora.org, will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, djakov@kernel.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, pratikp@codeaurora.org
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

On Wed, Jun 16, 2021 at 06:38:41AM -0700, Georgi Djakov wrote:
> Isaac J. Manjarres (12):
>   iommu/io-pgtable: Introduce unmap_pages() as a page table op
>   iommu: Add an unmap_pages() op for IOMMU drivers
>   iommu/io-pgtable: Introduce map_pages() as a page table op
>   iommu: Add a map_pages() op for IOMMU drivers
>   iommu: Add support for the map_pages() callback
>   iommu/io-pgtable-arm: Prepare PTE methods for handling multiple
>     entries
>   iommu/io-pgtable-arm: Implement arm_lpae_unmap_pages()
>   iommu/io-pgtable-arm: Implement arm_lpae_map_pages()
>   iommu/io-pgtable-arm-v7s: Implement arm_v7s_unmap_pages()
>   iommu/io-pgtable-arm-v7s: Implement arm_v7s_map_pages()
>   iommu/arm-smmu: Implement the unmap_pages() IOMMU driver callback
>   iommu/arm-smmu: Implement the map_pages() IOMMU driver callback
> 
> Will Deacon (3):
>   iommu: Use bitmap to calculate page size in iommu_pgsize()
>   iommu: Split 'addr_merge' argument to iommu_pgsize() into separate
>     parts
>   iommu: Hook up '->unmap_pages' driver callback

Applied to iommu/core branch, thanks to everyone involved!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
