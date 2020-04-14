Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 566431A7B1D
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 14:47:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 111AD84DB8;
	Tue, 14 Apr 2020 12:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odFopbjADOSm; Tue, 14 Apr 2020 12:47:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87FFF849A6;
	Tue, 14 Apr 2020 12:47:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D91EC0172;
	Tue, 14 Apr 2020 12:47:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5814C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 85CBD857E6
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yroGzydY0I08 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 12:47:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D78D857C3
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:47:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5534B20768;
 Tue, 14 Apr 2020 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586868434;
 bh=rohU/pNk/NEJ3ruftZTeBtEweHiD6E5lSK9Jtcsrpb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6+UuRKXecdjX2i6han5AV7ZYNLnYqonKUbjMYx1Cco2W27c3jFXvhb4Tg6Wuuc5G
 78hZzGDZTBpycjsXM1fhdTYEzYCqnaQHx28KlebKxqDkIzeLT6vYx5j7MUhPKmYCQb
 39wELCBozn9OYUNvL/k4hAqFrInonJT7d2XNN8Tc=
Date: Tue, 14 Apr 2020 14:47:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200414124712.GA720223@kroah.com>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414122506.438134-4-hch@lst.de>
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

On Tue, Apr 14, 2020 at 02:25:05PM +0200, Christoph Hellwig wrote:
> Several IOMMU drivers have a bypass mode where they can use a direct
> mapping if the devices DMA mask is large enough.  Add generic support
> to the core dma-mapping code to do that to switch those drivers to
> a common solution.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/device.h |  6 ++++
>  kernel/dma/mapping.c   | 70 +++++++++++++++++++++++++++++-------------
>  2 files changed, 55 insertions(+), 21 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
