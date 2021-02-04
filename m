Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBE30FD28
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 20:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3932F8655C;
	Thu,  4 Feb 2021 19:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEX5xA9ecNbk; Thu,  4 Feb 2021 19:45:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C11F886549;
	Thu,  4 Feb 2021 19:45:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB229C1834;
	Thu,  4 Feb 2021 19:45:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D6D0C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1186286CD1
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZvN1aOSrUmU for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 19:45:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 893C386CC4
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78B5F60235;
 Thu,  4 Feb 2021 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612467900;
 bh=o/iwfEt4ELC7nj2C+dTWaP5pRUR4t6umd988LIvS00A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHRta2Y+8N1NkWgpBglcnviwIE4MFBS3tOXxhTBi+0J5dJPSnhyydSwJKVUmcC3R2
 6U6UGg2qyI6qeDnWnbfog2uXRd/djBoafXENY600B6hWAt3XblHSqSkIIpQm2roeq2
 L4uI0dUT0QpUu1zp0ZnJzVbl22PCT7yJUybcJC/o=
Date: Thu, 4 Feb 2021 20:44:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/8] driver core: add a min_align_mask field to struct
 device_dma_parameters
Message-ID: <YBxOuScfAXhdcuf/@kroah.com>
References: <20210204193035.2606838-1-hch@lst.de>
 <20210204193035.2606838-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204193035.2606838-2-hch@lst.de>
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org, jxgao@google.com, robin.murphy@arm.com
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

On Thu, Feb 04, 2021 at 08:30:28PM +0100, Christoph Hellwig wrote:
> From: Jianxiong Gao <jxgao@google.com>
> 
> Some devices rely on the address offset in a page to function
> correctly (NVMe driver as an example). These devices may use
> a different page size than the Linux kernel. The address offset
> has to be preserved upon mapping, and in order to do so, we
> need to record the page_offset_mask first.
> 
> Signed-off-by: Jianxiong Gao <jxgao@google.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/device.h      |  1 +
>  include/linux/dma-mapping.h | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
