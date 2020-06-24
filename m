Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 140412072AF
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 13:58:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBD8188706;
	Wed, 24 Jun 2020 11:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jbmY8X0qo4U; Wed, 24 Jun 2020 11:58:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85D97886FE;
	Wed, 24 Jun 2020 11:58:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66221C0894;
	Wed, 24 Jun 2020 11:58:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8916C016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ACBD22037B
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snYUzpN7z+Xj for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 11:58:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E22720369
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 11:58:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3B6802AF; Wed, 24 Jun 2020 13:58:29 +0200 (CEST)
Date: Wed, 24 Jun 2020 13:58:27 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] iommu: amd: Fix IO_PAGE_FAULT due to __unmap_single()
 size overflow
Message-ID: <20200624115827.GO3701@8bytes.org>
References: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
 <20200624090906.GC1731290@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624090906.GC1731290@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Greg,

On Wed, Jun 24, 2020 at 11:09:06AM +0200, Greg KH wrote:
> So what exact stable kernel version(s) do you want to see this patch
> applied to?

It is needed in kernels <= v5.4. Linux v5.5 has replaced the code with
the bug.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
