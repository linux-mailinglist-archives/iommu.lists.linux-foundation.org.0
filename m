Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950D314C20
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 10:54:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE1F886200;
	Tue,  9 Feb 2021 08:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0GBakPzW5Jj; Tue,  9 Feb 2021 08:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D834861C8;
	Tue,  9 Feb 2021 08:47:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A7E3C1834;
	Tue,  9 Feb 2021 08:47:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4949C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 08:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A9A14871CA
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 08:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmdBWSyUwx2d for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 08:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3669787152
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 08:47:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52D3764E54;
 Tue,  9 Feb 2021 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612860421;
 bh=z/Bdck+IaHkIZeXXQMqQh3l+DYhl/FkuerjrS0Z4okU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6K3hXvBw+0tB/PGcQXYmKY9Plixk3xp/I/YfiCfq/M62b48W8fvfkfGWVS4AoJjV
 5izxtFjdYMfv9yCc8RXWG7CIZnR7mqx8EgENWn+GeVN57nP8pNzawAzDhhTjFSDq9w
 b0WuNObJ3egYYnClmK62iL21NscRORo99j5Ur0Ew=
Date: Tue, 9 Feb 2021 09:46:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: preserve DMA offsets when using swiotlb v2
Message-ID: <YCJMAxPi1HlVedfL@kroah.com>
References: <20210207160327.2955490-1-hch@lst.de>
 <20210209084156.GA32320@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209084156.GA32320@lst.de>
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, iommu@lists.linux-foundation.org,
 kbusch@kernel.org, robin.murphy@arm.com, jxgao@google.com
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

On Tue, Feb 09, 2021 at 09:41:56AM +0100, Christoph Hellwig wrote:
> Sorry for being a little pushy, any chance we could get this reviewed
> in time for the 5.12 merge window?

No objection from me, my ack is already on the patch that you need it
for :)

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
