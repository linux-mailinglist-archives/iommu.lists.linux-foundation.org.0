Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB3145A5B
	for <lists.iommu@lfdr.de>; Wed, 22 Jan 2020 17:56:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED95F81F72;
	Wed, 22 Jan 2020 16:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwD9dsijyxxA; Wed, 22 Jan 2020 16:56:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5BED486C34;
	Wed, 22 Jan 2020 16:56:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E877C1D81;
	Wed, 22 Jan 2020 16:56:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE3FC0174
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 16:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 40F18204FE
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 16:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id powZQ0tUNpa8 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 16:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2D3A620243
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 16:56:22 +0000 (UTC)
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B76B321569;
 Wed, 22 Jan 2020 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579712182;
 bh=g8BjkDQDC30b7DKasbB08kfebxsj4k8XiUA4G5pHC3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnUW1fE8OXhV0av6FW7Ow9kKcf4rGHzbm2nyMgYOAOoFNHDrocAndE7jh9EWr2pdq
 G7lAonmVT+Xcl2y6Xx3nAUPTtkzkTRAXR3Lo6T9y70nMvTXREebvRWAXVImSYLco9n
 sK9xUHar2FrV7OiW65Ci0MZrmrWTvjts6avXClt4=
Date: Thu, 23 Jan 2020 01:56:14 +0900
From: Keith Busch <kbusch@kernel.org>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v5 6/7] PCI: vmd: Stop overriding dma_map_ops
Message-ID: <20200122165614.GA6571@redsun51.ssa.fujisawa.hgst.com>
References: <1579613871-301529-1-git-send-email-jonathan.derrick@intel.com>
 <1579613871-301529-7-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579613871-301529-7-git-send-email-jonathan.derrick@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Jan 21, 2020 at 06:37:50AM -0700, Jon Derrick wrote:
> Devices on the VMD domain use the VMD endpoint's requester ID and have
> been relying on the VMD endpoint's DMA operations. The problem with this
> was that VMD domain devices would use the VMD endpoint's attributes when
> doing DMA and IOMMU mapping. We can be smarter about this by only using
> the VMD endpoint when mapping and providing the correct child device's
> attributes during DMA operations.
> 
> This patch removes the dma_map_ops redirect.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
