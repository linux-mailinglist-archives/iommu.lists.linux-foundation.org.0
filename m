Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5626A6CA
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 16:07:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F6CB86F64;
	Tue, 15 Sep 2020 14:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmRN3Yv15a4a; Tue, 15 Sep 2020 14:07:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05EB886F66;
	Tue, 15 Sep 2020 14:07:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED0E8C0051;
	Tue, 15 Sep 2020 14:07:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ED70C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF09586F66
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYJMrfaWVmqn for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 14:07:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B021386F64
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:07:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C892268AFE; Tue, 15 Sep 2020 16:07:19 +0200 (CEST)
Date: Tue, 15 Sep 2020 16:07:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Tai <thomas.tai@oracle.com>
Subject: Re: [PATCH] dma-direct: Fix potential NULL pointer dereference
Message-ID: <20200915140719.GA14831@lst.de>
References: <1600178594-22801-1-git-send-email-thomas.tai@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600178594-22801-1-git-send-email-thomas.tai@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de
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

On Tue, Sep 15, 2020 at 08:03:14AM -0600, Thomas Tai wrote:
> When booting the kernel v5.9-rc4 on a VM, the kernel would panic when
> printing a warning message in swiotlb_map(). It is because dev->dma_mask
> can potentially be a null pointer. Using the dma_get_mask() macro can
> avoid the NULL pointer dereference.

dma_mask must not be zero.  This means drm is calling DMA API functions
on something weird.  This needs to be fixed in the caller.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
