Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F5206FBD
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 11:09:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05B0A88C50;
	Wed, 24 Jun 2020 09:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6e2DLLsax2qt; Wed, 24 Jun 2020 09:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A70B888BC3;
	Wed, 24 Jun 2020 09:09:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B48DC016F;
	Wed, 24 Jun 2020 09:09:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5764CC016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 09:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 464A020774
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 09:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQ73zxG4pF62 for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:09:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B55ED2076E
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 09:09:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AE84206FA;
 Wed, 24 Jun 2020 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592989747;
 bh=IjCfAeOJW9M1bFQ3YgPmBFFcD/3ncR488XRynpU/Ba0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUH7IMfcNXYRgTEqdBNYydpSQtiUDb/gJzTTc523i79M36CCj3RfXQGoMsTuoNO59
 wAGPrPMpugBmJF+z1RHjnNouxQE45Hw2L+tmqU4+yqIXGPz9fyA7IPjH9QbmhvgsGC
 p0kN5haH2LXwmpxQtSmhw2b19CwkAyPWxvA0b0KQ=
Date: Wed, 24 Jun 2020 11:09:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2] iommu: amd: Fix IO_PAGE_FAULT due to __unmap_single()
 size overflow
Message-ID: <20200624090906.GC1731290@kroah.com>
References: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
Cc: iommu@lists.linux-foundation.org, stable@vger.kernel.org
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

On Wed, Jun 24, 2020 at 08:41:21AM +0000, Suravee Suthikulpanit wrote:
> Currently, an integer is used to specify the size in unmap_sg().
> With 2GB worth of pages (512k 4k pages), it requires 31 bits
> (i.e. (1 << 19) << 12), which overflows the integer, and ends up
> unmapping more pages than intended. Subsequently, this results in
> IO_PAGE_FAULT.
> 
> Uses size_t instead of int to pass parameter to __unmap_single().
> 
> Please note that this patch is only for the stable-kernels tree
> because the commit be62dbf554c5 ("iommu/amd: Convert AMD iommu driver
> to the dma-iommu api"), which removes the function unmap_sg()
> was introduced in v5.5. This patch is not applicable in subsequent
> kernel versions.

So what exact stable kernel version(s) do you want to see this patch
applied to?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
