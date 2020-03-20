Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756E18D249
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 16:02:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2004024F8D;
	Fri, 20 Mar 2020 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhWmHLB1Hd5I; Fri, 20 Mar 2020 15:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6694924E08;
	Fri, 20 Mar 2020 15:02:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D151C1D89;
	Fri, 20 Mar 2020 15:02:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 228A8C07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 15:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B7258854C
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 15:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgU3GMcit5Cb for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 15:02:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8896988522
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 15:02:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7F7720714;
 Fri, 20 Mar 2020 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584716530;
 bh=abV8/ZN//3YrBYbpASQEcaHQnh62HmxBKB67ullzIGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZzOLV/nbV2X1/L58dQ3IkZlLSycU8DKOQKketOO4IOKdxd2U2/rYT7SkwTah5EjVJ
 iQx82GFrYHrxhgi6UBGnAO02z0cmJpplNHGbUdy4HeQi3Ds72dU53yoowTfDpIdU5U
 OPE+lL5UAbxawylQefAwtClInfYGFVljyJcPApTM=
Date: Fri, 20 Mar 2020 16:02:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200320150208.GA761915@kroah.com>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320141640.366360-2-hch@lst.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Mar 20, 2020 at 03:16:39PM +0100, Christoph Hellwig wrote:
> Several IOMMU drivers have a bypass mode where they can use a direct
> mapping if the devices DMA mask is large enough.  Add generic support
> to the core dma-mapping code to do that to switch those drivers to
> a common solution.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/device.h      |  6 ++++++
>  include/linux/dma-mapping.h | 30 ++++++++++++++++++------------
>  kernel/dma/mapping.c        | 36 +++++++++++++++++++++++++++---------
>  3 files changed, 51 insertions(+), 21 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
