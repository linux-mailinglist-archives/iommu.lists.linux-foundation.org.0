Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E392743BE
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 16:00:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3F7FF2040E;
	Tue, 22 Sep 2020 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-mgO+JYpLoi; Tue, 22 Sep 2020 14:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DEC420534;
	Tue, 22 Sep 2020 14:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21A36C0859;
	Tue, 22 Sep 2020 14:00:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C0C5C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A2242050F
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRTvRn4cun9a for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 14:00:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 by silver.osuosl.org (Postfix) with ESMTPS id 73C5E20519
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 14:00:16 +0000 (UTC)
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 012F1200ED6;
 Tue, 22 Sep 2020 14:00:10 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 1C81D20D67; Tue, 22 Sep 2020 15:59:49 +0200 (CEST)
Date: Tue, 22 Sep 2020 15:59:49 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/3] dma-mapping: remove DMA_MASK_NONE
Message-ID: <20200922135949.GA43152@light.dominikbrodowski.net>
References: <20200922134002.1227279-1-hch@lst.de>
 <20200922134002.1227279-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922134002.1227279-2-hch@lst.de>
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 22, 2020 at 03:40:00PM +0200, Christoph Hellwig wrote:
> This value is only used by a PCMCIA driver and not very useful.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Dominik Brodowski <linux@dominikbrodwski.net>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
