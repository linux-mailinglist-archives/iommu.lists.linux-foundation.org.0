Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A23A4358
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 15:50:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B1260771;
	Fri, 11 Jun 2021 13:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z25V3JwvkAYq; Fri, 11 Jun 2021 13:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A54760763;
	Fri, 11 Jun 2021 13:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02A2FC000B;
	Fri, 11 Jun 2021 13:50:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88359C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7748A60763
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYYZ5k_UIGe9 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 13:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A55B60788
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D7DE61357;
 Fri, 11 Jun 2021 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623419444;
 bh=4g9zOBMtlLANWjsSzpBI0yPUcR1JafM3BAkdl/2DRjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huqExwz9svuE+0K5X/MWkdW0X79ZbDiGNmay76Y88bNqFOJguDAdSitTn8KyMPZ19
 nlXc4WBp/GZH2SK4kyEAaxdin+T4nTefqJ7xDJP5iY9rbf394O+nUKDadCOiiShU82
 TbjmsPvLQDQkPB6WlPWc56XRcY135G1u8iMMTqFffViBMEjeSe8ii4SNM0vT4jXDGe
 g2c6jvOsx30Tc0dqOELYK2FIafC09RqSF6h1wRJSLWnSbsFSJvBVhPFjrzeXj2d/7q
 x10ouJtJsxfA7dAc9eL+AEpG2bbp5CfmATTbIXjvXvEnbxlpCTNcACLqn9aoB3xuZ+
 JqS11eowipklQ==
Date: Fri, 11 Jun 2021 14:50:39 +0100
From: Will Deacon <will@kernel.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v3 3/6] iommu: Improve iommu_iotlb_gather helpers
Message-ID: <20210611135039.GB15776@willie-the-truck>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-4-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607182541.119756-4-namit@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jiajun Cao <caojiajun@vmware.com>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Jun 07, 2021 at 11:25:38AM -0700, Nadav Amit wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> The Mediatek driver is not the only one which might want a basic
> address-based gathering behaviour, so although it's arguably simple
> enough to open-code, let's factor it out for the sake of cleanliness.
> Let's also take this opportunity to document the intent of these
> helpers for clarity.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> 
> Changes from Robin's version:
> * Added iommu_iotlb_gather_add_range() stub !CONFIG_IOMMU_API
> * Use iommu_iotlb_gather_add_range() in iommu_iotlb_gather_add_page()
> ---
>  drivers/iommu/mtk_iommu.c |  5 +----
>  include/linux/iommu.h     | 43 ++++++++++++++++++++++++++++++++++-----
>  2 files changed, 39 insertions(+), 9 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
