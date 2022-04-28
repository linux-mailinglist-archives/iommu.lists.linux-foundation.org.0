Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AE512E43
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 10:27:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6A081ADE;
	Thu, 28 Apr 2022 08:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6NMYf2oMHKV; Thu, 28 Apr 2022 08:27:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9809F81ABB;
	Thu, 28 Apr 2022 08:27:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52E1BC002D;
	Thu, 28 Apr 2022 08:27:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D6EAC002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C63417F7
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGYLwNk-cASP for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 08:27:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3825A410E9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 08:27:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 955572FB; Thu, 28 Apr 2022 10:27:20 +0200 (CEST)
Date: Thu, 28 Apr 2022 10:27:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/2] Fix issues with untrusted devices and AMD IOMMU
Message-ID: <YmpP59PHSJpqbbBT@8bytes.org>
References: <20220404204723.9767-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404204723.9767-1-mario.limonciello@amd.com>
Cc: Will Deacon <will@kernel.org>, Hegde Vasant <Vasant.Hegde@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
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

On Mon, Apr 04, 2022 at 03:47:21PM -0500, Mario Limonciello wrote:
> Mario Limonciello (2):
>   iommu/amd: Enable swiotlb in all cases
>   dma-iommu: Check that swiotlb is active before trying to use it
> 
>  drivers/iommu/amd/iommu.c | 7 -------
>  drivers/iommu/dma-iommu.c | 5 +++++
>  2 files changed, 5 insertions(+), 7 deletions(-)

Applied to core branch, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
